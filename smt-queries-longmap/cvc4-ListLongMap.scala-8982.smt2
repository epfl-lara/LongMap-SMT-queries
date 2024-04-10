; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108656 () Bool)

(assert start!108656)

(declare-fun b_free!28169 () Bool)

(declare-fun b_next!28169 () Bool)

(assert (=> start!108656 (= b_free!28169 (not b_next!28169))))

(declare-fun tp!99623 () Bool)

(declare-fun b_and!46235 () Bool)

(assert (=> start!108656 (= tp!99623 b_and!46235)))

(declare-fun b!1282565 () Bool)

(declare-fun e!732830 () Bool)

(declare-fun tp_is_empty!33809 () Bool)

(assert (=> b!1282565 (= e!732830 tp_is_empty!33809)))

(declare-fun b!1282566 () Bool)

(declare-fun res!851916 () Bool)

(declare-fun e!732826 () Bool)

(assert (=> b!1282566 (=> (not res!851916) (not e!732826))))

(declare-datatypes ((array!84688 0))(
  ( (array!84689 (arr!40846 (Array (_ BitVec 32) (_ BitVec 64))) (size!41396 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84688)

(declare-datatypes ((List!28939 0))(
  ( (Nil!28936) (Cons!28935 (h!30144 (_ BitVec 64)) (t!42483 List!28939)) )
))
(declare-fun arrayNoDuplicates!0 (array!84688 (_ BitVec 32) List!28939) Bool)

(assert (=> b!1282566 (= res!851916 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28936))))

(declare-fun b!1282567 () Bool)

(declare-fun res!851913 () Bool)

(assert (=> b!1282567 (=> (not res!851913) (not e!732826))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84688 (_ BitVec 32)) Bool)

(assert (=> b!1282567 (= res!851913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!851915 () Bool)

(assert (=> start!108656 (=> (not res!851915) (not e!732826))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108656 (= res!851915 (validMask!0 mask!2175))))

(assert (=> start!108656 e!732826))

(assert (=> start!108656 tp_is_empty!33809))

(assert (=> start!108656 true))

(declare-datatypes ((V!50181 0))(
  ( (V!50182 (val!16979 Int)) )
))
(declare-datatypes ((ValueCell!16006 0))(
  ( (ValueCellFull!16006 (v!19581 V!50181)) (EmptyCell!16006) )
))
(declare-datatypes ((array!84690 0))(
  ( (array!84691 (arr!40847 (Array (_ BitVec 32) ValueCell!16006)) (size!41397 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84690)

(declare-fun e!732828 () Bool)

(declare-fun array_inv!30987 (array!84690) Bool)

(assert (=> start!108656 (and (array_inv!30987 _values!1445) e!732828)))

(declare-fun array_inv!30988 (array!84688) Bool)

(assert (=> start!108656 (array_inv!30988 _keys!1741)))

(assert (=> start!108656 tp!99623))

(declare-fun b!1282568 () Bool)

(declare-fun res!851912 () Bool)

(assert (=> b!1282568 (=> (not res!851912) (not e!732826))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1282568 (= res!851912 (and (= (size!41397 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41396 _keys!1741) (size!41397 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1282569 () Bool)

(declare-fun res!851914 () Bool)

(assert (=> b!1282569 (=> (not res!851914) (not e!732826))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1282569 (= res!851914 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41396 _keys!1741))))))

(declare-fun b!1282570 () Bool)

(assert (=> b!1282570 (= e!732826 false)))

(declare-fun minValue!1387 () V!50181)

(declare-fun zeroValue!1387 () V!50181)

(declare-fun lt!576550 () Bool)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21742 0))(
  ( (tuple2!21743 (_1!10882 (_ BitVec 64)) (_2!10882 V!50181)) )
))
(declare-datatypes ((List!28940 0))(
  ( (Nil!28937) (Cons!28936 (h!30145 tuple2!21742) (t!42484 List!28940)) )
))
(declare-datatypes ((ListLongMap!19399 0))(
  ( (ListLongMap!19400 (toList!9715 List!28940)) )
))
(declare-fun contains!7832 (ListLongMap!19399 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4799 (array!84688 array!84690 (_ BitVec 32) (_ BitVec 32) V!50181 V!50181 (_ BitVec 32) Int) ListLongMap!19399)

(assert (=> b!1282570 (= lt!576550 (contains!7832 (getCurrentListMap!4799 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1282571 () Bool)

(declare-fun e!732827 () Bool)

(declare-fun mapRes!52271 () Bool)

(assert (=> b!1282571 (= e!732828 (and e!732827 mapRes!52271))))

(declare-fun condMapEmpty!52271 () Bool)

(declare-fun mapDefault!52271 () ValueCell!16006)

