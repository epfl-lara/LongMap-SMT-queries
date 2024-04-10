; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133506 () Bool)

(assert start!133506)

(declare-fun b!1560720 () Bool)

(declare-fun e!869747 () Bool)

(declare-fun e!869749 () Bool)

(declare-fun mapRes!59259 () Bool)

(assert (=> b!1560720 (= e!869747 (and e!869749 mapRes!59259))))

(declare-fun condMapEmpty!59259 () Bool)

(declare-datatypes ((V!59659 0))(
  ( (V!59660 (val!19378 Int)) )
))
(declare-datatypes ((ValueCell!18264 0))(
  ( (ValueCellFull!18264 (v!22130 V!59659)) (EmptyCell!18264) )
))
(declare-datatypes ((array!103898 0))(
  ( (array!103899 (arr!50141 (Array (_ BitVec 32) ValueCell!18264)) (size!50691 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103898)

(declare-fun mapDefault!59259 () ValueCell!18264)

(assert (=> b!1560720 (= condMapEmpty!59259 (= (arr!50141 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18264)) mapDefault!59259)))))

(declare-fun res!1067181 () Bool)

(declare-fun e!869748 () Bool)

(assert (=> start!133506 (=> (not res!1067181) (not e!869748))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133506 (= res!1067181 (validMask!0 mask!947))))

(assert (=> start!133506 e!869748))

(assert (=> start!133506 true))

(declare-fun array_inv!38977 (array!103898) Bool)

(assert (=> start!133506 (and (array_inv!38977 _values!487) e!869747)))

(declare-datatypes ((array!103900 0))(
  ( (array!103901 (arr!50142 (Array (_ BitVec 32) (_ BitVec 64))) (size!50692 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103900)

(declare-fun array_inv!38978 (array!103900) Bool)

(assert (=> start!133506 (array_inv!38978 _keys!637)))

(declare-fun b!1560721 () Bool)

(assert (=> b!1560721 (= e!869748 false)))

(declare-fun lt!671040 () Bool)

(declare-datatypes ((List!36407 0))(
  ( (Nil!36404) (Cons!36403 (h!37849 (_ BitVec 64)) (t!51140 List!36407)) )
))
(declare-fun arrayNoDuplicates!0 (array!103900 (_ BitVec 32) List!36407) Bool)

(assert (=> b!1560721 (= lt!671040 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36404))))

(declare-fun mapIsEmpty!59259 () Bool)

(assert (=> mapIsEmpty!59259 mapRes!59259))

(declare-fun b!1560722 () Bool)

(declare-fun e!869745 () Bool)

(declare-fun tp_is_empty!38589 () Bool)

(assert (=> b!1560722 (= e!869745 tp_is_empty!38589)))

(declare-fun mapNonEmpty!59259 () Bool)

(declare-fun tp!112914 () Bool)

(assert (=> mapNonEmpty!59259 (= mapRes!59259 (and tp!112914 e!869745))))

(declare-fun mapRest!59259 () (Array (_ BitVec 32) ValueCell!18264))

(declare-fun mapValue!59259 () ValueCell!18264)

(declare-fun mapKey!59259 () (_ BitVec 32))

(assert (=> mapNonEmpty!59259 (= (arr!50141 _values!487) (store mapRest!59259 mapKey!59259 mapValue!59259))))

(declare-fun b!1560723 () Bool)

(declare-fun res!1067179 () Bool)

(assert (=> b!1560723 (=> (not res!1067179) (not e!869748))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1560723 (= res!1067179 (and (= (size!50691 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50692 _keys!637) (size!50691 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1560724 () Bool)

(declare-fun res!1067180 () Bool)

(assert (=> b!1560724 (=> (not res!1067180) (not e!869748))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103900 (_ BitVec 32)) Bool)

(assert (=> b!1560724 (= res!1067180 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1560725 () Bool)

(assert (=> b!1560725 (= e!869749 tp_is_empty!38589)))

(assert (= (and start!133506 res!1067181) b!1560723))

(assert (= (and b!1560723 res!1067179) b!1560724))

(assert (= (and b!1560724 res!1067180) b!1560721))

(assert (= (and b!1560720 condMapEmpty!59259) mapIsEmpty!59259))

(assert (= (and b!1560720 (not condMapEmpty!59259)) mapNonEmpty!59259))

(get-info :version)

(assert (= (and mapNonEmpty!59259 ((_ is ValueCellFull!18264) mapValue!59259)) b!1560722))

(assert (= (and b!1560720 ((_ is ValueCellFull!18264) mapDefault!59259)) b!1560725))

(assert (= start!133506 b!1560720))

(declare-fun m!1436473 () Bool)

(assert (=> start!133506 m!1436473))

(declare-fun m!1436475 () Bool)

(assert (=> start!133506 m!1436475))

(declare-fun m!1436477 () Bool)

(assert (=> start!133506 m!1436477))

(declare-fun m!1436479 () Bool)

(assert (=> b!1560721 m!1436479))

(declare-fun m!1436481 () Bool)

(assert (=> mapNonEmpty!59259 m!1436481))

(declare-fun m!1436483 () Bool)

(assert (=> b!1560724 m!1436483))

(check-sat (not start!133506) (not b!1560724) (not b!1560721) tp_is_empty!38589 (not mapNonEmpty!59259))
(check-sat)
