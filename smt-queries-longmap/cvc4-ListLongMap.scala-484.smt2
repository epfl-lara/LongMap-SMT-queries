; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10350 () Bool)

(assert start!10350)

(declare-fun b!80338 () Bool)

(declare-fun b_free!2205 () Bool)

(declare-fun b_next!2205 () Bool)

(assert (=> b!80338 (= b_free!2205 (not b_next!2205))))

(declare-fun tp!8826 () Bool)

(declare-fun b_and!4915 () Bool)

(assert (=> b!80338 (= tp!8826 b_and!4915)))

(declare-fun b!80332 () Bool)

(declare-fun b_free!2207 () Bool)

(declare-fun b_next!2207 () Bool)

(assert (=> b!80332 (= b_free!2207 (not b_next!2207))))

(declare-fun tp!8825 () Bool)

(declare-fun b_and!4917 () Bool)

(assert (=> b!80332 (= tp!8825 b_and!4917)))

(declare-fun b!80323 () Bool)

(declare-fun e!52485 () Bool)

(declare-fun e!52487 () Bool)

(assert (=> b!80323 (= e!52485 e!52487)))

(declare-fun b!80324 () Bool)

(declare-fun res!41870 () Bool)

(declare-fun e!52498 () Bool)

(assert (=> b!80324 (=> (not res!41870) (not e!52498))))

(declare-datatypes ((V!3005 0))(
  ( (V!3006 (val!1304 Int)) )
))
(declare-datatypes ((array!3993 0))(
  ( (array!3994 (arr!1903 (Array (_ BitVec 32) (_ BitVec 64))) (size!2145 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!916 0))(
  ( (ValueCellFull!916 (v!2609 V!3005)) (EmptyCell!916) )
))
(declare-datatypes ((array!3995 0))(
  ( (array!3996 (arr!1904 (Array (_ BitVec 32) ValueCell!916)) (size!2146 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!740 0))(
  ( (LongMapFixedSize!741 (defaultEntry!2294 Int) (mask!6300 (_ BitVec 32)) (extraKeys!2141 (_ BitVec 32)) (zeroValue!2190 V!3005) (minValue!2190 V!3005) (_size!419 (_ BitVec 32)) (_keys!3958 array!3993) (_values!2277 array!3995) (_vacant!419 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!740)

(declare-datatypes ((Cell!542 0))(
  ( (Cell!543 (v!2610 LongMapFixedSize!740)) )
))
(declare-datatypes ((LongMap!542 0))(
  ( (LongMap!543 (underlying!282 Cell!542)) )
))
(declare-fun thiss!992 () LongMap!542)

(assert (=> b!80324 (= res!41870 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6300 newMap!16)) (_size!419 (v!2610 (underlying!282 thiss!992)))))))

(declare-fun mapNonEmpty!3335 () Bool)

(declare-fun mapRes!3336 () Bool)

(declare-fun tp!8823 () Bool)

(declare-fun e!52482 () Bool)

(assert (=> mapNonEmpty!3335 (= mapRes!3336 (and tp!8823 e!52482))))

(declare-fun mapKey!3336 () (_ BitVec 32))

(declare-fun mapRest!3335 () (Array (_ BitVec 32) ValueCell!916))

(declare-fun mapValue!3336 () ValueCell!916)

(assert (=> mapNonEmpty!3335 (= (arr!1904 (_values!2277 newMap!16)) (store mapRest!3335 mapKey!3336 mapValue!3336))))

(declare-fun mapNonEmpty!3336 () Bool)

(declare-fun mapRes!3335 () Bool)

(declare-fun tp!8824 () Bool)

(declare-fun e!52488 () Bool)

(assert (=> mapNonEmpty!3336 (= mapRes!3335 (and tp!8824 e!52488))))

(declare-fun mapKey!3335 () (_ BitVec 32))

(declare-fun mapRest!3336 () (Array (_ BitVec 32) ValueCell!916))

(declare-fun mapValue!3335 () ValueCell!916)

(assert (=> mapNonEmpty!3336 (= (arr!1904 (_values!2277 (v!2610 (underlying!282 thiss!992)))) (store mapRest!3336 mapKey!3335 mapValue!3335))))

(declare-fun b!80325 () Bool)

(declare-fun e!52499 () Bool)

(assert (=> b!80325 (= e!52499 (or (not (= (size!2146 (_values!2277 (v!2610 (underlying!282 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6300 (v!2610 (underlying!282 thiss!992)))))) (= (size!2145 (_keys!3958 (v!2610 (underlying!282 thiss!992)))) (size!2146 (_values!2277 (v!2610 (underlying!282 thiss!992)))))))))

(declare-fun b!80326 () Bool)

(declare-fun res!41869 () Bool)

(assert (=> b!80326 (=> (not res!41869) (not e!52498))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!80326 (= res!41869 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2145 (_keys!3958 (v!2610 (underlying!282 thiss!992)))))))))

(declare-fun b!80327 () Bool)

(declare-fun e!52493 () Bool)

(declare-fun e!52483 () Bool)

(assert (=> b!80327 (= e!52493 (and e!52483 mapRes!3335))))

(declare-fun condMapEmpty!3336 () Bool)

(declare-fun mapDefault!3336 () ValueCell!916)

