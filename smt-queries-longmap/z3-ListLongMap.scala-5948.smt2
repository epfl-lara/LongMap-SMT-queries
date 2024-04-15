; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77496 () Bool)

(assert start!77496)

(declare-fun b_free!16099 () Bool)

(declare-fun b_next!16099 () Bool)

(assert (=> start!77496 (= b_free!16099 (not b_next!16099))))

(declare-fun tp!56559 () Bool)

(declare-fun b_and!26439 () Bool)

(assert (=> start!77496 (= tp!56559 b_and!26439)))

(declare-fun b!902934 () Bool)

(declare-fun res!609281 () Bool)

(declare-fun e!505843 () Bool)

(assert (=> b!902934 (=> (not res!609281) (not e!505843))))

(declare-datatypes ((V!29655 0))(
  ( (V!29656 (val!9309 Int)) )
))
(declare-datatypes ((ValueCell!8777 0))(
  ( (ValueCellFull!8777 (v!11813 V!29655)) (EmptyCell!8777) )
))
(declare-datatypes ((array!53075 0))(
  ( (array!53076 (arr!25497 (Array (_ BitVec 32) ValueCell!8777)) (size!25958 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53075)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53077 0))(
  ( (array!53078 (arr!25498 (Array (_ BitVec 32) (_ BitVec 64))) (size!25959 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53077)

(assert (=> b!902934 (= res!609281 (and (= (size!25958 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25959 _keys!1386) (size!25958 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!902935 () Bool)

(declare-fun res!609282 () Bool)

(assert (=> b!902935 (=> (not res!609282) (not e!505843))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53077 (_ BitVec 32)) Bool)

(assert (=> b!902935 (= res!609282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!902936 () Bool)

(assert (=> b!902936 (= e!505843 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!407734 () Bool)

(declare-fun zeroValue!1094 () V!29655)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!29655)

(declare-datatypes ((tuple2!12112 0))(
  ( (tuple2!12113 (_1!6067 (_ BitVec 64)) (_2!6067 V!29655)) )
))
(declare-datatypes ((List!17920 0))(
  ( (Nil!17917) (Cons!17916 (h!19062 tuple2!12112) (t!25294 List!17920)) )
))
(declare-datatypes ((ListLongMap!10799 0))(
  ( (ListLongMap!10800 (toList!5415 List!17920)) )
))
(declare-fun contains!4426 (ListLongMap!10799 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2630 (array!53077 array!53075 (_ BitVec 32) (_ BitVec 32) V!29655 V!29655 (_ BitVec 32) Int) ListLongMap!10799)

(assert (=> b!902936 (= lt!407734 (contains!4426 (getCurrentListMap!2630 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun mapIsEmpty!29488 () Bool)

(declare-fun mapRes!29488 () Bool)

(assert (=> mapIsEmpty!29488 mapRes!29488))

(declare-fun b!902937 () Bool)

(declare-fun e!505847 () Bool)

(declare-fun e!505844 () Bool)

(assert (=> b!902937 (= e!505847 (and e!505844 mapRes!29488))))

(declare-fun condMapEmpty!29488 () Bool)

(declare-fun mapDefault!29488 () ValueCell!8777)

(assert (=> b!902937 (= condMapEmpty!29488 (= (arr!25497 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8777)) mapDefault!29488)))))

(declare-fun b!902938 () Bool)

(declare-fun tp_is_empty!18517 () Bool)

(assert (=> b!902938 (= e!505844 tp_is_empty!18517)))

(declare-fun b!902940 () Bool)

(declare-fun res!609280 () Bool)

(assert (=> b!902940 (=> (not res!609280) (not e!505843))))

(declare-datatypes ((List!17921 0))(
  ( (Nil!17918) (Cons!17917 (h!19063 (_ BitVec 64)) (t!25295 List!17921)) )
))
(declare-fun arrayNoDuplicates!0 (array!53077 (_ BitVec 32) List!17921) Bool)

(assert (=> b!902940 (= res!609280 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17918))))

(declare-fun mapNonEmpty!29488 () Bool)

(declare-fun tp!56560 () Bool)

(declare-fun e!505846 () Bool)

(assert (=> mapNonEmpty!29488 (= mapRes!29488 (and tp!56560 e!505846))))

(declare-fun mapRest!29488 () (Array (_ BitVec 32) ValueCell!8777))

(declare-fun mapValue!29488 () ValueCell!8777)

(declare-fun mapKey!29488 () (_ BitVec 32))

(assert (=> mapNonEmpty!29488 (= (arr!25497 _values!1152) (store mapRest!29488 mapKey!29488 mapValue!29488))))

(declare-fun b!902939 () Bool)

(assert (=> b!902939 (= e!505846 tp_is_empty!18517)))

(declare-fun res!609279 () Bool)

(assert (=> start!77496 (=> (not res!609279) (not e!505843))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77496 (= res!609279 (validMask!0 mask!1756))))

(assert (=> start!77496 e!505843))

(declare-fun array_inv!20040 (array!53075) Bool)

(assert (=> start!77496 (and (array_inv!20040 _values!1152) e!505847)))

(assert (=> start!77496 tp!56559))

(assert (=> start!77496 true))

(assert (=> start!77496 tp_is_empty!18517))

(declare-fun array_inv!20041 (array!53077) Bool)

(assert (=> start!77496 (array_inv!20041 _keys!1386)))

(assert (= (and start!77496 res!609279) b!902934))

(assert (= (and b!902934 res!609281) b!902935))

(assert (= (and b!902935 res!609282) b!902940))

(assert (= (and b!902940 res!609280) b!902936))

(assert (= (and b!902937 condMapEmpty!29488) mapIsEmpty!29488))

(assert (= (and b!902937 (not condMapEmpty!29488)) mapNonEmpty!29488))

(get-info :version)

(assert (= (and mapNonEmpty!29488 ((_ is ValueCellFull!8777) mapValue!29488)) b!902939))

(assert (= (and b!902937 ((_ is ValueCellFull!8777) mapDefault!29488)) b!902938))

(assert (= start!77496 b!902937))

(declare-fun m!838163 () Bool)

(assert (=> b!902940 m!838163))

(declare-fun m!838165 () Bool)

(assert (=> b!902935 m!838165))

(declare-fun m!838167 () Bool)

(assert (=> b!902936 m!838167))

(assert (=> b!902936 m!838167))

(declare-fun m!838169 () Bool)

(assert (=> b!902936 m!838169))

(declare-fun m!838171 () Bool)

(assert (=> mapNonEmpty!29488 m!838171))

(declare-fun m!838173 () Bool)

(assert (=> start!77496 m!838173))

(declare-fun m!838175 () Bool)

(assert (=> start!77496 m!838175))

(declare-fun m!838177 () Bool)

(assert (=> start!77496 m!838177))

(check-sat tp_is_empty!18517 (not b!902940) (not b!902935) (not start!77496) (not b!902936) b_and!26439 (not b_next!16099) (not mapNonEmpty!29488))
(check-sat b_and!26439 (not b_next!16099))
