; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18068 () Bool)

(assert start!18068)

(declare-fun b!179915 () Bool)

(declare-fun b_free!4439 () Bool)

(declare-fun b_next!4439 () Bool)

(assert (=> b!179915 (= b_free!4439 (not b_next!4439))))

(declare-fun tp!16048 () Bool)

(declare-fun b_and!10973 () Bool)

(assert (=> b!179915 (= tp!16048 b_and!10973)))

(declare-fun b!179909 () Bool)

(declare-fun res!85232 () Bool)

(declare-fun e!118483 () Bool)

(assert (=> b!179909 (=> (not res!85232) (not e!118483))))

(declare-datatypes ((V!5261 0))(
  ( (V!5262 (val!2150 Int)) )
))
(declare-datatypes ((ValueCell!1762 0))(
  ( (ValueCellFull!1762 (v!4039 V!5261)) (EmptyCell!1762) )
))
(declare-datatypes ((array!7591 0))(
  ( (array!7592 (arr!3595 (Array (_ BitVec 32) (_ BitVec 64))) (size!3903 (_ BitVec 32))) )
))
(declare-datatypes ((array!7593 0))(
  ( (array!7594 (arr!3596 (Array (_ BitVec 32) ValueCell!1762)) (size!3904 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2432 0))(
  ( (LongMapFixedSize!2433 (defaultEntry!3692 Int) (mask!8683 (_ BitVec 32)) (extraKeys!3429 (_ BitVec 32)) (zeroValue!3533 V!5261) (minValue!3533 V!5261) (_size!1265 (_ BitVec 32)) (_keys!5583 array!7591) (_values!3675 array!7593) (_vacant!1265 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2432)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3340 0))(
  ( (tuple2!3341 (_1!1681 (_ BitVec 64)) (_2!1681 V!5261)) )
))
(declare-datatypes ((List!2284 0))(
  ( (Nil!2281) (Cons!2280 (h!2905 tuple2!3340) (t!7132 List!2284)) )
))
(declare-datatypes ((ListLongMap!2267 0))(
  ( (ListLongMap!2268 (toList!1149 List!2284)) )
))
(declare-fun contains!1225 (ListLongMap!2267 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!801 (array!7591 array!7593 (_ BitVec 32) (_ BitVec 32) V!5261 V!5261 (_ BitVec 32) Int) ListLongMap!2267)

(assert (=> b!179909 (= res!85232 (not (contains!1225 (getCurrentListMap!801 (_keys!5583 thiss!1248) (_values!3675 thiss!1248) (mask!8683 thiss!1248) (extraKeys!3429 thiss!1248) (zeroValue!3533 thiss!1248) (minValue!3533 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3692 thiss!1248)) key!828)))))

(declare-fun b!179910 () Bool)

(declare-fun res!85236 () Bool)

(assert (=> b!179910 (=> (not res!85236) (not e!118483))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!179910 (= res!85236 (validMask!0 (mask!8683 thiss!1248)))))

(declare-fun b!179911 () Bool)

(declare-fun e!118484 () Bool)

(declare-fun e!118482 () Bool)

(declare-fun mapRes!7210 () Bool)

(assert (=> b!179911 (= e!118484 (and e!118482 mapRes!7210))))

(declare-fun condMapEmpty!7210 () Bool)

(declare-fun mapDefault!7210 () ValueCell!1762)

