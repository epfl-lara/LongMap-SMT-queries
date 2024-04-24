; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100200 () Bool)

(assert start!100200)

(declare-fun b_free!25543 () Bool)

(declare-fun b_next!25543 () Bool)

(assert (=> start!100200 (= b_free!25543 (not b_next!25543))))

(declare-fun tp!89343 () Bool)

(declare-fun b_and!41955 () Bool)

(assert (=> start!100200 (= tp!89343 b_and!41955)))

(declare-fun b!1191723 () Bool)

(declare-fun res!792219 () Bool)

(declare-fun e!677587 () Bool)

(assert (=> b!1191723 (=> (not res!792219) (not e!677587))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1191723 (= res!792219 (validKeyInArray!0 k0!934))))

(declare-fun res!792226 () Bool)

(assert (=> start!100200 (=> (not res!792226) (not e!677587))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!76981 0))(
  ( (array!76982 (arr!37134 (Array (_ BitVec 32) (_ BitVec 64))) (size!37671 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76981)

(assert (=> start!100200 (= res!792226 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37671 _keys!1208))))))

(assert (=> start!100200 e!677587))

(declare-fun tp_is_empty!30073 () Bool)

(assert (=> start!100200 tp_is_empty!30073))

(declare-fun array_inv!28384 (array!76981) Bool)

(assert (=> start!100200 (array_inv!28384 _keys!1208)))

(assert (=> start!100200 true))

(assert (=> start!100200 tp!89343))

