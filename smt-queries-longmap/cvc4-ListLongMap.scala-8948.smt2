; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108418 () Bool)

(assert start!108418)

(declare-fun b_free!27965 () Bool)

(declare-fun b_next!27965 () Bool)

(assert (=> start!108418 (= b_free!27965 (not b_next!27965))))

(declare-fun tp!99005 () Bool)

(declare-fun b_and!46025 () Bool)

(assert (=> start!108418 (= tp!99005 b_and!46025)))

(declare-fun b!1279584 () Bool)

(declare-fun e!731105 () Bool)

(declare-fun tp_is_empty!33605 () Bool)

(assert (=> b!1279584 (= e!731105 tp_is_empty!33605)))

(declare-fun mapIsEmpty!51959 () Bool)

(declare-fun mapRes!51959 () Bool)

(assert (=> mapIsEmpty!51959 mapRes!51959))

(declare-fun b!1279585 () Bool)

(declare-fun res!849998 () Bool)

(declare-fun e!731104 () Bool)

(assert (=> b!1279585 (=> (not res!849998) (not e!731104))))

(declare-datatypes ((array!84296 0))(
  ( (array!84297 (arr!40652 (Array (_ BitVec 32) (_ BitVec 64))) (size!41202 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84296)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84296 (_ BitVec 32)) Bool)

(assert (=> b!1279585 (= res!849998 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1279586 () Bool)

(declare-fun e!731103 () Bool)

(assert (=> b!1279586 (= e!731103 tp_is_empty!33605)))

(declare-fun b!1279587 () Bool)

(declare-fun res!849999 () Bool)

(assert (=> b!1279587 (=> (not res!849999) (not e!731104))))

(declare-datatypes ((V!49909 0))(
  ( (V!49910 (val!16877 Int)) )
))
(declare-datatypes ((ValueCell!15904 0))(
  ( (ValueCellFull!15904 (v!19477 V!49909)) (EmptyCell!15904) )
))
(declare-datatypes ((array!84298 0))(
  ( (array!84299 (arr!40653 (Array (_ BitVec 32) ValueCell!15904)) (size!41203 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84298)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1279587 (= res!849999 (and (= (size!41203 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41202 _keys!1741) (size!41203 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1279589 () Bool)

(assert (=> b!1279589 (= e!731104 false)))

(declare-fun minValue!1387 () V!49909)

(declare-fun zeroValue!1387 () V!49909)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun lt!576029 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21594 0))(
  ( (tuple2!21595 (_1!10808 (_ BitVec 64)) (_2!10808 V!49909)) )
))
(declare-datatypes ((List!28794 0))(
  ( (Nil!28791) (Cons!28790 (h!29999 tuple2!21594) (t!42334 List!28794)) )
))
(declare-datatypes ((ListLongMap!19251 0))(
  ( (ListLongMap!19252 (toList!9641 List!28794)) )
))
(declare-fun contains!7756 (ListLongMap!19251 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4725 (array!84296 array!84298 (_ BitVec 32) (_ BitVec 32) V!49909 V!49909 (_ BitVec 32) Int) ListLongMap!19251)

(assert (=> b!1279589 (= lt!576029 (contains!7756 (getCurrentListMap!4725 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1279590 () Bool)

(declare-fun e!731102 () Bool)

(assert (=> b!1279590 (= e!731102 (and e!731103 mapRes!51959))))

(declare-fun condMapEmpty!51959 () Bool)

(declare-fun mapDefault!51959 () ValueCell!15904)

