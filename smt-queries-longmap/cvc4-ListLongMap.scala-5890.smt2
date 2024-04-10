; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75910 () Bool)

(assert start!75910)

(declare-fun b!893148 () Bool)

(declare-fun b_free!15845 () Bool)

(declare-fun b_next!15845 () Bool)

(assert (=> b!893148 (= b_free!15845 (not b_next!15845))))

(declare-fun tp!55506 () Bool)

(declare-fun b_and!26107 () Bool)

(assert (=> b!893148 (= tp!55506 b_and!26107)))

(declare-fun b!893143 () Bool)

(declare-fun e!498747 () Bool)

(assert (=> b!893143 (= e!498747 true)))

(declare-fun lt!403544 () Bool)

(declare-datatypes ((array!52328 0))(
  ( (array!52329 (arr!25169 (Array (_ BitVec 32) (_ BitVec 64))) (size!25613 (_ BitVec 32))) )
))
(declare-datatypes ((V!29195 0))(
  ( (V!29196 (val!9137 Int)) )
))
(declare-datatypes ((ValueCell!8605 0))(
  ( (ValueCellFull!8605 (v!11616 V!29195)) (EmptyCell!8605) )
))
(declare-datatypes ((array!52330 0))(
  ( (array!52331 (arr!25170 (Array (_ BitVec 32) ValueCell!8605)) (size!25614 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4226 0))(
  ( (LongMapFixedSize!4227 (defaultEntry!5313 Int) (mask!25837 (_ BitVec 32)) (extraKeys!5008 (_ BitVec 32)) (zeroValue!5112 V!29195) (minValue!5112 V!29195) (_size!2168 (_ BitVec 32)) (_keys!9998 array!52328) (_values!5299 array!52330) (_vacant!2168 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4226)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun contains!4377 (LongMapFixedSize!4226 (_ BitVec 64)) Bool)

(assert (=> b!893143 (= lt!403544 (contains!4377 thiss!1181 key!785))))

(declare-fun b!893144 () Bool)

(declare-fun e!498744 () Bool)

(assert (=> b!893144 (= e!498744 (not e!498747))))

(declare-fun res!604910 () Bool)

(assert (=> b!893144 (=> res!604910 e!498747)))

(declare-datatypes ((SeekEntryResult!8860 0))(
  ( (MissingZero!8860 (index!37811 (_ BitVec 32))) (Found!8860 (index!37812 (_ BitVec 32))) (Intermediate!8860 (undefined!9672 Bool) (index!37813 (_ BitVec 32)) (x!75920 (_ BitVec 32))) (Undefined!8860) (MissingVacant!8860 (index!37814 (_ BitVec 32))) )
))
(declare-fun lt!403545 () SeekEntryResult!8860)

(assert (=> b!893144 (= res!604910 (is-Found!8860 lt!403545))))

(declare-fun e!498749 () Bool)

(assert (=> b!893144 e!498749))

(declare-fun res!604911 () Bool)

(assert (=> b!893144 (=> res!604911 e!498749)))

(assert (=> b!893144 (= res!604911 (not (is-Found!8860 lt!403545)))))

(declare-datatypes ((Unit!30418 0))(
  ( (Unit!30419) )
))
(declare-fun lt!403546 () Unit!30418)

(declare-fun lemmaSeekEntryGivesInRangeIndex!59 (array!52328 array!52330 (_ BitVec 32) (_ BitVec 32) V!29195 V!29195 (_ BitVec 64)) Unit!30418)

(assert (=> b!893144 (= lt!403546 (lemmaSeekEntryGivesInRangeIndex!59 (_keys!9998 thiss!1181) (_values!5299 thiss!1181) (mask!25837 thiss!1181) (extraKeys!5008 thiss!1181) (zeroValue!5112 thiss!1181) (minValue!5112 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52328 (_ BitVec 32)) SeekEntryResult!8860)

(assert (=> b!893144 (= lt!403545 (seekEntry!0 key!785 (_keys!9998 thiss!1181) (mask!25837 thiss!1181)))))

(declare-fun mapNonEmpty!28817 () Bool)

(declare-fun mapRes!28817 () Bool)

(declare-fun tp!55507 () Bool)

(declare-fun e!498750 () Bool)

(assert (=> mapNonEmpty!28817 (= mapRes!28817 (and tp!55507 e!498750))))

(declare-fun mapRest!28817 () (Array (_ BitVec 32) ValueCell!8605))

(declare-fun mapValue!28817 () ValueCell!8605)

(declare-fun mapKey!28817 () (_ BitVec 32))

(assert (=> mapNonEmpty!28817 (= (arr!25170 (_values!5299 thiss!1181)) (store mapRest!28817 mapKey!28817 mapValue!28817))))

(declare-fun b!893145 () Bool)

(declare-fun e!498746 () Bool)

(declare-fun e!498745 () Bool)

(assert (=> b!893145 (= e!498746 (and e!498745 mapRes!28817))))

(declare-fun condMapEmpty!28817 () Bool)

(declare-fun mapDefault!28817 () ValueCell!8605)

