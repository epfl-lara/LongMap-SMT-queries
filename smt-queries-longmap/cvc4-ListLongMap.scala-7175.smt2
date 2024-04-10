; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91700 () Bool)

(assert start!91700)

(declare-fun b!1043787 () Bool)

(declare-fun b_free!21107 () Bool)

(declare-fun b_next!21107 () Bool)

(assert (=> b!1043787 (= b_free!21107 (not b_next!21107))))

(declare-fun tp!74561 () Bool)

(declare-fun b_and!33655 () Bool)

(assert (=> b!1043787 (= tp!74561 b_and!33655)))

(declare-fun b!1043784 () Bool)

(declare-fun res!695322 () Bool)

(declare-fun e!591462 () Bool)

(assert (=> b!1043784 (=> (not res!695322) (not e!591462))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1043784 (= res!695322 (not (= key!909 (bvneg key!909))))))

(declare-fun res!695321 () Bool)

(assert (=> start!91700 (=> (not res!695321) (not e!591462))))

(declare-datatypes ((V!37975 0))(
  ( (V!37976 (val!12464 Int)) )
))
(declare-datatypes ((ValueCell!11710 0))(
  ( (ValueCellFull!11710 (v!15055 V!37975)) (EmptyCell!11710) )
))
(declare-datatypes ((array!65818 0))(
  ( (array!65819 (arr!31661 (Array (_ BitVec 32) (_ BitVec 64))) (size!32196 (_ BitVec 32))) )
))
(declare-datatypes ((array!65820 0))(
  ( (array!65821 (arr!31662 (Array (_ BitVec 32) ValueCell!11710)) (size!32197 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6014 0))(
  ( (LongMapFixedSize!6015 (defaultEntry!6391 Int) (mask!30487 (_ BitVec 32)) (extraKeys!6119 (_ BitVec 32)) (zeroValue!6225 V!37975) (minValue!6225 V!37975) (_size!3062 (_ BitVec 32)) (_keys!11651 array!65818) (_values!6414 array!65820) (_vacant!3062 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!6014)

(declare-fun valid!2256 (LongMapFixedSize!6014) Bool)

(assert (=> start!91700 (= res!695321 (valid!2256 thiss!1427))))

(assert (=> start!91700 e!591462))

(declare-fun e!591456 () Bool)

(assert (=> start!91700 e!591456))

(assert (=> start!91700 true))

(declare-fun b!1043785 () Bool)

(declare-fun e!591461 () Bool)

(declare-fun e!591457 () Bool)

(declare-fun mapRes!38864 () Bool)

(assert (=> b!1043785 (= e!591461 (and e!591457 mapRes!38864))))

(declare-fun condMapEmpty!38864 () Bool)

(declare-fun mapDefault!38864 () ValueCell!11710)

