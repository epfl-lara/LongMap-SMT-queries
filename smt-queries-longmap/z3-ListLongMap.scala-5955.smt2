; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77724 () Bool)

(assert start!77724)

(declare-fun b_free!16141 () Bool)

(declare-fun b_next!16141 () Bool)

(assert (=> start!77724 (= b_free!16141 (not b_next!16141))))

(declare-fun tp!56685 () Bool)

(declare-fun b_and!26517 () Bool)

(assert (=> start!77724 (= tp!56685 b_and!26517)))

(declare-fun b!904517 () Bool)

(declare-fun e!506892 () Bool)

(declare-fun tp_is_empty!18559 () Bool)

(assert (=> b!904517 (= e!506892 tp_is_empty!18559)))

(declare-fun b!904518 () Bool)

(declare-fun e!506888 () Bool)

(declare-fun e!506889 () Bool)

(declare-fun mapRes!29551 () Bool)

(assert (=> b!904518 (= e!506888 (and e!506889 mapRes!29551))))

(declare-fun condMapEmpty!29551 () Bool)

(declare-datatypes ((V!29711 0))(
  ( (V!29712 (val!9330 Int)) )
))
(declare-datatypes ((ValueCell!8798 0))(
  ( (ValueCellFull!8798 (v!11832 V!29711)) (EmptyCell!8798) )
))
(declare-datatypes ((array!53209 0))(
  ( (array!53210 (arr!25559 (Array (_ BitVec 32) ValueCell!8798)) (size!26019 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53209)

(declare-fun mapDefault!29551 () ValueCell!8798)

(assert (=> b!904518 (= condMapEmpty!29551 (= (arr!25559 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8798)) mapDefault!29551)))))

(declare-fun b!904519 () Bool)

(declare-fun res!609985 () Bool)

(declare-fun e!506890 () Bool)

(assert (=> b!904519 (=> (not res!609985) (not e!506890))))

(declare-datatypes ((array!53211 0))(
  ( (array!53212 (arr!25560 (Array (_ BitVec 32) (_ BitVec 64))) (size!26020 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53211)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53211 (_ BitVec 32)) Bool)

(assert (=> b!904519 (= res!609985 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!904520 () Bool)

(declare-fun res!609986 () Bool)

(assert (=> b!904520 (=> (not res!609986) (not e!506890))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!904520 (= res!609986 (and (= (size!26019 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26020 _keys!1386) (size!26019 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!904521 () Bool)

(assert (=> b!904521 (= e!506889 tp_is_empty!18559)))

(declare-fun res!609988 () Bool)

(assert (=> start!77724 (=> (not res!609988) (not e!506890))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77724 (= res!609988 (validMask!0 mask!1756))))

(assert (=> start!77724 e!506890))

(declare-fun array_inv!20092 (array!53209) Bool)

(assert (=> start!77724 (and (array_inv!20092 _values!1152) e!506888)))

(assert (=> start!77724 tp!56685))

(assert (=> start!77724 true))

(assert (=> start!77724 tp_is_empty!18559))

(declare-fun array_inv!20093 (array!53211) Bool)

(assert (=> start!77724 (array_inv!20093 _keys!1386)))

(declare-fun b!904522 () Bool)

(assert (=> b!904522 (= e!506890 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29711)

(declare-fun minValue!1094 () V!29711)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun lt!408394 () Bool)

(declare-datatypes ((tuple2!12046 0))(
  ( (tuple2!12047 (_1!6034 (_ BitVec 64)) (_2!6034 V!29711)) )
))
(declare-datatypes ((List!17899 0))(
  ( (Nil!17896) (Cons!17895 (h!19047 tuple2!12046) (t!25274 List!17899)) )
))
(declare-datatypes ((ListLongMap!10745 0))(
  ( (ListLongMap!10746 (toList!5388 List!17899)) )
))
(declare-fun contains!4446 (ListLongMap!10745 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2657 (array!53211 array!53209 (_ BitVec 32) (_ BitVec 32) V!29711 V!29711 (_ BitVec 32) Int) ListLongMap!10745)

(assert (=> b!904522 (= lt!408394 (contains!4446 (getCurrentListMap!2657 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun mapIsEmpty!29551 () Bool)

(assert (=> mapIsEmpty!29551 mapRes!29551))

(declare-fun mapNonEmpty!29551 () Bool)

(declare-fun tp!56686 () Bool)

(assert (=> mapNonEmpty!29551 (= mapRes!29551 (and tp!56686 e!506892))))

(declare-fun mapRest!29551 () (Array (_ BitVec 32) ValueCell!8798))

(declare-fun mapValue!29551 () ValueCell!8798)

(declare-fun mapKey!29551 () (_ BitVec 32))

(assert (=> mapNonEmpty!29551 (= (arr!25559 _values!1152) (store mapRest!29551 mapKey!29551 mapValue!29551))))

(declare-fun b!904523 () Bool)

(declare-fun res!609987 () Bool)

(assert (=> b!904523 (=> (not res!609987) (not e!506890))))

(declare-datatypes ((List!17900 0))(
  ( (Nil!17897) (Cons!17896 (h!19048 (_ BitVec 64)) (t!25275 List!17900)) )
))
(declare-fun arrayNoDuplicates!0 (array!53211 (_ BitVec 32) List!17900) Bool)

(assert (=> b!904523 (= res!609987 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17897))))

(assert (= (and start!77724 res!609988) b!904520))

(assert (= (and b!904520 res!609986) b!904519))

(assert (= (and b!904519 res!609985) b!904523))

(assert (= (and b!904523 res!609987) b!904522))

(assert (= (and b!904518 condMapEmpty!29551) mapIsEmpty!29551))

(assert (= (and b!904518 (not condMapEmpty!29551)) mapNonEmpty!29551))

(get-info :version)

(assert (= (and mapNonEmpty!29551 ((_ is ValueCellFull!8798) mapValue!29551)) b!904517))

(assert (= (and b!904518 ((_ is ValueCellFull!8798) mapDefault!29551)) b!904521))

(assert (= start!77724 b!904518))

(declare-fun m!840551 () Bool)

(assert (=> b!904522 m!840551))

(assert (=> b!904522 m!840551))

(declare-fun m!840553 () Bool)

(assert (=> b!904522 m!840553))

(declare-fun m!840555 () Bool)

(assert (=> b!904519 m!840555))

(declare-fun m!840557 () Bool)

(assert (=> start!77724 m!840557))

(declare-fun m!840559 () Bool)

(assert (=> start!77724 m!840559))

(declare-fun m!840561 () Bool)

(assert (=> start!77724 m!840561))

(declare-fun m!840563 () Bool)

(assert (=> b!904523 m!840563))

(declare-fun m!840565 () Bool)

(assert (=> mapNonEmpty!29551 m!840565))

(check-sat tp_is_empty!18559 (not b!904523) (not b_next!16141) b_and!26517 (not mapNonEmpty!29551) (not start!77724) (not b!904522) (not b!904519))
(check-sat b_and!26517 (not b_next!16141))
