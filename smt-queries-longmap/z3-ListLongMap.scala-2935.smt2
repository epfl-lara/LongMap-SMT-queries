; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41784 () Bool)

(assert start!41784)

(declare-fun b_free!11419 () Bool)

(declare-fun b_next!11419 () Bool)

(assert (=> start!41784 (= b_free!11419 (not b_next!11419))))

(declare-fun tp!40264 () Bool)

(declare-fun b_and!19797 () Bool)

(assert (=> start!41784 (= tp!40264 b_and!19797)))

(declare-fun mapIsEmpty!20956 () Bool)

(declare-fun mapRes!20956 () Bool)

(assert (=> mapIsEmpty!20956 mapRes!20956))

(declare-fun res!278988 () Bool)

(declare-fun e!272920 () Bool)

(assert (=> start!41784 (=> (not res!278988) (not e!272920))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41784 (= res!278988 (validMask!0 mask!1365))))

(assert (=> start!41784 e!272920))

(declare-fun tp_is_empty!12847 () Bool)

(assert (=> start!41784 tp_is_empty!12847))

(assert (=> start!41784 tp!40264))

(assert (=> start!41784 true))

(declare-datatypes ((array!29466 0))(
  ( (array!29467 (arr!14161 (Array (_ BitVec 32) (_ BitVec 64))) (size!14513 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29466)

(declare-fun array_inv!10308 (array!29466) Bool)

(assert (=> start!41784 (array_inv!10308 _keys!1025)))

(declare-datatypes ((V!18235 0))(
  ( (V!18236 (val!6468 Int)) )
))
(declare-datatypes ((ValueCell!6080 0))(
  ( (ValueCellFull!6080 (v!8757 V!18235)) (EmptyCell!6080) )
))
(declare-datatypes ((array!29468 0))(
  ( (array!29469 (arr!14162 (Array (_ BitVec 32) ValueCell!6080)) (size!14514 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29468)

(declare-fun e!272918 () Bool)

(declare-fun array_inv!10309 (array!29468) Bool)

(assert (=> start!41784 (and (array_inv!10309 _values!833) e!272918)))

(declare-fun b!466685 () Bool)

(declare-fun e!272916 () Bool)

(assert (=> b!466685 (= e!272916 true)))

(declare-datatypes ((tuple2!8420 0))(
  ( (tuple2!8421 (_1!4221 (_ BitVec 64)) (_2!4221 V!18235)) )
))
(declare-datatypes ((List!8500 0))(
  ( (Nil!8497) (Cons!8496 (h!9352 tuple2!8420) (t!14444 List!8500)) )
))
(declare-datatypes ((ListLongMap!7335 0))(
  ( (ListLongMap!7336 (toList!3683 List!8500)) )
))
(declare-fun lt!210996 () ListLongMap!7335)

(declare-fun zeroValue!794 () V!18235)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18235)

(declare-fun getCurrentListMap!2131 (array!29466 array!29468 (_ BitVec 32) (_ BitVec 32) V!18235 V!18235 (_ BitVec 32) Int) ListLongMap!7335)

(assert (=> b!466685 (= lt!210996 (getCurrentListMap!2131 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!18235)

(declare-fun lt!210999 () ListLongMap!7335)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun +!1680 (ListLongMap!7335 tuple2!8420) ListLongMap!7335)

(assert (=> b!466685 (= lt!210999 (+!1680 (getCurrentListMap!2131 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8421 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!466686 () Bool)

(declare-fun res!278992 () Bool)

(assert (=> b!466686 (=> (not res!278992) (not e!272920))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29466 (_ BitVec 32)) Bool)

(assert (=> b!466686 (= res!278992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!466687 () Bool)

(declare-fun e!272919 () Bool)

(assert (=> b!466687 (= e!272918 (and e!272919 mapRes!20956))))

(declare-fun condMapEmpty!20956 () Bool)

(declare-fun mapDefault!20956 () ValueCell!6080)

(assert (=> b!466687 (= condMapEmpty!20956 (= (arr!14162 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6080)) mapDefault!20956)))))

(declare-fun b!466688 () Bool)

(declare-fun res!278989 () Bool)

(assert (=> b!466688 (=> (not res!278989) (not e!272920))))

(declare-datatypes ((List!8501 0))(
  ( (Nil!8498) (Cons!8497 (h!9353 (_ BitVec 64)) (t!14445 List!8501)) )
))
(declare-fun arrayNoDuplicates!0 (array!29466 (_ BitVec 32) List!8501) Bool)

(assert (=> b!466688 (= res!278989 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8498))))

(declare-fun b!466689 () Bool)

(assert (=> b!466689 (= e!272920 (not e!272916))))

(declare-fun res!278991 () Bool)

(assert (=> b!466689 (=> res!278991 e!272916)))

(assert (=> b!466689 (= res!278991 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!210997 () ListLongMap!7335)

(declare-fun lt!210998 () ListLongMap!7335)

(assert (=> b!466689 (= lt!210997 lt!210998)))

(declare-datatypes ((Unit!13578 0))(
  ( (Unit!13579) )
))
(declare-fun lt!210995 () Unit!13578)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!66 (array!29466 array!29468 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18235 V!18235 V!18235 V!18235 (_ BitVec 32) Int) Unit!13578)

(assert (=> b!466689 (= lt!210995 (lemmaNoChangeToArrayThenSameMapNoExtras!66 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1906 (array!29466 array!29468 (_ BitVec 32) (_ BitVec 32) V!18235 V!18235 (_ BitVec 32) Int) ListLongMap!7335)

(assert (=> b!466689 (= lt!210998 (getCurrentListMapNoExtraKeys!1906 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!466689 (= lt!210997 (getCurrentListMapNoExtraKeys!1906 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!20956 () Bool)

(declare-fun tp!40263 () Bool)

(declare-fun e!272915 () Bool)

(assert (=> mapNonEmpty!20956 (= mapRes!20956 (and tp!40263 e!272915))))

(declare-fun mapKey!20956 () (_ BitVec 32))

(declare-fun mapValue!20956 () ValueCell!6080)

(declare-fun mapRest!20956 () (Array (_ BitVec 32) ValueCell!6080))

(assert (=> mapNonEmpty!20956 (= (arr!14162 _values!833) (store mapRest!20956 mapKey!20956 mapValue!20956))))

(declare-fun b!466690 () Bool)

(assert (=> b!466690 (= e!272915 tp_is_empty!12847)))

(declare-fun b!466691 () Bool)

(declare-fun res!278990 () Bool)

(assert (=> b!466691 (=> (not res!278990) (not e!272920))))

(assert (=> b!466691 (= res!278990 (and (= (size!14514 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14513 _keys!1025) (size!14514 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!466692 () Bool)

(assert (=> b!466692 (= e!272919 tp_is_empty!12847)))

(assert (= (and start!41784 res!278988) b!466691))

(assert (= (and b!466691 res!278990) b!466686))

(assert (= (and b!466686 res!278992) b!466688))

(assert (= (and b!466688 res!278989) b!466689))

(assert (= (and b!466689 (not res!278991)) b!466685))

(assert (= (and b!466687 condMapEmpty!20956) mapIsEmpty!20956))

(assert (= (and b!466687 (not condMapEmpty!20956)) mapNonEmpty!20956))

(get-info :version)

(assert (= (and mapNonEmpty!20956 ((_ is ValueCellFull!6080) mapValue!20956)) b!466690))

(assert (= (and b!466687 ((_ is ValueCellFull!6080) mapDefault!20956)) b!466692))

(assert (= start!41784 b!466687))

(declare-fun m!449145 () Bool)

(assert (=> b!466686 m!449145))

(declare-fun m!449147 () Bool)

(assert (=> mapNonEmpty!20956 m!449147))

(declare-fun m!449149 () Bool)

(assert (=> b!466685 m!449149))

(declare-fun m!449151 () Bool)

(assert (=> b!466685 m!449151))

(assert (=> b!466685 m!449151))

(declare-fun m!449153 () Bool)

(assert (=> b!466685 m!449153))

(declare-fun m!449155 () Bool)

(assert (=> start!41784 m!449155))

(declare-fun m!449157 () Bool)

(assert (=> start!41784 m!449157))

(declare-fun m!449159 () Bool)

(assert (=> start!41784 m!449159))

(declare-fun m!449161 () Bool)

(assert (=> b!466689 m!449161))

(declare-fun m!449163 () Bool)

(assert (=> b!466689 m!449163))

(declare-fun m!449165 () Bool)

(assert (=> b!466689 m!449165))

(declare-fun m!449167 () Bool)

(assert (=> b!466688 m!449167))

(check-sat (not mapNonEmpty!20956) b_and!19797 (not b!466686) (not b!466685) (not start!41784) (not b!466688) (not b_next!11419) tp_is_empty!12847 (not b!466689))
(check-sat b_and!19797 (not b_next!11419))
