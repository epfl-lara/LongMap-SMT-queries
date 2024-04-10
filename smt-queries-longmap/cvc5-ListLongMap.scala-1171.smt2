; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25128 () Bool)

(assert start!25128)

(declare-fun b!261792 () Bool)

(declare-fun b_free!6775 () Bool)

(declare-fun b_next!6775 () Bool)

(assert (=> b!261792 (= b_free!6775 (not b_next!6775))))

(declare-fun tp!23656 () Bool)

(declare-fun b_and!13909 () Bool)

(assert (=> b!261792 (= tp!23656 b_and!13909)))

(declare-fun b!261784 () Bool)

(declare-fun e!169644 () Bool)

(declare-fun tp_is_empty!6637 () Bool)

(assert (=> b!261784 (= e!169644 tp_is_empty!6637)))

(declare-fun b!261785 () Bool)

(declare-fun e!169642 () Bool)

(declare-fun e!169634 () Bool)

(assert (=> b!261785 (= e!169642 e!169634)))

(declare-fun res!127897 () Bool)

(assert (=> b!261785 (=> (not res!127897) (not e!169634))))

(declare-datatypes ((SeekEntryResult!1190 0))(
  ( (MissingZero!1190 (index!6930 (_ BitVec 32))) (Found!1190 (index!6931 (_ BitVec 32))) (Intermediate!1190 (undefined!2002 Bool) (index!6932 (_ BitVec 32)) (x!25188 (_ BitVec 32))) (Undefined!1190) (MissingVacant!1190 (index!6933 (_ BitVec 32))) )
))
(declare-fun lt!132226 () SeekEntryResult!1190)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!261785 (= res!127897 (or (= lt!132226 (MissingZero!1190 index!297)) (= lt!132226 (MissingVacant!1190 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!8497 0))(
  ( (V!8498 (val!3363 Int)) )
))
(declare-datatypes ((ValueCell!2975 0))(
  ( (ValueCellFull!2975 (v!5488 V!8497)) (EmptyCell!2975) )
))
(declare-datatypes ((array!12631 0))(
  ( (array!12632 (arr!5978 (Array (_ BitVec 32) ValueCell!2975)) (size!6329 (_ BitVec 32))) )
))
(declare-datatypes ((array!12633 0))(
  ( (array!12634 (arr!5979 (Array (_ BitVec 32) (_ BitVec 64))) (size!6330 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3850 0))(
  ( (LongMapFixedSize!3851 (defaultEntry!4823 Int) (mask!11173 (_ BitVec 32)) (extraKeys!4560 (_ BitVec 32)) (zeroValue!4664 V!8497) (minValue!4664 V!8497) (_size!1974 (_ BitVec 32)) (_keys!7011 array!12633) (_values!4806 array!12631) (_vacant!1974 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3850)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12633 (_ BitVec 32)) SeekEntryResult!1190)

(assert (=> b!261785 (= lt!132226 (seekEntryOrOpen!0 key!932 (_keys!7011 thiss!1504) (mask!11173 thiss!1504)))))

(declare-fun res!127891 () Bool)

(assert (=> start!25128 (=> (not res!127891) (not e!169642))))

(declare-fun valid!1501 (LongMapFixedSize!3850) Bool)

(assert (=> start!25128 (= res!127891 (valid!1501 thiss!1504))))

(assert (=> start!25128 e!169642))

(declare-fun e!169638 () Bool)

(assert (=> start!25128 e!169638))

(assert (=> start!25128 true))

(assert (=> start!25128 tp_is_empty!6637))

(declare-fun b!261786 () Bool)

(declare-datatypes ((Unit!8144 0))(
  ( (Unit!8145) )
))
(declare-fun e!169643 () Unit!8144)

(declare-fun Unit!8146 () Unit!8144)

(assert (=> b!261786 (= e!169643 Unit!8146)))

(declare-fun b!261787 () Bool)

(declare-fun e!169637 () Bool)

(declare-fun mapRes!11314 () Bool)

(assert (=> b!261787 (= e!169637 (and e!169644 mapRes!11314))))

(declare-fun condMapEmpty!11314 () Bool)

(declare-fun mapDefault!11314 () ValueCell!2975)

