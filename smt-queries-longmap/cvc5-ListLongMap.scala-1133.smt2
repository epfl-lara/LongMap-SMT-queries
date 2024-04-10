; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23294 () Bool)

(assert start!23294)

(declare-fun b!244918 () Bool)

(declare-fun b_free!6547 () Bool)

(declare-fun b_next!6547 () Bool)

(assert (=> b!244918 (= b_free!6547 (not b_next!6547))))

(declare-fun tp!22869 () Bool)

(declare-fun b_and!13533 () Bool)

(assert (=> b!244918 (= tp!22869 b_and!13533)))

(declare-fun b!244915 () Bool)

(declare-fun e!158899 () Bool)

(declare-datatypes ((SeekEntryResult!1084 0))(
  ( (MissingZero!1084 (index!6506 (_ BitVec 32))) (Found!1084 (index!6507 (_ BitVec 32))) (Intermediate!1084 (undefined!1896 Bool) (index!6508 (_ BitVec 32)) (x!24396 (_ BitVec 32))) (Undefined!1084) (MissingVacant!1084 (index!6509 (_ BitVec 32))) )
))
(declare-fun lt!122665 () SeekEntryResult!1084)

(assert (=> b!244915 (= e!158899 (is-Undefined!1084 lt!122665))))

(declare-fun b!244916 () Bool)

(declare-fun e!158897 () Bool)

(declare-fun e!158902 () Bool)

(declare-fun mapRes!10870 () Bool)

(assert (=> b!244916 (= e!158897 (and e!158902 mapRes!10870))))

(declare-fun condMapEmpty!10870 () Bool)

(declare-datatypes ((V!8193 0))(
  ( (V!8194 (val!3249 Int)) )
))
(declare-datatypes ((ValueCell!2861 0))(
  ( (ValueCellFull!2861 (v!5300 V!8193)) (EmptyCell!2861) )
))
(declare-datatypes ((array!12113 0))(
  ( (array!12114 (arr!5750 (Array (_ BitVec 32) ValueCell!2861)) (size!6092 (_ BitVec 32))) )
))
(declare-datatypes ((array!12115 0))(
  ( (array!12116 (arr!5751 (Array (_ BitVec 32) (_ BitVec 64))) (size!6093 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3622 0))(
  ( (LongMapFixedSize!3623 (defaultEntry!4532 Int) (mask!10637 (_ BitVec 32)) (extraKeys!4269 (_ BitVec 32)) (zeroValue!4373 V!8193) (minValue!4373 V!8193) (_size!1860 (_ BitVec 32)) (_keys!6645 array!12115) (_values!4515 array!12113) (_vacant!1860 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3622)

(declare-fun mapDefault!10870 () ValueCell!2861)