(declare-datatypes ((V!45225 0))(
  ( (V!45226 (val!15093 Int)) )
))
(declare-datatypes ((ValueCell!14327 0))(
  ( (ValueCellFull!14327 (v!17727 V!45225)) (EmptyCell!14327) )
))
(declare-datatypes ((array!76983 0))(
  ( (array!76984 (arr!37135 (Array (_ BitVec 32) ValueCell!14327)) (size!37672 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76983)

(declare-fun e!677594 () Bool)

(declare-fun array_inv!28385 (array!76983) Bool)

(assert (=> start!100200 (and (array_inv!28385 _values!996) e!677594)))

(declare-fun b!1191724 () Bool)

(declare-fun e!677593 () Bool)

(assert (=> b!1191724 (= e!677593 true)))

(declare-fun zeroValue!944 () V!45225)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!541933 () array!76983)

(declare-fun minValue!944 () V!45225)

(declare-fun lt!541931 () array!76981)

(declare-datatypes ((tuple2!19420 0))(
  ( (tuple2!19421 (_1!9721 (_ BitVec 64)) (_2!9721 V!45225)) )
))
(declare-datatypes ((List!26164 0))(
  ( (Nil!26161) (Cons!26160 (h!27378 tuple2!19420) (t!38691 List!26164)) )
))
(declare-datatypes ((ListLongMap!17397 0))(
  ( (ListLongMap!17398 (toList!8714 List!26164)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5182 (array!76981 array!76983 (_ BitVec 32) (_ BitVec 32) V!45225 V!45225 (_ BitVec 32) Int) ListLongMap!17397)

(declare-fun -!1726 (ListLongMap!17397 (_ BitVec 64)) ListLongMap!17397)

(assert (=> b!1191724 (= (getCurrentListMapNoExtraKeys!5182 lt!541931 lt!541933 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1726 (getCurrentListMapNoExtraKeys!5182 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!39475 0))(
  ( (Unit!39476) )
))
(declare-fun lt!541934 () Unit!39475)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!941 (array!76981 array!76983 (_ BitVec 32) (_ BitVec 32) V!45225 V!45225 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39475)

(assert (=> b!1191724 (= lt!541934 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!941 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!46937 () Bool)

(declare-fun mapRes!46937 () Bool)

(declare-fun tp!89342 () Bool)

(declare-fun e!677592 () Bool)

(assert (=> mapNonEmpty!46937 (= mapRes!46937 (and tp!89342 e!677592))))

(declare-fun mapValue!46937 () ValueCell!14327)

(declare-fun mapKey!46937 () (_ BitVec 32))

(declare-fun mapRest!46937 () (Array (_ BitVec 32) ValueCell!14327))

(assert (=> mapNonEmpty!46937 (= (arr!37135 _values!996) (store mapRest!46937 mapKey!46937 mapValue!46937))))

(declare-fun b!1191725 () Bool)

(declare-fun e!677590 () Bool)

(assert (=> b!1191725 (= e!677590 e!677593)))

(declare-fun res!792223 () Bool)

(assert (=> b!1191725 (=> res!792223 e!677593)))

(assert (=> b!1191725 (= res!792223 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!541936 () ListLongMap!17397)

(assert (=> b!1191725 (= lt!541936 (getCurrentListMapNoExtraKeys!5182 lt!541931 lt!541933 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3139 (Int (_ BitVec 64)) V!45225)

(assert (=> b!1191725 (= lt!541933 (array!76984 (store (arr!37135 _values!996) i!673 (ValueCellFull!14327 (dynLambda!3139 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37672 _values!996)))))

(declare-fun lt!541932 () ListLongMap!17397)

(assert (=> b!1191725 (= lt!541932 (getCurrentListMapNoExtraKeys!5182 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1191726 () Bool)

(declare-fun res!792218 () Bool)

(assert (=> b!1191726 (=> (not res!792218) (not e!677587))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1191726 (= res!792218 (validMask!0 mask!1564))))

(declare-fun b!1191727 () Bool)

(declare-fun res!792225 () Bool)

(assert (=> b!1191727 (=> (not res!792225) (not e!677587))))

(assert (=> b!1191727 (= res!792225 (and (= (size!37672 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37671 _keys!1208) (size!37672 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1191728 () Bool)

(declare-fun res!792216 () Bool)

(declare-fun e!677591 () Bool)

(assert (=> b!1191728 (=> (not res!792216) (not e!677591))))

(declare-datatypes ((List!26165 0))(
  ( (Nil!26162) (Cons!26161 (h!27379 (_ BitVec 64)) (t!38692 List!26165)) )
))
(declare-fun arrayNoDuplicates!0 (array!76981 (_ BitVec 32) List!26165) Bool)

(assert (=> b!1191728 (= res!792216 (arrayNoDuplicates!0 lt!541931 #b00000000000000000000000000000000 Nil!26162))))

(declare-fun b!1191729 () Bool)

(declare-fun res!792217 () Bool)

(assert (=> b!1191729 (=> (not res!792217) (not e!677587))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76981 (_ BitVec 32)) Bool)

(assert (=> b!1191729 (= res!792217 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1191730 () Bool)

(declare-fun res!792224 () Bool)

(assert (=> b!1191730 (=> (not res!792224) (not e!677587))))

(assert (=> b!1191730 (= res!792224 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26162))))

(declare-fun b!1191731 () Bool)

(assert (=> b!1191731 (= e!677591 (not e!677590))))

(declare-fun res!792222 () Bool)

(assert (=> b!1191731 (=> res!792222 e!677590)))

(assert (=> b!1191731 (= res!792222 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76981 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1191731 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!541935 () Unit!39475)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76981 (_ BitVec 64) (_ BitVec 32)) Unit!39475)

(assert (=> b!1191731 (= lt!541935 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1191732 () Bool)

(declare-fun res!792221 () Bool)

(assert (=> b!1191732 (=> (not res!792221) (not e!677587))))

(assert (=> b!1191732 (= res!792221 (= (select (arr!37134 _keys!1208) i!673) k0!934))))

(declare-fun b!1191733 () Bool)

(assert (=> b!1191733 (= e!677592 tp_is_empty!30073)))

(declare-fun b!1191734 () Bool)

(declare-fun res!792220 () Bool)

(assert (=> b!1191734 (=> (not res!792220) (not e!677587))))

(assert (=> b!1191734 (= res!792220 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37671 _keys!1208))))))

(declare-fun b!1191735 () Bool)

(declare-fun e!677589 () Bool)

(assert (=> b!1191735 (= e!677589 tp_is_empty!30073)))

(declare-fun mapIsEmpty!46937 () Bool)

(assert (=> mapIsEmpty!46937 mapRes!46937))

(declare-fun b!1191736 () Bool)

(assert (=> b!1191736 (= e!677594 (and e!677589 mapRes!46937))))

(declare-fun condMapEmpty!46937 () Bool)

(declare-fun mapDefault!46937 () ValueCell!14327)

(assert (=> b!1191736 (= condMapEmpty!46937 (= (arr!37135 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14327)) mapDefault!46937)))))

(declare-fun b!1191737 () Bool)

(assert (=> b!1191737 (= e!677587 e!677591)))

(declare-fun res!792227 () Bool)

(assert (=> b!1191737 (=> (not res!792227) (not e!677591))))

(assert (=> b!1191737 (= res!792227 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541931 mask!1564))))

(assert (=> b!1191737 (= lt!541931 (array!76982 (store (arr!37134 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37671 _keys!1208)))))

(assert (= (and start!100200 res!792226) b!1191726))

(assert (= (and b!1191726 res!792218) b!1191727))

(assert (= (and b!1191727 res!792225) b!1191729))

(assert (= (and b!1191729 res!792217) b!1191730))

(assert (= (and b!1191730 res!792224) b!1191734))

(assert (= (and b!1191734 res!792220) b!1191723))

(assert (= (and b!1191723 res!792219) b!1191732))

(assert (= (and b!1191732 res!792221) b!1191737))

(assert (= (and b!1191737 res!792227) b!1191728))

(assert (= (and b!1191728 res!792216) b!1191731))

(assert (= (and b!1191731 (not res!792222)) b!1191725))

(assert (= (and b!1191725 (not res!792223)) b!1191724))

(assert (= (and b!1191736 condMapEmpty!46937) mapIsEmpty!46937))

(assert (= (and b!1191736 (not condMapEmpty!46937)) mapNonEmpty!46937))

(get-info :version)

(assert (= (and mapNonEmpty!46937 ((_ is ValueCellFull!14327) mapValue!46937)) b!1191733))

(assert (= (and b!1191736 ((_ is ValueCellFull!14327) mapDefault!46937)) b!1191735))

(assert (= start!100200 b!1191736))

(declare-fun b_lambda!20681 () Bool)

(assert (=> (not b_lambda!20681) (not b!1191725)))

(declare-fun t!38690 () Bool)

(declare-fun tb!10347 () Bool)

(assert (=> (and start!100200 (= defaultEntry!1004 defaultEntry!1004) t!38690) tb!10347))

(declare-fun result!21269 () Bool)

(assert (=> tb!10347 (= result!21269 tp_is_empty!30073)))

(assert (=> b!1191725 t!38690))

(declare-fun b_and!41957 () Bool)

(assert (= b_and!41955 (and (=> t!38690 result!21269) b_and!41957)))

(declare-fun m!1100577 () Bool)

(assert (=> b!1191737 m!1100577))

(declare-fun m!1100579 () Bool)

(assert (=> b!1191737 m!1100579))

(declare-fun m!1100581 () Bool)

(assert (=> b!1191730 m!1100581))

(declare-fun m!1100583 () Bool)

(assert (=> b!1191726 m!1100583))

(declare-fun m!1100585 () Bool)

(assert (=> b!1191725 m!1100585))

(declare-fun m!1100587 () Bool)

(assert (=> b!1191725 m!1100587))

(declare-fun m!1100589 () Bool)

(assert (=> b!1191725 m!1100589))

(declare-fun m!1100591 () Bool)

(assert (=> b!1191725 m!1100591))

(declare-fun m!1100593 () Bool)

(assert (=> b!1191724 m!1100593))

(declare-fun m!1100595 () Bool)

(assert (=> b!1191724 m!1100595))

(assert (=> b!1191724 m!1100595))

(declare-fun m!1100597 () Bool)

(assert (=> b!1191724 m!1100597))

(declare-fun m!1100599 () Bool)

(assert (=> b!1191724 m!1100599))

(declare-fun m!1100601 () Bool)

(assert (=> start!100200 m!1100601))

(declare-fun m!1100603 () Bool)

(assert (=> start!100200 m!1100603))

(declare-fun m!1100605 () Bool)

(assert (=> b!1191723 m!1100605))

(declare-fun m!1100607 () Bool)

(assert (=> b!1191731 m!1100607))

(declare-fun m!1100609 () Bool)

(assert (=> b!1191731 m!1100609))

(declare-fun m!1100611 () Bool)

(assert (=> b!1191729 m!1100611))

(declare-fun m!1100613 () Bool)

(assert (=> b!1191728 m!1100613))

(declare-fun m!1100615 () Bool)

(assert (=> mapNonEmpty!46937 m!1100615))

(declare-fun m!1100617 () Bool)

(assert (=> b!1191732 m!1100617))

(check-sat (not b!1191731) (not b!1191726) (not b!1191724) (not b_next!25543) (not start!100200) (not b!1191729) (not b!1191725) (not b!1191730) (not mapNonEmpty!46937) (not b_lambda!20681) (not b!1191728) b_and!41957 (not b!1191723) tp_is_empty!30073 (not b!1191737))
(check-sat b_and!41957 (not b_next!25543))
