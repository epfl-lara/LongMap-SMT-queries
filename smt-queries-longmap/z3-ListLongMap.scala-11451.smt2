; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133454 () Bool)

(assert start!133454)

(declare-fun b!1560389 () Bool)

(declare-fun res!1067042 () Bool)

(declare-fun e!869534 () Bool)

(assert (=> b!1560389 (=> (not res!1067042) (not e!869534))))

(declare-datatypes ((array!103812 0))(
  ( (array!103813 (arr!50099 (Array (_ BitVec 32) (_ BitVec 64))) (size!50651 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103812)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103812 (_ BitVec 32)) Bool)

(assert (=> b!1560389 (= res!1067042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1560390 () Bool)

(assert (=> b!1560390 (= e!869534 false)))

(declare-fun lt!670751 () Bool)

(declare-datatypes ((List!36443 0))(
  ( (Nil!36440) (Cons!36439 (h!37886 (_ BitVec 64)) (t!51168 List!36443)) )
))
(declare-fun arrayNoDuplicates!0 (array!103812 (_ BitVec 32) List!36443) Bool)

(assert (=> b!1560390 (= lt!670751 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36440))))

(declare-fun b!1560391 () Bool)

(declare-fun e!869536 () Bool)

(declare-fun tp_is_empty!38587 () Bool)

(assert (=> b!1560391 (= e!869536 tp_is_empty!38587)))

(declare-fun b!1560392 () Bool)

(declare-fun e!869535 () Bool)

(declare-fun e!869533 () Bool)

(declare-fun mapRes!59256 () Bool)

(assert (=> b!1560392 (= e!869535 (and e!869533 mapRes!59256))))

(declare-fun condMapEmpty!59256 () Bool)

(declare-datatypes ((V!59657 0))(
  ( (V!59658 (val!19377 Int)) )
))
(declare-datatypes ((ValueCell!18263 0))(
  ( (ValueCellFull!18263 (v!22125 V!59657)) (EmptyCell!18263) )
))
(declare-datatypes ((array!103814 0))(
  ( (array!103815 (arr!50100 (Array (_ BitVec 32) ValueCell!18263)) (size!50652 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103814)

(declare-fun mapDefault!59256 () ValueCell!18263)

(assert (=> b!1560392 (= condMapEmpty!59256 (= (arr!50100 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18263)) mapDefault!59256)))))

(declare-fun res!1067041 () Bool)

(assert (=> start!133454 (=> (not res!1067041) (not e!869534))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133454 (= res!1067041 (validMask!0 mask!947))))

(assert (=> start!133454 e!869534))

(assert (=> start!133454 true))

(declare-fun array_inv!39137 (array!103814) Bool)

(assert (=> start!133454 (and (array_inv!39137 _values!487) e!869535)))

(declare-fun array_inv!39138 (array!103812) Bool)

(assert (=> start!133454 (array_inv!39138 _keys!637)))

(declare-fun b!1560393 () Bool)

(declare-fun res!1067043 () Bool)

(assert (=> b!1560393 (=> (not res!1067043) (not e!869534))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1560393 (= res!1067043 (and (= (size!50652 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50651 _keys!637) (size!50652 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1560394 () Bool)

(assert (=> b!1560394 (= e!869533 tp_is_empty!38587)))

(declare-fun mapIsEmpty!59256 () Bool)

(assert (=> mapIsEmpty!59256 mapRes!59256))

(declare-fun mapNonEmpty!59256 () Bool)

(declare-fun tp!112912 () Bool)

(assert (=> mapNonEmpty!59256 (= mapRes!59256 (and tp!112912 e!869536))))

(declare-fun mapKey!59256 () (_ BitVec 32))

(declare-fun mapRest!59256 () (Array (_ BitVec 32) ValueCell!18263))

(declare-fun mapValue!59256 () ValueCell!18263)

(assert (=> mapNonEmpty!59256 (= (arr!50100 _values!487) (store mapRest!59256 mapKey!59256 mapValue!59256))))

(assert (= (and start!133454 res!1067041) b!1560393))

(assert (= (and b!1560393 res!1067043) b!1560389))

(assert (= (and b!1560389 res!1067042) b!1560390))

(assert (= (and b!1560392 condMapEmpty!59256) mapIsEmpty!59256))

(assert (= (and b!1560392 (not condMapEmpty!59256)) mapNonEmpty!59256))

(get-info :version)

(assert (= (and mapNonEmpty!59256 ((_ is ValueCellFull!18263) mapValue!59256)) b!1560391))

(assert (= (and b!1560392 ((_ is ValueCellFull!18263) mapDefault!59256)) b!1560394))

(assert (= start!133454 b!1560392))

(declare-fun m!1435569 () Bool)

(assert (=> b!1560389 m!1435569))

(declare-fun m!1435571 () Bool)

(assert (=> b!1560390 m!1435571))

(declare-fun m!1435573 () Bool)

(assert (=> start!133454 m!1435573))

(declare-fun m!1435575 () Bool)

(assert (=> start!133454 m!1435575))

(declare-fun m!1435577 () Bool)

(assert (=> start!133454 m!1435577))

(declare-fun m!1435579 () Bool)

(assert (=> mapNonEmpty!59256 m!1435579))

(check-sat (not start!133454) (not b!1560390) tp_is_empty!38587 (not b!1560389) (not mapNonEmpty!59256))
(check-sat)
