; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99676 () Bool)

(assert start!99676)

(declare-fun b_free!25261 () Bool)

(declare-fun b_next!25261 () Bool)

(assert (=> start!99676 (= b_free!25261 (not b_next!25261))))

(declare-fun tp!88496 () Bool)

(declare-fun b_and!41367 () Bool)

(assert (=> start!99676 (= tp!88496 b_and!41367)))

(declare-fun b!1182253 () Bool)

(declare-fun res!785716 () Bool)

(declare-fun e!672156 () Bool)

(assert (=> b!1182253 (=> (not res!785716) (not e!672156))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1182253 (= res!785716 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!46514 () Bool)

(declare-fun mapRes!46514 () Bool)

(declare-fun tp!88497 () Bool)

(declare-fun e!672149 () Bool)

(assert (=> mapNonEmpty!46514 (= mapRes!46514 (and tp!88497 e!672149))))

(declare-datatypes ((V!44849 0))(
  ( (V!44850 (val!14952 Int)) )
))
(declare-datatypes ((ValueCell!14186 0))(
  ( (ValueCellFull!14186 (v!17589 V!44849)) (EmptyCell!14186) )
))
(declare-fun mapValue!46514 () ValueCell!14186)

(declare-fun mapRest!46514 () (Array (_ BitVec 32) ValueCell!14186))

(declare-fun mapKey!46514 () (_ BitVec 32))

(declare-datatypes ((array!76316 0))(
  ( (array!76317 (arr!36808 (Array (_ BitVec 32) ValueCell!14186)) (size!37346 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76316)

(assert (=> mapNonEmpty!46514 (= (arr!36808 _values!996) (store mapRest!46514 mapKey!46514 mapValue!46514))))

(declare-fun b!1182254 () Bool)

(declare-fun res!785711 () Bool)

(assert (=> b!1182254 (=> (not res!785711) (not e!672156))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1182254 (= res!785711 (validMask!0 mask!1564))))

(declare-fun b!1182256 () Bool)

(declare-fun res!785721 () Bool)

(assert (=> b!1182256 (=> (not res!785721) (not e!672156))))

(declare-datatypes ((array!76318 0))(
  ( (array!76319 (arr!36809 (Array (_ BitVec 32) (_ BitVec 64))) (size!37347 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76318)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76318 (_ BitVec 32)) Bool)

(assert (=> b!1182256 (= res!785721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1182257 () Bool)

(declare-fun res!785720 () Bool)

(assert (=> b!1182257 (=> (not res!785720) (not e!672156))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1182257 (= res!785720 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37347 _keys!1208))))))

(declare-fun b!1182258 () Bool)

(declare-fun e!672160 () Bool)

(declare-fun e!672152 () Bool)

(assert (=> b!1182258 (= e!672160 e!672152)))

(declare-fun res!785712 () Bool)

(assert (=> b!1182258 (=> res!785712 e!672152)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1182258 (= res!785712 (not (= (select (arr!36809 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1182259 () Bool)

(declare-fun arrayContainsKey!0 (array!76318 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1182259 (= e!672152 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1182260 () Bool)

(declare-datatypes ((Unit!38962 0))(
  ( (Unit!38963) )
))
(declare-fun e!672154 () Unit!38962)

(declare-fun Unit!38964 () Unit!38962)

(assert (=> b!1182260 (= e!672154 Unit!38964)))

(declare-fun b!1182261 () Bool)

(declare-fun res!785722 () Bool)

(assert (=> b!1182261 (=> (not res!785722) (not e!672156))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1182261 (= res!785722 (and (= (size!37346 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37347 _keys!1208) (size!37346 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1182262 () Bool)

(declare-fun res!785710 () Bool)

(declare-fun e!672155 () Bool)

(assert (=> b!1182262 (=> (not res!785710) (not e!672155))))

(declare-fun lt!535005 () array!76318)

(declare-datatypes ((List!25976 0))(
  ( (Nil!25973) (Cons!25972 (h!27181 (_ BitVec 64)) (t!38220 List!25976)) )
))
(declare-fun arrayNoDuplicates!0 (array!76318 (_ BitVec 32) List!25976) Bool)

(assert (=> b!1182262 (= res!785710 (arrayNoDuplicates!0 lt!535005 #b00000000000000000000000000000000 Nil!25973))))

(declare-fun b!1182263 () Bool)

(declare-fun tp_is_empty!29791 () Bool)

(assert (=> b!1182263 (= e!672149 tp_is_empty!29791)))

(declare-fun b!1182264 () Bool)

(declare-fun res!785717 () Bool)

(assert (=> b!1182264 (=> (not res!785717) (not e!672156))))

(assert (=> b!1182264 (= res!785717 (= (select (arr!36809 _keys!1208) i!673) k0!934))))

(declare-fun b!1182265 () Bool)

(declare-fun res!785719 () Bool)

(assert (=> b!1182265 (=> (not res!785719) (not e!672156))))

(assert (=> b!1182265 (= res!785719 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25973))))

(declare-fun b!1182255 () Bool)

(declare-fun e!672159 () Bool)

(assert (=> b!1182255 (= e!672155 (not e!672159))))

(declare-fun res!785718 () Bool)

(assert (=> b!1182255 (=> res!785718 e!672159)))

(assert (=> b!1182255 (= res!785718 (bvsgt from!1455 i!673))))

(assert (=> b!1182255 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!535000 () Unit!38962)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76318 (_ BitVec 64) (_ BitVec 32)) Unit!38962)

(assert (=> b!1182255 (= lt!535000 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!785708 () Bool)

(assert (=> start!99676 (=> (not res!785708) (not e!672156))))

(assert (=> start!99676 (= res!785708 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37347 _keys!1208))))))

(assert (=> start!99676 e!672156))

(assert (=> start!99676 tp_is_empty!29791))

(declare-fun array_inv!28208 (array!76318) Bool)

(assert (=> start!99676 (array_inv!28208 _keys!1208)))

(assert (=> start!99676 true))

(assert (=> start!99676 tp!88496))

(declare-fun e!672151 () Bool)

(declare-fun array_inv!28209 (array!76316) Bool)

(assert (=> start!99676 (and (array_inv!28209 _values!996) e!672151)))

(declare-fun b!1182266 () Bool)

(declare-fun Unit!38965 () Unit!38962)

(assert (=> b!1182266 (= e!672154 Unit!38965)))

(declare-fun lt!535014 () Unit!38962)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76318 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38962)

(assert (=> b!1182266 (= lt!535014 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1182266 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!535006 () Unit!38962)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76318 (_ BitVec 32) (_ BitVec 32)) Unit!38962)

(assert (=> b!1182266 (= lt!535006 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1182266 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25973)))

(declare-fun lt!535009 () Unit!38962)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76318 (_ BitVec 64) (_ BitVec 32) List!25976) Unit!38962)

(assert (=> b!1182266 (= lt!535009 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25973))))

(assert (=> b!1182266 false))

(declare-fun b!1182267 () Bool)

(declare-fun e!672150 () Bool)

(assert (=> b!1182267 (= e!672151 (and e!672150 mapRes!46514))))

(declare-fun condMapEmpty!46514 () Bool)

(declare-fun mapDefault!46514 () ValueCell!14186)

(assert (=> b!1182267 (= condMapEmpty!46514 (= (arr!36808 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14186)) mapDefault!46514)))))

(declare-fun b!1182268 () Bool)

(declare-fun e!672157 () Bool)

(assert (=> b!1182268 (= e!672159 e!672157)))

(declare-fun res!785715 () Bool)

(assert (=> b!1182268 (=> res!785715 e!672157)))

(assert (=> b!1182268 (= res!785715 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44849)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19270 0))(
  ( (tuple2!19271 (_1!9646 (_ BitVec 64)) (_2!9646 V!44849)) )
))
(declare-datatypes ((List!25977 0))(
  ( (Nil!25974) (Cons!25973 (h!27182 tuple2!19270) (t!38221 List!25977)) )
))
(declare-datatypes ((ListLongMap!17239 0))(
  ( (ListLongMap!17240 (toList!8635 List!25977)) )
))
(declare-fun lt!535016 () ListLongMap!17239)

(declare-fun lt!535004 () array!76316)

(declare-fun minValue!944 () V!44849)

(declare-fun getCurrentListMapNoExtraKeys!5090 (array!76318 array!76316 (_ BitVec 32) (_ BitVec 32) V!44849 V!44849 (_ BitVec 32) Int) ListLongMap!17239)

(assert (=> b!1182268 (= lt!535016 (getCurrentListMapNoExtraKeys!5090 lt!535005 lt!535004 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!535013 () V!44849)

(assert (=> b!1182268 (= lt!535004 (array!76317 (store (arr!36808 _values!996) i!673 (ValueCellFull!14186 lt!535013)) (size!37346 _values!996)))))

(declare-fun dynLambda!2997 (Int (_ BitVec 64)) V!44849)

(assert (=> b!1182268 (= lt!535013 (dynLambda!2997 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!535001 () ListLongMap!17239)

(assert (=> b!1182268 (= lt!535001 (getCurrentListMapNoExtraKeys!5090 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1182269 () Bool)

(assert (=> b!1182269 (= e!672156 e!672155)))

(declare-fun res!785714 () Bool)

(assert (=> b!1182269 (=> (not res!785714) (not e!672155))))

(assert (=> b!1182269 (= res!785714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!535005 mask!1564))))

(assert (=> b!1182269 (= lt!535005 (array!76319 (store (arr!36809 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37347 _keys!1208)))))

(declare-fun b!1182270 () Bool)

(declare-fun e!672153 () Bool)

(assert (=> b!1182270 (= e!672157 e!672153)))

(declare-fun res!785709 () Bool)

(assert (=> b!1182270 (=> res!785709 e!672153)))

(assert (=> b!1182270 (= res!785709 (not (validKeyInArray!0 (select (arr!36809 _keys!1208) from!1455))))))

(declare-fun lt!535002 () ListLongMap!17239)

(declare-fun lt!535012 () ListLongMap!17239)

(assert (=> b!1182270 (= lt!535002 lt!535012)))

(declare-fun lt!535015 () ListLongMap!17239)

(declare-fun -!1593 (ListLongMap!17239 (_ BitVec 64)) ListLongMap!17239)

(assert (=> b!1182270 (= lt!535012 (-!1593 lt!535015 k0!934))))

(assert (=> b!1182270 (= lt!535002 (getCurrentListMapNoExtraKeys!5090 lt!535005 lt!535004 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1182270 (= lt!535015 (getCurrentListMapNoExtraKeys!5090 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!535008 () Unit!38962)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!856 (array!76318 array!76316 (_ BitVec 32) (_ BitVec 32) V!44849 V!44849 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38962)

(assert (=> b!1182270 (= lt!535008 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!856 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1182271 () Bool)

(assert (=> b!1182271 (= e!672153 true)))

(declare-fun lt!535007 () ListLongMap!17239)

(declare-fun lt!535003 () ListLongMap!17239)

(assert (=> b!1182271 (= (-!1593 lt!535007 k0!934) lt!535003)))

(declare-fun lt!535010 () V!44849)

(declare-fun lt!534999 () Unit!38962)

(declare-fun addRemoveCommutativeForDiffKeys!143 (ListLongMap!17239 (_ BitVec 64) V!44849 (_ BitVec 64)) Unit!38962)

(assert (=> b!1182271 (= lt!534999 (addRemoveCommutativeForDiffKeys!143 lt!535015 (select (arr!36809 _keys!1208) from!1455) lt!535010 k0!934))))

(assert (=> b!1182271 (and (= lt!535001 lt!535007) (= lt!535012 lt!535002))))

(declare-fun lt!535011 () tuple2!19270)

(declare-fun +!3929 (ListLongMap!17239 tuple2!19270) ListLongMap!17239)

(assert (=> b!1182271 (= lt!535007 (+!3929 lt!535015 lt!535011))))

(assert (=> b!1182271 (not (= (select (arr!36809 _keys!1208) from!1455) k0!934))))

(declare-fun lt!535017 () Unit!38962)

(assert (=> b!1182271 (= lt!535017 e!672154)))

(declare-fun c!116989 () Bool)

(assert (=> b!1182271 (= c!116989 (= (select (arr!36809 _keys!1208) from!1455) k0!934))))

(assert (=> b!1182271 e!672160))

(declare-fun res!785713 () Bool)

(assert (=> b!1182271 (=> (not res!785713) (not e!672160))))

(assert (=> b!1182271 (= res!785713 (= lt!535016 lt!535003))))

(assert (=> b!1182271 (= lt!535003 (+!3929 lt!535012 lt!535011))))

(assert (=> b!1182271 (= lt!535011 (tuple2!19271 (select (arr!36809 _keys!1208) from!1455) lt!535010))))

(declare-fun get!18838 (ValueCell!14186 V!44849) V!44849)

(assert (=> b!1182271 (= lt!535010 (get!18838 (select (arr!36808 _values!996) from!1455) lt!535013))))

(declare-fun b!1182272 () Bool)

(assert (=> b!1182272 (= e!672150 tp_is_empty!29791)))

(declare-fun mapIsEmpty!46514 () Bool)

(assert (=> mapIsEmpty!46514 mapRes!46514))

(assert (= (and start!99676 res!785708) b!1182254))

(assert (= (and b!1182254 res!785711) b!1182261))

(assert (= (and b!1182261 res!785722) b!1182256))

(assert (= (and b!1182256 res!785721) b!1182265))

(assert (= (and b!1182265 res!785719) b!1182257))

(assert (= (and b!1182257 res!785720) b!1182253))

(assert (= (and b!1182253 res!785716) b!1182264))

(assert (= (and b!1182264 res!785717) b!1182269))

(assert (= (and b!1182269 res!785714) b!1182262))

(assert (= (and b!1182262 res!785710) b!1182255))

(assert (= (and b!1182255 (not res!785718)) b!1182268))

(assert (= (and b!1182268 (not res!785715)) b!1182270))

(assert (= (and b!1182270 (not res!785709)) b!1182271))

(assert (= (and b!1182271 res!785713) b!1182258))

(assert (= (and b!1182258 (not res!785712)) b!1182259))

(assert (= (and b!1182271 c!116989) b!1182266))

(assert (= (and b!1182271 (not c!116989)) b!1182260))

(assert (= (and b!1182267 condMapEmpty!46514) mapIsEmpty!46514))

(assert (= (and b!1182267 (not condMapEmpty!46514)) mapNonEmpty!46514))

(get-info :version)

(assert (= (and mapNonEmpty!46514 ((_ is ValueCellFull!14186) mapValue!46514)) b!1182263))

(assert (= (and b!1182267 ((_ is ValueCellFull!14186) mapDefault!46514)) b!1182272))

(assert (= start!99676 b!1182267))

(declare-fun b_lambda!20387 () Bool)

(assert (=> (not b_lambda!20387) (not b!1182268)))

(declare-fun t!38219 () Bool)

(declare-fun tb!10065 () Bool)

(assert (=> (and start!99676 (= defaultEntry!1004 defaultEntry!1004) t!38219) tb!10065))

(declare-fun result!20705 () Bool)

(assert (=> tb!10065 (= result!20705 tp_is_empty!29791)))

(assert (=> b!1182268 t!38219))

(declare-fun b_and!41369 () Bool)

(assert (= b_and!41367 (and (=> t!38219 result!20705) b_and!41369)))

(declare-fun m!1089785 () Bool)

(assert (=> b!1182262 m!1089785))

(declare-fun m!1089787 () Bool)

(assert (=> b!1182254 m!1089787))

(declare-fun m!1089789 () Bool)

(assert (=> b!1182269 m!1089789))

(declare-fun m!1089791 () Bool)

(assert (=> b!1182269 m!1089791))

(declare-fun m!1089793 () Bool)

(assert (=> b!1182258 m!1089793))

(declare-fun m!1089795 () Bool)

(assert (=> b!1182266 m!1089795))

(declare-fun m!1089797 () Bool)

(assert (=> b!1182266 m!1089797))

(declare-fun m!1089799 () Bool)

(assert (=> b!1182266 m!1089799))

(declare-fun m!1089801 () Bool)

(assert (=> b!1182266 m!1089801))

(declare-fun m!1089803 () Bool)

(assert (=> b!1182266 m!1089803))

(declare-fun m!1089805 () Bool)

(assert (=> mapNonEmpty!46514 m!1089805))

(declare-fun m!1089807 () Bool)

(assert (=> b!1182256 m!1089807))

(declare-fun m!1089809 () Bool)

(assert (=> b!1182255 m!1089809))

(declare-fun m!1089811 () Bool)

(assert (=> b!1182255 m!1089811))

(declare-fun m!1089813 () Bool)

(assert (=> b!1182268 m!1089813))

(declare-fun m!1089815 () Bool)

(assert (=> b!1182268 m!1089815))

(declare-fun m!1089817 () Bool)

(assert (=> b!1182268 m!1089817))

(declare-fun m!1089819 () Bool)

(assert (=> b!1182268 m!1089819))

(declare-fun m!1089821 () Bool)

(assert (=> b!1182264 m!1089821))

(declare-fun m!1089823 () Bool)

(assert (=> b!1182270 m!1089823))

(declare-fun m!1089825 () Bool)

(assert (=> b!1182270 m!1089825))

(assert (=> b!1182270 m!1089793))

(declare-fun m!1089827 () Bool)

(assert (=> b!1182270 m!1089827))

(declare-fun m!1089829 () Bool)

(assert (=> b!1182270 m!1089829))

(assert (=> b!1182270 m!1089793))

(declare-fun m!1089831 () Bool)

(assert (=> b!1182270 m!1089831))

(declare-fun m!1089833 () Bool)

(assert (=> b!1182259 m!1089833))

(declare-fun m!1089835 () Bool)

(assert (=> start!99676 m!1089835))

(declare-fun m!1089837 () Bool)

(assert (=> start!99676 m!1089837))

(declare-fun m!1089839 () Bool)

(assert (=> b!1182271 m!1089839))

(declare-fun m!1089841 () Bool)

(assert (=> b!1182271 m!1089841))

(declare-fun m!1089843 () Bool)

(assert (=> b!1182271 m!1089843))

(assert (=> b!1182271 m!1089793))

(declare-fun m!1089845 () Bool)

(assert (=> b!1182271 m!1089845))

(assert (=> b!1182271 m!1089841))

(declare-fun m!1089847 () Bool)

(assert (=> b!1182271 m!1089847))

(declare-fun m!1089849 () Bool)

(assert (=> b!1182271 m!1089849))

(assert (=> b!1182271 m!1089793))

(declare-fun m!1089851 () Bool)

(assert (=> b!1182265 m!1089851))

(declare-fun m!1089853 () Bool)

(assert (=> b!1182253 m!1089853))

(check-sat (not b!1182254) (not b_next!25261) b_and!41369 tp_is_empty!29791 (not start!99676) (not b!1182253) (not b!1182265) (not b!1182270) (not b!1182259) (not b!1182269) (not b!1182262) (not mapNonEmpty!46514) (not b!1182268) (not b!1182271) (not b_lambda!20387) (not b!1182255) (not b!1182266) (not b!1182256))
(check-sat b_and!41369 (not b_next!25261))
