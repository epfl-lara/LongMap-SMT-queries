; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108532 () Bool)

(assert start!108532)

(declare-fun b_free!28079 () Bool)

(declare-fun b_next!28079 () Bool)

(assert (=> start!108532 (= b_free!28079 (not b_next!28079))))

(declare-fun tp!99346 () Bool)

(declare-fun b_and!46139 () Bool)

(assert (=> start!108532 (= tp!99346 b_and!46139)))

(declare-fun b!1281085 () Bool)

(declare-fun res!850991 () Bool)

(declare-fun e!731956 () Bool)

(assert (=> b!1281085 (=> (not res!850991) (not e!731956))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50061 0))(
  ( (V!50062 (val!16934 Int)) )
))
(declare-datatypes ((ValueCell!15961 0))(
  ( (ValueCellFull!15961 (v!19534 V!50061)) (EmptyCell!15961) )
))
(declare-datatypes ((array!84510 0))(
  ( (array!84511 (arr!40759 (Array (_ BitVec 32) ValueCell!15961)) (size!41309 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84510)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84512 0))(
  ( (array!84513 (arr!40760 (Array (_ BitVec 32) (_ BitVec 64))) (size!41310 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84512)

(assert (=> b!1281085 (= res!850991 (and (= (size!41309 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41310 _keys!1741) (size!41309 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1281086 () Bool)

(declare-fun res!850988 () Bool)

(assert (=> b!1281086 (=> (not res!850988) (not e!731956))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1281086 (= res!850988 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41310 _keys!1741))))))

(declare-fun b!1281087 () Bool)

(declare-fun e!731960 () Bool)

(declare-fun tp_is_empty!33719 () Bool)

(assert (=> b!1281087 (= e!731960 tp_is_empty!33719)))

(declare-fun b!1281088 () Bool)

(declare-fun e!731957 () Bool)

(declare-fun e!731959 () Bool)

(declare-fun mapRes!52130 () Bool)

(assert (=> b!1281088 (= e!731957 (and e!731959 mapRes!52130))))

(declare-fun condMapEmpty!52130 () Bool)

(declare-fun mapDefault!52130 () ValueCell!15961)

