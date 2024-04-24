; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100588 () Bool)

(assert start!100588)

(declare-fun b!1198894 () Bool)

(declare-fun res!797509 () Bool)

(declare-fun e!681182 () Bool)

(assert (=> b!1198894 (=> (not res!797509) (not e!681182))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1198894 (= res!797509 (validKeyInArray!0 k0!934))))

(declare-fun b!1198895 () Bool)

(declare-fun res!797510 () Bool)

(assert (=> b!1198895 (=> (not res!797510) (not e!681182))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!77609 0))(
  ( (array!77610 (arr!37444 (Array (_ BitVec 32) (_ BitVec 64))) (size!37981 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77609)

(assert (=> b!1198895 (= res!797510 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37981 _keys!1208))))))

(declare-fun b!1198896 () Bool)

(declare-fun res!797505 () Bool)

(assert (=> b!1198896 (=> (not res!797505) (not e!681182))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45657 0))(
  ( (V!45658 (val!15255 Int)) )
))
(declare-datatypes ((ValueCell!14489 0))(
  ( (ValueCellFull!14489 (v!17889 V!45657)) (EmptyCell!14489) )
))
(declare-datatypes ((array!77611 0))(
  ( (array!77612 (arr!37445 (Array (_ BitVec 32) ValueCell!14489)) (size!37982 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77611)

(assert (=> b!1198896 (= res!797505 (and (= (size!37982 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37981 _keys!1208) (size!37982 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1198897 () Bool)

(declare-fun res!797503 () Bool)

(assert (=> b!1198897 (=> (not res!797503) (not e!681182))))

(assert (=> b!1198897 (= res!797503 (= (select (arr!37444 _keys!1208) i!673) k0!934))))

(declare-fun b!1198898 () Bool)

(declare-fun e!681178 () Bool)

(assert (=> b!1198898 (= e!681178 (not true))))

(declare-fun arrayContainsKey!0 (array!77609 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1198898 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39675 0))(
  ( (Unit!39676) )
))
(declare-fun lt!543807 () Unit!39675)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77609 (_ BitVec 64) (_ BitVec 32)) Unit!39675)

(assert (=> b!1198898 (= lt!543807 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1198899 () Bool)

(declare-fun e!681181 () Bool)

(declare-fun e!681180 () Bool)

(declare-fun mapRes!47435 () Bool)

(assert (=> b!1198899 (= e!681181 (and e!681180 mapRes!47435))))

(declare-fun condMapEmpty!47435 () Bool)

(declare-fun mapDefault!47435 () ValueCell!14489)

(assert (=> b!1198899 (= condMapEmpty!47435 (= (arr!37445 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14489)) mapDefault!47435)))))

(declare-fun mapIsEmpty!47435 () Bool)

(assert (=> mapIsEmpty!47435 mapRes!47435))

(declare-fun b!1198900 () Bool)

(declare-fun res!797511 () Bool)

(assert (=> b!1198900 (=> (not res!797511) (not e!681182))))

(declare-datatypes ((List!26358 0))(
  ( (Nil!26355) (Cons!26354 (h!27572 (_ BitVec 64)) (t!39051 List!26358)) )
))
(declare-fun arrayNoDuplicates!0 (array!77609 (_ BitVec 32) List!26358) Bool)

(assert (=> b!1198900 (= res!797511 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26355))))

(declare-fun res!797504 () Bool)

(assert (=> start!100588 (=> (not res!797504) (not e!681182))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100588 (= res!797504 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37981 _keys!1208))))))

(assert (=> start!100588 e!681182))

(declare-fun array_inv!28608 (array!77609) Bool)

(assert (=> start!100588 (array_inv!28608 _keys!1208)))

(assert (=> start!100588 true))

(declare-fun array_inv!28609 (array!77611) Bool)

(assert (=> start!100588 (and (array_inv!28609 _values!996) e!681181)))

(declare-fun b!1198901 () Bool)

(declare-fun e!681183 () Bool)

(declare-fun tp_is_empty!30397 () Bool)

(assert (=> b!1198901 (= e!681183 tp_is_empty!30397)))

(declare-fun b!1198902 () Bool)

(declare-fun res!797506 () Bool)

(assert (=> b!1198902 (=> (not res!797506) (not e!681182))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1198902 (= res!797506 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!47435 () Bool)

(declare-fun tp!90090 () Bool)

(assert (=> mapNonEmpty!47435 (= mapRes!47435 (and tp!90090 e!681183))))

(declare-fun mapRest!47435 () (Array (_ BitVec 32) ValueCell!14489))

(declare-fun mapKey!47435 () (_ BitVec 32))

(declare-fun mapValue!47435 () ValueCell!14489)

(assert (=> mapNonEmpty!47435 (= (arr!37445 _values!996) (store mapRest!47435 mapKey!47435 mapValue!47435))))

(declare-fun b!1198903 () Bool)

(assert (=> b!1198903 (= e!681180 tp_is_empty!30397)))

(declare-fun b!1198904 () Bool)

(assert (=> b!1198904 (= e!681182 e!681178)))

(declare-fun res!797507 () Bool)

(assert (=> b!1198904 (=> (not res!797507) (not e!681178))))

(declare-fun lt!543808 () array!77609)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77609 (_ BitVec 32)) Bool)

(assert (=> b!1198904 (= res!797507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543808 mask!1564))))

(assert (=> b!1198904 (= lt!543808 (array!77610 (store (arr!37444 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37981 _keys!1208)))))

(declare-fun b!1198905 () Bool)

(declare-fun res!797512 () Bool)

(assert (=> b!1198905 (=> (not res!797512) (not e!681178))))

(assert (=> b!1198905 (= res!797512 (arrayNoDuplicates!0 lt!543808 #b00000000000000000000000000000000 Nil!26355))))

(declare-fun b!1198906 () Bool)

(declare-fun res!797508 () Bool)

(assert (=> b!1198906 (=> (not res!797508) (not e!681182))))

(assert (=> b!1198906 (= res!797508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!100588 res!797504) b!1198902))

(assert (= (and b!1198902 res!797506) b!1198896))

(assert (= (and b!1198896 res!797505) b!1198906))

(assert (= (and b!1198906 res!797508) b!1198900))

(assert (= (and b!1198900 res!797511) b!1198895))

(assert (= (and b!1198895 res!797510) b!1198894))

(assert (= (and b!1198894 res!797509) b!1198897))

(assert (= (and b!1198897 res!797503) b!1198904))

(assert (= (and b!1198904 res!797507) b!1198905))

(assert (= (and b!1198905 res!797512) b!1198898))

(assert (= (and b!1198899 condMapEmpty!47435) mapIsEmpty!47435))

(assert (= (and b!1198899 (not condMapEmpty!47435)) mapNonEmpty!47435))

(get-info :version)

(assert (= (and mapNonEmpty!47435 ((_ is ValueCellFull!14489) mapValue!47435)) b!1198901))

(assert (= (and b!1198899 ((_ is ValueCellFull!14489) mapDefault!47435)) b!1198903))

(assert (= start!100588 b!1198899))

(declare-fun m!1106179 () Bool)

(assert (=> b!1198905 m!1106179))

(declare-fun m!1106181 () Bool)

(assert (=> b!1198900 m!1106181))

(declare-fun m!1106183 () Bool)

(assert (=> b!1198897 m!1106183))

(declare-fun m!1106185 () Bool)

(assert (=> start!100588 m!1106185))

(declare-fun m!1106187 () Bool)

(assert (=> start!100588 m!1106187))

(declare-fun m!1106189 () Bool)

(assert (=> b!1198894 m!1106189))

(declare-fun m!1106191 () Bool)

(assert (=> b!1198904 m!1106191))

(declare-fun m!1106193 () Bool)

(assert (=> b!1198904 m!1106193))

(declare-fun m!1106195 () Bool)

(assert (=> mapNonEmpty!47435 m!1106195))

(declare-fun m!1106197 () Bool)

(assert (=> b!1198898 m!1106197))

(declare-fun m!1106199 () Bool)

(assert (=> b!1198898 m!1106199))

(declare-fun m!1106201 () Bool)

(assert (=> b!1198906 m!1106201))

(declare-fun m!1106203 () Bool)

(assert (=> b!1198902 m!1106203))

(check-sat (not b!1198902) (not b!1198900) (not b!1198905) (not b!1198906) (not b!1198894) (not mapNonEmpty!47435) (not start!100588) tp_is_empty!30397 (not b!1198904) (not b!1198898))
(check-sat)
