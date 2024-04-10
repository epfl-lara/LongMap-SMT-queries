; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35456 () Bool)

(assert start!35456)

(declare-fun b_free!7843 () Bool)

(declare-fun b_next!7843 () Bool)

(assert (=> start!35456 (= b_free!7843 (not b_next!7843))))

(declare-fun tp!27315 () Bool)

(declare-fun b_and!15085 () Bool)

(assert (=> start!35456 (= tp!27315 b_and!15085)))

(declare-fun b!355172 () Bool)

(declare-fun e!217616 () Bool)

(assert (=> b!355172 (= e!217616 (not true))))

(declare-datatypes ((V!11523 0))(
  ( (V!11524 (val!3999 Int)) )
))
(declare-fun minValue!1150 () V!11523)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun defaultEntry!1216 () Int)

(declare-datatypes ((array!19397 0))(
  ( (array!19398 (arr!9192 (Array (_ BitVec 32) (_ BitVec 64))) (size!9544 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19397)

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((ValueCell!3611 0))(
  ( (ValueCellFull!3611 (v!6193 V!11523)) (EmptyCell!3611) )
))
(declare-datatypes ((array!19399 0))(
  ( (array!19400 (arr!9193 (Array (_ BitVec 32) ValueCell!3611)) (size!9545 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19399)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11523)

(declare-datatypes ((tuple2!5682 0))(
  ( (tuple2!5683 (_1!2852 (_ BitVec 64)) (_2!2852 V!11523)) )
))
(declare-datatypes ((List!5326 0))(
  ( (Nil!5323) (Cons!5322 (h!6178 tuple2!5682) (t!10476 List!5326)) )
))
(declare-datatypes ((ListLongMap!4595 0))(
  ( (ListLongMap!4596 (toList!2313 List!5326)) )
))
(declare-fun contains!2393 (ListLongMap!4595 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1834 (array!19397 array!19399 (_ BitVec 32) (_ BitVec 32) V!11523 V!11523 (_ BitVec 32) Int) ListLongMap!4595)

(assert (=> b!355172 (contains!2393 (getCurrentListMap!1834 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) (select (arr!9192 _keys!1456) from!1805))))

(declare-datatypes ((Unit!10948 0))(
  ( (Unit!10949) )
))
(declare-fun lt!165779 () Unit!10948)

(declare-fun lemmaValidKeyInArrayIsInListMap!191 (array!19397 array!19399 (_ BitVec 32) (_ BitVec 32) V!11523 V!11523 (_ BitVec 32) Int) Unit!10948)

(assert (=> b!355172 (= lt!165779 (lemmaValidKeyInArrayIsInListMap!191 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 from!1805 defaultEntry!1216))))

(declare-fun b!355173 () Bool)

(declare-fun res!196985 () Bool)

(assert (=> b!355173 (=> (not res!196985) (not e!217616))))

(declare-fun k!1077 () (_ BitVec 64))

(assert (=> b!355173 (= res!196985 (= (select (arr!9192 _keys!1456) from!1805) k!1077))))

(declare-fun b!355174 () Bool)

(declare-fun res!196989 () Bool)

(assert (=> b!355174 (=> (not res!196989) (not e!217616))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!355174 (= res!196989 (validKeyInArray!0 (select (arr!9192 _keys!1456) from!1805)))))

(declare-fun b!355175 () Bool)

(declare-fun e!217614 () Bool)

(declare-fun e!217615 () Bool)

(declare-fun mapRes!13371 () Bool)

(assert (=> b!355175 (= e!217614 (and e!217615 mapRes!13371))))

(declare-fun condMapEmpty!13371 () Bool)

(declare-fun mapDefault!13371 () ValueCell!3611)

