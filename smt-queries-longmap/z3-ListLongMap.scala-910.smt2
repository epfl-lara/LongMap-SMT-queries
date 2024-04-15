; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20560 () Bool)

(assert start!20560)

(declare-fun b_free!5215 () Bool)

(declare-fun b_next!5215 () Bool)

(assert (=> start!20560 (= b_free!5215 (not b_next!5215))))

(declare-fun tp!18677 () Bool)

(declare-fun b_and!11935 () Bool)

(assert (=> start!20560 (= tp!18677 b_and!11935)))

(declare-fun b!204369 () Bool)

(declare-fun e!133709 () Bool)

(assert (=> b!204369 (= e!133709 true)))

(declare-datatypes ((V!6409 0))(
  ( (V!6410 (val!2580 Int)) )
))
(declare-datatypes ((tuple2!3896 0))(
  ( (tuple2!3897 (_1!1959 (_ BitVec 64)) (_2!1959 V!6409)) )
))
(declare-datatypes ((List!2800 0))(
  ( (Nil!2797) (Cons!2796 (h!3438 tuple2!3896) (t!7722 List!2800)) )
))
(declare-datatypes ((ListLongMap!2799 0))(
  ( (ListLongMap!2800 (toList!1415 List!2800)) )
))
(declare-fun lt!103478 () ListLongMap!2799)

(declare-fun lt!103474 () ListLongMap!2799)

(declare-fun lt!103467 () tuple2!3896)

(declare-fun +!464 (ListLongMap!2799 tuple2!3896) ListLongMap!2799)

(assert (=> b!204369 (= lt!103478 (+!464 lt!103474 lt!103467))))

(declare-fun lt!103470 () ListLongMap!2799)

(declare-fun v!520 () V!6409)

(declare-fun k0!843 () (_ BitVec 64))

(declare-datatypes ((Unit!6170 0))(
  ( (Unit!6171) )
))
(declare-fun lt!103469 () Unit!6170)

(declare-fun minValue!615 () V!6409)

(declare-fun addCommutativeForDiffKeys!154 (ListLongMap!2799 (_ BitVec 64) V!6409 (_ BitVec 64) V!6409) Unit!6170)

