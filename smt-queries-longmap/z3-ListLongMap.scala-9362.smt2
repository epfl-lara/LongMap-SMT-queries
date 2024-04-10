; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111610 () Bool)

(assert start!111610)

(declare-fun b_free!30267 () Bool)

(declare-fun b_next!30267 () Bool)

(assert (=> start!111610 (= b_free!30267 (not b_next!30267))))

(declare-fun tp!106277 () Bool)

(declare-fun b_and!48693 () Bool)

(assert (=> start!111610 (= tp!106277 b_and!48693)))

(declare-fun b!1321890 () Bool)

(declare-fun res!877381 () Bool)

(declare-fun e!753840 () Bool)

(assert (=> b!1321890 (=> (not res!877381) (not e!753840))))

(declare-datatypes ((array!89096 0))(
  ( (array!89097 (arr!43022 (Array (_ BitVec 32) (_ BitVec 64))) (size!43572 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89096)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!53219 0))(
  ( (V!53220 (val!18118 Int)) )
))
(declare-fun zeroValue!1279 () V!53219)

(declare-datatypes ((ValueCell!17145 0))(
  ( (ValueCellFull!17145 (v!20748 V!53219)) (EmptyCell!17145) )
))
(declare-datatypes ((array!89098 0))(
  ( (array!89099 (arr!43023 (Array (_ BitVec 32) ValueCell!17145)) (size!43573 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89098)

(declare-fun minValue!1279 () V!53219)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((tuple2!23336 0))(
  ( (tuple2!23337 (_1!11679 (_ BitVec 64)) (_2!11679 V!53219)) )
))
(declare-datatypes ((List!30484 0))(
  ( (Nil!30481) (Cons!30480 (h!31689 tuple2!23336) (t!44300 List!30484)) )
))
(declare-datatypes ((ListLongMap!20993 0))(
  ( (ListLongMap!20994 (toList!10512 List!30484)) )
))
(declare-fun contains!8667 (ListLongMap!20993 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5513 (array!89096 array!89098 (_ BitVec 32) (_ BitVec 32) V!53219 V!53219 (_ BitVec 32) Int) ListLongMap!20993)

(assert (=> b!1321890 (= res!877381 (contains!8667 (getCurrentListMap!5513 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1321891 () Bool)

(declare-fun res!877387 () Bool)

(assert (=> b!1321891 (=> (not res!877387) (not e!753840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89096 (_ BitVec 32)) Bool)

(assert (=> b!1321891 (= res!877387 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1321892 () Bool)

(declare-fun res!877388 () Bool)

(assert (=> b!1321892 (=> (not res!877388) (not e!753840))))

(assert (=> b!1321892 (= res!877388 (and (= (size!43573 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43572 _keys!1609) (size!43573 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1321893 () Bool)

(declare-fun e!753843 () Bool)

(declare-fun e!753842 () Bool)

(declare-fun mapRes!55778 () Bool)

(assert (=> b!1321893 (= e!753843 (and e!753842 mapRes!55778))))

(declare-fun condMapEmpty!55778 () Bool)

(declare-fun mapDefault!55778 () ValueCell!17145)

(assert (=> b!1321893 (= condMapEmpty!55778 (= (arr!43023 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17145)) mapDefault!55778)))))

(declare-fun res!877384 () Bool)

(assert (=> start!111610 (=> (not res!877384) (not e!753840))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111610 (= res!877384 (validMask!0 mask!2019))))

(assert (=> start!111610 e!753840))

(declare-fun array_inv!32481 (array!89096) Bool)

(assert (=> start!111610 (array_inv!32481 _keys!1609)))

(assert (=> start!111610 true))

(declare-fun tp_is_empty!36087 () Bool)

(assert (=> start!111610 tp_is_empty!36087))

(declare-fun array_inv!32482 (array!89098) Bool)

(assert (=> start!111610 (and (array_inv!32482 _values!1337) e!753843)))

(assert (=> start!111610 tp!106277))

(declare-fun b!1321894 () Bool)

(declare-fun res!877386 () Bool)

(assert (=> b!1321894 (=> (not res!877386) (not e!753840))))

(assert (=> b!1321894 (= res!877386 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43572 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1321895 () Bool)

(declare-fun res!877385 () Bool)

(assert (=> b!1321895 (=> (not res!877385) (not e!753840))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1321895 (= res!877385 (validKeyInArray!0 (select (arr!43022 _keys!1609) from!2000)))))

(declare-fun mapIsEmpty!55778 () Bool)

(assert (=> mapIsEmpty!55778 mapRes!55778))

(declare-fun mapNonEmpty!55778 () Bool)

(declare-fun tp!106276 () Bool)

(declare-fun e!753844 () Bool)

(assert (=> mapNonEmpty!55778 (= mapRes!55778 (and tp!106276 e!753844))))

(declare-fun mapValue!55778 () ValueCell!17145)

(declare-fun mapRest!55778 () (Array (_ BitVec 32) ValueCell!17145))

(declare-fun mapKey!55778 () (_ BitVec 32))

(assert (=> mapNonEmpty!55778 (= (arr!43023 _values!1337) (store mapRest!55778 mapKey!55778 mapValue!55778))))

(declare-fun b!1321896 () Bool)

(assert (=> b!1321896 (= e!753842 tp_is_empty!36087)))

(declare-fun b!1321897 () Bool)

(declare-fun res!877382 () Bool)

(assert (=> b!1321897 (=> (not res!877382) (not e!753840))))

(assert (=> b!1321897 (= res!877382 (not (= (select (arr!43022 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1321898 () Bool)

(assert (=> b!1321898 (= e!753844 tp_is_empty!36087)))

(declare-fun b!1321899 () Bool)

(assert (=> b!1321899 (= e!753840 (not true))))

(declare-fun lt!587748 () ListLongMap!20993)

(declare-fun lt!587751 () tuple2!23336)

(declare-fun +!4568 (ListLongMap!20993 tuple2!23336) ListLongMap!20993)

(assert (=> b!1321899 (contains!8667 (+!4568 lt!587748 lt!587751) k0!1164)))

(declare-datatypes ((Unit!43556 0))(
  ( (Unit!43557) )
))
(declare-fun lt!587749 () Unit!43556)

(declare-fun addStillContains!1117 (ListLongMap!20993 (_ BitVec 64) V!53219 (_ BitVec 64)) Unit!43556)

(assert (=> b!1321899 (= lt!587749 (addStillContains!1117 lt!587748 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1321899 (contains!8667 lt!587748 k0!1164)))

(declare-fun lt!587750 () Unit!43556)

(declare-fun lt!587744 () V!53219)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!164 ((_ BitVec 64) (_ BitVec 64) V!53219 ListLongMap!20993) Unit!43556)

(assert (=> b!1321899 (= lt!587750 (lemmaInListMapAfterAddingDiffThenInBefore!164 k0!1164 (select (arr!43022 _keys!1609) from!2000) lt!587744 lt!587748))))

(declare-fun lt!587747 () ListLongMap!20993)

(assert (=> b!1321899 (contains!8667 lt!587747 k0!1164)))

(declare-fun lt!587743 () Unit!43556)

(assert (=> b!1321899 (= lt!587743 (lemmaInListMapAfterAddingDiffThenInBefore!164 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587747))))

(declare-fun lt!587746 () ListLongMap!20993)

(assert (=> b!1321899 (contains!8667 lt!587746 k0!1164)))

(declare-fun lt!587745 () Unit!43556)

(assert (=> b!1321899 (= lt!587745 (lemmaInListMapAfterAddingDiffThenInBefore!164 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587746))))

(assert (=> b!1321899 (= lt!587746 (+!4568 lt!587747 lt!587751))))

(assert (=> b!1321899 (= lt!587751 (tuple2!23337 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1321899 (= lt!587747 (+!4568 lt!587748 (tuple2!23337 (select (arr!43022 _keys!1609) from!2000) lt!587744)))))

(declare-fun get!21648 (ValueCell!17145 V!53219) V!53219)

(declare-fun dynLambda!3507 (Int (_ BitVec 64)) V!53219)

(assert (=> b!1321899 (= lt!587744 (get!21648 (select (arr!43023 _values!1337) from!2000) (dynLambda!3507 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6203 (array!89096 array!89098 (_ BitVec 32) (_ BitVec 32) V!53219 V!53219 (_ BitVec 32) Int) ListLongMap!20993)

(assert (=> b!1321899 (= lt!587748 (getCurrentListMapNoExtraKeys!6203 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1321900 () Bool)

(declare-fun res!877383 () Bool)

(assert (=> b!1321900 (=> (not res!877383) (not e!753840))))

(declare-datatypes ((List!30485 0))(
  ( (Nil!30482) (Cons!30481 (h!31690 (_ BitVec 64)) (t!44301 List!30485)) )
))
(declare-fun arrayNoDuplicates!0 (array!89096 (_ BitVec 32) List!30485) Bool)

(assert (=> b!1321900 (= res!877383 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30482))))

(assert (= (and start!111610 res!877384) b!1321892))

(assert (= (and b!1321892 res!877388) b!1321891))

(assert (= (and b!1321891 res!877387) b!1321900))

(assert (= (and b!1321900 res!877383) b!1321894))

(assert (= (and b!1321894 res!877386) b!1321890))

(assert (= (and b!1321890 res!877381) b!1321897))

(assert (= (and b!1321897 res!877382) b!1321895))

(assert (= (and b!1321895 res!877385) b!1321899))

(assert (= (and b!1321893 condMapEmpty!55778) mapIsEmpty!55778))

(assert (= (and b!1321893 (not condMapEmpty!55778)) mapNonEmpty!55778))

(get-info :version)

(assert (= (and mapNonEmpty!55778 ((_ is ValueCellFull!17145) mapValue!55778)) b!1321898))

(assert (= (and b!1321893 ((_ is ValueCellFull!17145) mapDefault!55778)) b!1321896))

(assert (= start!111610 b!1321893))

(declare-fun b_lambda!23593 () Bool)

(assert (=> (not b_lambda!23593) (not b!1321899)))

(declare-fun t!44299 () Bool)

(declare-fun tb!11619 () Bool)

(assert (=> (and start!111610 (= defaultEntry!1340 defaultEntry!1340) t!44299) tb!11619))

(declare-fun result!24293 () Bool)

(assert (=> tb!11619 (= result!24293 tp_is_empty!36087)))

(assert (=> b!1321899 t!44299))

(declare-fun b_and!48695 () Bool)

(assert (= b_and!48693 (and (=> t!44299 result!24293) b_and!48695)))

(declare-fun m!1209941 () Bool)

(assert (=> b!1321900 m!1209941))

(declare-fun m!1209943 () Bool)

(assert (=> start!111610 m!1209943))

(declare-fun m!1209945 () Bool)

(assert (=> start!111610 m!1209945))

(declare-fun m!1209947 () Bool)

(assert (=> start!111610 m!1209947))

(declare-fun m!1209949 () Bool)

(assert (=> b!1321895 m!1209949))

(assert (=> b!1321895 m!1209949))

(declare-fun m!1209951 () Bool)

(assert (=> b!1321895 m!1209951))

(declare-fun m!1209953 () Bool)

(assert (=> mapNonEmpty!55778 m!1209953))

(declare-fun m!1209955 () Bool)

(assert (=> b!1321890 m!1209955))

(assert (=> b!1321890 m!1209955))

(declare-fun m!1209957 () Bool)

(assert (=> b!1321890 m!1209957))

(declare-fun m!1209959 () Bool)

(assert (=> b!1321899 m!1209959))

(declare-fun m!1209961 () Bool)

(assert (=> b!1321899 m!1209961))

(declare-fun m!1209963 () Bool)

(assert (=> b!1321899 m!1209963))

(declare-fun m!1209965 () Bool)

(assert (=> b!1321899 m!1209965))

(declare-fun m!1209967 () Bool)

(assert (=> b!1321899 m!1209967))

(declare-fun m!1209969 () Bool)

(assert (=> b!1321899 m!1209969))

(assert (=> b!1321899 m!1209969))

(declare-fun m!1209971 () Bool)

(assert (=> b!1321899 m!1209971))

(declare-fun m!1209973 () Bool)

(assert (=> b!1321899 m!1209973))

(assert (=> b!1321899 m!1209949))

(declare-fun m!1209975 () Bool)

(assert (=> b!1321899 m!1209975))

(assert (=> b!1321899 m!1209975))

(declare-fun m!1209977 () Bool)

(assert (=> b!1321899 m!1209977))

(declare-fun m!1209979 () Bool)

(assert (=> b!1321899 m!1209979))

(declare-fun m!1209981 () Bool)

(assert (=> b!1321899 m!1209981))

(assert (=> b!1321899 m!1209971))

(assert (=> b!1321899 m!1209949))

(declare-fun m!1209983 () Bool)

(assert (=> b!1321899 m!1209983))

(declare-fun m!1209985 () Bool)

(assert (=> b!1321899 m!1209985))

(declare-fun m!1209987 () Bool)

(assert (=> b!1321899 m!1209987))

(declare-fun m!1209989 () Bool)

(assert (=> b!1321891 m!1209989))

(assert (=> b!1321897 m!1209949))

(check-sat (not b!1321900) (not b!1321891) (not b!1321899) (not mapNonEmpty!55778) (not b!1321895) (not start!111610) (not b_next!30267) tp_is_empty!36087 (not b_lambda!23593) (not b!1321890) b_and!48695)
(check-sat b_and!48695 (not b_next!30267))
