; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108436 () Bool)

(assert start!108436)

(declare-fun b_free!27983 () Bool)

(declare-fun b_next!27983 () Bool)

(assert (=> start!108436 (= b_free!27983 (not b_next!27983))))

(declare-fun tp!99059 () Bool)

(declare-fun b_and!46043 () Bool)

(assert (=> start!108436 (= tp!99059 b_and!46043)))

(declare-fun b!1279809 () Bool)

(declare-fun e!731238 () Bool)

(declare-fun tp_is_empty!33623 () Bool)

(assert (=> b!1279809 (= e!731238 tp_is_empty!33623)))

(declare-fun b!1279810 () Bool)

(declare-fun res!850142 () Bool)

(declare-fun e!731239 () Bool)

(assert (=> b!1279810 (=> (not res!850142) (not e!731239))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84328 0))(
  ( (array!84329 (arr!40668 (Array (_ BitVec 32) (_ BitVec 64))) (size!41218 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84328)

(assert (=> b!1279810 (= res!850142 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41218 _keys!1741))))))

(declare-fun b!1279811 () Bool)

(declare-fun e!731240 () Bool)

(declare-fun e!731236 () Bool)

(declare-fun mapRes!51986 () Bool)

(assert (=> b!1279811 (= e!731240 (and e!731236 mapRes!51986))))

(declare-fun condMapEmpty!51986 () Bool)

(declare-datatypes ((V!49933 0))(
  ( (V!49934 (val!16886 Int)) )
))
(declare-datatypes ((ValueCell!15913 0))(
  ( (ValueCellFull!15913 (v!19486 V!49933)) (EmptyCell!15913) )
))
(declare-datatypes ((array!84330 0))(
  ( (array!84331 (arr!40669 (Array (_ BitVec 32) ValueCell!15913)) (size!41219 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84330)

(declare-fun mapDefault!51986 () ValueCell!15913)

