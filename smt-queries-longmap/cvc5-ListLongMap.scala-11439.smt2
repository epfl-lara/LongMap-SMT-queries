; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133432 () Bool)

(assert start!133432)

(declare-fun mapIsEmpty!59148 () Bool)

(declare-fun mapRes!59148 () Bool)

(assert (=> mapIsEmpty!59148 mapRes!59148))

(declare-fun b!1559898 () Bool)

(declare-fun res!1066691 () Bool)

(declare-fun e!869193 () Bool)

(assert (=> b!1559898 (=> (not res!1066691) (not e!869193))))

(declare-datatypes ((array!103756 0))(
  ( (array!103757 (arr!50070 (Array (_ BitVec 32) (_ BitVec 64))) (size!50620 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103756)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103756 (_ BitVec 32)) Bool)

(assert (=> b!1559898 (= res!1066691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1559899 () Bool)

(declare-fun res!1066695 () Bool)

(assert (=> b!1559899 (=> (not res!1066695) (not e!869193))))

(declare-datatypes ((List!36369 0))(
  ( (Nil!36366) (Cons!36365 (h!37811 (_ BitVec 64)) (t!51102 List!36369)) )
))
(declare-fun arrayNoDuplicates!0 (array!103756 (_ BitVec 32) List!36369) Bool)

(assert (=> b!1559899 (= res!1066695 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36366))))

(declare-fun b!1559900 () Bool)

(declare-fun res!1066692 () Bool)

(assert (=> b!1559900 (=> (not res!1066692) (not e!869193))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1559900 (= res!1066692 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50620 _keys!637)) (bvsge from!782 (size!50620 _keys!637))))))

(declare-fun b!1559901 () Bool)

(declare-fun e!869190 () Bool)

(declare-fun e!869191 () Bool)

(assert (=> b!1559901 (= e!869190 (and e!869191 mapRes!59148))))

(declare-fun condMapEmpty!59148 () Bool)

(declare-datatypes ((V!59561 0))(
  ( (V!59562 (val!19341 Int)) )
))
(declare-datatypes ((ValueCell!18227 0))(
  ( (ValueCellFull!18227 (v!22093 V!59561)) (EmptyCell!18227) )
))
(declare-datatypes ((array!103758 0))(
  ( (array!103759 (arr!50071 (Array (_ BitVec 32) ValueCell!18227)) (size!50621 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103758)

(declare-fun mapDefault!59148 () ValueCell!18227)

