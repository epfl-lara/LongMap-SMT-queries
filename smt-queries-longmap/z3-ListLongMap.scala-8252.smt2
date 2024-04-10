; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100462 () Bool)

(assert start!100462)

(declare-fun b_free!25785 () Bool)

(declare-fun b_next!25785 () Bool)

(assert (=> start!100462 (= b_free!25785 (not b_next!25785))))

(declare-fun tp!90345 () Bool)

(declare-fun b_and!42457 () Bool)

(assert (=> start!100462 (= tp!90345 b_and!42457)))

(declare-fun res!798534 () Bool)

(declare-fun e!681356 () Bool)

(assert (=> start!100462 (=> (not res!798534) (not e!681356))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!77753 0))(
  ( (array!77754 (arr!37521 (Array (_ BitVec 32) (_ BitVec 64))) (size!38057 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77753)

(assert (=> start!100462 (= res!798534 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38057 _keys!1208))))))

(assert (=> start!100462 e!681356))

(declare-fun tp_is_empty!30489 () Bool)

(assert (=> start!100462 tp_is_empty!30489))

(declare-fun array_inv!28592 (array!77753) Bool)

(assert (=> start!100462 (array_inv!28592 _keys!1208)))

(assert (=> start!100462 true))

(assert (=> start!100462 tp!90345))

