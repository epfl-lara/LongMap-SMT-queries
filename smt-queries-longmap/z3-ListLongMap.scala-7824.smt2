; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97690 () Bool)

(assert start!97690)

(declare-fun b!1116693 () Bool)

(declare-fun e!636211 () Bool)

(declare-fun e!636212 () Bool)

(assert (=> b!1116693 (= e!636211 e!636212)))

(declare-fun res!745634 () Bool)

(assert (=> b!1116693 (=> (not res!745634) (not e!636212))))

(declare-datatypes ((array!72739 0))(
  ( (array!72740 (arr!35022 (Array (_ BitVec 32) (_ BitVec 64))) (size!35558 (_ BitVec 32))) )
))
(declare-fun lt!497173 () array!72739)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72739 (_ BitVec 32)) Bool)

(assert (=> b!1116693 (= res!745634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497173 mask!1564))))

(declare-fun _keys!1208 () array!72739)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1116693 (= lt!497173 (array!72740 (store (arr!35022 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35558 _keys!1208)))))

(declare-fun b!1116694 () Bool)

(declare-fun e!636210 () Bool)

(declare-fun tp_is_empty!27921 () Bool)

(assert (=> b!1116694 (= e!636210 tp_is_empty!27921)))

(declare-fun b!1116695 () Bool)

(declare-fun e!636209 () Bool)

(declare-fun e!636208 () Bool)

(declare-fun mapRes!43699 () Bool)

(assert (=> b!1116695 (= e!636209 (and e!636208 mapRes!43699))))

(declare-fun condMapEmpty!43699 () Bool)

(declare-datatypes ((V!42355 0))(
  ( (V!42356 (val!14017 Int)) )
))
(declare-datatypes ((ValueCell!13251 0))(
  ( (ValueCellFull!13251 (v!16650 V!42355)) (EmptyCell!13251) )
))
(declare-datatypes ((array!72741 0))(
  ( (array!72742 (arr!35023 (Array (_ BitVec 32) ValueCell!13251)) (size!35559 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72741)

(declare-fun mapDefault!43699 () ValueCell!13251)

(assert (=> b!1116695 (= condMapEmpty!43699 (= (arr!35023 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13251)) mapDefault!43699)))))

(declare-fun mapIsEmpty!43699 () Bool)

(assert (=> mapIsEmpty!43699 mapRes!43699))

(declare-fun mapNonEmpty!43699 () Bool)

(declare-fun tp!82943 () Bool)

(assert (=> mapNonEmpty!43699 (= mapRes!43699 (and tp!82943 e!636210))))

(declare-fun mapRest!43699 () (Array (_ BitVec 32) ValueCell!13251))

(declare-fun mapValue!43699 () ValueCell!13251)

(declare-fun mapKey!43699 () (_ BitVec 32))

(assert (=> mapNonEmpty!43699 (= (arr!35023 _values!996) (store mapRest!43699 mapKey!43699 mapValue!43699))))

(declare-fun res!745639 () Bool)

(assert (=> start!97690 (=> (not res!745639) (not e!636211))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97690 (= res!745639 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35558 _keys!1208))))))

(assert (=> start!97690 e!636211))

(declare-fun array_inv!26916 (array!72739) Bool)

(assert (=> start!97690 (array_inv!26916 _keys!1208)))

(assert (=> start!97690 true))

(declare-fun array_inv!26917 (array!72741) Bool)

(assert (=> start!97690 (and (array_inv!26917 _values!996) e!636209)))

(declare-fun b!1116696 () Bool)

(declare-fun res!745640 () Bool)

(assert (=> b!1116696 (=> (not res!745640) (not e!636211))))

