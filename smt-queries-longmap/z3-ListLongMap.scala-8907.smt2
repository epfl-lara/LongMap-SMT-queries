; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108094 () Bool)

(assert start!108094)

(declare-fun b_free!27807 () Bool)

(declare-fun b_next!27807 () Bool)

(assert (=> start!108094 (= b_free!27807 (not b_next!27807))))

(declare-fun tp!98375 () Bool)

(declare-fun b_and!45863 () Bool)

(assert (=> start!108094 (= tp!98375 b_and!45863)))

(declare-fun b!1276544 () Bool)

(declare-fun e!728960 () Bool)

(declare-fun e!728957 () Bool)

(declare-fun mapRes!51566 () Bool)

(assert (=> b!1276544 (= e!728960 (and e!728957 mapRes!51566))))

(declare-fun condMapEmpty!51566 () Bool)

(declare-datatypes ((V!49579 0))(
  ( (V!49580 (val!16753 Int)) )
))
(declare-datatypes ((ValueCell!15780 0))(
  ( (ValueCellFull!15780 (v!19350 V!49579)) (EmptyCell!15780) )
))
(declare-datatypes ((array!83808 0))(
  ( (array!83809 (arr!40415 (Array (_ BitVec 32) ValueCell!15780)) (size!40965 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83808)

(declare-fun mapDefault!51566 () ValueCell!15780)

(assert (=> b!1276544 (= condMapEmpty!51566 (= (arr!40415 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15780)) mapDefault!51566)))))

(declare-fun b!1276545 () Bool)

(declare-fun res!848346 () Bool)

(declare-fun e!728959 () Bool)

(assert (=> b!1276545 (=> (not res!848346) (not e!728959))))

(declare-datatypes ((array!83810 0))(
  ( (array!83811 (arr!40416 (Array (_ BitVec 32) (_ BitVec 64))) (size!40966 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83810)

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83810 (_ BitVec 32)) Bool)

(assert (=> b!1276545 (= res!848346 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1276546 () Bool)

(declare-fun e!728961 () Bool)

(declare-fun tp_is_empty!33357 () Bool)

(assert (=> b!1276546 (= e!728961 tp_is_empty!33357)))

(declare-fun b!1276547 () Bool)

(declare-fun res!848344 () Bool)

(assert (=> b!1276547 (=> (not res!848344) (not e!728959))))

(declare-datatypes ((List!28662 0))(
  ( (Nil!28659) (Cons!28658 (h!29867 (_ BitVec 64)) (t!42198 List!28662)) )
))
(declare-fun arrayNoDuplicates!0 (array!83810 (_ BitVec 32) List!28662) Bool)

(assert (=> b!1276547 (= res!848344 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28659))))

(declare-fun b!1276548 () Bool)

(declare-fun res!848343 () Bool)

(assert (=> b!1276548 (=> (not res!848343) (not e!728959))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1276548 (= res!848343 (and (= (size!40965 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40966 _keys!1427) (size!40965 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1276549 () Bool)

(assert (=> b!1276549 (= e!728957 tp_is_empty!33357)))

(declare-fun mapIsEmpty!51566 () Bool)

(assert (=> mapIsEmpty!51566 mapRes!51566))

(declare-fun res!848345 () Bool)

(assert (=> start!108094 (=> (not res!848345) (not e!728959))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108094 (= res!848345 (validMask!0 mask!1805))))

(assert (=> start!108094 e!728959))

(assert (=> start!108094 true))

(assert (=> start!108094 tp!98375))

(assert (=> start!108094 tp_is_empty!33357))

(declare-fun array_inv!30715 (array!83808) Bool)

(assert (=> start!108094 (and (array_inv!30715 _values!1187) e!728960)))

(declare-fun array_inv!30716 (array!83810) Bool)

(assert (=> start!108094 (array_inv!30716 _keys!1427)))

(declare-fun mapNonEmpty!51566 () Bool)

(declare-fun tp!98374 () Bool)

(assert (=> mapNonEmpty!51566 (= mapRes!51566 (and tp!98374 e!728961))))

(declare-fun mapValue!51566 () ValueCell!15780)

(declare-fun mapKey!51566 () (_ BitVec 32))

(declare-fun mapRest!51566 () (Array (_ BitVec 32) ValueCell!15780))

(assert (=> mapNonEmpty!51566 (= (arr!40415 _values!1187) (store mapRest!51566 mapKey!51566 mapValue!51566))))

(declare-fun b!1276550 () Bool)

(assert (=> b!1276550 (= e!728959 false)))

(declare-fun defaultEntry!1195 () Int)

(declare-fun lt!575503 () Bool)

(declare-fun minValue!1129 () V!49579)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun zeroValue!1129 () V!49579)

(declare-datatypes ((tuple2!21488 0))(
  ( (tuple2!21489 (_1!10755 (_ BitVec 64)) (_2!10755 V!49579)) )
))
(declare-datatypes ((List!28663 0))(
  ( (Nil!28660) (Cons!28659 (h!29868 tuple2!21488) (t!42199 List!28663)) )
))
(declare-datatypes ((ListLongMap!19145 0))(
  ( (ListLongMap!19146 (toList!9588 List!28663)) )
))
(declare-fun contains!7697 (ListLongMap!19145 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4672 (array!83810 array!83808 (_ BitVec 32) (_ BitVec 32) V!49579 V!49579 (_ BitVec 32) Int) ListLongMap!19145)

(assert (=> b!1276550 (= lt!575503 (contains!7697 (getCurrentListMap!4672 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(assert (= (and start!108094 res!848345) b!1276548))

(assert (= (and b!1276548 res!848343) b!1276545))

(assert (= (and b!1276545 res!848346) b!1276547))

(assert (= (and b!1276547 res!848344) b!1276550))

(assert (= (and b!1276544 condMapEmpty!51566) mapIsEmpty!51566))

(assert (= (and b!1276544 (not condMapEmpty!51566)) mapNonEmpty!51566))

(get-info :version)

(assert (= (and mapNonEmpty!51566 ((_ is ValueCellFull!15780) mapValue!51566)) b!1276546))

(assert (= (and b!1276544 ((_ is ValueCellFull!15780) mapDefault!51566)) b!1276549))

(assert (= start!108094 b!1276544))

(declare-fun m!1172433 () Bool)

(assert (=> start!108094 m!1172433))

(declare-fun m!1172435 () Bool)

(assert (=> start!108094 m!1172435))

(declare-fun m!1172437 () Bool)

(assert (=> start!108094 m!1172437))

(declare-fun m!1172439 () Bool)

(assert (=> b!1276547 m!1172439))

(declare-fun m!1172441 () Bool)

(assert (=> b!1276545 m!1172441))

(declare-fun m!1172443 () Bool)

(assert (=> mapNonEmpty!51566 m!1172443))

(declare-fun m!1172445 () Bool)

(assert (=> b!1276550 m!1172445))

(assert (=> b!1276550 m!1172445))

(declare-fun m!1172447 () Bool)

(assert (=> b!1276550 m!1172447))

(check-sat (not b!1276545) (not start!108094) (not b!1276547) tp_is_empty!33357 (not b!1276550) b_and!45863 (not mapNonEmpty!51566) (not b_next!27807))
(check-sat b_and!45863 (not b_next!27807))
