; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100260 () Bool)

(assert start!100260)

(declare-fun b!1195944 () Bool)

(declare-fun e!679541 () Bool)

(declare-fun tp_is_empty!30327 () Bool)

(assert (=> b!1195944 (= e!679541 tp_is_empty!30327)))

(declare-fun b!1195945 () Bool)

(declare-fun res!795853 () Bool)

(declare-fun e!679538 () Bool)

(assert (=> b!1195945 (=> (not res!795853) (not e!679538))))

(declare-datatypes ((array!77435 0))(
  ( (array!77436 (arr!37364 (Array (_ BitVec 32) (_ BitVec 64))) (size!37900 (_ BitVec 32))) )
))
(declare-fun lt!543005 () array!77435)

(declare-datatypes ((List!26291 0))(
  ( (Nil!26288) (Cons!26287 (h!27496 (_ BitVec 64)) (t!38962 List!26291)) )
))
(declare-fun arrayNoDuplicates!0 (array!77435 (_ BitVec 32) List!26291) Bool)

(assert (=> b!1195945 (= res!795853 (arrayNoDuplicates!0 lt!543005 #b00000000000000000000000000000000 Nil!26288))))

(declare-fun b!1195946 () Bool)

(declare-fun res!795849 () Bool)

(declare-fun e!679540 () Bool)

(assert (=> b!1195946 (=> (not res!795849) (not e!679540))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1195946 (= res!795849 (validMask!0 mask!1564))))

(declare-fun b!1195947 () Bool)

(declare-fun res!795848 () Bool)

(assert (=> b!1195947 (=> (not res!795848) (not e!679540))))

(declare-fun _keys!1208 () array!77435)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77435 (_ BitVec 32)) Bool)

(assert (=> b!1195947 (= res!795848 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1195948 () Bool)

(declare-fun res!795854 () Bool)

(assert (=> b!1195948 (=> (not res!795854) (not e!679540))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1195948 (= res!795854 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37900 _keys!1208))))))

(declare-fun b!1195949 () Bool)

(declare-fun res!795847 () Bool)

(assert (=> b!1195949 (=> (not res!795847) (not e!679540))))

(assert (=> b!1195949 (= res!795847 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26288))))

(declare-fun b!1195950 () Bool)

(declare-fun e!679542 () Bool)

(assert (=> b!1195950 (= e!679542 tp_is_empty!30327)))

(declare-fun b!1195951 () Bool)

(declare-fun res!795856 () Bool)

