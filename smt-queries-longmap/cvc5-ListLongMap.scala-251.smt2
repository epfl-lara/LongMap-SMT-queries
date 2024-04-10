; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4188 () Bool)

(assert start!4188)

(declare-fun b_free!1093 () Bool)

(declare-fun b_next!1093 () Bool)

(assert (=> start!4188 (= b_free!1093 (not b_next!1093))))

(declare-fun tp!4699 () Bool)

(declare-fun b_and!1903 () Bool)

(assert (=> start!4188 (= tp!4699 b_and!1903)))

(declare-fun mapNonEmpty!1699 () Bool)

(declare-fun mapRes!1699 () Bool)

(declare-fun tp!4698 () Bool)

(declare-fun e!20262 () Bool)

(assert (=> mapNonEmpty!1699 (= mapRes!1699 (and tp!4698 e!20262))))

(declare-datatypes ((V!1755 0))(
  ( (V!1756 (val!750 Int)) )
))
(declare-datatypes ((ValueCell!524 0))(
  ( (ValueCellFull!524 (v!1839 V!1755)) (EmptyCell!524) )
))
(declare-datatypes ((array!2109 0))(
  ( (array!2110 (arr!1008 (Array (_ BitVec 32) ValueCell!524)) (size!1109 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2109)

(declare-fun mapKey!1699 () (_ BitVec 32))

(declare-fun mapRest!1699 () (Array (_ BitVec 32) ValueCell!524))

(declare-fun mapValue!1699 () ValueCell!524)

(assert (=> mapNonEmpty!1699 (= (arr!1008 _values!1501) (store mapRest!1699 mapKey!1699 mapValue!1699))))

(declare-fun b!31767 () Bool)

(declare-fun res!19266 () Bool)

(declare-fun e!20260 () Bool)

(assert (=> b!31767 (=> (not res!19266) (not e!20260))))

(declare-datatypes ((array!2111 0))(
  ( (array!2112 (arr!1009 (Array (_ BitVec 32) (_ BitVec 64))) (size!1110 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2111)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2111 (_ BitVec 32)) Bool)

(assert (=> b!31767 (= res!19266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!31768 () Bool)

(declare-fun e!20261 () Bool)

(declare-fun e!20263 () Bool)

(assert (=> b!31768 (= e!20261 (and e!20263 mapRes!1699))))

(declare-fun condMapEmpty!1699 () Bool)

(declare-fun mapDefault!1699 () ValueCell!524)

