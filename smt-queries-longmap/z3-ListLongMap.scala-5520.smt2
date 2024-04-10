; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72906 () Bool)

(assert start!72906)

(declare-fun b_free!13821 () Bool)

(declare-fun b_next!13821 () Bool)

(assert (=> start!72906 (= b_free!13821 (not b_next!13821))))

(declare-fun tp!48966 () Bool)

(declare-fun b_and!22907 () Bool)

(assert (=> start!72906 (= tp!48966 b_and!22907)))

(declare-fun b!846430 () Bool)

(declare-fun e!472415 () Bool)

(declare-fun tp_is_empty!15957 () Bool)

(assert (=> b!846430 (= e!472415 tp_is_empty!15957)))

(declare-fun b!846431 () Bool)

(declare-fun res!575065 () Bool)

(declare-fun e!472413 () Bool)

(assert (=> b!846431 (=> (not res!575065) (not e!472413))))

(declare-datatypes ((array!48126 0))(
  ( (array!48127 (arr!23094 (Array (_ BitVec 32) (_ BitVec 64))) (size!23534 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48126)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48126 (_ BitVec 32)) Bool)

(assert (=> b!846431 (= res!575065 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!575069 () Bool)

(assert (=> start!72906 (=> (not res!575069) (not e!472413))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72906 (= res!575069 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23534 _keys!868))))))

(assert (=> start!72906 e!472413))

(assert (=> start!72906 tp_is_empty!15957))

(assert (=> start!72906 true))

(assert (=> start!72906 tp!48966))

(declare-fun array_inv!18348 (array!48126) Bool)

(assert (=> start!72906 (array_inv!18348 _keys!868)))

(declare-datatypes ((V!26323 0))(
  ( (V!26324 (val!8026 Int)) )
))
(declare-datatypes ((ValueCell!7539 0))(
  ( (ValueCellFull!7539 (v!10451 V!26323)) (EmptyCell!7539) )
))
(declare-datatypes ((array!48128 0))(
  ( (array!48129 (arr!23095 (Array (_ BitVec 32) ValueCell!7539)) (size!23535 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48128)

(declare-fun e!472416 () Bool)

(declare-fun array_inv!18349 (array!48128) Bool)

(assert (=> start!72906 (and (array_inv!18349 _values!688) e!472416)))

(declare-fun mapIsEmpty!25535 () Bool)

(declare-fun mapRes!25535 () Bool)

(assert (=> mapIsEmpty!25535 mapRes!25535))

(declare-fun b!846432 () Bool)

(declare-fun e!472417 () Bool)

(assert (=> b!846432 (= e!472416 (and e!472417 mapRes!25535))))

(declare-fun condMapEmpty!25535 () Bool)

(declare-fun mapDefault!25535 () ValueCell!7539)

(assert (=> b!846432 (= condMapEmpty!25535 (= (arr!23095 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7539)) mapDefault!25535)))))

(declare-fun b!846433 () Bool)

(declare-fun res!575068 () Bool)

(assert (=> b!846433 (=> (not res!575068) (not e!472413))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!846433 (= res!575068 (validMask!0 mask!1196))))

(declare-fun b!846434 () Bool)

(declare-fun res!575067 () Bool)

(assert (=> b!846434 (=> (not res!575067) (not e!472413))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!846434 (= res!575067 (validKeyInArray!0 k0!854))))

(declare-fun b!846435 () Bool)

(declare-fun res!575062 () Bool)

(assert (=> b!846435 (=> (not res!575062) (not e!472413))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!846435 (= res!575062 (and (= (size!23535 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23534 _keys!868) (size!23535 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!846436 () Bool)

(assert (=> b!846436 (= e!472413 false)))

(declare-fun v!557 () V!26323)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10482 0))(
  ( (tuple2!10483 (_1!5252 (_ BitVec 64)) (_2!5252 V!26323)) )
))
(declare-datatypes ((List!16343 0))(
  ( (Nil!16340) (Cons!16339 (h!17470 tuple2!10482) (t!22714 List!16343)) )
))
(declare-datatypes ((ListLongMap!9251 0))(
  ( (ListLongMap!9252 (toList!4641 List!16343)) )
))
(declare-fun lt!381534 () ListLongMap!9251)

(declare-fun minValue!654 () V!26323)

(declare-fun zeroValue!654 () V!26323)

(declare-fun getCurrentListMapNoExtraKeys!2626 (array!48126 array!48128 (_ BitVec 32) (_ BitVec 32) V!26323 V!26323 (_ BitVec 32) Int) ListLongMap!9251)

(assert (=> b!846436 (= lt!381534 (getCurrentListMapNoExtraKeys!2626 _keys!868 (array!48129 (store (arr!23095 _values!688) i!612 (ValueCellFull!7539 v!557)) (size!23535 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!381535 () ListLongMap!9251)

(assert (=> b!846436 (= lt!381535 (getCurrentListMapNoExtraKeys!2626 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!846437 () Bool)

(declare-fun res!575063 () Bool)

(assert (=> b!846437 (=> (not res!575063) (not e!472413))))

(declare-datatypes ((List!16344 0))(
  ( (Nil!16341) (Cons!16340 (h!17471 (_ BitVec 64)) (t!22715 List!16344)) )
))
(declare-fun arrayNoDuplicates!0 (array!48126 (_ BitVec 32) List!16344) Bool)

(assert (=> b!846437 (= res!575063 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16341))))

(declare-fun b!846438 () Bool)

(declare-fun res!575064 () Bool)

(assert (=> b!846438 (=> (not res!575064) (not e!472413))))

(assert (=> b!846438 (= res!575064 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23534 _keys!868))))))

(declare-fun mapNonEmpty!25535 () Bool)

(declare-fun tp!48967 () Bool)

(assert (=> mapNonEmpty!25535 (= mapRes!25535 (and tp!48967 e!472415))))

(declare-fun mapValue!25535 () ValueCell!7539)

(declare-fun mapRest!25535 () (Array (_ BitVec 32) ValueCell!7539))

(declare-fun mapKey!25535 () (_ BitVec 32))

(assert (=> mapNonEmpty!25535 (= (arr!23095 _values!688) (store mapRest!25535 mapKey!25535 mapValue!25535))))

(declare-fun b!846439 () Bool)

(assert (=> b!846439 (= e!472417 tp_is_empty!15957)))

(declare-fun b!846440 () Bool)

(declare-fun res!575066 () Bool)

(assert (=> b!846440 (=> (not res!575066) (not e!472413))))

(assert (=> b!846440 (= res!575066 (and (= (select (arr!23094 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!72906 res!575069) b!846433))

(assert (= (and b!846433 res!575068) b!846435))

(assert (= (and b!846435 res!575062) b!846431))

(assert (= (and b!846431 res!575065) b!846437))

(assert (= (and b!846437 res!575063) b!846438))

(assert (= (and b!846438 res!575064) b!846434))

(assert (= (and b!846434 res!575067) b!846440))

(assert (= (and b!846440 res!575066) b!846436))

(assert (= (and b!846432 condMapEmpty!25535) mapIsEmpty!25535))

(assert (= (and b!846432 (not condMapEmpty!25535)) mapNonEmpty!25535))

(get-info :version)

(assert (= (and mapNonEmpty!25535 ((_ is ValueCellFull!7539) mapValue!25535)) b!846430))

(assert (= (and b!846432 ((_ is ValueCellFull!7539) mapDefault!25535)) b!846439))

(assert (= start!72906 b!846432))

(declare-fun m!787831 () Bool)

(assert (=> b!846433 m!787831))

(declare-fun m!787833 () Bool)

(assert (=> b!846437 m!787833))

(declare-fun m!787835 () Bool)

(assert (=> b!846431 m!787835))

(declare-fun m!787837 () Bool)

(assert (=> mapNonEmpty!25535 m!787837))

(declare-fun m!787839 () Bool)

(assert (=> b!846434 m!787839))

(declare-fun m!787841 () Bool)

(assert (=> b!846440 m!787841))

(declare-fun m!787843 () Bool)

(assert (=> start!72906 m!787843))

(declare-fun m!787845 () Bool)

(assert (=> start!72906 m!787845))

(declare-fun m!787847 () Bool)

(assert (=> b!846436 m!787847))

(declare-fun m!787849 () Bool)

(assert (=> b!846436 m!787849))

(declare-fun m!787851 () Bool)

(assert (=> b!846436 m!787851))

(check-sat (not mapNonEmpty!25535) tp_is_empty!15957 (not b!846437) b_and!22907 (not b_next!13821) (not b!846433) (not b!846436) (not b!846431) (not start!72906) (not b!846434))
(check-sat b_and!22907 (not b_next!13821))
