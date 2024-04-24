; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71022 () Bool)

(assert start!71022)

(declare-fun b_free!13093 () Bool)

(declare-fun b_next!13093 () Bool)

(assert (=> start!71022 (= b_free!13093 (not b_next!13093))))

(declare-fun tp!46026 () Bool)

(declare-fun b_and!21987 () Bool)

(assert (=> start!71022 (= tp!46026 b_and!21987)))

(declare-fun b!823865 () Bool)

(declare-fun e!458215 () Bool)

(declare-fun tp_is_empty!14803 () Bool)

(assert (=> b!823865 (= e!458215 tp_is_empty!14803)))

(declare-fun mapNonEmpty!23818 () Bool)

(declare-fun mapRes!23818 () Bool)

(declare-fun tp!46027 () Bool)

(assert (=> mapNonEmpty!23818 (= mapRes!23818 (and tp!46027 e!458215))))

(declare-datatypes ((V!24739 0))(
  ( (V!24740 (val!7449 Int)) )
))
(declare-datatypes ((ValueCell!6986 0))(
  ( (ValueCellFull!6986 (v!9881 V!24739)) (EmptyCell!6986) )
))
(declare-datatypes ((array!45803 0))(
  ( (array!45804 (arr!21946 (Array (_ BitVec 32) ValueCell!6986)) (size!22366 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45803)

(declare-fun mapValue!23818 () ValueCell!6986)

(declare-fun mapKey!23818 () (_ BitVec 32))

(declare-fun mapRest!23818 () (Array (_ BitVec 32) ValueCell!6986))

(assert (=> mapNonEmpty!23818 (= (arr!21946 _values!788) (store mapRest!23818 mapKey!23818 mapValue!23818))))

(declare-fun b!823866 () Bool)

(declare-fun e!458218 () Bool)

(declare-fun e!458216 () Bool)

(assert (=> b!823866 (= e!458218 (not e!458216))))

(declare-fun res!561599 () Bool)

(assert (=> b!823866 (=> res!561599 e!458216)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!823866 (= res!561599 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9764 0))(
  ( (tuple2!9765 (_1!4893 (_ BitVec 64)) (_2!4893 V!24739)) )
))
(declare-datatypes ((List!15550 0))(
  ( (Nil!15547) (Cons!15546 (h!16681 tuple2!9764) (t!21881 List!15550)) )
))
(declare-datatypes ((ListLongMap!8589 0))(
  ( (ListLongMap!8590 (toList!4310 List!15550)) )
))
(declare-fun lt!371061 () ListLongMap!8589)

(declare-fun lt!371063 () ListLongMap!8589)

(assert (=> b!823866 (= lt!371061 lt!371063)))

(declare-fun zeroValueBefore!34 () V!24739)

(declare-datatypes ((array!45805 0))(
  ( (array!45806 (arr!21947 (Array (_ BitVec 32) (_ BitVec 64))) (size!22367 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45805)

(declare-fun minValue!754 () V!24739)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24739)

(declare-datatypes ((Unit!28171 0))(
  ( (Unit!28172) )
))
(declare-fun lt!371060 () Unit!28171)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!482 (array!45805 array!45803 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24739 V!24739 V!24739 V!24739 (_ BitVec 32) Int) Unit!28171)

(assert (=> b!823866 (= lt!371060 (lemmaNoChangeToArrayThenSameMapNoExtras!482 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2394 (array!45805 array!45803 (_ BitVec 32) (_ BitVec 32) V!24739 V!24739 (_ BitVec 32) Int) ListLongMap!8589)

(assert (=> b!823866 (= lt!371063 (getCurrentListMapNoExtraKeys!2394 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823866 (= lt!371061 (getCurrentListMapNoExtraKeys!2394 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823867 () Bool)

(declare-fun e!458213 () Bool)

(assert (=> b!823867 (= e!458213 tp_is_empty!14803)))

(declare-fun b!823868 () Bool)

(declare-fun e!458214 () Bool)

(assert (=> b!823868 (= e!458214 (and e!458213 mapRes!23818))))

(declare-fun condMapEmpty!23818 () Bool)

(declare-fun mapDefault!23818 () ValueCell!6986)

(assert (=> b!823868 (= condMapEmpty!23818 (= (arr!21946 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6986)) mapDefault!23818)))))

(declare-fun b!823870 () Bool)

(declare-fun res!561597 () Bool)

(assert (=> b!823870 (=> (not res!561597) (not e!458218))))

(declare-datatypes ((List!15551 0))(
  ( (Nil!15548) (Cons!15547 (h!16682 (_ BitVec 64)) (t!21882 List!15551)) )
))
(declare-fun arrayNoDuplicates!0 (array!45805 (_ BitVec 32) List!15551) Bool)

(assert (=> b!823870 (= res!561597 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15548))))

(declare-fun mapIsEmpty!23818 () Bool)

(assert (=> mapIsEmpty!23818 mapRes!23818))

(declare-fun b!823871 () Bool)

(declare-fun res!561595 () Bool)

(assert (=> b!823871 (=> (not res!561595) (not e!458218))))

(assert (=> b!823871 (= res!561595 (and (= (size!22366 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22367 _keys!976) (size!22366 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!823872 () Bool)

(assert (=> b!823872 (= e!458216 true)))

(declare-fun lt!371064 () ListLongMap!8589)

(declare-fun lt!371066 () ListLongMap!8589)

(declare-fun lt!371059 () tuple2!9764)

(declare-fun +!1899 (ListLongMap!8589 tuple2!9764) ListLongMap!8589)

(assert (=> b!823872 (= lt!371064 (+!1899 lt!371066 lt!371059))))

(declare-fun lt!371057 () Unit!28171)

(declare-fun addCommutativeForDiffKeys!457 (ListLongMap!8589 (_ BitVec 64) V!24739 (_ BitVec 64) V!24739) Unit!28171)

(assert (=> b!823872 (= lt!371057 (addCommutativeForDiffKeys!457 lt!371061 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!371065 () ListLongMap!8589)

(assert (=> b!823872 (= lt!371065 lt!371064)))

(declare-fun lt!371058 () tuple2!9764)

(assert (=> b!823872 (= lt!371064 (+!1899 (+!1899 lt!371061 lt!371059) lt!371058))))

(assert (=> b!823872 (= lt!371059 (tuple2!9765 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!371062 () ListLongMap!8589)

(assert (=> b!823872 (= lt!371062 lt!371066)))

(assert (=> b!823872 (= lt!371066 (+!1899 lt!371061 lt!371058))))

(assert (=> b!823872 (= lt!371058 (tuple2!9765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun getCurrentListMap!2463 (array!45805 array!45803 (_ BitVec 32) (_ BitVec 32) V!24739 V!24739 (_ BitVec 32) Int) ListLongMap!8589)

(assert (=> b!823872 (= lt!371065 (getCurrentListMap!2463 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823872 (= lt!371062 (getCurrentListMap!2463 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823869 () Bool)

(declare-fun res!561596 () Bool)

(assert (=> b!823869 (=> (not res!561596) (not e!458218))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45805 (_ BitVec 32)) Bool)

(assert (=> b!823869 (= res!561596 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!561598 () Bool)

(assert (=> start!71022 (=> (not res!561598) (not e!458218))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71022 (= res!561598 (validMask!0 mask!1312))))

(assert (=> start!71022 e!458218))

(assert (=> start!71022 tp_is_empty!14803))

(declare-fun array_inv!17557 (array!45805) Bool)

(assert (=> start!71022 (array_inv!17557 _keys!976)))

(assert (=> start!71022 true))

(declare-fun array_inv!17558 (array!45803) Bool)

(assert (=> start!71022 (and (array_inv!17558 _values!788) e!458214)))

(assert (=> start!71022 tp!46026))

(assert (= (and start!71022 res!561598) b!823871))

(assert (= (and b!823871 res!561595) b!823869))

(assert (= (and b!823869 res!561596) b!823870))

(assert (= (and b!823870 res!561597) b!823866))

(assert (= (and b!823866 (not res!561599)) b!823872))

(assert (= (and b!823868 condMapEmpty!23818) mapIsEmpty!23818))

(assert (= (and b!823868 (not condMapEmpty!23818)) mapNonEmpty!23818))

(get-info :version)

(assert (= (and mapNonEmpty!23818 ((_ is ValueCellFull!6986) mapValue!23818)) b!823865))

(assert (= (and b!823868 ((_ is ValueCellFull!6986) mapDefault!23818)) b!823867))

(assert (= start!71022 b!823868))

(declare-fun m!766259 () Bool)

(assert (=> b!823870 m!766259))

(declare-fun m!766261 () Bool)

(assert (=> b!823869 m!766261))

(declare-fun m!766263 () Bool)

(assert (=> b!823866 m!766263))

(declare-fun m!766265 () Bool)

(assert (=> b!823866 m!766265))

(declare-fun m!766267 () Bool)

(assert (=> b!823866 m!766267))

(declare-fun m!766269 () Bool)

(assert (=> b!823872 m!766269))

(declare-fun m!766271 () Bool)

(assert (=> b!823872 m!766271))

(declare-fun m!766273 () Bool)

(assert (=> b!823872 m!766273))

(declare-fun m!766275 () Bool)

(assert (=> b!823872 m!766275))

(declare-fun m!766277 () Bool)

(assert (=> b!823872 m!766277))

(assert (=> b!823872 m!766269))

(declare-fun m!766279 () Bool)

(assert (=> b!823872 m!766279))

(declare-fun m!766281 () Bool)

(assert (=> b!823872 m!766281))

(declare-fun m!766283 () Bool)

(assert (=> start!71022 m!766283))

(declare-fun m!766285 () Bool)

(assert (=> start!71022 m!766285))

(declare-fun m!766287 () Bool)

(assert (=> start!71022 m!766287))

(declare-fun m!766289 () Bool)

(assert (=> mapNonEmpty!23818 m!766289))

(check-sat (not start!71022) (not b!823866) (not b_next!13093) tp_is_empty!14803 (not b!823870) (not b!823869) b_and!21987 (not b!823872) (not mapNonEmpty!23818))
(check-sat b_and!21987 (not b_next!13093))
