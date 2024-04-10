; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108540 () Bool)

(assert start!108540)

(declare-fun b_free!28087 () Bool)

(declare-fun b_next!28087 () Bool)

(assert (=> start!108540 (= b_free!28087 (not b_next!28087))))

(declare-fun tp!99370 () Bool)

(declare-fun b_and!46147 () Bool)

(assert (=> start!108540 (= tp!99370 b_and!46147)))

(declare-fun b!1281205 () Bool)

(declare-fun e!732016 () Bool)

(assert (=> b!1281205 (= e!732016 (not true))))

(declare-datatypes ((V!50073 0))(
  ( (V!50074 (val!16938 Int)) )
))
(declare-fun minValue!1387 () V!50073)

(declare-fun zeroValue!1387 () V!50073)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!15965 0))(
  ( (ValueCellFull!15965 (v!19538 V!50073)) (EmptyCell!15965) )
))
(declare-datatypes ((array!84524 0))(
  ( (array!84525 (arr!40766 (Array (_ BitVec 32) ValueCell!15965)) (size!41316 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84524)

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((array!84526 0))(
  ( (array!84527 (arr!40767 (Array (_ BitVec 32) (_ BitVec 64))) (size!41317 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84526)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((tuple2!21684 0))(
  ( (tuple2!21685 (_1!10853 (_ BitVec 64)) (_2!10853 V!50073)) )
))
(declare-datatypes ((List!28879 0))(
  ( (Nil!28876) (Cons!28875 (h!30084 tuple2!21684) (t!42419 List!28879)) )
))
(declare-datatypes ((ListLongMap!19341 0))(
  ( (ListLongMap!19342 (toList!9686 List!28879)) )
))
(declare-fun contains!7801 (ListLongMap!19341 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4770 (array!84526 array!84524 (_ BitVec 32) (_ BitVec 32) V!50073 V!50073 (_ BitVec 32) Int) ListLongMap!19341)

(assert (=> b!1281205 (contains!7801 (getCurrentListMap!4770 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k!1205)))

(declare-datatypes ((Unit!42429 0))(
  ( (Unit!42430) )
))
(declare-fun lt!576203 () Unit!42429)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!19 (array!84526 array!84524 (_ BitVec 32) (_ BitVec 32) V!50073 V!50073 (_ BitVec 64) (_ BitVec 32) Int) Unit!42429)

(assert (=> b!1281205 (= lt!576203 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!19 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k!1205 from!2144 defaultEntry!1448))))

(declare-fun res!851072 () Bool)

(assert (=> start!108540 (=> (not res!851072) (not e!732016))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108540 (= res!851072 (validMask!0 mask!2175))))

(assert (=> start!108540 e!732016))

(declare-fun tp_is_empty!33727 () Bool)

(assert (=> start!108540 tp_is_empty!33727))

(assert (=> start!108540 true))

(declare-fun e!732019 () Bool)

(declare-fun array_inv!30933 (array!84524) Bool)

(assert (=> start!108540 (and (array_inv!30933 _values!1445) e!732019)))

(declare-fun array_inv!30934 (array!84526) Bool)

(assert (=> start!108540 (array_inv!30934 _keys!1741)))

(assert (=> start!108540 tp!99370))

(declare-fun b!1281206 () Bool)

(declare-fun e!732018 () Bool)

(declare-fun mapRes!52142 () Bool)

(assert (=> b!1281206 (= e!732019 (and e!732018 mapRes!52142))))

(declare-fun condMapEmpty!52142 () Bool)

(declare-fun mapDefault!52142 () ValueCell!15965)

