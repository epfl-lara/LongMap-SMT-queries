; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24914 () Bool)

(assert start!24914)

(declare-fun b!260014 () Bool)

(declare-fun b_free!6757 () Bool)

(declare-fun b_next!6757 () Bool)

(assert (=> b!260014 (= b_free!6757 (not b_next!6757))))

(declare-fun tp!23594 () Bool)

(declare-fun b_and!13863 () Bool)

(assert (=> b!260014 (= tp!23594 b_and!13863)))

(declare-fun b!259996 () Bool)

(declare-fun e!168508 () Bool)

(declare-fun call!24779 () Bool)

(assert (=> b!259996 (= e!168508 (not call!24779))))

(declare-fun b!259997 () Bool)

(declare-datatypes ((Unit!8084 0))(
  ( (Unit!8085) )
))
(declare-fun e!168509 () Unit!8084)

(declare-fun Unit!8086 () Unit!8084)

(assert (=> b!259997 (= e!168509 Unit!8086)))

(declare-fun lt!131091 () Unit!8084)

(declare-datatypes ((V!8473 0))(
  ( (V!8474 (val!3354 Int)) )
))
(declare-datatypes ((ValueCell!2966 0))(
  ( (ValueCellFull!2966 (v!5467 V!8473)) (EmptyCell!2966) )
))
(declare-datatypes ((array!12591 0))(
  ( (array!12592 (arr!5960 (Array (_ BitVec 32) ValueCell!2966)) (size!6309 (_ BitVec 32))) )
))
(declare-datatypes ((array!12593 0))(
  ( (array!12594 (arr!5961 (Array (_ BitVec 32) (_ BitVec 64))) (size!6310 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3832 0))(
  ( (LongMapFixedSize!3833 (defaultEntry!4794 Int) (mask!11120 (_ BitVec 32)) (extraKeys!4531 (_ BitVec 32)) (zeroValue!4635 V!8473) (minValue!4635 V!8473) (_size!1965 (_ BitVec 32)) (_keys!6974 array!12593) (_values!4777 array!12591) (_vacant!1965 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3832)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!441 (array!12593 array!12591 (_ BitVec 32) (_ BitVec 32) V!8473 V!8473 (_ BitVec 64) Int) Unit!8084)

(assert (=> b!259997 (= lt!131091 (lemmaInListMapThenSeekEntryOrOpenFindsIt!441 (_keys!6974 thiss!1504) (_values!4777 thiss!1504) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) key!932 (defaultEntry!4794 thiss!1504)))))

(assert (=> b!259997 false))

(declare-fun b!259998 () Bool)

(declare-fun e!168501 () Bool)

(assert (=> b!259998 (= e!168501 (not call!24779))))

(declare-fun bm!24776 () Bool)

(declare-fun call!24780 () Bool)

(declare-fun c!44159 () Bool)

(declare-datatypes ((SeekEntryResult!1182 0))(
  ( (MissingZero!1182 (index!6898 (_ BitVec 32))) (Found!1182 (index!6899 (_ BitVec 32))) (Intermediate!1182 (undefined!1994 Bool) (index!6900 (_ BitVec 32)) (x!25120 (_ BitVec 32))) (Undefined!1182) (MissingVacant!1182 (index!6901 (_ BitVec 32))) )
))
(declare-fun lt!131087 () SeekEntryResult!1182)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!24776 (= call!24780 (inRange!0 (ite c!44159 (index!6898 lt!131087) (index!6901 lt!131087)) (mask!11120 thiss!1504)))))

(declare-fun b!259999 () Bool)

(declare-fun e!168510 () Bool)

(declare-fun e!168505 () Bool)

(declare-fun mapRes!11279 () Bool)

(assert (=> b!259999 (= e!168510 (and e!168505 mapRes!11279))))

(declare-fun condMapEmpty!11279 () Bool)

(declare-fun mapDefault!11279 () ValueCell!2966)

