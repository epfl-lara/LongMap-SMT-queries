; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19692 () Bool)

(assert start!19692)

(declare-fun b!192994 () Bool)

(declare-fun b_free!4699 () Bool)

(declare-fun b_next!4699 () Bool)

(assert (=> b!192994 (= b_free!4699 (not b_next!4699))))

(declare-fun tp!16957 () Bool)

(declare-fun b_and!11401 () Bool)

(assert (=> b!192994 (= tp!16957 b_and!11401)))

(declare-fun b!192982 () Bool)

(declare-datatypes ((Unit!5841 0))(
  ( (Unit!5842) )
))
(declare-fun e!126978 () Unit!5841)

(declare-fun Unit!5843 () Unit!5841)

(assert (=> b!192982 (= e!126978 Unit!5843)))

(declare-fun lt!96021 () Unit!5841)

(declare-datatypes ((V!5609 0))(
  ( (V!5610 (val!2280 Int)) )
))
(declare-datatypes ((ValueCell!1892 0))(
  ( (ValueCellFull!1892 (v!4233 V!5609)) (EmptyCell!1892) )
))
(declare-datatypes ((array!8187 0))(
  ( (array!8188 (arr!3855 (Array (_ BitVec 32) (_ BitVec 64))) (size!4179 (_ BitVec 32))) )
))
(declare-datatypes ((array!8189 0))(
  ( (array!8190 (arr!3856 (Array (_ BitVec 32) ValueCell!1892)) (size!4180 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2692 0))(
  ( (LongMapFixedSize!2693 (defaultEntry!3938 Int) (mask!9183 (_ BitVec 32)) (extraKeys!3675 (_ BitVec 32)) (zeroValue!3779 V!5609) (minValue!3779 V!5609) (_size!1395 (_ BitVec 32)) (_keys!5926 array!8187) (_values!3921 array!8189) (_vacant!1395 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2692)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!188 (array!8187 array!8189 (_ BitVec 32) (_ BitVec 32) V!5609 V!5609 (_ BitVec 64) Int) Unit!5841)

(assert (=> b!192982 (= lt!96021 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!188 (_keys!5926 thiss!1248) (_values!3921 thiss!1248) (mask!9183 thiss!1248) (extraKeys!3675 thiss!1248) (zeroValue!3779 thiss!1248) (minValue!3779 thiss!1248) key!828 (defaultEntry!3938 thiss!1248)))))

(assert (=> b!192982 false))

(declare-fun b!192983 () Bool)

(declare-fun e!126981 () Bool)

(declare-fun e!126982 () Bool)

(declare-fun mapRes!7730 () Bool)

(assert (=> b!192983 (= e!126981 (and e!126982 mapRes!7730))))

(declare-fun condMapEmpty!7730 () Bool)

(declare-fun mapDefault!7730 () ValueCell!1892)

