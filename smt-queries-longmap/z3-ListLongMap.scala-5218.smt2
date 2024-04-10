; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70360 () Bool)

(assert start!70360)

(declare-fun b_free!12717 () Bool)

(declare-fun b_next!12717 () Bool)

(assert (=> start!70360 (= b_free!12717 (not b_next!12717))))

(declare-fun tp!44877 () Bool)

(declare-fun b_and!21529 () Bool)

(assert (=> start!70360 (= tp!44877 b_and!21529)))

(declare-fun b!817384 () Bool)

(declare-fun e!453555 () Bool)

(declare-fun e!453552 () Bool)

(declare-fun mapRes!23233 () Bool)

(assert (=> b!817384 (= e!453555 (and e!453552 mapRes!23233))))

(declare-fun condMapEmpty!23233 () Bool)

(declare-datatypes ((V!24237 0))(
  ( (V!24238 (val!7261 Int)) )
))
(declare-datatypes ((ValueCell!6798 0))(
  ( (ValueCellFull!6798 (v!9690 V!24237)) (EmptyCell!6798) )
))
(declare-datatypes ((array!45054 0))(
  ( (array!45055 (arr!21583 (Array (_ BitVec 32) ValueCell!6798)) (size!22004 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45054)

(declare-fun mapDefault!23233 () ValueCell!6798)

(assert (=> b!817384 (= condMapEmpty!23233 (= (arr!21583 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6798)) mapDefault!23233)))))

(declare-fun b!817385 () Bool)

(declare-fun res!557950 () Bool)

(declare-fun e!453554 () Bool)

(assert (=> b!817385 (=> (not res!557950) (not e!453554))))

(declare-datatypes ((array!45056 0))(
  ( (array!45057 (arr!21584 (Array (_ BitVec 32) (_ BitVec 64))) (size!22005 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45056)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45056 (_ BitVec 32)) Bool)

(assert (=> b!817385 (= res!557950 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!817386 () Bool)

(declare-fun res!557947 () Bool)

(assert (=> b!817386 (=> (not res!557947) (not e!453554))))

(declare-datatypes ((List!15371 0))(
  ( (Nil!15368) (Cons!15367 (h!16496 (_ BitVec 64)) (t!21696 List!15371)) )
))
(declare-fun arrayNoDuplicates!0 (array!45056 (_ BitVec 32) List!15371) Bool)

(assert (=> b!817386 (= res!557947 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15368))))

(declare-fun b!817387 () Bool)

(assert (=> b!817387 (= e!453554 (not true))))

(declare-datatypes ((tuple2!9542 0))(
  ( (tuple2!9543 (_1!4782 (_ BitVec 64)) (_2!4782 V!24237)) )
))
(declare-datatypes ((List!15372 0))(
  ( (Nil!15369) (Cons!15368 (h!16497 tuple2!9542) (t!21697 List!15372)) )
))
(declare-datatypes ((ListLongMap!8365 0))(
  ( (ListLongMap!8366 (toList!4198 List!15372)) )
))
(declare-fun lt!366228 () ListLongMap!8365)

(declare-fun lt!366226 () ListLongMap!8365)

(assert (=> b!817387 (= lt!366228 lt!366226)))

(declare-fun zeroValueBefore!34 () V!24237)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24237)

(declare-fun minValue!754 () V!24237)

(declare-datatypes ((Unit!27880 0))(
  ( (Unit!27881) )
))
(declare-fun lt!366227 () Unit!27880)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!349 (array!45056 array!45054 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24237 V!24237 V!24237 V!24237 (_ BitVec 32) Int) Unit!27880)

(assert (=> b!817387 (= lt!366227 (lemmaNoChangeToArrayThenSameMapNoExtras!349 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2239 (array!45056 array!45054 (_ BitVec 32) (_ BitVec 32) V!24237 V!24237 (_ BitVec 32) Int) ListLongMap!8365)

(assert (=> b!817387 (= lt!366226 (getCurrentListMapNoExtraKeys!2239 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!817387 (= lt!366228 (getCurrentListMapNoExtraKeys!2239 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!817388 () Bool)

(declare-fun tp_is_empty!14427 () Bool)

(assert (=> b!817388 (= e!453552 tp_is_empty!14427)))

(declare-fun mapNonEmpty!23233 () Bool)

(declare-fun tp!44878 () Bool)

(declare-fun e!453551 () Bool)

(assert (=> mapNonEmpty!23233 (= mapRes!23233 (and tp!44878 e!453551))))

(declare-fun mapKey!23233 () (_ BitVec 32))

(declare-fun mapRest!23233 () (Array (_ BitVec 32) ValueCell!6798))

(declare-fun mapValue!23233 () ValueCell!6798)

(assert (=> mapNonEmpty!23233 (= (arr!21583 _values!788) (store mapRest!23233 mapKey!23233 mapValue!23233))))

(declare-fun res!557949 () Bool)

(assert (=> start!70360 (=> (not res!557949) (not e!453554))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70360 (= res!557949 (validMask!0 mask!1312))))

(assert (=> start!70360 e!453554))

(assert (=> start!70360 tp_is_empty!14427))

(declare-fun array_inv!17269 (array!45056) Bool)

(assert (=> start!70360 (array_inv!17269 _keys!976)))

(assert (=> start!70360 true))

(declare-fun array_inv!17270 (array!45054) Bool)

(assert (=> start!70360 (and (array_inv!17270 _values!788) e!453555)))

(assert (=> start!70360 tp!44877))

(declare-fun b!817383 () Bool)

(assert (=> b!817383 (= e!453551 tp_is_empty!14427)))

(declare-fun b!817389 () Bool)

(declare-fun res!557948 () Bool)

(assert (=> b!817389 (=> (not res!557948) (not e!453554))))

(assert (=> b!817389 (= res!557948 (and (= (size!22004 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22005 _keys!976) (size!22004 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!23233 () Bool)

(assert (=> mapIsEmpty!23233 mapRes!23233))

(assert (= (and start!70360 res!557949) b!817389))

(assert (= (and b!817389 res!557948) b!817385))

(assert (= (and b!817385 res!557950) b!817386))

(assert (= (and b!817386 res!557947) b!817387))

(assert (= (and b!817384 condMapEmpty!23233) mapIsEmpty!23233))

(assert (= (and b!817384 (not condMapEmpty!23233)) mapNonEmpty!23233))

(get-info :version)

(assert (= (and mapNonEmpty!23233 ((_ is ValueCellFull!6798) mapValue!23233)) b!817383))

(assert (= (and b!817384 ((_ is ValueCellFull!6798) mapDefault!23233)) b!817388))

(assert (= start!70360 b!817384))

(declare-fun m!758973 () Bool)

(assert (=> b!817386 m!758973))

(declare-fun m!758975 () Bool)

(assert (=> mapNonEmpty!23233 m!758975))

(declare-fun m!758977 () Bool)

(assert (=> start!70360 m!758977))

(declare-fun m!758979 () Bool)

(assert (=> start!70360 m!758979))

(declare-fun m!758981 () Bool)

(assert (=> start!70360 m!758981))

(declare-fun m!758983 () Bool)

(assert (=> b!817387 m!758983))

(declare-fun m!758985 () Bool)

(assert (=> b!817387 m!758985))

(declare-fun m!758987 () Bool)

(assert (=> b!817387 m!758987))

(declare-fun m!758989 () Bool)

(assert (=> b!817385 m!758989))

(check-sat (not b_next!12717) (not mapNonEmpty!23233) (not start!70360) (not b!817385) tp_is_empty!14427 (not b!817386) b_and!21529 (not b!817387))
(check-sat b_and!21529 (not b_next!12717))
