; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97790 () Bool)

(assert start!97790)

(declare-fun b_free!23497 () Bool)

(declare-fun b_next!23497 () Bool)

(assert (=> start!97790 (= b_free!23497 (not b_next!23497))))

(declare-fun tp!83195 () Bool)

(declare-fun b_and!37755 () Bool)

(assert (=> start!97790 (= tp!83195 b_and!37755)))

(declare-fun b!1118729 () Bool)

(declare-fun res!747252 () Bool)

(declare-fun e!637173 () Bool)

(assert (=> b!1118729 (=> (not res!747252) (not e!637173))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1118729 (= res!747252 (validKeyInArray!0 k0!934))))

(declare-fun b!1118730 () Bool)

(declare-fun e!637175 () Bool)

(declare-fun tp_is_empty!28027 () Bool)

(assert (=> b!1118730 (= e!637175 tp_is_empty!28027)))

(declare-fun b!1118731 () Bool)

(declare-fun e!637179 () Bool)

(declare-fun e!637178 () Bool)

(declare-fun mapRes!43858 () Bool)

(assert (=> b!1118731 (= e!637179 (and e!637178 mapRes!43858))))

(declare-fun condMapEmpty!43858 () Bool)

(declare-datatypes ((V!42497 0))(
  ( (V!42498 (val!14070 Int)) )
))
(declare-datatypes ((ValueCell!13304 0))(
  ( (ValueCellFull!13304 (v!16702 V!42497)) (EmptyCell!13304) )
))
(declare-datatypes ((array!72848 0))(
  ( (array!72849 (arr!35077 (Array (_ BitVec 32) ValueCell!13304)) (size!35615 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72848)

(declare-fun mapDefault!43858 () ValueCell!13304)

(assert (=> b!1118731 (= condMapEmpty!43858 (= (arr!35077 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13304)) mapDefault!43858)))))

(declare-fun b!1118732 () Bool)

(declare-fun res!747256 () Bool)

(assert (=> b!1118732 (=> (not res!747256) (not e!637173))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!72850 0))(
  ( (array!72851 (arr!35078 (Array (_ BitVec 32) (_ BitVec 64))) (size!35616 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72850)

(assert (=> b!1118732 (= res!747256 (= (select (arr!35078 _keys!1208) i!673) k0!934))))

(declare-fun b!1118733 () Bool)

(declare-fun res!747248 () Bool)

(assert (=> b!1118733 (=> (not res!747248) (not e!637173))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72850 (_ BitVec 32)) Bool)

(assert (=> b!1118733 (= res!747248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1118734 () Bool)

(declare-fun res!747253 () Bool)

(assert (=> b!1118734 (=> (not res!747253) (not e!637173))))

(declare-datatypes ((List!24478 0))(
  ( (Nil!24475) (Cons!24474 (h!25683 (_ BitVec 64)) (t!34958 List!24478)) )
))
(declare-fun arrayNoDuplicates!0 (array!72850 (_ BitVec 32) List!24478) Bool)

(assert (=> b!1118734 (= res!747253 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24475))))

(declare-fun b!1118735 () Bool)

(declare-fun e!637176 () Bool)

(assert (=> b!1118735 (= e!637173 e!637176)))

(declare-fun res!747254 () Bool)

(assert (=> b!1118735 (=> (not res!747254) (not e!637176))))

(declare-fun lt!497397 () array!72850)

(assert (=> b!1118735 (= res!747254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497397 mask!1564))))

(assert (=> b!1118735 (= lt!497397 (array!72851 (store (arr!35078 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35616 _keys!1208)))))

(declare-fun b!1118736 () Bool)

(declare-fun res!747255 () Bool)

(assert (=> b!1118736 (=> (not res!747255) (not e!637173))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1118736 (= res!747255 (and (= (size!35615 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35616 _keys!1208) (size!35615 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1118737 () Bool)

(declare-fun e!637174 () Bool)

(assert (=> b!1118737 (= e!637176 (not e!637174))))

(declare-fun res!747249 () Bool)

(assert (=> b!1118737 (=> res!747249 e!637174)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1118737 (= res!747249 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!72850 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1118737 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36541 0))(
  ( (Unit!36542) )
))
(declare-fun lt!497396 () Unit!36541)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72850 (_ BitVec 64) (_ BitVec 32)) Unit!36541)

(assert (=> b!1118737 (= lt!497396 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!43858 () Bool)

(declare-fun tp!83194 () Bool)

(assert (=> mapNonEmpty!43858 (= mapRes!43858 (and tp!83194 e!637175))))

(declare-fun mapValue!43858 () ValueCell!13304)

(declare-fun mapRest!43858 () (Array (_ BitVec 32) ValueCell!13304))

(declare-fun mapKey!43858 () (_ BitVec 32))

(assert (=> mapNonEmpty!43858 (= (arr!35077 _values!996) (store mapRest!43858 mapKey!43858 mapValue!43858))))

(declare-fun b!1118738 () Bool)

(declare-fun res!747247 () Bool)

(assert (=> b!1118738 (=> (not res!747247) (not e!637173))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1118738 (= res!747247 (validMask!0 mask!1564))))

(declare-fun b!1118739 () Bool)

(assert (=> b!1118739 (= e!637174 true)))

(declare-fun zeroValue!944 () V!42497)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17712 0))(
  ( (tuple2!17713 (_1!8867 (_ BitVec 64)) (_2!8867 V!42497)) )
))
(declare-datatypes ((List!24479 0))(
  ( (Nil!24476) (Cons!24475 (h!25684 tuple2!17712) (t!34959 List!24479)) )
))
(declare-datatypes ((ListLongMap!15681 0))(
  ( (ListLongMap!15682 (toList!7856 List!24479)) )
))
(declare-fun lt!497394 () ListLongMap!15681)

(declare-fun minValue!944 () V!42497)

(declare-fun getCurrentListMapNoExtraKeys!4365 (array!72850 array!72848 (_ BitVec 32) (_ BitVec 32) V!42497 V!42497 (_ BitVec 32) Int) ListLongMap!15681)

(declare-fun dynLambda!2408 (Int (_ BitVec 64)) V!42497)

(assert (=> b!1118739 (= lt!497394 (getCurrentListMapNoExtraKeys!4365 lt!497397 (array!72849 (store (arr!35077 _values!996) i!673 (ValueCellFull!13304 (dynLambda!2408 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35615 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!497395 () ListLongMap!15681)

(assert (=> b!1118739 (= lt!497395 (getCurrentListMapNoExtraKeys!4365 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1118740 () Bool)

(assert (=> b!1118740 (= e!637178 tp_is_empty!28027)))

(declare-fun b!1118741 () Bool)

(declare-fun res!747251 () Bool)

(assert (=> b!1118741 (=> (not res!747251) (not e!637176))))

(assert (=> b!1118741 (= res!747251 (arrayNoDuplicates!0 lt!497397 #b00000000000000000000000000000000 Nil!24475))))

(declare-fun b!1118742 () Bool)

(declare-fun res!747246 () Bool)

(assert (=> b!1118742 (=> (not res!747246) (not e!637173))))

(assert (=> b!1118742 (= res!747246 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35616 _keys!1208))))))

(declare-fun res!747250 () Bool)

(assert (=> start!97790 (=> (not res!747250) (not e!637173))))

(assert (=> start!97790 (= res!747250 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35616 _keys!1208))))))

(assert (=> start!97790 e!637173))

(assert (=> start!97790 tp_is_empty!28027))

(declare-fun array_inv!27014 (array!72850) Bool)

(assert (=> start!97790 (array_inv!27014 _keys!1208)))

(assert (=> start!97790 true))

(assert (=> start!97790 tp!83195))

(declare-fun array_inv!27015 (array!72848) Bool)

(assert (=> start!97790 (and (array_inv!27015 _values!996) e!637179)))

(declare-fun mapIsEmpty!43858 () Bool)

(assert (=> mapIsEmpty!43858 mapRes!43858))

(assert (= (and start!97790 res!747250) b!1118738))

(assert (= (and b!1118738 res!747247) b!1118736))

(assert (= (and b!1118736 res!747255) b!1118733))

(assert (= (and b!1118733 res!747248) b!1118734))

(assert (= (and b!1118734 res!747253) b!1118742))

(assert (= (and b!1118742 res!747246) b!1118729))

(assert (= (and b!1118729 res!747252) b!1118732))

(assert (= (and b!1118732 res!747256) b!1118735))

(assert (= (and b!1118735 res!747254) b!1118741))

(assert (= (and b!1118741 res!747251) b!1118737))

(assert (= (and b!1118737 (not res!747249)) b!1118739))

(assert (= (and b!1118731 condMapEmpty!43858) mapIsEmpty!43858))

(assert (= (and b!1118731 (not condMapEmpty!43858)) mapNonEmpty!43858))

(get-info :version)

(assert (= (and mapNonEmpty!43858 ((_ is ValueCellFull!13304) mapValue!43858)) b!1118730))

(assert (= (and b!1118731 ((_ is ValueCellFull!13304) mapDefault!43858)) b!1118740))

(assert (= start!97790 b!1118731))

(declare-fun b_lambda!18449 () Bool)

(assert (=> (not b_lambda!18449) (not b!1118739)))

(declare-fun t!34957 () Bool)

(declare-fun tb!8301 () Bool)

(assert (=> (and start!97790 (= defaultEntry!1004 defaultEntry!1004) t!34957) tb!8301))

(declare-fun result!17171 () Bool)

(assert (=> tb!8301 (= result!17171 tp_is_empty!28027)))

(assert (=> b!1118739 t!34957))

(declare-fun b_and!37757 () Bool)

(assert (= b_and!37755 (and (=> t!34957 result!17171) b_and!37757)))

(declare-fun m!1033647 () Bool)

(assert (=> mapNonEmpty!43858 m!1033647))

(declare-fun m!1033649 () Bool)

(assert (=> start!97790 m!1033649))

(declare-fun m!1033651 () Bool)

(assert (=> start!97790 m!1033651))

(declare-fun m!1033653 () Bool)

(assert (=> b!1118739 m!1033653))

(declare-fun m!1033655 () Bool)

(assert (=> b!1118739 m!1033655))

(declare-fun m!1033657 () Bool)

(assert (=> b!1118739 m!1033657))

(declare-fun m!1033659 () Bool)

(assert (=> b!1118739 m!1033659))

(declare-fun m!1033661 () Bool)

(assert (=> b!1118735 m!1033661))

(declare-fun m!1033663 () Bool)

(assert (=> b!1118735 m!1033663))

(declare-fun m!1033665 () Bool)

(assert (=> b!1118734 m!1033665))

(declare-fun m!1033667 () Bool)

(assert (=> b!1118729 m!1033667))

(declare-fun m!1033669 () Bool)

(assert (=> b!1118733 m!1033669))

(declare-fun m!1033671 () Bool)

(assert (=> b!1118737 m!1033671))

(declare-fun m!1033673 () Bool)

(assert (=> b!1118737 m!1033673))

(declare-fun m!1033675 () Bool)

(assert (=> b!1118741 m!1033675))

(declare-fun m!1033677 () Bool)

(assert (=> b!1118732 m!1033677))

(declare-fun m!1033679 () Bool)

(assert (=> b!1118738 m!1033679))

(check-sat b_and!37757 (not b!1118729) (not mapNonEmpty!43858) (not start!97790) (not b!1118734) (not b!1118735) (not b_next!23497) tp_is_empty!28027 (not b_lambda!18449) (not b!1118739) (not b!1118733) (not b!1118741) (not b!1118738) (not b!1118737))
(check-sat b_and!37757 (not b_next!23497))
