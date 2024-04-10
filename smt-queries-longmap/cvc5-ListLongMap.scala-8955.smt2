; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108456 () Bool)

(assert start!108456)

(declare-fun b_free!28003 () Bool)

(declare-fun b_next!28003 () Bool)

(assert (=> start!108456 (= b_free!28003 (not b_next!28003))))

(declare-fun tp!99118 () Bool)

(declare-fun b_and!46063 () Bool)

(assert (=> start!108456 (= tp!99118 b_and!46063)))

(declare-fun b!1280049 () Bool)

(declare-fun res!850291 () Bool)

(declare-fun e!731389 () Bool)

(assert (=> b!1280049 (=> (not res!850291) (not e!731389))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!49961 0))(
  ( (V!49962 (val!16896 Int)) )
))
(declare-datatypes ((ValueCell!15923 0))(
  ( (ValueCellFull!15923 (v!19496 V!49961)) (EmptyCell!15923) )
))
(declare-datatypes ((array!84366 0))(
  ( (array!84367 (arr!40687 (Array (_ BitVec 32) ValueCell!15923)) (size!41237 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84366)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84368 0))(
  ( (array!84369 (arr!40688 (Array (_ BitVec 32) (_ BitVec 64))) (size!41238 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84368)

(assert (=> b!1280049 (= res!850291 (and (= (size!41237 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41238 _keys!1741) (size!41237 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1280050 () Bool)

(declare-fun res!850295 () Bool)

(assert (=> b!1280050 (=> (not res!850295) (not e!731389))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84368 (_ BitVec 32)) Bool)

(assert (=> b!1280050 (= res!850295 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1280051 () Bool)

(assert (=> b!1280051 (= e!731389 false)))

(declare-fun minValue!1387 () V!49961)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun zeroValue!1387 () V!49961)

(declare-fun lt!576077 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21620 0))(
  ( (tuple2!21621 (_1!10821 (_ BitVec 64)) (_2!10821 V!49961)) )
))
(declare-datatypes ((List!28819 0))(
  ( (Nil!28816) (Cons!28815 (h!30024 tuple2!21620) (t!42359 List!28819)) )
))
(declare-datatypes ((ListLongMap!19277 0))(
  ( (ListLongMap!19278 (toList!9654 List!28819)) )
))
(declare-fun contains!7769 (ListLongMap!19277 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4738 (array!84368 array!84366 (_ BitVec 32) (_ BitVec 32) V!49961 V!49961 (_ BitVec 32) Int) ListLongMap!19277)

(assert (=> b!1280051 (= lt!576077 (contains!7769 (getCurrentListMap!4738 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun mapIsEmpty!52016 () Bool)

(declare-fun mapRes!52016 () Bool)

(assert (=> mapIsEmpty!52016 mapRes!52016))

(declare-fun b!1280052 () Bool)

(declare-fun res!850293 () Bool)

(assert (=> b!1280052 (=> (not res!850293) (not e!731389))))

(declare-datatypes ((List!28820 0))(
  ( (Nil!28817) (Cons!28816 (h!30025 (_ BitVec 64)) (t!42360 List!28820)) )
))
(declare-fun arrayNoDuplicates!0 (array!84368 (_ BitVec 32) List!28820) Bool)

(assert (=> b!1280052 (= res!850293 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28817))))

(declare-fun mapNonEmpty!52016 () Bool)

(declare-fun tp!99119 () Bool)

(declare-fun e!731388 () Bool)

(assert (=> mapNonEmpty!52016 (= mapRes!52016 (and tp!99119 e!731388))))

(declare-fun mapValue!52016 () ValueCell!15923)

(declare-fun mapKey!52016 () (_ BitVec 32))

(declare-fun mapRest!52016 () (Array (_ BitVec 32) ValueCell!15923))

(assert (=> mapNonEmpty!52016 (= (arr!40687 _values!1445) (store mapRest!52016 mapKey!52016 mapValue!52016))))

(declare-fun b!1280053 () Bool)

(declare-fun e!731386 () Bool)

(declare-fun e!731387 () Bool)

(assert (=> b!1280053 (= e!731386 (and e!731387 mapRes!52016))))

(declare-fun condMapEmpty!52016 () Bool)

(declare-fun mapDefault!52016 () ValueCell!15923)

