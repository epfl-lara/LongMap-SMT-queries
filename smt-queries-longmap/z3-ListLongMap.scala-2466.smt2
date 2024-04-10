; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38616 () Bool)

(assert start!38616)

(declare-fun b_free!9153 () Bool)

(declare-fun b_next!9153 () Bool)

(assert (=> start!38616 (= b_free!9153 (not b_next!9153))))

(declare-fun tp!32583 () Bool)

(declare-fun b_and!16539 () Bool)

(assert (=> start!38616 (= tp!32583 b_and!16539)))

(declare-datatypes ((V!14485 0))(
  ( (V!14486 (val!5062 Int)) )
))
(declare-datatypes ((tuple2!6712 0))(
  ( (tuple2!6713 (_1!3367 (_ BitVec 64)) (_2!3367 V!14485)) )
))
(declare-datatypes ((List!6634 0))(
  ( (Nil!6631) (Cons!6630 (h!7486 tuple2!6712) (t!11808 List!6634)) )
))
(declare-datatypes ((ListLongMap!5625 0))(
  ( (ListLongMap!5626 (toList!2828 List!6634)) )
))
(declare-fun call!28124 () ListLongMap!5625)

(declare-fun e!241609 () Bool)

(declare-fun b!400360 () Bool)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun call!28123 () ListLongMap!5625)

(declare-fun v!412 () V!14485)

(declare-fun +!1114 (ListLongMap!5625 tuple2!6712) ListLongMap!5625)

(assert (=> b!400360 (= e!241609 (= call!28123 (+!1114 call!28124 (tuple2!6713 k0!794 v!412))))))

(declare-fun b!400361 () Bool)

(declare-fun res!230336 () Bool)

(declare-fun e!241613 () Bool)

(assert (=> b!400361 (=> (not res!230336) (not e!241613))))

