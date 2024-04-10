; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39690 () Bool)

(assert start!39690)

(declare-fun b_free!9957 () Bool)

(declare-fun b_next!9957 () Bool)

(assert (=> start!39690 (= b_free!9957 (not b_next!9957))))

(declare-fun tp!35400 () Bool)

(declare-fun b_and!17613 () Bool)

(assert (=> start!39690 (= tp!35400 b_and!17613)))

(declare-fun b!426383 () Bool)

(declare-fun res!249855 () Bool)

(declare-fun e!252978 () Bool)

(assert (=> b!426383 (=> (not res!249855) (not e!252978))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!26057 0))(
  ( (array!26058 (arr!12478 (Array (_ BitVec 32) (_ BitVec 64))) (size!12830 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26057)

(assert (=> b!426383 (= res!249855 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12830 _keys!709))))))

(declare-fun b!426384 () Bool)

(declare-fun res!249861 () Bool)

(assert (=> b!426384 (=> (not res!249861) (not e!252978))))

(assert (=> b!426384 (= res!249861 (or (= (select (arr!12478 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12478 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!426385 () Bool)

(declare-fun res!249864 () Bool)

(assert (=> b!426385 (=> (not res!249864) (not e!252978))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!426385 (= res!249864 (validKeyInArray!0 k0!794))))

(declare-fun b!426386 () Bool)

(declare-fun res!249860 () Bool)

(assert (=> b!426386 (=> (not res!249860) (not e!252978))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26057 (_ BitVec 32)) Bool)

(assert (=> b!426386 (= res!249860 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!249862 () Bool)

(assert (=> start!39690 (=> (not res!249862) (not e!252978))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39690 (= res!249862 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12830 _keys!709))))))

(assert (=> start!39690 e!252978))

(declare-fun tp_is_empty!11109 () Bool)

(assert (=> start!39690 tp_is_empty!11109))

(assert (=> start!39690 tp!35400))

(assert (=> start!39690 true))

(declare-datatypes ((V!15917 0))(
  ( (V!15918 (val!5599 Int)) )
))
(declare-datatypes ((ValueCell!5211 0))(
  ( (ValueCellFull!5211 (v!7846 V!15917)) (EmptyCell!5211) )
))
(declare-datatypes ((array!26059 0))(
  ( (array!26060 (arr!12479 (Array (_ BitVec 32) ValueCell!5211)) (size!12831 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26059)

(declare-fun e!252981 () Bool)

(declare-fun array_inv!9096 (array!26059) Bool)

(assert (=> start!39690 (and (array_inv!9096 _values!549) e!252981)))

(declare-fun array_inv!9097 (array!26057) Bool)

(assert (=> start!39690 (array_inv!9097 _keys!709)))

(declare-fun mapNonEmpty!18285 () Bool)

(declare-fun mapRes!18285 () Bool)

(declare-fun tp!35399 () Bool)

(declare-fun e!252977 () Bool)

(assert (=> mapNonEmpty!18285 (= mapRes!18285 (and tp!35399 e!252977))))

(declare-fun mapKey!18285 () (_ BitVec 32))

(declare-fun mapRest!18285 () (Array (_ BitVec 32) ValueCell!5211))

(declare-fun mapValue!18285 () ValueCell!5211)

(assert (=> mapNonEmpty!18285 (= (arr!12479 _values!549) (store mapRest!18285 mapKey!18285 mapValue!18285))))

(declare-fun b!426387 () Bool)

(declare-fun e!252976 () Bool)

(assert (=> b!426387 (= e!252976 tp_is_empty!11109)))

(declare-fun b!426388 () Bool)

(assert (=> b!426388 (= e!252977 tp_is_empty!11109)))

(declare-fun b!426389 () Bool)

(declare-fun res!249863 () Bool)

(assert (=> b!426389 (=> (not res!249863) (not e!252978))))

(declare-fun arrayContainsKey!0 (array!26057 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!426389 (= res!249863 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!426390 () Bool)

(declare-fun res!249857 () Bool)

(assert (=> b!426390 (=> (not res!249857) (not e!252978))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!426390 (= res!249857 (validMask!0 mask!1025))))

(declare-fun b!426391 () Bool)

(assert (=> b!426391 (= e!252981 (and e!252976 mapRes!18285))))

(declare-fun condMapEmpty!18285 () Bool)

(declare-fun mapDefault!18285 () ValueCell!5211)

(assert (=> b!426391 (= condMapEmpty!18285 (= (arr!12479 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5211)) mapDefault!18285)))))

(declare-fun b!426392 () Bool)

(declare-fun res!249852 () Bool)

(assert (=> b!426392 (=> (not res!249852) (not e!252978))))

(declare-datatypes ((List!7370 0))(
  ( (Nil!7367) (Cons!7366 (h!8222 (_ BitVec 64)) (t!12814 List!7370)) )
))
(declare-fun arrayNoDuplicates!0 (array!26057 (_ BitVec 32) List!7370) Bool)

(assert (=> b!426392 (= res!249852 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7367))))

(declare-fun b!426393 () Bool)

(declare-fun e!252980 () Bool)

(declare-fun e!252979 () Bool)

(assert (=> b!426393 (= e!252980 e!252979)))

(declare-fun res!249856 () Bool)

(assert (=> b!426393 (=> (not res!249856) (not e!252979))))

(assert (=> b!426393 (= res!249856 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!15917)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!194946 () array!26059)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!194945 () array!26057)

(declare-datatypes ((tuple2!7356 0))(
  ( (tuple2!7357 (_1!3689 (_ BitVec 64)) (_2!3689 V!15917)) )
))
(declare-datatypes ((List!7371 0))(
  ( (Nil!7368) (Cons!7367 (h!8223 tuple2!7356) (t!12815 List!7371)) )
))
(declare-datatypes ((ListLongMap!6269 0))(
  ( (ListLongMap!6270 (toList!3150 List!7371)) )
))
(declare-fun lt!194944 () ListLongMap!6269)

(declare-fun zeroValue!515 () V!15917)

(declare-fun getCurrentListMapNoExtraKeys!1354 (array!26057 array!26059 (_ BitVec 32) (_ BitVec 32) V!15917 V!15917 (_ BitVec 32) Int) ListLongMap!6269)

(assert (=> b!426393 (= lt!194944 (getCurrentListMapNoExtraKeys!1354 lt!194945 lt!194946 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15917)

(assert (=> b!426393 (= lt!194946 (array!26060 (store (arr!12479 _values!549) i!563 (ValueCellFull!5211 v!412)) (size!12831 _values!549)))))

(declare-fun lt!194947 () ListLongMap!6269)

(assert (=> b!426393 (= lt!194947 (getCurrentListMapNoExtraKeys!1354 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!426394 () Bool)

(declare-fun res!249858 () Bool)

(assert (=> b!426394 (=> (not res!249858) (not e!252978))))

(assert (=> b!426394 (= res!249858 (and (= (size!12831 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12830 _keys!709) (size!12831 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!426395 () Bool)

(declare-fun res!249854 () Bool)

(assert (=> b!426395 (=> (not res!249854) (not e!252980))))

(assert (=> b!426395 (= res!249854 (bvsle from!863 i!563))))

(declare-fun b!426396 () Bool)

(declare-fun res!249859 () Bool)

(assert (=> b!426396 (=> (not res!249859) (not e!252980))))

(assert (=> b!426396 (= res!249859 (arrayNoDuplicates!0 lt!194945 #b00000000000000000000000000000000 Nil!7367))))

(declare-fun mapIsEmpty!18285 () Bool)

(assert (=> mapIsEmpty!18285 mapRes!18285))

(declare-fun b!426397 () Bool)

(assert (=> b!426397 (= e!252979 (not true))))

(declare-fun +!1308 (ListLongMap!6269 tuple2!7356) ListLongMap!6269)

(assert (=> b!426397 (= (getCurrentListMapNoExtraKeys!1354 lt!194945 lt!194946 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1308 (getCurrentListMapNoExtraKeys!1354 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7357 k0!794 v!412)))))

(declare-datatypes ((Unit!12518 0))(
  ( (Unit!12519) )
))
(declare-fun lt!194948 () Unit!12518)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!503 (array!26057 array!26059 (_ BitVec 32) (_ BitVec 32) V!15917 V!15917 (_ BitVec 32) (_ BitVec 64) V!15917 (_ BitVec 32) Int) Unit!12518)

(assert (=> b!426397 (= lt!194948 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!503 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!426398 () Bool)

(assert (=> b!426398 (= e!252978 e!252980)))

(declare-fun res!249853 () Bool)

(assert (=> b!426398 (=> (not res!249853) (not e!252980))))

(assert (=> b!426398 (= res!249853 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194945 mask!1025))))

(assert (=> b!426398 (= lt!194945 (array!26058 (store (arr!12478 _keys!709) i!563 k0!794) (size!12830 _keys!709)))))

(assert (= (and start!39690 res!249862) b!426390))

(assert (= (and b!426390 res!249857) b!426394))

(assert (= (and b!426394 res!249858) b!426386))

(assert (= (and b!426386 res!249860) b!426392))

(assert (= (and b!426392 res!249852) b!426383))

(assert (= (and b!426383 res!249855) b!426385))

(assert (= (and b!426385 res!249864) b!426384))

(assert (= (and b!426384 res!249861) b!426389))

(assert (= (and b!426389 res!249863) b!426398))

(assert (= (and b!426398 res!249853) b!426396))

(assert (= (and b!426396 res!249859) b!426395))

(assert (= (and b!426395 res!249854) b!426393))

(assert (= (and b!426393 res!249856) b!426397))

(assert (= (and b!426391 condMapEmpty!18285) mapIsEmpty!18285))

(assert (= (and b!426391 (not condMapEmpty!18285)) mapNonEmpty!18285))

(get-info :version)

(assert (= (and mapNonEmpty!18285 ((_ is ValueCellFull!5211) mapValue!18285)) b!426388))

(assert (= (and b!426391 ((_ is ValueCellFull!5211) mapDefault!18285)) b!426387))

(assert (= start!39690 b!426391))

(declare-fun m!415085 () Bool)

(assert (=> b!426386 m!415085))

(declare-fun m!415087 () Bool)

(assert (=> b!426396 m!415087))

(declare-fun m!415089 () Bool)

(assert (=> b!426397 m!415089))

(declare-fun m!415091 () Bool)

(assert (=> b!426397 m!415091))

(assert (=> b!426397 m!415091))

(declare-fun m!415093 () Bool)

(assert (=> b!426397 m!415093))

(declare-fun m!415095 () Bool)

(assert (=> b!426397 m!415095))

(declare-fun m!415097 () Bool)

(assert (=> b!426393 m!415097))

(declare-fun m!415099 () Bool)

(assert (=> b!426393 m!415099))

(declare-fun m!415101 () Bool)

(assert (=> b!426393 m!415101))

(declare-fun m!415103 () Bool)

(assert (=> b!426398 m!415103))

(declare-fun m!415105 () Bool)

(assert (=> b!426398 m!415105))

(declare-fun m!415107 () Bool)

(assert (=> b!426392 m!415107))

(declare-fun m!415109 () Bool)

(assert (=> b!426390 m!415109))

(declare-fun m!415111 () Bool)

(assert (=> start!39690 m!415111))

(declare-fun m!415113 () Bool)

(assert (=> start!39690 m!415113))

(declare-fun m!415115 () Bool)

(assert (=> mapNonEmpty!18285 m!415115))

(declare-fun m!415117 () Bool)

(assert (=> b!426384 m!415117))

(declare-fun m!415119 () Bool)

(assert (=> b!426389 m!415119))

(declare-fun m!415121 () Bool)

(assert (=> b!426385 m!415121))

(check-sat (not b!426386) (not b!426393) (not b!426385) tp_is_empty!11109 (not b_next!9957) (not b!426389) (not b!426396) (not b!426398) (not mapNonEmpty!18285) (not b!426397) (not start!39690) (not b!426392) (not b!426390) b_and!17613)
(check-sat b_and!17613 (not b_next!9957))
