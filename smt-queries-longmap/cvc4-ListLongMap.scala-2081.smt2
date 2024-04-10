; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35658 () Bool)

(assert start!35658)

(declare-fun b_free!7913 () Bool)

(declare-fun b_next!7913 () Bool)

(assert (=> start!35658 (= b_free!7913 (not b_next!7913))))

(declare-fun tp!27723 () Bool)

(declare-fun b_and!15155 () Bool)

(assert (=> start!35658 (= tp!27723 b_and!15155)))

(declare-fun b!358115 () Bool)

(declare-fun res!199021 () Bool)

(declare-fun e!219202 () Bool)

(assert (=> b!358115 (=> (not res!199021) (not e!219202))))

(declare-datatypes ((array!19789 0))(
  ( (array!19790 (arr!9388 (Array (_ BitVec 32) (_ BitVec 64))) (size!9740 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19789)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k!1077 () (_ BitVec 64))

(assert (=> b!358115 (= res!199021 (not (= (select (arr!9388 _keys!1456) from!1805) k!1077)))))

(declare-fun mapNonEmpty!13674 () Bool)

(declare-fun mapRes!13674 () Bool)

(declare-fun tp!27722 () Bool)

(declare-fun e!219199 () Bool)

(assert (=> mapNonEmpty!13674 (= mapRes!13674 (and tp!27722 e!219199))))

(declare-datatypes ((V!11791 0))(
  ( (V!11792 (val!4100 Int)) )
))
(declare-datatypes ((ValueCell!3712 0))(
  ( (ValueCellFull!3712 (v!6294 V!11791)) (EmptyCell!3712) )
))
(declare-fun mapValue!13674 () ValueCell!3712)

(declare-fun mapRest!13674 () (Array (_ BitVec 32) ValueCell!3712))

(declare-fun mapKey!13674 () (_ BitVec 32))

(declare-datatypes ((array!19791 0))(
  ( (array!19792 (arr!9389 (Array (_ BitVec 32) ValueCell!3712)) (size!9741 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19791)

(assert (=> mapNonEmpty!13674 (= (arr!9389 _values!1208) (store mapRest!13674 mapKey!13674 mapValue!13674))))

(declare-fun b!358116 () Bool)

(declare-fun res!199023 () Bool)

(assert (=> b!358116 (=> (not res!199023) (not e!219202))))

(declare-datatypes ((List!5419 0))(
  ( (Nil!5416) (Cons!5415 (h!6271 (_ BitVec 64)) (t!10569 List!5419)) )
))
(declare-fun arrayNoDuplicates!0 (array!19789 (_ BitVec 32) List!5419) Bool)

(assert (=> b!358116 (= res!199023 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5416))))

(declare-fun b!358117 () Bool)

(declare-fun e!219200 () Bool)

(assert (=> b!358117 (= e!219200 true)))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun defaultEntry!1216 () Int)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11791)

(declare-fun minValue!1150 () V!11791)

(declare-datatypes ((tuple2!5724 0))(
  ( (tuple2!5725 (_1!2873 (_ BitVec 64)) (_2!2873 V!11791)) )
))
(declare-datatypes ((List!5420 0))(
  ( (Nil!5417) (Cons!5416 (h!6272 tuple2!5724) (t!10570 List!5420)) )
))
(declare-datatypes ((ListLongMap!4637 0))(
  ( (ListLongMap!4638 (toList!2334 List!5420)) )
))
(declare-fun contains!2414 (ListLongMap!4637 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1855 (array!19789 array!19791 (_ BitVec 32) (_ BitVec 32) V!11791 V!11791 (_ BitVec 32) Int) ListLongMap!4637)

(assert (=> b!358117 (contains!2414 (getCurrentListMap!1855 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) k!1077)))

(declare-datatypes ((Unit!11044 0))(
  ( (Unit!11045) )
))
(declare-fun lt!166154 () Unit!11044)

(declare-fun lemmaArrayContainsKeyThenInListMap!350 (array!19789 array!19791 (_ BitVec 32) (_ BitVec 32) V!11791 V!11791 (_ BitVec 64) (_ BitVec 32) Int) Unit!11044)

(assert (=> b!358117 (= lt!166154 (lemmaArrayContainsKeyThenInListMap!350 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k!1077 (bvadd #b00000000000000000000000000000001 from!1805) defaultEntry!1216))))

(declare-fun b!358118 () Bool)

(declare-fun e!219203 () Bool)

(declare-fun e!219201 () Bool)

(assert (=> b!358118 (= e!219203 (and e!219201 mapRes!13674))))

(declare-fun condMapEmpty!13674 () Bool)

(declare-fun mapDefault!13674 () ValueCell!3712)

