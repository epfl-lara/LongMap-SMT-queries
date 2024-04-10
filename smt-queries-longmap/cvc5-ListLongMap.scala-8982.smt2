; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108652 () Bool)

(assert start!108652)

(declare-fun b_free!28165 () Bool)

(declare-fun b_next!28165 () Bool)

(assert (=> start!108652 (= b_free!28165 (not b_next!28165))))

(declare-fun tp!99611 () Bool)

(declare-fun b_and!46231 () Bool)

(assert (=> start!108652 (= tp!99611 b_and!46231)))

(declare-fun b!1282517 () Bool)

(declare-fun e!732798 () Bool)

(assert (=> b!1282517 (= e!732798 false)))

(declare-datatypes ((V!50177 0))(
  ( (V!50178 (val!16977 Int)) )
))
(declare-fun minValue!1387 () V!50177)

(declare-fun zeroValue!1387 () V!50177)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!576544 () Bool)

(declare-datatypes ((ValueCell!16004 0))(
  ( (ValueCellFull!16004 (v!19579 V!50177)) (EmptyCell!16004) )
))
(declare-datatypes ((array!84680 0))(
  ( (array!84681 (arr!40842 (Array (_ BitVec 32) ValueCell!16004)) (size!41392 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84680)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84682 0))(
  ( (array!84683 (arr!40843 (Array (_ BitVec 32) (_ BitVec 64))) (size!41393 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84682)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21738 0))(
  ( (tuple2!21739 (_1!10880 (_ BitVec 64)) (_2!10880 V!50177)) )
))
(declare-datatypes ((List!28935 0))(
  ( (Nil!28932) (Cons!28931 (h!30140 tuple2!21738) (t!42479 List!28935)) )
))
(declare-datatypes ((ListLongMap!19395 0))(
  ( (ListLongMap!19396 (toList!9713 List!28935)) )
))
(declare-fun contains!7830 (ListLongMap!19395 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4797 (array!84682 array!84680 (_ BitVec 32) (_ BitVec 32) V!50177 V!50177 (_ BitVec 32) Int) ListLongMap!19395)

(assert (=> b!1282517 (= lt!576544 (contains!7830 (getCurrentListMap!4797 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun mapIsEmpty!52265 () Bool)

(declare-fun mapRes!52265 () Bool)

(assert (=> mapIsEmpty!52265 mapRes!52265))

(declare-fun b!1282518 () Bool)

(declare-fun res!851885 () Bool)

(assert (=> b!1282518 (=> (not res!851885) (not e!732798))))

(declare-datatypes ((List!28936 0))(
  ( (Nil!28933) (Cons!28932 (h!30141 (_ BitVec 64)) (t!42480 List!28936)) )
))
(declare-fun arrayNoDuplicates!0 (array!84682 (_ BitVec 32) List!28936) Bool)

(assert (=> b!1282518 (= res!851885 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28933))))

(declare-fun mapNonEmpty!52265 () Bool)

(declare-fun tp!99610 () Bool)

(declare-fun e!732800 () Bool)

(assert (=> mapNonEmpty!52265 (= mapRes!52265 (and tp!99610 e!732800))))

(declare-fun mapRest!52265 () (Array (_ BitVec 32) ValueCell!16004))

(declare-fun mapValue!52265 () ValueCell!16004)

(declare-fun mapKey!52265 () (_ BitVec 32))

(assert (=> mapNonEmpty!52265 (= (arr!40842 _values!1445) (store mapRest!52265 mapKey!52265 mapValue!52265))))

(declare-fun b!1282519 () Bool)

(declare-fun e!732796 () Bool)

(declare-fun tp_is_empty!33805 () Bool)

(assert (=> b!1282519 (= e!732796 tp_is_empty!33805)))

(declare-fun b!1282520 () Bool)

(declare-fun res!851882 () Bool)

(assert (=> b!1282520 (=> (not res!851882) (not e!732798))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84682 (_ BitVec 32)) Bool)

(assert (=> b!1282520 (= res!851882 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1282521 () Bool)

(assert (=> b!1282521 (= e!732800 tp_is_empty!33805)))

(declare-fun b!1282522 () Bool)

(declare-fun e!732799 () Bool)

(assert (=> b!1282522 (= e!732799 (and e!732796 mapRes!52265))))

(declare-fun condMapEmpty!52265 () Bool)

(declare-fun mapDefault!52265 () ValueCell!16004)

