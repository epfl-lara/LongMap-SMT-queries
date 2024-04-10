; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19928 () Bool)

(assert start!19928)

(declare-fun b!195549 () Bool)

(declare-fun b_free!4729 () Bool)

(declare-fun b_next!4729 () Bool)

(assert (=> b!195549 (= b_free!4729 (not b_next!4729))))

(declare-fun tp!17070 () Bool)

(declare-fun b_and!11475 () Bool)

(assert (=> b!195549 (= tp!17070 b_and!11475)))

(declare-fun b!195541 () Bool)

(declare-fun b_free!4731 () Bool)

(declare-fun b_next!4731 () Bool)

(assert (=> b!195541 (= b_free!4731 (not b_next!4731))))

(declare-fun tp!17071 () Bool)

(declare-fun b_and!11477 () Bool)

(assert (=> b!195541 (= tp!17071 b_and!11477)))

(declare-fun b!195539 () Bool)

(declare-fun e!128633 () Bool)

(declare-fun e!128620 () Bool)

(assert (=> b!195539 (= e!128633 e!128620)))

(declare-fun res!92301 () Bool)

(assert (=> b!195539 (=> (not res!92301) (not e!128620))))

(declare-datatypes ((SeekEntryResult!698 0))(
  ( (MissingZero!698 (index!4962 (_ BitVec 32))) (Found!698 (index!4963 (_ BitVec 32))) (Intermediate!698 (undefined!1510 Bool) (index!4964 (_ BitVec 32)) (x!20753 (_ BitVec 32))) (Undefined!698) (MissingVacant!698 (index!4965 (_ BitVec 32))) )
))
(declare-fun lt!97475 () SeekEntryResult!698)

(assert (=> b!195539 (= res!92301 (and (not (is-Undefined!698 lt!97475)) (not (is-MissingVacant!698 lt!97475)) (not (is-MissingZero!698 lt!97475)) (not (is-Found!698 lt!97475))))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!5649 0))(
  ( (V!5650 (val!2295 Int)) )
))
(declare-datatypes ((ValueCell!1907 0))(
  ( (ValueCellFull!1907 (v!4263 V!5649)) (EmptyCell!1907) )
))
(declare-datatypes ((array!8257 0))(
  ( (array!8258 (arr!3885 (Array (_ BitVec 32) (_ BitVec 64))) (size!4210 (_ BitVec 32))) )
))
(declare-datatypes ((array!8259 0))(
  ( (array!8260 (arr!3886 (Array (_ BitVec 32) ValueCell!1907)) (size!4211 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2722 0))(
  ( (LongMapFixedSize!2723 (defaultEntry!3975 Int) (mask!9251 (_ BitVec 32)) (extraKeys!3712 (_ BitVec 32)) (zeroValue!3816 V!5649) (minValue!3816 V!5649) (_size!1410 (_ BitVec 32)) (_keys!5974 array!8257) (_values!3958 array!8259) (_vacant!1410 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2722)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8257 (_ BitVec 32)) SeekEntryResult!698)

(assert (=> b!195539 (= lt!97475 (seekEntryOrOpen!0 key!828 (_keys!5974 thiss!1248) (mask!9251 thiss!1248)))))

(declare-fun b!195540 () Bool)

(declare-fun e!128628 () Bool)

(declare-fun e!128632 () Bool)

(declare-fun mapRes!7794 () Bool)

(assert (=> b!195540 (= e!128628 (and e!128632 mapRes!7794))))

(declare-fun condMapEmpty!7795 () Bool)

(declare-fun mapDefault!7794 () ValueCell!1907)

