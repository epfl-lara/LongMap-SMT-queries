; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19660 () Bool)

(assert start!19660)

(declare-fun b!192691 () Bool)

(declare-fun b_free!4693 () Bool)

(declare-fun b_next!4693 () Bool)

(assert (=> b!192691 (= b_free!4693 (not b_next!4693))))

(declare-fun tp!16936 () Bool)

(declare-fun b_and!11391 () Bool)

(assert (=> b!192691 (= tp!16936 b_and!11391)))

(declare-fun e!126786 () Bool)

(declare-datatypes ((V!5601 0))(
  ( (V!5602 (val!2277 Int)) )
))
(declare-datatypes ((ValueCell!1889 0))(
  ( (ValueCellFull!1889 (v!4227 V!5601)) (EmptyCell!1889) )
))
(declare-datatypes ((array!8173 0))(
  ( (array!8174 (arr!3849 (Array (_ BitVec 32) (_ BitVec 64))) (size!4173 (_ BitVec 32))) )
))
(declare-datatypes ((array!8175 0))(
  ( (array!8176 (arr!3850 (Array (_ BitVec 32) ValueCell!1889)) (size!4174 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2686 0))(
  ( (LongMapFixedSize!2687 (defaultEntry!3931 Int) (mask!9170 (_ BitVec 32)) (extraKeys!3668 (_ BitVec 32)) (zeroValue!3772 V!5601) (minValue!3772 V!5601) (_size!1392 (_ BitVec 32)) (_keys!5917 array!8173) (_values!3914 array!8175) (_vacant!1392 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2686)

(declare-fun tp_is_empty!4465 () Bool)

(declare-fun e!126778 () Bool)

(declare-fun array_inv!2495 (array!8173) Bool)

(declare-fun array_inv!2496 (array!8175) Bool)

(assert (=> b!192691 (= e!126778 (and tp!16936 tp_is_empty!4465 (array_inv!2495 (_keys!5917 thiss!1248)) (array_inv!2496 (_values!3914 thiss!1248)) e!126786))))

(declare-fun b!192692 () Bool)

(declare-fun e!126785 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8173 (_ BitVec 32)) Bool)

(assert (=> b!192692 (= e!126785 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5917 thiss!1248) (mask!9170 thiss!1248)))))

(declare-fun b!192693 () Bool)

(declare-fun res!91048 () Bool)

(assert (=> b!192693 (=> res!91048 e!126785)))

(assert (=> b!192693 (= res!91048 (or (not (= (size!4174 (_values!3914 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9170 thiss!1248)))) (not (= (size!4173 (_keys!5917 thiss!1248)) (size!4174 (_values!3914 thiss!1248)))) (bvslt (mask!9170 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3668 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3668 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun e!126784 () Bool)

(declare-fun b!192694 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!682 0))(
  ( (MissingZero!682 (index!4898 (_ BitVec 32))) (Found!682 (index!4899 (_ BitVec 32))) (Intermediate!682 (undefined!1494 Bool) (index!4900 (_ BitVec 32)) (x!20606 (_ BitVec 32))) (Undefined!682) (MissingVacant!682 (index!4901 (_ BitVec 32))) )
))
(declare-fun lt!95821 () SeekEntryResult!682)

(assert (=> b!192694 (= e!126784 (= (select (arr!3849 (_keys!5917 thiss!1248)) (index!4899 lt!95821)) key!828))))

(declare-fun b!192695 () Bool)

(declare-datatypes ((Unit!5829 0))(
  ( (Unit!5830) )
))
(declare-fun e!126781 () Unit!5829)

(declare-fun Unit!5831 () Unit!5829)

(assert (=> b!192695 (= e!126781 Unit!5831)))

(declare-fun lt!95825 () Unit!5829)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!185 (array!8173 array!8175 (_ BitVec 32) (_ BitVec 32) V!5601 V!5601 (_ BitVec 64) Int) Unit!5829)

(assert (=> b!192695 (= lt!95825 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!185 (_keys!5917 thiss!1248) (_values!3914 thiss!1248) (mask!9170 thiss!1248) (extraKeys!3668 thiss!1248) (zeroValue!3772 thiss!1248) (minValue!3772 thiss!1248) key!828 (defaultEntry!3931 thiss!1248)))))

(assert (=> b!192695 false))

(declare-fun b!192696 () Bool)

(declare-fun e!126780 () Bool)

(assert (=> b!192696 (= e!126780 tp_is_empty!4465)))

(declare-fun b!192697 () Bool)

(declare-fun res!91047 () Bool)

(declare-fun e!126783 () Bool)

(assert (=> b!192697 (=> (not res!91047) (not e!126783))))

(assert (=> b!192697 (= res!91047 (not (= key!828 (bvneg key!828))))))

(declare-fun b!192698 () Bool)

(declare-fun e!126779 () Bool)

(assert (=> b!192698 (= e!126779 tp_is_empty!4465)))

(declare-fun mapNonEmpty!7718 () Bool)

(declare-fun mapRes!7718 () Bool)

(declare-fun tp!16937 () Bool)

(assert (=> mapNonEmpty!7718 (= mapRes!7718 (and tp!16937 e!126780))))

(declare-fun mapRest!7718 () (Array (_ BitVec 32) ValueCell!1889))

(declare-fun mapKey!7718 () (_ BitVec 32))

(declare-fun mapValue!7718 () ValueCell!1889)

(assert (=> mapNonEmpty!7718 (= (arr!3850 (_values!3914 thiss!1248)) (store mapRest!7718 mapKey!7718 mapValue!7718))))

(declare-fun b!192699 () Bool)

(assert (=> b!192699 (= e!126786 (and e!126779 mapRes!7718))))

(declare-fun condMapEmpty!7718 () Bool)

(declare-fun mapDefault!7718 () ValueCell!1889)