(assert (=> b!204369 (= lt!103469 (addCommutativeForDiffKeys!154 lt!103470 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!204370 () Bool)

(declare-fun e!133710 () Bool)

(declare-fun e!133704 () Bool)

(assert (=> b!204370 (= e!133710 (not e!133704))))

(declare-fun res!98470 () Bool)

(assert (=> b!204370 (=> res!98470 e!133704)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!204370 (= res!98470 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((ValueCell!2192 0))(
  ( (ValueCellFull!2192 (v!4544 V!6409)) (EmptyCell!2192) )
))
(declare-datatypes ((array!9347 0))(
  ( (array!9348 (arr!4423 (Array (_ BitVec 32) ValueCell!2192)) (size!4749 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9347)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun lt!103475 () ListLongMap!2799)

(declare-fun zeroValue!615 () V!6409)

(declare-datatypes ((array!9349 0))(
  ( (array!9350 (arr!4424 (Array (_ BitVec 32) (_ BitVec 64))) (size!4750 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9349)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!962 (array!9349 array!9347 (_ BitVec 32) (_ BitVec 32) V!6409 V!6409 (_ BitVec 32) Int) ListLongMap!2799)

(assert (=> b!204370 (= lt!103475 (getCurrentListMap!962 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103471 () ListLongMap!2799)

(declare-fun lt!103477 () array!9347)

(assert (=> b!204370 (= lt!103471 (getCurrentListMap!962 _keys!825 lt!103477 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103472 () ListLongMap!2799)

(declare-fun lt!103473 () ListLongMap!2799)

(assert (=> b!204370 (and (= lt!103472 lt!103473) (= lt!103473 lt!103472))))

(assert (=> b!204370 (= lt!103473 (+!464 lt!103470 lt!103467))))

(assert (=> b!204370 (= lt!103467 (tuple2!3897 k0!843 v!520))))

(declare-fun lt!103468 () Unit!6170)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!121 (array!9349 array!9347 (_ BitVec 32) (_ BitVec 32) V!6409 V!6409 (_ BitVec 32) (_ BitVec 64) V!6409 (_ BitVec 32) Int) Unit!6170)

(assert (=> b!204370 (= lt!103468 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!121 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!372 (array!9349 array!9347 (_ BitVec 32) (_ BitVec 32) V!6409 V!6409 (_ BitVec 32) Int) ListLongMap!2799)

(assert (=> b!204370 (= lt!103472 (getCurrentListMapNoExtraKeys!372 _keys!825 lt!103477 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204370 (= lt!103477 (array!9348 (store (arr!4423 _values!649) i!601 (ValueCellFull!2192 v!520)) (size!4749 _values!649)))))

(assert (=> b!204370 (= lt!103470 (getCurrentListMapNoExtraKeys!372 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!204371 () Bool)

(assert (=> b!204371 (= e!133704 e!133709)))

(declare-fun res!98473 () Bool)

(assert (=> b!204371 (=> res!98473 e!133709)))

(assert (=> b!204371 (= res!98473 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!204371 (= lt!103475 lt!103474)))

(declare-fun lt!103476 () tuple2!3896)

(assert (=> b!204371 (= lt!103474 (+!464 lt!103470 lt!103476))))

(assert (=> b!204371 (= lt!103471 lt!103478)))

(assert (=> b!204371 (= lt!103478 (+!464 lt!103473 lt!103476))))

(assert (=> b!204371 (= lt!103471 (+!464 lt!103472 lt!103476))))

(assert (=> b!204371 (= lt!103476 (tuple2!3897 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!204372 () Bool)

(declare-fun res!98472 () Bool)

(assert (=> b!204372 (=> (not res!98472) (not e!133710))))

(assert (=> b!204372 (= res!98472 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4750 _keys!825))))))

(declare-fun b!204373 () Bool)

(declare-fun res!98469 () Bool)

(assert (=> b!204373 (=> (not res!98469) (not e!133710))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9349 (_ BitVec 32)) Bool)

(assert (=> b!204373 (= res!98469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!204374 () Bool)

(declare-fun res!98477 () Bool)

(assert (=> b!204374 (=> (not res!98477) (not e!133710))))

(assert (=> b!204374 (= res!98477 (= (select (arr!4424 _keys!825) i!601) k0!843))))

(declare-fun b!204375 () Bool)

(declare-fun e!133707 () Bool)

(declare-fun tp_is_empty!5071 () Bool)

(assert (=> b!204375 (= e!133707 tp_is_empty!5071)))

(declare-fun b!204376 () Bool)

(declare-fun res!98476 () Bool)

(assert (=> b!204376 (=> (not res!98476) (not e!133710))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!204376 (= res!98476 (validKeyInArray!0 k0!843))))

(declare-fun mapIsEmpty!8675 () Bool)

(declare-fun mapRes!8675 () Bool)

(assert (=> mapIsEmpty!8675 mapRes!8675))

(declare-fun b!204377 () Bool)

(declare-fun res!98475 () Bool)

(assert (=> b!204377 (=> (not res!98475) (not e!133710))))

(assert (=> b!204377 (= res!98475 (and (= (size!4749 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4750 _keys!825) (size!4749 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!204378 () Bool)

(declare-fun e!133705 () Bool)

(assert (=> b!204378 (= e!133705 tp_is_empty!5071)))

(declare-fun b!204379 () Bool)

(declare-fun e!133706 () Bool)

(assert (=> b!204379 (= e!133706 (and e!133707 mapRes!8675))))

(declare-fun condMapEmpty!8675 () Bool)

(declare-fun mapDefault!8675 () ValueCell!2192)

(assert (=> b!204379 (= condMapEmpty!8675 (= (arr!4423 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2192)) mapDefault!8675)))))

(declare-fun b!204380 () Bool)

(declare-fun res!98471 () Bool)

(assert (=> b!204380 (=> (not res!98471) (not e!133710))))

(declare-datatypes ((List!2801 0))(
  ( (Nil!2798) (Cons!2797 (h!3439 (_ BitVec 64)) (t!7723 List!2801)) )
))
(declare-fun arrayNoDuplicates!0 (array!9349 (_ BitVec 32) List!2801) Bool)

(assert (=> b!204380 (= res!98471 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2798))))

(declare-fun res!98474 () Bool)

(assert (=> start!20560 (=> (not res!98474) (not e!133710))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20560 (= res!98474 (validMask!0 mask!1149))))

(assert (=> start!20560 e!133710))

(declare-fun array_inv!2907 (array!9347) Bool)

(assert (=> start!20560 (and (array_inv!2907 _values!649) e!133706)))

(assert (=> start!20560 true))

(assert (=> start!20560 tp_is_empty!5071))

(declare-fun array_inv!2908 (array!9349) Bool)

(assert (=> start!20560 (array_inv!2908 _keys!825)))

(assert (=> start!20560 tp!18677))

(declare-fun mapNonEmpty!8675 () Bool)

(declare-fun tp!18676 () Bool)

(assert (=> mapNonEmpty!8675 (= mapRes!8675 (and tp!18676 e!133705))))

(declare-fun mapKey!8675 () (_ BitVec 32))

(declare-fun mapValue!8675 () ValueCell!2192)

(declare-fun mapRest!8675 () (Array (_ BitVec 32) ValueCell!2192))

(assert (=> mapNonEmpty!8675 (= (arr!4423 _values!649) (store mapRest!8675 mapKey!8675 mapValue!8675))))

(assert (= (and start!20560 res!98474) b!204377))

(assert (= (and b!204377 res!98475) b!204373))

(assert (= (and b!204373 res!98469) b!204380))

(assert (= (and b!204380 res!98471) b!204372))

(assert (= (and b!204372 res!98472) b!204376))

(assert (= (and b!204376 res!98476) b!204374))

(assert (= (and b!204374 res!98477) b!204370))

(assert (= (and b!204370 (not res!98470)) b!204371))

(assert (= (and b!204371 (not res!98473)) b!204369))

(assert (= (and b!204379 condMapEmpty!8675) mapIsEmpty!8675))

(assert (= (and b!204379 (not condMapEmpty!8675)) mapNonEmpty!8675))

(get-info :version)

(assert (= (and mapNonEmpty!8675 ((_ is ValueCellFull!2192) mapValue!8675)) b!204378))

(assert (= (and b!204379 ((_ is ValueCellFull!2192) mapDefault!8675)) b!204375))

(assert (= start!20560 b!204379))

(declare-fun m!231423 () Bool)

(assert (=> start!20560 m!231423))

(declare-fun m!231425 () Bool)

(assert (=> start!20560 m!231425))

(declare-fun m!231427 () Bool)

(assert (=> start!20560 m!231427))

(declare-fun m!231429 () Bool)

(assert (=> b!204370 m!231429))

(declare-fun m!231431 () Bool)

(assert (=> b!204370 m!231431))

(declare-fun m!231433 () Bool)

(assert (=> b!204370 m!231433))

(declare-fun m!231435 () Bool)

(assert (=> b!204370 m!231435))

(declare-fun m!231437 () Bool)

(assert (=> b!204370 m!231437))

(declare-fun m!231439 () Bool)

(assert (=> b!204370 m!231439))

(declare-fun m!231441 () Bool)

(assert (=> b!204370 m!231441))

(declare-fun m!231443 () Bool)

(assert (=> b!204376 m!231443))

(declare-fun m!231445 () Bool)

(assert (=> b!204374 m!231445))

(declare-fun m!231447 () Bool)

(assert (=> b!204373 m!231447))

(declare-fun m!231449 () Bool)

(assert (=> b!204369 m!231449))

(declare-fun m!231451 () Bool)

(assert (=> b!204369 m!231451))

(declare-fun m!231453 () Bool)

(assert (=> b!204371 m!231453))

(declare-fun m!231455 () Bool)

(assert (=> b!204371 m!231455))

(declare-fun m!231457 () Bool)

(assert (=> b!204371 m!231457))

(declare-fun m!231459 () Bool)

(assert (=> mapNonEmpty!8675 m!231459))

(declare-fun m!231461 () Bool)

(assert (=> b!204380 m!231461))

(check-sat b_and!11935 (not b!204371) (not b!204370) (not b!204373) (not mapNonEmpty!8675) (not start!20560) (not b!204376) (not b_next!5215) tp_is_empty!5071 (not b!204380) (not b!204369))
(check-sat b_and!11935 (not b_next!5215))
