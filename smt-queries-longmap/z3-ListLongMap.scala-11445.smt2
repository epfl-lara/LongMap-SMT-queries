; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133470 () Bool)

(assert start!133470)

(declare-fun b!1560396 () Bool)

(declare-fun e!869479 () Bool)

(assert (=> b!1560396 (= e!869479 false)))

(declare-fun lt!670986 () Bool)

(declare-datatypes ((array!103830 0))(
  ( (array!103831 (arr!50107 (Array (_ BitVec 32) (_ BitVec 64))) (size!50657 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103830)

(declare-datatypes ((List!36395 0))(
  ( (Nil!36392) (Cons!36391 (h!37837 (_ BitVec 64)) (t!51128 List!36395)) )
))
(declare-fun arrayNoDuplicates!0 (array!103830 (_ BitVec 32) List!36395) Bool)

(assert (=> b!1560396 (= lt!670986 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36392))))

(declare-fun mapIsEmpty!59205 () Bool)

(declare-fun mapRes!59205 () Bool)

(assert (=> mapIsEmpty!59205 mapRes!59205))

(declare-fun b!1560397 () Bool)

(declare-fun e!869476 () Bool)

(declare-fun e!869477 () Bool)

(assert (=> b!1560397 (= e!869476 (and e!869477 mapRes!59205))))

(declare-fun condMapEmpty!59205 () Bool)

(declare-datatypes ((V!59611 0))(
  ( (V!59612 (val!19360 Int)) )
))
(declare-datatypes ((ValueCell!18246 0))(
  ( (ValueCellFull!18246 (v!22112 V!59611)) (EmptyCell!18246) )
))
(declare-datatypes ((array!103832 0))(
  ( (array!103833 (arr!50108 (Array (_ BitVec 32) ValueCell!18246)) (size!50658 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103832)

(declare-fun mapDefault!59205 () ValueCell!18246)

(assert (=> b!1560397 (= condMapEmpty!59205 (= (arr!50108 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18246)) mapDefault!59205)))))

(declare-fun res!1067017 () Bool)

(assert (=> start!133470 (=> (not res!1067017) (not e!869479))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133470 (= res!1067017 (validMask!0 mask!947))))

(assert (=> start!133470 e!869479))

(assert (=> start!133470 true))

(declare-fun array_inv!38951 (array!103832) Bool)

(assert (=> start!133470 (and (array_inv!38951 _values!487) e!869476)))

(declare-fun array_inv!38952 (array!103830) Bool)

(assert (=> start!133470 (array_inv!38952 _keys!637)))

(declare-fun b!1560398 () Bool)

(declare-fun tp_is_empty!38553 () Bool)

(assert (=> b!1560398 (= e!869477 tp_is_empty!38553)))

(declare-fun b!1560399 () Bool)

(declare-fun res!1067018 () Bool)

(assert (=> b!1560399 (=> (not res!1067018) (not e!869479))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1560399 (= res!1067018 (and (= (size!50658 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50657 _keys!637) (size!50658 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1560400 () Bool)

(declare-fun e!869475 () Bool)

(assert (=> b!1560400 (= e!869475 tp_is_empty!38553)))

(declare-fun mapNonEmpty!59205 () Bool)

(declare-fun tp!112860 () Bool)

(assert (=> mapNonEmpty!59205 (= mapRes!59205 (and tp!112860 e!869475))))

(declare-fun mapKey!59205 () (_ BitVec 32))

(declare-fun mapValue!59205 () ValueCell!18246)

(declare-fun mapRest!59205 () (Array (_ BitVec 32) ValueCell!18246))

(assert (=> mapNonEmpty!59205 (= (arr!50108 _values!487) (store mapRest!59205 mapKey!59205 mapValue!59205))))

(declare-fun b!1560401 () Bool)

(declare-fun res!1067019 () Bool)

(assert (=> b!1560401 (=> (not res!1067019) (not e!869479))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103830 (_ BitVec 32)) Bool)

(assert (=> b!1560401 (= res!1067019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(assert (= (and start!133470 res!1067017) b!1560399))

(assert (= (and b!1560399 res!1067018) b!1560401))

(assert (= (and b!1560401 res!1067019) b!1560396))

(assert (= (and b!1560397 condMapEmpty!59205) mapIsEmpty!59205))

(assert (= (and b!1560397 (not condMapEmpty!59205)) mapNonEmpty!59205))

(get-info :version)

(assert (= (and mapNonEmpty!59205 ((_ is ValueCellFull!18246) mapValue!59205)) b!1560400))

(assert (= (and b!1560397 ((_ is ValueCellFull!18246) mapDefault!59205)) b!1560398))

(assert (= start!133470 b!1560397))

(declare-fun m!1436257 () Bool)

(assert (=> b!1560396 m!1436257))

(declare-fun m!1436259 () Bool)

(assert (=> start!133470 m!1436259))

(declare-fun m!1436261 () Bool)

(assert (=> start!133470 m!1436261))

(declare-fun m!1436263 () Bool)

(assert (=> start!133470 m!1436263))

(declare-fun m!1436265 () Bool)

(assert (=> mapNonEmpty!59205 m!1436265))

(declare-fun m!1436267 () Bool)

(assert (=> b!1560401 m!1436267))

(check-sat (not start!133470) (not b!1560396) (not b!1560401) tp_is_empty!38553 (not mapNonEmpty!59205))
(check-sat)
