; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108622 () Bool)

(assert start!108622)

(declare-fun b_free!28135 () Bool)

(declare-fun b_next!28135 () Bool)

(assert (=> start!108622 (= b_free!28135 (not b_next!28135))))

(declare-fun tp!99520 () Bool)

(declare-fun b_and!46201 () Bool)

(assert (=> start!108622 (= tp!99520 b_and!46201)))

(declare-fun b!1282157 () Bool)

(declare-fun res!851659 () Bool)

(declare-fun e!732572 () Bool)

(assert (=> b!1282157 (=> (not res!851659) (not e!732572))))

(declare-datatypes ((array!84620 0))(
  ( (array!84621 (arr!40812 (Array (_ BitVec 32) (_ BitVec 64))) (size!41362 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84620)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84620 (_ BitVec 32)) Bool)

(assert (=> b!1282157 (= res!851659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!52220 () Bool)

(declare-fun mapRes!52220 () Bool)

(declare-fun tp!99521 () Bool)

(declare-fun e!732575 () Bool)

(assert (=> mapNonEmpty!52220 (= mapRes!52220 (and tp!99521 e!732575))))

(declare-datatypes ((V!50137 0))(
  ( (V!50138 (val!16962 Int)) )
))
(declare-datatypes ((ValueCell!15989 0))(
  ( (ValueCellFull!15989 (v!19564 V!50137)) (EmptyCell!15989) )
))
(declare-fun mapValue!52220 () ValueCell!15989)

(declare-datatypes ((array!84622 0))(
  ( (array!84623 (arr!40813 (Array (_ BitVec 32) ValueCell!15989)) (size!41363 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84622)

(declare-fun mapRest!52220 () (Array (_ BitVec 32) ValueCell!15989))

(declare-fun mapKey!52220 () (_ BitVec 32))

(assert (=> mapNonEmpty!52220 (= (arr!40813 _values!1445) (store mapRest!52220 mapKey!52220 mapValue!52220))))

(declare-fun b!1282158 () Bool)

(declare-fun res!851657 () Bool)

(assert (=> b!1282158 (=> (not res!851657) (not e!732572))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1282158 (= res!851657 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41362 _keys!1741))))))

(declare-fun b!1282159 () Bool)

(declare-fun res!851660 () Bool)

(assert (=> b!1282159 (=> (not res!851660) (not e!732572))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1282159 (= res!851660 (and (= (size!41363 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41362 _keys!1741) (size!41363 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1282160 () Bool)

(declare-fun e!732574 () Bool)

(declare-fun e!732571 () Bool)

(assert (=> b!1282160 (= e!732574 (and e!732571 mapRes!52220))))

(declare-fun condMapEmpty!52220 () Bool)

(declare-fun mapDefault!52220 () ValueCell!15989)

