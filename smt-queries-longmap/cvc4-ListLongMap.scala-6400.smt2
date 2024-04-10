; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82200 () Bool)

(assert start!82200)

(declare-fun b_free!18473 () Bool)

(declare-fun b_next!18473 () Bool)

(assert (=> start!82200 (= b_free!18473 (not b_next!18473))))

(declare-fun tp!64379 () Bool)

(declare-fun b_and!29961 () Bool)

(assert (=> start!82200 (= tp!64379 b_and!29961)))

(declare-fun mapNonEmpty!33748 () Bool)

(declare-fun mapRes!33748 () Bool)

(declare-fun tp!64380 () Bool)

(declare-fun e!540116 () Bool)

(assert (=> mapNonEmpty!33748 (= mapRes!33748 (and tp!64380 e!540116))))

(declare-datatypes ((V!33221 0))(
  ( (V!33222 (val!10640 Int)) )
))
(declare-datatypes ((ValueCell!10108 0))(
  ( (ValueCellFull!10108 (v!13197 V!33221)) (EmptyCell!10108) )
))
(declare-fun mapValue!33748 () ValueCell!10108)

(declare-datatypes ((array!58461 0))(
  ( (array!58462 (arr!28104 (Array (_ BitVec 32) ValueCell!10108)) (size!28583 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58461)

(declare-fun mapRest!33748 () (Array (_ BitVec 32) ValueCell!10108))

(declare-fun mapKey!33748 () (_ BitVec 32))

(assert (=> mapNonEmpty!33748 (= (arr!28104 _values!1386) (store mapRest!33748 mapKey!33748 mapValue!33748))))

(declare-fun b!958064 () Bool)

(declare-fun tp_is_empty!21179 () Bool)

(assert (=> b!958064 (= e!540116 tp_is_empty!21179)))

(declare-fun b!958065 () Bool)

(declare-fun res!641298 () Bool)

(declare-fun e!540120 () Bool)

(assert (=> b!958065 (=> (not res!641298) (not e!540120))))

(declare-datatypes ((array!58463 0))(
  ( (array!58464 (arr!28105 (Array (_ BitVec 32) (_ BitVec 64))) (size!28584 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58463)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!958065 (= res!641298 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28584 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28584 _keys!1668))))))

(declare-fun b!958066 () Bool)

(declare-fun res!641297 () Bool)

(assert (=> b!958066 (=> (not res!641297) (not e!540120))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!958066 (= res!641297 (and (= (size!28583 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28584 _keys!1668) (size!28583 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!958067 () Bool)

(declare-fun res!641300 () Bool)

(assert (=> b!958067 (=> (not res!641300) (not e!540120))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!958067 (= res!641300 (validKeyInArray!0 (select (arr!28105 _keys!1668) i!793)))))

(declare-fun b!958068 () Bool)

(assert (=> b!958068 (= e!540120 false)))

(declare-fun minValue!1328 () V!33221)

(declare-fun lt!430401 () Bool)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33221)

(declare-datatypes ((tuple2!13716 0))(
  ( (tuple2!13717 (_1!6869 (_ BitVec 64)) (_2!6869 V!33221)) )
))
(declare-datatypes ((List!19538 0))(
  ( (Nil!19535) (Cons!19534 (h!20696 tuple2!13716) (t!27901 List!19538)) )
))
(declare-datatypes ((ListLongMap!12413 0))(
  ( (ListLongMap!12414 (toList!6222 List!19538)) )
))
(declare-fun contains!5323 (ListLongMap!12413 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3455 (array!58463 array!58461 (_ BitVec 32) (_ BitVec 32) V!33221 V!33221 (_ BitVec 32) Int) ListLongMap!12413)

(assert (=> b!958068 (= lt!430401 (contains!5323 (getCurrentListMap!3455 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28105 _keys!1668) i!793)))))

(declare-fun mapIsEmpty!33748 () Bool)

(assert (=> mapIsEmpty!33748 mapRes!33748))

(declare-fun res!641295 () Bool)

(assert (=> start!82200 (=> (not res!641295) (not e!540120))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82200 (= res!641295 (validMask!0 mask!2088))))

(assert (=> start!82200 e!540120))

(assert (=> start!82200 true))

(assert (=> start!82200 tp_is_empty!21179))

(declare-fun array_inv!21801 (array!58463) Bool)

(assert (=> start!82200 (array_inv!21801 _keys!1668)))

(declare-fun e!540119 () Bool)

(declare-fun array_inv!21802 (array!58461) Bool)

(assert (=> start!82200 (and (array_inv!21802 _values!1386) e!540119)))

(assert (=> start!82200 tp!64379))

(declare-fun b!958069 () Bool)

(declare-fun e!540117 () Bool)

(assert (=> b!958069 (= e!540119 (and e!540117 mapRes!33748))))

(declare-fun condMapEmpty!33748 () Bool)

(declare-fun mapDefault!33748 () ValueCell!10108)

