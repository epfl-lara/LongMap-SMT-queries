; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133490 () Bool)

(assert start!133490)

(declare-fun b!1560576 () Bool)

(declare-fun e!869628 () Bool)

(declare-fun tp_is_empty!38573 () Bool)

(assert (=> b!1560576 (= e!869628 tp_is_empty!38573)))

(declare-fun b!1560577 () Bool)

(declare-fun res!1067107 () Bool)

(declare-fun e!869629 () Bool)

(assert (=> b!1560577 (=> (not res!1067107) (not e!869629))))

(declare-datatypes ((array!103868 0))(
  ( (array!103869 (arr!50126 (Array (_ BitVec 32) (_ BitVec 64))) (size!50676 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103868)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103868 (_ BitVec 32)) Bool)

(assert (=> b!1560577 (= res!1067107 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1560578 () Bool)

(declare-fun res!1067109 () Bool)

(assert (=> b!1560578 (=> (not res!1067109) (not e!869629))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!59637 0))(
  ( (V!59638 (val!19370 Int)) )
))
(declare-datatypes ((ValueCell!18256 0))(
  ( (ValueCellFull!18256 (v!22122 V!59637)) (EmptyCell!18256) )
))
(declare-datatypes ((array!103870 0))(
  ( (array!103871 (arr!50127 (Array (_ BitVec 32) ValueCell!18256)) (size!50677 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103870)

(assert (=> b!1560578 (= res!1067109 (and (= (size!50677 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50676 _keys!637) (size!50677 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1560579 () Bool)

(assert (=> b!1560579 (= e!869629 false)))

(declare-fun lt!671016 () Bool)

(declare-datatypes ((List!36402 0))(
  ( (Nil!36399) (Cons!36398 (h!37844 (_ BitVec 64)) (t!51135 List!36402)) )
))
(declare-fun arrayNoDuplicates!0 (array!103868 (_ BitVec 32) List!36402) Bool)

(assert (=> b!1560579 (= lt!671016 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36399))))

(declare-fun b!1560580 () Bool)

(declare-fun e!869625 () Bool)

(assert (=> b!1560580 (= e!869625 tp_is_empty!38573)))

(declare-fun mapIsEmpty!59235 () Bool)

(declare-fun mapRes!59235 () Bool)

(assert (=> mapIsEmpty!59235 mapRes!59235))

(declare-fun res!1067108 () Bool)

(assert (=> start!133490 (=> (not res!1067108) (not e!869629))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133490 (= res!1067108 (validMask!0 mask!947))))

(assert (=> start!133490 e!869629))

(assert (=> start!133490 true))

(declare-fun e!869626 () Bool)

(declare-fun array_inv!38967 (array!103870) Bool)

(assert (=> start!133490 (and (array_inv!38967 _values!487) e!869626)))

(declare-fun array_inv!38968 (array!103868) Bool)

(assert (=> start!133490 (array_inv!38968 _keys!637)))

(declare-fun mapNonEmpty!59235 () Bool)

(declare-fun tp!112890 () Bool)

(assert (=> mapNonEmpty!59235 (= mapRes!59235 (and tp!112890 e!869628))))

(declare-fun mapRest!59235 () (Array (_ BitVec 32) ValueCell!18256))

(declare-fun mapKey!59235 () (_ BitVec 32))

(declare-fun mapValue!59235 () ValueCell!18256)

(assert (=> mapNonEmpty!59235 (= (arr!50127 _values!487) (store mapRest!59235 mapKey!59235 mapValue!59235))))

(declare-fun b!1560581 () Bool)

(assert (=> b!1560581 (= e!869626 (and e!869625 mapRes!59235))))

(declare-fun condMapEmpty!59235 () Bool)

(declare-fun mapDefault!59235 () ValueCell!18256)

