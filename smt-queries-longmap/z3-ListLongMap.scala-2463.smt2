; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38582 () Bool)

(assert start!38582)

(declare-fun b_free!9133 () Bool)

(declare-fun b_next!9133 () Bool)

(assert (=> start!38582 (= b_free!9133 (not b_next!9133))))

(declare-fun tp!32523 () Bool)

(declare-fun b_and!16493 () Bool)

(assert (=> start!38582 (= tp!32523 b_and!16493)))

(declare-fun b!399579 () Bool)

(declare-fun res!229842 () Bool)

(declare-fun e!241229 () Bool)

(assert (=> b!399579 (=> (not res!229842) (not e!241229))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!399579 (= res!229842 (validMask!0 mask!1025))))

(declare-fun b!399580 () Bool)

(declare-fun e!241225 () Bool)

(assert (=> b!399580 (= e!241225 (not true))))

(declare-fun e!241228 () Bool)

(assert (=> b!399580 e!241228))

(declare-fun c!54585 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!399580 (= c!54585 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14459 0))(
  ( (V!14460 (val!5052 Int)) )
))
(declare-datatypes ((ValueCell!4664 0))(
  ( (ValueCellFull!4664 (v!7293 V!14459)) (EmptyCell!4664) )
))
(declare-datatypes ((array!23919 0))(
  ( (array!23920 (arr!11409 (Array (_ BitVec 32) ValueCell!4664)) (size!11762 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23919)

(declare-fun zeroValue!515 () V!14459)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!14459)

(declare-datatypes ((array!23921 0))(
  ( (array!23922 (arr!11410 (Array (_ BitVec 32) (_ BitVec 64))) (size!11763 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23921)

(declare-fun minValue!515 () V!14459)

(declare-datatypes ((Unit!12088 0))(
  ( (Unit!12089) )
))
(declare-fun lt!187390 () Unit!12088)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!307 (array!23921 array!23919 (_ BitVec 32) (_ BitVec 32) V!14459 V!14459 (_ BitVec 32) (_ BitVec 64) V!14459 (_ BitVec 32) Int) Unit!12088)

(assert (=> b!399580 (= lt!187390 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!307 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!28035 () Bool)

(declare-datatypes ((tuple2!6666 0))(
  ( (tuple2!6667 (_1!3344 (_ BitVec 64)) (_2!3344 V!14459)) )
))
(declare-datatypes ((List!6575 0))(
  ( (Nil!6572) (Cons!6571 (h!7427 tuple2!6666) (t!11740 List!6575)) )
))
(declare-datatypes ((ListLongMap!5569 0))(
  ( (ListLongMap!5570 (toList!2800 List!6575)) )
))
(declare-fun call!28039 () ListLongMap!5569)

(declare-fun lt!187391 () array!23921)

(declare-fun getCurrentListMapNoExtraKeys!1019 (array!23921 array!23919 (_ BitVec 32) (_ BitVec 32) V!14459 V!14459 (_ BitVec 32) Int) ListLongMap!5569)

(assert (=> bm!28035 (= call!28039 (getCurrentListMapNoExtraKeys!1019 (ite c!54585 lt!187391 _keys!709) (ite c!54585 (array!23920 (store (arr!11409 _values!549) i!563 (ValueCellFull!4664 v!412)) (size!11762 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399581 () Bool)

(assert (=> b!399581 (= e!241229 e!241225)))

(declare-fun res!229846 () Bool)

(assert (=> b!399581 (=> (not res!229846) (not e!241225))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23921 (_ BitVec 32)) Bool)

(assert (=> b!399581 (= res!229846 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187391 mask!1025))))

(assert (=> b!399581 (= lt!187391 (array!23922 (store (arr!11410 _keys!709) i!563 k0!794) (size!11763 _keys!709)))))

(declare-fun bm!28036 () Bool)

(declare-fun call!28038 () ListLongMap!5569)

(assert (=> bm!28036 (= call!28038 (getCurrentListMapNoExtraKeys!1019 (ite c!54585 _keys!709 lt!187391) (ite c!54585 _values!549 (array!23920 (store (arr!11409 _values!549) i!563 (ValueCellFull!4664 v!412)) (size!11762 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399582 () Bool)

(declare-fun res!229837 () Bool)

(assert (=> b!399582 (=> (not res!229837) (not e!241229))))

(declare-datatypes ((List!6576 0))(
  ( (Nil!6573) (Cons!6572 (h!7428 (_ BitVec 64)) (t!11741 List!6576)) )
))
(declare-fun arrayNoDuplicates!0 (array!23921 (_ BitVec 32) List!6576) Bool)

(assert (=> b!399582 (= res!229837 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6573))))

(declare-fun res!229843 () Bool)

(assert (=> start!38582 (=> (not res!229843) (not e!241229))))

(assert (=> start!38582 (= res!229843 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11763 _keys!709))))))

(assert (=> start!38582 e!241229))

(declare-fun tp_is_empty!10015 () Bool)

(assert (=> start!38582 tp_is_empty!10015))

(assert (=> start!38582 tp!32523))

(assert (=> start!38582 true))

(declare-fun e!241226 () Bool)

(declare-fun array_inv!8374 (array!23919) Bool)

(assert (=> start!38582 (and (array_inv!8374 _values!549) e!241226)))

(declare-fun array_inv!8375 (array!23921) Bool)

(assert (=> start!38582 (array_inv!8375 _keys!709)))

(declare-fun b!399583 () Bool)

(declare-fun e!241227 () Bool)

(assert (=> b!399583 (= e!241227 tp_is_empty!10015)))

(declare-fun b!399584 () Bool)

(declare-fun res!229847 () Bool)

(assert (=> b!399584 (=> (not res!229847) (not e!241229))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!399584 (= res!229847 (validKeyInArray!0 k0!794))))

(declare-fun b!399585 () Bool)

(declare-fun res!229845 () Bool)

(assert (=> b!399585 (=> (not res!229845) (not e!241229))))

(assert (=> b!399585 (= res!229845 (and (= (size!11762 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11763 _keys!709) (size!11762 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!399586 () Bool)

(declare-fun res!229839 () Bool)

(assert (=> b!399586 (=> (not res!229839) (not e!241229))))

(assert (=> b!399586 (= res!229839 (or (= (select (arr!11410 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11410 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!399587 () Bool)

(assert (=> b!399587 (= e!241228 (= call!28038 call!28039))))

(declare-fun b!399588 () Bool)

(declare-fun res!229840 () Bool)

(assert (=> b!399588 (=> (not res!229840) (not e!241229))))

(assert (=> b!399588 (= res!229840 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11763 _keys!709))))))

(declare-fun mapNonEmpty!16644 () Bool)

(declare-fun mapRes!16644 () Bool)

(declare-fun tp!32522 () Bool)

(declare-fun e!241224 () Bool)

(assert (=> mapNonEmpty!16644 (= mapRes!16644 (and tp!32522 e!241224))))

(declare-fun mapRest!16644 () (Array (_ BitVec 32) ValueCell!4664))

(declare-fun mapKey!16644 () (_ BitVec 32))

(declare-fun mapValue!16644 () ValueCell!4664)

(assert (=> mapNonEmpty!16644 (= (arr!11409 _values!549) (store mapRest!16644 mapKey!16644 mapValue!16644))))

(declare-fun b!399589 () Bool)

(declare-fun res!229848 () Bool)

(assert (=> b!399589 (=> (not res!229848) (not e!241229))))

(declare-fun arrayContainsKey!0 (array!23921 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!399589 (= res!229848 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!399590 () Bool)

(assert (=> b!399590 (= e!241226 (and e!241227 mapRes!16644))))

(declare-fun condMapEmpty!16644 () Bool)

(declare-fun mapDefault!16644 () ValueCell!4664)

(assert (=> b!399590 (= condMapEmpty!16644 (= (arr!11409 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4664)) mapDefault!16644)))))

(declare-fun b!399591 () Bool)

(declare-fun res!229838 () Bool)

(assert (=> b!399591 (=> (not res!229838) (not e!241225))))

(assert (=> b!399591 (= res!229838 (arrayNoDuplicates!0 lt!187391 #b00000000000000000000000000000000 Nil!6573))))

(declare-fun b!399592 () Bool)

(declare-fun +!1114 (ListLongMap!5569 tuple2!6666) ListLongMap!5569)

(assert (=> b!399592 (= e!241228 (= call!28039 (+!1114 call!28038 (tuple2!6667 k0!794 v!412))))))

(declare-fun b!399593 () Bool)

(assert (=> b!399593 (= e!241224 tp_is_empty!10015)))

(declare-fun b!399594 () Bool)

(declare-fun res!229841 () Bool)

(assert (=> b!399594 (=> (not res!229841) (not e!241229))))

(assert (=> b!399594 (= res!229841 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!16644 () Bool)

(assert (=> mapIsEmpty!16644 mapRes!16644))

(declare-fun b!399595 () Bool)

(declare-fun res!229844 () Bool)

(assert (=> b!399595 (=> (not res!229844) (not e!241225))))

(assert (=> b!399595 (= res!229844 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11763 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(assert (= (and start!38582 res!229843) b!399579))

(assert (= (and b!399579 res!229842) b!399585))

(assert (= (and b!399585 res!229845) b!399594))

(assert (= (and b!399594 res!229841) b!399582))

(assert (= (and b!399582 res!229837) b!399588))

(assert (= (and b!399588 res!229840) b!399584))

(assert (= (and b!399584 res!229847) b!399586))

(assert (= (and b!399586 res!229839) b!399589))

(assert (= (and b!399589 res!229848) b!399581))

(assert (= (and b!399581 res!229846) b!399591))

(assert (= (and b!399591 res!229838) b!399595))

(assert (= (and b!399595 res!229844) b!399580))

(assert (= (and b!399580 c!54585) b!399592))

(assert (= (and b!399580 (not c!54585)) b!399587))

(assert (= (or b!399592 b!399587) bm!28035))

(assert (= (or b!399592 b!399587) bm!28036))

(assert (= (and b!399590 condMapEmpty!16644) mapIsEmpty!16644))

(assert (= (and b!399590 (not condMapEmpty!16644)) mapNonEmpty!16644))

(get-info :version)

(assert (= (and mapNonEmpty!16644 ((_ is ValueCellFull!4664) mapValue!16644)) b!399593))

(assert (= (and b!399590 ((_ is ValueCellFull!4664) mapDefault!16644)) b!399583))

(assert (= start!38582 b!399590))

(declare-fun m!393513 () Bool)

(assert (=> mapNonEmpty!16644 m!393513))

(declare-fun m!393515 () Bool)

(assert (=> b!399579 m!393515))

(declare-fun m!393517 () Bool)

(assert (=> b!399581 m!393517))

(declare-fun m!393519 () Bool)

(assert (=> b!399581 m!393519))

(declare-fun m!393521 () Bool)

(assert (=> b!399582 m!393521))

(declare-fun m!393523 () Bool)

(assert (=> b!399580 m!393523))

(declare-fun m!393525 () Bool)

(assert (=> b!399591 m!393525))

(declare-fun m!393527 () Bool)

(assert (=> b!399589 m!393527))

(declare-fun m!393529 () Bool)

(assert (=> bm!28036 m!393529))

(declare-fun m!393531 () Bool)

(assert (=> bm!28036 m!393531))

(declare-fun m!393533 () Bool)

(assert (=> b!399584 m!393533))

(declare-fun m!393535 () Bool)

(assert (=> b!399586 m!393535))

(assert (=> bm!28035 m!393529))

(declare-fun m!393537 () Bool)

(assert (=> bm!28035 m!393537))

(declare-fun m!393539 () Bool)

(assert (=> b!399592 m!393539))

(declare-fun m!393541 () Bool)

(assert (=> start!38582 m!393541))

(declare-fun m!393543 () Bool)

(assert (=> start!38582 m!393543))

(declare-fun m!393545 () Bool)

(assert (=> b!399594 m!393545))

(check-sat (not b!399584) (not bm!28036) (not b!399581) tp_is_empty!10015 (not mapNonEmpty!16644) (not start!38582) (not b!399582) (not b!399592) (not b!399591) (not b_next!9133) (not b!399594) (not b!399589) b_and!16493 (not bm!28035) (not b!399580) (not b!399579))
(check-sat b_and!16493 (not b_next!9133))
