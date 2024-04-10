; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90812 () Bool)

(assert start!90812)

(declare-fun b!1038114 () Bool)

(declare-fun b_free!20929 () Bool)

(declare-fun b_next!20929 () Bool)

(assert (=> b!1038114 (= b_free!20929 (not b_next!20929))))

(declare-fun tp!73944 () Bool)

(declare-fun b_and!33461 () Bool)

(assert (=> b!1038114 (= tp!73944 b_and!33461)))

(declare-fun b!1038109 () Bool)

(declare-fun e!587347 () Bool)

(declare-datatypes ((SeekEntryResult!9766 0))(
  ( (MissingZero!9766 (index!41435 (_ BitVec 32))) (Found!9766 (index!41436 (_ BitVec 32))) (Intermediate!9766 (undefined!10578 Bool) (index!41437 (_ BitVec 32)) (x!92629 (_ BitVec 32))) (Undefined!9766) (MissingVacant!9766 (index!41438 (_ BitVec 32))) )
))
(declare-fun lt!457658 () SeekEntryResult!9766)

(declare-datatypes ((V!37739 0))(
  ( (V!37740 (val!12375 Int)) )
))
(declare-datatypes ((ValueCell!11621 0))(
  ( (ValueCellFull!11621 (v!14960 V!37739)) (EmptyCell!11621) )
))
(declare-datatypes ((array!65410 0))(
  ( (array!65411 (arr!31483 (Array (_ BitVec 32) (_ BitVec 64))) (size!32013 (_ BitVec 32))) )
))
(declare-datatypes ((array!65412 0))(
  ( (array!65413 (arr!31484 (Array (_ BitVec 32) ValueCell!11621)) (size!32014 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5836 0))(
  ( (LongMapFixedSize!5837 (defaultEntry!6300 Int) (mask!30233 (_ BitVec 32)) (extraKeys!6028 (_ BitVec 32)) (zeroValue!6134 V!37739) (minValue!6134 V!37739) (_size!2973 (_ BitVec 32)) (_keys!11500 array!65410) (_values!6323 array!65412) (_vacant!2973 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5836)

(assert (=> b!1038109 (= e!587347 (and (bvsge (index!41436 lt!457658) #b00000000000000000000000000000000) (bvslt (index!41436 lt!457658) (size!32013 (_keys!11500 thiss!1427)))))))

(declare-fun b!1038110 () Bool)

(declare-fun res!692545 () Bool)

(assert (=> b!1038110 (=> res!692545 e!587347)))

(declare-datatypes ((List!21932 0))(
  ( (Nil!21929) (Cons!21928 (h!23131 (_ BitVec 64)) (t!31146 List!21932)) )
))
(declare-fun contains!6033 (List!21932 (_ BitVec 64)) Bool)

(assert (=> b!1038110 (= res!692545 (contains!6033 Nil!21929 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!692539 () Bool)

(declare-fun e!587341 () Bool)

(assert (=> start!90812 (=> (not res!692539) (not e!587341))))

(declare-fun valid!2198 (LongMapFixedSize!5836) Bool)

(assert (=> start!90812 (= res!692539 (valid!2198 thiss!1427))))

(assert (=> start!90812 e!587341))

(declare-fun e!587342 () Bool)

(assert (=> start!90812 e!587342))

(assert (=> start!90812 true))

(declare-fun b!1038111 () Bool)

(declare-fun res!692541 () Bool)

(assert (=> b!1038111 (=> (not res!692541) (not e!587341))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1038111 (= res!692541 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1038112 () Bool)

(declare-fun res!692544 () Bool)

(assert (=> b!1038112 (=> res!692544 e!587347)))

(declare-fun arrayNoDuplicates!0 (array!65410 (_ BitVec 32) List!21932) Bool)

(assert (=> b!1038112 (= res!692544 (not (arrayNoDuplicates!0 (_keys!11500 thiss!1427) #b00000000000000000000000000000000 Nil!21929)))))

(declare-fun b!1038113 () Bool)

(declare-fun e!587344 () Bool)

(declare-fun e!587343 () Bool)

(declare-fun mapRes!38514 () Bool)

(assert (=> b!1038113 (= e!587344 (and e!587343 mapRes!38514))))

(declare-fun condMapEmpty!38514 () Bool)

(declare-fun mapDefault!38514 () ValueCell!11621)