(assert (=> b!1116696 (= res!745640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1116697 () Bool)

(declare-fun res!745638 () Bool)

(assert (=> b!1116697 (=> (not res!745638) (not e!636211))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1116697 (= res!745638 (and (= (size!35559 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35558 _keys!1208) (size!35559 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1116698 () Bool)

(declare-fun res!745633 () Bool)

(assert (=> b!1116698 (=> (not res!745633) (not e!636212))))

(declare-datatypes ((List!24373 0))(
  ( (Nil!24370) (Cons!24369 (h!25578 (_ BitVec 64)) (t!34854 List!24373)) )
))
(declare-fun arrayNoDuplicates!0 (array!72739 (_ BitVec 32) List!24373) Bool)

(assert (=> b!1116698 (= res!745633 (arrayNoDuplicates!0 lt!497173 #b00000000000000000000000000000000 Nil!24370))))

(declare-fun b!1116699 () Bool)

(declare-fun res!745641 () Bool)

(assert (=> b!1116699 (=> (not res!745641) (not e!636211))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1116699 (= res!745641 (= (select (arr!35022 _keys!1208) i!673) k0!934))))

(declare-fun b!1116700 () Bool)

(declare-fun res!745642 () Bool)

(assert (=> b!1116700 (=> (not res!745642) (not e!636211))))

(assert (=> b!1116700 (= res!745642 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24370))))

(declare-fun b!1116701 () Bool)

(declare-fun res!745635 () Bool)

(assert (=> b!1116701 (=> (not res!745635) (not e!636211))))

(assert (=> b!1116701 (= res!745635 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35558 _keys!1208))))))

(declare-fun b!1116702 () Bool)

(declare-fun res!745636 () Bool)

(assert (=> b!1116702 (=> (not res!745636) (not e!636211))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1116702 (= res!745636 (validMask!0 mask!1564))))

(declare-fun b!1116703 () Bool)

(assert (=> b!1116703 (= e!636208 tp_is_empty!27921)))

(declare-fun b!1116704 () Bool)

(assert (=> b!1116704 (= e!636212 (not true))))

(declare-fun arrayContainsKey!0 (array!72739 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1116704 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36646 0))(
  ( (Unit!36647) )
))
(declare-fun lt!497174 () Unit!36646)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72739 (_ BitVec 64) (_ BitVec 32)) Unit!36646)

(assert (=> b!1116704 (= lt!497174 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1116705 () Bool)

(declare-fun res!745637 () Bool)

(assert (=> b!1116705 (=> (not res!745637) (not e!636211))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1116705 (= res!745637 (validKeyInArray!0 k0!934))))

(assert (= (and start!97690 res!745639) b!1116702))

(assert (= (and b!1116702 res!745636) b!1116697))

(assert (= (and b!1116697 res!745638) b!1116696))

(assert (= (and b!1116696 res!745640) b!1116700))

(assert (= (and b!1116700 res!745642) b!1116701))

(assert (= (and b!1116701 res!745635) b!1116705))

(assert (= (and b!1116705 res!745637) b!1116699))

(assert (= (and b!1116699 res!745641) b!1116693))

(assert (= (and b!1116693 res!745634) b!1116698))

(assert (= (and b!1116698 res!745633) b!1116704))

(assert (= (and b!1116695 condMapEmpty!43699) mapIsEmpty!43699))

(assert (= (and b!1116695 (not condMapEmpty!43699)) mapNonEmpty!43699))

(get-info :version)

(assert (= (and mapNonEmpty!43699 ((_ is ValueCellFull!13251) mapValue!43699)) b!1116694))

(assert (= (and b!1116695 ((_ is ValueCellFull!13251) mapDefault!43699)) b!1116703))

(assert (= start!97690 b!1116695))

(declare-fun m!1032817 () Bool)

(assert (=> mapNonEmpty!43699 m!1032817))

(declare-fun m!1032819 () Bool)

(assert (=> b!1116704 m!1032819))

(declare-fun m!1032821 () Bool)

(assert (=> b!1116704 m!1032821))

(declare-fun m!1032823 () Bool)

(assert (=> b!1116702 m!1032823))

(declare-fun m!1032825 () Bool)

(assert (=> b!1116700 m!1032825))

(declare-fun m!1032827 () Bool)

(assert (=> b!1116699 m!1032827))

(declare-fun m!1032829 () Bool)

(assert (=> b!1116693 m!1032829))

(declare-fun m!1032831 () Bool)

(assert (=> b!1116693 m!1032831))

(declare-fun m!1032833 () Bool)

(assert (=> b!1116705 m!1032833))

(declare-fun m!1032835 () Bool)

(assert (=> b!1116698 m!1032835))

(declare-fun m!1032837 () Bool)

(assert (=> b!1116696 m!1032837))

(declare-fun m!1032839 () Bool)

(assert (=> start!97690 m!1032839))

(declare-fun m!1032841 () Bool)

(assert (=> start!97690 m!1032841))

(check-sat (not b!1116696) (not b!1116700) tp_is_empty!27921 (not b!1116693) (not b!1116702) (not mapNonEmpty!43699) (not b!1116705) (not b!1116704) (not start!97690) (not b!1116698))
(check-sat)
