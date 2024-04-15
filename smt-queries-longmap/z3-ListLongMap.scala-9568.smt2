; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113270 () Bool)

(assert start!113270)

(declare-fun b_free!31321 () Bool)

(declare-fun b_next!31321 () Bool)

(assert (=> start!113270 (= b_free!31321 (not b_next!31321))))

(declare-fun tp!109768 () Bool)

(declare-fun b_and!50525 () Bool)

(assert (=> start!113270 (= tp!109768 b_and!50525)))

(declare-fun b!1343873 () Bool)

(declare-fun res!891660 () Bool)

(declare-fun e!764852 () Bool)

(assert (=> b!1343873 (=> (not res!891660) (not e!764852))))

(declare-datatypes ((array!91429 0))(
  ( (array!91430 (arr!44171 (Array (_ BitVec 32) (_ BitVec 64))) (size!44723 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91429)

(declare-datatypes ((List!31344 0))(
  ( (Nil!31341) (Cons!31340 (h!32549 (_ BitVec 64)) (t!45860 List!31344)) )
))
(declare-fun arrayNoDuplicates!0 (array!91429 (_ BitVec 32) List!31344) Bool)

(assert (=> b!1343873 (= res!891660 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31341))))

(declare-fun b!1343874 () Bool)

(declare-fun e!764854 () Bool)

(declare-fun tp_is_empty!37321 () Bool)

(assert (=> b!1343874 (= e!764854 tp_is_empty!37321)))

(declare-fun mapIsEmpty!57688 () Bool)

(declare-fun mapRes!57688 () Bool)

(assert (=> mapIsEmpty!57688 mapRes!57688))

(declare-fun b!1343875 () Bool)

(declare-fun e!764853 () Bool)

(declare-fun e!764851 () Bool)

(assert (=> b!1343875 (= e!764853 (and e!764851 mapRes!57688))))

(declare-fun condMapEmpty!57688 () Bool)

(declare-datatypes ((V!54865 0))(
  ( (V!54866 (val!18735 Int)) )
))
(declare-datatypes ((ValueCell!17762 0))(
  ( (ValueCellFull!17762 (v!21382 V!54865)) (EmptyCell!17762) )
))
(declare-datatypes ((array!91431 0))(
  ( (array!91432 (arr!44172 (Array (_ BitVec 32) ValueCell!17762)) (size!44724 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91431)

(declare-fun mapDefault!57688 () ValueCell!17762)

(assert (=> b!1343875 (= condMapEmpty!57688 (= (arr!44172 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17762)) mapDefault!57688)))))

(declare-fun b!1343876 () Bool)

(declare-fun res!891659 () Bool)

(assert (=> b!1343876 (=> (not res!891659) (not e!764852))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91429 (_ BitVec 32)) Bool)

(assert (=> b!1343876 (= res!891659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1343877 () Bool)

(declare-fun res!891661 () Bool)

(assert (=> b!1343877 (=> (not res!891661) (not e!764852))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1343877 (= res!891661 (and (= (size!44724 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44723 _keys!1571) (size!44724 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun res!891658 () Bool)

(assert (=> start!113270 (=> (not res!891658) (not e!764852))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113270 (= res!891658 (validMask!0 mask!1977))))

(assert (=> start!113270 e!764852))

(assert (=> start!113270 tp_is_empty!37321))

(assert (=> start!113270 true))

(declare-fun array_inv!33483 (array!91429) Bool)

(assert (=> start!113270 (array_inv!33483 _keys!1571)))

(declare-fun array_inv!33484 (array!91431) Bool)

(assert (=> start!113270 (and (array_inv!33484 _values!1303) e!764853)))

(assert (=> start!113270 tp!109768))

(declare-fun b!1343878 () Bool)

(assert (=> b!1343878 (= e!764851 tp_is_empty!37321)))

(declare-fun b!1343879 () Bool)

(declare-fun res!891657 () Bool)

(assert (=> b!1343879 (=> (not res!891657) (not e!764852))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1343879 (= res!891657 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44723 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!57688 () Bool)

(declare-fun tp!109769 () Bool)

(assert (=> mapNonEmpty!57688 (= mapRes!57688 (and tp!109769 e!764854))))

(declare-fun mapValue!57688 () ValueCell!17762)

(declare-fun mapKey!57688 () (_ BitVec 32))

(declare-fun mapRest!57688 () (Array (_ BitVec 32) ValueCell!17762))

(assert (=> mapNonEmpty!57688 (= (arr!44172 _values!1303) (store mapRest!57688 mapKey!57688 mapValue!57688))))

(declare-fun b!1343880 () Bool)

(assert (=> b!1343880 (= e!764852 false)))

(declare-fun minValue!1245 () V!54865)

(declare-fun lt!594945 () Bool)

(declare-fun zeroValue!1245 () V!54865)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24204 0))(
  ( (tuple2!24205 (_1!12113 (_ BitVec 64)) (_2!12113 V!54865)) )
))
(declare-datatypes ((List!31345 0))(
  ( (Nil!31342) (Cons!31341 (h!32550 tuple2!24204) (t!45861 List!31345)) )
))
(declare-datatypes ((ListLongMap!21861 0))(
  ( (ListLongMap!21862 (toList!10946 List!31345)) )
))
(declare-fun contains!9051 (ListLongMap!21861 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5792 (array!91429 array!91431 (_ BitVec 32) (_ BitVec 32) V!54865 V!54865 (_ BitVec 32) Int) ListLongMap!21861)

(assert (=> b!1343880 (= lt!594945 (contains!9051 (getCurrentListMap!5792 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(assert (= (and start!113270 res!891658) b!1343877))

(assert (= (and b!1343877 res!891661) b!1343876))

(assert (= (and b!1343876 res!891659) b!1343873))

(assert (= (and b!1343873 res!891660) b!1343879))

(assert (= (and b!1343879 res!891657) b!1343880))

(assert (= (and b!1343875 condMapEmpty!57688) mapIsEmpty!57688))

(assert (= (and b!1343875 (not condMapEmpty!57688)) mapNonEmpty!57688))

(get-info :version)

(assert (= (and mapNonEmpty!57688 ((_ is ValueCellFull!17762) mapValue!57688)) b!1343874))

(assert (= (and b!1343875 ((_ is ValueCellFull!17762) mapDefault!57688)) b!1343878))

(assert (= start!113270 b!1343875))

(declare-fun m!1231195 () Bool)

(assert (=> b!1343880 m!1231195))

(assert (=> b!1343880 m!1231195))

(declare-fun m!1231197 () Bool)

(assert (=> b!1343880 m!1231197))

(declare-fun m!1231199 () Bool)

(assert (=> mapNonEmpty!57688 m!1231199))

(declare-fun m!1231201 () Bool)

(assert (=> b!1343876 m!1231201))

(declare-fun m!1231203 () Bool)

(assert (=> b!1343873 m!1231203))

(declare-fun m!1231205 () Bool)

(assert (=> start!113270 m!1231205))

(declare-fun m!1231207 () Bool)

(assert (=> start!113270 m!1231207))

(declare-fun m!1231209 () Bool)

(assert (=> start!113270 m!1231209))

(check-sat (not start!113270) tp_is_empty!37321 b_and!50525 (not b!1343880) (not b!1343873) (not mapNonEmpty!57688) (not b_next!31321) (not b!1343876))
(check-sat b_and!50525 (not b_next!31321))
