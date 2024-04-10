; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108394 () Bool)

(assert start!108394)

(declare-fun b_free!27941 () Bool)

(declare-fun b_next!27941 () Bool)

(assert (=> start!108394 (= b_free!27941 (not b_next!27941))))

(declare-fun tp!98932 () Bool)

(declare-fun b_and!46001 () Bool)

(assert (=> start!108394 (= tp!98932 b_and!46001)))

(declare-fun b!1279296 () Bool)

(declare-fun res!849817 () Bool)

(declare-fun e!730921 () Bool)

(assert (=> b!1279296 (=> (not res!849817) (not e!730921))))

(declare-datatypes ((array!84250 0))(
  ( (array!84251 (arr!40629 (Array (_ BitVec 32) (_ BitVec 64))) (size!41179 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84250)

(declare-datatypes ((List!28777 0))(
  ( (Nil!28774) (Cons!28773 (h!29982 (_ BitVec 64)) (t!42317 List!28777)) )
))
(declare-fun arrayNoDuplicates!0 (array!84250 (_ BitVec 32) List!28777) Bool)

(assert (=> b!1279296 (= res!849817 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28774))))

(declare-fun res!849821 () Bool)

(assert (=> start!108394 (=> (not res!849821) (not e!730921))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108394 (= res!849821 (validMask!0 mask!2175))))

(assert (=> start!108394 e!730921))

(declare-fun tp_is_empty!33581 () Bool)

(assert (=> start!108394 tp_is_empty!33581))

(assert (=> start!108394 true))

(declare-datatypes ((V!49877 0))(
  ( (V!49878 (val!16865 Int)) )
))
(declare-datatypes ((ValueCell!15892 0))(
  ( (ValueCellFull!15892 (v!19465 V!49877)) (EmptyCell!15892) )
))
(declare-datatypes ((array!84252 0))(
  ( (array!84253 (arr!40630 (Array (_ BitVec 32) ValueCell!15892)) (size!41180 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84252)

(declare-fun e!730922 () Bool)

(declare-fun array_inv!30847 (array!84252) Bool)

(assert (=> start!108394 (and (array_inv!30847 _values!1445) e!730922)))

(declare-fun array_inv!30848 (array!84250) Bool)

(assert (=> start!108394 (array_inv!30848 _keys!1741)))

(assert (=> start!108394 tp!98932))

(declare-fun b!1279297 () Bool)

(declare-fun res!849820 () Bool)

(assert (=> b!1279297 (=> (not res!849820) (not e!730921))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1279297 (= res!849820 (and (= (size!41180 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41179 _keys!1741) (size!41180 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!51923 () Bool)

(declare-fun mapRes!51923 () Bool)

(assert (=> mapIsEmpty!51923 mapRes!51923))

(declare-fun b!1279298 () Bool)

(declare-fun e!730924 () Bool)

(assert (=> b!1279298 (= e!730922 (and e!730924 mapRes!51923))))

(declare-fun condMapEmpty!51923 () Bool)

(declare-fun mapDefault!51923 () ValueCell!15892)

