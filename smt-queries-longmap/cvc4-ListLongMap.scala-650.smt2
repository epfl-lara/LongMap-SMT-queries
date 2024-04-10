; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16252 () Bool)

(assert start!16252)

(declare-fun b!162154 () Bool)

(declare-fun b_free!3713 () Bool)

(declare-fun b_next!3713 () Bool)

(assert (=> b!162154 (= b_free!3713 (not b_next!3713))))

(declare-fun tp!13709 () Bool)

(declare-fun b_and!10127 () Bool)

(assert (=> b!162154 (= tp!13709 b_and!10127)))

(declare-fun e!106175 () Bool)

(declare-fun tp_is_empty!3515 () Bool)

(declare-fun e!106174 () Bool)

(declare-datatypes ((V!4333 0))(
  ( (V!4334 (val!1802 Int)) )
))
(declare-datatypes ((ValueCell!1414 0))(
  ( (ValueCellFull!1414 (v!3667 V!4333)) (EmptyCell!1414) )
))
(declare-datatypes ((array!6109 0))(
  ( (array!6110 (arr!2899 (Array (_ BitVec 32) (_ BitVec 64))) (size!3183 (_ BitVec 32))) )
))
(declare-datatypes ((array!6111 0))(
  ( (array!6112 (arr!2900 (Array (_ BitVec 32) ValueCell!1414)) (size!3184 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1736 0))(
  ( (LongMapFixedSize!1737 (defaultEntry!3310 Int) (mask!7922 (_ BitVec 32)) (extraKeys!3051 (_ BitVec 32)) (zeroValue!3153 V!4333) (minValue!3153 V!4333) (_size!917 (_ BitVec 32)) (_keys!5111 array!6109) (_values!3293 array!6111) (_vacant!917 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1736)

(declare-fun array_inv!1855 (array!6109) Bool)

(declare-fun array_inv!1856 (array!6111) Bool)

(assert (=> b!162154 (= e!106174 (and tp!13709 tp_is_empty!3515 (array_inv!1855 (_keys!5111 thiss!1248)) (array_inv!1856 (_values!3293 thiss!1248)) e!106175))))

(declare-fun mapNonEmpty!5960 () Bool)

(declare-fun mapRes!5960 () Bool)

(declare-fun tp!13708 () Bool)

(declare-fun e!106171 () Bool)

(assert (=> mapNonEmpty!5960 (= mapRes!5960 (and tp!13708 e!106171))))

(declare-fun mapValue!5960 () ValueCell!1414)

(declare-fun mapRest!5960 () (Array (_ BitVec 32) ValueCell!1414))

(declare-fun mapKey!5960 () (_ BitVec 32))

(assert (=> mapNonEmpty!5960 (= (arr!2900 (_values!3293 thiss!1248)) (store mapRest!5960 mapKey!5960 mapValue!5960))))

(declare-fun b!162155 () Bool)

(declare-fun e!106172 () Bool)

(declare-fun e!106170 () Bool)

(assert (=> b!162155 (= e!106172 e!106170)))

(declare-fun res!76818 () Bool)

(assert (=> b!162155 (=> (not res!76818) (not e!106170))))

(declare-datatypes ((SeekEntryResult!373 0))(
  ( (MissingZero!373 (index!3660 (_ BitVec 32))) (Found!373 (index!3661 (_ BitVec 32))) (Intermediate!373 (undefined!1185 Bool) (index!3662 (_ BitVec 32)) (x!17917 (_ BitVec 32))) (Undefined!373) (MissingVacant!373 (index!3663 (_ BitVec 32))) )
))
(declare-fun lt!82389 () SeekEntryResult!373)

(assert (=> b!162155 (= res!76818 (and (not (is-Undefined!373 lt!82389)) (is-MissingVacant!373 lt!82389)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6109 (_ BitVec 32)) SeekEntryResult!373)

(assert (=> b!162155 (= lt!82389 (seekEntryOrOpen!0 key!828 (_keys!5111 thiss!1248) (mask!7922 thiss!1248)))))

(declare-fun b!162156 () Bool)

(declare-fun e!106173 () Bool)

(assert (=> b!162156 (= e!106175 (and e!106173 mapRes!5960))))

(declare-fun condMapEmpty!5960 () Bool)

(declare-fun mapDefault!5960 () ValueCell!1414)

