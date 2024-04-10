; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89120 () Bool)

(assert start!89120)

(declare-fun b!1021720 () Bool)

(declare-fun b_free!20161 () Bool)

(declare-fun b_next!20161 () Bool)

(assert (=> b!1021720 (= b_free!20161 (not b_next!20161))))

(declare-fun tp!71518 () Bool)

(declare-fun b_and!32359 () Bool)

(assert (=> b!1021720 (= tp!71518 b_and!32359)))

(declare-fun b!1021712 () Bool)

(declare-fun e!575487 () Bool)

(declare-fun tp_is_empty!23881 () Bool)

(assert (=> b!1021712 (= e!575487 tp_is_empty!23881)))

(declare-fun b!1021713 () Bool)

(declare-fun res!684536 () Bool)

(declare-fun e!575483 () Bool)

(assert (=> b!1021713 (=> (not res!684536) (not e!575483))))

(declare-datatypes ((V!36715 0))(
  ( (V!36716 (val!11991 Int)) )
))
(declare-datatypes ((ValueCell!11237 0))(
  ( (ValueCellFull!11237 (v!14560 V!36715)) (EmptyCell!11237) )
))
(declare-datatypes ((array!63806 0))(
  ( (array!63807 (arr!30715 (Array (_ BitVec 32) (_ BitVec 64))) (size!31226 (_ BitVec 32))) )
))
(declare-datatypes ((array!63808 0))(
  ( (array!63809 (arr!30716 (Array (_ BitVec 32) ValueCell!11237)) (size!31227 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5068 0))(
  ( (LongMapFixedSize!5069 (defaultEntry!5886 Int) (mask!29463 (_ BitVec 32)) (extraKeys!5618 (_ BitVec 32)) (zeroValue!5722 V!36715) (minValue!5722 V!36715) (_size!2589 (_ BitVec 32)) (_keys!11031 array!63806) (_values!5909 array!63808) (_vacant!2589 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5068)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63806 (_ BitVec 32)) Bool)

(assert (=> b!1021713 (= res!684536 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11031 thiss!1427) (mask!29463 thiss!1427)))))

(declare-fun b!1021714 () Bool)

(declare-fun res!684534 () Bool)

(assert (=> b!1021714 (=> (not res!684534) (not e!575483))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1021714 (= res!684534 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1021715 () Bool)

(assert (=> b!1021715 (= e!575483 false)))

(declare-fun lt!450135 () Bool)

(declare-datatypes ((List!21660 0))(
  ( (Nil!21657) (Cons!21656 (h!22854 (_ BitVec 64)) (t!30674 List!21660)) )
))
(declare-fun arrayNoDuplicates!0 (array!63806 (_ BitVec 32) List!21660) Bool)

(assert (=> b!1021715 (= lt!450135 (arrayNoDuplicates!0 (_keys!11031 thiss!1427) #b00000000000000000000000000000000 Nil!21657))))

(declare-fun b!1021716 () Bool)

(declare-fun res!684533 () Bool)

(assert (=> b!1021716 (=> (not res!684533) (not e!575483))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1021716 (= res!684533 (validMask!0 (mask!29463 thiss!1427)))))

(declare-fun res!684535 () Bool)

(assert (=> start!89120 (=> (not res!684535) (not e!575483))))

(declare-fun valid!1933 (LongMapFixedSize!5068) Bool)

(assert (=> start!89120 (= res!684535 (valid!1933 thiss!1427))))

(assert (=> start!89120 e!575483))

(declare-fun e!575482 () Bool)

(assert (=> start!89120 e!575482))

(assert (=> start!89120 true))

(declare-fun b!1021717 () Bool)

(declare-fun res!684532 () Bool)

(assert (=> b!1021717 (=> (not res!684532) (not e!575483))))

(assert (=> b!1021717 (= res!684532 (and (= (size!31227 (_values!5909 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29463 thiss!1427))) (= (size!31226 (_keys!11031 thiss!1427)) (size!31227 (_values!5909 thiss!1427))) (bvsge (mask!29463 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5618 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5618 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5618 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5618 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5618 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5618 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5618 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1021718 () Bool)

(declare-fun e!575486 () Bool)

(assert (=> b!1021718 (= e!575486 tp_is_empty!23881)))

(declare-fun mapNonEmpty!37239 () Bool)

(declare-fun mapRes!37239 () Bool)

(declare-fun tp!71517 () Bool)

(assert (=> mapNonEmpty!37239 (= mapRes!37239 (and tp!71517 e!575486))))

(declare-fun mapKey!37239 () (_ BitVec 32))

(declare-fun mapValue!37239 () ValueCell!11237)

(declare-fun mapRest!37239 () (Array (_ BitVec 32) ValueCell!11237))

(assert (=> mapNonEmpty!37239 (= (arr!30716 (_values!5909 thiss!1427)) (store mapRest!37239 mapKey!37239 mapValue!37239))))

(declare-fun mapIsEmpty!37239 () Bool)

(assert (=> mapIsEmpty!37239 mapRes!37239))

(declare-fun b!1021719 () Bool)

(declare-fun e!575485 () Bool)

(assert (=> b!1021719 (= e!575485 (and e!575487 mapRes!37239))))

(declare-fun condMapEmpty!37239 () Bool)

(declare-fun mapDefault!37239 () ValueCell!11237)

