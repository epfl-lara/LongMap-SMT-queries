; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113308 () Bool)

(assert start!113308)

(declare-fun b_free!31135 () Bool)

(declare-fun b_next!31135 () Bool)

(assert (=> start!113308 (= b_free!31135 (not b_next!31135))))

(declare-fun tp!109210 () Bool)

(declare-fun b_and!50179 () Bool)

(assert (=> start!113308 (= tp!109210 b_and!50179)))

(declare-fun b!1341758 () Bool)

(declare-fun res!889745 () Bool)

(declare-fun e!764332 () Bool)

(assert (=> b!1341758 (=> (not res!889745) (not e!764332))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!91243 0))(
  ( (array!91244 (arr!44073 (Array (_ BitVec 32) (_ BitVec 64))) (size!44624 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91243)

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1341758 (= res!889745 (not (= (select (arr!44073 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1341759 () Bool)

(declare-fun e!764335 () Bool)

(declare-fun tp_is_empty!37135 () Bool)

(assert (=> b!1341759 (= e!764335 tp_is_empty!37135)))

(declare-fun b!1341760 () Bool)

(declare-fun res!889741 () Bool)

(assert (=> b!1341760 (=> (not res!889741) (not e!764332))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1341760 (= res!889741 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1341761 () Bool)

(declare-fun res!889740 () Bool)

(assert (=> b!1341761 (=> (not res!889740) (not e!764332))))

(declare-datatypes ((V!54617 0))(
  ( (V!54618 (val!18642 Int)) )
))
(declare-fun minValue!1245 () V!54617)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun zeroValue!1245 () V!54617)

(declare-datatypes ((ValueCell!17669 0))(
  ( (ValueCellFull!17669 (v!21285 V!54617)) (EmptyCell!17669) )
))
(declare-datatypes ((array!91245 0))(
  ( (array!91246 (arr!44074 (Array (_ BitVec 32) ValueCell!17669)) (size!44625 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91245)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24050 0))(
  ( (tuple2!24051 (_1!12036 (_ BitVec 64)) (_2!12036 V!54617)) )
))
(declare-datatypes ((List!31209 0))(
  ( (Nil!31206) (Cons!31205 (h!32423 tuple2!24050) (t!45547 List!31209)) )
))
(declare-datatypes ((ListLongMap!21715 0))(
  ( (ListLongMap!21716 (toList!10873 List!31209)) )
))
(declare-fun contains!9061 (ListLongMap!21715 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5826 (array!91243 array!91245 (_ BitVec 32) (_ BitVec 32) V!54617 V!54617 (_ BitVec 32) Int) ListLongMap!21715)

(assert (=> b!1341761 (= res!889740 (contains!9061 (getCurrentListMap!5826 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1341763 () Bool)

(declare-fun res!889738 () Bool)

(assert (=> b!1341763 (=> (not res!889738) (not e!764332))))

(assert (=> b!1341763 (= res!889738 (and (= (size!44625 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44624 _keys!1571) (size!44625 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1341764 () Bool)

(declare-fun e!764336 () Bool)

(assert (=> b!1341764 (= e!764336 tp_is_empty!37135)))

(declare-fun b!1341765 () Bool)

(declare-fun res!889744 () Bool)

(assert (=> b!1341765 (=> (not res!889744) (not e!764332))))

(declare-datatypes ((List!31210 0))(
  ( (Nil!31207) (Cons!31206 (h!32424 (_ BitVec 64)) (t!45548 List!31210)) )
))
(declare-fun arrayNoDuplicates!0 (array!91243 (_ BitVec 32) List!31210) Bool)

(assert (=> b!1341765 (= res!889744 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31207))))

(declare-fun b!1341766 () Bool)

(assert (=> b!1341766 (= e!764332 (not true))))

(declare-fun lt!594466 () ListLongMap!21715)

(assert (=> b!1341766 (contains!9061 lt!594466 k0!1142)))

(declare-datatypes ((Unit!43928 0))(
  ( (Unit!43929) )
))
(declare-fun lt!594467 () Unit!43928)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!320 ((_ BitVec 64) (_ BitVec 64) V!54617 ListLongMap!21715) Unit!43928)

(assert (=> b!1341766 (= lt!594467 (lemmaInListMapAfterAddingDiffThenInBefore!320 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594466))))

(declare-fun +!4794 (ListLongMap!21715 tuple2!24050) ListLongMap!21715)

(declare-fun getCurrentListMapNoExtraKeys!6443 (array!91243 array!91245 (_ BitVec 32) (_ BitVec 32) V!54617 V!54617 (_ BitVec 32) Int) ListLongMap!21715)

(declare-fun get!22248 (ValueCell!17669 V!54617) V!54617)

(declare-fun dynLambda!3748 (Int (_ BitVec 64)) V!54617)

(assert (=> b!1341766 (= lt!594466 (+!4794 (getCurrentListMapNoExtraKeys!6443 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24051 (select (arr!44073 _keys!1571) from!1960) (get!22248 (select (arr!44074 _values!1303) from!1960) (dynLambda!3748 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapNonEmpty!57409 () Bool)

(declare-fun mapRes!57409 () Bool)

(declare-fun tp!109209 () Bool)

(assert (=> mapNonEmpty!57409 (= mapRes!57409 (and tp!109209 e!764336))))

(declare-fun mapKey!57409 () (_ BitVec 32))

(declare-fun mapValue!57409 () ValueCell!17669)

(declare-fun mapRest!57409 () (Array (_ BitVec 32) ValueCell!17669))

(assert (=> mapNonEmpty!57409 (= (arr!44074 _values!1303) (store mapRest!57409 mapKey!57409 mapValue!57409))))

(declare-fun b!1341767 () Bool)

(declare-fun res!889742 () Bool)

(assert (=> b!1341767 (=> (not res!889742) (not e!764332))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91243 (_ BitVec 32)) Bool)

(assert (=> b!1341767 (= res!889742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapIsEmpty!57409 () Bool)

(assert (=> mapIsEmpty!57409 mapRes!57409))

(declare-fun res!889739 () Bool)

(assert (=> start!113308 (=> (not res!889739) (not e!764332))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113308 (= res!889739 (validMask!0 mask!1977))))

(assert (=> start!113308 e!764332))

(assert (=> start!113308 tp_is_empty!37135))

(assert (=> start!113308 true))

(declare-fun array_inv!33493 (array!91243) Bool)

(assert (=> start!113308 (array_inv!33493 _keys!1571)))

(declare-fun e!764333 () Bool)

(declare-fun array_inv!33494 (array!91245) Bool)

(assert (=> start!113308 (and (array_inv!33494 _values!1303) e!764333)))

(assert (=> start!113308 tp!109210))

(declare-fun b!1341762 () Bool)

(assert (=> b!1341762 (= e!764333 (and e!764335 mapRes!57409))))

(declare-fun condMapEmpty!57409 () Bool)

(declare-fun mapDefault!57409 () ValueCell!17669)

(assert (=> b!1341762 (= condMapEmpty!57409 (= (arr!44074 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17669)) mapDefault!57409)))))

(declare-fun b!1341768 () Bool)

(declare-fun res!889743 () Bool)

(assert (=> b!1341768 (=> (not res!889743) (not e!764332))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1341768 (= res!889743 (validKeyInArray!0 (select (arr!44073 _keys!1571) from!1960)))))

(declare-fun b!1341769 () Bool)

(declare-fun res!889737 () Bool)

(assert (=> b!1341769 (=> (not res!889737) (not e!764332))))

(assert (=> b!1341769 (= res!889737 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44624 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!113308 res!889739) b!1341763))

(assert (= (and b!1341763 res!889738) b!1341767))

(assert (= (and b!1341767 res!889742) b!1341765))

(assert (= (and b!1341765 res!889744) b!1341769))

(assert (= (and b!1341769 res!889737) b!1341761))

(assert (= (and b!1341761 res!889740) b!1341758))

(assert (= (and b!1341758 res!889745) b!1341768))

(assert (= (and b!1341768 res!889743) b!1341760))

(assert (= (and b!1341760 res!889741) b!1341766))

(assert (= (and b!1341762 condMapEmpty!57409) mapIsEmpty!57409))

(assert (= (and b!1341762 (not condMapEmpty!57409)) mapNonEmpty!57409))

(get-info :version)

(assert (= (and mapNonEmpty!57409 ((_ is ValueCellFull!17669) mapValue!57409)) b!1341764))

(assert (= (and b!1341762 ((_ is ValueCellFull!17669) mapDefault!57409)) b!1341759))

(assert (= start!113308 b!1341762))

(declare-fun b_lambda!24305 () Bool)

(assert (=> (not b_lambda!24305) (not b!1341766)))

(declare-fun t!45546 () Bool)

(declare-fun tb!12141 () Bool)

(assert (=> (and start!113308 (= defaultEntry!1306 defaultEntry!1306) t!45546) tb!12141))

(declare-fun result!25381 () Bool)

(assert (=> tb!12141 (= result!25381 tp_is_empty!37135)))

(assert (=> b!1341766 t!45546))

(declare-fun b_and!50181 () Bool)

(assert (= b_and!50179 (and (=> t!45546 result!25381) b_and!50181)))

(declare-fun m!1229811 () Bool)

(assert (=> mapNonEmpty!57409 m!1229811))

(declare-fun m!1229813 () Bool)

(assert (=> b!1341765 m!1229813))

(declare-fun m!1229815 () Bool)

(assert (=> b!1341761 m!1229815))

(assert (=> b!1341761 m!1229815))

(declare-fun m!1229817 () Bool)

(assert (=> b!1341761 m!1229817))

(declare-fun m!1229819 () Bool)

(assert (=> b!1341768 m!1229819))

(assert (=> b!1341768 m!1229819))

(declare-fun m!1229821 () Bool)

(assert (=> b!1341768 m!1229821))

(declare-fun m!1229823 () Bool)

(assert (=> start!113308 m!1229823))

(declare-fun m!1229825 () Bool)

(assert (=> start!113308 m!1229825))

(declare-fun m!1229827 () Bool)

(assert (=> start!113308 m!1229827))

(declare-fun m!1229829 () Bool)

(assert (=> b!1341767 m!1229829))

(declare-fun m!1229831 () Bool)

(assert (=> b!1341766 m!1229831))

(declare-fun m!1229833 () Bool)

(assert (=> b!1341766 m!1229833))

(declare-fun m!1229835 () Bool)

(assert (=> b!1341766 m!1229835))

(declare-fun m!1229837 () Bool)

(assert (=> b!1341766 m!1229837))

(assert (=> b!1341766 m!1229831))

(declare-fun m!1229839 () Bool)

(assert (=> b!1341766 m!1229839))

(assert (=> b!1341766 m!1229833))

(declare-fun m!1229841 () Bool)

(assert (=> b!1341766 m!1229841))

(assert (=> b!1341766 m!1229835))

(declare-fun m!1229843 () Bool)

(assert (=> b!1341766 m!1229843))

(assert (=> b!1341766 m!1229819))

(assert (=> b!1341758 m!1229819))

(check-sat (not b!1341765) (not b_next!31135) tp_is_empty!37135 (not b!1341761) (not b_lambda!24305) b_and!50181 (not b!1341767) (not b!1341768) (not start!113308) (not mapNonEmpty!57409) (not b!1341766))
(check-sat b_and!50181 (not b_next!31135))
