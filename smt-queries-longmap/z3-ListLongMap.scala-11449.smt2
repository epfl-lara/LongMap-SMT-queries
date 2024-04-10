; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133494 () Bool)

(assert start!133494)

(declare-fun mapIsEmpty!59241 () Bool)

(declare-fun mapRes!59241 () Bool)

(assert (=> mapIsEmpty!59241 mapRes!59241))

(declare-fun b!1560612 () Bool)

(declare-fun e!869659 () Bool)

(declare-fun tp_is_empty!38577 () Bool)

(assert (=> b!1560612 (= e!869659 tp_is_empty!38577)))

(declare-fun b!1560613 () Bool)

(declare-fun res!1067127 () Bool)

(declare-fun e!869656 () Bool)

(assert (=> b!1560613 (=> (not res!1067127) (not e!869656))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-datatypes ((V!59643 0))(
  ( (V!59644 (val!19372 Int)) )
))
(declare-datatypes ((ValueCell!18258 0))(
  ( (ValueCellFull!18258 (v!22124 V!59643)) (EmptyCell!18258) )
))
(declare-datatypes ((array!103876 0))(
  ( (array!103877 (arr!50130 (Array (_ BitVec 32) ValueCell!18258)) (size!50680 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103876)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!103878 0))(
  ( (array!103879 (arr!50131 (Array (_ BitVec 32) (_ BitVec 64))) (size!50681 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103878)

(assert (=> b!1560613 (= res!1067127 (and (= (size!50680 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50681 _keys!637) (size!50680 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1560614 () Bool)

(declare-fun e!869658 () Bool)

(assert (=> b!1560614 (= e!869658 tp_is_empty!38577)))

(declare-fun mapNonEmpty!59241 () Bool)

(declare-fun tp!112896 () Bool)

(assert (=> mapNonEmpty!59241 (= mapRes!59241 (and tp!112896 e!869659))))

(declare-fun mapValue!59241 () ValueCell!18258)

(declare-fun mapKey!59241 () (_ BitVec 32))

(declare-fun mapRest!59241 () (Array (_ BitVec 32) ValueCell!18258))

(assert (=> mapNonEmpty!59241 (= (arr!50130 _values!487) (store mapRest!59241 mapKey!59241 mapValue!59241))))

(declare-fun res!1067125 () Bool)

(assert (=> start!133494 (=> (not res!1067125) (not e!869656))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133494 (= res!1067125 (validMask!0 mask!947))))

(assert (=> start!133494 e!869656))

(assert (=> start!133494 true))

(declare-fun e!869655 () Bool)

(declare-fun array_inv!38969 (array!103876) Bool)

(assert (=> start!133494 (and (array_inv!38969 _values!487) e!869655)))

(declare-fun array_inv!38970 (array!103878) Bool)

(assert (=> start!133494 (array_inv!38970 _keys!637)))

(declare-fun b!1560615 () Bool)

(assert (=> b!1560615 (= e!869656 false)))

(declare-fun lt!671022 () Bool)

(declare-datatypes ((List!36403 0))(
  ( (Nil!36400) (Cons!36399 (h!37845 (_ BitVec 64)) (t!51136 List!36403)) )
))
(declare-fun arrayNoDuplicates!0 (array!103878 (_ BitVec 32) List!36403) Bool)

(assert (=> b!1560615 (= lt!671022 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36400))))

(declare-fun b!1560616 () Bool)

(assert (=> b!1560616 (= e!869655 (and e!869658 mapRes!59241))))

(declare-fun condMapEmpty!59241 () Bool)

(declare-fun mapDefault!59241 () ValueCell!18258)

(assert (=> b!1560616 (= condMapEmpty!59241 (= (arr!50130 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18258)) mapDefault!59241)))))

(declare-fun b!1560617 () Bool)

(declare-fun res!1067126 () Bool)

(assert (=> b!1560617 (=> (not res!1067126) (not e!869656))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103878 (_ BitVec 32)) Bool)

(assert (=> b!1560617 (= res!1067126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(assert (= (and start!133494 res!1067125) b!1560613))

(assert (= (and b!1560613 res!1067127) b!1560617))

(assert (= (and b!1560617 res!1067126) b!1560615))

(assert (= (and b!1560616 condMapEmpty!59241) mapIsEmpty!59241))

(assert (= (and b!1560616 (not condMapEmpty!59241)) mapNonEmpty!59241))

(get-info :version)

(assert (= (and mapNonEmpty!59241 ((_ is ValueCellFull!18258) mapValue!59241)) b!1560612))

(assert (= (and b!1560616 ((_ is ValueCellFull!18258) mapDefault!59241)) b!1560614))

(assert (= start!133494 b!1560616))

(declare-fun m!1436401 () Bool)

(assert (=> mapNonEmpty!59241 m!1436401))

(declare-fun m!1436403 () Bool)

(assert (=> start!133494 m!1436403))

(declare-fun m!1436405 () Bool)

(assert (=> start!133494 m!1436405))

(declare-fun m!1436407 () Bool)

(assert (=> start!133494 m!1436407))

(declare-fun m!1436409 () Bool)

(assert (=> b!1560615 m!1436409))

(declare-fun m!1436411 () Bool)

(assert (=> b!1560617 m!1436411))

(check-sat (not mapNonEmpty!59241) tp_is_empty!38577 (not b!1560617) (not start!133494) (not b!1560615))
(check-sat)
