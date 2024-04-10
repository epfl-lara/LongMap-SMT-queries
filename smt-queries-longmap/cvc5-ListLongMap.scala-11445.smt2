; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133468 () Bool)

(assert start!133468)

(declare-fun res!1067009 () Bool)

(declare-fun e!869463 () Bool)

(assert (=> start!133468 (=> (not res!1067009) (not e!869463))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133468 (= res!1067009 (validMask!0 mask!947))))

(assert (=> start!133468 e!869463))

(assert (=> start!133468 true))

(declare-datatypes ((V!59609 0))(
  ( (V!59610 (val!19359 Int)) )
))
(declare-datatypes ((ValueCell!18245 0))(
  ( (ValueCellFull!18245 (v!22111 V!59609)) (EmptyCell!18245) )
))
(declare-datatypes ((array!103826 0))(
  ( (array!103827 (arr!50105 (Array (_ BitVec 32) ValueCell!18245)) (size!50655 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103826)

(declare-fun e!869461 () Bool)

(declare-fun array_inv!38949 (array!103826) Bool)

(assert (=> start!133468 (and (array_inv!38949 _values!487) e!869461)))

(declare-datatypes ((array!103828 0))(
  ( (array!103829 (arr!50106 (Array (_ BitVec 32) (_ BitVec 64))) (size!50656 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103828)

(declare-fun array_inv!38950 (array!103828) Bool)

(assert (=> start!133468 (array_inv!38950 _keys!637)))

(declare-fun b!1560378 () Bool)

(declare-fun res!1067010 () Bool)

(assert (=> b!1560378 (=> (not res!1067010) (not e!869463))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103828 (_ BitVec 32)) Bool)

(assert (=> b!1560378 (= res!1067010 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapIsEmpty!59202 () Bool)

(declare-fun mapRes!59202 () Bool)

(assert (=> mapIsEmpty!59202 mapRes!59202))

(declare-fun b!1560379 () Bool)

(declare-fun e!869464 () Bool)

(declare-fun tp_is_empty!38551 () Bool)

(assert (=> b!1560379 (= e!869464 tp_is_empty!38551)))

(declare-fun b!1560380 () Bool)

(assert (=> b!1560380 (= e!869463 false)))

(declare-fun lt!670983 () Bool)

(declare-datatypes ((List!36394 0))(
  ( (Nil!36391) (Cons!36390 (h!37836 (_ BitVec 64)) (t!51127 List!36394)) )
))
(declare-fun arrayNoDuplicates!0 (array!103828 (_ BitVec 32) List!36394) Bool)

(assert (=> b!1560380 (= lt!670983 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36391))))

(declare-fun b!1560381 () Bool)

(declare-fun res!1067008 () Bool)

(assert (=> b!1560381 (=> (not res!1067008) (not e!869463))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1560381 (= res!1067008 (and (= (size!50655 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50656 _keys!637) (size!50655 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!59202 () Bool)

(declare-fun tp!112857 () Bool)

(declare-fun e!869462 () Bool)

(assert (=> mapNonEmpty!59202 (= mapRes!59202 (and tp!112857 e!869462))))

(declare-fun mapRest!59202 () (Array (_ BitVec 32) ValueCell!18245))

(declare-fun mapKey!59202 () (_ BitVec 32))

(declare-fun mapValue!59202 () ValueCell!18245)

(assert (=> mapNonEmpty!59202 (= (arr!50105 _values!487) (store mapRest!59202 mapKey!59202 mapValue!59202))))

(declare-fun b!1560382 () Bool)

(assert (=> b!1560382 (= e!869461 (and e!869464 mapRes!59202))))

(declare-fun condMapEmpty!59202 () Bool)

(declare-fun mapDefault!59202 () ValueCell!18245)

