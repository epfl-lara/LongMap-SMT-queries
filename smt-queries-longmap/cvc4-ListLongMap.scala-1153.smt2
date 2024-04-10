; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24270 () Bool)

(assert start!24270)

(declare-fun b!253869 () Bool)

(declare-fun b_free!6671 () Bool)

(declare-fun b_next!6671 () Bool)

(assert (=> b!253869 (= b_free!6671 (not b_next!6671))))

(declare-fun tp!23300 () Bool)

(declare-fun b_and!13713 () Bool)

(assert (=> b!253869 (= tp!23300 b_and!13713)))

(declare-fun mapNonEmpty!11115 () Bool)

(declare-fun mapRes!11115 () Bool)

(declare-fun tp!23301 () Bool)

(declare-fun e!164563 () Bool)

(assert (=> mapNonEmpty!11115 (= mapRes!11115 (and tp!23301 e!164563))))

(declare-datatypes ((V!8357 0))(
  ( (V!8358 (val!3311 Int)) )
))
(declare-datatypes ((ValueCell!2923 0))(
  ( (ValueCellFull!2923 (v!5385 V!8357)) (EmptyCell!2923) )
))
(declare-fun mapRest!11115 () (Array (_ BitVec 32) ValueCell!2923))

(declare-datatypes ((array!12397 0))(
  ( (array!12398 (arr!5874 (Array (_ BitVec 32) ValueCell!2923)) (size!6221 (_ BitVec 32))) )
))
(declare-datatypes ((array!12399 0))(
  ( (array!12400 (arr!5875 (Array (_ BitVec 32) (_ BitVec 64))) (size!6222 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3746 0))(
  ( (LongMapFixedSize!3747 (defaultEntry!4686 Int) (mask!10926 (_ BitVec 32)) (extraKeys!4423 (_ BitVec 32)) (zeroValue!4527 V!8357) (minValue!4527 V!8357) (_size!1922 (_ BitVec 32)) (_keys!6840 array!12399) (_values!4669 array!12397) (_vacant!1922 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3746)

(declare-fun mapKey!11115 () (_ BitVec 32))

(declare-fun mapValue!11115 () ValueCell!2923)

(assert (=> mapNonEmpty!11115 (= (arr!5874 (_values!4669 thiss!1504)) (store mapRest!11115 mapKey!11115 mapValue!11115))))

(declare-fun mapIsEmpty!11115 () Bool)

(assert (=> mapIsEmpty!11115 mapRes!11115))

(declare-fun b!253850 () Bool)

(declare-fun c!42818 () Bool)

(declare-datatypes ((SeekEntryResult!1142 0))(
  ( (MissingZero!1142 (index!6738 (_ BitVec 32))) (Found!1142 (index!6739 (_ BitVec 32))) (Intermediate!1142 (undefined!1954 Bool) (index!6740 (_ BitVec 32)) (x!24834 (_ BitVec 32))) (Undefined!1142) (MissingVacant!1142 (index!6741 (_ BitVec 32))) )
))
(declare-fun lt!127232 () SeekEntryResult!1142)

(assert (=> b!253850 (= c!42818 (is-MissingVacant!1142 lt!127232))))

(declare-fun e!164561 () Bool)

(declare-fun e!164566 () Bool)

(assert (=> b!253850 (= e!164561 e!164566)))

(declare-fun b!253851 () Bool)

(declare-fun e!164572 () Bool)

(declare-fun e!164567 () Bool)

(assert (=> b!253851 (= e!164572 e!164567)))

(declare-fun res!124273 () Bool)

(assert (=> b!253851 (=> (not res!124273) (not e!164567))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!253851 (= res!124273 (inRange!0 index!297 (mask!10926 thiss!1504)))))

(declare-datatypes ((Unit!7853 0))(
  ( (Unit!7854) )
))
(declare-fun lt!127235 () Unit!7853)

(declare-fun e!164571 () Unit!7853)

(assert (=> b!253851 (= lt!127235 e!164571)))

(declare-fun c!42817 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4874 0))(
  ( (tuple2!4875 (_1!2448 (_ BitVec 64)) (_2!2448 V!8357)) )
))
(declare-datatypes ((List!3755 0))(
  ( (Nil!3752) (Cons!3751 (h!4413 tuple2!4874) (t!8802 List!3755)) )
))
(declare-datatypes ((ListLongMap!3787 0))(
  ( (ListLongMap!3788 (toList!1909 List!3755)) )
))
(declare-fun contains!1839 (ListLongMap!3787 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1437 (array!12399 array!12397 (_ BitVec 32) (_ BitVec 32) V!8357 V!8357 (_ BitVec 32) Int) ListLongMap!3787)

(assert (=> b!253851 (= c!42817 (contains!1839 (getCurrentListMap!1437 (_keys!6840 thiss!1504) (_values!4669 thiss!1504) (mask!10926 thiss!1504) (extraKeys!4423 thiss!1504) (zeroValue!4527 thiss!1504) (minValue!4527 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4686 thiss!1504)) key!932))))

(declare-fun b!253852 () Bool)

(declare-fun e!164570 () Bool)

(assert (=> b!253852 (= e!164570 e!164572)))

(declare-fun res!124272 () Bool)

(assert (=> b!253852 (=> (not res!124272) (not e!164572))))

(assert (=> b!253852 (= res!124272 (or (= lt!127232 (MissingZero!1142 index!297)) (= lt!127232 (MissingVacant!1142 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12399 (_ BitVec 32)) SeekEntryResult!1142)

(assert (=> b!253852 (= lt!127232 (seekEntryOrOpen!0 key!932 (_keys!6840 thiss!1504) (mask!10926 thiss!1504)))))

(declare-fun b!253853 () Bool)

(declare-fun res!124266 () Bool)

(declare-fun e!164558 () Bool)

(assert (=> b!253853 (=> res!124266 e!164558)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!253853 (= res!124266 (not (validKeyInArray!0 key!932)))))

(declare-fun b!253854 () Bool)

(declare-fun e!164562 () Bool)

(declare-fun e!164559 () Bool)

(assert (=> b!253854 (= e!164562 (and e!164559 mapRes!11115))))

(declare-fun condMapEmpty!11115 () Bool)

(declare-fun mapDefault!11115 () ValueCell!2923)

