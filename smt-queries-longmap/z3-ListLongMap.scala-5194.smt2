; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70166 () Bool)

(assert start!70166)

(declare-fun b_free!12573 () Bool)

(declare-fun b_next!12573 () Bool)

(assert (=> start!70166 (= b_free!12573 (not b_next!12573))))

(declare-fun tp!44436 () Bool)

(declare-fun b_and!21353 () Bool)

(assert (=> start!70166 (= tp!44436 b_and!21353)))

(declare-fun b!815256 () Bool)

(declare-fun e!452036 () Bool)

(declare-fun e!452037 () Bool)

(declare-fun mapRes!23008 () Bool)

(assert (=> b!815256 (= e!452036 (and e!452037 mapRes!23008))))

(declare-fun condMapEmpty!23008 () Bool)

(declare-datatypes ((V!24045 0))(
  ( (V!24046 (val!7189 Int)) )
))
(declare-datatypes ((ValueCell!6726 0))(
  ( (ValueCellFull!6726 (v!9616 V!24045)) (EmptyCell!6726) )
))
(declare-datatypes ((array!44768 0))(
  ( (array!44769 (arr!21443 (Array (_ BitVec 32) ValueCell!6726)) (size!21864 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44768)

(declare-fun mapDefault!23008 () ValueCell!6726)

(assert (=> b!815256 (= condMapEmpty!23008 (= (arr!21443 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6726)) mapDefault!23008)))))

(declare-fun b!815257 () Bool)

(declare-fun res!556727 () Bool)

(declare-fun e!452034 () Bool)

(assert (=> b!815257 (=> (not res!556727) (not e!452034))))

(declare-datatypes ((array!44770 0))(
  ( (array!44771 (arr!21444 (Array (_ BitVec 32) (_ BitVec 64))) (size!21865 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44770)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44770 (_ BitVec 32)) Bool)

(assert (=> b!815257 (= res!556727 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!23008 () Bool)

(declare-fun tp!44437 () Bool)

(declare-fun e!452035 () Bool)

(assert (=> mapNonEmpty!23008 (= mapRes!23008 (and tp!44437 e!452035))))

(declare-fun mapRest!23008 () (Array (_ BitVec 32) ValueCell!6726))

(declare-fun mapValue!23008 () ValueCell!6726)

(declare-fun mapKey!23008 () (_ BitVec 32))

(assert (=> mapNonEmpty!23008 (= (arr!21443 _values!788) (store mapRest!23008 mapKey!23008 mapValue!23008))))

(declare-fun b!815258 () Bool)

(declare-fun res!556726 () Bool)

(assert (=> b!815258 (=> (not res!556726) (not e!452034))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!815258 (= res!556726 (and (= (size!21864 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21865 _keys!976) (size!21864 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!815259 () Bool)

(declare-fun tp_is_empty!14283 () Bool)

(assert (=> b!815259 (= e!452037 tp_is_empty!14283)))

(declare-fun b!815260 () Bool)

(assert (=> b!815260 (= e!452035 tp_is_empty!14283)))

(declare-fun b!815261 () Bool)

(declare-fun res!556728 () Bool)

(assert (=> b!815261 (=> (not res!556728) (not e!452034))))

(declare-datatypes ((List!15259 0))(
  ( (Nil!15256) (Cons!15255 (h!16384 (_ BitVec 64)) (t!21578 List!15259)) )
))
(declare-fun arrayNoDuplicates!0 (array!44770 (_ BitVec 32) List!15259) Bool)

(assert (=> b!815261 (= res!556728 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15256))))

(declare-fun res!556729 () Bool)

(assert (=> start!70166 (=> (not res!556729) (not e!452034))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70166 (= res!556729 (validMask!0 mask!1312))))

(assert (=> start!70166 e!452034))

(assert (=> start!70166 tp_is_empty!14283))

(declare-fun array_inv!17157 (array!44770) Bool)

(assert (=> start!70166 (array_inv!17157 _keys!976)))

(assert (=> start!70166 true))

(declare-fun array_inv!17158 (array!44768) Bool)

(assert (=> start!70166 (and (array_inv!17158 _values!788) e!452036)))

(assert (=> start!70166 tp!44436))

(declare-fun b!815262 () Bool)

(assert (=> b!815262 (= e!452034 (not true))))

(declare-datatypes ((tuple2!9428 0))(
  ( (tuple2!9429 (_1!4725 (_ BitVec 64)) (_2!4725 V!24045)) )
))
(declare-datatypes ((List!15260 0))(
  ( (Nil!15257) (Cons!15256 (h!16385 tuple2!9428) (t!21579 List!15260)) )
))
(declare-datatypes ((ListLongMap!8251 0))(
  ( (ListLongMap!8252 (toList!4141 List!15260)) )
))
(declare-fun lt!364970 () ListLongMap!8251)

(declare-fun lt!364972 () ListLongMap!8251)

(assert (=> b!815262 (= lt!364970 lt!364972)))

(declare-fun zeroValueAfter!34 () V!24045)

(declare-fun minValue!754 () V!24045)

(declare-fun defaultEntry!796 () Int)

(declare-fun zeroValueBefore!34 () V!24045)

(declare-datatypes ((Unit!27780 0))(
  ( (Unit!27781) )
))
(declare-fun lt!364971 () Unit!27780)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!301 (array!44770 array!44768 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24045 V!24045 V!24045 V!24045 (_ BitVec 32) Int) Unit!27780)

(assert (=> b!815262 (= lt!364971 (lemmaNoChangeToArrayThenSameMapNoExtras!301 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2191 (array!44770 array!44768 (_ BitVec 32) (_ BitVec 32) V!24045 V!24045 (_ BitVec 32) Int) ListLongMap!8251)

(assert (=> b!815262 (= lt!364972 (getCurrentListMapNoExtraKeys!2191 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815262 (= lt!364970 (getCurrentListMapNoExtraKeys!2191 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23008 () Bool)

(assert (=> mapIsEmpty!23008 mapRes!23008))

(assert (= (and start!70166 res!556729) b!815258))

(assert (= (and b!815258 res!556726) b!815257))

(assert (= (and b!815257 res!556727) b!815261))

(assert (= (and b!815261 res!556728) b!815262))

(assert (= (and b!815256 condMapEmpty!23008) mapIsEmpty!23008))

(assert (= (and b!815256 (not condMapEmpty!23008)) mapNonEmpty!23008))

(get-info :version)

(assert (= (and mapNonEmpty!23008 ((_ is ValueCellFull!6726) mapValue!23008)) b!815260))

(assert (= (and b!815256 ((_ is ValueCellFull!6726) mapDefault!23008)) b!815259))

(assert (= start!70166 b!815256))

(declare-fun m!756947 () Bool)

(assert (=> b!815261 m!756947))

(declare-fun m!756949 () Bool)

(assert (=> start!70166 m!756949))

(declare-fun m!756951 () Bool)

(assert (=> start!70166 m!756951))

(declare-fun m!756953 () Bool)

(assert (=> start!70166 m!756953))

(declare-fun m!756955 () Bool)

(assert (=> b!815257 m!756955))

(declare-fun m!756957 () Bool)

(assert (=> mapNonEmpty!23008 m!756957))

(declare-fun m!756959 () Bool)

(assert (=> b!815262 m!756959))

(declare-fun m!756961 () Bool)

(assert (=> b!815262 m!756961))

(declare-fun m!756963 () Bool)

(assert (=> b!815262 m!756963))

(check-sat (not start!70166) (not b_next!12573) (not b!815262) (not b!815261) b_and!21353 (not b!815257) tp_is_empty!14283 (not mapNonEmpty!23008))
(check-sat b_and!21353 (not b_next!12573))
