; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104640 () Bool)

(assert start!104640)

(declare-fun b!1247701 () Bool)

(declare-fun e!707886 () Bool)

(declare-fun tp_is_empty!31369 () Bool)

(assert (=> b!1247701 (= e!707886 tp_is_empty!31369)))

(declare-fun b!1247702 () Bool)

(declare-fun e!707883 () Bool)

(assert (=> b!1247702 (= e!707883 tp_is_empty!31369)))

(declare-fun mapNonEmpty!48808 () Bool)

(declare-fun mapRes!48808 () Bool)

(declare-fun tp!92909 () Bool)

(assert (=> mapNonEmpty!48808 (= mapRes!48808 (and tp!92909 e!707883))))

(declare-datatypes ((V!47191 0))(
  ( (V!47192 (val!15747 Int)) )
))
(declare-datatypes ((ValueCell!14921 0))(
  ( (ValueCellFull!14921 (v!18443 V!47191)) (EmptyCell!14921) )
))
(declare-fun mapValue!48808 () ValueCell!14921)

(declare-fun mapKey!48808 () (_ BitVec 32))

(declare-fun mapRest!48808 () (Array (_ BitVec 32) ValueCell!14921))

(declare-datatypes ((array!80432 0))(
  ( (array!80433 (arr!38785 (Array (_ BitVec 32) ValueCell!14921)) (size!39321 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80432)

(assert (=> mapNonEmpty!48808 (= (arr!38785 _values!914) (store mapRest!48808 mapKey!48808 mapValue!48808))))

(declare-fun res!832500 () Bool)

(declare-fun e!707887 () Bool)

(assert (=> start!104640 (=> (not res!832500) (not e!707887))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104640 (= res!832500 (validMask!0 mask!1466))))

(assert (=> start!104640 e!707887))

(assert (=> start!104640 true))

(declare-datatypes ((array!80434 0))(
  ( (array!80435 (arr!38786 (Array (_ BitVec 32) (_ BitVec 64))) (size!39322 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80434)

(declare-fun array_inv!29611 (array!80434) Bool)

(assert (=> start!104640 (array_inv!29611 _keys!1118)))

(declare-fun e!707884 () Bool)

(declare-fun array_inv!29612 (array!80432) Bool)

(assert (=> start!104640 (and (array_inv!29612 _values!914) e!707884)))

(declare-fun b!1247703 () Bool)

(assert (=> b!1247703 (= e!707884 (and e!707886 mapRes!48808))))

(declare-fun condMapEmpty!48808 () Bool)

(declare-fun mapDefault!48808 () ValueCell!14921)

