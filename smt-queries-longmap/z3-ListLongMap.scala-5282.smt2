; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70864 () Bool)

(assert start!70864)

(declare-fun b_free!13101 () Bool)

(declare-fun b_next!13101 () Bool)

(assert (=> start!70864 (= b_free!13101 (not b_next!13101))))

(declare-fun tp!46050 () Bool)

(declare-fun b_and!21985 () Bool)

(assert (=> start!70864 (= tp!46050 b_and!21985)))

(declare-fun mapNonEmpty!23830 () Bool)

(declare-fun mapRes!23830 () Bool)

(declare-fun tp!46051 () Bool)

(declare-fun e!457711 () Bool)

(assert (=> mapNonEmpty!23830 (= mapRes!23830 (and tp!46051 e!457711))))

(declare-datatypes ((V!24749 0))(
  ( (V!24750 (val!7453 Int)) )
))
(declare-datatypes ((ValueCell!6990 0))(
  ( (ValueCellFull!6990 (v!9885 V!24749)) (EmptyCell!6990) )
))
(declare-datatypes ((array!45816 0))(
  ( (array!45817 (arr!21957 (Array (_ BitVec 32) ValueCell!6990)) (size!22378 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45816)

(declare-fun mapRest!23830 () (Array (_ BitVec 32) ValueCell!6990))

(declare-fun mapValue!23830 () ValueCell!6990)

(declare-fun mapKey!23830 () (_ BitVec 32))

(assert (=> mapNonEmpty!23830 (= (arr!21957 _values!788) (store mapRest!23830 mapKey!23830 mapValue!23830))))

(declare-fun b!823067 () Bool)

(declare-fun res!561309 () Bool)

(declare-fun e!457712 () Bool)

(assert (=> b!823067 (=> (not res!561309) (not e!457712))))

(declare-datatypes ((array!45818 0))(
  ( (array!45819 (arr!21958 (Array (_ BitVec 32) (_ BitVec 64))) (size!22379 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45818)

(declare-datatypes ((List!15665 0))(
  ( (Nil!15662) (Cons!15661 (h!16790 (_ BitVec 64)) (t!22004 List!15665)) )
))
(declare-fun arrayNoDuplicates!0 (array!45818 (_ BitVec 32) List!15665) Bool)

(assert (=> b!823067 (= res!561309 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15662))))

(declare-fun b!823068 () Bool)

(declare-fun e!457708 () Bool)

(declare-fun e!457707 () Bool)

(assert (=> b!823068 (= e!457708 (and e!457707 mapRes!23830))))

(declare-fun condMapEmpty!23830 () Bool)

(declare-fun mapDefault!23830 () ValueCell!6990)

(assert (=> b!823068 (= condMapEmpty!23830 (= (arr!21957 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6990)) mapDefault!23830)))))

(declare-fun b!823069 () Bool)

(declare-fun tp_is_empty!14811 () Bool)

(assert (=> b!823069 (= e!457707 tp_is_empty!14811)))

(declare-fun b!823070 () Bool)

(declare-fun e!457709 () Bool)

(assert (=> b!823070 (= e!457712 (not e!457709))))

(declare-fun res!561310 () Bool)

(assert (=> b!823070 (=> res!561310 e!457709)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!823070 (= res!561310 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9852 0))(
  ( (tuple2!9853 (_1!4937 (_ BitVec 64)) (_2!4937 V!24749)) )
))
(declare-datatypes ((List!15666 0))(
  ( (Nil!15663) (Cons!15662 (h!16791 tuple2!9852) (t!22005 List!15666)) )
))
(declare-datatypes ((ListLongMap!8675 0))(
  ( (ListLongMap!8676 (toList!4353 List!15666)) )
))
(declare-fun lt!370827 () ListLongMap!8675)

(declare-fun lt!370828 () ListLongMap!8675)

(assert (=> b!823070 (= lt!370827 lt!370828)))

(declare-fun zeroValueBefore!34 () V!24749)

(declare-fun minValue!754 () V!24749)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun zeroValueAfter!34 () V!24749)

(declare-datatypes ((Unit!28172 0))(
  ( (Unit!28173) )
))
(declare-fun lt!370826 () Unit!28172)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!479 (array!45818 array!45816 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24749 V!24749 V!24749 V!24749 (_ BitVec 32) Int) Unit!28172)

(assert (=> b!823070 (= lt!370826 (lemmaNoChangeToArrayThenSameMapNoExtras!479 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2369 (array!45818 array!45816 (_ BitVec 32) (_ BitVec 32) V!24749 V!24749 (_ BitVec 32) Int) ListLongMap!8675)

(assert (=> b!823070 (= lt!370828 (getCurrentListMapNoExtraKeys!2369 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823070 (= lt!370827 (getCurrentListMapNoExtraKeys!2369 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823071 () Bool)

(assert (=> b!823071 (= e!457709 true)))

(declare-fun lt!370824 () ListLongMap!8675)

(declare-fun lt!370832 () ListLongMap!8675)

(declare-fun lt!370825 () tuple2!9852)

(declare-fun +!1902 (ListLongMap!8675 tuple2!9852) ListLongMap!8675)

(assert (=> b!823071 (= lt!370824 (+!1902 lt!370832 lt!370825))))

(declare-fun lt!370831 () Unit!28172)

(declare-fun addCommutativeForDiffKeys!465 (ListLongMap!8675 (_ BitVec 64) V!24749 (_ BitVec 64) V!24749) Unit!28172)

(assert (=> b!823071 (= lt!370831 (addCommutativeForDiffKeys!465 lt!370827 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!370829 () ListLongMap!8675)

(assert (=> b!823071 (= lt!370829 lt!370824)))

(declare-fun lt!370830 () tuple2!9852)

(assert (=> b!823071 (= lt!370824 (+!1902 (+!1902 lt!370827 lt!370825) lt!370830))))

(assert (=> b!823071 (= lt!370825 (tuple2!9853 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!370823 () ListLongMap!8675)

(assert (=> b!823071 (= lt!370823 lt!370832)))

(assert (=> b!823071 (= lt!370832 (+!1902 lt!370827 lt!370830))))

(assert (=> b!823071 (= lt!370830 (tuple2!9853 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun getCurrentListMap!2516 (array!45818 array!45816 (_ BitVec 32) (_ BitVec 32) V!24749 V!24749 (_ BitVec 32) Int) ListLongMap!8675)

(assert (=> b!823071 (= lt!370829 (getCurrentListMap!2516 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823071 (= lt!370823 (getCurrentListMap!2516 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823072 () Bool)

(assert (=> b!823072 (= e!457711 tp_is_empty!14811)))

(declare-fun res!561311 () Bool)

(assert (=> start!70864 (=> (not res!561311) (not e!457712))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70864 (= res!561311 (validMask!0 mask!1312))))

(assert (=> start!70864 e!457712))

(assert (=> start!70864 tp_is_empty!14811))

(declare-fun array_inv!17535 (array!45818) Bool)

(assert (=> start!70864 (array_inv!17535 _keys!976)))

(assert (=> start!70864 true))

(declare-fun array_inv!17536 (array!45816) Bool)

(assert (=> start!70864 (and (array_inv!17536 _values!788) e!457708)))

(assert (=> start!70864 tp!46050))

(declare-fun mapIsEmpty!23830 () Bool)

(assert (=> mapIsEmpty!23830 mapRes!23830))

(declare-fun b!823073 () Bool)

(declare-fun res!561312 () Bool)

(assert (=> b!823073 (=> (not res!561312) (not e!457712))))

(assert (=> b!823073 (= res!561312 (and (= (size!22378 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22379 _keys!976) (size!22378 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!823074 () Bool)

(declare-fun res!561313 () Bool)

(assert (=> b!823074 (=> (not res!561313) (not e!457712))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45818 (_ BitVec 32)) Bool)

(assert (=> b!823074 (= res!561313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!70864 res!561311) b!823073))

(assert (= (and b!823073 res!561312) b!823074))

(assert (= (and b!823074 res!561313) b!823067))

(assert (= (and b!823067 res!561309) b!823070))

(assert (= (and b!823070 (not res!561310)) b!823071))

(assert (= (and b!823068 condMapEmpty!23830) mapIsEmpty!23830))

(assert (= (and b!823068 (not condMapEmpty!23830)) mapNonEmpty!23830))

(get-info :version)

(assert (= (and mapNonEmpty!23830 ((_ is ValueCellFull!6990) mapValue!23830)) b!823072))

(assert (= (and b!823068 ((_ is ValueCellFull!6990) mapDefault!23830)) b!823069))

(assert (= start!70864 b!823068))

(declare-fun m!765105 () Bool)

(assert (=> mapNonEmpty!23830 m!765105))

(declare-fun m!765107 () Bool)

(assert (=> b!823070 m!765107))

(declare-fun m!765109 () Bool)

(assert (=> b!823070 m!765109))

(declare-fun m!765111 () Bool)

(assert (=> b!823070 m!765111))

(declare-fun m!765113 () Bool)

(assert (=> b!823074 m!765113))

(declare-fun m!765115 () Bool)

(assert (=> start!70864 m!765115))

(declare-fun m!765117 () Bool)

(assert (=> start!70864 m!765117))

(declare-fun m!765119 () Bool)

(assert (=> start!70864 m!765119))

(declare-fun m!765121 () Bool)

(assert (=> b!823067 m!765121))

(declare-fun m!765123 () Bool)

(assert (=> b!823071 m!765123))

(declare-fun m!765125 () Bool)

(assert (=> b!823071 m!765125))

(assert (=> b!823071 m!765123))

(declare-fun m!765127 () Bool)

(assert (=> b!823071 m!765127))

(declare-fun m!765129 () Bool)

(assert (=> b!823071 m!765129))

(declare-fun m!765131 () Bool)

(assert (=> b!823071 m!765131))

(declare-fun m!765133 () Bool)

(assert (=> b!823071 m!765133))

(declare-fun m!765135 () Bool)

(assert (=> b!823071 m!765135))

(check-sat (not b!823070) (not b!823071) (not b_next!13101) (not b!823074) (not mapNonEmpty!23830) (not b!823067) b_and!21985 tp_is_empty!14811 (not start!70864))
(check-sat b_and!21985 (not b_next!13101))
