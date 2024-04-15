; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100346 () Bool)

(assert start!100346)

(declare-fun b!1197481 () Bool)

(declare-fun res!796935 () Bool)

(declare-fun e!680271 () Bool)

(assert (=> b!1197481 (=> (not res!796935) (not e!680271))))

(declare-datatypes ((array!77502 0))(
  ( (array!77503 (arr!37397 (Array (_ BitVec 32) (_ BitVec 64))) (size!37935 (_ BitVec 32))) )
))
(declare-fun lt!543131 () array!77502)

(declare-datatypes ((List!26403 0))(
  ( (Nil!26400) (Cons!26399 (h!27608 (_ BitVec 64)) (t!39095 List!26403)) )
))
(declare-fun arrayNoDuplicates!0 (array!77502 (_ BitVec 32) List!26403) Bool)

(assert (=> b!1197481 (= res!796935 (arrayNoDuplicates!0 lt!543131 #b00000000000000000000000000000000 Nil!26400))))

(declare-fun b!1197482 () Bool)

(declare-fun res!796932 () Bool)

(declare-fun e!680272 () Bool)

(assert (=> b!1197482 (=> (not res!796932) (not e!680272))))

(declare-fun _keys!1208 () array!77502)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1197482 (= res!796932 (= (select (arr!37397 _keys!1208) i!673) k0!934))))

(declare-fun b!1197483 () Bool)

(declare-fun res!796933 () Bool)

(assert (=> b!1197483 (=> (not res!796933) (not e!680272))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1197483 (= res!796933 (validKeyInArray!0 k0!934))))

(declare-fun b!1197484 () Bool)

(declare-fun res!796936 () Bool)

(assert (=> b!1197484 (=> (not res!796936) (not e!680272))))

(assert (=> b!1197484 (= res!796936 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37935 _keys!1208))))))

(declare-fun b!1197485 () Bool)

(assert (=> b!1197485 (= e!680272 e!680271)))

(declare-fun res!796938 () Bool)

(assert (=> b!1197485 (=> (not res!796938) (not e!680271))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77502 (_ BitVec 32)) Bool)

(assert (=> b!1197485 (= res!796938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543131 mask!1564))))

(assert (=> b!1197485 (= lt!543131 (array!77503 (store (arr!37397 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37935 _keys!1208)))))

(declare-fun res!796930 () Bool)

(assert (=> start!100346 (=> (not res!796930) (not e!680272))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100346 (= res!796930 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37935 _keys!1208))))))

(assert (=> start!100346 e!680272))

(declare-fun array_inv!28622 (array!77502) Bool)

(assert (=> start!100346 (array_inv!28622 _keys!1208)))

(assert (=> start!100346 true))

