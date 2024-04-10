; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133426 () Bool)

(assert start!133426)

(declare-fun res!1066640 () Bool)

(declare-fun e!869145 () Bool)

(assert (=> start!133426 (=> (not res!1066640) (not e!869145))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133426 (= res!1066640 (validMask!0 mask!947))))

(assert (=> start!133426 e!869145))

(assert (=> start!133426 true))

(declare-datatypes ((array!103744 0))(
  ( (array!103745 (arr!50064 (Array (_ BitVec 32) (_ BitVec 64))) (size!50614 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103744)

(declare-fun array_inv!38915 (array!103744) Bool)

(assert (=> start!133426 (array_inv!38915 _keys!637)))

(declare-datatypes ((V!59553 0))(
  ( (V!59554 (val!19338 Int)) )
))
(declare-datatypes ((ValueCell!18224 0))(
  ( (ValueCellFull!18224 (v!22090 V!59553)) (EmptyCell!18224) )
))
(declare-datatypes ((array!103746 0))(
  ( (array!103747 (arr!50065 (Array (_ BitVec 32) ValueCell!18224)) (size!50615 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103746)

(declare-fun e!869147 () Bool)

(declare-fun array_inv!38916 (array!103746) Bool)

(assert (=> start!133426 (and (array_inv!38916 _values!487) e!869147)))

(declare-fun mapNonEmpty!59139 () Bool)

(declare-fun mapRes!59139 () Bool)

(declare-fun tp!112794 () Bool)

(declare-fun e!869148 () Bool)

(assert (=> mapNonEmpty!59139 (= mapRes!59139 (and tp!112794 e!869148))))

(declare-fun mapRest!59139 () (Array (_ BitVec 32) ValueCell!18224))

(declare-fun mapValue!59139 () ValueCell!18224)

(declare-fun mapKey!59139 () (_ BitVec 32))

(assert (=> mapNonEmpty!59139 (= (arr!50065 _values!487) (store mapRest!59139 mapKey!59139 mapValue!59139))))

(declare-fun b!1559817 () Bool)

(declare-fun res!1066641 () Bool)

(assert (=> b!1559817 (=> (not res!1066641) (not e!869145))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1559817 (= res!1066641 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50614 _keys!637)) (bvsge from!782 (size!50614 _keys!637))))))

(declare-fun b!1559818 () Bool)

(declare-fun tp_is_empty!38509 () Bool)

(assert (=> b!1559818 (= e!869148 tp_is_empty!38509)))

(declare-fun b!1559819 () Bool)

(declare-fun e!869149 () Bool)

(assert (=> b!1559819 (= e!869147 (and e!869149 mapRes!59139))))

(declare-fun condMapEmpty!59139 () Bool)

(declare-fun mapDefault!59139 () ValueCell!18224)

