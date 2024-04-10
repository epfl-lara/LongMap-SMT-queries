; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15828 () Bool)

(assert start!15828)

(declare-fun b!157722 () Bool)

(declare-fun b_free!3455 () Bool)

(declare-fun b_next!3455 () Bool)

(assert (=> b!157722 (= b_free!3455 (not b_next!3455))))

(declare-fun tp!12900 () Bool)

(declare-fun b_and!9869 () Bool)

(assert (=> b!157722 (= tp!12900 b_and!9869)))

(declare-fun b!157718 () Bool)

(declare-fun e!103297 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!157718 (= e!103297 (not (validKeyInArray!0 key!828)))))

(declare-fun b!157719 () Bool)

(declare-fun e!103295 () Bool)

(declare-fun tp_is_empty!3257 () Bool)

(assert (=> b!157719 (= e!103295 tp_is_empty!3257)))

(declare-fun b!157720 () Bool)

(declare-fun res!74537 () Bool)

(assert (=> b!157720 (=> (not res!74537) (not e!103297))))

(declare-datatypes ((V!3989 0))(
  ( (V!3990 (val!1673 Int)) )
))
(declare-datatypes ((ValueCell!1285 0))(
  ( (ValueCellFull!1285 (v!3538 V!3989)) (EmptyCell!1285) )
))
(declare-datatypes ((array!5573 0))(
  ( (array!5574 (arr!2641 (Array (_ BitVec 32) (_ BitVec 64))) (size!2921 (_ BitVec 32))) )
))
(declare-datatypes ((array!5575 0))(
  ( (array!5576 (arr!2642 (Array (_ BitVec 32) ValueCell!1285)) (size!2922 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1478 0))(
  ( (LongMapFixedSize!1479 (defaultEntry!3181 Int) (mask!7669 (_ BitVec 32)) (extraKeys!2922 (_ BitVec 32)) (zeroValue!3024 V!3989) (minValue!3024 V!3989) (_size!788 (_ BitVec 32)) (_keys!4958 array!5573) (_values!3164 array!5575) (_vacant!788 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1478)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!157720 (= res!74537 (validMask!0 (mask!7669 thiss!1248)))))

(declare-fun b!157721 () Bool)

(declare-fun res!74536 () Bool)

(assert (=> b!157721 (=> (not res!74536) (not e!103297))))

(assert (=> b!157721 (= res!74536 (not (= key!828 (bvneg key!828))))))

(declare-fun e!103300 () Bool)

(declare-fun e!103298 () Bool)

(declare-fun array_inv!1679 (array!5573) Bool)

(declare-fun array_inv!1680 (array!5575) Bool)

(assert (=> b!157722 (= e!103298 (and tp!12900 tp_is_empty!3257 (array_inv!1679 (_keys!4958 thiss!1248)) (array_inv!1680 (_values!3164 thiss!1248)) e!103300))))

(declare-fun b!157723 () Bool)

(declare-fun res!74539 () Bool)

(assert (=> b!157723 (=> (not res!74539) (not e!103297))))

(assert (=> b!157723 (= res!74539 (and (bvsge (mask!7669 thiss!1248) #b00000000000000000000000000000000) (= (size!2921 (_keys!4958 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7669 thiss!1248)))))))

(declare-fun mapNonEmpty!5539 () Bool)

(declare-fun mapRes!5539 () Bool)

(declare-fun tp!12901 () Bool)

(declare-fun e!103299 () Bool)

(assert (=> mapNonEmpty!5539 (= mapRes!5539 (and tp!12901 e!103299))))

(declare-fun mapRest!5539 () (Array (_ BitVec 32) ValueCell!1285))

(declare-fun mapKey!5539 () (_ BitVec 32))

(declare-fun mapValue!5539 () ValueCell!1285)

(assert (=> mapNonEmpty!5539 (= (arr!2642 (_values!3164 thiss!1248)) (store mapRest!5539 mapKey!5539 mapValue!5539))))

(declare-fun res!74538 () Bool)

(assert (=> start!15828 (=> (not res!74538) (not e!103297))))

(declare-fun valid!701 (LongMapFixedSize!1478) Bool)

(assert (=> start!15828 (= res!74538 (valid!701 thiss!1248))))

(assert (=> start!15828 e!103297))

(assert (=> start!15828 e!103298))

(assert (=> start!15828 true))

(declare-fun b!157724 () Bool)

(assert (=> b!157724 (= e!103300 (and e!103295 mapRes!5539))))

(declare-fun condMapEmpty!5539 () Bool)

(declare-fun mapDefault!5539 () ValueCell!1285)

