; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89372 () Bool)

(assert start!89372)

(declare-fun b!1024496 () Bool)

(declare-fun b_free!20371 () Bool)

(declare-fun b_next!20371 () Bool)

(assert (=> b!1024496 (= b_free!20371 (not b_next!20371))))

(declare-fun tp!72159 () Bool)

(declare-fun b_and!32617 () Bool)

(assert (=> b!1024496 (= tp!72159 b_and!32617)))

(declare-fun res!685932 () Bool)

(declare-fun e!577505 () Bool)

(assert (=> start!89372 (=> (not res!685932) (not e!577505))))

(declare-datatypes ((V!36995 0))(
  ( (V!36996 (val!12096 Int)) )
))
(declare-datatypes ((ValueCell!11342 0))(
  ( (ValueCellFull!11342 (v!14665 V!36995)) (EmptyCell!11342) )
))
(declare-datatypes ((array!64232 0))(
  ( (array!64233 (arr!30925 (Array (_ BitVec 32) (_ BitVec 64))) (size!31438 (_ BitVec 32))) )
))
(declare-datatypes ((array!64234 0))(
  ( (array!64235 (arr!30926 (Array (_ BitVec 32) ValueCell!11342)) (size!31439 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5278 0))(
  ( (LongMapFixedSize!5279 (defaultEntry!5991 Int) (mask!29643 (_ BitVec 32)) (extraKeys!5723 (_ BitVec 32)) (zeroValue!5827 V!36995) (minValue!5827 V!36995) (_size!2694 (_ BitVec 32)) (_keys!11138 array!64232) (_values!6014 array!64234) (_vacant!2694 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5278)

(declare-fun valid!2009 (LongMapFixedSize!5278) Bool)

(assert (=> start!89372 (= res!685932 (valid!2009 thiss!1427))))

(assert (=> start!89372 e!577505))

(declare-fun e!577508 () Bool)

(assert (=> start!89372 e!577508))

(assert (=> start!89372 true))

(declare-fun b!1024495 () Bool)

(declare-fun res!685937 () Bool)

(assert (=> b!1024495 (=> (not res!685937) (not e!577505))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1024495 (= res!685937 (not (= key!909 (bvneg key!909))))))

(declare-fun mapIsEmpty!37565 () Bool)

(declare-fun mapRes!37565 () Bool)

(assert (=> mapIsEmpty!37565 mapRes!37565))

(declare-fun e!577506 () Bool)

(declare-fun tp_is_empty!24091 () Bool)

(declare-fun array_inv!23957 (array!64232) Bool)

(declare-fun array_inv!23958 (array!64234) Bool)

(assert (=> b!1024496 (= e!577508 (and tp!72159 tp_is_empty!24091 (array_inv!23957 (_keys!11138 thiss!1427)) (array_inv!23958 (_values!6014 thiss!1427)) e!577506))))

(declare-fun b!1024497 () Bool)

(declare-fun e!577504 () Bool)

(assert (=> b!1024497 (= e!577505 e!577504)))

(declare-fun res!685936 () Bool)

(assert (=> b!1024497 (=> (not res!685936) (not e!577504))))

(declare-datatypes ((SeekEntryResult!9596 0))(
  ( (MissingZero!9596 (index!40755 (_ BitVec 32))) (Found!9596 (index!40756 (_ BitVec 32))) (Intermediate!9596 (undefined!10408 Bool) (index!40757 (_ BitVec 32)) (x!91090 (_ BitVec 32))) (Undefined!9596) (MissingVacant!9596 (index!40758 (_ BitVec 32))) )
))
(declare-fun lt!450633 () SeekEntryResult!9596)

(assert (=> b!1024497 (= res!685936 (is-Found!9596 lt!450633))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64232 (_ BitVec 32)) SeekEntryResult!9596)

(assert (=> b!1024497 (= lt!450633 (seekEntry!0 key!909 (_keys!11138 thiss!1427) (mask!29643 thiss!1427)))))

(declare-fun b!1024498 () Bool)

(declare-fun res!685934 () Bool)

(declare-fun e!577509 () Bool)

(assert (=> b!1024498 (=> res!685934 e!577509)))

(declare-datatypes ((List!21731 0))(
  ( (Nil!21728) (Cons!21727 (h!22925 (_ BitVec 64)) (t!30793 List!21731)) )
))
(declare-fun contains!5947 (List!21731 (_ BitVec 64)) Bool)

(assert (=> b!1024498 (= res!685934 (contains!5947 Nil!21728 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1024499 () Bool)

(declare-fun e!577507 () Bool)

(assert (=> b!1024499 (= e!577506 (and e!577507 mapRes!37565))))

(declare-fun condMapEmpty!37565 () Bool)

(declare-fun mapDefault!37565 () ValueCell!11342)

