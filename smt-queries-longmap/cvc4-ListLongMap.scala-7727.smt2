; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97052 () Bool)

(assert start!97052)

(declare-fun b!1103991 () Bool)

(declare-fun res!736531 () Bool)

(declare-fun e!630185 () Bool)

(assert (=> b!1103991 (=> (not res!736531) (not e!630185))))

(declare-datatypes ((array!71603 0))(
  ( (array!71604 (arr!34458 (Array (_ BitVec 32) (_ BitVec 64))) (size!34994 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71603)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!41581 0))(
  ( (V!41582 (val!13727 Int)) )
))
(declare-datatypes ((ValueCell!12961 0))(
  ( (ValueCellFull!12961 (v!16359 V!41581)) (EmptyCell!12961) )
))
(declare-datatypes ((array!71605 0))(
  ( (array!71606 (arr!34459 (Array (_ BitVec 32) ValueCell!12961)) (size!34995 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71605)

(assert (=> b!1103991 (= res!736531 (and (= (size!34995 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34994 _keys!1208) (size!34995 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1103992 () Bool)

(declare-fun res!736539 () Bool)

(assert (=> b!1103992 (=> (not res!736539) (not e!630185))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1103992 (= res!736539 (= (select (arr!34458 _keys!1208) i!673) k!934))))

(declare-fun b!1103993 () Bool)

(declare-fun e!630184 () Bool)

(declare-fun e!630183 () Bool)

(declare-fun mapRes!42817 () Bool)

(assert (=> b!1103993 (= e!630184 (and e!630183 mapRes!42817))))

(declare-fun condMapEmpty!42817 () Bool)

(declare-fun mapDefault!42817 () ValueCell!12961)

