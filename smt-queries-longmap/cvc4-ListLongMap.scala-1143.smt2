; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23664 () Bool)

(assert start!23664)

(declare-fun b!248784 () Bool)

(declare-fun b_free!6611 () Bool)

(declare-fun b_next!6611 () Bool)

(assert (=> b!248784 (= b_free!6611 (not b_next!6611))))

(declare-fun tp!23087 () Bool)

(declare-fun b_and!13617 () Bool)

(assert (=> b!248784 (= tp!23087 b_and!13617)))

(declare-fun b!248772 () Bool)

(declare-fun res!121909 () Bool)

(declare-fun e!161370 () Bool)

(assert (=> b!248772 (=> (not res!121909) (not e!161370))))

(declare-fun call!23330 () Bool)

(assert (=> b!248772 (= res!121909 call!23330)))

(declare-fun e!161369 () Bool)

(assert (=> b!248772 (= e!161369 e!161370)))

(declare-fun b!248773 () Bool)

(declare-fun res!121908 () Bool)

(assert (=> b!248773 (=> (not res!121908) (not e!161370))))

(declare-datatypes ((V!8277 0))(
  ( (V!8278 (val!3281 Int)) )
))
(declare-datatypes ((ValueCell!2893 0))(
  ( (ValueCellFull!2893 (v!5341 V!8277)) (EmptyCell!2893) )
))
(declare-datatypes ((array!12257 0))(
  ( (array!12258 (arr!5814 (Array (_ BitVec 32) ValueCell!2893)) (size!6157 (_ BitVec 32))) )
))
(declare-datatypes ((array!12259 0))(
  ( (array!12260 (arr!5815 (Array (_ BitVec 32) (_ BitVec 64))) (size!6158 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3686 0))(
  ( (LongMapFixedSize!3687 (defaultEntry!4600 Int) (mask!10754 (_ BitVec 32)) (extraKeys!4337 (_ BitVec 32)) (zeroValue!4441 V!8277) (minValue!4441 V!8277) (_size!1892 (_ BitVec 32)) (_keys!6726 array!12259) (_values!4583 array!12257) (_vacant!1892 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3686)

(declare-datatypes ((SeekEntryResult!1114 0))(
  ( (MissingZero!1114 (index!6626 (_ BitVec 32))) (Found!1114 (index!6627 (_ BitVec 32))) (Intermediate!1114 (undefined!1926 Bool) (index!6628 (_ BitVec 32)) (x!24594 (_ BitVec 32))) (Undefined!1114) (MissingVacant!1114 (index!6629 (_ BitVec 32))) )
))
(declare-fun lt!124577 () SeekEntryResult!1114)

(assert (=> b!248773 (= res!121908 (= (select (arr!5815 (_keys!6726 thiss!1504)) (index!6626 lt!124577)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!248774 () Bool)

(declare-fun e!161371 () Bool)

(declare-fun e!161362 () Bool)

(declare-fun mapRes!10991 () Bool)

(assert (=> b!248774 (= e!161371 (and e!161362 mapRes!10991))))

(declare-fun condMapEmpty!10991 () Bool)

(declare-fun mapDefault!10991 () ValueCell!2893)

