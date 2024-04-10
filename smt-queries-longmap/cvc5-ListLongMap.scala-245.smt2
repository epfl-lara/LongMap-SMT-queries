; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4152 () Bool)

(assert start!4152)

(declare-fun b_free!1057 () Bool)

(declare-fun b_next!1057 () Bool)

(assert (=> start!4152 (= b_free!1057 (not b_next!1057))))

(declare-fun tp!4591 () Bool)

(declare-fun b_and!1867 () Bool)

(assert (=> start!4152 (= tp!4591 b_and!1867)))

(declare-fun mapIsEmpty!1645 () Bool)

(declare-fun mapRes!1645 () Bool)

(assert (=> mapIsEmpty!1645 mapRes!1645))

(declare-fun b!31277 () Bool)

(declare-fun e!19993 () Bool)

(declare-fun tp_is_empty!1411 () Bool)

(assert (=> b!31277 (= e!19993 tp_is_empty!1411)))

(declare-fun b!31278 () Bool)

(declare-fun res!18941 () Bool)

(declare-fun e!19991 () Bool)

(assert (=> b!31278 (=> (not res!18941) (not e!19991))))

(declare-datatypes ((array!2045 0))(
  ( (array!2046 (arr!976 (Array (_ BitVec 32) (_ BitVec 64))) (size!1077 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2045)

(declare-datatypes ((List!792 0))(
  ( (Nil!789) (Cons!788 (h!1355 (_ BitVec 64)) (t!3485 List!792)) )
))
(declare-fun arrayNoDuplicates!0 (array!2045 (_ BitVec 32) List!792) Bool)

(assert (=> b!31278 (= res!18941 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!789))))

(declare-fun b!31279 () Bool)

(declare-fun res!18938 () Bool)

(assert (=> b!31279 (=> (not res!18938) (not e!19991))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!31279 (= res!18938 (validKeyInArray!0 k!1304))))

(declare-fun b!31280 () Bool)

(assert (=> b!31280 (= e!19991 false)))

(declare-datatypes ((V!1707 0))(
  ( (V!1708 (val!732 Int)) )
))
(declare-datatypes ((ValueCell!506 0))(
  ( (ValueCellFull!506 (v!1821 V!1707)) (EmptyCell!506) )
))
(declare-datatypes ((array!2047 0))(
  ( (array!2048 (arr!977 (Array (_ BitVec 32) ValueCell!506)) (size!1078 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2047)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun lt!11546 () Bool)

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1707)

(declare-fun minValue!1443 () V!1707)

(declare-datatypes ((tuple2!1198 0))(
  ( (tuple2!1199 (_1!610 (_ BitVec 64)) (_2!610 V!1707)) )
))
(declare-datatypes ((List!793 0))(
  ( (Nil!790) (Cons!789 (h!1356 tuple2!1198) (t!3486 List!793)) )
))
(declare-datatypes ((ListLongMap!775 0))(
  ( (ListLongMap!776 (toList!403 List!793)) )
))
(declare-fun contains!343 (ListLongMap!775 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!231 (array!2045 array!2047 (_ BitVec 32) (_ BitVec 32) V!1707 V!1707 (_ BitVec 32) Int) ListLongMap!775)

(assert (=> b!31280 (= lt!11546 (contains!343 (getCurrentListMap!231 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304))))

(declare-fun b!31281 () Bool)

(declare-fun res!18939 () Bool)

(assert (=> b!31281 (=> (not res!18939) (not e!19991))))

(assert (=> b!31281 (= res!18939 (and (= (size!1078 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1077 _keys!1833) (size!1078 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!31282 () Bool)

(declare-fun e!19994 () Bool)

(assert (=> b!31282 (= e!19994 (and e!19993 mapRes!1645))))

(declare-fun condMapEmpty!1645 () Bool)

(declare-fun mapDefault!1645 () ValueCell!506)

