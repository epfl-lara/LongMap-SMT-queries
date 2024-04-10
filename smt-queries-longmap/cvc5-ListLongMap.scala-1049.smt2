; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21976 () Bool)

(assert start!21976)

(declare-fun b!225300 () Bool)

(declare-fun b_free!6043 () Bool)

(declare-fun b_next!6043 () Bool)

(assert (=> b!225300 (= b_free!6043 (not b_next!6043))))

(declare-fun tp!21271 () Bool)

(declare-fun b_and!12941 () Bool)

(assert (=> b!225300 (= tp!21271 b_and!12941)))

(declare-fun b!225277 () Bool)

(declare-fun res!110871 () Bool)

(declare-fun e!146231 () Bool)

(assert (=> b!225277 (=> (not res!110871) (not e!146231))))

(declare-datatypes ((V!7521 0))(
  ( (V!7522 (val!2997 Int)) )
))
(declare-datatypes ((ValueCell!2609 0))(
  ( (ValueCellFull!2609 (v!5017 V!7521)) (EmptyCell!2609) )
))
(declare-datatypes ((array!11053 0))(
  ( (array!11054 (arr!5246 (Array (_ BitVec 32) ValueCell!2609)) (size!5579 (_ BitVec 32))) )
))
(declare-datatypes ((array!11055 0))(
  ( (array!11056 (arr!5247 (Array (_ BitVec 32) (_ BitVec 64))) (size!5580 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3118 0))(
  ( (LongMapFixedSize!3119 (defaultEntry!4218 Int) (mask!10060 (_ BitVec 32)) (extraKeys!3955 (_ BitVec 32)) (zeroValue!4059 V!7521) (minValue!4059 V!7521) (_size!1608 (_ BitVec 32)) (_keys!6272 array!11055) (_values!4201 array!11053) (_vacant!1608 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3118)

(declare-datatypes ((SeekEntryResult!867 0))(
  ( (MissingZero!867 (index!5638 (_ BitVec 32))) (Found!867 (index!5639 (_ BitVec 32))) (Intermediate!867 (undefined!1679 Bool) (index!5640 (_ BitVec 32)) (x!23175 (_ BitVec 32))) (Undefined!867) (MissingVacant!867 (index!5641 (_ BitVec 32))) )
))
(declare-fun lt!113476 () SeekEntryResult!867)

(assert (=> b!225277 (= res!110871 (= (select (arr!5247 (_keys!6272 thiss!1504)) (index!5638 lt!113476)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!225278 () Bool)

(declare-fun call!20964 () Bool)

(assert (=> b!225278 (= e!146231 (not call!20964))))

(declare-fun b!225279 () Bool)

(declare-fun e!146227 () Bool)

(declare-fun e!146220 () Bool)

(declare-fun mapRes!10027 () Bool)

(assert (=> b!225279 (= e!146227 (and e!146220 mapRes!10027))))

(declare-fun condMapEmpty!10027 () Bool)

(declare-fun mapDefault!10027 () ValueCell!2609)

