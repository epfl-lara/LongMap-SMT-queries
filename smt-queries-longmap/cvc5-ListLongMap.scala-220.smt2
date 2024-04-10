; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4002 () Bool)

(assert start!4002)

(declare-fun b_free!907 () Bool)

(declare-fun b_next!907 () Bool)

(assert (=> start!4002 (= b_free!907 (not b_next!907))))

(declare-fun tp!4141 () Bool)

(declare-fun b_and!1717 () Bool)

(assert (=> start!4002 (= tp!4141 b_and!1717)))

(declare-fun b!29031 () Bool)

(declare-fun res!17367 () Bool)

(declare-fun e!18759 () Bool)

(assert (=> b!29031 (=> (not res!17367) (not e!18759))))

(declare-datatypes ((V!1507 0))(
  ( (V!1508 (val!657 Int)) )
))
(declare-datatypes ((ValueCell!431 0))(
  ( (ValueCellFull!431 (v!1746 V!1507)) (EmptyCell!431) )
))
(declare-datatypes ((array!1755 0))(
  ( (array!1756 (arr!831 (Array (_ BitVec 32) ValueCell!431)) (size!932 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1755)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-datatypes ((array!1757 0))(
  ( (array!1758 (arr!832 (Array (_ BitVec 32) (_ BitVec 64))) (size!933 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1757)

(assert (=> b!29031 (= res!17367 (and (= (size!932 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!933 _keys!1833) (size!932 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!29032 () Bool)

(declare-fun e!18762 () Bool)

(declare-fun e!18761 () Bool)

(declare-fun mapRes!1420 () Bool)

(assert (=> b!29032 (= e!18762 (and e!18761 mapRes!1420))))

(declare-fun condMapEmpty!1420 () Bool)

(declare-fun mapDefault!1420 () ValueCell!431)

