; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23298 () Bool)

(assert start!23298)

(declare-fun b!245065 () Bool)

(declare-fun b_free!6551 () Bool)

(declare-fun b_next!6551 () Bool)

(assert (=> b!245065 (= b_free!6551 (not b_next!6551))))

(declare-fun tp!22881 () Bool)

(declare-fun b_and!13537 () Bool)

(assert (=> b!245065 (= tp!22881 b_and!13537)))

(declare-datatypes ((SeekEntryResult!1086 0))(
  ( (MissingZero!1086 (index!6514 (_ BitVec 32))) (Found!1086 (index!6515 (_ BitVec 32))) (Intermediate!1086 (undefined!1898 Bool) (index!6516 (_ BitVec 32)) (x!24398 (_ BitVec 32))) (Undefined!1086) (MissingVacant!1086 (index!6517 (_ BitVec 32))) )
))
(declare-fun lt!122707 () SeekEntryResult!1086)

(declare-datatypes ((V!8197 0))(
  ( (V!8198 (val!3251 Int)) )
))
(declare-datatypes ((ValueCell!2863 0))(
  ( (ValueCellFull!2863 (v!5302 V!8197)) (EmptyCell!2863) )
))
(declare-datatypes ((array!12121 0))(
  ( (array!12122 (arr!5754 (Array (_ BitVec 32) ValueCell!2863)) (size!6096 (_ BitVec 32))) )
))
(declare-datatypes ((array!12123 0))(
  ( (array!12124 (arr!5755 (Array (_ BitVec 32) (_ BitVec 64))) (size!6097 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3626 0))(
  ( (LongMapFixedSize!3627 (defaultEntry!4534 Int) (mask!10639 (_ BitVec 32)) (extraKeys!4271 (_ BitVec 32)) (zeroValue!4375 V!8197) (minValue!4375 V!8197) (_size!1862 (_ BitVec 32)) (_keys!6647 array!12123) (_values!4517 array!12121) (_vacant!1862 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3626)

(declare-fun bm!22853 () Bool)

(declare-fun call!22857 () Bool)

(declare-fun c!40897 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22853 (= call!22857 (inRange!0 (ite c!40897 (index!6514 lt!122707) (index!6517 lt!122707)) (mask!10639 thiss!1504)))))

(declare-fun b!245054 () Bool)

(declare-fun e!158994 () Bool)

(declare-fun e!158988 () Bool)

(declare-fun mapRes!10876 () Bool)

(assert (=> b!245054 (= e!158994 (and e!158988 mapRes!10876))))

(declare-fun condMapEmpty!10876 () Bool)

(declare-fun mapDefault!10876 () ValueCell!2863)

