; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134126 () Bool)

(assert start!134126)

(declare-fun b_free!32077 () Bool)

(declare-fun b_next!32077 () Bool)

(assert (=> start!134126 (= b_free!32077 (not b_next!32077))))

(declare-fun tp!113436 () Bool)

(declare-fun b_and!51649 () Bool)

(assert (=> start!134126 (= tp!113436 b_and!51649)))

(declare-fun b!1565861 () Bool)

(declare-fun res!1069694 () Bool)

(declare-fun e!872856 () Bool)

(assert (=> b!1565861 (=> (not res!1069694) (not e!872856))))

(declare-datatypes ((array!104416 0))(
  ( (array!104417 (arr!50393 (Array (_ BitVec 32) (_ BitVec 64))) (size!50944 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104416)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104416 (_ BitVec 32)) Bool)

(assert (=> b!1565861 (= res!1069694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1565862 () Bool)

(declare-fun res!1069696 () Bool)

(assert (=> b!1565862 (=> (not res!1069696) (not e!872856))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!59937 0))(
  ( (V!59938 (val!19482 Int)) )
))
(declare-datatypes ((ValueCell!18368 0))(
  ( (ValueCellFull!18368 (v!22226 V!59937)) (EmptyCell!18368) )
))
(declare-datatypes ((array!104418 0))(
  ( (array!104419 (arr!50394 (Array (_ BitVec 32) ValueCell!18368)) (size!50945 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104418)

(assert (=> b!1565862 (= res!1069696 (and (= (size!50945 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50944 _keys!637) (size!50945 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1565863 () Bool)

(declare-fun e!872855 () Bool)

(declare-fun tp_is_empty!38797 () Bool)

(assert (=> b!1565863 (= e!872855 tp_is_empty!38797)))

(declare-fun mapNonEmpty!59571 () Bool)

(declare-fun mapRes!59571 () Bool)

(declare-fun tp!113435 () Bool)

(declare-fun e!872852 () Bool)

(assert (=> mapNonEmpty!59571 (= mapRes!59571 (and tp!113435 e!872852))))

(declare-fun mapKey!59571 () (_ BitVec 32))

(declare-fun mapValue!59571 () ValueCell!18368)

(declare-fun mapRest!59571 () (Array (_ BitVec 32) ValueCell!18368))

(assert (=> mapNonEmpty!59571 (= (arr!50394 _values!487) (store mapRest!59571 mapKey!59571 mapValue!59571))))

(declare-fun b!1565864 () Bool)

(declare-fun e!872854 () Bool)

(assert (=> b!1565864 (= e!872854 (and e!872855 mapRes!59571))))

(declare-fun condMapEmpty!59571 () Bool)

(declare-fun mapDefault!59571 () ValueCell!18368)

(assert (=> b!1565864 (= condMapEmpty!59571 (= (arr!50394 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18368)) mapDefault!59571)))))

(declare-fun b!1565865 () Bool)

(declare-fun res!1069695 () Bool)

(assert (=> b!1565865 (=> (not res!1069695) (not e!872856))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1565865 (= res!1069695 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50944 _keys!637)) (bvslt from!782 (size!50944 _keys!637))))))

(declare-fun b!1565866 () Bool)

(declare-fun e!872857 () Bool)

(assert (=> b!1565866 (= e!872857 false)))

(declare-fun lt!672793 () Bool)

(declare-datatypes ((tuple2!25192 0))(
  ( (tuple2!25193 (_1!12607 (_ BitVec 64)) (_2!12607 V!59937)) )
))
(declare-datatypes ((List!36556 0))(
  ( (Nil!36553) (Cons!36552 (h!38016 tuple2!25192) (t!51395 List!36556)) )
))
(declare-datatypes ((ListLongMap!22635 0))(
  ( (ListLongMap!22636 (toList!11333 List!36556)) )
))
(declare-fun lt!672794 () ListLongMap!22635)

(declare-fun contains!10334 (ListLongMap!22635 (_ BitVec 64)) Bool)

(assert (=> b!1565866 (= lt!672793 (contains!10334 lt!672794 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!59571 () Bool)

(assert (=> mapIsEmpty!59571 mapRes!59571))

(declare-fun res!1069699 () Bool)

(assert (=> start!134126 (=> (not res!1069699) (not e!872856))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134126 (= res!1069699 (validMask!0 mask!947))))

(assert (=> start!134126 e!872856))

(assert (=> start!134126 tp!113436))

(assert (=> start!134126 tp_is_empty!38797))

(assert (=> start!134126 true))

(declare-fun array_inv!39407 (array!104416) Bool)

(assert (=> start!134126 (array_inv!39407 _keys!637)))

(declare-fun array_inv!39408 (array!104418) Bool)

(assert (=> start!134126 (and (array_inv!39408 _values!487) e!872854)))

(declare-fun b!1565867 () Bool)

(declare-fun res!1069698 () Bool)

(assert (=> b!1565867 (=> (not res!1069698) (not e!872856))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1565867 (= res!1069698 (not (validKeyInArray!0 (select (arr!50393 _keys!637) from!782))))))

(declare-fun b!1565868 () Bool)

(assert (=> b!1565868 (= e!872856 e!872857)))

(declare-fun res!1069697 () Bool)

(assert (=> b!1565868 (=> (not res!1069697) (not e!872857))))

(assert (=> b!1565868 (= res!1069697 (not (contains!10334 lt!672794 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!59937)

(declare-fun minValue!453 () V!59937)

(declare-fun getCurrentListMapNoExtraKeys!6730 (array!104416 array!104418 (_ BitVec 32) (_ BitVec 32) V!59937 V!59937 (_ BitVec 32) Int) ListLongMap!22635)

(assert (=> b!1565868 (= lt!672794 (getCurrentListMapNoExtraKeys!6730 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1565869 () Bool)

(declare-fun res!1069700 () Bool)

(assert (=> b!1565869 (=> (not res!1069700) (not e!872856))))

(declare-datatypes ((List!36557 0))(
  ( (Nil!36554) (Cons!36553 (h!38017 (_ BitVec 64)) (t!51396 List!36557)) )
))
(declare-fun arrayNoDuplicates!0 (array!104416 (_ BitVec 32) List!36557) Bool)

(assert (=> b!1565869 (= res!1069700 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36554))))

(declare-fun b!1565870 () Bool)

(assert (=> b!1565870 (= e!872852 tp_is_empty!38797)))

(assert (= (and start!134126 res!1069699) b!1565862))

(assert (= (and b!1565862 res!1069696) b!1565861))

(assert (= (and b!1565861 res!1069694) b!1565869))

(assert (= (and b!1565869 res!1069700) b!1565865))

(assert (= (and b!1565865 res!1069695) b!1565867))

(assert (= (and b!1565867 res!1069698) b!1565868))

(assert (= (and b!1565868 res!1069697) b!1565866))

(assert (= (and b!1565864 condMapEmpty!59571) mapIsEmpty!59571))

(assert (= (and b!1565864 (not condMapEmpty!59571)) mapNonEmpty!59571))

(get-info :version)

(assert (= (and mapNonEmpty!59571 ((_ is ValueCellFull!18368) mapValue!59571)) b!1565870))

(assert (= (and b!1565864 ((_ is ValueCellFull!18368) mapDefault!59571)) b!1565863))

(assert (= start!134126 b!1565864))

(declare-fun m!1441209 () Bool)

(assert (=> b!1565868 m!1441209))

(declare-fun m!1441211 () Bool)

(assert (=> b!1565868 m!1441211))

(declare-fun m!1441213 () Bool)

(assert (=> b!1565867 m!1441213))

(assert (=> b!1565867 m!1441213))

(declare-fun m!1441215 () Bool)

(assert (=> b!1565867 m!1441215))

(declare-fun m!1441217 () Bool)

(assert (=> mapNonEmpty!59571 m!1441217))

(declare-fun m!1441219 () Bool)

(assert (=> b!1565861 m!1441219))

(declare-fun m!1441221 () Bool)

(assert (=> start!134126 m!1441221))

(declare-fun m!1441223 () Bool)

(assert (=> start!134126 m!1441223))

(declare-fun m!1441225 () Bool)

(assert (=> start!134126 m!1441225))

(declare-fun m!1441227 () Bool)

(assert (=> b!1565866 m!1441227))

(declare-fun m!1441229 () Bool)

(assert (=> b!1565869 m!1441229))

(check-sat (not b!1565861) (not start!134126) (not b!1565867) (not b_next!32077) (not b!1565868) b_and!51649 (not b!1565866) (not mapNonEmpty!59571) tp_is_empty!38797 (not b!1565869))
(check-sat b_and!51649 (not b_next!32077))
