; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71052 () Bool)

(assert start!71052)

(declare-fun b_free!13123 () Bool)

(declare-fun b_next!13123 () Bool)

(assert (=> start!71052 (= b_free!13123 (not b_next!13123))))

(declare-fun tp!46117 () Bool)

(declare-fun b_and!22017 () Bool)

(assert (=> start!71052 (= tp!46117 b_and!22017)))

(declare-fun b!824225 () Bool)

(declare-fun res!561823 () Bool)

(declare-fun e!458488 () Bool)

(assert (=> b!824225 (=> (not res!561823) (not e!458488))))

(declare-datatypes ((array!45859 0))(
  ( (array!45860 (arr!21974 (Array (_ BitVec 32) (_ BitVec 64))) (size!22394 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45859)

(declare-datatypes ((List!15571 0))(
  ( (Nil!15568) (Cons!15567 (h!16702 (_ BitVec 64)) (t!21902 List!15571)) )
))
(declare-fun arrayNoDuplicates!0 (array!45859 (_ BitVec 32) List!15571) Bool)

(assert (=> b!824225 (= res!561823 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15568))))

(declare-fun b!824226 () Bool)

(declare-fun e!458483 () Bool)

(declare-fun e!458484 () Bool)

(declare-fun mapRes!23863 () Bool)

(assert (=> b!824226 (= e!458483 (and e!458484 mapRes!23863))))

(declare-fun condMapEmpty!23863 () Bool)

(declare-datatypes ((V!24779 0))(
  ( (V!24780 (val!7464 Int)) )
))
(declare-datatypes ((ValueCell!7001 0))(
  ( (ValueCellFull!7001 (v!9896 V!24779)) (EmptyCell!7001) )
))
(declare-datatypes ((array!45861 0))(
  ( (array!45862 (arr!21975 (Array (_ BitVec 32) ValueCell!7001)) (size!22395 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45861)

(declare-fun mapDefault!23863 () ValueCell!7001)

(assert (=> b!824226 (= condMapEmpty!23863 (= (arr!21975 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7001)) mapDefault!23863)))))

(declare-fun b!824227 () Bool)

(declare-fun tp_is_empty!14833 () Bool)

(assert (=> b!824227 (= e!458484 tp_is_empty!14833)))

(declare-fun mapNonEmpty!23863 () Bool)

(declare-fun tp!46116 () Bool)

(declare-fun e!458486 () Bool)

(assert (=> mapNonEmpty!23863 (= mapRes!23863 (and tp!46116 e!458486))))

(declare-fun mapValue!23863 () ValueCell!7001)

(declare-fun mapKey!23863 () (_ BitVec 32))

(declare-fun mapRest!23863 () (Array (_ BitVec 32) ValueCell!7001))

(assert (=> mapNonEmpty!23863 (= (arr!21975 _values!788) (store mapRest!23863 mapKey!23863 mapValue!23863))))

(declare-fun b!824228 () Bool)

(declare-fun res!561824 () Bool)

(assert (=> b!824228 (=> (not res!561824) (not e!458488))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!824228 (= res!561824 (and (= (size!22395 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22394 _keys!976) (size!22395 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!824229 () Bool)

(assert (=> b!824229 (= e!458486 tp_is_empty!14833)))

(declare-fun res!561821 () Bool)

(assert (=> start!71052 (=> (not res!561821) (not e!458488))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71052 (= res!561821 (validMask!0 mask!1312))))

(assert (=> start!71052 e!458488))

(assert (=> start!71052 tp_is_empty!14833))

(declare-fun array_inv!17575 (array!45859) Bool)

(assert (=> start!71052 (array_inv!17575 _keys!976)))

(assert (=> start!71052 true))

(declare-fun array_inv!17576 (array!45861) Bool)

(assert (=> start!71052 (and (array_inv!17576 _values!788) e!458483)))

(assert (=> start!71052 tp!46117))

(declare-fun b!824230 () Bool)

(declare-fun e!458485 () Bool)

(assert (=> b!824230 (= e!458488 (not e!458485))))

(declare-fun res!561820 () Bool)

(assert (=> b!824230 (=> res!561820 e!458485)))

(assert (=> b!824230 (= res!561820 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9784 0))(
  ( (tuple2!9785 (_1!4903 (_ BitVec 64)) (_2!4903 V!24779)) )
))
(declare-datatypes ((List!15572 0))(
  ( (Nil!15569) (Cons!15568 (h!16703 tuple2!9784) (t!21903 List!15572)) )
))
(declare-datatypes ((ListLongMap!8609 0))(
  ( (ListLongMap!8610 (toList!4320 List!15572)) )
))
(declare-fun lt!371509 () ListLongMap!8609)

(declare-fun lt!371515 () ListLongMap!8609)

(assert (=> b!824230 (= lt!371509 lt!371515)))

(declare-fun zeroValueBefore!34 () V!24779)

(declare-datatypes ((Unit!28191 0))(
  ( (Unit!28192) )
))
(declare-fun lt!371508 () Unit!28191)

(declare-fun zeroValueAfter!34 () V!24779)

(declare-fun minValue!754 () V!24779)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!492 (array!45859 array!45861 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24779 V!24779 V!24779 V!24779 (_ BitVec 32) Int) Unit!28191)

(assert (=> b!824230 (= lt!371508 (lemmaNoChangeToArrayThenSameMapNoExtras!492 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2404 (array!45859 array!45861 (_ BitVec 32) (_ BitVec 32) V!24779 V!24779 (_ BitVec 32) Int) ListLongMap!8609)

(assert (=> b!824230 (= lt!371515 (getCurrentListMapNoExtraKeys!2404 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824230 (= lt!371509 (getCurrentListMapNoExtraKeys!2404 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824231 () Bool)

(declare-fun res!561822 () Bool)

(assert (=> b!824231 (=> (not res!561822) (not e!458488))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45859 (_ BitVec 32)) Bool)

(assert (=> b!824231 (= res!561822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!824232 () Bool)

(assert (=> b!824232 (= e!458485 true)))

(declare-fun lt!371510 () ListLongMap!8609)

(declare-fun lt!371512 () ListLongMap!8609)

(declare-fun lt!371516 () tuple2!9784)

(declare-fun +!1908 (ListLongMap!8609 tuple2!9784) ListLongMap!8609)

(assert (=> b!824232 (= lt!371510 (+!1908 lt!371512 lt!371516))))

(declare-fun lt!371513 () Unit!28191)

(declare-fun addCommutativeForDiffKeys!466 (ListLongMap!8609 (_ BitVec 64) V!24779 (_ BitVec 64) V!24779) Unit!28191)

(assert (=> b!824232 (= lt!371513 (addCommutativeForDiffKeys!466 lt!371509 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!371514 () ListLongMap!8609)

(assert (=> b!824232 (= lt!371514 lt!371510)))

(declare-fun lt!371507 () tuple2!9784)

(assert (=> b!824232 (= lt!371510 (+!1908 (+!1908 lt!371509 lt!371516) lt!371507))))

(assert (=> b!824232 (= lt!371516 (tuple2!9785 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!371511 () ListLongMap!8609)

(assert (=> b!824232 (= lt!371511 lt!371512)))

(assert (=> b!824232 (= lt!371512 (+!1908 lt!371509 lt!371507))))

(assert (=> b!824232 (= lt!371507 (tuple2!9785 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun getCurrentListMap!2472 (array!45859 array!45861 (_ BitVec 32) (_ BitVec 32) V!24779 V!24779 (_ BitVec 32) Int) ListLongMap!8609)

(assert (=> b!824232 (= lt!371514 (getCurrentListMap!2472 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824232 (= lt!371511 (getCurrentListMap!2472 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23863 () Bool)

(assert (=> mapIsEmpty!23863 mapRes!23863))

(assert (= (and start!71052 res!561821) b!824228))

(assert (= (and b!824228 res!561824) b!824231))

(assert (= (and b!824231 res!561822) b!824225))

(assert (= (and b!824225 res!561823) b!824230))

(assert (= (and b!824230 (not res!561820)) b!824232))

(assert (= (and b!824226 condMapEmpty!23863) mapIsEmpty!23863))

(assert (= (and b!824226 (not condMapEmpty!23863)) mapNonEmpty!23863))

(get-info :version)

(assert (= (and mapNonEmpty!23863 ((_ is ValueCellFull!7001) mapValue!23863)) b!824229))

(assert (= (and b!824226 ((_ is ValueCellFull!7001) mapDefault!23863)) b!824227))

(assert (= start!71052 b!824226))

(declare-fun m!766739 () Bool)

(assert (=> mapNonEmpty!23863 m!766739))

(declare-fun m!766741 () Bool)

(assert (=> b!824232 m!766741))

(declare-fun m!766743 () Bool)

(assert (=> b!824232 m!766743))

(declare-fun m!766745 () Bool)

(assert (=> b!824232 m!766745))

(declare-fun m!766747 () Bool)

(assert (=> b!824232 m!766747))

(assert (=> b!824232 m!766745))

(declare-fun m!766749 () Bool)

(assert (=> b!824232 m!766749))

(declare-fun m!766751 () Bool)

(assert (=> b!824232 m!766751))

(declare-fun m!766753 () Bool)

(assert (=> b!824232 m!766753))

(declare-fun m!766755 () Bool)

(assert (=> start!71052 m!766755))

(declare-fun m!766757 () Bool)

(assert (=> start!71052 m!766757))

(declare-fun m!766759 () Bool)

(assert (=> start!71052 m!766759))

(declare-fun m!766761 () Bool)

(assert (=> b!824225 m!766761))

(declare-fun m!766763 () Bool)

(assert (=> b!824231 m!766763))

(declare-fun m!766765 () Bool)

(assert (=> b!824230 m!766765))

(declare-fun m!766767 () Bool)

(assert (=> b!824230 m!766767))

(declare-fun m!766769 () Bool)

(assert (=> b!824230 m!766769))

(check-sat (not b!824225) (not b!824230) b_and!22017 (not mapNonEmpty!23863) (not b_next!13123) (not b!824231) (not start!71052) tp_is_empty!14833 (not b!824232))
(check-sat b_and!22017 (not b_next!13123))
