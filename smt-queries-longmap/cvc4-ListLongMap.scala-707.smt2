; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16750 () Bool)

(assert start!16750)

(declare-fun b!168391 () Bool)

(declare-fun b_free!4055 () Bool)

(declare-fun b_next!4055 () Bool)

(assert (=> b!168391 (= b_free!4055 (not b_next!4055))))

(declare-fun tp!14765 () Bool)

(declare-fun b_and!10469 () Bool)

(assert (=> b!168391 (= tp!14765 b_and!10469)))

(declare-fun mapIsEmpty!6504 () Bool)

(declare-fun mapRes!6504 () Bool)

(assert (=> mapIsEmpty!6504 mapRes!6504))

(declare-fun b!168384 () Bool)

(declare-fun res!80148 () Bool)

(declare-fun e!110694 () Bool)

(assert (=> b!168384 (=> res!80148 e!110694)))

(declare-datatypes ((V!4789 0))(
  ( (V!4790 (val!1973 Int)) )
))
(declare-datatypes ((ValueCell!1585 0))(
  ( (ValueCellFull!1585 (v!3838 V!4789)) (EmptyCell!1585) )
))
(declare-datatypes ((array!6811 0))(
  ( (array!6812 (arr!3241 (Array (_ BitVec 32) (_ BitVec 64))) (size!3529 (_ BitVec 32))) )
))
(declare-datatypes ((array!6813 0))(
  ( (array!6814 (arr!3242 (Array (_ BitVec 32) ValueCell!1585)) (size!3530 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2078 0))(
  ( (LongMapFixedSize!2079 (defaultEntry!3481 Int) (mask!8244 (_ BitVec 32)) (extraKeys!3222 (_ BitVec 32)) (zeroValue!3324 V!4789) (minValue!3324 V!4789) (_size!1088 (_ BitVec 32)) (_keys!5306 array!6811) (_values!3464 array!6813) (_vacant!1088 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2078)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6811 (_ BitVec 32)) Bool)

(assert (=> b!168384 (= res!80148 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5306 thiss!1248) (mask!8244 thiss!1248))))))

(declare-fun b!168385 () Bool)

(declare-fun res!80153 () Bool)

(assert (=> b!168385 (=> res!80153 e!110694)))

(assert (=> b!168385 (= res!80153 (or (not (= (size!3530 (_values!3464 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8244 thiss!1248)))) (not (= (size!3529 (_keys!5306 thiss!1248)) (size!3530 (_values!3464 thiss!1248)))) (bvslt (mask!8244 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3222 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3222 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!168386 () Bool)

(assert (=> b!168386 (= e!110694 true)))

(declare-fun lt!84196 () Bool)

(declare-datatypes ((List!2159 0))(
  ( (Nil!2156) (Cons!2155 (h!2772 (_ BitVec 64)) (t!6961 List!2159)) )
))
(declare-fun arrayNoDuplicates!0 (array!6811 (_ BitVec 32) List!2159) Bool)

(assert (=> b!168386 (= lt!84196 (arrayNoDuplicates!0 (_keys!5306 thiss!1248) #b00000000000000000000000000000000 Nil!2156))))

(declare-fun b!168387 () Bool)

(declare-fun e!110690 () Bool)

(declare-fun tp_is_empty!3857 () Bool)

(assert (=> b!168387 (= e!110690 tp_is_empty!3857)))

(declare-fun b!168388 () Bool)

(declare-fun e!110695 () Bool)

(declare-fun e!110696 () Bool)

(assert (=> b!168388 (= e!110695 e!110696)))

(declare-fun res!80150 () Bool)

(assert (=> b!168388 (=> (not res!80150) (not e!110696))))

(declare-datatypes ((SeekEntryResult!499 0))(
  ( (MissingZero!499 (index!4164 (_ BitVec 32))) (Found!499 (index!4165 (_ BitVec 32))) (Intermediate!499 (undefined!1311 Bool) (index!4166 (_ BitVec 32)) (x!18607 (_ BitVec 32))) (Undefined!499) (MissingVacant!499 (index!4167 (_ BitVec 32))) )
))
(declare-fun lt!84199 () SeekEntryResult!499)

(assert (=> b!168388 (= res!80150 (and (not (is-Undefined!499 lt!84199)) (not (is-MissingVacant!499 lt!84199)) (not (is-MissingZero!499 lt!84199)) (is-Found!499 lt!84199)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6811 (_ BitVec 32)) SeekEntryResult!499)

(assert (=> b!168388 (= lt!84199 (seekEntryOrOpen!0 key!828 (_keys!5306 thiss!1248) (mask!8244 thiss!1248)))))

(declare-fun b!168389 () Bool)

(declare-fun res!80151 () Bool)

(assert (=> b!168389 (=> (not res!80151) (not e!110695))))

(assert (=> b!168389 (= res!80151 (not (= key!828 (bvneg key!828))))))

(declare-fun b!168390 () Bool)

(declare-datatypes ((Unit!5180 0))(
  ( (Unit!5181) )
))
(declare-fun e!110698 () Unit!5180)

(declare-fun Unit!5182 () Unit!5180)

(assert (=> b!168390 (= e!110698 Unit!5182)))

(declare-fun lt!84197 () Unit!5180)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!123 (array!6811 array!6813 (_ BitVec 32) (_ BitVec 32) V!4789 V!4789 (_ BitVec 64) Int) Unit!5180)

(assert (=> b!168390 (= lt!84197 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!123 (_keys!5306 thiss!1248) (_values!3464 thiss!1248) (mask!8244 thiss!1248) (extraKeys!3222 thiss!1248) (zeroValue!3324 thiss!1248) (minValue!3324 thiss!1248) key!828 (defaultEntry!3481 thiss!1248)))))

(assert (=> b!168390 false))

(declare-fun res!80149 () Bool)

(assert (=> start!16750 (=> (not res!80149) (not e!110695))))

(declare-fun valid!900 (LongMapFixedSize!2078) Bool)

(assert (=> start!16750 (= res!80149 (valid!900 thiss!1248))))

(assert (=> start!16750 e!110695))

(declare-fun e!110691 () Bool)

(assert (=> start!16750 e!110691))

(assert (=> start!16750 true))

(assert (=> start!16750 tp_is_empty!3857))

(declare-fun e!110693 () Bool)

(declare-fun array_inv!2085 (array!6811) Bool)

(declare-fun array_inv!2086 (array!6813) Bool)

(assert (=> b!168391 (= e!110691 (and tp!14765 tp_is_empty!3857 (array_inv!2085 (_keys!5306 thiss!1248)) (array_inv!2086 (_values!3464 thiss!1248)) e!110693))))

(declare-fun b!168392 () Bool)

(declare-fun e!110699 () Bool)

(assert (=> b!168392 (= e!110699 tp_is_empty!3857)))

(declare-fun b!168393 () Bool)

(declare-fun e!110697 () Bool)

(assert (=> b!168393 (= e!110697 (= (select (arr!3241 (_keys!5306 thiss!1248)) (index!4165 lt!84199)) key!828))))

(declare-fun b!168394 () Bool)

(assert (=> b!168394 (= e!110693 (and e!110699 mapRes!6504))))

(declare-fun condMapEmpty!6504 () Bool)

(declare-fun mapDefault!6504 () ValueCell!1585)

