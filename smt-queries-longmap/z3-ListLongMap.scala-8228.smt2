; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100270 () Bool)

(assert start!100270)

(declare-fun b!1196133 () Bool)

(declare-fun res!796027 () Bool)

(declare-fun e!679608 () Bool)

(assert (=> b!1196133 (=> (not res!796027) (not e!679608))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1196133 (= res!796027 (validMask!0 mask!1564))))

(declare-fun b!1196134 () Bool)

(declare-fun res!796030 () Bool)

(assert (=> b!1196134 (=> (not res!796030) (not e!679608))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1196134 (= res!796030 (validKeyInArray!0 k0!934))))

(declare-fun b!1196135 () Bool)

(declare-fun e!679605 () Bool)

(declare-fun e!679606 () Bool)

(declare-fun mapRes!47351 () Bool)

(assert (=> b!1196135 (= e!679605 (and e!679606 mapRes!47351))))

(declare-fun condMapEmpty!47351 () Bool)

(declare-datatypes ((V!45585 0))(
  ( (V!45586 (val!15228 Int)) )
))
(declare-datatypes ((ValueCell!14462 0))(
  ( (ValueCellFull!14462 (v!17865 V!45585)) (EmptyCell!14462) )
))
(declare-datatypes ((array!77396 0))(
  ( (array!77397 (arr!37345 (Array (_ BitVec 32) ValueCell!14462)) (size!37883 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77396)

(declare-fun mapDefault!47351 () ValueCell!14462)

(assert (=> b!1196135 (= condMapEmpty!47351 (= (arr!37345 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14462)) mapDefault!47351)))))

(declare-fun b!1196136 () Bool)

(declare-fun res!796022 () Bool)

(assert (=> b!1196136 (=> (not res!796022) (not e!679608))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((array!77398 0))(
  ( (array!77399 (arr!37346 (Array (_ BitVec 32) (_ BitVec 64))) (size!37884 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77398)

(assert (=> b!1196136 (= res!796022 (and (= (size!37883 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37884 _keys!1208) (size!37883 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!47351 () Bool)

(assert (=> mapIsEmpty!47351 mapRes!47351))

(declare-fun b!1196137 () Bool)

(declare-fun tp_is_empty!30343 () Bool)

(assert (=> b!1196137 (= e!679606 tp_is_empty!30343)))

(declare-fun mapNonEmpty!47351 () Bool)

(declare-fun tp!89961 () Bool)

(declare-fun e!679607 () Bool)

(assert (=> mapNonEmpty!47351 (= mapRes!47351 (and tp!89961 e!679607))))

(declare-fun mapRest!47351 () (Array (_ BitVec 32) ValueCell!14462))

(declare-fun mapKey!47351 () (_ BitVec 32))

(declare-fun mapValue!47351 () ValueCell!14462)

(assert (=> mapNonEmpty!47351 (= (arr!37345 _values!996) (store mapRest!47351 mapKey!47351 mapValue!47351))))

(declare-fun b!1196132 () Bool)

(declare-fun e!679609 () Bool)

(assert (=> b!1196132 (= e!679609 (not true))))

(declare-fun arrayContainsKey!0 (array!77398 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1196132 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!39537 0))(
  ( (Unit!39538) )
))
(declare-fun lt!542861 () Unit!39537)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77398 (_ BitVec 64) (_ BitVec 32)) Unit!39537)

(assert (=> b!1196132 (= lt!542861 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!796026 () Bool)

(assert (=> start!100270 (=> (not res!796026) (not e!679608))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100270 (= res!796026 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37884 _keys!1208))))))

(assert (=> start!100270 e!679608))

(declare-fun array_inv!28588 (array!77398) Bool)

(assert (=> start!100270 (array_inv!28588 _keys!1208)))

(assert (=> start!100270 true))

(declare-fun array_inv!28589 (array!77396) Bool)

(assert (=> start!100270 (and (array_inv!28589 _values!996) e!679605)))

(declare-fun b!1196138 () Bool)

(assert (=> b!1196138 (= e!679607 tp_is_empty!30343)))

(declare-fun b!1196139 () Bool)

(declare-fun res!796023 () Bool)

(assert (=> b!1196139 (=> (not res!796023) (not e!679608))))

(declare-datatypes ((List!26372 0))(
  ( (Nil!26369) (Cons!26368 (h!27577 (_ BitVec 64)) (t!39034 List!26372)) )
))
(declare-fun arrayNoDuplicates!0 (array!77398 (_ BitVec 32) List!26372) Bool)

(assert (=> b!1196139 (= res!796023 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26369))))

(declare-fun b!1196140 () Bool)

(declare-fun res!796021 () Bool)

(assert (=> b!1196140 (=> (not res!796021) (not e!679609))))

(declare-fun lt!542862 () array!77398)

(assert (=> b!1196140 (= res!796021 (arrayNoDuplicates!0 lt!542862 #b00000000000000000000000000000000 Nil!26369))))

(declare-fun b!1196141 () Bool)

(assert (=> b!1196141 (= e!679608 e!679609)))

(declare-fun res!796024 () Bool)

(assert (=> b!1196141 (=> (not res!796024) (not e!679609))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77398 (_ BitVec 32)) Bool)

(assert (=> b!1196141 (= res!796024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542862 mask!1564))))

(assert (=> b!1196141 (= lt!542862 (array!77399 (store (arr!37346 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37884 _keys!1208)))))

(declare-fun b!1196142 () Bool)

(declare-fun res!796029 () Bool)

(assert (=> b!1196142 (=> (not res!796029) (not e!679608))))

(assert (=> b!1196142 (= res!796029 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37884 _keys!1208))))))

(declare-fun b!1196143 () Bool)

(declare-fun res!796028 () Bool)

(assert (=> b!1196143 (=> (not res!796028) (not e!679608))))

(assert (=> b!1196143 (= res!796028 (= (select (arr!37346 _keys!1208) i!673) k0!934))))

(declare-fun b!1196144 () Bool)

(declare-fun res!796025 () Bool)

(assert (=> b!1196144 (=> (not res!796025) (not e!679608))))

(assert (=> b!1196144 (= res!796025 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!100270 res!796026) b!1196133))

(assert (= (and b!1196133 res!796027) b!1196136))

(assert (= (and b!1196136 res!796022) b!1196144))

(assert (= (and b!1196144 res!796025) b!1196139))

(assert (= (and b!1196139 res!796023) b!1196142))

(assert (= (and b!1196142 res!796029) b!1196134))

(assert (= (and b!1196134 res!796030) b!1196143))

(assert (= (and b!1196143 res!796028) b!1196141))

(assert (= (and b!1196141 res!796024) b!1196140))

(assert (= (and b!1196140 res!796021) b!1196132))

(assert (= (and b!1196135 condMapEmpty!47351) mapIsEmpty!47351))

(assert (= (and b!1196135 (not condMapEmpty!47351)) mapNonEmpty!47351))

(get-info :version)

(assert (= (and mapNonEmpty!47351 ((_ is ValueCellFull!14462) mapValue!47351)) b!1196138))

(assert (= (and b!1196135 ((_ is ValueCellFull!14462) mapDefault!47351)) b!1196137))

(assert (= start!100270 b!1196135))

(declare-fun m!1102943 () Bool)

(assert (=> b!1196134 m!1102943))

(declare-fun m!1102945 () Bool)

(assert (=> b!1196143 m!1102945))

(declare-fun m!1102947 () Bool)

(assert (=> b!1196132 m!1102947))

(declare-fun m!1102949 () Bool)

(assert (=> b!1196132 m!1102949))

(declare-fun m!1102951 () Bool)

(assert (=> b!1196144 m!1102951))

(declare-fun m!1102953 () Bool)

(assert (=> start!100270 m!1102953))

(declare-fun m!1102955 () Bool)

(assert (=> start!100270 m!1102955))

(declare-fun m!1102957 () Bool)

(assert (=> b!1196140 m!1102957))

(declare-fun m!1102959 () Bool)

(assert (=> b!1196141 m!1102959))

(declare-fun m!1102961 () Bool)

(assert (=> b!1196141 m!1102961))

(declare-fun m!1102963 () Bool)

(assert (=> mapNonEmpty!47351 m!1102963))

(declare-fun m!1102965 () Bool)

(assert (=> b!1196139 m!1102965))

(declare-fun m!1102967 () Bool)

(assert (=> b!1196133 m!1102967))

(check-sat (not b!1196133) (not b!1196144) (not mapNonEmpty!47351) tp_is_empty!30343 (not b!1196139) (not b!1196132) (not b!1196140) (not start!100270) (not b!1196141) (not b!1196134))
(check-sat)
