; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72876 () Bool)

(assert start!72876)

(declare-fun b_free!13791 () Bool)

(declare-fun b_next!13791 () Bool)

(assert (=> start!72876 (= b_free!13791 (not b_next!13791))))

(declare-fun tp!48877 () Bool)

(declare-fun b_and!22877 () Bool)

(assert (=> start!72876 (= tp!48877 b_and!22877)))

(declare-fun b!845935 () Bool)

(declare-fun res!574705 () Bool)

(declare-fun e!472192 () Bool)

(assert (=> b!845935 (=> (not res!574705) (not e!472192))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48072 0))(
  ( (array!48073 (arr!23067 (Array (_ BitVec 32) (_ BitVec 64))) (size!23507 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48072)

(assert (=> b!845935 (= res!574705 (and (= (select (arr!23067 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!845936 () Bool)

(assert (=> b!845936 (= e!472192 false)))

(declare-datatypes ((V!26283 0))(
  ( (V!26284 (val!8011 Int)) )
))
(declare-datatypes ((tuple2!10464 0))(
  ( (tuple2!10465 (_1!5243 (_ BitVec 64)) (_2!5243 V!26283)) )
))
(declare-datatypes ((List!16326 0))(
  ( (Nil!16323) (Cons!16322 (h!17453 tuple2!10464) (t!22697 List!16326)) )
))
(declare-datatypes ((ListLongMap!9233 0))(
  ( (ListLongMap!9234 (toList!4632 List!16326)) )
))
(declare-fun lt!381457 () ListLongMap!9233)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7524 0))(
  ( (ValueCellFull!7524 (v!10436 V!26283)) (EmptyCell!7524) )
))
(declare-datatypes ((array!48074 0))(
  ( (array!48075 (arr!23068 (Array (_ BitVec 32) ValueCell!7524)) (size!23508 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48074)

(declare-fun minValue!654 () V!26283)

(declare-fun zeroValue!654 () V!26283)

(declare-fun getCurrentListMapNoExtraKeys!2617 (array!48072 array!48074 (_ BitVec 32) (_ BitVec 32) V!26283 V!26283 (_ BitVec 32) Int) ListLongMap!9233)

(assert (=> b!845936 (= lt!381457 (getCurrentListMapNoExtraKeys!2617 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!574707 () Bool)

(assert (=> start!72876 (=> (not res!574707) (not e!472192))))

(assert (=> start!72876 (= res!574707 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23507 _keys!868))))))

(assert (=> start!72876 e!472192))

(assert (=> start!72876 true))

(assert (=> start!72876 tp!48877))

(declare-fun array_inv!18328 (array!48072) Bool)

(assert (=> start!72876 (array_inv!18328 _keys!868)))

(declare-fun e!472188 () Bool)

(declare-fun array_inv!18329 (array!48074) Bool)

(assert (=> start!72876 (and (array_inv!18329 _values!688) e!472188)))

(declare-fun tp_is_empty!15927 () Bool)

(assert (=> start!72876 tp_is_empty!15927))

(declare-fun mapIsEmpty!25490 () Bool)

(declare-fun mapRes!25490 () Bool)

(assert (=> mapIsEmpty!25490 mapRes!25490))

(declare-fun b!845937 () Bool)

(declare-fun e!472189 () Bool)

(assert (=> b!845937 (= e!472189 tp_is_empty!15927)))

(declare-fun mapNonEmpty!25490 () Bool)

(declare-fun tp!48876 () Bool)

(declare-fun e!472190 () Bool)

(assert (=> mapNonEmpty!25490 (= mapRes!25490 (and tp!48876 e!472190))))

(declare-fun mapKey!25490 () (_ BitVec 32))

(declare-fun mapValue!25490 () ValueCell!7524)

(declare-fun mapRest!25490 () (Array (_ BitVec 32) ValueCell!7524))

(assert (=> mapNonEmpty!25490 (= (arr!23068 _values!688) (store mapRest!25490 mapKey!25490 mapValue!25490))))

(declare-fun b!845938 () Bool)

(declare-fun res!574703 () Bool)

(assert (=> b!845938 (=> (not res!574703) (not e!472192))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48072 (_ BitVec 32)) Bool)

(assert (=> b!845938 (= res!574703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!845939 () Bool)

(assert (=> b!845939 (= e!472188 (and e!472189 mapRes!25490))))

(declare-fun condMapEmpty!25490 () Bool)

(declare-fun mapDefault!25490 () ValueCell!7524)

(assert (=> b!845939 (= condMapEmpty!25490 (= (arr!23068 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7524)) mapDefault!25490)))))

(declare-fun b!845940 () Bool)

(declare-fun res!574706 () Bool)

(assert (=> b!845940 (=> (not res!574706) (not e!472192))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!845940 (= res!574706 (validKeyInArray!0 k0!854))))

(declare-fun b!845941 () Bool)

(declare-fun res!574702 () Bool)

(assert (=> b!845941 (=> (not res!574702) (not e!472192))))

(assert (=> b!845941 (= res!574702 (and (= (size!23508 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23507 _keys!868) (size!23508 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!845942 () Bool)

(declare-fun res!574709 () Bool)

(assert (=> b!845942 (=> (not res!574709) (not e!472192))))

(declare-datatypes ((List!16327 0))(
  ( (Nil!16324) (Cons!16323 (h!17454 (_ BitVec 64)) (t!22698 List!16327)) )
))
(declare-fun arrayNoDuplicates!0 (array!48072 (_ BitVec 32) List!16327) Bool)

(assert (=> b!845942 (= res!574709 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16324))))

(declare-fun b!845943 () Bool)

(declare-fun res!574704 () Bool)

(assert (=> b!845943 (=> (not res!574704) (not e!472192))))

(assert (=> b!845943 (= res!574704 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23507 _keys!868))))))

(declare-fun b!845944 () Bool)

(assert (=> b!845944 (= e!472190 tp_is_empty!15927)))

(declare-fun b!845945 () Bool)

(declare-fun res!574708 () Bool)

(assert (=> b!845945 (=> (not res!574708) (not e!472192))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!845945 (= res!574708 (validMask!0 mask!1196))))

(assert (= (and start!72876 res!574707) b!845945))

(assert (= (and b!845945 res!574708) b!845941))

(assert (= (and b!845941 res!574702) b!845938))

(assert (= (and b!845938 res!574703) b!845942))

(assert (= (and b!845942 res!574709) b!845943))

(assert (= (and b!845943 res!574704) b!845940))

(assert (= (and b!845940 res!574706) b!845935))

(assert (= (and b!845935 res!574705) b!845936))

(assert (= (and b!845939 condMapEmpty!25490) mapIsEmpty!25490))

(assert (= (and b!845939 (not condMapEmpty!25490)) mapNonEmpty!25490))

(get-info :version)

(assert (= (and mapNonEmpty!25490 ((_ is ValueCellFull!7524) mapValue!25490)) b!845944))

(assert (= (and b!845939 ((_ is ValueCellFull!7524) mapDefault!25490)) b!845937))

(assert (= start!72876 b!845939))

(declare-fun m!787521 () Bool)

(assert (=> b!845938 m!787521))

(declare-fun m!787523 () Bool)

(assert (=> b!845935 m!787523))

(declare-fun m!787525 () Bool)

(assert (=> b!845945 m!787525))

(declare-fun m!787527 () Bool)

(assert (=> mapNonEmpty!25490 m!787527))

(declare-fun m!787529 () Bool)

(assert (=> b!845942 m!787529))

(declare-fun m!787531 () Bool)

(assert (=> b!845940 m!787531))

(declare-fun m!787533 () Bool)

(assert (=> start!72876 m!787533))

(declare-fun m!787535 () Bool)

(assert (=> start!72876 m!787535))

(declare-fun m!787537 () Bool)

(assert (=> b!845936 m!787537))

(check-sat (not b!845940) (not b_next!13791) b_and!22877 (not b!845942) (not b!845945) tp_is_empty!15927 (not mapNonEmpty!25490) (not b!845938) (not b!845936) (not start!72876))
(check-sat b_and!22877 (not b_next!13791))
