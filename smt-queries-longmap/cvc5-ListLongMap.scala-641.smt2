; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16194 () Bool)

(assert start!16194)

(declare-fun b!161536 () Bool)

(declare-fun b_free!3655 () Bool)

(declare-fun b_next!3655 () Bool)

(assert (=> b!161536 (= b_free!3655 (not b_next!3655))))

(declare-fun tp!13535 () Bool)

(declare-fun b_and!10069 () Bool)

(assert (=> b!161536 (= tp!13535 b_and!10069)))

(declare-fun b!161531 () Bool)

(declare-datatypes ((Unit!5026 0))(
  ( (Unit!5027) )
))
(declare-fun e!105582 () Unit!5026)

(declare-fun Unit!5028 () Unit!5026)

(assert (=> b!161531 (= e!105582 Unit!5028)))

(declare-fun lt!82233 () Unit!5026)

(declare-datatypes ((V!4257 0))(
  ( (V!4258 (val!1773 Int)) )
))
(declare-datatypes ((ValueCell!1385 0))(
  ( (ValueCellFull!1385 (v!3638 V!4257)) (EmptyCell!1385) )
))
(declare-datatypes ((array!5993 0))(
  ( (array!5994 (arr!2841 (Array (_ BitVec 32) (_ BitVec 64))) (size!3125 (_ BitVec 32))) )
))
(declare-datatypes ((array!5995 0))(
  ( (array!5996 (arr!2842 (Array (_ BitVec 32) ValueCell!1385)) (size!3126 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1678 0))(
  ( (LongMapFixedSize!1679 (defaultEntry!3281 Int) (mask!7875 (_ BitVec 32)) (extraKeys!3022 (_ BitVec 32)) (zeroValue!3124 V!4257) (minValue!3124 V!4257) (_size!888 (_ BitVec 32)) (_keys!5082 array!5993) (_values!3264 array!5995) (_vacant!888 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1678)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!80 (array!5993 array!5995 (_ BitVec 32) (_ BitVec 32) V!4257 V!4257 (_ BitVec 64) Int) Unit!5026)

(assert (=> b!161531 (= lt!82233 (lemmaInListMapThenSeekEntryOrOpenFindsIt!80 (_keys!5082 thiss!1248) (_values!3264 thiss!1248) (mask!7875 thiss!1248) (extraKeys!3022 thiss!1248) (zeroValue!3124 thiss!1248) (minValue!3124 thiss!1248) key!828 (defaultEntry!3281 thiss!1248)))))

(assert (=> b!161531 false))

(declare-fun b!161532 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!81 (array!5993 array!5995 (_ BitVec 32) (_ BitVec 32) V!4257 V!4257 (_ BitVec 64) Int) Unit!5026)

(assert (=> b!161532 (= e!105582 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!81 (_keys!5082 thiss!1248) (_values!3264 thiss!1248) (mask!7875 thiss!1248) (extraKeys!3022 thiss!1248) (zeroValue!3124 thiss!1248) (minValue!3124 thiss!1248) key!828 (defaultEntry!3281 thiss!1248)))))

(declare-fun res!76558 () Bool)

(declare-fun e!105583 () Bool)

(assert (=> start!16194 (=> (not res!76558) (not e!105583))))

(declare-fun valid!769 (LongMapFixedSize!1678) Bool)

(assert (=> start!16194 (= res!76558 (valid!769 thiss!1248))))

(assert (=> start!16194 e!105583))

(declare-fun e!105579 () Bool)

(assert (=> start!16194 e!105579))

(assert (=> start!16194 true))

(declare-fun b!161533 () Bool)

(declare-fun e!105580 () Bool)

(declare-fun e!105581 () Bool)

(declare-fun mapRes!5873 () Bool)

(assert (=> b!161533 (= e!105580 (and e!105581 mapRes!5873))))

(declare-fun condMapEmpty!5873 () Bool)

(declare-fun mapDefault!5873 () ValueCell!1385)

