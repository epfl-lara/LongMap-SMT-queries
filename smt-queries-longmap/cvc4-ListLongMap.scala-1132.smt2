; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23292 () Bool)

(assert start!23292)

(declare-fun b!244852 () Bool)

(declare-fun b_free!6545 () Bool)

(declare-fun b_next!6545 () Bool)

(assert (=> b!244852 (= b_free!6545 (not b_next!6545))))

(declare-fun tp!22863 () Bool)

(declare-fun b_and!13531 () Bool)

(assert (=> b!244852 (= tp!22863 b_and!13531)))

(declare-fun b!244838 () Bool)

(declare-datatypes ((Unit!7561 0))(
  ( (Unit!7562) )
))
(declare-fun e!158863 () Unit!7561)

(declare-fun Unit!7563 () Unit!7561)

(assert (=> b!244838 (= e!158863 Unit!7563)))

(declare-fun c!40862 () Bool)

(declare-datatypes ((SeekEntryResult!1083 0))(
  ( (MissingZero!1083 (index!6502 (_ BitVec 32))) (Found!1083 (index!6503 (_ BitVec 32))) (Intermediate!1083 (undefined!1895 Bool) (index!6504 (_ BitVec 32)) (x!24387 (_ BitVec 32))) (Undefined!1083) (MissingVacant!1083 (index!6505 (_ BitVec 32))) )
))
(declare-fun lt!122642 () SeekEntryResult!1083)

(declare-datatypes ((V!8189 0))(
  ( (V!8190 (val!3248 Int)) )
))
(declare-datatypes ((ValueCell!2860 0))(
  ( (ValueCellFull!2860 (v!5299 V!8189)) (EmptyCell!2860) )
))
(declare-datatypes ((array!12109 0))(
  ( (array!12110 (arr!5748 (Array (_ BitVec 32) ValueCell!2860)) (size!6090 (_ BitVec 32))) )
))
(declare-datatypes ((array!12111 0))(
  ( (array!12112 (arr!5749 (Array (_ BitVec 32) (_ BitVec 64))) (size!6091 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3620 0))(
  ( (LongMapFixedSize!3621 (defaultEntry!4531 Int) (mask!10634 (_ BitVec 32)) (extraKeys!4268 (_ BitVec 32)) (zeroValue!4372 V!8189) (minValue!4372 V!8189) (_size!1859 (_ BitVec 32)) (_keys!6644 array!12111) (_values!4514 array!12109) (_vacant!1859 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3620)

(declare-fun call!22839 () Bool)

(declare-fun bm!22835 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22835 (= call!22839 (inRange!0 (ite c!40862 (index!6502 lt!122642) (index!6505 lt!122642)) (mask!10634 thiss!1504)))))

(declare-fun b!244839 () Bool)

(declare-fun e!158862 () Bool)

(declare-fun lt!122646 () Bool)

(assert (=> b!244839 (= e!158862 lt!122646)))

(declare-fun b!244840 () Bool)

(declare-fun res!120128 () Bool)

(assert (=> b!244840 (=> (not res!120128) (not e!158862))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!244840 (= res!120128 (validKeyInArray!0 key!932))))

(declare-fun b!244841 () Bool)

(declare-fun e!158851 () Bool)

(declare-fun e!158846 () Bool)

(declare-fun mapRes!10867 () Bool)

(assert (=> b!244841 (= e!158851 (and e!158846 mapRes!10867))))

(declare-fun condMapEmpty!10867 () Bool)

(declare-fun mapDefault!10867 () ValueCell!2860)

