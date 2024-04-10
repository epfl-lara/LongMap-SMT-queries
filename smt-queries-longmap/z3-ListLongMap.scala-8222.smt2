; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100242 () Bool)

(assert start!100242)

(declare-fun mapIsEmpty!47300 () Bool)

(declare-fun mapRes!47300 () Bool)

(assert (=> mapIsEmpty!47300 mapRes!47300))

(declare-fun b!1195593 () Bool)

(declare-fun res!795584 () Bool)

(declare-fun e!679377 () Bool)

(assert (=> b!1195593 (=> (not res!795584) (not e!679377))))

(declare-datatypes ((array!77399 0))(
  ( (array!77400 (arr!37346 (Array (_ BitVec 32) (_ BitVec 64))) (size!37882 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77399)

(declare-datatypes ((List!26283 0))(
  ( (Nil!26280) (Cons!26279 (h!27488 (_ BitVec 64)) (t!38954 List!26283)) )
))
(declare-fun arrayNoDuplicates!0 (array!77399 (_ BitVec 32) List!26283) Bool)

(assert (=> b!1195593 (= res!795584 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26280))))

(declare-fun res!795580 () Bool)

(assert (=> start!100242 (=> (not res!795580) (not e!679377))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100242 (= res!795580 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37882 _keys!1208))))))

(assert (=> start!100242 e!679377))

(declare-fun array_inv!28466 (array!77399) Bool)

(assert (=> start!100242 (array_inv!28466 _keys!1208)))

(assert (=> start!100242 true))

(declare-datatypes ((V!45539 0))(
  ( (V!45540 (val!15211 Int)) )
))
(declare-datatypes ((ValueCell!14445 0))(
  ( (ValueCellFull!14445 (v!17849 V!45539)) (EmptyCell!14445) )
))
(declare-datatypes ((array!77401 0))(
  ( (array!77402 (arr!37347 (Array (_ BitVec 32) ValueCell!14445)) (size!37883 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77401)

(declare-fun e!679378 () Bool)

(declare-fun array_inv!28467 (array!77401) Bool)

(assert (=> start!100242 (and (array_inv!28467 _values!996) e!679378)))

(declare-fun b!1195594 () Bool)

(declare-fun res!795578 () Bool)

(assert (=> b!1195594 (=> (not res!795578) (not e!679377))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1195594 (= res!795578 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37882 _keys!1208))))))

(declare-fun b!1195595 () Bool)

(declare-fun e!679379 () Bool)

(assert (=> b!1195595 (= e!679378 (and e!679379 mapRes!47300))))

(declare-fun condMapEmpty!47300 () Bool)

(declare-fun mapDefault!47300 () ValueCell!14445)

(assert (=> b!1195595 (= condMapEmpty!47300 (= (arr!37347 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14445)) mapDefault!47300)))))

(declare-fun b!1195596 () Bool)

(declare-fun res!795585 () Bool)

(assert (=> b!1195596 (=> (not res!795585) (not e!679377))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1195596 (= res!795585 (validMask!0 mask!1564))))

(declare-fun b!1195597 () Bool)

(declare-fun res!795586 () Bool)

(assert (=> b!1195597 (=> (not res!795586) (not e!679377))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77399 (_ BitVec 32)) Bool)

