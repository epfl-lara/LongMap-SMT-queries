; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73916 () Bool)

(assert start!73916)

(declare-fun b_free!14831 () Bool)

(declare-fun b_next!14831 () Bool)

(assert (=> start!73916 (= b_free!14831 (not b_next!14831))))

(declare-fun tp!51997 () Bool)

(declare-fun b_and!24583 () Bool)

(assert (=> start!73916 (= tp!51997 b_and!24583)))

(declare-fun b!868611 () Bool)

(declare-fun res!590232 () Bool)

(declare-fun e!483776 () Bool)

(assert (=> b!868611 (=> (not res!590232) (not e!483776))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!868611 (= res!590232 (validMask!0 mask!1196))))

(declare-fun b!868612 () Bool)

(declare-fun e!483780 () Bool)

(declare-fun e!483777 () Bool)

(declare-fun mapRes!27050 () Bool)

(assert (=> b!868612 (= e!483780 (and e!483777 mapRes!27050))))

(declare-fun condMapEmpty!27050 () Bool)

(declare-datatypes ((V!27669 0))(
  ( (V!27670 (val!8531 Int)) )
))
(declare-datatypes ((ValueCell!8044 0))(
  ( (ValueCellFull!8044 (v!10956 V!27669)) (EmptyCell!8044) )
))
(declare-datatypes ((array!50086 0))(
  ( (array!50087 (arr!24074 (Array (_ BitVec 32) ValueCell!8044)) (size!24514 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50086)

(declare-fun mapDefault!27050 () ValueCell!8044)

