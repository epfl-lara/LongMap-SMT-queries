; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108442 () Bool)

(assert start!108442)

(declare-fun b_free!27989 () Bool)

(declare-fun b_next!27989 () Bool)

(assert (=> start!108442 (= b_free!27989 (not b_next!27989))))

(declare-fun tp!99077 () Bool)

(declare-fun b_and!46049 () Bool)

(assert (=> start!108442 (= tp!99077 b_and!46049)))

(declare-fun b!1279882 () Bool)

(declare-fun res!850187 () Bool)

(declare-fun e!731281 () Bool)

(assert (=> b!1279882 (=> (not res!850187) (not e!731281))))

(declare-datatypes ((array!84340 0))(
  ( (array!84341 (arr!40674 (Array (_ BitVec 32) (_ BitVec 64))) (size!41224 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84340)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84340 (_ BitVec 32)) Bool)

(assert (=> b!1279882 (= res!850187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!51995 () Bool)

(declare-fun mapRes!51995 () Bool)

(declare-fun tp!99076 () Bool)

(declare-fun e!731283 () Bool)

(assert (=> mapNonEmpty!51995 (= mapRes!51995 (and tp!99076 e!731283))))

(declare-datatypes ((V!49941 0))(
  ( (V!49942 (val!16889 Int)) )
))
(declare-datatypes ((ValueCell!15916 0))(
  ( (ValueCellFull!15916 (v!19489 V!49941)) (EmptyCell!15916) )
))
(declare-fun mapValue!51995 () ValueCell!15916)

(declare-datatypes ((array!84342 0))(
  ( (array!84343 (arr!40675 (Array (_ BitVec 32) ValueCell!15916)) (size!41225 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84342)

(declare-fun mapKey!51995 () (_ BitVec 32))

(declare-fun mapRest!51995 () (Array (_ BitVec 32) ValueCell!15916))

(assert (=> mapNonEmpty!51995 (= (arr!40675 _values!1445) (store mapRest!51995 mapKey!51995 mapValue!51995))))

(declare-fun mapIsEmpty!51995 () Bool)

(assert (=> mapIsEmpty!51995 mapRes!51995))

(declare-fun b!1279883 () Bool)

(declare-fun e!731282 () Bool)

(declare-fun tp_is_empty!33629 () Bool)

(assert (=> b!1279883 (= e!731282 tp_is_empty!33629)))

(declare-fun b!1279884 () Bool)

(declare-fun res!850190 () Bool)

(assert (=> b!1279884 (=> (not res!850190) (not e!731281))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1279884 (= res!850190 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41224 _keys!1741))))))

(declare-fun b!1279885 () Bool)

(assert (=> b!1279885 (= e!731281 false)))

(declare-fun minValue!1387 () V!49941)

(declare-fun zeroValue!1387 () V!49941)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun lt!576056 () Bool)

(declare-datatypes ((tuple2!21610 0))(
  ( (tuple2!21611 (_1!10816 (_ BitVec 64)) (_2!10816 V!49941)) )
))
(declare-datatypes ((List!28809 0))(
  ( (Nil!28806) (Cons!28805 (h!30014 tuple2!21610) (t!42349 List!28809)) )
))
(declare-datatypes ((ListLongMap!19267 0))(
  ( (ListLongMap!19268 (toList!9649 List!28809)) )
))
(declare-fun contains!7764 (ListLongMap!19267 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4733 (array!84340 array!84342 (_ BitVec 32) (_ BitVec 32) V!49941 V!49941 (_ BitVec 32) Int) ListLongMap!19267)

(assert (=> b!1279885 (= lt!576056 (contains!7764 (getCurrentListMap!4733 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1279886 () Bool)

(declare-fun res!850189 () Bool)

(assert (=> b!1279886 (=> (not res!850189) (not e!731281))))

(declare-datatypes ((List!28810 0))(
  ( (Nil!28807) (Cons!28806 (h!30015 (_ BitVec 64)) (t!42350 List!28810)) )
))
(declare-fun arrayNoDuplicates!0 (array!84340 (_ BitVec 32) List!28810) Bool)

(assert (=> b!1279886 (= res!850189 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28807))))

(declare-fun b!1279887 () Bool)

(declare-fun e!731284 () Bool)

(assert (=> b!1279887 (= e!731284 (and e!731282 mapRes!51995))))

(declare-fun condMapEmpty!51995 () Bool)

(declare-fun mapDefault!51995 () ValueCell!15916)

