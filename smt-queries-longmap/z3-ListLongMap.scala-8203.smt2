; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100086 () Bool)

(assert start!100086)

(declare-fun b_free!25665 () Bool)

(declare-fun b_next!25665 () Bool)

(assert (=> start!100086 (= b_free!25665 (not b_next!25665))))

(declare-fun tp!89709 () Bool)

(declare-fun b_and!42197 () Bool)

(assert (=> start!100086 (= tp!89709 b_and!42197)))

(declare-fun b!1193301 () Bool)

(declare-fun res!793912 () Bool)

(declare-fun e!678224 () Bool)

(assert (=> b!1193301 (=> (not res!793912) (not e!678224))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1193301 (= res!793912 (validMask!0 mask!1564))))

(declare-fun b!1193302 () Bool)

(declare-fun e!678219 () Bool)

(declare-fun e!678221 () Bool)

(declare-fun mapRes!47120 () Bool)

(assert (=> b!1193302 (= e!678219 (and e!678221 mapRes!47120))))

(declare-fun condMapEmpty!47120 () Bool)

(declare-datatypes ((V!45387 0))(
  ( (V!45388 (val!15154 Int)) )
))
(declare-datatypes ((ValueCell!14388 0))(
  ( (ValueCellFull!14388 (v!17792 V!45387)) (EmptyCell!14388) )
))
(declare-datatypes ((array!77169 0))(
  ( (array!77170 (arr!37234 (Array (_ BitVec 32) ValueCell!14388)) (size!37770 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77169)

(declare-fun mapDefault!47120 () ValueCell!14388)

(assert (=> b!1193302 (= condMapEmpty!47120 (= (arr!37234 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14388)) mapDefault!47120)))))

(declare-fun b!1193303 () Bool)

(declare-fun res!793905 () Bool)

(assert (=> b!1193303 (=> (not res!793905) (not e!678224))))

(declare-datatypes ((array!77171 0))(
  ( (array!77172 (arr!37235 (Array (_ BitVec 32) (_ BitVec 64))) (size!37771 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77171)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1193303 (= res!793905 (= (select (arr!37235 _keys!1208) i!673) k0!934))))

(declare-fun res!793906 () Bool)

(assert (=> start!100086 (=> (not res!793906) (not e!678224))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100086 (= res!793906 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37771 _keys!1208))))))

(assert (=> start!100086 e!678224))

(declare-fun tp_is_empty!30195 () Bool)

(assert (=> start!100086 tp_is_empty!30195))

(declare-fun array_inv!28388 (array!77171) Bool)

(assert (=> start!100086 (array_inv!28388 _keys!1208)))

(assert (=> start!100086 true))

(assert (=> start!100086 tp!89709))

(declare-fun array_inv!28389 (array!77169) Bool)

(assert (=> start!100086 (and (array_inv!28389 _values!996) e!678219)))

(declare-fun b!1193304 () Bool)

(declare-fun e!678220 () Bool)

(declare-fun e!678226 () Bool)

(assert (=> b!1193304 (= e!678220 e!678226)))

(declare-fun res!793904 () Bool)

(assert (=> b!1193304 (=> res!793904 e!678226)))

(assert (=> b!1193304 (= res!793904 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!542546 () array!77169)

(declare-fun minValue!944 () V!45387)

(declare-fun lt!542547 () array!77171)

(declare-fun zeroValue!944 () V!45387)

(declare-datatypes ((tuple2!19482 0))(
  ( (tuple2!19483 (_1!9752 (_ BitVec 64)) (_2!9752 V!45387)) )
))
(declare-datatypes ((List!26226 0))(
  ( (Nil!26223) (Cons!26222 (h!27431 tuple2!19482) (t!38883 List!26226)) )
))
(declare-datatypes ((ListLongMap!17451 0))(
  ( (ListLongMap!17452 (toList!8741 List!26226)) )
))
(declare-fun lt!542549 () ListLongMap!17451)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5182 (array!77171 array!77169 (_ BitVec 32) (_ BitVec 32) V!45387 V!45387 (_ BitVec 32) Int) ListLongMap!17451)

(assert (=> b!1193304 (= lt!542549 (getCurrentListMapNoExtraKeys!5182 lt!542547 lt!542546 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3112 (Int (_ BitVec 64)) V!45387)

(assert (=> b!1193304 (= lt!542546 (array!77170 (store (arr!37234 _values!996) i!673 (ValueCellFull!14388 (dynLambda!3112 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37770 _values!996)))))

(declare-fun lt!542545 () ListLongMap!17451)

(assert (=> b!1193304 (= lt!542545 (getCurrentListMapNoExtraKeys!5182 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!47120 () Bool)

(assert (=> mapIsEmpty!47120 mapRes!47120))

(declare-fun b!1193305 () Bool)

(assert (=> b!1193305 (= e!678221 tp_is_empty!30195)))

(declare-fun b!1193306 () Bool)

(assert (=> b!1193306 (= e!678226 true)))

(declare-fun -!1766 (ListLongMap!17451 (_ BitVec 64)) ListLongMap!17451)

(assert (=> b!1193306 (= (getCurrentListMapNoExtraKeys!5182 lt!542547 lt!542546 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1766 (getCurrentListMapNoExtraKeys!5182 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!39586 0))(
  ( (Unit!39587) )
))
(declare-fun lt!542548 () Unit!39586)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!975 (array!77171 array!77169 (_ BitVec 32) (_ BitVec 32) V!45387 V!45387 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39586)

(assert (=> b!1193306 (= lt!542548 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!975 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1193307 () Bool)

(declare-fun res!793911 () Bool)

(assert (=> b!1193307 (=> (not res!793911) (not e!678224))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77171 (_ BitVec 32)) Bool)

(assert (=> b!1193307 (= res!793911 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1193308 () Bool)

(declare-fun res!793909 () Bool)

(declare-fun e!678223 () Bool)

(assert (=> b!1193308 (=> (not res!793909) (not e!678223))))

(declare-datatypes ((List!26227 0))(
  ( (Nil!26224) (Cons!26223 (h!27432 (_ BitVec 64)) (t!38884 List!26227)) )
))
(declare-fun arrayNoDuplicates!0 (array!77171 (_ BitVec 32) List!26227) Bool)

(assert (=> b!1193308 (= res!793909 (arrayNoDuplicates!0 lt!542547 #b00000000000000000000000000000000 Nil!26224))))

(declare-fun b!1193309 () Bool)

(declare-fun res!793913 () Bool)

(assert (=> b!1193309 (=> (not res!793913) (not e!678224))))

(assert (=> b!1193309 (= res!793913 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26224))))

(declare-fun mapNonEmpty!47120 () Bool)

(declare-fun tp!89708 () Bool)

(declare-fun e!678225 () Bool)

(assert (=> mapNonEmpty!47120 (= mapRes!47120 (and tp!89708 e!678225))))

(declare-fun mapRest!47120 () (Array (_ BitVec 32) ValueCell!14388))

(declare-fun mapKey!47120 () (_ BitVec 32))

(declare-fun mapValue!47120 () ValueCell!14388)

(assert (=> mapNonEmpty!47120 (= (arr!37234 _values!996) (store mapRest!47120 mapKey!47120 mapValue!47120))))

(declare-fun b!1193310 () Bool)

(assert (=> b!1193310 (= e!678223 (not e!678220))))

(declare-fun res!793915 () Bool)

(assert (=> b!1193310 (=> res!793915 e!678220)))

(assert (=> b!1193310 (= res!793915 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77171 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1193310 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!542550 () Unit!39586)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77171 (_ BitVec 64) (_ BitVec 32)) Unit!39586)

(assert (=> b!1193310 (= lt!542550 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1193311 () Bool)

(declare-fun res!793910 () Bool)

(assert (=> b!1193311 (=> (not res!793910) (not e!678224))))

(assert (=> b!1193311 (= res!793910 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37771 _keys!1208))))))

(declare-fun b!1193312 () Bool)

(assert (=> b!1193312 (= e!678224 e!678223)))

(declare-fun res!793914 () Bool)

(assert (=> b!1193312 (=> (not res!793914) (not e!678223))))

(assert (=> b!1193312 (= res!793914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542547 mask!1564))))

(assert (=> b!1193312 (= lt!542547 (array!77172 (store (arr!37235 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37771 _keys!1208)))))

(declare-fun b!1193313 () Bool)

(assert (=> b!1193313 (= e!678225 tp_is_empty!30195)))

(declare-fun b!1193314 () Bool)

(declare-fun res!793908 () Bool)

(assert (=> b!1193314 (=> (not res!793908) (not e!678224))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1193314 (= res!793908 (validKeyInArray!0 k0!934))))

(declare-fun b!1193315 () Bool)

(declare-fun res!793907 () Bool)

(assert (=> b!1193315 (=> (not res!793907) (not e!678224))))

(assert (=> b!1193315 (= res!793907 (and (= (size!37770 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37771 _keys!1208) (size!37770 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!100086 res!793906) b!1193301))

(assert (= (and b!1193301 res!793912) b!1193315))

(assert (= (and b!1193315 res!793907) b!1193307))

(assert (= (and b!1193307 res!793911) b!1193309))

(assert (= (and b!1193309 res!793913) b!1193311))

(assert (= (and b!1193311 res!793910) b!1193314))

(assert (= (and b!1193314 res!793908) b!1193303))

(assert (= (and b!1193303 res!793905) b!1193312))

(assert (= (and b!1193312 res!793914) b!1193308))

(assert (= (and b!1193308 res!793909) b!1193310))

(assert (= (and b!1193310 (not res!793915)) b!1193304))

(assert (= (and b!1193304 (not res!793904)) b!1193306))

(assert (= (and b!1193302 condMapEmpty!47120) mapIsEmpty!47120))

(assert (= (and b!1193302 (not condMapEmpty!47120)) mapNonEmpty!47120))

(get-info :version)

(assert (= (and mapNonEmpty!47120 ((_ is ValueCellFull!14388) mapValue!47120)) b!1193313))

(assert (= (and b!1193302 ((_ is ValueCellFull!14388) mapDefault!47120)) b!1193305))

(assert (= start!100086 b!1193302))

(declare-fun b_lambda!20809 () Bool)

(assert (=> (not b_lambda!20809) (not b!1193304)))

(declare-fun t!38882 () Bool)

(declare-fun tb!10477 () Bool)

(assert (=> (and start!100086 (= defaultEntry!1004 defaultEntry!1004) t!38882) tb!10477))

(declare-fun result!21521 () Bool)

(assert (=> tb!10477 (= result!21521 tp_is_empty!30195)))

(assert (=> b!1193304 t!38882))

(declare-fun b_and!42199 () Bool)

(assert (= b_and!42197 (and (=> t!38882 result!21521) b_and!42199)))

(declare-fun m!1101567 () Bool)

(assert (=> b!1193304 m!1101567))

(declare-fun m!1101569 () Bool)

(assert (=> b!1193304 m!1101569))

(declare-fun m!1101571 () Bool)

(assert (=> b!1193304 m!1101571))

(declare-fun m!1101573 () Bool)

(assert (=> b!1193304 m!1101573))

(declare-fun m!1101575 () Bool)

(assert (=> b!1193301 m!1101575))

(declare-fun m!1101577 () Bool)

(assert (=> b!1193314 m!1101577))

(declare-fun m!1101579 () Bool)

(assert (=> start!100086 m!1101579))

(declare-fun m!1101581 () Bool)

(assert (=> start!100086 m!1101581))

(declare-fun m!1101583 () Bool)

(assert (=> b!1193309 m!1101583))

(declare-fun m!1101585 () Bool)

(assert (=> b!1193310 m!1101585))

(declare-fun m!1101587 () Bool)

(assert (=> b!1193310 m!1101587))

(declare-fun m!1101589 () Bool)

(assert (=> b!1193307 m!1101589))

(declare-fun m!1101591 () Bool)

(assert (=> b!1193303 m!1101591))

(declare-fun m!1101593 () Bool)

(assert (=> b!1193312 m!1101593))

(declare-fun m!1101595 () Bool)

(assert (=> b!1193312 m!1101595))

(declare-fun m!1101597 () Bool)

(assert (=> b!1193308 m!1101597))

(declare-fun m!1101599 () Bool)

(assert (=> b!1193306 m!1101599))

(declare-fun m!1101601 () Bool)

(assert (=> b!1193306 m!1101601))

(assert (=> b!1193306 m!1101601))

(declare-fun m!1101603 () Bool)

(assert (=> b!1193306 m!1101603))

(declare-fun m!1101605 () Bool)

(assert (=> b!1193306 m!1101605))

(declare-fun m!1101607 () Bool)

(assert (=> mapNonEmpty!47120 m!1101607))

(check-sat (not b!1193304) tp_is_empty!30195 (not mapNonEmpty!47120) (not b!1193306) (not b!1193301) (not b!1193312) (not b!1193307) (not b!1193310) (not start!100086) (not b!1193309) (not b!1193308) (not b!1193314) b_and!42199 (not b_next!25665) (not b_lambda!20809))
(check-sat b_and!42199 (not b_next!25665))
