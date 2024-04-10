; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21958 () Bool)

(assert start!21958)

(declare-fun b!224650 () Bool)

(declare-fun b_free!6025 () Bool)

(declare-fun b_next!6025 () Bool)

(assert (=> b!224650 (= b_free!6025 (not b_next!6025))))

(declare-fun tp!21217 () Bool)

(declare-fun b_and!12923 () Bool)

(assert (=> b!224650 (= tp!21217 b_and!12923)))

(declare-fun res!110554 () Bool)

(declare-fun e!145824 () Bool)

(assert (=> start!21958 (=> (not res!110554) (not e!145824))))

(declare-datatypes ((V!7497 0))(
  ( (V!7498 (val!2988 Int)) )
))
(declare-datatypes ((ValueCell!2600 0))(
  ( (ValueCellFull!2600 (v!5008 V!7497)) (EmptyCell!2600) )
))
(declare-datatypes ((array!11017 0))(
  ( (array!11018 (arr!5228 (Array (_ BitVec 32) ValueCell!2600)) (size!5561 (_ BitVec 32))) )
))
(declare-datatypes ((array!11019 0))(
  ( (array!11020 (arr!5229 (Array (_ BitVec 32) (_ BitVec 64))) (size!5562 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3100 0))(
  ( (LongMapFixedSize!3101 (defaultEntry!4209 Int) (mask!10045 (_ BitVec 32)) (extraKeys!3946 (_ BitVec 32)) (zeroValue!4050 V!7497) (minValue!4050 V!7497) (_size!1599 (_ BitVec 32)) (_keys!6263 array!11019) (_values!4192 array!11017) (_vacant!1599 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3100)

(declare-fun valid!1250 (LongMapFixedSize!3100) Bool)

(assert (=> start!21958 (= res!110554 (valid!1250 thiss!1504))))

(assert (=> start!21958 e!145824))

(declare-fun e!145827 () Bool)

(assert (=> start!21958 e!145827))

(assert (=> start!21958 true))

(declare-fun b!224637 () Bool)

(declare-fun e!145826 () Bool)

(declare-fun call!20910 () Bool)

(assert (=> b!224637 (= e!145826 (not call!20910))))

(declare-fun b!224638 () Bool)

(declare-fun e!145831 () Bool)

(declare-fun tp_is_empty!5887 () Bool)

(assert (=> b!224638 (= e!145831 tp_is_empty!5887)))

(declare-fun b!224639 () Bool)

(declare-fun res!110547 () Bool)

(declare-fun e!145830 () Bool)

(assert (=> b!224639 (=> (not res!110547) (not e!145830))))

(declare-fun call!20909 () Bool)

(assert (=> b!224639 (= res!110547 call!20909)))

(declare-fun e!145834 () Bool)

(assert (=> b!224639 (= e!145834 e!145830)))

(declare-fun b!224640 () Bool)

(declare-fun e!145828 () Bool)

(declare-fun mapRes!10000 () Bool)

(assert (=> b!224640 (= e!145828 (and e!145831 mapRes!10000))))

(declare-fun condMapEmpty!10000 () Bool)

(declare-fun mapDefault!10000 () ValueCell!2600)

