; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70772 () Bool)

(assert start!70772)

(declare-fun b_free!13029 () Bool)

(declare-fun b_next!13029 () Bool)

(assert (=> start!70772 (= b_free!13029 (not b_next!13029))))

(declare-fun tp!45832 () Bool)

(declare-fun b_and!21901 () Bool)

(assert (=> start!70772 (= tp!45832 b_and!21901)))

(declare-fun b!822022 () Bool)

(declare-fun e!456949 () Bool)

(declare-fun tp_is_empty!14739 () Bool)

(assert (=> b!822022 (= e!456949 tp_is_empty!14739)))

(declare-fun mapIsEmpty!23719 () Bool)

(declare-fun mapRes!23719 () Bool)

(assert (=> mapIsEmpty!23719 mapRes!23719))

(declare-fun b!822023 () Bool)

(declare-fun e!456948 () Bool)

(assert (=> b!822023 (= e!456948 (and e!456949 mapRes!23719))))

(declare-fun condMapEmpty!23719 () Bool)

(declare-datatypes ((V!24653 0))(
  ( (V!24654 (val!7417 Int)) )
))
(declare-datatypes ((ValueCell!6954 0))(
  ( (ValueCellFull!6954 (v!9848 V!24653)) (EmptyCell!6954) )
))
(declare-datatypes ((array!45674 0))(
  ( (array!45675 (arr!21887 (Array (_ BitVec 32) ValueCell!6954)) (size!22308 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45674)

(declare-fun mapDefault!23719 () ValueCell!6954)

(assert (=> b!822023 (= condMapEmpty!23719 (= (arr!21887 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6954)) mapDefault!23719)))))

(declare-fun b!822024 () Bool)

(declare-fun res!560693 () Bool)

(declare-fun e!456950 () Bool)

(assert (=> b!822024 (=> (not res!560693) (not e!456950))))

(declare-datatypes ((array!45676 0))(
  ( (array!45677 (arr!21888 (Array (_ BitVec 32) (_ BitVec 64))) (size!22309 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45676)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!822024 (= res!560693 (and (= (size!22308 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22309 _keys!976) (size!22308 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!822025 () Bool)

(declare-fun e!456947 () Bool)

(assert (=> b!822025 (= e!456950 (not e!456947))))

(declare-fun res!560690 () Bool)

(assert (=> b!822025 (=> res!560690 e!456947)))

(assert (=> b!822025 (= res!560690 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9792 0))(
  ( (tuple2!9793 (_1!4907 (_ BitVec 64)) (_2!4907 V!24653)) )
))
(declare-datatypes ((List!15607 0))(
  ( (Nil!15604) (Cons!15603 (h!16732 tuple2!9792) (t!21944 List!15607)) )
))
(declare-datatypes ((ListLongMap!8615 0))(
  ( (ListLongMap!8616 (toList!4323 List!15607)) )
))
(declare-fun lt!369593 () ListLongMap!8615)

(declare-fun lt!369596 () ListLongMap!8615)

(assert (=> b!822025 (= lt!369593 lt!369596)))

(declare-fun zeroValueBefore!34 () V!24653)

(declare-fun zeroValueAfter!34 () V!24653)

(declare-fun minValue!754 () V!24653)

(declare-datatypes ((Unit!28110 0))(
  ( (Unit!28111) )
))
(declare-fun lt!369597 () Unit!28110)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!452 (array!45676 array!45674 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24653 V!24653 V!24653 V!24653 (_ BitVec 32) Int) Unit!28110)

(assert (=> b!822025 (= lt!369597 (lemmaNoChangeToArrayThenSameMapNoExtras!452 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2342 (array!45676 array!45674 (_ BitVec 32) (_ BitVec 32) V!24653 V!24653 (_ BitVec 32) Int) ListLongMap!8615)

(assert (=> b!822025 (= lt!369596 (getCurrentListMapNoExtraKeys!2342 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822025 (= lt!369593 (getCurrentListMapNoExtraKeys!2342 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822026 () Bool)

(declare-fun res!560692 () Bool)

(assert (=> b!822026 (=> (not res!560692) (not e!456950))))

(declare-datatypes ((List!15608 0))(
  ( (Nil!15605) (Cons!15604 (h!16733 (_ BitVec 64)) (t!21945 List!15608)) )
))
(declare-fun arrayNoDuplicates!0 (array!45676 (_ BitVec 32) List!15608) Bool)

(assert (=> b!822026 (= res!560692 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15605))))

(declare-fun b!822027 () Bool)

(declare-fun res!560691 () Bool)

(assert (=> b!822027 (=> (not res!560691) (not e!456950))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45676 (_ BitVec 32)) Bool)

(assert (=> b!822027 (= res!560691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!822028 () Bool)

(assert (=> b!822028 (= e!456947 true)))

(declare-fun lt!369591 () ListLongMap!8615)

(declare-fun lt!369588 () ListLongMap!8615)

(declare-fun lt!369589 () tuple2!9792)

(declare-fun +!1875 (ListLongMap!8615 tuple2!9792) ListLongMap!8615)

(assert (=> b!822028 (= lt!369591 (+!1875 lt!369588 lt!369589))))

(declare-fun lt!369594 () Unit!28110)

(declare-fun addCommutativeForDiffKeys!438 (ListLongMap!8615 (_ BitVec 64) V!24653 (_ BitVec 64) V!24653) Unit!28110)

(assert (=> b!822028 (= lt!369594 (addCommutativeForDiffKeys!438 lt!369593 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!369592 () ListLongMap!8615)

(assert (=> b!822028 (= lt!369592 lt!369591)))

(declare-fun lt!369590 () tuple2!9792)

(assert (=> b!822028 (= lt!369591 (+!1875 (+!1875 lt!369593 lt!369589) lt!369590))))

(assert (=> b!822028 (= lt!369589 (tuple2!9793 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!369595 () ListLongMap!8615)

(assert (=> b!822028 (= lt!369595 lt!369588)))

(assert (=> b!822028 (= lt!369588 (+!1875 lt!369593 lt!369590))))

(assert (=> b!822028 (= lt!369590 (tuple2!9793 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun getCurrentListMap!2489 (array!45676 array!45674 (_ BitVec 32) (_ BitVec 32) V!24653 V!24653 (_ BitVec 32) Int) ListLongMap!8615)

(assert (=> b!822028 (= lt!369592 (getCurrentListMap!2489 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822028 (= lt!369595 (getCurrentListMap!2489 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23719 () Bool)

(declare-fun tp!45831 () Bool)

(declare-fun e!456951 () Bool)

(assert (=> mapNonEmpty!23719 (= mapRes!23719 (and tp!45831 e!456951))))

(declare-fun mapValue!23719 () ValueCell!6954)

(declare-fun mapKey!23719 () (_ BitVec 32))

(declare-fun mapRest!23719 () (Array (_ BitVec 32) ValueCell!6954))

(assert (=> mapNonEmpty!23719 (= (arr!21887 _values!788) (store mapRest!23719 mapKey!23719 mapValue!23719))))

(declare-fun b!822029 () Bool)

(assert (=> b!822029 (= e!456951 tp_is_empty!14739)))

(declare-fun res!560694 () Bool)

(assert (=> start!70772 (=> (not res!560694) (not e!456950))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70772 (= res!560694 (validMask!0 mask!1312))))

(assert (=> start!70772 e!456950))

(assert (=> start!70772 tp_is_empty!14739))

(declare-fun array_inv!17483 (array!45676) Bool)

(assert (=> start!70772 (array_inv!17483 _keys!976)))

(assert (=> start!70772 true))

(declare-fun array_inv!17484 (array!45674) Bool)

(assert (=> start!70772 (and (array_inv!17484 _values!788) e!456948)))

(assert (=> start!70772 tp!45832))

(assert (= (and start!70772 res!560694) b!822024))

(assert (= (and b!822024 res!560693) b!822027))

(assert (= (and b!822027 res!560691) b!822026))

(assert (= (and b!822026 res!560692) b!822025))

(assert (= (and b!822025 (not res!560690)) b!822028))

(assert (= (and b!822023 condMapEmpty!23719) mapIsEmpty!23719))

(assert (= (and b!822023 (not condMapEmpty!23719)) mapNonEmpty!23719))

(get-info :version)

(assert (= (and mapNonEmpty!23719 ((_ is ValueCellFull!6954) mapValue!23719)) b!822029))

(assert (= (and b!822023 ((_ is ValueCellFull!6954) mapDefault!23719)) b!822022))

(assert (= start!70772 b!822023))

(declare-fun m!763737 () Bool)

(assert (=> b!822026 m!763737))

(declare-fun m!763739 () Bool)

(assert (=> b!822025 m!763739))

(declare-fun m!763741 () Bool)

(assert (=> b!822025 m!763741))

(declare-fun m!763743 () Bool)

(assert (=> b!822025 m!763743))

(declare-fun m!763745 () Bool)

(assert (=> b!822028 m!763745))

(declare-fun m!763747 () Bool)

(assert (=> b!822028 m!763747))

(declare-fun m!763749 () Bool)

(assert (=> b!822028 m!763749))

(declare-fun m!763751 () Bool)

(assert (=> b!822028 m!763751))

(assert (=> b!822028 m!763745))

(declare-fun m!763753 () Bool)

(assert (=> b!822028 m!763753))

(declare-fun m!763755 () Bool)

(assert (=> b!822028 m!763755))

(declare-fun m!763757 () Bool)

(assert (=> b!822028 m!763757))

(declare-fun m!763759 () Bool)

(assert (=> mapNonEmpty!23719 m!763759))

(declare-fun m!763761 () Bool)

(assert (=> start!70772 m!763761))

(declare-fun m!763763 () Bool)

(assert (=> start!70772 m!763763))

(declare-fun m!763765 () Bool)

(assert (=> start!70772 m!763765))

(declare-fun m!763767 () Bool)

(assert (=> b!822027 m!763767))

(check-sat (not b!822026) tp_is_empty!14739 (not mapNonEmpty!23719) (not start!70772) (not b!822028) (not b!822027) b_and!21901 (not b_next!13029) (not b!822025))
(check-sat b_and!21901 (not b_next!13029))
