; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97820 () Bool)

(assert start!97820)

(declare-fun b_free!23527 () Bool)

(declare-fun b_next!23527 () Bool)

(assert (=> start!97820 (= b_free!23527 (not b_next!23527))))

(declare-fun tp!83284 () Bool)

(declare-fun b_and!37815 () Bool)

(assert (=> start!97820 (= tp!83284 b_and!37815)))

(declare-fun b!1119389 () Bool)

(declare-fun e!637492 () Bool)

(declare-fun e!637491 () Bool)

(declare-fun mapRes!43903 () Bool)

(assert (=> b!1119389 (= e!637492 (and e!637491 mapRes!43903))))

(declare-fun condMapEmpty!43903 () Bool)

(declare-datatypes ((V!42537 0))(
  ( (V!42538 (val!14085 Int)) )
))
(declare-datatypes ((ValueCell!13319 0))(
  ( (ValueCellFull!13319 (v!16717 V!42537)) (EmptyCell!13319) )
))
(declare-datatypes ((array!72908 0))(
  ( (array!72909 (arr!35107 (Array (_ BitVec 32) ValueCell!13319)) (size!35645 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72908)

(declare-fun mapDefault!43903 () ValueCell!13319)

(assert (=> b!1119389 (= condMapEmpty!43903 (= (arr!35107 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13319)) mapDefault!43903)))))

(declare-fun b!1119390 () Bool)

(declare-fun res!747747 () Bool)

(declare-fun e!637489 () Bool)

(assert (=> b!1119390 (=> (not res!747747) (not e!637489))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!72910 0))(
  ( (array!72911 (arr!35108 (Array (_ BitVec 32) (_ BitVec 64))) (size!35646 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72910)

(assert (=> b!1119390 (= res!747747 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35646 _keys!1208))))))

(declare-fun b!1119391 () Bool)

(declare-fun res!747744 () Bool)

(assert (=> b!1119391 (=> (not res!747744) (not e!637489))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1119391 (= res!747744 (= (select (arr!35108 _keys!1208) i!673) k0!934))))

(declare-fun b!1119392 () Bool)

(declare-fun e!637490 () Bool)

(declare-fun tp_is_empty!28057 () Bool)

(assert (=> b!1119392 (= e!637490 tp_is_empty!28057)))

(declare-fun b!1119393 () Bool)

(declare-fun res!747741 () Bool)

(assert (=> b!1119393 (=> (not res!747741) (not e!637489))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1119393 (= res!747741 (and (= (size!35645 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35646 _keys!1208) (size!35645 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1119394 () Bool)

(declare-fun e!637494 () Bool)

(declare-fun e!637488 () Bool)

(assert (=> b!1119394 (= e!637494 (not e!637488))))

(declare-fun res!747743 () Bool)

(assert (=> b!1119394 (=> res!747743 e!637488)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1119394 (= res!747743 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!72910 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1119394 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36563 0))(
  ( (Unit!36564) )
))
(declare-fun lt!497576 () Unit!36563)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72910 (_ BitVec 64) (_ BitVec 32)) Unit!36563)

(assert (=> b!1119394 (= lt!497576 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!43903 () Bool)

(assert (=> mapIsEmpty!43903 mapRes!43903))

(declare-fun res!747748 () Bool)

(assert (=> start!97820 (=> (not res!747748) (not e!637489))))

(assert (=> start!97820 (= res!747748 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35646 _keys!1208))))))

(assert (=> start!97820 e!637489))

(assert (=> start!97820 tp_is_empty!28057))

(declare-fun array_inv!27034 (array!72910) Bool)

(assert (=> start!97820 (array_inv!27034 _keys!1208)))

(assert (=> start!97820 true))

(assert (=> start!97820 tp!83284))

(declare-fun array_inv!27035 (array!72908) Bool)

(assert (=> start!97820 (and (array_inv!27035 _values!996) e!637492)))

(declare-fun b!1119395 () Bool)

(assert (=> b!1119395 (= e!637491 tp_is_empty!28057)))

(declare-fun b!1119396 () Bool)

(declare-fun res!747742 () Bool)

(assert (=> b!1119396 (=> (not res!747742) (not e!637489))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72910 (_ BitVec 32)) Bool)

(assert (=> b!1119396 (= res!747742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1119397 () Bool)

(declare-fun res!747745 () Bool)

(assert (=> b!1119397 (=> (not res!747745) (not e!637489))))

(declare-datatypes ((List!24500 0))(
  ( (Nil!24497) (Cons!24496 (h!25705 (_ BitVec 64)) (t!35010 List!24500)) )
))
(declare-fun arrayNoDuplicates!0 (array!72910 (_ BitVec 32) List!24500) Bool)

(assert (=> b!1119397 (= res!747745 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24497))))

(declare-fun b!1119398 () Bool)

(declare-fun res!747746 () Bool)

(assert (=> b!1119398 (=> (not res!747746) (not e!637494))))

(declare-fun lt!497575 () array!72910)

(assert (=> b!1119398 (= res!747746 (arrayNoDuplicates!0 lt!497575 #b00000000000000000000000000000000 Nil!24497))))

(declare-fun b!1119399 () Bool)

(declare-fun res!747750 () Bool)

(assert (=> b!1119399 (=> (not res!747750) (not e!637489))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1119399 (= res!747750 (validMask!0 mask!1564))))

(declare-fun b!1119400 () Bool)

(assert (=> b!1119400 (= e!637489 e!637494)))

(declare-fun res!747749 () Bool)

(assert (=> b!1119400 (=> (not res!747749) (not e!637494))))

(assert (=> b!1119400 (= res!747749 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497575 mask!1564))))

(assert (=> b!1119400 (= lt!497575 (array!72911 (store (arr!35108 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35646 _keys!1208)))))

(declare-fun b!1119401 () Bool)

(declare-fun res!747751 () Bool)

(assert (=> b!1119401 (=> (not res!747751) (not e!637489))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1119401 (= res!747751 (validKeyInArray!0 k0!934))))

(declare-fun b!1119402 () Bool)

(assert (=> b!1119402 (= e!637488 true)))

(declare-fun zeroValue!944 () V!42537)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17730 0))(
  ( (tuple2!17731 (_1!8876 (_ BitVec 64)) (_2!8876 V!42537)) )
))
(declare-datatypes ((List!24501 0))(
  ( (Nil!24498) (Cons!24497 (h!25706 tuple2!17730) (t!35011 List!24501)) )
))
(declare-datatypes ((ListLongMap!15699 0))(
  ( (ListLongMap!15700 (toList!7865 List!24501)) )
))
(declare-fun lt!497577 () ListLongMap!15699)

(declare-fun minValue!944 () V!42537)

(declare-fun getCurrentListMapNoExtraKeys!4374 (array!72910 array!72908 (_ BitVec 32) (_ BitVec 32) V!42537 V!42537 (_ BitVec 32) Int) ListLongMap!15699)

(declare-fun dynLambda!2417 (Int (_ BitVec 64)) V!42537)

(assert (=> b!1119402 (= lt!497577 (getCurrentListMapNoExtraKeys!4374 lt!497575 (array!72909 (store (arr!35107 _values!996) i!673 (ValueCellFull!13319 (dynLambda!2417 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35645 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!497574 () ListLongMap!15699)

(assert (=> b!1119402 (= lt!497574 (getCurrentListMapNoExtraKeys!4374 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!43903 () Bool)

(declare-fun tp!83285 () Bool)

(assert (=> mapNonEmpty!43903 (= mapRes!43903 (and tp!83285 e!637490))))

(declare-fun mapValue!43903 () ValueCell!13319)

(declare-fun mapRest!43903 () (Array (_ BitVec 32) ValueCell!13319))

(declare-fun mapKey!43903 () (_ BitVec 32))

(assert (=> mapNonEmpty!43903 (= (arr!35107 _values!996) (store mapRest!43903 mapKey!43903 mapValue!43903))))

(assert (= (and start!97820 res!747748) b!1119399))

(assert (= (and b!1119399 res!747750) b!1119393))

(assert (= (and b!1119393 res!747741) b!1119396))

(assert (= (and b!1119396 res!747742) b!1119397))

(assert (= (and b!1119397 res!747745) b!1119390))

(assert (= (and b!1119390 res!747747) b!1119401))

(assert (= (and b!1119401 res!747751) b!1119391))

(assert (= (and b!1119391 res!747744) b!1119400))

(assert (= (and b!1119400 res!747749) b!1119398))

(assert (= (and b!1119398 res!747746) b!1119394))

(assert (= (and b!1119394 (not res!747743)) b!1119402))

(assert (= (and b!1119389 condMapEmpty!43903) mapIsEmpty!43903))

(assert (= (and b!1119389 (not condMapEmpty!43903)) mapNonEmpty!43903))

(get-info :version)

(assert (= (and mapNonEmpty!43903 ((_ is ValueCellFull!13319) mapValue!43903)) b!1119392))

(assert (= (and b!1119389 ((_ is ValueCellFull!13319) mapDefault!43903)) b!1119395))

(assert (= start!97820 b!1119389))

(declare-fun b_lambda!18479 () Bool)

(assert (=> (not b_lambda!18479) (not b!1119402)))

(declare-fun t!35009 () Bool)

(declare-fun tb!8331 () Bool)

(assert (=> (and start!97820 (= defaultEntry!1004 defaultEntry!1004) t!35009) tb!8331))

(declare-fun result!17231 () Bool)

(assert (=> tb!8331 (= result!17231 tp_is_empty!28057)))

(assert (=> b!1119402 t!35009))

(declare-fun b_and!37817 () Bool)

(assert (= b_and!37815 (and (=> t!35009 result!17231) b_and!37817)))

(declare-fun m!1034157 () Bool)

(assert (=> b!1119398 m!1034157))

(declare-fun m!1034159 () Bool)

(assert (=> b!1119394 m!1034159))

(declare-fun m!1034161 () Bool)

(assert (=> b!1119394 m!1034161))

(declare-fun m!1034163 () Bool)

(assert (=> start!97820 m!1034163))

(declare-fun m!1034165 () Bool)

(assert (=> start!97820 m!1034165))

(declare-fun m!1034167 () Bool)

(assert (=> b!1119400 m!1034167))

(declare-fun m!1034169 () Bool)

(assert (=> b!1119400 m!1034169))

(declare-fun m!1034171 () Bool)

(assert (=> b!1119397 m!1034171))

(declare-fun m!1034173 () Bool)

(assert (=> b!1119401 m!1034173))

(declare-fun m!1034175 () Bool)

(assert (=> mapNonEmpty!43903 m!1034175))

(declare-fun m!1034177 () Bool)

(assert (=> b!1119391 m!1034177))

(declare-fun m!1034179 () Bool)

(assert (=> b!1119399 m!1034179))

(declare-fun m!1034181 () Bool)

(assert (=> b!1119396 m!1034181))

(declare-fun m!1034183 () Bool)

(assert (=> b!1119402 m!1034183))

(declare-fun m!1034185 () Bool)

(assert (=> b!1119402 m!1034185))

(declare-fun m!1034187 () Bool)

(assert (=> b!1119402 m!1034187))

(declare-fun m!1034189 () Bool)

(assert (=> b!1119402 m!1034189))

(check-sat (not b!1119397) (not b!1119396) (not start!97820) (not b!1119398) tp_is_empty!28057 (not b_next!23527) (not b!1119400) (not b!1119402) (not mapNonEmpty!43903) (not b!1119401) (not b_lambda!18479) (not b!1119394) b_and!37817 (not b!1119399))
(check-sat b_and!37817 (not b_next!23527))
