; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73348 () Bool)

(assert start!73348)

(declare-fun b_free!14281 () Bool)

(declare-fun b_next!14281 () Bool)

(assert (=> start!73348 (= b_free!14281 (not b_next!14281))))

(declare-fun tp!50348 () Bool)

(declare-fun b_and!23611 () Bool)

(assert (=> start!73348 (= tp!50348 b_and!23611)))

(declare-fun b!855943 () Bool)

(declare-fun res!581392 () Bool)

(declare-fun e!477124 () Bool)

(assert (=> b!855943 (=> (not res!581392) (not e!477124))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!855943 (= res!581392 (validKeyInArray!0 k0!854))))

(declare-fun b!855944 () Bool)

(declare-fun res!581399 () Bool)

(assert (=> b!855944 (=> (not res!581399) (not e!477124))))

(declare-datatypes ((array!49013 0))(
  ( (array!49014 (arr!23538 (Array (_ BitVec 32) (_ BitVec 64))) (size!23980 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49013)

(declare-datatypes ((List!16702 0))(
  ( (Nil!16699) (Cons!16698 (h!17829 (_ BitVec 64)) (t!23334 List!16702)) )
))
(declare-fun arrayNoDuplicates!0 (array!49013 (_ BitVec 32) List!16702) Bool)

(assert (=> b!855944 (= res!581399 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16699))))

(declare-fun b!855945 () Bool)

(declare-fun res!581393 () Bool)

(assert (=> b!855945 (=> (not res!581393) (not e!477124))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!26937 0))(
  ( (V!26938 (val!8256 Int)) )
))
(declare-datatypes ((ValueCell!7769 0))(
  ( (ValueCellFull!7769 (v!10675 V!26937)) (EmptyCell!7769) )
))
(declare-datatypes ((array!49015 0))(
  ( (array!49016 (arr!23539 (Array (_ BitVec 32) ValueCell!7769)) (size!23981 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49015)

(assert (=> b!855945 (= res!581393 (and (= (size!23981 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23980 _keys!868) (size!23981 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!855946 () Bool)

(declare-fun e!477121 () Bool)

(declare-fun e!477122 () Bool)

(declare-fun mapRes!26225 () Bool)

(assert (=> b!855946 (= e!477121 (and e!477122 mapRes!26225))))

(declare-fun condMapEmpty!26225 () Bool)

(declare-fun mapDefault!26225 () ValueCell!7769)

(assert (=> b!855946 (= condMapEmpty!26225 (= (arr!23539 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7769)) mapDefault!26225)))))

(declare-fun b!855947 () Bool)

(declare-fun res!581396 () Bool)

(assert (=> b!855947 (=> (not res!581396) (not e!477124))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!855947 (= res!581396 (and (= (select (arr!23538 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!855948 () Bool)

(declare-fun res!581398 () Bool)

(assert (=> b!855948 (=> (not res!581398) (not e!477124))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!855948 (= res!581398 (validMask!0 mask!1196))))

(declare-fun b!855949 () Bool)

(declare-fun tp_is_empty!16417 () Bool)

(assert (=> b!855949 (= e!477122 tp_is_empty!16417)))

(declare-fun res!581394 () Bool)

(assert (=> start!73348 (=> (not res!581394) (not e!477124))))

(assert (=> start!73348 (= res!581394 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23980 _keys!868))))))

(assert (=> start!73348 e!477124))

(assert (=> start!73348 tp_is_empty!16417))

(assert (=> start!73348 true))

(assert (=> start!73348 tp!50348))

(declare-fun array_inv!18716 (array!49013) Bool)

(assert (=> start!73348 (array_inv!18716 _keys!868)))

(declare-fun array_inv!18717 (array!49015) Bool)

(assert (=> start!73348 (and (array_inv!18717 _values!688) e!477121)))

(declare-fun b!855950 () Bool)

(declare-fun e!477123 () Bool)

(assert (=> b!855950 (= e!477123 tp_is_empty!16417)))

(declare-fun b!855951 () Bool)

(declare-fun e!477126 () Bool)

(assert (=> b!855951 (= e!477126 (not true))))

(declare-fun v!557 () V!26937)

(declare-fun lt!385634 () array!49015)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!26937)

(declare-fun zeroValue!654 () V!26937)

(declare-datatypes ((tuple2!10894 0))(
  ( (tuple2!10895 (_1!5458 (_ BitVec 64)) (_2!5458 V!26937)) )
))
(declare-datatypes ((List!16703 0))(
  ( (Nil!16700) (Cons!16699 (h!17830 tuple2!10894) (t!23335 List!16703)) )
))
(declare-datatypes ((ListLongMap!9653 0))(
  ( (ListLongMap!9654 (toList!4842 List!16703)) )
))
(declare-fun getCurrentListMapNoExtraKeys!2849 (array!49013 array!49015 (_ BitVec 32) (_ BitVec 32) V!26937 V!26937 (_ BitVec 32) Int) ListLongMap!9653)

(declare-fun +!2222 (ListLongMap!9653 tuple2!10894) ListLongMap!9653)

(assert (=> b!855951 (= (getCurrentListMapNoExtraKeys!2849 _keys!868 lt!385634 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2222 (getCurrentListMapNoExtraKeys!2849 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10895 k0!854 v!557)))))

(declare-datatypes ((Unit!29113 0))(
  ( (Unit!29114) )
))
(declare-fun lt!385636 () Unit!29113)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!419 (array!49013 array!49015 (_ BitVec 32) (_ BitVec 32) V!26937 V!26937 (_ BitVec 32) (_ BitVec 64) V!26937 (_ BitVec 32) Int) Unit!29113)

(assert (=> b!855951 (= lt!385636 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!419 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!855952 () Bool)

(assert (=> b!855952 (= e!477124 e!477126)))

(declare-fun res!581395 () Bool)

(assert (=> b!855952 (=> (not res!581395) (not e!477126))))

(assert (=> b!855952 (= res!581395 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!385635 () ListLongMap!9653)

(assert (=> b!855952 (= lt!385635 (getCurrentListMapNoExtraKeys!2849 _keys!868 lt!385634 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!855952 (= lt!385634 (array!49016 (store (arr!23539 _values!688) i!612 (ValueCellFull!7769 v!557)) (size!23981 _values!688)))))

(declare-fun lt!385637 () ListLongMap!9653)

(assert (=> b!855952 (= lt!385637 (getCurrentListMapNoExtraKeys!2849 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!855953 () Bool)

(declare-fun res!581400 () Bool)

(assert (=> b!855953 (=> (not res!581400) (not e!477124))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49013 (_ BitVec 32)) Bool)

(assert (=> b!855953 (= res!581400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!26225 () Bool)

(assert (=> mapIsEmpty!26225 mapRes!26225))

(declare-fun mapNonEmpty!26225 () Bool)

(declare-fun tp!50347 () Bool)

(assert (=> mapNonEmpty!26225 (= mapRes!26225 (and tp!50347 e!477123))))

(declare-fun mapRest!26225 () (Array (_ BitVec 32) ValueCell!7769))

(declare-fun mapKey!26225 () (_ BitVec 32))

(declare-fun mapValue!26225 () ValueCell!7769)

(assert (=> mapNonEmpty!26225 (= (arr!23539 _values!688) (store mapRest!26225 mapKey!26225 mapValue!26225))))

(declare-fun b!855954 () Bool)

(declare-fun res!581397 () Bool)

(assert (=> b!855954 (=> (not res!581397) (not e!477124))))

(assert (=> b!855954 (= res!581397 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23980 _keys!868))))))

(assert (= (and start!73348 res!581394) b!855948))

(assert (= (and b!855948 res!581398) b!855945))

(assert (= (and b!855945 res!581393) b!855953))

(assert (= (and b!855953 res!581400) b!855944))

(assert (= (and b!855944 res!581399) b!855954))

(assert (= (and b!855954 res!581397) b!855943))

(assert (= (and b!855943 res!581392) b!855947))

(assert (= (and b!855947 res!581396) b!855952))

(assert (= (and b!855952 res!581395) b!855951))

(assert (= (and b!855946 condMapEmpty!26225) mapIsEmpty!26225))

(assert (= (and b!855946 (not condMapEmpty!26225)) mapNonEmpty!26225))

(get-info :version)

(assert (= (and mapNonEmpty!26225 ((_ is ValueCellFull!7769) mapValue!26225)) b!855950))

(assert (= (and b!855946 ((_ is ValueCellFull!7769) mapDefault!26225)) b!855949))

(assert (= start!73348 b!855946))

(declare-fun m!796413 () Bool)

(assert (=> start!73348 m!796413))

(declare-fun m!796415 () Bool)

(assert (=> start!73348 m!796415))

(declare-fun m!796417 () Bool)

(assert (=> b!855943 m!796417))

(declare-fun m!796419 () Bool)

(assert (=> mapNonEmpty!26225 m!796419))

(declare-fun m!796421 () Bool)

(assert (=> b!855948 m!796421))

(declare-fun m!796423 () Bool)

(assert (=> b!855951 m!796423))

(declare-fun m!796425 () Bool)

(assert (=> b!855951 m!796425))

(assert (=> b!855951 m!796425))

(declare-fun m!796427 () Bool)

(assert (=> b!855951 m!796427))

(declare-fun m!796429 () Bool)

(assert (=> b!855951 m!796429))

(declare-fun m!796431 () Bool)

(assert (=> b!855944 m!796431))

(declare-fun m!796433 () Bool)

(assert (=> b!855953 m!796433))

(declare-fun m!796435 () Bool)

(assert (=> b!855952 m!796435))

(declare-fun m!796437 () Bool)

(assert (=> b!855952 m!796437))

(declare-fun m!796439 () Bool)

(assert (=> b!855952 m!796439))

(declare-fun m!796441 () Bool)

(assert (=> b!855947 m!796441))

(check-sat tp_is_empty!16417 (not b_next!14281) (not b!855948) (not b!855943) (not b!855944) (not b!855952) (not mapNonEmpty!26225) b_and!23611 (not b!855951) (not b!855953) (not start!73348))
(check-sat b_and!23611 (not b_next!14281))
