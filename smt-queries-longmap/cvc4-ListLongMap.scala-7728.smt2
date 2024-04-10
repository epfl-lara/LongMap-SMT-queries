; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97070 () Bool)

(assert start!97070)

(declare-fun b!1104147 () Bool)

(declare-fun res!736645 () Bool)

(declare-fun e!630261 () Bool)

(assert (=> b!1104147 (=> (not res!736645) (not e!630261))))

(declare-datatypes ((array!71615 0))(
  ( (array!71616 (arr!34463 (Array (_ BitVec 32) (_ BitVec 64))) (size!34999 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71615)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71615 (_ BitVec 32)) Bool)

(assert (=> b!1104147 (= res!736645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1104148 () Bool)

(declare-fun res!736641 () Bool)

(assert (=> b!1104148 (=> (not res!736641) (not e!630261))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!41589 0))(
  ( (V!41590 (val!13730 Int)) )
))
(declare-datatypes ((ValueCell!12964 0))(
  ( (ValueCellFull!12964 (v!16362 V!41589)) (EmptyCell!12964) )
))
(declare-datatypes ((array!71617 0))(
  ( (array!71618 (arr!34464 (Array (_ BitVec 32) ValueCell!12964)) (size!35000 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71617)

(assert (=> b!1104148 (= res!736641 (and (= (size!35000 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34999 _keys!1208) (size!35000 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1104149 () Bool)

(declare-fun e!630260 () Bool)

(declare-fun e!630257 () Bool)

(declare-fun mapRes!42829 () Bool)

(assert (=> b!1104149 (= e!630260 (and e!630257 mapRes!42829))))

(declare-fun condMapEmpty!42829 () Bool)

(declare-fun mapDefault!42829 () ValueCell!12964)

