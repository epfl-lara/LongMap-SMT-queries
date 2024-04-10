; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35454 () Bool)

(assert start!35454)

(declare-fun b_free!7841 () Bool)

(declare-fun b_next!7841 () Bool)

(assert (=> start!35454 (= b_free!7841 (not b_next!7841))))

(declare-fun tp!27308 () Bool)

(declare-fun b_and!15083 () Bool)

(assert (=> start!35454 (= tp!27308 b_and!15083)))

(declare-fun b!355136 () Bool)

(declare-fun e!217599 () Bool)

(declare-fun tp_is_empty!7907 () Bool)

(assert (=> b!355136 (= e!217599 tp_is_empty!7907)))

(declare-fun b!355137 () Bool)

(declare-fun res!196958 () Bool)

(declare-fun e!217600 () Bool)

(assert (=> b!355137 (=> (not res!196958) (not e!217600))))

(declare-datatypes ((array!19393 0))(
  ( (array!19394 (arr!9190 (Array (_ BitVec 32) (_ BitVec 64))) (size!9542 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19393)

(declare-datatypes ((List!5324 0))(
  ( (Nil!5321) (Cons!5320 (h!6176 (_ BitVec 64)) (t!10474 List!5324)) )
))
(declare-fun arrayNoDuplicates!0 (array!19393 (_ BitVec 32) List!5324) Bool)

(assert (=> b!355137 (= res!196958 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5321))))

(declare-fun b!355138 () Bool)

(assert (=> b!355138 (= e!217600 (not true))))

(declare-datatypes ((V!11519 0))(
  ( (V!11520 (val!3998 Int)) )
))
(declare-fun minValue!1150 () V!11519)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun defaultEntry!1216 () Int)

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((ValueCell!3610 0))(
  ( (ValueCellFull!3610 (v!6192 V!11519)) (EmptyCell!3610) )
))
(declare-datatypes ((array!19395 0))(
  ( (array!19396 (arr!9191 (Array (_ BitVec 32) ValueCell!3610)) (size!9543 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19395)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11519)

(declare-datatypes ((tuple2!5680 0))(
  ( (tuple2!5681 (_1!2851 (_ BitVec 64)) (_2!2851 V!11519)) )
))
(declare-datatypes ((List!5325 0))(
  ( (Nil!5322) (Cons!5321 (h!6177 tuple2!5680) (t!10475 List!5325)) )
))
(declare-datatypes ((ListLongMap!4593 0))(
  ( (ListLongMap!4594 (toList!2312 List!5325)) )
))
(declare-fun contains!2392 (ListLongMap!4593 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1833 (array!19393 array!19395 (_ BitVec 32) (_ BitVec 32) V!11519 V!11519 (_ BitVec 32) Int) ListLongMap!4593)

(assert (=> b!355138 (contains!2392 (getCurrentListMap!1833 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) (select (arr!9190 _keys!1456) from!1805))))

(declare-datatypes ((Unit!10946 0))(
  ( (Unit!10947) )
))
(declare-fun lt!165776 () Unit!10946)

(declare-fun lemmaValidKeyInArrayIsInListMap!190 (array!19393 array!19395 (_ BitVec 32) (_ BitVec 32) V!11519 V!11519 (_ BitVec 32) Int) Unit!10946)

(assert (=> b!355138 (= lt!165776 (lemmaValidKeyInArrayIsInListMap!190 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 from!1805 defaultEntry!1216))))

(declare-fun b!355139 () Bool)

(declare-fun res!196965 () Bool)

(assert (=> b!355139 (=> (not res!196965) (not e!217600))))

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!19393 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!355139 (= res!196965 (arrayContainsKey!0 _keys!1456 k!1077 from!1805))))

(declare-fun b!355140 () Bool)

(declare-fun res!196964 () Bool)

(assert (=> b!355140 (=> (not res!196964) (not e!217600))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19393 (_ BitVec 32)) Bool)

(assert (=> b!355140 (= res!196964 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!355142 () Bool)

(declare-fun res!196960 () Bool)

(assert (=> b!355142 (=> (not res!196960) (not e!217600))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!355142 (= res!196960 (validKeyInArray!0 (select (arr!9190 _keys!1456) from!1805)))))

(declare-fun b!355143 () Bool)

(declare-fun res!196966 () Bool)

(assert (=> b!355143 (=> (not res!196966) (not e!217600))))

(assert (=> b!355143 (= res!196966 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9542 _keys!1456))))))

(declare-fun b!355144 () Bool)

(declare-fun res!196961 () Bool)

(assert (=> b!355144 (=> (not res!196961) (not e!217600))))

(assert (=> b!355144 (= res!196961 (validKeyInArray!0 k!1077))))

(declare-fun b!355145 () Bool)

(declare-fun e!217598 () Bool)

(declare-fun e!217601 () Bool)

(declare-fun mapRes!13368 () Bool)

(assert (=> b!355145 (= e!217598 (and e!217601 mapRes!13368))))

(declare-fun condMapEmpty!13368 () Bool)

(declare-fun mapDefault!13368 () ValueCell!3610)

