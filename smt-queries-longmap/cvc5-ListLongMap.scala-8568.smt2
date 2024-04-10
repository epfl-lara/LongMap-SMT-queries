; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104616 () Bool)

(assert start!104616)

(declare-fun b!1247485 () Bool)

(declare-fun e!707706 () Bool)

(assert (=> b!1247485 (= e!707706 false)))

(declare-fun lt!563269 () Bool)

(declare-datatypes ((array!80386 0))(
  ( (array!80387 (arr!38762 (Array (_ BitVec 32) (_ BitVec 64))) (size!39298 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80386)

(declare-datatypes ((List!27528 0))(
  ( (Nil!27525) (Cons!27524 (h!28733 (_ BitVec 64)) (t!40997 List!27528)) )
))
(declare-fun arrayNoDuplicates!0 (array!80386 (_ BitVec 32) List!27528) Bool)

(assert (=> b!1247485 (= lt!563269 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27525))))

(declare-fun b!1247486 () Bool)

(declare-fun e!707703 () Bool)

(declare-fun tp_is_empty!31345 () Bool)

(assert (=> b!1247486 (= e!707703 tp_is_empty!31345)))

(declare-fun b!1247487 () Bool)

(declare-fun e!707704 () Bool)

(declare-fun mapRes!48772 () Bool)

(assert (=> b!1247487 (= e!707704 (and e!707703 mapRes!48772))))

(declare-fun condMapEmpty!48772 () Bool)

(declare-datatypes ((V!47159 0))(
  ( (V!47160 (val!15735 Int)) )
))
(declare-datatypes ((ValueCell!14909 0))(
  ( (ValueCellFull!14909 (v!18431 V!47159)) (EmptyCell!14909) )
))
(declare-datatypes ((array!80388 0))(
  ( (array!80389 (arr!38763 (Array (_ BitVec 32) ValueCell!14909)) (size!39299 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80388)

(declare-fun mapDefault!48772 () ValueCell!14909)

