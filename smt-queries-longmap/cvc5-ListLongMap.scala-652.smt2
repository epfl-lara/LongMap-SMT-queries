; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16260 () Bool)

(assert start!16260)

(declare-fun b!162232 () Bool)

(declare-fun b_free!3721 () Bool)

(declare-fun b_next!3721 () Bool)

(assert (=> b!162232 (= b_free!3721 (not b_next!3721))))

(declare-fun tp!13733 () Bool)

(declare-fun b_and!10135 () Bool)

(assert (=> b!162232 (= tp!13733 b_and!10135)))

(declare-fun mapNonEmpty!5972 () Bool)

(declare-fun mapRes!5972 () Bool)

(declare-fun tp!13732 () Bool)

(declare-fun e!106243 () Bool)

(assert (=> mapNonEmpty!5972 (= mapRes!5972 (and tp!13732 e!106243))))

(declare-fun mapKey!5972 () (_ BitVec 32))

(declare-datatypes ((V!4345 0))(
  ( (V!4346 (val!1806 Int)) )
))
(declare-datatypes ((ValueCell!1418 0))(
  ( (ValueCellFull!1418 (v!3671 V!4345)) (EmptyCell!1418) )
))
(declare-fun mapRest!5972 () (Array (_ BitVec 32) ValueCell!1418))

(declare-fun mapValue!5972 () ValueCell!1418)

(declare-datatypes ((array!6125 0))(
  ( (array!6126 (arr!2907 (Array (_ BitVec 32) (_ BitVec 64))) (size!3191 (_ BitVec 32))) )
))
(declare-datatypes ((array!6127 0))(
  ( (array!6128 (arr!2908 (Array (_ BitVec 32) ValueCell!1418)) (size!3192 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1744 0))(
  ( (LongMapFixedSize!1745 (defaultEntry!3314 Int) (mask!7930 (_ BitVec 32)) (extraKeys!3055 (_ BitVec 32)) (zeroValue!3157 V!4345) (minValue!3157 V!4345) (_size!921 (_ BitVec 32)) (_keys!5115 array!6125) (_values!3297 array!6127) (_vacant!921 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1744)

(assert (=> mapNonEmpty!5972 (= (arr!2908 (_values!3297 thiss!1248)) (store mapRest!5972 mapKey!5972 mapValue!5972))))

(declare-fun b!162227 () Bool)

(declare-fun e!106247 () Bool)

(declare-fun tp_is_empty!3523 () Bool)

(assert (=> b!162227 (= e!106247 tp_is_empty!3523)))

(declare-fun res!76843 () Bool)

(declare-fun e!106246 () Bool)

(assert (=> start!16260 (=> (not res!76843) (not e!106246))))

(declare-fun valid!790 (LongMapFixedSize!1744) Bool)

(assert (=> start!16260 (= res!76843 (valid!790 thiss!1248))))

(assert (=> start!16260 e!106246))

(declare-fun e!106244 () Bool)

(assert (=> start!16260 e!106244))

(assert (=> start!16260 true))

(declare-fun b!162228 () Bool)

(declare-datatypes ((SeekEntryResult!376 0))(
  ( (MissingZero!376 (index!3672 (_ BitVec 32))) (Found!376 (index!3673 (_ BitVec 32))) (Intermediate!376 (undefined!1188 Bool) (index!3674 (_ BitVec 32)) (x!17936 (_ BitVec 32))) (Undefined!376) (MissingVacant!376 (index!3675 (_ BitVec 32))) )
))
(declare-fun lt!82402 () SeekEntryResult!376)

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!162228 (= e!106246 (and (not (is-Undefined!376 lt!82402)) (not (is-MissingVacant!376 lt!82402)) (is-MissingZero!376 lt!82402) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6125 (_ BitVec 32)) SeekEntryResult!376)

(assert (=> b!162228 (= lt!82402 (seekEntryOrOpen!0 key!828 (_keys!5115 thiss!1248) (mask!7930 thiss!1248)))))

(declare-fun b!162229 () Bool)

(declare-fun e!106248 () Bool)

(assert (=> b!162229 (= e!106248 (and e!106247 mapRes!5972))))

(declare-fun condMapEmpty!5972 () Bool)

(declare-fun mapDefault!5972 () ValueCell!1418)

