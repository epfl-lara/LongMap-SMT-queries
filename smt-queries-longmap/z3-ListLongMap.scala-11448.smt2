; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133488 () Bool)

(assert start!133488)

(declare-fun mapNonEmpty!59232 () Bool)

(declare-fun mapRes!59232 () Bool)

(declare-fun tp!112887 () Bool)

(declare-fun e!869611 () Bool)

(assert (=> mapNonEmpty!59232 (= mapRes!59232 (and tp!112887 e!869611))))

(declare-datatypes ((V!59635 0))(
  ( (V!59636 (val!19369 Int)) )
))
(declare-datatypes ((ValueCell!18255 0))(
  ( (ValueCellFull!18255 (v!22121 V!59635)) (EmptyCell!18255) )
))
(declare-fun mapValue!59232 () ValueCell!18255)

(declare-fun mapKey!59232 () (_ BitVec 32))

(declare-datatypes ((array!103864 0))(
  ( (array!103865 (arr!50124 (Array (_ BitVec 32) ValueCell!18255)) (size!50674 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103864)

(declare-fun mapRest!59232 () (Array (_ BitVec 32) ValueCell!18255))

(assert (=> mapNonEmpty!59232 (= (arr!50124 _values!487) (store mapRest!59232 mapKey!59232 mapValue!59232))))

(declare-fun b!1560558 () Bool)

(declare-fun res!1067100 () Bool)

(declare-fun e!869614 () Bool)

(assert (=> b!1560558 (=> (not res!1067100) (not e!869614))))

(declare-datatypes ((array!103866 0))(
  ( (array!103867 (arr!50125 (Array (_ BitVec 32) (_ BitVec 64))) (size!50675 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103866)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103866 (_ BitVec 32)) Bool)

(assert (=> b!1560558 (= res!1067100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1560559 () Bool)

(declare-fun e!869610 () Bool)

(declare-fun tp_is_empty!38571 () Bool)

(assert (=> b!1560559 (= e!869610 tp_is_empty!38571)))

(declare-fun mapIsEmpty!59232 () Bool)

(assert (=> mapIsEmpty!59232 mapRes!59232))

(declare-fun b!1560560 () Bool)

(declare-fun e!869612 () Bool)

(assert (=> b!1560560 (= e!869612 (and e!869610 mapRes!59232))))

(declare-fun condMapEmpty!59232 () Bool)

(declare-fun mapDefault!59232 () ValueCell!18255)

(assert (=> b!1560560 (= condMapEmpty!59232 (= (arr!50124 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18255)) mapDefault!59232)))))

(declare-fun b!1560561 () Bool)

(assert (=> b!1560561 (= e!869611 tp_is_empty!38571)))

(declare-fun b!1560562 () Bool)

(declare-fun res!1067098 () Bool)

(assert (=> b!1560562 (=> (not res!1067098) (not e!869614))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1560562 (= res!1067098 (and (= (size!50674 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50675 _keys!637) (size!50674 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1560563 () Bool)

(assert (=> b!1560563 (= e!869614 false)))

(declare-fun lt!671013 () Bool)

(declare-datatypes ((List!36401 0))(
  ( (Nil!36398) (Cons!36397 (h!37843 (_ BitVec 64)) (t!51134 List!36401)) )
))
(declare-fun arrayNoDuplicates!0 (array!103866 (_ BitVec 32) List!36401) Bool)

(assert (=> b!1560563 (= lt!671013 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36398))))

(declare-fun res!1067099 () Bool)

(assert (=> start!133488 (=> (not res!1067099) (not e!869614))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133488 (= res!1067099 (validMask!0 mask!947))))

(assert (=> start!133488 e!869614))

(assert (=> start!133488 true))

(declare-fun array_inv!38965 (array!103864) Bool)

(assert (=> start!133488 (and (array_inv!38965 _values!487) e!869612)))

(declare-fun array_inv!38966 (array!103866) Bool)

(assert (=> start!133488 (array_inv!38966 _keys!637)))

(assert (= (and start!133488 res!1067099) b!1560562))

(assert (= (and b!1560562 res!1067098) b!1560558))

(assert (= (and b!1560558 res!1067100) b!1560563))

(assert (= (and b!1560560 condMapEmpty!59232) mapIsEmpty!59232))

(assert (= (and b!1560560 (not condMapEmpty!59232)) mapNonEmpty!59232))

(get-info :version)

(assert (= (and mapNonEmpty!59232 ((_ is ValueCellFull!18255) mapValue!59232)) b!1560561))

(assert (= (and b!1560560 ((_ is ValueCellFull!18255) mapDefault!59232)) b!1560559))

(assert (= start!133488 b!1560560))

(declare-fun m!1436365 () Bool)

(assert (=> mapNonEmpty!59232 m!1436365))

(declare-fun m!1436367 () Bool)

(assert (=> b!1560558 m!1436367))

(declare-fun m!1436369 () Bool)

(assert (=> b!1560563 m!1436369))

(declare-fun m!1436371 () Bool)

(assert (=> start!133488 m!1436371))

(declare-fun m!1436373 () Bool)

(assert (=> start!133488 m!1436373))

(declare-fun m!1436375 () Bool)

(assert (=> start!133488 m!1436375))

(check-sat (not start!133488) (not b!1560563) (not b!1560558) tp_is_empty!38571 (not mapNonEmpty!59232))
(check-sat)
