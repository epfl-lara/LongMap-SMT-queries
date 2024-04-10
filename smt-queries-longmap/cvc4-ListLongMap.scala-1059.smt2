; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22040 () Bool)

(assert start!22040)

(declare-fun b!227625 () Bool)

(declare-fun b_free!6107 () Bool)

(declare-fun b_next!6107 () Bool)

(assert (=> b!227625 (= b_free!6107 (not b_next!6107))))

(declare-fun tp!21463 () Bool)

(declare-fun b_and!13005 () Bool)

(assert (=> b!227625 (= tp!21463 b_and!13005)))

(declare-fun bm!21152 () Bool)

(declare-fun call!21155 () Bool)

(declare-datatypes ((V!7605 0))(
  ( (V!7606 (val!3029 Int)) )
))
(declare-datatypes ((ValueCell!2641 0))(
  ( (ValueCellFull!2641 (v!5049 V!7605)) (EmptyCell!2641) )
))
(declare-datatypes ((array!11181 0))(
  ( (array!11182 (arr!5310 (Array (_ BitVec 32) ValueCell!2641)) (size!5643 (_ BitVec 32))) )
))
(declare-datatypes ((array!11183 0))(
  ( (array!11184 (arr!5311 (Array (_ BitVec 32) (_ BitVec 64))) (size!5644 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3182 0))(
  ( (LongMapFixedSize!3183 (defaultEntry!4250 Int) (mask!10112 (_ BitVec 32)) (extraKeys!3987 (_ BitVec 32)) (zeroValue!4091 V!7605) (minValue!4091 V!7605) (_size!1640 (_ BitVec 32)) (_keys!6304 array!11183) (_values!4233 array!11181) (_vacant!1640 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3182)

(declare-datatypes ((SeekEntryResult!897 0))(
  ( (MissingZero!897 (index!5758 (_ BitVec 32))) (Found!897 (index!5759 (_ BitVec 32))) (Intermediate!897 (undefined!1709 Bool) (index!5760 (_ BitVec 32)) (x!23285 (_ BitVec 32))) (Undefined!897) (MissingVacant!897 (index!5761 (_ BitVec 32))) )
))
(declare-fun lt!114539 () SeekEntryResult!897)

(declare-fun c!37737 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21152 (= call!21155 (inRange!0 (ite c!37737 (index!5758 lt!114539) (index!5761 lt!114539)) (mask!10112 thiss!1504)))))

(declare-fun b!227607 () Bool)

(declare-fun e!147674 () Bool)

(declare-fun e!147663 () Bool)

(declare-fun mapRes!10123 () Bool)

(assert (=> b!227607 (= e!147674 (and e!147663 mapRes!10123))))

(declare-fun condMapEmpty!10123 () Bool)

(declare-fun mapDefault!10123 () ValueCell!2641)

