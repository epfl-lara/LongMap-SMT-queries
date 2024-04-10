; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100212 () Bool)

(assert start!100212)

(declare-fun b!1195008 () Bool)

(declare-fun res!795128 () Bool)

(declare-fun e!679107 () Bool)

(assert (=> b!1195008 (=> (not res!795128) (not e!679107))))

(declare-datatypes ((array!77339 0))(
  ( (array!77340 (arr!37316 (Array (_ BitVec 32) (_ BitVec 64))) (size!37852 (_ BitVec 32))) )
))
(declare-fun lt!542862 () array!77339)

(declare-datatypes ((List!26270 0))(
  ( (Nil!26267) (Cons!26266 (h!27475 (_ BitVec 64)) (t!38941 List!26270)) )
))
(declare-fun arrayNoDuplicates!0 (array!77339 (_ BitVec 32) List!26270) Bool)

(assert (=> b!1195008 (= res!795128 (arrayNoDuplicates!0 lt!542862 #b00000000000000000000000000000000 Nil!26267))))

(declare-fun b!1195009 () Bool)

(declare-fun res!795129 () Bool)

(declare-fun e!679110 () Bool)

(assert (=> b!1195009 (=> (not res!795129) (not e!679110))))

(declare-fun _keys!1208 () array!77339)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77339 (_ BitVec 32)) Bool)

(assert (=> b!1195009 (= res!795129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1195010 () Bool)

(declare-fun res!795136 () Bool)

(assert (=> b!1195010 (=> (not res!795136) (not e!679110))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1195010 (= res!795136 (= (select (arr!37316 _keys!1208) i!673) k0!934))))

(declare-fun b!1195011 () Bool)

(declare-fun e!679106 () Bool)

(declare-fun tp_is_empty!30279 () Bool)

(assert (=> b!1195011 (= e!679106 tp_is_empty!30279)))

(declare-fun b!1195012 () Bool)

(declare-fun res!795130 () Bool)

(assert (=> b!1195012 (=> (not res!795130) (not e!679110))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45499 0))(
  ( (V!45500 (val!15196 Int)) )
))
(declare-datatypes ((ValueCell!14430 0))(
  ( (ValueCellFull!14430 (v!17834 V!45499)) (EmptyCell!14430) )
))
(declare-datatypes ((array!77341 0))(
  ( (array!77342 (arr!37317 (Array (_ BitVec 32) ValueCell!14430)) (size!37853 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77341)

(assert (=> b!1195012 (= res!795130 (and (= (size!37853 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37852 _keys!1208) (size!37853 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1195013 () Bool)

(declare-fun res!795127 () Bool)

(assert (=> b!1195013 (=> (not res!795127) (not e!679110))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1195013 (= res!795127 (validKeyInArray!0 k0!934))))

(declare-fun b!1195014 () Bool)

(declare-fun e!679108 () Bool)

(assert (=> b!1195014 (= e!679108 tp_is_empty!30279)))

(declare-fun mapNonEmpty!47255 () Bool)

(declare-fun mapRes!47255 () Bool)

(declare-fun tp!89865 () Bool)

(assert (=> mapNonEmpty!47255 (= mapRes!47255 (and tp!89865 e!679106))))

(declare-fun mapKey!47255 () (_ BitVec 32))

(declare-fun mapValue!47255 () ValueCell!14430)

(declare-fun mapRest!47255 () (Array (_ BitVec 32) ValueCell!14430))

(assert (=> mapNonEmpty!47255 (= (arr!37317 _values!996) (store mapRest!47255 mapKey!47255 mapValue!47255))))

(declare-fun b!1195015 () Bool)

(assert (=> b!1195015 (= e!679107 (not true))))

(declare-fun arrayContainsKey!0 (array!77339 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1195015 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39614 0))(
  ( (Unit!39615) )
))
(declare-fun lt!542861 () Unit!39614)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77339 (_ BitVec 64) (_ BitVec 32)) Unit!39614)

(assert (=> b!1195015 (= lt!542861 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1195016 () Bool)

(declare-fun res!795135 () Bool)

(assert (=> b!1195016 (=> (not res!795135) (not e!679110))))

(assert (=> b!1195016 (= res!795135 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37852 _keys!1208))))))

(declare-fun b!1195017 () Bool)

(assert (=> b!1195017 (= e!679110 e!679107)))

(declare-fun res!795132 () Bool)

(assert (=> b!1195017 (=> (not res!795132) (not e!679107))))

(assert (=> b!1195017 (= res!795132 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542862 mask!1564))))

(assert (=> b!1195017 (= lt!542862 (array!77340 (store (arr!37316 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37852 _keys!1208)))))

(declare-fun b!1195018 () Bool)

(declare-fun res!795134 () Bool)

(assert (=> b!1195018 (=> (not res!795134) (not e!679110))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1195018 (= res!795134 (validMask!0 mask!1564))))

(declare-fun b!1195019 () Bool)

(declare-fun e!679111 () Bool)

(assert (=> b!1195019 (= e!679111 (and e!679108 mapRes!47255))))

(declare-fun condMapEmpty!47255 () Bool)

(declare-fun mapDefault!47255 () ValueCell!14430)

(assert (=> b!1195019 (= condMapEmpty!47255 (= (arr!37317 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14430)) mapDefault!47255)))))

(declare-fun b!1195020 () Bool)

(declare-fun res!795131 () Bool)

(assert (=> b!1195020 (=> (not res!795131) (not e!679110))))

(assert (=> b!1195020 (= res!795131 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26267))))

(declare-fun res!795133 () Bool)

(assert (=> start!100212 (=> (not res!795133) (not e!679110))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100212 (= res!795133 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37852 _keys!1208))))))

(assert (=> start!100212 e!679110))

(declare-fun array_inv!28444 (array!77339) Bool)

(assert (=> start!100212 (array_inv!28444 _keys!1208)))

(assert (=> start!100212 true))

(declare-fun array_inv!28445 (array!77341) Bool)

(assert (=> start!100212 (and (array_inv!28445 _values!996) e!679111)))

(declare-fun mapIsEmpty!47255 () Bool)

(assert (=> mapIsEmpty!47255 mapRes!47255))

(assert (= (and start!100212 res!795133) b!1195018))

(assert (= (and b!1195018 res!795134) b!1195012))

(assert (= (and b!1195012 res!795130) b!1195009))

(assert (= (and b!1195009 res!795129) b!1195020))

(assert (= (and b!1195020 res!795131) b!1195016))

(assert (= (and b!1195016 res!795135) b!1195013))

(assert (= (and b!1195013 res!795127) b!1195010))

(assert (= (and b!1195010 res!795136) b!1195017))

(assert (= (and b!1195017 res!795132) b!1195008))

(assert (= (and b!1195008 res!795128) b!1195015))

(assert (= (and b!1195019 condMapEmpty!47255) mapIsEmpty!47255))

(assert (= (and b!1195019 (not condMapEmpty!47255)) mapNonEmpty!47255))

(get-info :version)

(assert (= (and mapNonEmpty!47255 ((_ is ValueCellFull!14430) mapValue!47255)) b!1195011))

(assert (= (and b!1195019 ((_ is ValueCellFull!14430) mapDefault!47255)) b!1195014))

(assert (= start!100212 b!1195019))

(declare-fun m!1102721 () Bool)

(assert (=> b!1195015 m!1102721))

(declare-fun m!1102723 () Bool)

(assert (=> b!1195015 m!1102723))

(declare-fun m!1102725 () Bool)

(assert (=> start!100212 m!1102725))

(declare-fun m!1102727 () Bool)

(assert (=> start!100212 m!1102727))

(declare-fun m!1102729 () Bool)

(assert (=> b!1195009 m!1102729))

(declare-fun m!1102731 () Bool)

(assert (=> b!1195020 m!1102731))

(declare-fun m!1102733 () Bool)

(assert (=> b!1195013 m!1102733))

(declare-fun m!1102735 () Bool)

(assert (=> mapNonEmpty!47255 m!1102735))

(declare-fun m!1102737 () Bool)

(assert (=> b!1195018 m!1102737))

(declare-fun m!1102739 () Bool)

(assert (=> b!1195008 m!1102739))

(declare-fun m!1102741 () Bool)

(assert (=> b!1195010 m!1102741))

(declare-fun m!1102743 () Bool)

(assert (=> b!1195017 m!1102743))

(declare-fun m!1102745 () Bool)

(assert (=> b!1195017 m!1102745))

(check-sat (not b!1195009) (not b!1195013) (not b!1195008) (not b!1195020) (not b!1195017) (not mapNonEmpty!47255) (not b!1195018) (not start!100212) (not b!1195015) tp_is_empty!30279)
(check-sat)
