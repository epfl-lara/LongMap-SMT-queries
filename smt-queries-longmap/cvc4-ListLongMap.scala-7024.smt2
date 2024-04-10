; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89160 () Bool)

(assert start!89160)

(declare-fun b!1022258 () Bool)

(declare-fun b_free!20201 () Bool)

(declare-fun b_next!20201 () Bool)

(assert (=> b!1022258 (= b_free!20201 (not b_next!20201))))

(declare-fun tp!71637 () Bool)

(declare-fun b_and!32399 () Bool)

(assert (=> b!1022258 (= tp!71637 b_and!32399)))

(declare-fun b!1022252 () Bool)

(declare-fun res!684832 () Bool)

(declare-fun e!575844 () Bool)

(assert (=> b!1022252 (=> (not res!684832) (not e!575844))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1022252 (= res!684832 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1022253 () Bool)

(declare-fun e!575843 () Bool)

(declare-fun e!575847 () Bool)

(declare-fun mapRes!37299 () Bool)

(assert (=> b!1022253 (= e!575843 (and e!575847 mapRes!37299))))

(declare-fun condMapEmpty!37299 () Bool)

(declare-datatypes ((V!36767 0))(
  ( (V!36768 (val!12011 Int)) )
))
(declare-datatypes ((ValueCell!11257 0))(
  ( (ValueCellFull!11257 (v!14580 V!36767)) (EmptyCell!11257) )
))
(declare-datatypes ((array!63886 0))(
  ( (array!63887 (arr!30755 (Array (_ BitVec 32) (_ BitVec 64))) (size!31266 (_ BitVec 32))) )
))
(declare-datatypes ((array!63888 0))(
  ( (array!63889 (arr!30756 (Array (_ BitVec 32) ValueCell!11257)) (size!31267 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5108 0))(
  ( (LongMapFixedSize!5109 (defaultEntry!5906 Int) (mask!29495 (_ BitVec 32)) (extraKeys!5638 (_ BitVec 32)) (zeroValue!5742 V!36767) (minValue!5742 V!36767) (_size!2609 (_ BitVec 32)) (_keys!11051 array!63886) (_values!5929 array!63888) (_vacant!2609 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5108)

(declare-fun mapDefault!37299 () ValueCell!11257)

