; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100266 () Bool)

(assert start!100266)

(declare-fun mapNonEmpty!47336 () Bool)

(declare-fun mapRes!47336 () Bool)

(declare-fun tp!89946 () Bool)

(declare-fun e!679596 () Bool)

(assert (=> mapNonEmpty!47336 (= mapRes!47336 (and tp!89946 e!679596))))

(declare-fun mapKey!47336 () (_ BitVec 32))

(declare-datatypes ((V!45571 0))(
  ( (V!45572 (val!15223 Int)) )
))
(declare-datatypes ((ValueCell!14457 0))(
  ( (ValueCellFull!14457 (v!17861 V!45571)) (EmptyCell!14457) )
))
(declare-fun mapValue!47336 () ValueCell!14457)

(declare-datatypes ((array!77447 0))(
  ( (array!77448 (arr!37370 (Array (_ BitVec 32) ValueCell!14457)) (size!37906 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77447)

(declare-fun mapRest!47336 () (Array (_ BitVec 32) ValueCell!14457))

(assert (=> mapNonEmpty!47336 (= (arr!37370 _values!996) (store mapRest!47336 mapKey!47336 mapValue!47336))))

(declare-fun res!795937 () Bool)

(declare-fun e!679597 () Bool)

(assert (=> start!100266 (=> (not res!795937) (not e!679597))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!77449 0))(
  ( (array!77450 (arr!37371 (Array (_ BitVec 32) (_ BitVec 64))) (size!37907 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77449)

(assert (=> start!100266 (= res!795937 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37907 _keys!1208))))))

(assert (=> start!100266 e!679597))

(declare-fun array_inv!28484 (array!77449) Bool)

(assert (=> start!100266 (array_inv!28484 _keys!1208)))

(assert (=> start!100266 true))

(declare-fun e!679593 () Bool)

(declare-fun array_inv!28485 (array!77447) Bool)

(assert (=> start!100266 (and (array_inv!28485 _values!996) e!679593)))

(declare-fun b!1196061 () Bool)

(declare-fun res!795942 () Bool)

(assert (=> b!1196061 (=> (not res!795942) (not e!679597))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1196061 (= res!795942 (= (select (arr!37371 _keys!1208) i!673) k0!934))))

(declare-fun b!1196062 () Bool)

(declare-fun res!795939 () Bool)

(assert (=> b!1196062 (=> (not res!795939) (not e!679597))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1196062 (= res!795939 (validKeyInArray!0 k0!934))))

(declare-fun b!1196063 () Bool)

(declare-fun e!679594 () Bool)

(assert (=> b!1196063 (= e!679597 e!679594)))

(declare-fun res!795946 () Bool)

(assert (=> b!1196063 (=> (not res!795946) (not e!679594))))

(declare-fun lt!543024 () array!77449)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77449 (_ BitVec 32)) Bool)

(assert (=> b!1196063 (= res!795946 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543024 mask!1564))))

(assert (=> b!1196063 (= lt!543024 (array!77450 (store (arr!37371 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37907 _keys!1208)))))

(declare-fun b!1196064 () Bool)

(declare-fun e!679595 () Bool)

(assert (=> b!1196064 (= e!679593 (and e!679595 mapRes!47336))))

(declare-fun condMapEmpty!47336 () Bool)

(declare-fun mapDefault!47336 () ValueCell!14457)

(assert (=> b!1196064 (= condMapEmpty!47336 (= (arr!37370 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14457)) mapDefault!47336)))))

(declare-fun b!1196065 () Bool)

(declare-fun res!795940 () Bool)

