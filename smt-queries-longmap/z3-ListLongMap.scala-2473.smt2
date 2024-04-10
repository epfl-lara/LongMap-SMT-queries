; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38658 () Bool)

(assert start!38658)

(declare-fun b_free!9195 () Bool)

(declare-fun b_next!9195 () Bool)

(assert (=> start!38658 (= b_free!9195 (not b_next!9195))))

(declare-fun tp!32709 () Bool)

(declare-fun b_and!16581 () Bool)

(assert (=> start!38658 (= tp!32709 b_and!16581)))

(declare-datatypes ((array!24061 0))(
  ( (array!24062 (arr!11480 (Array (_ BitVec 32) (_ BitVec 64))) (size!11832 (_ BitVec 32))) )
))
(declare-fun lt!187811 () array!24061)

(declare-datatypes ((V!14541 0))(
  ( (V!14542 (val!5083 Int)) )
))
(declare-fun minValue!515 () V!14541)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun c!54749 () Bool)

(declare-fun bm!28246 () Bool)

(declare-fun zeroValue!515 () V!14541)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!14541)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!24061)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4695 0))(
  ( (ValueCellFull!4695 (v!7330 V!14541)) (EmptyCell!4695) )
))
(declare-datatypes ((array!24063 0))(
  ( (array!24064 (arr!11481 (Array (_ BitVec 32) ValueCell!4695)) (size!11833 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24063)

(declare-datatypes ((tuple2!6744 0))(
  ( (tuple2!6745 (_1!3383 (_ BitVec 64)) (_2!3383 V!14541)) )
))
(declare-datatypes ((List!6668 0))(
  ( (Nil!6665) (Cons!6664 (h!7520 tuple2!6744) (t!11842 List!6668)) )
))
(declare-datatypes ((ListLongMap!5657 0))(
  ( (ListLongMap!5658 (toList!2844 List!6668)) )
))
(declare-fun call!28250 () ListLongMap!5657)

(declare-fun getCurrentListMapNoExtraKeys!1056 (array!24061 array!24063 (_ BitVec 32) (_ BitVec 32) V!14541 V!14541 (_ BitVec 32) Int) ListLongMap!5657)

(assert (=> bm!28246 (= call!28250 (getCurrentListMapNoExtraKeys!1056 (ite c!54749 lt!187811 _keys!709) (ite c!54749 (array!24064 (store (arr!11481 _values!549) i!563 (ValueCellFull!4695 v!412)) (size!11833 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401431 () Bool)

(declare-fun call!28249 () ListLongMap!5657)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun e!242050 () Bool)

(declare-fun +!1128 (ListLongMap!5657 tuple2!6744) ListLongMap!5657)

(assert (=> b!401431 (= e!242050 (= call!28250 (+!1128 call!28249 (tuple2!6745 k0!794 v!412))))))

(declare-fun b!401432 () Bool)

(declare-fun e!242054 () Bool)

(declare-fun tp_is_empty!10077 () Bool)

(assert (=> b!401432 (= e!242054 tp_is_empty!10077)))

(declare-fun b!401433 () Bool)

(declare-fun e!242049 () Bool)

(assert (=> b!401433 (= e!242049 tp_is_empty!10077)))

(declare-fun b!401434 () Bool)

(declare-fun res!231083 () Bool)

(declare-fun e!242052 () Bool)

(assert (=> b!401434 (=> (not res!231083) (not e!242052))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!401434 (= res!231083 (validMask!0 mask!1025))))

(declare-fun b!401435 () Bool)

(declare-fun res!231086 () Bool)

(assert (=> b!401435 (=> (not res!231086) (not e!242052))))

(assert (=> b!401435 (= res!231086 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11832 _keys!709))))))

(declare-fun b!401436 () Bool)

(declare-fun e!242055 () Bool)

(assert (=> b!401436 (= e!242052 e!242055)))

(declare-fun res!231082 () Bool)

(assert (=> b!401436 (=> (not res!231082) (not e!242055))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24061 (_ BitVec 32)) Bool)

(assert (=> b!401436 (= res!231082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187811 mask!1025))))

(assert (=> b!401436 (= lt!187811 (array!24062 (store (arr!11480 _keys!709) i!563 k0!794) (size!11832 _keys!709)))))

(declare-fun b!401437 () Bool)

(declare-fun res!231093 () Bool)

(assert (=> b!401437 (=> (not res!231093) (not e!242052))))

(assert (=> b!401437 (= res!231093 (or (= (select (arr!11480 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11480 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!16737 () Bool)

(declare-fun mapRes!16737 () Bool)

(assert (=> mapIsEmpty!16737 mapRes!16737))

(declare-fun b!401438 () Bool)

(assert (=> b!401438 (= e!242055 (not true))))

(assert (=> b!401438 e!242050))

(assert (=> b!401438 (= c!54749 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12158 0))(
  ( (Unit!12159) )
))
(declare-fun lt!187810 () Unit!12158)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!337 (array!24061 array!24063 (_ BitVec 32) (_ BitVec 32) V!14541 V!14541 (_ BitVec 32) (_ BitVec 64) V!14541 (_ BitVec 32) Int) Unit!12158)

(assert (=> b!401438 (= lt!187810 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!337 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401440 () Bool)

(declare-fun res!231085 () Bool)

(assert (=> b!401440 (=> (not res!231085) (not e!242052))))

(declare-fun arrayContainsKey!0 (array!24061 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!401440 (= res!231085 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun bm!28247 () Bool)

(assert (=> bm!28247 (= call!28249 (getCurrentListMapNoExtraKeys!1056 (ite c!54749 _keys!709 lt!187811) (ite c!54749 _values!549 (array!24064 (store (arr!11481 _values!549) i!563 (ValueCellFull!4695 v!412)) (size!11833 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401441 () Bool)

(declare-fun res!231091 () Bool)

(assert (=> b!401441 (=> (not res!231091) (not e!242052))))

(assert (=> b!401441 (= res!231091 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!401442 () Bool)

(declare-fun res!231090 () Bool)

(assert (=> b!401442 (=> (not res!231090) (not e!242052))))

(assert (=> b!401442 (= res!231090 (and (= (size!11833 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11832 _keys!709) (size!11833 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!401439 () Bool)

(declare-fun res!231087 () Bool)

(assert (=> b!401439 (=> (not res!231087) (not e!242052))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!401439 (= res!231087 (validKeyInArray!0 k0!794))))

(declare-fun res!231084 () Bool)

(assert (=> start!38658 (=> (not res!231084) (not e!242052))))

(assert (=> start!38658 (= res!231084 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11832 _keys!709))))))

(assert (=> start!38658 e!242052))

(assert (=> start!38658 tp_is_empty!10077))

(assert (=> start!38658 tp!32709))

(assert (=> start!38658 true))

(declare-fun e!242053 () Bool)

(declare-fun array_inv!8402 (array!24063) Bool)

(assert (=> start!38658 (and (array_inv!8402 _values!549) e!242053)))

(declare-fun array_inv!8403 (array!24061) Bool)

(assert (=> start!38658 (array_inv!8403 _keys!709)))

(declare-fun b!401443 () Bool)

(assert (=> b!401443 (= e!242050 (= call!28249 call!28250))))

(declare-fun mapNonEmpty!16737 () Bool)

(declare-fun tp!32708 () Bool)

(assert (=> mapNonEmpty!16737 (= mapRes!16737 (and tp!32708 e!242054))))

(declare-fun mapValue!16737 () ValueCell!4695)

(declare-fun mapKey!16737 () (_ BitVec 32))

(declare-fun mapRest!16737 () (Array (_ BitVec 32) ValueCell!4695))

(assert (=> mapNonEmpty!16737 (= (arr!11481 _values!549) (store mapRest!16737 mapKey!16737 mapValue!16737))))

(declare-fun b!401444 () Bool)

(declare-fun res!231088 () Bool)

(assert (=> b!401444 (=> (not res!231088) (not e!242055))))

(assert (=> b!401444 (= res!231088 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11832 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!401445 () Bool)

(declare-fun res!231092 () Bool)

(assert (=> b!401445 (=> (not res!231092) (not e!242055))))

(declare-datatypes ((List!6669 0))(
  ( (Nil!6666) (Cons!6665 (h!7521 (_ BitVec 64)) (t!11843 List!6669)) )
))
(declare-fun arrayNoDuplicates!0 (array!24061 (_ BitVec 32) List!6669) Bool)

(assert (=> b!401445 (= res!231092 (arrayNoDuplicates!0 lt!187811 #b00000000000000000000000000000000 Nil!6666))))

(declare-fun b!401446 () Bool)

(declare-fun res!231089 () Bool)

(assert (=> b!401446 (=> (not res!231089) (not e!242052))))

(assert (=> b!401446 (= res!231089 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6666))))

(declare-fun b!401447 () Bool)

(assert (=> b!401447 (= e!242053 (and e!242049 mapRes!16737))))

(declare-fun condMapEmpty!16737 () Bool)

(declare-fun mapDefault!16737 () ValueCell!4695)

(assert (=> b!401447 (= condMapEmpty!16737 (= (arr!11481 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4695)) mapDefault!16737)))))

(assert (= (and start!38658 res!231084) b!401434))

(assert (= (and b!401434 res!231083) b!401442))

(assert (= (and b!401442 res!231090) b!401441))

(assert (= (and b!401441 res!231091) b!401446))

(assert (= (and b!401446 res!231089) b!401435))

(assert (= (and b!401435 res!231086) b!401439))

(assert (= (and b!401439 res!231087) b!401437))

(assert (= (and b!401437 res!231093) b!401440))

(assert (= (and b!401440 res!231085) b!401436))

(assert (= (and b!401436 res!231082) b!401445))

(assert (= (and b!401445 res!231092) b!401444))

(assert (= (and b!401444 res!231088) b!401438))

(assert (= (and b!401438 c!54749) b!401431))

(assert (= (and b!401438 (not c!54749)) b!401443))

(assert (= (or b!401431 b!401443) bm!28246))

(assert (= (or b!401431 b!401443) bm!28247))

(assert (= (and b!401447 condMapEmpty!16737) mapIsEmpty!16737))

(assert (= (and b!401447 (not condMapEmpty!16737)) mapNonEmpty!16737))

(get-info :version)

(assert (= (and mapNonEmpty!16737 ((_ is ValueCellFull!4695) mapValue!16737)) b!401432))

(assert (= (and b!401447 ((_ is ValueCellFull!4695) mapDefault!16737)) b!401433))

(assert (= start!38658 b!401447))

(declare-fun m!395291 () Bool)

(assert (=> bm!28246 m!395291))

(declare-fun m!395293 () Bool)

(assert (=> bm!28246 m!395293))

(declare-fun m!395295 () Bool)

(assert (=> b!401439 m!395295))

(declare-fun m!395297 () Bool)

(assert (=> b!401445 m!395297))

(declare-fun m!395299 () Bool)

(assert (=> start!38658 m!395299))

(declare-fun m!395301 () Bool)

(assert (=> start!38658 m!395301))

(declare-fun m!395303 () Bool)

(assert (=> b!401431 m!395303))

(declare-fun m!395305 () Bool)

(assert (=> b!401438 m!395305))

(assert (=> bm!28247 m!395291))

(declare-fun m!395307 () Bool)

(assert (=> bm!28247 m!395307))

(declare-fun m!395309 () Bool)

(assert (=> b!401437 m!395309))

(declare-fun m!395311 () Bool)

(assert (=> b!401441 m!395311))

(declare-fun m!395313 () Bool)

(assert (=> b!401440 m!395313))

(declare-fun m!395315 () Bool)

(assert (=> b!401434 m!395315))

(declare-fun m!395317 () Bool)

(assert (=> b!401436 m!395317))

(declare-fun m!395319 () Bool)

(assert (=> b!401436 m!395319))

(declare-fun m!395321 () Bool)

(assert (=> b!401446 m!395321))

(declare-fun m!395323 () Bool)

(assert (=> mapNonEmpty!16737 m!395323))

(check-sat (not b!401445) (not b!401439) (not b!401441) (not bm!28246) (not b_next!9195) (not b!401446) (not b!401434) tp_is_empty!10077 (not b!401431) b_and!16581 (not b!401438) (not b!401436) (not mapNonEmpty!16737) (not b!401440) (not start!38658) (not bm!28247))
(check-sat b_and!16581 (not b_next!9195))
