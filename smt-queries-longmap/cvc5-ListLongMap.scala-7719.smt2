; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96970 () Bool)

(assert start!96970)

(declare-fun b!1103191 () Bool)

(declare-fun e!629720 () Bool)

(declare-fun tp_is_empty!27289 () Bool)

(assert (=> b!1103191 (= e!629720 tp_is_empty!27289)))

(declare-fun b!1103192 () Bool)

(declare-fun res!736006 () Bool)

(declare-fun e!629721 () Bool)

(assert (=> b!1103192 (=> (not res!736006) (not e!629721))))

(declare-datatypes ((array!71497 0))(
  ( (array!71498 (arr!34408 (Array (_ BitVec 32) (_ BitVec 64))) (size!34944 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71497)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!41513 0))(
  ( (V!41514 (val!13701 Int)) )
))
(declare-datatypes ((ValueCell!12935 0))(
  ( (ValueCellFull!12935 (v!16332 V!41513)) (EmptyCell!12935) )
))
(declare-datatypes ((array!71499 0))(
  ( (array!71500 (arr!34409 (Array (_ BitVec 32) ValueCell!12935)) (size!34945 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71499)

(assert (=> b!1103192 (= res!736006 (and (= (size!34945 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34944 _keys!1208) (size!34945 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1103193 () Bool)

(declare-fun res!736007 () Bool)

(assert (=> b!1103193 (=> (not res!736007) (not e!629721))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1103193 (= res!736007 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!42730 () Bool)

(declare-fun mapRes!42730 () Bool)

(assert (=> mapIsEmpty!42730 mapRes!42730))

(declare-fun b!1103194 () Bool)

(assert (=> b!1103194 (= e!629721 (and (bvsle #b00000000000000000000000000000000 (size!34944 _keys!1208)) (bvsge (size!34944 _keys!1208) #b01111111111111111111111111111111)))))

(declare-fun b!1103195 () Bool)

(declare-fun e!629718 () Bool)

(declare-fun e!629722 () Bool)

(assert (=> b!1103195 (= e!629718 (and e!629722 mapRes!42730))))

(declare-fun condMapEmpty!42730 () Bool)

(declare-fun mapDefault!42730 () ValueCell!12935)