(assert (=> b!1196065 (=> (not res!795940) (not e!679597))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1196065 (= res!795940 (and (= (size!37906 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37907 _keys!1208) (size!37906 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!47336 () Bool)

(assert (=> mapIsEmpty!47336 mapRes!47336))

(declare-fun b!1196066 () Bool)

(declare-fun tp_is_empty!30333 () Bool)

(assert (=> b!1196066 (= e!679595 tp_is_empty!30333)))

(declare-fun b!1196067 () Bool)

(assert (=> b!1196067 (= e!679596 tp_is_empty!30333)))

(declare-fun b!1196068 () Bool)

(declare-fun res!795943 () Bool)

(assert (=> b!1196068 (=> (not res!795943) (not e!679597))))

(declare-datatypes ((List!26294 0))(
  ( (Nil!26291) (Cons!26290 (h!27499 (_ BitVec 64)) (t!38965 List!26294)) )
))
(declare-fun arrayNoDuplicates!0 (array!77449 (_ BitVec 32) List!26294) Bool)

(assert (=> b!1196068 (= res!795943 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26291))))

(declare-fun b!1196069 () Bool)

(declare-fun res!795944 () Bool)

(assert (=> b!1196069 (=> (not res!795944) (not e!679597))))

(assert (=> b!1196069 (= res!795944 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37907 _keys!1208))))))

(declare-fun b!1196070 () Bool)

(assert (=> b!1196070 (= e!679594 (not true))))

(declare-fun arrayContainsKey!0 (array!77449 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1196070 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39658 0))(
  ( (Unit!39659) )
))
(declare-fun lt!543023 () Unit!39658)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77449 (_ BitVec 64) (_ BitVec 32)) Unit!39658)

(assert (=> b!1196070 (= lt!543023 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1196071 () Bool)

(declare-fun res!795938 () Bool)

(assert (=> b!1196071 (=> (not res!795938) (not e!679597))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1196071 (= res!795938 (validMask!0 mask!1564))))

(declare-fun b!1196072 () Bool)

(declare-fun res!795945 () Bool)

(assert (=> b!1196072 (=> (not res!795945) (not e!679597))))

(assert (=> b!1196072 (= res!795945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1196073 () Bool)

(declare-fun res!795941 () Bool)

(assert (=> b!1196073 (=> (not res!795941) (not e!679594))))

(assert (=> b!1196073 (= res!795941 (arrayNoDuplicates!0 lt!543024 #b00000000000000000000000000000000 Nil!26291))))

(assert (= (and start!100266 res!795937) b!1196071))

(assert (= (and b!1196071 res!795938) b!1196065))

(assert (= (and b!1196065 res!795940) b!1196072))

(assert (= (and b!1196072 res!795945) b!1196068))

(assert (= (and b!1196068 res!795943) b!1196069))

(assert (= (and b!1196069 res!795944) b!1196062))

(assert (= (and b!1196062 res!795939) b!1196061))

(assert (= (and b!1196061 res!795942) b!1196063))

(assert (= (and b!1196063 res!795946) b!1196073))

(assert (= (and b!1196073 res!795941) b!1196070))

(assert (= (and b!1196064 condMapEmpty!47336) mapIsEmpty!47336))

(assert (= (and b!1196064 (not condMapEmpty!47336)) mapNonEmpty!47336))

(get-info :version)

(assert (= (and mapNonEmpty!47336 ((_ is ValueCellFull!14457) mapValue!47336)) b!1196067))

(assert (= (and b!1196064 ((_ is ValueCellFull!14457) mapDefault!47336)) b!1196066))

(assert (= start!100266 b!1196064))

(declare-fun m!1103423 () Bool)

(assert (=> b!1196072 m!1103423))

(declare-fun m!1103425 () Bool)

(assert (=> b!1196063 m!1103425))

(declare-fun m!1103427 () Bool)

(assert (=> b!1196063 m!1103427))

(declare-fun m!1103429 () Bool)

(assert (=> b!1196061 m!1103429))

(declare-fun m!1103431 () Bool)

(assert (=> b!1196062 m!1103431))

(declare-fun m!1103433 () Bool)

(assert (=> b!1196073 m!1103433))

(declare-fun m!1103435 () Bool)

(assert (=> b!1196068 m!1103435))

(declare-fun m!1103437 () Bool)

(assert (=> b!1196071 m!1103437))

(declare-fun m!1103439 () Bool)

(assert (=> b!1196070 m!1103439))

(declare-fun m!1103441 () Bool)

(assert (=> b!1196070 m!1103441))

(declare-fun m!1103443 () Bool)

(assert (=> mapNonEmpty!47336 m!1103443))

(declare-fun m!1103445 () Bool)

(assert (=> start!100266 m!1103445))

(declare-fun m!1103447 () Bool)

(assert (=> start!100266 m!1103447))

(check-sat (not b!1196068) (not start!100266) (not b!1196062) (not mapNonEmpty!47336) (not b!1196070) (not b!1196072) (not b!1196071) tp_is_empty!30333 (not b!1196063) (not b!1196073))
(check-sat)
