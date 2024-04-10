; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133502 () Bool)

(assert start!133502)

(declare-fun b!1560684 () Bool)

(declare-fun res!1067163 () Bool)

(declare-fun e!869716 () Bool)

(assert (=> b!1560684 (=> (not res!1067163) (not e!869716))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!103890 0))(
  ( (array!103891 (arr!50137 (Array (_ BitVec 32) (_ BitVec 64))) (size!50687 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103890)

(declare-datatypes ((V!59653 0))(
  ( (V!59654 (val!19376 Int)) )
))
(declare-datatypes ((ValueCell!18262 0))(
  ( (ValueCellFull!18262 (v!22128 V!59653)) (EmptyCell!18262) )
))
(declare-datatypes ((array!103892 0))(
  ( (array!103893 (arr!50138 (Array (_ BitVec 32) ValueCell!18262)) (size!50688 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103892)

(assert (=> b!1560684 (= res!1067163 (and (= (size!50688 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50687 _keys!637) (size!50688 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1560685 () Bool)

(declare-fun e!869715 () Bool)

(declare-fun tp_is_empty!38585 () Bool)

(assert (=> b!1560685 (= e!869715 tp_is_empty!38585)))

(declare-fun mapIsEmpty!59253 () Bool)

(declare-fun mapRes!59253 () Bool)

(assert (=> mapIsEmpty!59253 mapRes!59253))

(declare-fun b!1560686 () Bool)

(declare-fun e!869718 () Bool)

(assert (=> b!1560686 (= e!869718 tp_is_empty!38585)))

(declare-fun b!1560687 () Bool)

(assert (=> b!1560687 (= e!869716 false)))

(declare-fun lt!671034 () Bool)

(declare-datatypes ((List!36406 0))(
  ( (Nil!36403) (Cons!36402 (h!37848 (_ BitVec 64)) (t!51139 List!36406)) )
))
(declare-fun arrayNoDuplicates!0 (array!103890 (_ BitVec 32) List!36406) Bool)

(assert (=> b!1560687 (= lt!671034 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36403))))

(declare-fun b!1560688 () Bool)

(declare-fun res!1067161 () Bool)

(assert (=> b!1560688 (=> (not res!1067161) (not e!869716))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103890 (_ BitVec 32)) Bool)

(assert (=> b!1560688 (= res!1067161 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun res!1067162 () Bool)

(assert (=> start!133502 (=> (not res!1067162) (not e!869716))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133502 (= res!1067162 (validMask!0 mask!947))))

(assert (=> start!133502 e!869716))

(assert (=> start!133502 true))

(declare-fun e!869719 () Bool)

(declare-fun array_inv!38975 (array!103892) Bool)

(assert (=> start!133502 (and (array_inv!38975 _values!487) e!869719)))

(declare-fun array_inv!38976 (array!103890) Bool)

(assert (=> start!133502 (array_inv!38976 _keys!637)))

(declare-fun mapNonEmpty!59253 () Bool)

(declare-fun tp!112908 () Bool)

(assert (=> mapNonEmpty!59253 (= mapRes!59253 (and tp!112908 e!869715))))

(declare-fun mapValue!59253 () ValueCell!18262)

(declare-fun mapRest!59253 () (Array (_ BitVec 32) ValueCell!18262))

(declare-fun mapKey!59253 () (_ BitVec 32))

(assert (=> mapNonEmpty!59253 (= (arr!50138 _values!487) (store mapRest!59253 mapKey!59253 mapValue!59253))))

(declare-fun b!1560689 () Bool)

(assert (=> b!1560689 (= e!869719 (and e!869718 mapRes!59253))))

(declare-fun condMapEmpty!59253 () Bool)

(declare-fun mapDefault!59253 () ValueCell!18262)