(declare-datatypes ((V!45657 0))(
  ( (V!45658 (val!15255 Int)) )
))
(declare-datatypes ((ValueCell!14489 0))(
  ( (ValueCellFull!14489 (v!17892 V!45657)) (EmptyCell!14489) )
))
(declare-datatypes ((array!77504 0))(
  ( (array!77505 (arr!37398 (Array (_ BitVec 32) ValueCell!14489)) (size!37936 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77504)

(declare-fun e!680269 () Bool)

(declare-fun array_inv!28623 (array!77504) Bool)

(assert (=> start!100346 (and (array_inv!28623 _values!996) e!680269)))

(declare-fun b!1197486 () Bool)

(declare-fun res!796929 () Bool)

(assert (=> b!1197486 (=> (not res!796929) (not e!680272))))

(assert (=> b!1197486 (= res!796929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1197487 () Bool)

(declare-fun res!796934 () Bool)

(assert (=> b!1197487 (=> (not res!796934) (not e!680272))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1197487 (= res!796934 (and (= (size!37936 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37935 _keys!1208) (size!37936 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!47435 () Bool)

(declare-fun mapRes!47435 () Bool)

(declare-fun tp!90090 () Bool)

(declare-fun e!680273 () Bool)

(assert (=> mapNonEmpty!47435 (= mapRes!47435 (and tp!90090 e!680273))))

(declare-fun mapValue!47435 () ValueCell!14489)

(declare-fun mapKey!47435 () (_ BitVec 32))

(declare-fun mapRest!47435 () (Array (_ BitVec 32) ValueCell!14489))

(assert (=> mapNonEmpty!47435 (= (arr!37398 _values!996) (store mapRest!47435 mapKey!47435 mapValue!47435))))

(declare-fun b!1197488 () Bool)

(declare-fun e!680268 () Bool)

(assert (=> b!1197488 (= e!680269 (and e!680268 mapRes!47435))))

(declare-fun condMapEmpty!47435 () Bool)

(declare-fun mapDefault!47435 () ValueCell!14489)

(assert (=> b!1197488 (= condMapEmpty!47435 (= (arr!37398 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14489)) mapDefault!47435)))))

(declare-fun mapIsEmpty!47435 () Bool)

(assert (=> mapIsEmpty!47435 mapRes!47435))

(declare-fun b!1197489 () Bool)

(declare-fun res!796937 () Bool)

(assert (=> b!1197489 (=> (not res!796937) (not e!680272))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1197489 (= res!796937 (validMask!0 mask!1564))))

(declare-fun b!1197490 () Bool)

(declare-fun tp_is_empty!30397 () Bool)

(assert (=> b!1197490 (= e!680268 tp_is_empty!30397)))

(declare-fun b!1197491 () Bool)

(assert (=> b!1197491 (= e!680271 (not true))))

(declare-fun arrayContainsKey!0 (array!77502 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1197491 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39571 0))(
  ( (Unit!39572) )
))
(declare-fun lt!543132 () Unit!39571)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77502 (_ BitVec 64) (_ BitVec 32)) Unit!39571)

(assert (=> b!1197491 (= lt!543132 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1197492 () Bool)

(declare-fun res!796931 () Bool)

(assert (=> b!1197492 (=> (not res!796931) (not e!680272))))

(assert (=> b!1197492 (= res!796931 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26400))))

(declare-fun b!1197493 () Bool)

(assert (=> b!1197493 (= e!680273 tp_is_empty!30397)))

(assert (= (and start!100346 res!796930) b!1197489))

(assert (= (and b!1197489 res!796937) b!1197487))

(assert (= (and b!1197487 res!796934) b!1197486))

(assert (= (and b!1197486 res!796929) b!1197492))

(assert (= (and b!1197492 res!796931) b!1197484))

(assert (= (and b!1197484 res!796936) b!1197483))

(assert (= (and b!1197483 res!796933) b!1197482))

(assert (= (and b!1197482 res!796932) b!1197485))

(assert (= (and b!1197485 res!796938) b!1197481))

(assert (= (and b!1197481 res!796935) b!1197491))

(assert (= (and b!1197488 condMapEmpty!47435) mapIsEmpty!47435))

(assert (= (and b!1197488 (not condMapEmpty!47435)) mapNonEmpty!47435))

(get-info :version)

(assert (= (and mapNonEmpty!47435 ((_ is ValueCellFull!14489) mapValue!47435)) b!1197493))

(assert (= (and b!1197488 ((_ is ValueCellFull!14489) mapDefault!47435)) b!1197490))

(assert (= start!100346 b!1197488))

(declare-fun m!1103997 () Bool)

(assert (=> b!1197481 m!1103997))

(declare-fun m!1103999 () Bool)

(assert (=> start!100346 m!1103999))

(declare-fun m!1104001 () Bool)

(assert (=> start!100346 m!1104001))

(declare-fun m!1104003 () Bool)

(assert (=> mapNonEmpty!47435 m!1104003))

(declare-fun m!1104005 () Bool)

(assert (=> b!1197482 m!1104005))

(declare-fun m!1104007 () Bool)

(assert (=> b!1197485 m!1104007))

(declare-fun m!1104009 () Bool)

(assert (=> b!1197485 m!1104009))

(declare-fun m!1104011 () Bool)

(assert (=> b!1197486 m!1104011))

(declare-fun m!1104013 () Bool)

(assert (=> b!1197483 m!1104013))

(declare-fun m!1104015 () Bool)

(assert (=> b!1197491 m!1104015))

(declare-fun m!1104017 () Bool)

(assert (=> b!1197491 m!1104017))

(declare-fun m!1104019 () Bool)

(assert (=> b!1197492 m!1104019))

(declare-fun m!1104021 () Bool)

(assert (=> b!1197489 m!1104021))

(check-sat (not mapNonEmpty!47435) (not b!1197485) (not start!100346) tp_is_empty!30397 (not b!1197486) (not b!1197492) (not b!1197481) (not b!1197491) (not b!1197489) (not b!1197483))
(check-sat)
