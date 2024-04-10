; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133486 () Bool)

(assert start!133486)

(declare-fun b!1560540 () Bool)

(declare-fun res!1067090 () Bool)

(declare-fun e!869595 () Bool)

(assert (=> b!1560540 (=> (not res!1067090) (not e!869595))))

(declare-datatypes ((array!103860 0))(
  ( (array!103861 (arr!50122 (Array (_ BitVec 32) (_ BitVec 64))) (size!50672 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103860)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103860 (_ BitVec 32)) Bool)

(assert (=> b!1560540 (= res!1067090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapNonEmpty!59229 () Bool)

(declare-fun mapRes!59229 () Bool)

(declare-fun tp!112884 () Bool)

(declare-fun e!869598 () Bool)

(assert (=> mapNonEmpty!59229 (= mapRes!59229 (and tp!112884 e!869598))))

(declare-datatypes ((V!59633 0))(
  ( (V!59634 (val!19368 Int)) )
))
(declare-datatypes ((ValueCell!18254 0))(
  ( (ValueCellFull!18254 (v!22120 V!59633)) (EmptyCell!18254) )
))
(declare-fun mapValue!59229 () ValueCell!18254)

(declare-datatypes ((array!103862 0))(
  ( (array!103863 (arr!50123 (Array (_ BitVec 32) ValueCell!18254)) (size!50673 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103862)

(declare-fun mapRest!59229 () (Array (_ BitVec 32) ValueCell!18254))

(declare-fun mapKey!59229 () (_ BitVec 32))

(assert (=> mapNonEmpty!59229 (= (arr!50123 _values!487) (store mapRest!59229 mapKey!59229 mapValue!59229))))

(declare-fun b!1560541 () Bool)

(declare-fun res!1067091 () Bool)

(assert (=> b!1560541 (=> (not res!1067091) (not e!869595))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1560541 (= res!1067091 (and (= (size!50673 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50672 _keys!637) (size!50673 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun res!1067089 () Bool)

(assert (=> start!133486 (=> (not res!1067089) (not e!869595))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133486 (= res!1067089 (validMask!0 mask!947))))

(assert (=> start!133486 e!869595))

(assert (=> start!133486 true))

(declare-fun e!869597 () Bool)

(declare-fun array_inv!38963 (array!103862) Bool)

(assert (=> start!133486 (and (array_inv!38963 _values!487) e!869597)))

(declare-fun array_inv!38964 (array!103860) Bool)

(assert (=> start!133486 (array_inv!38964 _keys!637)))

(declare-fun b!1560542 () Bool)

(declare-fun e!869599 () Bool)

(declare-fun tp_is_empty!38569 () Bool)

(assert (=> b!1560542 (= e!869599 tp_is_empty!38569)))

(declare-fun b!1560543 () Bool)

(assert (=> b!1560543 (= e!869595 false)))

(declare-fun lt!671010 () Bool)

(declare-datatypes ((List!36400 0))(
  ( (Nil!36397) (Cons!36396 (h!37842 (_ BitVec 64)) (t!51133 List!36400)) )
))
(declare-fun arrayNoDuplicates!0 (array!103860 (_ BitVec 32) List!36400) Bool)

(assert (=> b!1560543 (= lt!671010 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36397))))

(declare-fun b!1560544 () Bool)

(assert (=> b!1560544 (= e!869597 (and e!869599 mapRes!59229))))

(declare-fun condMapEmpty!59229 () Bool)

(declare-fun mapDefault!59229 () ValueCell!18254)

