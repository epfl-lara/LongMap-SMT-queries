; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!12188 () Bool)

(assert start!12188)

(declare-fun b!103118 () Bool)

(declare-fun b_free!2509 () Bool)

(declare-fun b_next!2509 () Bool)

(assert (=> b!103118 (= b_free!2509 (not b_next!2509))))

(declare-fun tp!9841 () Bool)

(declare-fun b_and!6379 () Bool)

(assert (=> b!103118 (= tp!9841 b_and!6379)))

(declare-fun b!103123 () Bool)

(declare-fun b_free!2511 () Bool)

(declare-fun b_next!2511 () Bool)

(assert (=> b!103123 (= b_free!2511 (not b_next!2511))))

(declare-fun tp!9843 () Bool)

(declare-fun b_and!6381 () Bool)

(assert (=> b!103123 (= tp!9843 b_and!6381)))

(declare-fun b!103107 () Bool)

(declare-fun e!67180 () Bool)

(declare-fun e!67186 () Bool)

(assert (=> b!103107 (= e!67180 e!67186)))

(declare-fun b!103108 () Bool)

(declare-fun e!67176 () Bool)

(declare-fun tp_is_empty!2671 () Bool)

(assert (=> b!103108 (= e!67176 tp_is_empty!2671)))

(declare-fun b!103109 () Bool)

(declare-fun e!67185 () Bool)

(assert (=> b!103109 (= e!67186 e!67185)))

(declare-fun mapIsEmpty!3897 () Bool)

(declare-fun mapRes!3898 () Bool)

(assert (=> mapIsEmpty!3897 mapRes!3898))

(declare-fun b!103110 () Bool)

(declare-fun e!67172 () Bool)

(declare-fun e!67175 () Bool)

(assert (=> b!103110 (= e!67172 (not e!67175))))

(declare-fun res!51516 () Bool)

(assert (=> b!103110 (=> res!51516 e!67175)))

(declare-datatypes ((V!3209 0))(
  ( (V!3210 (val!1380 Int)) )
))
(declare-datatypes ((array!4331 0))(
  ( (array!4332 (arr!2055 (Array (_ BitVec 32) (_ BitVec 64))) (size!2309 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!992 0))(
  ( (ValueCellFull!992 (v!2873 V!3209)) (EmptyCell!992) )
))
(declare-datatypes ((array!4333 0))(
  ( (array!4334 (arr!2056 (Array (_ BitVec 32) ValueCell!992)) (size!2310 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!892 0))(
  ( (LongMapFixedSize!893 (defaultEntry!2560 Int) (mask!6696 (_ BitVec 32)) (extraKeys!2369 (_ BitVec 32)) (zeroValue!2437 V!3209) (minValue!2437 V!3209) (_size!495 (_ BitVec 32)) (_keys!4262 array!4331) (_values!2543 array!4333) (_vacant!495 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!692 0))(
  ( (Cell!693 (v!2874 LongMapFixedSize!892)) )
))
(declare-datatypes ((LongMap!692 0))(
  ( (LongMap!693 (underlying!357 Cell!692)) )
))
(declare-fun thiss!992 () LongMap!692)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!103110 (= res!51516 (not (validMask!0 (mask!6696 (v!2874 (underlying!357 thiss!992))))))))

(declare-datatypes ((tuple2!2398 0))(
  ( (tuple2!2399 (_1!1210 (_ BitVec 64)) (_2!1210 V!3209)) )
))
(declare-datatypes ((List!1609 0))(
  ( (Nil!1606) (Cons!1605 (h!2201 tuple2!2398) (t!5667 List!1609)) )
))
(declare-datatypes ((ListLongMap!1567 0))(
  ( (ListLongMap!1568 (toList!799 List!1609)) )
))
(declare-fun lt!52504 () ListLongMap!1567)

(declare-fun lt!52505 () tuple2!2398)

(declare-fun lt!52502 () tuple2!2398)

(declare-fun +!140 (ListLongMap!1567 tuple2!2398) ListLongMap!1567)

(assert (=> b!103110 (= (+!140 (+!140 lt!52504 lt!52505) lt!52502) (+!140 (+!140 lt!52504 lt!52502) lt!52505))))

(assert (=> b!103110 (= lt!52502 (tuple2!2399 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2437 (v!2874 (underlying!357 thiss!992)))))))

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lt!52497 () V!3209)

(assert (=> b!103110 (= lt!52505 (tuple2!2399 (select (arr!2055 (_keys!4262 (v!2874 (underlying!357 thiss!992)))) from!355) lt!52497))))

(declare-datatypes ((Unit!3148 0))(
  ( (Unit!3149) )
))
(declare-fun lt!52500 () Unit!3148)

(declare-fun addCommutativeForDiffKeys!52 (ListLongMap!1567 (_ BitVec 64) V!3209 (_ BitVec 64) V!3209) Unit!3148)

(assert (=> b!103110 (= lt!52500 (addCommutativeForDiffKeys!52 lt!52504 (select (arr!2055 (_keys!4262 (v!2874 (underlying!357 thiss!992)))) from!355) lt!52497 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2437 (v!2874 (underlying!357 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!106 (array!4331 array!4333 (_ BitVec 32) (_ BitVec 32) V!3209 V!3209 (_ BitVec 32) Int) ListLongMap!1567)

(assert (=> b!103110 (= lt!52504 (getCurrentListMapNoExtraKeys!106 (_keys!4262 (v!2874 (underlying!357 thiss!992))) (_values!2543 (v!2874 (underlying!357 thiss!992))) (mask!6696 (v!2874 (underlying!357 thiss!992))) (extraKeys!2369 (v!2874 (underlying!357 thiss!992))) (zeroValue!2437 (v!2874 (underlying!357 thiss!992))) (minValue!2437 (v!2874 (underlying!357 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2560 (v!2874 (underlying!357 thiss!992)))))))

(declare-fun b!103111 () Bool)

(declare-fun e!67181 () Bool)

(declare-fun e!67178 () Bool)

(declare-fun mapRes!3897 () Bool)

(assert (=> b!103111 (= e!67181 (and e!67178 mapRes!3897))))

(declare-fun condMapEmpty!3897 () Bool)

(declare-fun mapDefault!3898 () ValueCell!992)