(declare-datatypes ((V!45779 0))(
  ( (V!45780 (val!15301 Int)) )
))
(declare-datatypes ((ValueCell!14535 0))(
  ( (ValueCellFull!14535 (v!17939 V!45779)) (EmptyCell!14535) )
))
(declare-datatypes ((array!77755 0))(
  ( (array!77756 (arr!37522 (Array (_ BitVec 32) ValueCell!14535)) (size!38058 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77755)

(declare-fun e!681360 () Bool)

(declare-fun array_inv!28593 (array!77755) Bool)

(assert (=> start!100462 (and (array_inv!28593 _values!996) e!681360)))

(declare-fun b!1199672 () Bool)

(declare-fun res!798533 () Bool)

(assert (=> b!1199672 (=> (not res!798533) (not e!681356))))

(declare-datatypes ((List!26404 0))(
  ( (Nil!26401) (Cons!26400 (h!27609 (_ BitVec 64)) (t!39169 List!26404)) )
))
(declare-fun arrayNoDuplicates!0 (array!77753 (_ BitVec 32) List!26404) Bool)

(assert (=> b!1199672 (= res!798533 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26401))))

(declare-fun b!1199673 () Bool)

(declare-fun e!681361 () Bool)

(assert (=> b!1199673 (= e!681361 tp_is_empty!30489)))

(declare-fun b!1199674 () Bool)

(declare-fun res!798538 () Bool)

(assert (=> b!1199674 (=> (not res!798538) (not e!681356))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1199674 (= res!798538 (validMask!0 mask!1564))))

(declare-fun b!1199675 () Bool)

(declare-fun res!798531 () Bool)

(assert (=> b!1199675 (=> (not res!798531) (not e!681356))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1199675 (= res!798531 (and (= (size!38058 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38057 _keys!1208) (size!38058 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1199676 () Bool)

(declare-fun e!681357 () Bool)

(assert (=> b!1199676 (= e!681356 e!681357)))

(declare-fun res!798536 () Bool)

(assert (=> b!1199676 (=> (not res!798536) (not e!681357))))

(declare-fun lt!543835 () array!77753)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77753 (_ BitVec 32)) Bool)

(assert (=> b!1199676 (= res!798536 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543835 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1199676 (= lt!543835 (array!77754 (store (arr!37521 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38057 _keys!1208)))))

(declare-fun mapNonEmpty!47576 () Bool)

(declare-fun mapRes!47576 () Bool)

(declare-fun tp!90344 () Bool)

(assert (=> mapNonEmpty!47576 (= mapRes!47576 (and tp!90344 e!681361))))

(declare-fun mapValue!47576 () ValueCell!14535)

(declare-fun mapRest!47576 () (Array (_ BitVec 32) ValueCell!14535))

(declare-fun mapKey!47576 () (_ BitVec 32))

(assert (=> mapNonEmpty!47576 (= (arr!37522 _values!996) (store mapRest!47576 mapKey!47576 mapValue!47576))))

(declare-fun b!1199677 () Bool)

(declare-fun e!681359 () Bool)

(assert (=> b!1199677 (= e!681357 (not e!681359))))

(declare-fun res!798539 () Bool)

(assert (=> b!1199677 (=> res!798539 e!681359)))

(assert (=> b!1199677 (= res!798539 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77753 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1199677 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39774 0))(
  ( (Unit!39775) )
))
(declare-fun lt!543834 () Unit!39774)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77753 (_ BitVec 64) (_ BitVec 32)) Unit!39774)

(assert (=> b!1199677 (= lt!543834 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1199678 () Bool)

(declare-fun res!798535 () Bool)

(assert (=> b!1199678 (=> (not res!798535) (not e!681356))))

(assert (=> b!1199678 (= res!798535 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38057 _keys!1208))))))

(declare-fun b!1199679 () Bool)

(declare-fun res!798540 () Bool)

(assert (=> b!1199679 (=> (not res!798540) (not e!681356))))

(assert (=> b!1199679 (= res!798540 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1199680 () Bool)

(declare-fun e!681355 () Bool)

(assert (=> b!1199680 (= e!681360 (and e!681355 mapRes!47576))))

(declare-fun condMapEmpty!47576 () Bool)

(declare-fun mapDefault!47576 () ValueCell!14535)

(assert (=> b!1199680 (= condMapEmpty!47576 (= (arr!37522 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14535)) mapDefault!47576)))))

(declare-fun mapIsEmpty!47576 () Bool)

(assert (=> mapIsEmpty!47576 mapRes!47576))

(declare-fun b!1199681 () Bool)

(assert (=> b!1199681 (= e!681355 tp_is_empty!30489)))

(declare-fun b!1199682 () Bool)

(assert (=> b!1199682 (= e!681359 true)))

(declare-fun zeroValue!944 () V!45779)

(declare-datatypes ((tuple2!19588 0))(
  ( (tuple2!19589 (_1!9805 (_ BitVec 64)) (_2!9805 V!45779)) )
))
(declare-datatypes ((List!26405 0))(
  ( (Nil!26402) (Cons!26401 (h!27610 tuple2!19588) (t!39170 List!26405)) )
))
(declare-datatypes ((ListLongMap!17557 0))(
  ( (ListLongMap!17558 (toList!8794 List!26405)) )
))
(declare-fun lt!543833 () ListLongMap!17557)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45779)

(declare-fun getCurrentListMapNoExtraKeys!5233 (array!77753 array!77755 (_ BitVec 32) (_ BitVec 32) V!45779 V!45779 (_ BitVec 32) Int) ListLongMap!17557)

(declare-fun dynLambda!3153 (Int (_ BitVec 64)) V!45779)

(assert (=> b!1199682 (= lt!543833 (getCurrentListMapNoExtraKeys!5233 lt!543835 (array!77756 (store (arr!37522 _values!996) i!673 (ValueCellFull!14535 (dynLambda!3153 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38058 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!543832 () ListLongMap!17557)

(assert (=> b!1199682 (= lt!543832 (getCurrentListMapNoExtraKeys!5233 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1199683 () Bool)

(declare-fun res!798530 () Bool)

(assert (=> b!1199683 (=> (not res!798530) (not e!681356))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1199683 (= res!798530 (validKeyInArray!0 k0!934))))

(declare-fun b!1199684 () Bool)

(declare-fun res!798537 () Bool)

(assert (=> b!1199684 (=> (not res!798537) (not e!681356))))

(assert (=> b!1199684 (= res!798537 (= (select (arr!37521 _keys!1208) i!673) k0!934))))

(declare-fun b!1199685 () Bool)

(declare-fun res!798532 () Bool)

(assert (=> b!1199685 (=> (not res!798532) (not e!681357))))

(assert (=> b!1199685 (= res!798532 (arrayNoDuplicates!0 lt!543835 #b00000000000000000000000000000000 Nil!26401))))

(assert (= (and start!100462 res!798534) b!1199674))

(assert (= (and b!1199674 res!798538) b!1199675))

(assert (= (and b!1199675 res!798531) b!1199679))

(assert (= (and b!1199679 res!798540) b!1199672))

(assert (= (and b!1199672 res!798533) b!1199678))

(assert (= (and b!1199678 res!798535) b!1199683))

(assert (= (and b!1199683 res!798530) b!1199684))

(assert (= (and b!1199684 res!798537) b!1199676))

(assert (= (and b!1199676 res!798536) b!1199685))

(assert (= (and b!1199685 res!798532) b!1199677))

(assert (= (and b!1199677 (not res!798539)) b!1199682))

(assert (= (and b!1199680 condMapEmpty!47576) mapIsEmpty!47576))

(assert (= (and b!1199680 (not condMapEmpty!47576)) mapNonEmpty!47576))

(get-info :version)

(assert (= (and mapNonEmpty!47576 ((_ is ValueCellFull!14535) mapValue!47576)) b!1199673))

(assert (= (and b!1199680 ((_ is ValueCellFull!14535) mapDefault!47576)) b!1199681))

(assert (= start!100462 b!1199680))

(declare-fun b_lambda!20981 () Bool)

(assert (=> (not b_lambda!20981) (not b!1199682)))

(declare-fun t!39168 () Bool)

(declare-fun tb!10585 () Bool)

(assert (=> (and start!100462 (= defaultEntry!1004 defaultEntry!1004) t!39168) tb!10585))

(declare-fun result!21747 () Bool)

(assert (=> tb!10585 (= result!21747 tp_is_empty!30489)))

(assert (=> b!1199682 t!39168))

(declare-fun b_and!42459 () Bool)

(assert (= b_and!42457 (and (=> t!39168 result!21747) b_and!42459)))

(declare-fun m!1106157 () Bool)

(assert (=> b!1199684 m!1106157))

(declare-fun m!1106159 () Bool)

(assert (=> b!1199682 m!1106159))

(declare-fun m!1106161 () Bool)

(assert (=> b!1199682 m!1106161))

(declare-fun m!1106163 () Bool)

(assert (=> b!1199682 m!1106163))

(declare-fun m!1106165 () Bool)

(assert (=> b!1199682 m!1106165))

(declare-fun m!1106167 () Bool)

(assert (=> b!1199685 m!1106167))

(declare-fun m!1106169 () Bool)

(assert (=> b!1199683 m!1106169))

(declare-fun m!1106171 () Bool)

(assert (=> mapNonEmpty!47576 m!1106171))

(declare-fun m!1106173 () Bool)

(assert (=> start!100462 m!1106173))

(declare-fun m!1106175 () Bool)

(assert (=> start!100462 m!1106175))

(declare-fun m!1106177 () Bool)

(assert (=> b!1199674 m!1106177))

(declare-fun m!1106179 () Bool)

(assert (=> b!1199679 m!1106179))

(declare-fun m!1106181 () Bool)

(assert (=> b!1199677 m!1106181))

(declare-fun m!1106183 () Bool)

(assert (=> b!1199677 m!1106183))

(declare-fun m!1106185 () Bool)

(assert (=> b!1199676 m!1106185))

(declare-fun m!1106187 () Bool)

(assert (=> b!1199676 m!1106187))

(declare-fun m!1106189 () Bool)

(assert (=> b!1199672 m!1106189))

(check-sat (not b_next!25785) (not b!1199682) (not b!1199672) (not b!1199679) (not b!1199676) (not b!1199685) (not start!100462) (not b!1199677) (not b!1199683) tp_is_empty!30489 b_and!42459 (not b_lambda!20981) (not b!1199674) (not mapNonEmpty!47576))
(check-sat b_and!42459 (not b_next!25785))
