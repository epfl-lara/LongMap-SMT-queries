; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16788 () Bool)

(assert start!16788)

(declare-fun b!169038 () Bool)

(declare-fun b_free!4093 () Bool)

(declare-fun b_next!4093 () Bool)

(assert (=> b!169038 (= b_free!4093 (not b_next!4093))))

(declare-fun tp!14879 () Bool)

(declare-fun b_and!10507 () Bool)

(assert (=> b!169038 (= tp!14879 b_and!10507)))

(declare-fun b!169029 () Bool)

(declare-datatypes ((Unit!5227 0))(
  ( (Unit!5228) )
))
(declare-fun e!111248 () Unit!5227)

(declare-fun Unit!5229 () Unit!5227)

(assert (=> b!169029 (= e!111248 Unit!5229)))

(declare-fun lt!84774 () Unit!5227)

(declare-datatypes ((V!4841 0))(
  ( (V!4842 (val!1992 Int)) )
))
(declare-datatypes ((ValueCell!1604 0))(
  ( (ValueCellFull!1604 (v!3857 V!4841)) (EmptyCell!1604) )
))
(declare-datatypes ((array!6887 0))(
  ( (array!6888 (arr!3279 (Array (_ BitVec 32) (_ BitVec 64))) (size!3567 (_ BitVec 32))) )
))
(declare-datatypes ((array!6889 0))(
  ( (array!6890 (arr!3280 (Array (_ BitVec 32) ValueCell!1604)) (size!3568 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2116 0))(
  ( (LongMapFixedSize!2117 (defaultEntry!3500 Int) (mask!8277 (_ BitVec 32)) (extraKeys!3241 (_ BitVec 32)) (zeroValue!3343 V!4841) (minValue!3343 V!4841) (_size!1107 (_ BitVec 32)) (_keys!5325 array!6887) (_values!3483 array!6889) (_vacant!1107 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2116)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!136 (array!6887 array!6889 (_ BitVec 32) (_ BitVec 32) V!4841 V!4841 (_ BitVec 64) Int) Unit!5227)

(assert (=> b!169029 (= lt!84774 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!136 (_keys!5325 thiss!1248) (_values!3483 thiss!1248) (mask!8277 thiss!1248) (extraKeys!3241 thiss!1248) (zeroValue!3343 thiss!1248) (minValue!3343 thiss!1248) key!828 (defaultEntry!3500 thiss!1248)))))

(assert (=> b!169029 false))

(declare-fun b!169030 () Bool)

(declare-fun e!111246 () Bool)

(declare-fun tp_is_empty!3895 () Bool)

(assert (=> b!169030 (= e!111246 tp_is_empty!3895)))

(declare-fun b!169031 () Bool)

(declare-fun e!111241 () Bool)

(declare-fun e!111242 () Bool)

(assert (=> b!169031 (= e!111241 e!111242)))

(declare-fun res!80452 () Bool)

(assert (=> b!169031 (=> (not res!80452) (not e!111242))))

(declare-datatypes ((SeekEntryResult!516 0))(
  ( (MissingZero!516 (index!4232 (_ BitVec 32))) (Found!516 (index!4233 (_ BitVec 32))) (Intermediate!516 (undefined!1328 Bool) (index!4234 (_ BitVec 32)) (x!18680 (_ BitVec 32))) (Undefined!516) (MissingVacant!516 (index!4235 (_ BitVec 32))) )
))
(declare-fun lt!84770 () SeekEntryResult!516)

(assert (=> b!169031 (= res!80452 (and (not (is-Undefined!516 lt!84770)) (not (is-MissingVacant!516 lt!84770)) (not (is-MissingZero!516 lt!84770)) (is-Found!516 lt!84770)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6887 (_ BitVec 32)) SeekEntryResult!516)

(assert (=> b!169031 (= lt!84770 (seekEntryOrOpen!0 key!828 (_keys!5325 thiss!1248) (mask!8277 thiss!1248)))))

(declare-fun b!169032 () Bool)

(declare-fun e!111243 () Bool)

(declare-fun e!111245 () Bool)

(declare-fun mapRes!6561 () Bool)

(assert (=> b!169032 (= e!111243 (and e!111245 mapRes!6561))))

(declare-fun condMapEmpty!6561 () Bool)

(declare-fun mapDefault!6561 () ValueCell!1604)

