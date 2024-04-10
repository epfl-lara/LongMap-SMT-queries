; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113044 () Bool)

(assert start!113044)

(declare-fun b_free!31095 () Bool)

(declare-fun b_next!31095 () Bool)

(assert (=> start!113044 (= b_free!31095 (not b_next!31095))))

(declare-fun tp!109090 () Bool)

(declare-fun b_and!50125 () Bool)

(assert (=> start!113044 (= tp!109090 b_and!50125)))

(declare-fun res!888816 () Bool)

(declare-fun e!763189 () Bool)

(assert (=> start!113044 (=> (not res!888816) (not e!763189))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113044 (= res!888816 (validMask!0 mask!1977))))

(assert (=> start!113044 e!763189))

(declare-fun tp_is_empty!37095 () Bool)

(assert (=> start!113044 tp_is_empty!37095))

(assert (=> start!113044 true))

(declare-datatypes ((array!91044 0))(
  ( (array!91045 (arr!43978 (Array (_ BitVec 32) (_ BitVec 64))) (size!44528 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91044)

(declare-fun array_inv!33163 (array!91044) Bool)

(assert (=> start!113044 (array_inv!33163 _keys!1571)))

(declare-datatypes ((V!54563 0))(
  ( (V!54564 (val!18622 Int)) )
))
(declare-datatypes ((ValueCell!17649 0))(
  ( (ValueCellFull!17649 (v!21270 V!54563)) (EmptyCell!17649) )
))
(declare-datatypes ((array!91046 0))(
  ( (array!91047 (arr!43979 (Array (_ BitVec 32) ValueCell!17649)) (size!44529 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91046)

(declare-fun e!763191 () Bool)

(declare-fun array_inv!33164 (array!91046) Bool)

(assert (=> start!113044 (and (array_inv!33164 _values!1303) e!763191)))

(assert (=> start!113044 tp!109090))

(declare-fun b!1339860 () Bool)

(declare-fun res!888815 () Bool)

(assert (=> b!1339860 (=> (not res!888815) (not e!763189))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1339860 (= res!888815 (and (= (size!44529 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44528 _keys!1571) (size!44529 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1339861 () Bool)

(assert (=> b!1339861 (= e!763189 false)))

(declare-fun minValue!1245 () V!54563)

(declare-fun zeroValue!1245 () V!54563)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun lt!593937 () Bool)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!23964 0))(
  ( (tuple2!23965 (_1!11993 (_ BitVec 64)) (_2!11993 V!54563)) )
))
(declare-datatypes ((List!31131 0))(
  ( (Nil!31128) (Cons!31127 (h!32336 tuple2!23964) (t!45463 List!31131)) )
))
(declare-datatypes ((ListLongMap!21621 0))(
  ( (ListLongMap!21622 (toList!10826 List!31131)) )
))
(declare-fun contains!9002 (ListLongMap!21621 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5795 (array!91044 array!91046 (_ BitVec 32) (_ BitVec 32) V!54563 V!54563 (_ BitVec 32) Int) ListLongMap!21621)

(assert (=> b!1339861 (= lt!593937 (contains!9002 (getCurrentListMap!5795 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun mapNonEmpty!57349 () Bool)

(declare-fun mapRes!57349 () Bool)

(declare-fun tp!109089 () Bool)

(declare-fun e!763193 () Bool)

(assert (=> mapNonEmpty!57349 (= mapRes!57349 (and tp!109089 e!763193))))

(declare-fun mapKey!57349 () (_ BitVec 32))

(declare-fun mapRest!57349 () (Array (_ BitVec 32) ValueCell!17649))

(declare-fun mapValue!57349 () ValueCell!17649)

(assert (=> mapNonEmpty!57349 (= (arr!43979 _values!1303) (store mapRest!57349 mapKey!57349 mapValue!57349))))

(declare-fun b!1339862 () Bool)

(declare-fun e!763190 () Bool)

(assert (=> b!1339862 (= e!763191 (and e!763190 mapRes!57349))))

(declare-fun condMapEmpty!57349 () Bool)

(declare-fun mapDefault!57349 () ValueCell!17649)

(assert (=> b!1339862 (= condMapEmpty!57349 (= (arr!43979 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17649)) mapDefault!57349)))))

(declare-fun b!1339863 () Bool)

(declare-fun res!888812 () Bool)

(assert (=> b!1339863 (=> (not res!888812) (not e!763189))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91044 (_ BitVec 32)) Bool)

(assert (=> b!1339863 (= res!888812 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1339864 () Bool)

(assert (=> b!1339864 (= e!763190 tp_is_empty!37095)))

(declare-fun b!1339865 () Bool)

(assert (=> b!1339865 (= e!763193 tp_is_empty!37095)))

(declare-fun b!1339866 () Bool)

(declare-fun res!888814 () Bool)

(assert (=> b!1339866 (=> (not res!888814) (not e!763189))))

(declare-datatypes ((List!31132 0))(
  ( (Nil!31129) (Cons!31128 (h!32337 (_ BitVec 64)) (t!45464 List!31132)) )
))
(declare-fun arrayNoDuplicates!0 (array!91044 (_ BitVec 32) List!31132) Bool)

(assert (=> b!1339866 (= res!888814 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31129))))

(declare-fun mapIsEmpty!57349 () Bool)

(assert (=> mapIsEmpty!57349 mapRes!57349))

(declare-fun b!1339867 () Bool)

(declare-fun res!888813 () Bool)

(assert (=> b!1339867 (=> (not res!888813) (not e!763189))))

(assert (=> b!1339867 (= res!888813 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44528 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!113044 res!888816) b!1339860))

(assert (= (and b!1339860 res!888815) b!1339863))

(assert (= (and b!1339863 res!888812) b!1339866))

(assert (= (and b!1339866 res!888814) b!1339867))

(assert (= (and b!1339867 res!888813) b!1339861))

(assert (= (and b!1339862 condMapEmpty!57349) mapIsEmpty!57349))

(assert (= (and b!1339862 (not condMapEmpty!57349)) mapNonEmpty!57349))

(get-info :version)

(assert (= (and mapNonEmpty!57349 ((_ is ValueCellFull!17649) mapValue!57349)) b!1339865))

(assert (= (and b!1339862 ((_ is ValueCellFull!17649) mapDefault!57349)) b!1339864))

(assert (= start!113044 b!1339862))

(declare-fun m!1227773 () Bool)

(assert (=> mapNonEmpty!57349 m!1227773))

(declare-fun m!1227775 () Bool)

(assert (=> b!1339861 m!1227775))

(assert (=> b!1339861 m!1227775))

(declare-fun m!1227777 () Bool)

(assert (=> b!1339861 m!1227777))

(declare-fun m!1227779 () Bool)

(assert (=> b!1339866 m!1227779))

(declare-fun m!1227781 () Bool)

(assert (=> b!1339863 m!1227781))

(declare-fun m!1227783 () Bool)

(assert (=> start!113044 m!1227783))

(declare-fun m!1227785 () Bool)

(assert (=> start!113044 m!1227785))

(declare-fun m!1227787 () Bool)

(assert (=> start!113044 m!1227787))

(check-sat (not mapNonEmpty!57349) (not b!1339863) (not b!1339866) (not b!1339861) (not start!113044) (not b_next!31095) b_and!50125 tp_is_empty!37095)
(check-sat b_and!50125 (not b_next!31095))
