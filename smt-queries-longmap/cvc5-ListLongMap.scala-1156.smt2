; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24284 () Bool)

(assert start!24284)

(declare-fun b!254380 () Bool)

(declare-fun b_free!6685 () Bool)

(declare-fun b_next!6685 () Bool)

(assert (=> b!254380 (= b_free!6685 (not b_next!6685))))

(declare-fun tp!23342 () Bool)

(declare-fun b_and!13727 () Bool)

(assert (=> b!254380 (= tp!23342 b_and!13727)))

(declare-fun b!254363 () Bool)

(declare-fun res!124527 () Bool)

(declare-fun e!164881 () Bool)

(assert (=> b!254363 (=> (not res!124527) (not e!164881))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!254363 (= res!124527 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!254364 () Bool)

(declare-fun e!164874 () Bool)

(declare-fun e!164886 () Bool)

(assert (=> b!254364 (= e!164874 e!164886)))

(declare-fun res!124530 () Bool)

(declare-fun call!24001 () Bool)

(assert (=> b!254364 (= res!124530 call!24001)))

(assert (=> b!254364 (=> (not res!124530) (not e!164886))))

(declare-fun b!254365 () Bool)

(declare-fun e!164877 () Bool)

(declare-fun tp_is_empty!6547 () Bool)

(assert (=> b!254365 (= e!164877 tp_is_empty!6547)))

(declare-fun b!254366 () Bool)

(declare-fun e!164876 () Bool)

(assert (=> b!254366 (= e!164876 true)))

(declare-fun lt!127464 () Bool)

(declare-datatypes ((V!8377 0))(
  ( (V!8378 (val!3318 Int)) )
))
(declare-datatypes ((ValueCell!2930 0))(
  ( (ValueCellFull!2930 (v!5392 V!8377)) (EmptyCell!2930) )
))
(declare-datatypes ((array!12425 0))(
  ( (array!12426 (arr!5888 (Array (_ BitVec 32) ValueCell!2930)) (size!6235 (_ BitVec 32))) )
))
(declare-datatypes ((array!12427 0))(
  ( (array!12428 (arr!5889 (Array (_ BitVec 32) (_ BitVec 64))) (size!6236 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3760 0))(
  ( (LongMapFixedSize!3761 (defaultEntry!4693 Int) (mask!10939 (_ BitVec 32)) (extraKeys!4430 (_ BitVec 32)) (zeroValue!4534 V!8377) (minValue!4534 V!8377) (_size!1929 (_ BitVec 32)) (_keys!6847 array!12427) (_values!4676 array!12425) (_vacant!1929 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3760)

(declare-datatypes ((List!3767 0))(
  ( (Nil!3764) (Cons!3763 (h!4425 (_ BitVec 64)) (t!8814 List!3767)) )
))
(declare-fun arrayNoDuplicates!0 (array!12427 (_ BitVec 32) List!3767) Bool)

(assert (=> b!254366 (= lt!127464 (arrayNoDuplicates!0 (_keys!6847 thiss!1504) #b00000000000000000000000000000000 Nil!3764))))

(declare-fun b!254367 () Bool)

(declare-fun e!164883 () Bool)

(declare-fun mapRes!11136 () Bool)

(assert (=> b!254367 (= e!164883 (and e!164877 mapRes!11136))))

(declare-fun condMapEmpty!11136 () Bool)

(declare-fun mapDefault!11136 () ValueCell!2930)

