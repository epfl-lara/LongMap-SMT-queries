; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77538 () Bool)

(assert start!77538)

(declare-fun b_free!16141 () Bool)

(declare-fun b_next!16141 () Bool)

(assert (=> start!77538 (= b_free!16141 (not b_next!16141))))

(declare-fun tp!56685 () Bool)

(declare-fun b_and!26481 () Bool)

(assert (=> start!77538 (= tp!56685 b_and!26481)))

(declare-fun res!609532 () Bool)

(declare-fun e!506160 () Bool)

(assert (=> start!77538 (=> (not res!609532) (not e!506160))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77538 (= res!609532 (validMask!0 mask!1756))))

(assert (=> start!77538 e!506160))

(declare-datatypes ((V!29711 0))(
  ( (V!29712 (val!9330 Int)) )
))
(declare-datatypes ((ValueCell!8798 0))(
  ( (ValueCellFull!8798 (v!11834 V!29711)) (EmptyCell!8798) )
))
(declare-datatypes ((array!53151 0))(
  ( (array!53152 (arr!25535 (Array (_ BitVec 32) ValueCell!8798)) (size!25996 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53151)

(declare-fun e!506158 () Bool)

(declare-fun array_inv!20068 (array!53151) Bool)

(assert (=> start!77538 (and (array_inv!20068 _values!1152) e!506158)))

(assert (=> start!77538 tp!56685))

(assert (=> start!77538 true))

(declare-fun tp_is_empty!18559 () Bool)

(assert (=> start!77538 tp_is_empty!18559))

(declare-datatypes ((array!53153 0))(
  ( (array!53154 (arr!25536 (Array (_ BitVec 32) (_ BitVec 64))) (size!25997 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53153)

(declare-fun array_inv!20069 (array!53153) Bool)

(assert (=> start!77538 (array_inv!20069 _keys!1386)))

(declare-fun b!903375 () Bool)

(declare-fun e!506161 () Bool)

(assert (=> b!903375 (= e!506161 tp_is_empty!18559)))

(declare-fun b!903376 () Bool)

(declare-fun e!506162 () Bool)

(assert (=> b!903376 (= e!506162 tp_is_empty!18559)))

(declare-fun b!903377 () Bool)

(declare-fun res!609531 () Bool)

(assert (=> b!903377 (=> (not res!609531) (not e!506160))))

(declare-datatypes ((List!17944 0))(
  ( (Nil!17941) (Cons!17940 (h!19086 (_ BitVec 64)) (t!25318 List!17944)) )
))
(declare-fun arrayNoDuplicates!0 (array!53153 (_ BitVec 32) List!17944) Bool)

(assert (=> b!903377 (= res!609531 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17941))))

(declare-fun b!903378 () Bool)

(declare-fun res!609533 () Bool)

(assert (=> b!903378 (=> (not res!609533) (not e!506160))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53153 (_ BitVec 32)) Bool)

(assert (=> b!903378 (= res!609533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!903379 () Bool)

(declare-fun res!609534 () Bool)

(assert (=> b!903379 (=> (not res!609534) (not e!506160))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!903379 (= res!609534 (and (= (size!25996 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25997 _keys!1386) (size!25996 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!903380 () Bool)

(declare-fun mapRes!29551 () Bool)

(assert (=> b!903380 (= e!506158 (and e!506162 mapRes!29551))))

(declare-fun condMapEmpty!29551 () Bool)

(declare-fun mapDefault!29551 () ValueCell!8798)

(assert (=> b!903380 (= condMapEmpty!29551 (= (arr!25535 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8798)) mapDefault!29551)))))

(declare-fun mapIsEmpty!29551 () Bool)

(assert (=> mapIsEmpty!29551 mapRes!29551))

(declare-fun mapNonEmpty!29551 () Bool)

(declare-fun tp!56686 () Bool)

(assert (=> mapNonEmpty!29551 (= mapRes!29551 (and tp!56686 e!506161))))

(declare-fun mapRest!29551 () (Array (_ BitVec 32) ValueCell!8798))

(declare-fun mapValue!29551 () ValueCell!8798)

(declare-fun mapKey!29551 () (_ BitVec 32))

(assert (=> mapNonEmpty!29551 (= (arr!25535 _values!1152) (store mapRest!29551 mapKey!29551 mapValue!29551))))

(declare-fun b!903381 () Bool)

(assert (=> b!903381 (= e!506160 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!407797 () Bool)

(declare-fun zeroValue!1094 () V!29711)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!29711)

(declare-datatypes ((tuple2!12138 0))(
  ( (tuple2!12139 (_1!6080 (_ BitVec 64)) (_2!6080 V!29711)) )
))
(declare-datatypes ((List!17945 0))(
  ( (Nil!17942) (Cons!17941 (h!19087 tuple2!12138) (t!25319 List!17945)) )
))
(declare-datatypes ((ListLongMap!10825 0))(
  ( (ListLongMap!10826 (toList!5428 List!17945)) )
))
(declare-fun contains!4439 (ListLongMap!10825 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2643 (array!53153 array!53151 (_ BitVec 32) (_ BitVec 32) V!29711 V!29711 (_ BitVec 32) Int) ListLongMap!10825)

(assert (=> b!903381 (= lt!407797 (contains!4439 (getCurrentListMap!2643 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(assert (= (and start!77538 res!609532) b!903379))

(assert (= (and b!903379 res!609534) b!903378))

(assert (= (and b!903378 res!609533) b!903377))

(assert (= (and b!903377 res!609531) b!903381))

(assert (= (and b!903380 condMapEmpty!29551) mapIsEmpty!29551))

(assert (= (and b!903380 (not condMapEmpty!29551)) mapNonEmpty!29551))

(get-info :version)

(assert (= (and mapNonEmpty!29551 ((_ is ValueCellFull!8798) mapValue!29551)) b!903375))

(assert (= (and b!903380 ((_ is ValueCellFull!8798) mapDefault!29551)) b!903376))

(assert (= start!77538 b!903380))

(declare-fun m!838499 () Bool)

(assert (=> mapNonEmpty!29551 m!838499))

(declare-fun m!838501 () Bool)

(assert (=> b!903378 m!838501))

(declare-fun m!838503 () Bool)

(assert (=> start!77538 m!838503))

(declare-fun m!838505 () Bool)

(assert (=> start!77538 m!838505))

(declare-fun m!838507 () Bool)

(assert (=> start!77538 m!838507))

(declare-fun m!838509 () Bool)

(assert (=> b!903381 m!838509))

(assert (=> b!903381 m!838509))

(declare-fun m!838511 () Bool)

(assert (=> b!903381 m!838511))

(declare-fun m!838513 () Bool)

(assert (=> b!903377 m!838513))

(check-sat b_and!26481 (not b!903377) (not mapNonEmpty!29551) (not b!903378) (not start!77538) (not b_next!16141) (not b!903381) tp_is_empty!18559)
(check-sat b_and!26481 (not b_next!16141))
