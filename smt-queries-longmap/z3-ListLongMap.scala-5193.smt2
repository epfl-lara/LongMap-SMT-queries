; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70324 () Bool)

(assert start!70324)

(declare-fun b_free!12565 () Bool)

(declare-fun b_next!12565 () Bool)

(assert (=> start!70324 (= b_free!12565 (not b_next!12565))))

(declare-fun tp!44412 () Bool)

(declare-fun b_and!21355 () Bool)

(assert (=> start!70324 (= tp!44412 b_and!21355)))

(declare-fun mapIsEmpty!22996 () Bool)

(declare-fun mapRes!22996 () Bool)

(assert (=> mapIsEmpty!22996 mapRes!22996))

(declare-fun b!816066 () Bool)

(declare-fun res!557025 () Bool)

(declare-fun e!452554 () Bool)

(assert (=> b!816066 (=> (not res!557025) (not e!452554))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24035 0))(
  ( (V!24036 (val!7185 Int)) )
))
(declare-datatypes ((ValueCell!6722 0))(
  ( (ValueCellFull!6722 (v!9612 V!24035)) (EmptyCell!6722) )
))
(declare-datatypes ((array!44749 0))(
  ( (array!44750 (arr!21429 (Array (_ BitVec 32) ValueCell!6722)) (size!21849 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44749)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((array!44751 0))(
  ( (array!44752 (arr!21430 (Array (_ BitVec 32) (_ BitVec 64))) (size!21850 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44751)

(assert (=> b!816066 (= res!557025 (and (= (size!21849 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21850 _keys!976) (size!21849 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!816067 () Bool)

(declare-fun res!557024 () Bool)

(assert (=> b!816067 (=> (not res!557024) (not e!452554))))

(declare-datatypes ((List!15156 0))(
  ( (Nil!15153) (Cons!15152 (h!16287 (_ BitVec 64)) (t!21467 List!15156)) )
))
(declare-fun arrayNoDuplicates!0 (array!44751 (_ BitVec 32) List!15156) Bool)

(assert (=> b!816067 (= res!557024 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15153))))

(declare-fun b!816068 () Bool)

(declare-fun res!557027 () Bool)

(assert (=> b!816068 (=> (not res!557027) (not e!452554))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44751 (_ BitVec 32)) Bool)

(assert (=> b!816068 (= res!557027 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!816069 () Bool)

(declare-fun e!452555 () Bool)

(declare-fun tp_is_empty!14275 () Bool)

(assert (=> b!816069 (= e!452555 tp_is_empty!14275)))

(declare-fun b!816070 () Bool)

(declare-fun e!452553 () Bool)

(declare-fun e!452552 () Bool)

(assert (=> b!816070 (= e!452553 (and e!452552 mapRes!22996))))

(declare-fun condMapEmpty!22996 () Bool)

(declare-fun mapDefault!22996 () ValueCell!6722)

(assert (=> b!816070 (= condMapEmpty!22996 (= (arr!21429 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6722)) mapDefault!22996)))))

(declare-fun res!557026 () Bool)

(assert (=> start!70324 (=> (not res!557026) (not e!452554))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70324 (= res!557026 (validMask!0 mask!1312))))

(assert (=> start!70324 e!452554))

(assert (=> start!70324 tp_is_empty!14275))

(declare-fun array_inv!17189 (array!44751) Bool)

(assert (=> start!70324 (array_inv!17189 _keys!976)))

(assert (=> start!70324 true))

(declare-fun array_inv!17190 (array!44749) Bool)

(assert (=> start!70324 (and (array_inv!17190 _values!788) e!452553)))

(assert (=> start!70324 tp!44412))

(declare-fun mapNonEmpty!22996 () Bool)

(declare-fun tp!44413 () Bool)

(assert (=> mapNonEmpty!22996 (= mapRes!22996 (and tp!44413 e!452555))))

(declare-fun mapKey!22996 () (_ BitVec 32))

(declare-fun mapRest!22996 () (Array (_ BitVec 32) ValueCell!6722))

(declare-fun mapValue!22996 () ValueCell!6722)

(assert (=> mapNonEmpty!22996 (= (arr!21429 _values!788) (store mapRest!22996 mapKey!22996 mapValue!22996))))

(declare-fun b!816071 () Bool)

(assert (=> b!816071 (= e!452552 tp_is_empty!14275)))

(declare-fun b!816072 () Bool)

(assert (=> b!816072 (= e!452554 (not true))))

(declare-datatypes ((tuple2!9340 0))(
  ( (tuple2!9341 (_1!4681 (_ BitVec 64)) (_2!4681 V!24035)) )
))
(declare-datatypes ((List!15157 0))(
  ( (Nil!15154) (Cons!15153 (h!16288 tuple2!9340) (t!21468 List!15157)) )
))
(declare-datatypes ((ListLongMap!8165 0))(
  ( (ListLongMap!8166 (toList!4098 List!15157)) )
))
(declare-fun lt!365289 () ListLongMap!8165)

(declare-fun lt!365288 () ListLongMap!8165)

(assert (=> b!816072 (= lt!365289 lt!365288)))

(declare-datatypes ((Unit!27763 0))(
  ( (Unit!27764) )
))
(declare-fun lt!365290 () Unit!27763)

(declare-fun zeroValueAfter!34 () V!24035)

(declare-fun minValue!754 () V!24035)

(declare-fun defaultEntry!796 () Int)

(declare-fun zeroValueBefore!34 () V!24035)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!293 (array!44751 array!44749 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24035 V!24035 V!24035 V!24035 (_ BitVec 32) Int) Unit!27763)

(assert (=> b!816072 (= lt!365290 (lemmaNoChangeToArrayThenSameMapNoExtras!293 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2205 (array!44751 array!44749 (_ BitVec 32) (_ BitVec 32) V!24035 V!24035 (_ BitVec 32) Int) ListLongMap!8165)

(assert (=> b!816072 (= lt!365288 (getCurrentListMapNoExtraKeys!2205 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!816072 (= lt!365289 (getCurrentListMapNoExtraKeys!2205 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70324 res!557026) b!816066))

(assert (= (and b!816066 res!557025) b!816068))

(assert (= (and b!816068 res!557027) b!816067))

(assert (= (and b!816067 res!557024) b!816072))

(assert (= (and b!816070 condMapEmpty!22996) mapIsEmpty!22996))

(assert (= (and b!816070 (not condMapEmpty!22996)) mapNonEmpty!22996))

(get-info :version)

(assert (= (and mapNonEmpty!22996 ((_ is ValueCellFull!6722) mapValue!22996)) b!816069))

(assert (= (and b!816070 ((_ is ValueCellFull!6722) mapDefault!22996)) b!816071))

(assert (= start!70324 b!816070))

(declare-fun m!758157 () Bool)

(assert (=> b!816072 m!758157))

(declare-fun m!758159 () Bool)

(assert (=> b!816072 m!758159))

(declare-fun m!758161 () Bool)

(assert (=> b!816072 m!758161))

(declare-fun m!758163 () Bool)

(assert (=> mapNonEmpty!22996 m!758163))

(declare-fun m!758165 () Bool)

(assert (=> b!816067 m!758165))

(declare-fun m!758167 () Bool)

(assert (=> start!70324 m!758167))

(declare-fun m!758169 () Bool)

(assert (=> start!70324 m!758169))

(declare-fun m!758171 () Bool)

(assert (=> start!70324 m!758171))

(declare-fun m!758173 () Bool)

(assert (=> b!816068 m!758173))

(check-sat (not b!816068) (not b!816072) (not mapNonEmpty!22996) (not b!816067) b_and!21355 (not b_next!12565) tp_is_empty!14275 (not start!70324))
(check-sat b_and!21355 (not b_next!12565))
