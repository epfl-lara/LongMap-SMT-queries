; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133512 () Bool)

(assert start!133512)

(declare-fun b!1560774 () Bool)

(declare-fun res!1067208 () Bool)

(declare-fun e!869790 () Bool)

(assert (=> b!1560774 (=> (not res!1067208) (not e!869790))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!103908 0))(
  ( (array!103909 (arr!50146 (Array (_ BitVec 32) (_ BitVec 64))) (size!50696 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103908)

(declare-datatypes ((V!59667 0))(
  ( (V!59668 (val!19381 Int)) )
))
(declare-datatypes ((ValueCell!18267 0))(
  ( (ValueCellFull!18267 (v!22133 V!59667)) (EmptyCell!18267) )
))
(declare-datatypes ((array!103910 0))(
  ( (array!103911 (arr!50147 (Array (_ BitVec 32) ValueCell!18267)) (size!50697 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103910)

(assert (=> b!1560774 (= res!1067208 (and (= (size!50697 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50696 _keys!637) (size!50697 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun res!1067207 () Bool)

(assert (=> start!133512 (=> (not res!1067207) (not e!869790))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133512 (= res!1067207 (validMask!0 mask!947))))

(assert (=> start!133512 e!869790))

(assert (=> start!133512 true))

(declare-fun e!869793 () Bool)

(declare-fun array_inv!38981 (array!103910) Bool)

(assert (=> start!133512 (and (array_inv!38981 _values!487) e!869793)))

(declare-fun array_inv!38982 (array!103908) Bool)

(assert (=> start!133512 (array_inv!38982 _keys!637)))

(declare-fun mapIsEmpty!59268 () Bool)

(declare-fun mapRes!59268 () Bool)

(assert (=> mapIsEmpty!59268 mapRes!59268))

(declare-fun b!1560775 () Bool)

(assert (=> b!1560775 (= e!869790 false)))

(declare-fun lt!671049 () Bool)

(declare-datatypes ((List!36408 0))(
  ( (Nil!36405) (Cons!36404 (h!37850 (_ BitVec 64)) (t!51141 List!36408)) )
))
(declare-fun arrayNoDuplicates!0 (array!103908 (_ BitVec 32) List!36408) Bool)

(assert (=> b!1560775 (= lt!671049 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36405))))

(declare-fun b!1560776 () Bool)

(declare-fun res!1067206 () Bool)

(assert (=> b!1560776 (=> (not res!1067206) (not e!869790))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103908 (_ BitVec 32)) Bool)

(assert (=> b!1560776 (= res!1067206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1560777 () Bool)

(declare-fun e!869791 () Bool)

(assert (=> b!1560777 (= e!869793 (and e!869791 mapRes!59268))))

(declare-fun condMapEmpty!59268 () Bool)

(declare-fun mapDefault!59268 () ValueCell!18267)

(assert (=> b!1560777 (= condMapEmpty!59268 (= (arr!50147 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18267)) mapDefault!59268)))))

(declare-fun b!1560778 () Bool)

(declare-fun e!869792 () Bool)

(declare-fun tp_is_empty!38595 () Bool)

(assert (=> b!1560778 (= e!869792 tp_is_empty!38595)))

(declare-fun b!1560779 () Bool)

(assert (=> b!1560779 (= e!869791 tp_is_empty!38595)))

(declare-fun mapNonEmpty!59268 () Bool)

(declare-fun tp!112923 () Bool)

(assert (=> mapNonEmpty!59268 (= mapRes!59268 (and tp!112923 e!869792))))

(declare-fun mapKey!59268 () (_ BitVec 32))

(declare-fun mapRest!59268 () (Array (_ BitVec 32) ValueCell!18267))

(declare-fun mapValue!59268 () ValueCell!18267)

(assert (=> mapNonEmpty!59268 (= (arr!50147 _values!487) (store mapRest!59268 mapKey!59268 mapValue!59268))))

(assert (= (and start!133512 res!1067207) b!1560774))

(assert (= (and b!1560774 res!1067208) b!1560776))

(assert (= (and b!1560776 res!1067206) b!1560775))

(assert (= (and b!1560777 condMapEmpty!59268) mapIsEmpty!59268))

(assert (= (and b!1560777 (not condMapEmpty!59268)) mapNonEmpty!59268))

(get-info :version)

(assert (= (and mapNonEmpty!59268 ((_ is ValueCellFull!18267) mapValue!59268)) b!1560778))

(assert (= (and b!1560777 ((_ is ValueCellFull!18267) mapDefault!59268)) b!1560779))

(assert (= start!133512 b!1560777))

(declare-fun m!1436509 () Bool)

(assert (=> start!133512 m!1436509))

(declare-fun m!1436511 () Bool)

(assert (=> start!133512 m!1436511))

(declare-fun m!1436513 () Bool)

(assert (=> start!133512 m!1436513))

(declare-fun m!1436515 () Bool)

(assert (=> b!1560775 m!1436515))

(declare-fun m!1436517 () Bool)

(assert (=> b!1560776 m!1436517))

(declare-fun m!1436519 () Bool)

(assert (=> mapNonEmpty!59268 m!1436519))

(check-sat tp_is_empty!38595 (not b!1560775) (not b!1560776) (not start!133512) (not mapNonEmpty!59268))
(check-sat)