(assert (=> b!1195597 (= res!795586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1195598 () Bool)

(declare-fun res!795577 () Bool)

(declare-fun e!679381 () Bool)

(assert (=> b!1195598 (=> (not res!795577) (not e!679381))))

(declare-fun lt!542952 () array!77399)

(assert (=> b!1195598 (= res!795577 (arrayNoDuplicates!0 lt!542952 #b00000000000000000000000000000000 Nil!26280))))

(declare-fun b!1195599 () Bool)

(assert (=> b!1195599 (= e!679377 e!679381)))

(declare-fun res!795581 () Bool)

(assert (=> b!1195599 (=> (not res!795581) (not e!679381))))

(assert (=> b!1195599 (= res!795581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542952 mask!1564))))

(assert (=> b!1195599 (= lt!542952 (array!77400 (store (arr!37346 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37882 _keys!1208)))))

(declare-fun b!1195600 () Bool)

(declare-fun e!679376 () Bool)

(declare-fun tp_is_empty!30309 () Bool)

(assert (=> b!1195600 (= e!679376 tp_is_empty!30309)))

(declare-fun b!1195601 () Bool)

(assert (=> b!1195601 (= e!679379 tp_is_empty!30309)))

(declare-fun mapNonEmpty!47300 () Bool)

(declare-fun tp!89910 () Bool)

(assert (=> mapNonEmpty!47300 (= mapRes!47300 (and tp!89910 e!679376))))

(declare-fun mapKey!47300 () (_ BitVec 32))

(declare-fun mapRest!47300 () (Array (_ BitVec 32) ValueCell!14445))

(declare-fun mapValue!47300 () ValueCell!14445)

(assert (=> mapNonEmpty!47300 (= (arr!37347 _values!996) (store mapRest!47300 mapKey!47300 mapValue!47300))))

(declare-fun b!1195602 () Bool)

(assert (=> b!1195602 (= e!679381 (not true))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77399 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1195602 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39638 0))(
  ( (Unit!39639) )
))
(declare-fun lt!542951 () Unit!39638)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77399 (_ BitVec 64) (_ BitVec 32)) Unit!39638)

(assert (=> b!1195602 (= lt!542951 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1195603 () Bool)

(declare-fun res!795579 () Bool)

(assert (=> b!1195603 (=> (not res!795579) (not e!679377))))

(assert (=> b!1195603 (= res!795579 (= (select (arr!37346 _keys!1208) i!673) k0!934))))

(declare-fun b!1195604 () Bool)

(declare-fun res!795583 () Bool)

(assert (=> b!1195604 (=> (not res!795583) (not e!679377))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1195604 (= res!795583 (validKeyInArray!0 k0!934))))

(declare-fun b!1195605 () Bool)

(declare-fun res!795582 () Bool)

(assert (=> b!1195605 (=> (not res!795582) (not e!679377))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1195605 (= res!795582 (and (= (size!37883 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37882 _keys!1208) (size!37883 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!100242 res!795580) b!1195596))

(assert (= (and b!1195596 res!795585) b!1195605))

(assert (= (and b!1195605 res!795582) b!1195597))

(assert (= (and b!1195597 res!795586) b!1195593))

(assert (= (and b!1195593 res!795584) b!1195594))

(assert (= (and b!1195594 res!795578) b!1195604))

(assert (= (and b!1195604 res!795583) b!1195603))

(assert (= (and b!1195603 res!795579) b!1195599))

(assert (= (and b!1195599 res!795581) b!1195598))

(assert (= (and b!1195598 res!795577) b!1195602))

(assert (= (and b!1195595 condMapEmpty!47300) mapIsEmpty!47300))

(assert (= (and b!1195595 (not condMapEmpty!47300)) mapNonEmpty!47300))

(get-info :version)

(assert (= (and mapNonEmpty!47300 ((_ is ValueCellFull!14445) mapValue!47300)) b!1195600))

(assert (= (and b!1195595 ((_ is ValueCellFull!14445) mapDefault!47300)) b!1195601))

(assert (= start!100242 b!1195595))

(declare-fun m!1103111 () Bool)

(assert (=> b!1195603 m!1103111))

(declare-fun m!1103113 () Bool)

(assert (=> b!1195602 m!1103113))

(declare-fun m!1103115 () Bool)

(assert (=> b!1195602 m!1103115))

(declare-fun m!1103117 () Bool)

(assert (=> b!1195596 m!1103117))

(declare-fun m!1103119 () Bool)

(assert (=> start!100242 m!1103119))

(declare-fun m!1103121 () Bool)

(assert (=> start!100242 m!1103121))

(declare-fun m!1103123 () Bool)

(assert (=> b!1195593 m!1103123))

(declare-fun m!1103125 () Bool)

(assert (=> b!1195598 m!1103125))

(declare-fun m!1103127 () Bool)

(assert (=> b!1195597 m!1103127))

(declare-fun m!1103129 () Bool)

(assert (=> b!1195604 m!1103129))

(declare-fun m!1103131 () Bool)

(assert (=> mapNonEmpty!47300 m!1103131))

(declare-fun m!1103133 () Bool)

(assert (=> b!1195599 m!1103133))

(declare-fun m!1103135 () Bool)

(assert (=> b!1195599 m!1103135))

(check-sat (not mapNonEmpty!47300) (not b!1195597) tp_is_empty!30309 (not b!1195602) (not b!1195599) (not b!1195596) (not start!100242) (not b!1195604) (not b!1195593) (not b!1195598))
(check-sat)
