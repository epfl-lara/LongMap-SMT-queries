; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37422 () Bool)

(assert start!37422)

(declare-fun b_free!8563 () Bool)

(declare-fun b_next!8563 () Bool)

(assert (=> start!37422 (= b_free!8563 (not b_next!8563))))

(declare-fun tp!30404 () Bool)

(declare-fun b_and!15779 () Bool)

(assert (=> start!37422 (= tp!30404 b_and!15779)))

(declare-fun b!380829 () Bool)

(declare-fun e!231558 () Bool)

(declare-fun tp_is_empty!9211 () Bool)

(assert (=> b!380829 (= e!231558 tp_is_empty!9211)))

(declare-fun b!380830 () Bool)

(declare-fun res!216345 () Bool)

(declare-fun e!231561 () Bool)

(assert (=> b!380830 (=> (not res!216345) (not e!231561))))

(declare-datatypes ((array!22319 0))(
  ( (array!22320 (arr!10628 (Array (_ BitVec 32) (_ BitVec 64))) (size!10981 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22319)

(declare-datatypes ((List!6040 0))(
  ( (Nil!6037) (Cons!6036 (h!6892 (_ BitVec 64)) (t!11181 List!6040)) )
))
(declare-fun arrayNoDuplicates!0 (array!22319 (_ BitVec 32) List!6040) Bool)

(assert (=> b!380830 (= res!216345 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6037))))

(declare-fun b!380831 () Bool)

(declare-fun res!216347 () Bool)

(assert (=> b!380831 (=> (not res!216347) (not e!231561))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13387 0))(
  ( (V!13388 (val!4650 Int)) )
))
(declare-datatypes ((ValueCell!4262 0))(
  ( (ValueCellFull!4262 (v!6841 V!13387)) (EmptyCell!4262) )
))
(declare-datatypes ((array!22321 0))(
  ( (array!22322 (arr!10629 (Array (_ BitVec 32) ValueCell!4262)) (size!10982 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22321)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!380831 (= res!216347 (and (= (size!10982 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10981 _keys!658) (size!10982 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!380832 () Bool)

(declare-fun res!216349 () Bool)

(declare-fun e!231562 () Bool)

(assert (=> b!380832 (=> (not res!216349) (not e!231562))))

(declare-fun lt!178330 () array!22319)

(assert (=> b!380832 (= res!216349 (arrayNoDuplicates!0 lt!178330 #b00000000000000000000000000000000 Nil!6037))))

(declare-fun b!380833 () Bool)

(declare-fun res!216348 () Bool)

(assert (=> b!380833 (=> (not res!216348) (not e!231561))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!380833 (= res!216348 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10981 _keys!658))))))

(declare-fun b!380834 () Bool)

(declare-fun e!231559 () Bool)

(declare-fun e!231563 () Bool)

(declare-fun mapRes!15381 () Bool)

(assert (=> b!380834 (= e!231559 (and e!231563 mapRes!15381))))

(declare-fun condMapEmpty!15381 () Bool)

(declare-fun mapDefault!15381 () ValueCell!4262)

(assert (=> b!380834 (= condMapEmpty!15381 (= (arr!10629 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4262)) mapDefault!15381)))))

(declare-fun b!380835 () Bool)

(declare-fun e!231557 () Bool)

(assert (=> b!380835 (= e!231557 true)))

(declare-datatypes ((tuple2!6212 0))(
  ( (tuple2!6213 (_1!3117 (_ BitVec 64)) (_2!3117 V!13387)) )
))
(declare-datatypes ((List!6041 0))(
  ( (Nil!6038) (Cons!6037 (h!6893 tuple2!6212) (t!11182 List!6041)) )
))
(declare-datatypes ((ListLongMap!5115 0))(
  ( (ListLongMap!5116 (toList!2573 List!6041)) )
))
(declare-fun lt!178329 () ListLongMap!5115)

(declare-fun lt!178332 () ListLongMap!5115)

(assert (=> b!380835 (= lt!178329 lt!178332)))

(declare-fun b!380836 () Bool)

(declare-fun res!216344 () Bool)

(assert (=> b!380836 (=> (not res!216344) (not e!231561))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22319 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!380836 (= res!216344 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!380837 () Bool)

(declare-fun res!216352 () Bool)

(assert (=> b!380837 (=> (not res!216352) (not e!231561))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!380837 (= res!216352 (validKeyInArray!0 k0!778))))

(declare-fun b!380838 () Bool)

(assert (=> b!380838 (= e!231563 tp_is_empty!9211)))

(declare-fun b!380839 () Bool)

(declare-fun res!216343 () Bool)

(assert (=> b!380839 (=> (not res!216343) (not e!231561))))

(assert (=> b!380839 (= res!216343 (or (= (select (arr!10628 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10628 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!380840 () Bool)

(declare-fun res!216350 () Bool)

(assert (=> b!380840 (=> (not res!216350) (not e!231561))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22319 (_ BitVec 32)) Bool)

(assert (=> b!380840 (= res!216350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!380841 () Bool)

(assert (=> b!380841 (= e!231561 e!231562)))

(declare-fun res!216346 () Bool)

(assert (=> b!380841 (=> (not res!216346) (not e!231562))))

(assert (=> b!380841 (= res!216346 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!178330 mask!970))))

(assert (=> b!380841 (= lt!178330 (array!22320 (store (arr!10628 _keys!658) i!548 k0!778) (size!10981 _keys!658)))))

(declare-fun b!380842 () Bool)

(assert (=> b!380842 (= e!231562 (not e!231557))))

(declare-fun res!216351 () Bool)

(assert (=> b!380842 (=> res!216351 e!231557)))

(declare-fun lt!178331 () Bool)

(assert (=> b!380842 (= res!216351 (or (and (not lt!178331) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!178331) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!178331)))))

(assert (=> b!380842 (= lt!178331 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun lt!178335 () ListLongMap!5115)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13387)

(declare-fun minValue!472 () V!13387)

(declare-fun getCurrentListMap!1965 (array!22319 array!22321 (_ BitVec 32) (_ BitVec 32) V!13387 V!13387 (_ BitVec 32) Int) ListLongMap!5115)

(assert (=> b!380842 (= lt!178335 (getCurrentListMap!1965 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178334 () array!22321)

(assert (=> b!380842 (= lt!178329 (getCurrentListMap!1965 lt!178330 lt!178334 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178328 () ListLongMap!5115)

(assert (=> b!380842 (and (= lt!178332 lt!178328) (= lt!178328 lt!178332))))

(declare-fun v!373 () V!13387)

(declare-fun lt!178333 () ListLongMap!5115)

(declare-fun +!939 (ListLongMap!5115 tuple2!6212) ListLongMap!5115)

(assert (=> b!380842 (= lt!178328 (+!939 lt!178333 (tuple2!6213 k0!778 v!373)))))

(declare-datatypes ((Unit!11736 0))(
  ( (Unit!11737) )
))
(declare-fun lt!178327 () Unit!11736)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!158 (array!22319 array!22321 (_ BitVec 32) (_ BitVec 32) V!13387 V!13387 (_ BitVec 32) (_ BitVec 64) V!13387 (_ BitVec 32) Int) Unit!11736)

(assert (=> b!380842 (= lt!178327 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!158 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!830 (array!22319 array!22321 (_ BitVec 32) (_ BitVec 32) V!13387 V!13387 (_ BitVec 32) Int) ListLongMap!5115)

(assert (=> b!380842 (= lt!178332 (getCurrentListMapNoExtraKeys!830 lt!178330 lt!178334 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!380842 (= lt!178334 (array!22322 (store (arr!10629 _values!506) i!548 (ValueCellFull!4262 v!373)) (size!10982 _values!506)))))

(assert (=> b!380842 (= lt!178333 (getCurrentListMapNoExtraKeys!830 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun res!216353 () Bool)

(assert (=> start!37422 (=> (not res!216353) (not e!231561))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37422 (= res!216353 (validMask!0 mask!970))))

(assert (=> start!37422 e!231561))

(declare-fun array_inv!7828 (array!22321) Bool)

(assert (=> start!37422 (and (array_inv!7828 _values!506) e!231559)))

(assert (=> start!37422 tp!30404))

(assert (=> start!37422 true))

(assert (=> start!37422 tp_is_empty!9211))

(declare-fun array_inv!7829 (array!22319) Bool)

(assert (=> start!37422 (array_inv!7829 _keys!658)))

(declare-fun mapIsEmpty!15381 () Bool)

(assert (=> mapIsEmpty!15381 mapRes!15381))

(declare-fun mapNonEmpty!15381 () Bool)

(declare-fun tp!30405 () Bool)

(assert (=> mapNonEmpty!15381 (= mapRes!15381 (and tp!30405 e!231558))))

(declare-fun mapKey!15381 () (_ BitVec 32))

(declare-fun mapRest!15381 () (Array (_ BitVec 32) ValueCell!4262))

(declare-fun mapValue!15381 () ValueCell!4262)

(assert (=> mapNonEmpty!15381 (= (arr!10629 _values!506) (store mapRest!15381 mapKey!15381 mapValue!15381))))

(assert (= (and start!37422 res!216353) b!380831))

(assert (= (and b!380831 res!216347) b!380840))

(assert (= (and b!380840 res!216350) b!380830))

(assert (= (and b!380830 res!216345) b!380833))

(assert (= (and b!380833 res!216348) b!380837))

(assert (= (and b!380837 res!216352) b!380839))

(assert (= (and b!380839 res!216343) b!380836))

(assert (= (and b!380836 res!216344) b!380841))

(assert (= (and b!380841 res!216346) b!380832))

(assert (= (and b!380832 res!216349) b!380842))

(assert (= (and b!380842 (not res!216351)) b!380835))

(assert (= (and b!380834 condMapEmpty!15381) mapIsEmpty!15381))

(assert (= (and b!380834 (not condMapEmpty!15381)) mapNonEmpty!15381))

(get-info :version)

(assert (= (and mapNonEmpty!15381 ((_ is ValueCellFull!4262) mapValue!15381)) b!380829))

(assert (= (and b!380834 ((_ is ValueCellFull!4262) mapDefault!15381)) b!380838))

(assert (= start!37422 b!380834))

(declare-fun m!377327 () Bool)

(assert (=> b!380840 m!377327))

(declare-fun m!377329 () Bool)

(assert (=> mapNonEmpty!15381 m!377329))

(declare-fun m!377331 () Bool)

(assert (=> b!380841 m!377331))

(declare-fun m!377333 () Bool)

(assert (=> b!380841 m!377333))

(declare-fun m!377335 () Bool)

(assert (=> start!37422 m!377335))

(declare-fun m!377337 () Bool)

(assert (=> start!37422 m!377337))

(declare-fun m!377339 () Bool)

(assert (=> start!37422 m!377339))

(declare-fun m!377341 () Bool)

(assert (=> b!380830 m!377341))

(declare-fun m!377343 () Bool)

(assert (=> b!380842 m!377343))

(declare-fun m!377345 () Bool)

(assert (=> b!380842 m!377345))

(declare-fun m!377347 () Bool)

(assert (=> b!380842 m!377347))

(declare-fun m!377349 () Bool)

(assert (=> b!380842 m!377349))

(declare-fun m!377351 () Bool)

(assert (=> b!380842 m!377351))

(declare-fun m!377353 () Bool)

(assert (=> b!380842 m!377353))

(declare-fun m!377355 () Bool)

(assert (=> b!380842 m!377355))

(declare-fun m!377357 () Bool)

(assert (=> b!380836 m!377357))

(declare-fun m!377359 () Bool)

(assert (=> b!380832 m!377359))

(declare-fun m!377361 () Bool)

(assert (=> b!380839 m!377361))

(declare-fun m!377363 () Bool)

(assert (=> b!380837 m!377363))

(check-sat (not b!380842) (not b!380841) (not mapNonEmpty!15381) (not b!380830) (not b!380840) (not b_next!8563) (not b!380832) (not b!380837) b_and!15779 (not b!380836) (not start!37422) tp_is_empty!9211)
(check-sat b_and!15779 (not b_next!8563))
