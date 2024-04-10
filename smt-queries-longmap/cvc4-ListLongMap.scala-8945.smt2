; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108400 () Bool)

(assert start!108400)

(declare-fun b_free!27947 () Bool)

(declare-fun b_next!27947 () Bool)

(assert (=> start!108400 (= b_free!27947 (not b_next!27947))))

(declare-fun tp!98950 () Bool)

(declare-fun b_and!46007 () Bool)

(assert (=> start!108400 (= tp!98950 b_and!46007)))

(declare-fun b!1279368 () Bool)

(declare-fun res!849864 () Bool)

(declare-fun e!730966 () Bool)

(assert (=> b!1279368 (=> (not res!849864) (not e!730966))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!49885 0))(
  ( (V!49886 (val!16868 Int)) )
))
(declare-datatypes ((ValueCell!15895 0))(
  ( (ValueCellFull!15895 (v!19468 V!49885)) (EmptyCell!15895) )
))
(declare-datatypes ((array!84260 0))(
  ( (array!84261 (arr!40634 (Array (_ BitVec 32) ValueCell!15895)) (size!41184 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84260)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84262 0))(
  ( (array!84263 (arr!40635 (Array (_ BitVec 32) (_ BitVec 64))) (size!41185 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84262)

(assert (=> b!1279368 (= res!849864 (and (= (size!41184 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41185 _keys!1741) (size!41184 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!51932 () Bool)

(declare-fun mapRes!51932 () Bool)

(declare-fun tp!98951 () Bool)

(declare-fun e!730968 () Bool)

(assert (=> mapNonEmpty!51932 (= mapRes!51932 (and tp!98951 e!730968))))

(declare-fun mapKey!51932 () (_ BitVec 32))

(declare-fun mapValue!51932 () ValueCell!15895)

(declare-fun mapRest!51932 () (Array (_ BitVec 32) ValueCell!15895))

(assert (=> mapNonEmpty!51932 (= (arr!40634 _values!1445) (store mapRest!51932 mapKey!51932 mapValue!51932))))

(declare-fun b!1279369 () Bool)

(assert (=> b!1279369 (= e!730966 false)))

(declare-fun minValue!1387 () V!49885)

(declare-fun zeroValue!1387 () V!49885)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!576002 () Bool)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21580 0))(
  ( (tuple2!21581 (_1!10801 (_ BitVec 64)) (_2!10801 V!49885)) )
))
(declare-datatypes ((List!28780 0))(
  ( (Nil!28777) (Cons!28776 (h!29985 tuple2!21580) (t!42320 List!28780)) )
))
(declare-datatypes ((ListLongMap!19237 0))(
  ( (ListLongMap!19238 (toList!9634 List!28780)) )
))
(declare-fun contains!7749 (ListLongMap!19237 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4718 (array!84262 array!84260 (_ BitVec 32) (_ BitVec 32) V!49885 V!49885 (_ BitVec 32) Int) ListLongMap!19237)

(assert (=> b!1279369 (= lt!576002 (contains!7749 (getCurrentListMap!4718 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1279370 () Bool)

(declare-fun res!849866 () Bool)

(assert (=> b!1279370 (=> (not res!849866) (not e!730966))))

(assert (=> b!1279370 (= res!849866 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41185 _keys!1741))))))

(declare-fun b!1279371 () Bool)

(declare-fun e!730969 () Bool)

(declare-fun e!730967 () Bool)

(assert (=> b!1279371 (= e!730969 (and e!730967 mapRes!51932))))

(declare-fun condMapEmpty!51932 () Bool)

(declare-fun mapDefault!51932 () ValueCell!15895)

