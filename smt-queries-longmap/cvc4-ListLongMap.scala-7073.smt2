; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89496 () Bool)

(assert start!89496)

(declare-fun b!1026375 () Bool)

(declare-fun b_free!20495 () Bool)

(declare-fun b_next!20495 () Bool)

(assert (=> b!1026375 (= b_free!20495 (not b_next!20495))))

(declare-fun tp!72531 () Bool)

(declare-fun b_and!32741 () Bool)

(assert (=> b!1026375 (= tp!72531 b_and!32741)))

(declare-fun b!1026371 () Bool)

(declare-fun e!578997 () Bool)

(declare-fun e!578993 () Bool)

(assert (=> b!1026371 (= e!578997 e!578993)))

(declare-fun res!687067 () Bool)

(assert (=> b!1026371 (=> (not res!687067) (not e!578993))))

(declare-datatypes ((SeekEntryResult!9646 0))(
  ( (MissingZero!9646 (index!40955 (_ BitVec 32))) (Found!9646 (index!40956 (_ BitVec 32))) (Intermediate!9646 (undefined!10458 Bool) (index!40957 (_ BitVec 32)) (x!91300 (_ BitVec 32))) (Undefined!9646) (MissingVacant!9646 (index!40958 (_ BitVec 32))) )
))
(declare-fun lt!451509 () SeekEntryResult!9646)

(assert (=> b!1026371 (= res!687067 (is-Found!9646 lt!451509))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37159 0))(
  ( (V!37160 (val!12158 Int)) )
))
(declare-datatypes ((ValueCell!11404 0))(
  ( (ValueCellFull!11404 (v!14727 V!37159)) (EmptyCell!11404) )
))
(declare-datatypes ((array!64480 0))(
  ( (array!64481 (arr!31049 (Array (_ BitVec 32) (_ BitVec 64))) (size!31562 (_ BitVec 32))) )
))
(declare-datatypes ((array!64482 0))(
  ( (array!64483 (arr!31050 (Array (_ BitVec 32) ValueCell!11404)) (size!31563 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5402 0))(
  ( (LongMapFixedSize!5403 (defaultEntry!6053 Int) (mask!29745 (_ BitVec 32)) (extraKeys!5785 (_ BitVec 32)) (zeroValue!5889 V!37159) (minValue!5889 V!37159) (_size!2756 (_ BitVec 32)) (_keys!11200 array!64480) (_values!6076 array!64482) (_vacant!2756 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5402)

(declare-fun seekEntry!0 ((_ BitVec 64) array!64480 (_ BitVec 32)) SeekEntryResult!9646)

(assert (=> b!1026371 (= lt!451509 (seekEntry!0 key!909 (_keys!11200 thiss!1427) (mask!29745 thiss!1427)))))

(declare-fun b!1026372 () Bool)

(declare-fun res!687064 () Bool)

(declare-fun e!578996 () Bool)

(assert (=> b!1026372 (=> res!687064 e!578996)))

(assert (=> b!1026372 (= res!687064 (or (not (= (size!31563 (_values!6076 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29745 thiss!1427)))) (not (= (size!31562 (_keys!11200 thiss!1427)) (size!31563 (_values!6076 thiss!1427)))) (bvslt (mask!29745 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5785 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5785 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1026373 () Bool)

(assert (=> b!1026373 (= e!578996 true)))

(declare-fun lt!451512 () Bool)

(declare-datatypes ((List!21779 0))(
  ( (Nil!21776) (Cons!21775 (h!22973 (_ BitVec 64)) (t!30841 List!21779)) )
))
(declare-fun arrayNoDuplicates!0 (array!64480 (_ BitVec 32) List!21779) Bool)

(assert (=> b!1026373 (= lt!451512 (arrayNoDuplicates!0 (_keys!11200 thiss!1427) #b00000000000000000000000000000000 Nil!21776))))

(declare-fun b!1026374 () Bool)

(declare-fun res!687065 () Bool)

(assert (=> b!1026374 (=> res!687065 e!578996)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64480 (_ BitVec 32)) Bool)

(assert (=> b!1026374 (= res!687065 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11200 thiss!1427) (mask!29745 thiss!1427))))))

(declare-fun mapIsEmpty!37751 () Bool)

(declare-fun mapRes!37751 () Bool)

(assert (=> mapIsEmpty!37751 mapRes!37751))

(declare-fun b!1026376 () Bool)

(declare-fun e!578995 () Bool)

(declare-fun e!578991 () Bool)

(assert (=> b!1026376 (= e!578995 (and e!578991 mapRes!37751))))

(declare-fun condMapEmpty!37751 () Bool)

(declare-fun mapDefault!37751 () ValueCell!11404)

