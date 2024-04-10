; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70216 () Bool)

(assert start!70216)

(declare-fun b_free!12609 () Bool)

(declare-fun b_next!12609 () Bool)

(assert (=> start!70216 (= b_free!12609 (not b_next!12609))))

(declare-fun tp!44547 () Bool)

(declare-fun b_and!21397 () Bool)

(assert (=> start!70216 (= tp!44547 b_and!21397)))

(declare-fun mapIsEmpty!23065 () Bool)

(declare-fun mapRes!23065 () Bool)

(assert (=> mapIsEmpty!23065 mapRes!23065))

(declare-fun b!815751 () Bool)

(declare-fun res!557009 () Bool)

(declare-fun e!452396 () Bool)

(assert (=> b!815751 (=> (not res!557009) (not e!452396))))

(declare-datatypes ((array!44838 0))(
  ( (array!44839 (arr!21477 (Array (_ BitVec 32) (_ BitVec 64))) (size!21898 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44838)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24093 0))(
  ( (V!24094 (val!7207 Int)) )
))
(declare-datatypes ((ValueCell!6744 0))(
  ( (ValueCellFull!6744 (v!9634 V!24093)) (EmptyCell!6744) )
))
(declare-datatypes ((array!44840 0))(
  ( (array!44841 (arr!21478 (Array (_ BitVec 32) ValueCell!6744)) (size!21899 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44840)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!815751 (= res!557009 (and (= (size!21899 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21898 _keys!976) (size!21899 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!557005 () Bool)

(assert (=> start!70216 (=> (not res!557005) (not e!452396))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70216 (= res!557005 (validMask!0 mask!1312))))

(assert (=> start!70216 e!452396))

(declare-fun tp_is_empty!14319 () Bool)

(assert (=> start!70216 tp_is_empty!14319))

(declare-fun array_inv!17187 (array!44838) Bool)

(assert (=> start!70216 (array_inv!17187 _keys!976)))

(assert (=> start!70216 true))

(declare-fun e!452394 () Bool)

(declare-fun array_inv!17188 (array!44840) Bool)

(assert (=> start!70216 (and (array_inv!17188 _values!788) e!452394)))

(assert (=> start!70216 tp!44547))

(declare-fun mapNonEmpty!23065 () Bool)

(declare-fun tp!44548 () Bool)

(declare-fun e!452395 () Bool)

(assert (=> mapNonEmpty!23065 (= mapRes!23065 (and tp!44548 e!452395))))

(declare-fun mapRest!23065 () (Array (_ BitVec 32) ValueCell!6744))

(declare-fun mapKey!23065 () (_ BitVec 32))

(declare-fun mapValue!23065 () ValueCell!6744)

(assert (=> mapNonEmpty!23065 (= (arr!21478 _values!788) (store mapRest!23065 mapKey!23065 mapValue!23065))))

(declare-fun b!815752 () Bool)

(declare-fun res!557006 () Bool)

(assert (=> b!815752 (=> (not res!557006) (not e!452396))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44838 (_ BitVec 32)) Bool)

(assert (=> b!815752 (= res!557006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!815753 () Bool)

(declare-fun e!452391 () Bool)

(assert (=> b!815753 (= e!452391 tp_is_empty!14319)))

(declare-fun b!815754 () Bool)

(assert (=> b!815754 (= e!452395 tp_is_empty!14319)))

(declare-fun b!815755 () Bool)

(assert (=> b!815755 (= e!452394 (and e!452391 mapRes!23065))))

(declare-fun condMapEmpty!23065 () Bool)

(declare-fun mapDefault!23065 () ValueCell!6744)

(assert (=> b!815755 (= condMapEmpty!23065 (= (arr!21478 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6744)) mapDefault!23065)))))

(declare-fun b!815756 () Bool)

(declare-fun e!452392 () Bool)

(assert (=> b!815756 (= e!452396 (not e!452392))))

(declare-fun res!557008 () Bool)

(assert (=> b!815756 (=> res!557008 e!452392)))

(assert (=> b!815756 (= res!557008 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9456 0))(
  ( (tuple2!9457 (_1!4739 (_ BitVec 64)) (_2!4739 V!24093)) )
))
(declare-datatypes ((List!15287 0))(
  ( (Nil!15284) (Cons!15283 (h!16412 tuple2!9456) (t!21608 List!15287)) )
))
(declare-datatypes ((ListLongMap!8279 0))(
  ( (ListLongMap!8280 (toList!4155 List!15287)) )
))
(declare-fun lt!365238 () ListLongMap!8279)

(declare-fun lt!365239 () ListLongMap!8279)

(assert (=> b!815756 (= lt!365238 lt!365239)))

(declare-datatypes ((Unit!27804 0))(
  ( (Unit!27805) )
))
(declare-fun lt!365237 () Unit!27804)

(declare-fun zeroValueBefore!34 () V!24093)

(declare-fun zeroValueAfter!34 () V!24093)

(declare-fun minValue!754 () V!24093)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!313 (array!44838 array!44840 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24093 V!24093 V!24093 V!24093 (_ BitVec 32) Int) Unit!27804)

(assert (=> b!815756 (= lt!365237 (lemmaNoChangeToArrayThenSameMapNoExtras!313 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2203 (array!44838 array!44840 (_ BitVec 32) (_ BitVec 32) V!24093 V!24093 (_ BitVec 32) Int) ListLongMap!8279)

(assert (=> b!815756 (= lt!365239 (getCurrentListMapNoExtraKeys!2203 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815756 (= lt!365238 (getCurrentListMapNoExtraKeys!2203 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!815757 () Bool)

(declare-fun res!557007 () Bool)

(assert (=> b!815757 (=> (not res!557007) (not e!452396))))

(declare-datatypes ((List!15288 0))(
  ( (Nil!15285) (Cons!15284 (h!16413 (_ BitVec 64)) (t!21609 List!15288)) )
))
(declare-fun arrayNoDuplicates!0 (array!44838 (_ BitVec 32) List!15288) Bool)

(assert (=> b!815757 (= res!557007 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15285))))

(declare-fun b!815758 () Bool)

(assert (=> b!815758 (= e!452392 true)))

(declare-fun lt!365236 () ListLongMap!8279)

(declare-fun getCurrentListMap!2383 (array!44838 array!44840 (_ BitVec 32) (_ BitVec 32) V!24093 V!24093 (_ BitVec 32) Int) ListLongMap!8279)

(assert (=> b!815758 (= lt!365236 (getCurrentListMap!2383 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365240 () ListLongMap!8279)

(declare-fun +!1789 (ListLongMap!8279 tuple2!9456) ListLongMap!8279)

(assert (=> b!815758 (= lt!365240 (+!1789 (getCurrentListMap!2383 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9457 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and start!70216 res!557005) b!815751))

(assert (= (and b!815751 res!557009) b!815752))

(assert (= (and b!815752 res!557006) b!815757))

(assert (= (and b!815757 res!557007) b!815756))

(assert (= (and b!815756 (not res!557008)) b!815758))

(assert (= (and b!815755 condMapEmpty!23065) mapIsEmpty!23065))

(assert (= (and b!815755 (not condMapEmpty!23065)) mapNonEmpty!23065))

(get-info :version)

(assert (= (and mapNonEmpty!23065 ((_ is ValueCellFull!6744) mapValue!23065)) b!815754))

(assert (= (and b!815755 ((_ is ValueCellFull!6744) mapDefault!23065)) b!815753))

(assert (= start!70216 b!815755))

(declare-fun m!757397 () Bool)

(assert (=> start!70216 m!757397))

(declare-fun m!757399 () Bool)

(assert (=> start!70216 m!757399))

(declare-fun m!757401 () Bool)

(assert (=> start!70216 m!757401))

(declare-fun m!757403 () Bool)

(assert (=> b!815758 m!757403))

(declare-fun m!757405 () Bool)

(assert (=> b!815758 m!757405))

(assert (=> b!815758 m!757405))

(declare-fun m!757407 () Bool)

(assert (=> b!815758 m!757407))

(declare-fun m!757409 () Bool)

(assert (=> b!815756 m!757409))

(declare-fun m!757411 () Bool)

(assert (=> b!815756 m!757411))

(declare-fun m!757413 () Bool)

(assert (=> b!815756 m!757413))

(declare-fun m!757415 () Bool)

(assert (=> b!815752 m!757415))

(declare-fun m!757417 () Bool)

(assert (=> b!815757 m!757417))

(declare-fun m!757419 () Bool)

(assert (=> mapNonEmpty!23065 m!757419))

(check-sat (not b!815758) (not mapNonEmpty!23065) (not start!70216) (not b!815752) b_and!21397 (not b!815756) (not b!815757) tp_is_empty!14319 (not b_next!12609))
(check-sat b_and!21397 (not b_next!12609))