(assert (=> b!1195951 (=> (not res!795856) (not e!679540))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45563 0))(
  ( (V!45564 (val!15220 Int)) )
))
(declare-datatypes ((ValueCell!14454 0))(
  ( (ValueCellFull!14454 (v!17858 V!45563)) (EmptyCell!14454) )
))
(declare-datatypes ((array!77437 0))(
  ( (array!77438 (arr!37365 (Array (_ BitVec 32) ValueCell!14454)) (size!37901 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77437)

(assert (=> b!1195951 (= res!795856 (and (= (size!37901 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37900 _keys!1208) (size!37901 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!47327 () Bool)

(declare-fun mapRes!47327 () Bool)

(assert (=> mapIsEmpty!47327 mapRes!47327))

(declare-fun b!1195953 () Bool)

(assert (=> b!1195953 (= e!679540 e!679538)))

(declare-fun res!795850 () Bool)

(assert (=> b!1195953 (=> (not res!795850) (not e!679538))))

(assert (=> b!1195953 (= res!795850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543005 mask!1564))))

(assert (=> b!1195953 (= lt!543005 (array!77436 (store (arr!37364 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37900 _keys!1208)))))

(declare-fun b!1195954 () Bool)

(declare-fun e!679539 () Bool)

(assert (=> b!1195954 (= e!679539 (and e!679541 mapRes!47327))))

(declare-fun condMapEmpty!47327 () Bool)

(declare-fun mapDefault!47327 () ValueCell!14454)

(assert (=> b!1195954 (= condMapEmpty!47327 (= (arr!37365 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14454)) mapDefault!47327)))))

(declare-fun mapNonEmpty!47327 () Bool)

(declare-fun tp!89937 () Bool)

(assert (=> mapNonEmpty!47327 (= mapRes!47327 (and tp!89937 e!679542))))

(declare-fun mapRest!47327 () (Array (_ BitVec 32) ValueCell!14454))

(declare-fun mapValue!47327 () ValueCell!14454)

(declare-fun mapKey!47327 () (_ BitVec 32))

(assert (=> mapNonEmpty!47327 (= (arr!37365 _values!996) (store mapRest!47327 mapKey!47327 mapValue!47327))))

(declare-fun b!1195955 () Bool)

(assert (=> b!1195955 (= e!679538 (not true))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77435 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1195955 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39652 0))(
  ( (Unit!39653) )
))
(declare-fun lt!543006 () Unit!39652)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77435 (_ BitVec 64) (_ BitVec 32)) Unit!39652)

(assert (=> b!1195955 (= lt!543006 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1195956 () Bool)

(declare-fun res!795852 () Bool)

(assert (=> b!1195956 (=> (not res!795852) (not e!679540))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1195956 (= res!795852 (validKeyInArray!0 k0!934))))

(declare-fun b!1195952 () Bool)

(declare-fun res!795851 () Bool)

(assert (=> b!1195952 (=> (not res!795851) (not e!679540))))

(assert (=> b!1195952 (= res!795851 (= (select (arr!37364 _keys!1208) i!673) k0!934))))

(declare-fun res!795855 () Bool)

(assert (=> start!100260 (=> (not res!795855) (not e!679540))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100260 (= res!795855 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37900 _keys!1208))))))

(assert (=> start!100260 e!679540))

(declare-fun array_inv!28480 (array!77435) Bool)

(assert (=> start!100260 (array_inv!28480 _keys!1208)))

(assert (=> start!100260 true))

(declare-fun array_inv!28481 (array!77437) Bool)

(assert (=> start!100260 (and (array_inv!28481 _values!996) e!679539)))

(assert (= (and start!100260 res!795855) b!1195946))

(assert (= (and b!1195946 res!795849) b!1195951))

(assert (= (and b!1195951 res!795856) b!1195947))

(assert (= (and b!1195947 res!795848) b!1195949))

(assert (= (and b!1195949 res!795847) b!1195948))

(assert (= (and b!1195948 res!795854) b!1195956))

(assert (= (and b!1195956 res!795852) b!1195952))

(assert (= (and b!1195952 res!795851) b!1195953))

(assert (= (and b!1195953 res!795850) b!1195945))

(assert (= (and b!1195945 res!795853) b!1195955))

(assert (= (and b!1195954 condMapEmpty!47327) mapIsEmpty!47327))

(assert (= (and b!1195954 (not condMapEmpty!47327)) mapNonEmpty!47327))

(get-info :version)

(assert (= (and mapNonEmpty!47327 ((_ is ValueCellFull!14454) mapValue!47327)) b!1195950))

(assert (= (and b!1195954 ((_ is ValueCellFull!14454) mapDefault!47327)) b!1195944))

(assert (= start!100260 b!1195954))

(declare-fun m!1103345 () Bool)

(assert (=> b!1195955 m!1103345))

(declare-fun m!1103347 () Bool)

(assert (=> b!1195955 m!1103347))

(declare-fun m!1103349 () Bool)

(assert (=> b!1195956 m!1103349))

(declare-fun m!1103351 () Bool)

(assert (=> b!1195952 m!1103351))

(declare-fun m!1103353 () Bool)

(assert (=> b!1195945 m!1103353))

(declare-fun m!1103355 () Bool)

(assert (=> b!1195947 m!1103355))

(declare-fun m!1103357 () Bool)

(assert (=> start!100260 m!1103357))

(declare-fun m!1103359 () Bool)

(assert (=> start!100260 m!1103359))

(declare-fun m!1103361 () Bool)

(assert (=> b!1195946 m!1103361))

(declare-fun m!1103363 () Bool)

(assert (=> mapNonEmpty!47327 m!1103363))

(declare-fun m!1103365 () Bool)

(assert (=> b!1195949 m!1103365))

(declare-fun m!1103367 () Bool)

(assert (=> b!1195953 m!1103367))

(declare-fun m!1103369 () Bool)

(assert (=> b!1195953 m!1103369))

(check-sat (not b!1195946) (not b!1195949) (not b!1195945) (not b!1195955) (not start!100260) (not b!1195956) (not b!1195953) tp_is_empty!30327 (not b!1195947) (not mapNonEmpty!47327))
(check-sat)
