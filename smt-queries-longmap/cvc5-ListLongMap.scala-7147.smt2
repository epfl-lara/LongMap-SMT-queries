; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90836 () Bool)

(assert start!90836)

(declare-fun b!1038312 () Bool)

(declare-fun b_free!20935 () Bool)

(declare-fun b_next!20935 () Bool)

(assert (=> b!1038312 (= b_free!20935 (not b_next!20935))))

(declare-fun tp!73965 () Bool)

(declare-fun b_and!33467 () Bool)

(assert (=> b!1038312 (= tp!73965 b_and!33467)))

(declare-fun b!1038309 () Bool)

(declare-fun res!692654 () Bool)

(declare-fun e!587475 () Bool)

(assert (=> b!1038309 (=> res!692654 e!587475)))

(declare-datatypes ((List!21934 0))(
  ( (Nil!21931) (Cons!21930 (h!23133 (_ BitVec 64)) (t!31148 List!21934)) )
))
(declare-fun contains!6035 (List!21934 (_ BitVec 64)) Bool)

(assert (=> b!1038309 (= res!692654 (contains!6035 Nil!21931 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1038310 () Bool)

(declare-datatypes ((SeekEntryResult!9768 0))(
  ( (MissingZero!9768 (index!41443 (_ BitVec 32))) (Found!9768 (index!41444 (_ BitVec 32))) (Intermediate!9768 (undefined!10580 Bool) (index!41445 (_ BitVec 32)) (x!92647 (_ BitVec 32))) (Undefined!9768) (MissingVacant!9768 (index!41446 (_ BitVec 32))) )
))
(declare-fun lt!457699 () SeekEntryResult!9768)

(declare-datatypes ((V!37747 0))(
  ( (V!37748 (val!12378 Int)) )
))
(declare-datatypes ((ValueCell!11624 0))(
  ( (ValueCellFull!11624 (v!14964 V!37747)) (EmptyCell!11624) )
))
(declare-datatypes ((array!65424 0))(
  ( (array!65425 (arr!31489 (Array (_ BitVec 32) (_ BitVec 64))) (size!32019 (_ BitVec 32))) )
))
(declare-datatypes ((array!65426 0))(
  ( (array!65427 (arr!31490 (Array (_ BitVec 32) ValueCell!11624)) (size!32020 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5842 0))(
  ( (LongMapFixedSize!5843 (defaultEntry!6303 Int) (mask!30239 (_ BitVec 32)) (extraKeys!6031 (_ BitVec 32)) (zeroValue!6137 V!37747) (minValue!6137 V!37747) (_size!2976 (_ BitVec 32)) (_keys!11504 array!65424) (_values!6326 array!65426) (_vacant!2976 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5842)

(assert (=> b!1038310 (= e!587475 true)))

(declare-fun b!1038311 () Bool)

(declare-fun res!692656 () Bool)

(declare-fun e!587470 () Bool)

(assert (=> b!1038311 (=> (not res!692656) (not e!587470))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1038311 (= res!692656 (not (= key!909 (bvneg key!909))))))

(declare-fun e!587472 () Bool)

(declare-fun e!587473 () Bool)

(declare-fun tp_is_empty!24655 () Bool)

(declare-fun array_inv!24347 (array!65424) Bool)

(declare-fun array_inv!24348 (array!65426) Bool)

(assert (=> b!1038312 (= e!587473 (and tp!73965 tp_is_empty!24655 (array_inv!24347 (_keys!11504 thiss!1427)) (array_inv!24348 (_values!6326 thiss!1427)) e!587472))))

(declare-fun res!692658 () Bool)

(assert (=> start!90836 (=> (not res!692658) (not e!587470))))

(declare-fun valid!2200 (LongMapFixedSize!5842) Bool)

(assert (=> start!90836 (= res!692658 (valid!2200 thiss!1427))))

(assert (=> start!90836 e!587470))

(assert (=> start!90836 e!587473))

(assert (=> start!90836 true))

(declare-fun b!1038313 () Bool)

(declare-fun e!587474 () Bool)

(assert (=> b!1038313 (= e!587474 tp_is_empty!24655)))

(declare-fun b!1038314 () Bool)

(declare-fun res!692660 () Bool)

(assert (=> b!1038314 (=> res!692660 e!587475)))

(declare-fun noDuplicate!1482 (List!21934) Bool)

(assert (=> b!1038314 (= res!692660 (not (noDuplicate!1482 Nil!21931)))))

(declare-fun b!1038315 () Bool)

(declare-fun res!692657 () Bool)

(assert (=> b!1038315 (=> res!692657 e!587475)))

(assert (=> b!1038315 (= res!692657 (contains!6035 Nil!21931 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!38526 () Bool)

(declare-fun mapRes!38526 () Bool)

(declare-fun tp!73966 () Bool)

(assert (=> mapNonEmpty!38526 (= mapRes!38526 (and tp!73966 e!587474))))

(declare-fun mapValue!38526 () ValueCell!11624)

(declare-fun mapKey!38526 () (_ BitVec 32))

(declare-fun mapRest!38526 () (Array (_ BitVec 32) ValueCell!11624))

(assert (=> mapNonEmpty!38526 (= (arr!31490 (_values!6326 thiss!1427)) (store mapRest!38526 mapKey!38526 mapValue!38526))))

(declare-fun b!1038316 () Bool)

(declare-fun res!692655 () Bool)

(assert (=> b!1038316 (=> res!692655 e!587475)))

(declare-fun arrayNoDuplicates!0 (array!65424 (_ BitVec 32) List!21934) Bool)

(assert (=> b!1038316 (= res!692655 (not (arrayNoDuplicates!0 (_keys!11504 thiss!1427) #b00000000000000000000000000000000 Nil!21931)))))

(declare-fun b!1038317 () Bool)

(declare-fun e!587476 () Bool)

(assert (=> b!1038317 (= e!587476 tp_is_empty!24655)))

(declare-fun mapIsEmpty!38526 () Bool)

(assert (=> mapIsEmpty!38526 mapRes!38526))

(declare-fun b!1038318 () Bool)

(assert (=> b!1038318 (= e!587472 (and e!587476 mapRes!38526))))

(declare-fun condMapEmpty!38526 () Bool)

(declare-fun mapDefault!38526 () ValueCell!11624)

