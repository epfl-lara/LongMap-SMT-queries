; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113110 () Bool)

(assert start!113110)

(declare-fun b_free!31161 () Bool)

(declare-fun b_next!31161 () Bool)

(assert (=> start!113110 (= b_free!31161 (not b_next!31161))))

(declare-fun tp!109287 () Bool)

(declare-fun b_and!50229 () Bool)

(assert (=> start!113110 (= tp!109287 b_and!50229)))

(declare-fun mapNonEmpty!57448 () Bool)

(declare-fun mapRes!57448 () Bool)

(declare-fun tp!109288 () Bool)

(declare-fun e!763688 () Bool)

(assert (=> mapNonEmpty!57448 (= mapRes!57448 (and tp!109288 e!763688))))

(declare-datatypes ((V!54651 0))(
  ( (V!54652 (val!18655 Int)) )
))
(declare-datatypes ((ValueCell!17682 0))(
  ( (ValueCellFull!17682 (v!21303 V!54651)) (EmptyCell!17682) )
))
(declare-fun mapRest!57448 () (Array (_ BitVec 32) ValueCell!17682))

(declare-fun mapValue!57448 () ValueCell!17682)

(declare-fun mapKey!57448 () (_ BitVec 32))

(declare-datatypes ((array!91174 0))(
  ( (array!91175 (arr!44043 (Array (_ BitVec 32) ValueCell!17682)) (size!44593 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91174)

(assert (=> mapNonEmpty!57448 (= (arr!44043 _values!1303) (store mapRest!57448 mapKey!57448 mapValue!57448))))

(declare-fun b!1340953 () Bool)

(declare-fun res!889578 () Bool)

(declare-fun e!763685 () Bool)

(assert (=> b!1340953 (=> (not res!889578) (not e!763685))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!91176 0))(
  ( (array!91177 (arr!44044 (Array (_ BitVec 32) (_ BitVec 64))) (size!44594 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91176)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1340953 (= res!889578 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44594 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1340954 () Bool)

(declare-fun res!889577 () Bool)

(assert (=> b!1340954 (=> (not res!889577) (not e!763685))))

(declare-fun minValue!1245 () V!54651)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun zeroValue!1245 () V!54651)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24018 0))(
  ( (tuple2!24019 (_1!12020 (_ BitVec 64)) (_2!12020 V!54651)) )
))
(declare-datatypes ((List!31180 0))(
  ( (Nil!31177) (Cons!31176 (h!32385 tuple2!24018) (t!45552 List!31180)) )
))
(declare-datatypes ((ListLongMap!21675 0))(
  ( (ListLongMap!21676 (toList!10853 List!31180)) )
))
(declare-fun contains!9029 (ListLongMap!21675 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5819 (array!91176 array!91174 (_ BitVec 32) (_ BitVec 32) V!54651 V!54651 (_ BitVec 32) Int) ListLongMap!21675)

(assert (=> b!1340954 (= res!889577 (contains!9029 (getCurrentListMap!5819 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun res!889576 () Bool)

(assert (=> start!113110 (=> (not res!889576) (not e!763685))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113110 (= res!889576 (validMask!0 mask!1977))))

(assert (=> start!113110 e!763685))

(declare-fun tp_is_empty!37161 () Bool)

(assert (=> start!113110 tp_is_empty!37161))

(assert (=> start!113110 true))

(declare-fun array_inv!33205 (array!91176) Bool)

(assert (=> start!113110 (array_inv!33205 _keys!1571)))

(declare-fun e!763684 () Bool)

(declare-fun array_inv!33206 (array!91174) Bool)

(assert (=> start!113110 (and (array_inv!33206 _values!1303) e!763684)))

(assert (=> start!113110 tp!109287))

(declare-fun b!1340955 () Bool)

(declare-fun res!889573 () Bool)

(assert (=> b!1340955 (=> (not res!889573) (not e!763685))))

(assert (=> b!1340955 (= res!889573 (and (= (size!44593 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44594 _keys!1571) (size!44593 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1340956 () Bool)

(assert (=> b!1340956 (= e!763685 (not true))))

(declare-fun lt!594069 () ListLongMap!21675)

(assert (=> b!1340956 (contains!9029 lt!594069 k0!1142)))

(declare-datatypes ((Unit!44011 0))(
  ( (Unit!44012) )
))
(declare-fun lt!594068 () Unit!44011)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!336 ((_ BitVec 64) (_ BitVec 64) V!54651 ListLongMap!21675) Unit!44011)

(assert (=> b!1340956 (= lt!594068 (lemmaInListMapAfterAddingDiffThenInBefore!336 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594069))))

(declare-fun +!4767 (ListLongMap!21675 tuple2!24018) ListLongMap!21675)

(declare-fun getCurrentListMapNoExtraKeys!6409 (array!91176 array!91174 (_ BitVec 32) (_ BitVec 32) V!54651 V!54651 (_ BitVec 32) Int) ListLongMap!21675)

(declare-fun get!22226 (ValueCell!17682 V!54651) V!54651)

(declare-fun dynLambda!3706 (Int (_ BitVec 64)) V!54651)

(assert (=> b!1340956 (= lt!594069 (+!4767 (getCurrentListMapNoExtraKeys!6409 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24019 (select (arr!44044 _keys!1571) from!1960) (get!22226 (select (arr!44043 _values!1303) from!1960) (dynLambda!3706 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1340957 () Bool)

(declare-fun res!889570 () Bool)

(assert (=> b!1340957 (=> (not res!889570) (not e!763685))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91176 (_ BitVec 32)) Bool)

(assert (=> b!1340957 (= res!889570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1340958 () Bool)

(declare-fun res!889572 () Bool)

(assert (=> b!1340958 (=> (not res!889572) (not e!763685))))

(declare-datatypes ((List!31181 0))(
  ( (Nil!31178) (Cons!31177 (h!32386 (_ BitVec 64)) (t!45553 List!31181)) )
))
(declare-fun arrayNoDuplicates!0 (array!91176 (_ BitVec 32) List!31181) Bool)

(assert (=> b!1340958 (= res!889572 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31178))))

(declare-fun mapIsEmpty!57448 () Bool)

(assert (=> mapIsEmpty!57448 mapRes!57448))

(declare-fun b!1340959 () Bool)

(declare-fun e!763686 () Bool)

(assert (=> b!1340959 (= e!763686 tp_is_empty!37161)))

(declare-fun b!1340960 () Bool)

(assert (=> b!1340960 (= e!763684 (and e!763686 mapRes!57448))))

(declare-fun condMapEmpty!57448 () Bool)

(declare-fun mapDefault!57448 () ValueCell!17682)

(assert (=> b!1340960 (= condMapEmpty!57448 (= (arr!44043 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17682)) mapDefault!57448)))))

(declare-fun b!1340961 () Bool)

(assert (=> b!1340961 (= e!763688 tp_is_empty!37161)))

(declare-fun b!1340962 () Bool)

(declare-fun res!889574 () Bool)

(assert (=> b!1340962 (=> (not res!889574) (not e!763685))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1340962 (= res!889574 (validKeyInArray!0 (select (arr!44044 _keys!1571) from!1960)))))

(declare-fun b!1340963 () Bool)

(declare-fun res!889575 () Bool)

(assert (=> b!1340963 (=> (not res!889575) (not e!763685))))

(assert (=> b!1340963 (= res!889575 (not (= (select (arr!44044 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1340964 () Bool)

(declare-fun res!889571 () Bool)

(assert (=> b!1340964 (=> (not res!889571) (not e!763685))))

(assert (=> b!1340964 (= res!889571 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!113110 res!889576) b!1340955))

(assert (= (and b!1340955 res!889573) b!1340957))

(assert (= (and b!1340957 res!889570) b!1340958))

(assert (= (and b!1340958 res!889572) b!1340953))

(assert (= (and b!1340953 res!889578) b!1340954))

(assert (= (and b!1340954 res!889577) b!1340963))

(assert (= (and b!1340963 res!889575) b!1340962))

(assert (= (and b!1340962 res!889574) b!1340964))

(assert (= (and b!1340964 res!889571) b!1340956))

(assert (= (and b!1340960 condMapEmpty!57448) mapIsEmpty!57448))

(assert (= (and b!1340960 (not condMapEmpty!57448)) mapNonEmpty!57448))

(get-info :version)

(assert (= (and mapNonEmpty!57448 ((_ is ValueCellFull!17682) mapValue!57448)) b!1340961))

(assert (= (and b!1340960 ((_ is ValueCellFull!17682) mapDefault!57448)) b!1340959))

(assert (= start!113110 b!1340960))

(declare-fun b_lambda!24337 () Bool)

(assert (=> (not b_lambda!24337) (not b!1340956)))

(declare-fun t!45551 () Bool)

(declare-fun tb!12175 () Bool)

(assert (=> (and start!113110 (= defaultEntry!1306 defaultEntry!1306) t!45551) tb!12175))

(declare-fun result!25441 () Bool)

(assert (=> tb!12175 (= result!25441 tp_is_empty!37161)))

(assert (=> b!1340956 t!45551))

(declare-fun b_and!50231 () Bool)

(assert (= b_and!50229 (and (=> t!45551 result!25441) b_and!50231)))

(declare-fun m!1228655 () Bool)

(assert (=> b!1340962 m!1228655))

(assert (=> b!1340962 m!1228655))

(declare-fun m!1228657 () Bool)

(assert (=> b!1340962 m!1228657))

(declare-fun m!1228659 () Bool)

(assert (=> start!113110 m!1228659))

(declare-fun m!1228661 () Bool)

(assert (=> start!113110 m!1228661))

(declare-fun m!1228663 () Bool)

(assert (=> start!113110 m!1228663))

(declare-fun m!1228665 () Bool)

(assert (=> b!1340956 m!1228665))

(declare-fun m!1228667 () Bool)

(assert (=> b!1340956 m!1228667))

(declare-fun m!1228669 () Bool)

(assert (=> b!1340956 m!1228669))

(declare-fun m!1228671 () Bool)

(assert (=> b!1340956 m!1228671))

(assert (=> b!1340956 m!1228665))

(declare-fun m!1228673 () Bool)

(assert (=> b!1340956 m!1228673))

(assert (=> b!1340956 m!1228667))

(declare-fun m!1228675 () Bool)

(assert (=> b!1340956 m!1228675))

(assert (=> b!1340956 m!1228669))

(declare-fun m!1228677 () Bool)

(assert (=> b!1340956 m!1228677))

(assert (=> b!1340956 m!1228655))

(declare-fun m!1228679 () Bool)

(assert (=> b!1340954 m!1228679))

(assert (=> b!1340954 m!1228679))

(declare-fun m!1228681 () Bool)

(assert (=> b!1340954 m!1228681))

(assert (=> b!1340963 m!1228655))

(declare-fun m!1228683 () Bool)

(assert (=> b!1340957 m!1228683))

(declare-fun m!1228685 () Bool)

(assert (=> b!1340958 m!1228685))

(declare-fun m!1228687 () Bool)

(assert (=> mapNonEmpty!57448 m!1228687))

(check-sat (not b!1340956) (not b!1340962) (not start!113110) (not b_lambda!24337) tp_is_empty!37161 (not b!1340958) (not mapNonEmpty!57448) b_and!50231 (not b!1340954) (not b_next!31161) (not b!1340957))
(check-sat b_and!50231 (not b_next!31161))
