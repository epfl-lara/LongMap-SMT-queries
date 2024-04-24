; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71084 () Bool)

(assert start!71084)

(declare-fun b_free!13135 () Bool)

(declare-fun b_next!13135 () Bool)

(assert (=> start!71084 (= b_free!13135 (not b_next!13135))))

(declare-fun tp!46155 () Bool)

(declare-fun b_and!22041 () Bool)

(assert (=> start!71084 (= tp!46155 b_and!22041)))

(declare-fun b!824548 () Bool)

(declare-fun res!561989 () Bool)

(declare-fun e!458702 () Bool)

(assert (=> b!824548 (=> (not res!561989) (not e!458702))))

(declare-datatypes ((array!45885 0))(
  ( (array!45886 (arr!21986 (Array (_ BitVec 32) (_ BitVec 64))) (size!22406 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45885)

(declare-datatypes ((List!15580 0))(
  ( (Nil!15577) (Cons!15576 (h!16711 (_ BitVec 64)) (t!21913 List!15580)) )
))
(declare-fun arrayNoDuplicates!0 (array!45885 (_ BitVec 32) List!15580) Bool)

(assert (=> b!824548 (= res!561989 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15577))))

(declare-fun mapIsEmpty!23884 () Bool)

(declare-fun mapRes!23884 () Bool)

(assert (=> mapIsEmpty!23884 mapRes!23884))

(declare-fun b!824549 () Bool)

(declare-fun res!561988 () Bool)

(assert (=> b!824549 (=> (not res!561988) (not e!458702))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24795 0))(
  ( (V!24796 (val!7470 Int)) )
))
(declare-datatypes ((ValueCell!7007 0))(
  ( (ValueCellFull!7007 (v!9903 V!24795)) (EmptyCell!7007) )
))
(declare-datatypes ((array!45887 0))(
  ( (array!45888 (arr!21987 (Array (_ BitVec 32) ValueCell!7007)) (size!22407 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45887)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!824549 (= res!561988 (and (= (size!22407 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22406 _keys!976) (size!22407 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!824550 () Bool)

(declare-fun res!561990 () Bool)

(assert (=> b!824550 (=> (not res!561990) (not e!458702))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45885 (_ BitVec 32)) Bool)

(assert (=> b!824550 (= res!561990 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!824551 () Bool)

(declare-fun e!458706 () Bool)

(declare-fun tp_is_empty!14845 () Bool)

(assert (=> b!824551 (= e!458706 tp_is_empty!14845)))

(declare-fun mapNonEmpty!23884 () Bool)

(declare-fun tp!46156 () Bool)

(declare-fun e!458704 () Bool)

(assert (=> mapNonEmpty!23884 (= mapRes!23884 (and tp!46156 e!458704))))

(declare-fun mapKey!23884 () (_ BitVec 32))

(declare-fun mapValue!23884 () ValueCell!7007)

(declare-fun mapRest!23884 () (Array (_ BitVec 32) ValueCell!7007))

(assert (=> mapNonEmpty!23884 (= (arr!21987 _values!788) (store mapRest!23884 mapKey!23884 mapValue!23884))))

(declare-fun b!824553 () Bool)

(assert (=> b!824553 (= e!458704 tp_is_empty!14845)))

(declare-fun b!824554 () Bool)

(assert (=> b!824554 (= e!458702 (not true))))

(declare-datatypes ((tuple2!9794 0))(
  ( (tuple2!9795 (_1!4908 (_ BitVec 64)) (_2!4908 V!24795)) )
))
(declare-datatypes ((List!15581 0))(
  ( (Nil!15578) (Cons!15577 (h!16712 tuple2!9794) (t!21914 List!15581)) )
))
(declare-datatypes ((ListLongMap!8619 0))(
  ( (ListLongMap!8620 (toList!4325 List!15581)) )
))
(declare-fun lt!371829 () ListLongMap!8619)

(declare-fun lt!371830 () ListLongMap!8619)

(assert (=> b!824554 (= lt!371829 lt!371830)))

(declare-fun zeroValueBefore!34 () V!24795)

(declare-fun zeroValueAfter!34 () V!24795)

(declare-fun minValue!754 () V!24795)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28203 0))(
  ( (Unit!28204) )
))
(declare-fun lt!371828 () Unit!28203)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!496 (array!45885 array!45887 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24795 V!24795 V!24795 V!24795 (_ BitVec 32) Int) Unit!28203)

(assert (=> b!824554 (= lt!371828 (lemmaNoChangeToArrayThenSameMapNoExtras!496 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2408 (array!45885 array!45887 (_ BitVec 32) (_ BitVec 32) V!24795 V!24795 (_ BitVec 32) Int) ListLongMap!8619)

(assert (=> b!824554 (= lt!371830 (getCurrentListMapNoExtraKeys!2408 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824554 (= lt!371829 (getCurrentListMapNoExtraKeys!2408 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!561987 () Bool)

(assert (=> start!71084 (=> (not res!561987) (not e!458702))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71084 (= res!561987 (validMask!0 mask!1312))))

(assert (=> start!71084 e!458702))

(assert (=> start!71084 tp_is_empty!14845))

(declare-fun array_inv!17583 (array!45885) Bool)

(assert (=> start!71084 (array_inv!17583 _keys!976)))

(assert (=> start!71084 true))

(declare-fun e!458703 () Bool)

(declare-fun array_inv!17584 (array!45887) Bool)

(assert (=> start!71084 (and (array_inv!17584 _values!788) e!458703)))

(assert (=> start!71084 tp!46155))

(declare-fun b!824552 () Bool)

(assert (=> b!824552 (= e!458703 (and e!458706 mapRes!23884))))

(declare-fun condMapEmpty!23884 () Bool)

(declare-fun mapDefault!23884 () ValueCell!7007)

(assert (=> b!824552 (= condMapEmpty!23884 (= (arr!21987 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7007)) mapDefault!23884)))))

(assert (= (and start!71084 res!561987) b!824549))

(assert (= (and b!824549 res!561988) b!824550))

(assert (= (and b!824550 res!561990) b!824548))

(assert (= (and b!824548 res!561989) b!824554))

(assert (= (and b!824552 condMapEmpty!23884) mapIsEmpty!23884))

(assert (= (and b!824552 (not condMapEmpty!23884)) mapNonEmpty!23884))

(get-info :version)

(assert (= (and mapNonEmpty!23884 ((_ is ValueCellFull!7007) mapValue!23884)) b!824553))

(assert (= (and b!824552 ((_ is ValueCellFull!7007) mapDefault!23884)) b!824551))

(assert (= start!71084 b!824552))

(declare-fun m!767147 () Bool)

(assert (=> start!71084 m!767147))

(declare-fun m!767149 () Bool)

(assert (=> start!71084 m!767149))

(declare-fun m!767151 () Bool)

(assert (=> start!71084 m!767151))

(declare-fun m!767153 () Bool)

(assert (=> b!824550 m!767153))

(declare-fun m!767155 () Bool)

(assert (=> b!824548 m!767155))

(declare-fun m!767157 () Bool)

(assert (=> b!824554 m!767157))

(declare-fun m!767159 () Bool)

(assert (=> b!824554 m!767159))

(declare-fun m!767161 () Bool)

(assert (=> b!824554 m!767161))

(declare-fun m!767163 () Bool)

(assert (=> mapNonEmpty!23884 m!767163))

(check-sat tp_is_empty!14845 (not b_next!13135) (not start!71084) (not b!824550) (not b!824548) (not mapNonEmpty!23884) b_and!22041 (not b!824554))
(check-sat b_and!22041 (not b_next!13135))
