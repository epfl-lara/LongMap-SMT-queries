; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24266 () Bool)

(assert start!24266)

(declare-fun b!253705 () Bool)

(declare-fun b_free!6667 () Bool)

(declare-fun b_next!6667 () Bool)

(assert (=> b!253705 (= b_free!6667 (not b_next!6667))))

(declare-fun tp!23288 () Bool)

(declare-fun b_and!13709 () Bool)

(assert (=> b!253705 (= tp!23288 b_and!13709)))

(declare-fun b!253694 () Bool)

(declare-fun res!124178 () Bool)

(declare-fun e!164473 () Bool)

(assert (=> b!253694 (=> res!124178 e!164473)))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((V!8353 0))(
  ( (V!8354 (val!3309 Int)) )
))
(declare-datatypes ((ValueCell!2921 0))(
  ( (ValueCellFull!2921 (v!5383 V!8353)) (EmptyCell!2921) )
))
(declare-datatypes ((array!12389 0))(
  ( (array!12390 (arr!5870 (Array (_ BitVec 32) ValueCell!2921)) (size!6217 (_ BitVec 32))) )
))
(declare-datatypes ((array!12391 0))(
  ( (array!12392 (arr!5871 (Array (_ BitVec 32) (_ BitVec 64))) (size!6218 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3742 0))(
  ( (LongMapFixedSize!3743 (defaultEntry!4684 Int) (mask!10924 (_ BitVec 32)) (extraKeys!4421 (_ BitVec 32)) (zeroValue!4525 V!8353) (minValue!4525 V!8353) (_size!1920 (_ BitVec 32)) (_keys!6838 array!12391) (_values!4667 array!12389) (_vacant!1920 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3742)

(assert (=> b!253694 (= res!124178 (or (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!6218 (_keys!6838 thiss!1504)))))))

(declare-fun b!253695 () Bool)

(declare-fun res!124181 () Bool)

(declare-fun e!164472 () Bool)

(assert (=> b!253695 (=> (not res!124181) (not e!164472))))

(declare-fun call!23946 () Bool)

(assert (=> b!253695 (= res!124181 call!23946)))

(declare-fun e!164479 () Bool)

(assert (=> b!253695 (= e!164479 e!164472)))

(declare-fun b!253696 () Bool)

(declare-fun res!124182 () Bool)

(declare-datatypes ((SeekEntryResult!1140 0))(
  ( (MissingZero!1140 (index!6730 (_ BitVec 32))) (Found!1140 (index!6731 (_ BitVec 32))) (Intermediate!1140 (undefined!1952 Bool) (index!6732 (_ BitVec 32)) (x!24832 (_ BitVec 32))) (Undefined!1140) (MissingVacant!1140 (index!6733 (_ BitVec 32))) )
))
(declare-fun lt!127171 () SeekEntryResult!1140)

(assert (=> b!253696 (= res!124182 (= (select (arr!5871 (_keys!6838 thiss!1504)) (index!6733 lt!127171)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!164480 () Bool)

(assert (=> b!253696 (=> (not res!124182) (not e!164480))))

(declare-fun b!253697 () Bool)

(declare-fun e!164476 () Bool)

(declare-fun e!164470 () Bool)

(declare-fun mapRes!11109 () Bool)

(assert (=> b!253697 (= e!164476 (and e!164470 mapRes!11109))))

(declare-fun condMapEmpty!11109 () Bool)

(declare-fun mapDefault!11109 () ValueCell!2921)

