; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35474 () Bool)

(assert start!35474)

(declare-fun b_free!7861 () Bool)

(declare-fun b_next!7861 () Bool)

(assert (=> start!35474 (= b_free!7861 (not b_next!7861))))

(declare-fun tp!27369 () Bool)

(declare-fun b_and!15103 () Bool)

(assert (=> start!35474 (= tp!27369 b_and!15103)))

(declare-fun b!355496 () Bool)

(declare-fun res!197234 () Bool)

(declare-fun e!217751 () Bool)

(assert (=> b!355496 (=> (not res!197234) (not e!217751))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((array!19433 0))(
  ( (array!19434 (arr!9210 (Array (_ BitVec 32) (_ BitVec 64))) (size!9562 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19433)

(assert (=> b!355496 (= res!197234 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9562 _keys!1456))))))

(declare-fun b!355497 () Bool)

(declare-fun res!197235 () Bool)

(assert (=> b!355497 (=> (not res!197235) (not e!217751))))

(declare-fun k!1077 () (_ BitVec 64))

(assert (=> b!355497 (= res!197235 (= (select (arr!9210 _keys!1456) from!1805) k!1077))))

(declare-fun b!355498 () Bool)

(declare-fun res!197230 () Bool)

(assert (=> b!355498 (=> (not res!197230) (not e!217751))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19433 (_ BitVec 32)) Bool)

(assert (=> b!355498 (= res!197230 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!355499 () Bool)

(declare-fun res!197228 () Bool)

(assert (=> b!355499 (=> (not res!197228) (not e!217751))))

(declare-datatypes ((List!5337 0))(
  ( (Nil!5334) (Cons!5333 (h!6189 (_ BitVec 64)) (t!10487 List!5337)) )
))
(declare-fun arrayNoDuplicates!0 (array!19433 (_ BitVec 32) List!5337) Bool)

(assert (=> b!355499 (= res!197228 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5334))))

(declare-fun mapIsEmpty!13398 () Bool)

(declare-fun mapRes!13398 () Bool)

(assert (=> mapIsEmpty!13398 mapRes!13398))

(declare-fun b!355501 () Bool)

(declare-fun res!197231 () Bool)

(assert (=> b!355501 (=> (not res!197231) (not e!217751))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!355501 (= res!197231 (validKeyInArray!0 (select (arr!9210 _keys!1456) from!1805)))))

(declare-fun b!355502 () Bool)

(declare-fun res!197232 () Bool)

(assert (=> b!355502 (=> (not res!197232) (not e!217751))))

(assert (=> b!355502 (= res!197232 (validKeyInArray!0 k!1077))))

(declare-fun b!355503 () Bool)

(declare-fun res!197236 () Bool)

(assert (=> b!355503 (=> (not res!197236) (not e!217751))))

(declare-fun arrayContainsKey!0 (array!19433 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!355503 (= res!197236 (arrayContainsKey!0 _keys!1456 k!1077 from!1805))))

(declare-fun b!355504 () Bool)

(assert (=> b!355504 (= e!217751 (not (bvsle #b00000000000000000000000000000000 (size!9562 _keys!1456))))))

(declare-datatypes ((V!11547 0))(
  ( (V!11548 (val!4008 Int)) )
))
(declare-fun minValue!1150 () V!11547)

(declare-fun defaultEntry!1216 () Int)

(declare-datatypes ((ValueCell!3620 0))(
  ( (ValueCellFull!3620 (v!6202 V!11547)) (EmptyCell!3620) )
))
(declare-datatypes ((array!19435 0))(
  ( (array!19436 (arr!9211 (Array (_ BitVec 32) ValueCell!3620)) (size!9563 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19435)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11547)

(declare-datatypes ((tuple2!5694 0))(
  ( (tuple2!5695 (_1!2858 (_ BitVec 64)) (_2!2858 V!11547)) )
))
(declare-datatypes ((List!5338 0))(
  ( (Nil!5335) (Cons!5334 (h!6190 tuple2!5694) (t!10488 List!5338)) )
))
(declare-datatypes ((ListLongMap!4607 0))(
  ( (ListLongMap!4608 (toList!2319 List!5338)) )
))
(declare-fun contains!2399 (ListLongMap!4607 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1840 (array!19433 array!19435 (_ BitVec 32) (_ BitVec 32) V!11547 V!11547 (_ BitVec 32) Int) ListLongMap!4607)

(assert (=> b!355504 (contains!2399 (getCurrentListMap!1840 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) (select (arr!9210 _keys!1456) from!1805))))

(declare-datatypes ((Unit!10960 0))(
  ( (Unit!10961) )
))
(declare-fun lt!165806 () Unit!10960)

(declare-fun lemmaValidKeyInArrayIsInListMap!197 (array!19433 array!19435 (_ BitVec 32) (_ BitVec 32) V!11547 V!11547 (_ BitVec 32) Int) Unit!10960)

(assert (=> b!355504 (= lt!165806 (lemmaValidKeyInArrayIsInListMap!197 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 from!1805 defaultEntry!1216))))

(declare-fun b!355505 () Bool)

(declare-fun e!217748 () Bool)

(declare-fun e!217749 () Bool)

(assert (=> b!355505 (= e!217748 (and e!217749 mapRes!13398))))

(declare-fun condMapEmpty!13398 () Bool)

(declare-fun mapDefault!13398 () ValueCell!3620)