(declare-datatypes ((array!23979 0))(
  ( (array!23980 (arr!11439 (Array (_ BitVec 32) (_ BitVec 64))) (size!11791 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23979)

(declare-fun arrayContainsKey!0 (array!23979 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!400361 (= res!230336 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!400362 () Bool)

(declare-fun e!241612 () Bool)

(declare-fun tp_is_empty!10035 () Bool)

(assert (=> b!400362 (= e!241612 tp_is_empty!10035)))

(declare-fun res!230334 () Bool)

(assert (=> start!38616 (=> (not res!230334) (not e!241613))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38616 (= res!230334 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11791 _keys!709))))))

(assert (=> start!38616 e!241613))

(assert (=> start!38616 tp_is_empty!10035))

(assert (=> start!38616 tp!32583))

(assert (=> start!38616 true))

(declare-datatypes ((ValueCell!4674 0))(
  ( (ValueCellFull!4674 (v!7309 V!14485)) (EmptyCell!4674) )
))
(declare-datatypes ((array!23981 0))(
  ( (array!23982 (arr!11440 (Array (_ BitVec 32) ValueCell!4674)) (size!11792 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23981)

(declare-fun e!241614 () Bool)

(declare-fun array_inv!8378 (array!23981) Bool)

(assert (=> start!38616 (and (array_inv!8378 _values!549) e!241614)))

(declare-fun array_inv!8379 (array!23979) Bool)

(assert (=> start!38616 (array_inv!8379 _keys!709)))

(declare-fun b!400363 () Bool)

(declare-fun res!230331 () Bool)

(assert (=> b!400363 (=> (not res!230331) (not e!241613))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!400363 (= res!230331 (validKeyInArray!0 k0!794))))

(declare-fun b!400364 () Bool)

(declare-fun res!230328 () Bool)

(assert (=> b!400364 (=> (not res!230328) (not e!241613))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!400364 (= res!230328 (and (= (size!11792 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11791 _keys!709) (size!11792 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!400365 () Bool)

(declare-fun res!230333 () Bool)

(declare-fun e!241611 () Bool)

(assert (=> b!400365 (=> (not res!230333) (not e!241611))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!400365 (= res!230333 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11791 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!400366 () Bool)

(declare-fun res!230337 () Bool)

(assert (=> b!400366 (=> (not res!230337) (not e!241613))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23979 (_ BitVec 32)) Bool)

(assert (=> b!400366 (= res!230337 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!400367 () Bool)

(declare-fun res!230330 () Bool)

(assert (=> b!400367 (=> (not res!230330) (not e!241611))))

(declare-fun lt!187684 () array!23979)

(declare-datatypes ((List!6635 0))(
  ( (Nil!6632) (Cons!6631 (h!7487 (_ BitVec 64)) (t!11809 List!6635)) )
))
(declare-fun arrayNoDuplicates!0 (array!23979 (_ BitVec 32) List!6635) Bool)

(assert (=> b!400367 (= res!230330 (arrayNoDuplicates!0 lt!187684 #b00000000000000000000000000000000 Nil!6632))))

(declare-fun mapIsEmpty!16674 () Bool)

(declare-fun mapRes!16674 () Bool)

(assert (=> mapIsEmpty!16674 mapRes!16674))

(declare-fun b!400368 () Bool)

(declare-fun res!230326 () Bool)

(assert (=> b!400368 (=> (not res!230326) (not e!241613))))

(assert (=> b!400368 (= res!230326 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11791 _keys!709))))))

(declare-fun b!400369 () Bool)

(declare-fun res!230329 () Bool)

(assert (=> b!400369 (=> (not res!230329) (not e!241613))))

(assert (=> b!400369 (= res!230329 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6632))))

(declare-fun mapNonEmpty!16674 () Bool)

(declare-fun tp!32582 () Bool)

(assert (=> mapNonEmpty!16674 (= mapRes!16674 (and tp!32582 e!241612))))

(declare-fun mapValue!16674 () ValueCell!4674)

(declare-fun mapKey!16674 () (_ BitVec 32))

(declare-fun mapRest!16674 () (Array (_ BitVec 32) ValueCell!4674))

(assert (=> mapNonEmpty!16674 (= (arr!11440 _values!549) (store mapRest!16674 mapKey!16674 mapValue!16674))))

(declare-fun b!400370 () Bool)

(assert (=> b!400370 (= e!241611 (not true))))

(assert (=> b!400370 e!241609))

(declare-fun c!54686 () Bool)

(assert (=> b!400370 (= c!54686 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!14485)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((Unit!12130 0))(
  ( (Unit!12131) )
))
(declare-fun lt!187685 () Unit!12130)

(declare-fun zeroValue!515 () V!14485)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!323 (array!23979 array!23981 (_ BitVec 32) (_ BitVec 32) V!14485 V!14485 (_ BitVec 32) (_ BitVec 64) V!14485 (_ BitVec 32) Int) Unit!12130)

(assert (=> b!400370 (= lt!187685 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!323 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400371 () Bool)

(declare-fun res!230335 () Bool)

(assert (=> b!400371 (=> (not res!230335) (not e!241613))))

(assert (=> b!400371 (= res!230335 (or (= (select (arr!11439 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11439 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!28120 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1041 (array!23979 array!23981 (_ BitVec 32) (_ BitVec 32) V!14485 V!14485 (_ BitVec 32) Int) ListLongMap!5625)

(assert (=> bm!28120 (= call!28123 (getCurrentListMapNoExtraKeys!1041 (ite c!54686 lt!187684 _keys!709) (ite c!54686 (array!23982 (store (arr!11440 _values!549) i!563 (ValueCellFull!4674 v!412)) (size!11792 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!28121 () Bool)

(assert (=> bm!28121 (= call!28124 (getCurrentListMapNoExtraKeys!1041 (ite c!54686 _keys!709 lt!187684) (ite c!54686 _values!549 (array!23982 (store (arr!11440 _values!549) i!563 (ValueCellFull!4674 v!412)) (size!11792 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400372 () Bool)

(declare-fun e!241610 () Bool)

(assert (=> b!400372 (= e!241610 tp_is_empty!10035)))

(declare-fun b!400373 () Bool)

(assert (=> b!400373 (= e!241614 (and e!241610 mapRes!16674))))

(declare-fun condMapEmpty!16674 () Bool)

(declare-fun mapDefault!16674 () ValueCell!4674)

(assert (=> b!400373 (= condMapEmpty!16674 (= (arr!11440 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4674)) mapDefault!16674)))))

(declare-fun b!400374 () Bool)

(assert (=> b!400374 (= e!241613 e!241611)))

(declare-fun res!230327 () Bool)

(assert (=> b!400374 (=> (not res!230327) (not e!241611))))

(assert (=> b!400374 (= res!230327 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187684 mask!1025))))

(assert (=> b!400374 (= lt!187684 (array!23980 (store (arr!11439 _keys!709) i!563 k0!794) (size!11791 _keys!709)))))

(declare-fun b!400375 () Bool)

(assert (=> b!400375 (= e!241609 (= call!28124 call!28123))))

(declare-fun b!400376 () Bool)

(declare-fun res!230332 () Bool)

(assert (=> b!400376 (=> (not res!230332) (not e!241613))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!400376 (= res!230332 (validMask!0 mask!1025))))

(assert (= (and start!38616 res!230334) b!400376))

(assert (= (and b!400376 res!230332) b!400364))

(assert (= (and b!400364 res!230328) b!400366))

(assert (= (and b!400366 res!230337) b!400369))

(assert (= (and b!400369 res!230329) b!400368))

(assert (= (and b!400368 res!230326) b!400363))

(assert (= (and b!400363 res!230331) b!400371))

(assert (= (and b!400371 res!230335) b!400361))

(assert (= (and b!400361 res!230336) b!400374))

(assert (= (and b!400374 res!230327) b!400367))

(assert (= (and b!400367 res!230330) b!400365))

(assert (= (and b!400365 res!230333) b!400370))

(assert (= (and b!400370 c!54686) b!400360))

(assert (= (and b!400370 (not c!54686)) b!400375))

(assert (= (or b!400360 b!400375) bm!28120))

(assert (= (or b!400360 b!400375) bm!28121))

(assert (= (and b!400373 condMapEmpty!16674) mapIsEmpty!16674))

(assert (= (and b!400373 (not condMapEmpty!16674)) mapNonEmpty!16674))

(get-info :version)

(assert (= (and mapNonEmpty!16674 ((_ is ValueCellFull!4674) mapValue!16674)) b!400362))

(assert (= (and b!400373 ((_ is ValueCellFull!4674) mapDefault!16674)) b!400372))

(assert (= start!38616 b!400373))

(declare-fun m!394577 () Bool)

(assert (=> bm!28120 m!394577))

(declare-fun m!394579 () Bool)

(assert (=> bm!28120 m!394579))

(declare-fun m!394581 () Bool)

(assert (=> mapNonEmpty!16674 m!394581))

(declare-fun m!394583 () Bool)

(assert (=> b!400363 m!394583))

(declare-fun m!394585 () Bool)

(assert (=> start!38616 m!394585))

(declare-fun m!394587 () Bool)

(assert (=> start!38616 m!394587))

(declare-fun m!394589 () Bool)

(assert (=> b!400361 m!394589))

(declare-fun m!394591 () Bool)

(assert (=> b!400369 m!394591))

(declare-fun m!394593 () Bool)

(assert (=> b!400367 m!394593))

(declare-fun m!394595 () Bool)

(assert (=> b!400371 m!394595))

(assert (=> bm!28121 m!394577))

(declare-fun m!394597 () Bool)

(assert (=> bm!28121 m!394597))

(declare-fun m!394599 () Bool)

(assert (=> b!400376 m!394599))

(declare-fun m!394601 () Bool)

(assert (=> b!400370 m!394601))

(declare-fun m!394603 () Bool)

(assert (=> b!400374 m!394603))

(declare-fun m!394605 () Bool)

(assert (=> b!400374 m!394605))

(declare-fun m!394607 () Bool)

(assert (=> b!400366 m!394607))

(declare-fun m!394609 () Bool)

(assert (=> b!400360 m!394609))

(check-sat (not b!400376) (not b!400370) (not bm!28120) (not b!400363) (not b!400360) (not b_next!9153) (not b!400374) tp_is_empty!10035 (not start!38616) (not b!400366) (not mapNonEmpty!16674) (not bm!28121) (not b!400367) (not b!400361) b_and!16539 (not b!400369))
(check-sat b_and!16539 (not b_next!9153))
