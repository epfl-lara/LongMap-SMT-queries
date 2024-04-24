; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100726 () Bool)

(assert start!100726)

(declare-fun b_free!25813 () Bool)

(declare-fun b_next!25813 () Bool)

(assert (=> start!100726 (= b_free!25813 (not b_next!25813))))

(declare-fun tp!90429 () Bool)

(declare-fun b_and!42515 () Bool)

(assert (=> start!100726 (= tp!90429 b_and!42515)))

(declare-fun res!799507 () Bool)

(declare-fun e!682484 () Bool)

(assert (=> start!100726 (=> (not res!799507) (not e!682484))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!77845 0))(
  ( (array!77846 (arr!37561 (Array (_ BitVec 32) (_ BitVec 64))) (size!38098 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77845)

(assert (=> start!100726 (= res!799507 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38098 _keys!1208))))))

(assert (=> start!100726 e!682484))

(declare-fun tp_is_empty!30517 () Bool)

(assert (=> start!100726 tp_is_empty!30517))

(declare-fun array_inv!28690 (array!77845) Bool)

(assert (=> start!100726 (array_inv!28690 _keys!1208)))

(assert (=> start!100726 true))

(assert (=> start!100726 tp!90429))

(declare-datatypes ((V!45817 0))(
  ( (V!45818 (val!15315 Int)) )
))
(declare-datatypes ((ValueCell!14549 0))(
  ( (ValueCellFull!14549 (v!17949 V!45817)) (EmptyCell!14549) )
))
(declare-datatypes ((array!77847 0))(
  ( (array!77848 (arr!37562 (Array (_ BitVec 32) ValueCell!14549)) (size!38099 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77847)

(declare-fun e!682483 () Bool)

(declare-fun array_inv!28691 (array!77847) Bool)

(assert (=> start!100726 (and (array_inv!28691 _values!996) e!682483)))

(declare-fun b!1201577 () Bool)

(declare-fun e!682486 () Bool)

(assert (=> b!1201577 (= e!682484 e!682486)))

(declare-fun res!799500 () Bool)

(assert (=> b!1201577 (=> (not res!799500) (not e!682486))))

(declare-fun lt!544487 () array!77845)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77845 (_ BitVec 32)) Bool)

(assert (=> b!1201577 (= res!799500 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544487 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1201577 (= lt!544487 (array!77846 (store (arr!37561 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38098 _keys!1208)))))

(declare-fun mapIsEmpty!47618 () Bool)

(declare-fun mapRes!47618 () Bool)

(assert (=> mapIsEmpty!47618 mapRes!47618))

(declare-fun b!1201578 () Bool)

(declare-fun e!682482 () Bool)

(assert (=> b!1201578 (= e!682483 (and e!682482 mapRes!47618))))

(declare-fun condMapEmpty!47618 () Bool)

(declare-fun mapDefault!47618 () ValueCell!14549)

(assert (=> b!1201578 (= condMapEmpty!47618 (= (arr!37562 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14549)) mapDefault!47618)))))

(declare-fun b!1201579 () Bool)

(declare-fun res!799505 () Bool)

(assert (=> b!1201579 (=> (not res!799505) (not e!682484))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1201579 (= res!799505 (validMask!0 mask!1564))))

(declare-fun b!1201580 () Bool)

(declare-fun res!799506 () Bool)

(assert (=> b!1201580 (=> (not res!799506) (not e!682484))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1201580 (= res!799506 (= (select (arr!37561 _keys!1208) i!673) k0!934))))

(declare-fun e!682485 () Bool)

(declare-fun b!1201581 () Bool)

(assert (=> b!1201581 (= e!682485 (or (not (= from!1455 i!673)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!38098 _keys!1208)) (bvslt (bvsub (size!38098 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (bvsub (size!38098 _keys!1208) from!1455))))))

(declare-fun zeroValue!944 () V!45817)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45817)

(declare-datatypes ((tuple2!19624 0))(
  ( (tuple2!19625 (_1!9823 (_ BitVec 64)) (_2!9823 V!45817)) )
))
(declare-datatypes ((List!26440 0))(
  ( (Nil!26437) (Cons!26436 (h!27654 tuple2!19624) (t!39225 List!26440)) )
))
(declare-datatypes ((ListLongMap!17601 0))(
  ( (ListLongMap!17602 (toList!8816 List!26440)) )
))
(declare-fun lt!544485 () ListLongMap!17601)

(declare-fun getCurrentListMapNoExtraKeys!5283 (array!77845 array!77847 (_ BitVec 32) (_ BitVec 32) V!45817 V!45817 (_ BitVec 32) Int) ListLongMap!17601)

(declare-fun dynLambda!3227 (Int (_ BitVec 64)) V!45817)

(assert (=> b!1201581 (= lt!544485 (getCurrentListMapNoExtraKeys!5283 lt!544487 (array!77848 (store (arr!37562 _values!996) i!673 (ValueCellFull!14549 (dynLambda!3227 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38099 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!544486 () ListLongMap!17601)

(assert (=> b!1201581 (= lt!544486 (getCurrentListMapNoExtraKeys!5283 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1201582 () Bool)

(declare-fun res!799510 () Bool)

(assert (=> b!1201582 (=> (not res!799510) (not e!682484))))

(assert (=> b!1201582 (= res!799510 (and (= (size!38099 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38098 _keys!1208) (size!38099 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1201583 () Bool)

(declare-fun res!799508 () Bool)

(assert (=> b!1201583 (=> (not res!799508) (not e!682486))))

(declare-datatypes ((List!26441 0))(
  ( (Nil!26438) (Cons!26437 (h!27655 (_ BitVec 64)) (t!39226 List!26441)) )
))
(declare-fun arrayNoDuplicates!0 (array!77845 (_ BitVec 32) List!26441) Bool)

(assert (=> b!1201583 (= res!799508 (arrayNoDuplicates!0 lt!544487 #b00000000000000000000000000000000 Nil!26438))))

(declare-fun mapNonEmpty!47618 () Bool)

(declare-fun tp!90428 () Bool)

(declare-fun e!682487 () Bool)

(assert (=> mapNonEmpty!47618 (= mapRes!47618 (and tp!90428 e!682487))))

(declare-fun mapRest!47618 () (Array (_ BitVec 32) ValueCell!14549))

(declare-fun mapKey!47618 () (_ BitVec 32))

(declare-fun mapValue!47618 () ValueCell!14549)

(assert (=> mapNonEmpty!47618 (= (arr!37562 _values!996) (store mapRest!47618 mapKey!47618 mapValue!47618))))

(declare-fun b!1201584 () Bool)

(declare-fun res!799501 () Bool)

(assert (=> b!1201584 (=> (not res!799501) (not e!682484))))

(assert (=> b!1201584 (= res!799501 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38098 _keys!1208))))))

(declare-fun b!1201585 () Bool)

(assert (=> b!1201585 (= e!682486 (not e!682485))))

(declare-fun res!799509 () Bool)

(assert (=> b!1201585 (=> res!799509 e!682485)))

(assert (=> b!1201585 (= res!799509 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77845 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1201585 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39759 0))(
  ( (Unit!39760) )
))
(declare-fun lt!544484 () Unit!39759)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77845 (_ BitVec 64) (_ BitVec 32)) Unit!39759)

(assert (=> b!1201585 (= lt!544484 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1201586 () Bool)

(assert (=> b!1201586 (= e!682482 tp_is_empty!30517)))

(declare-fun b!1201587 () Bool)

(declare-fun res!799502 () Bool)

(assert (=> b!1201587 (=> (not res!799502) (not e!682484))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1201587 (= res!799502 (validKeyInArray!0 k0!934))))

(declare-fun b!1201588 () Bool)

(declare-fun res!799503 () Bool)

(assert (=> b!1201588 (=> (not res!799503) (not e!682484))))

(assert (=> b!1201588 (= res!799503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1201589 () Bool)

(assert (=> b!1201589 (= e!682487 tp_is_empty!30517)))

(declare-fun b!1201590 () Bool)

(declare-fun res!799504 () Bool)

(assert (=> b!1201590 (=> (not res!799504) (not e!682484))))

(assert (=> b!1201590 (= res!799504 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26438))))

(assert (= (and start!100726 res!799507) b!1201579))

(assert (= (and b!1201579 res!799505) b!1201582))

(assert (= (and b!1201582 res!799510) b!1201588))

(assert (= (and b!1201588 res!799503) b!1201590))

(assert (= (and b!1201590 res!799504) b!1201584))

(assert (= (and b!1201584 res!799501) b!1201587))

(assert (= (and b!1201587 res!799502) b!1201580))

(assert (= (and b!1201580 res!799506) b!1201577))

(assert (= (and b!1201577 res!799500) b!1201583))

(assert (= (and b!1201583 res!799508) b!1201585))

(assert (= (and b!1201585 (not res!799509)) b!1201581))

(assert (= (and b!1201578 condMapEmpty!47618) mapIsEmpty!47618))

(assert (= (and b!1201578 (not condMapEmpty!47618)) mapNonEmpty!47618))

(get-info :version)

(assert (= (and mapNonEmpty!47618 ((_ is ValueCellFull!14549) mapValue!47618)) b!1201589))

(assert (= (and b!1201578 ((_ is ValueCellFull!14549) mapDefault!47618)) b!1201586))

(assert (= start!100726 b!1201578))

(declare-fun b_lambda!21003 () Bool)

(assert (=> (not b_lambda!21003) (not b!1201581)))

(declare-fun t!39224 () Bool)

(declare-fun tb!10605 () Bool)

(assert (=> (and start!100726 (= defaultEntry!1004 defaultEntry!1004) t!39224) tb!10605))

(declare-fun result!21795 () Bool)

(assert (=> tb!10605 (= result!21795 tp_is_empty!30517)))

(assert (=> b!1201581 t!39224))

(declare-fun b_and!42517 () Bool)

(assert (= b_and!42515 (and (=> t!39224 result!21795) b_and!42517)))

(declare-fun m!1108205 () Bool)

(assert (=> b!1201585 m!1108205))

(declare-fun m!1108207 () Bool)

(assert (=> b!1201585 m!1108207))

(declare-fun m!1108209 () Bool)

(assert (=> b!1201590 m!1108209))

(declare-fun m!1108211 () Bool)

(assert (=> b!1201580 m!1108211))

(declare-fun m!1108213 () Bool)

(assert (=> b!1201581 m!1108213))

(declare-fun m!1108215 () Bool)

(assert (=> b!1201581 m!1108215))

(declare-fun m!1108217 () Bool)

(assert (=> b!1201581 m!1108217))

(declare-fun m!1108219 () Bool)

(assert (=> b!1201581 m!1108219))

(declare-fun m!1108221 () Bool)

(assert (=> b!1201577 m!1108221))

(declare-fun m!1108223 () Bool)

(assert (=> b!1201577 m!1108223))

(declare-fun m!1108225 () Bool)

(assert (=> start!100726 m!1108225))

(declare-fun m!1108227 () Bool)

(assert (=> start!100726 m!1108227))

(declare-fun m!1108229 () Bool)

(assert (=> mapNonEmpty!47618 m!1108229))

(declare-fun m!1108231 () Bool)

(assert (=> b!1201583 m!1108231))

(declare-fun m!1108233 () Bool)

(assert (=> b!1201588 m!1108233))

(declare-fun m!1108235 () Bool)

(assert (=> b!1201579 m!1108235))

(declare-fun m!1108237 () Bool)

(assert (=> b!1201587 m!1108237))

(check-sat (not start!100726) (not b!1201581) (not b_next!25813) tp_is_empty!30517 (not b!1201585) (not b!1201587) (not b_lambda!21003) (not b!1201583) (not b!1201590) (not b!1201579) (not mapNonEmpty!47618) (not b!1201577) (not b!1201588) b_and!42517)
(check-sat b_and!42517 (not b_next!25813))
