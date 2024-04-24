; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100362 () Bool)

(assert start!100362)

(declare-fun b!1195311 () Bool)

(declare-fun e!679432 () Bool)

(assert (=> b!1195311 (= e!679432 false)))

(declare-fun lt!543193 () Bool)

(declare-datatypes ((array!77289 0))(
  ( (array!77290 (arr!37288 (Array (_ BitVec 32) (_ BitVec 64))) (size!37825 (_ BitVec 32))) )
))
(declare-fun lt!543192 () array!77289)

(declare-datatypes ((List!26283 0))(
  ( (Nil!26280) (Cons!26279 (h!27497 (_ BitVec 64)) (t!38946 List!26283)) )
))
(declare-fun arrayNoDuplicates!0 (array!77289 (_ BitVec 32) List!26283) Bool)

(assert (=> b!1195311 (= lt!543193 (arrayNoDuplicates!0 lt!543192 #b00000000000000000000000000000000 Nil!26280))))

(declare-fun b!1195312 () Bool)

(declare-fun e!679429 () Bool)

(declare-fun e!679433 () Bool)

(declare-fun mapRes!47180 () Bool)

(assert (=> b!1195312 (= e!679429 (and e!679433 mapRes!47180))))

(declare-fun condMapEmpty!47180 () Bool)

(declare-datatypes ((V!45441 0))(
  ( (V!45442 (val!15174 Int)) )
))
(declare-datatypes ((ValueCell!14408 0))(
  ( (ValueCellFull!14408 (v!17808 V!45441)) (EmptyCell!14408) )
))
(declare-datatypes ((array!77291 0))(
  ( (array!77292 (arr!37289 (Array (_ BitVec 32) ValueCell!14408)) (size!37826 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77291)

(declare-fun mapDefault!47180 () ValueCell!14408)

(assert (=> b!1195312 (= condMapEmpty!47180 (= (arr!37289 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14408)) mapDefault!47180)))))

(declare-fun b!1195314 () Bool)

(declare-fun res!794923 () Bool)

(declare-fun e!679431 () Bool)

(assert (=> b!1195314 (=> (not res!794923) (not e!679431))))

(declare-fun _keys!1208 () array!77289)

(assert (=> b!1195314 (= res!794923 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26280))))

(declare-fun b!1195315 () Bool)

(declare-fun res!794924 () Bool)

(assert (=> b!1195315 (=> (not res!794924) (not e!679431))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1195315 (= res!794924 (= (select (arr!37288 _keys!1208) i!673) k0!934))))

(declare-fun b!1195316 () Bool)

(declare-fun res!794919 () Bool)

(assert (=> b!1195316 (=> (not res!794919) (not e!679431))))

(assert (=> b!1195316 (= res!794919 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37825 _keys!1208))))))

(declare-fun mapIsEmpty!47180 () Bool)

(assert (=> mapIsEmpty!47180 mapRes!47180))

(declare-fun mapNonEmpty!47180 () Bool)

(declare-fun tp!89790 () Bool)

(declare-fun e!679428 () Bool)

(assert (=> mapNonEmpty!47180 (= mapRes!47180 (and tp!89790 e!679428))))

(declare-fun mapValue!47180 () ValueCell!14408)

(declare-fun mapRest!47180 () (Array (_ BitVec 32) ValueCell!14408))

(declare-fun mapKey!47180 () (_ BitVec 32))

(assert (=> mapNonEmpty!47180 (= (arr!37289 _values!996) (store mapRest!47180 mapKey!47180 mapValue!47180))))

(declare-fun b!1195317 () Bool)

(declare-fun res!794926 () Bool)

(assert (=> b!1195317 (=> (not res!794926) (not e!679431))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1195317 (= res!794926 (validMask!0 mask!1564))))

(declare-fun b!1195318 () Bool)

(declare-fun res!794920 () Bool)

(assert (=> b!1195318 (=> (not res!794920) (not e!679431))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77289 (_ BitVec 32)) Bool)

(assert (=> b!1195318 (= res!794920 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!794927 () Bool)

(assert (=> start!100362 (=> (not res!794927) (not e!679431))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100362 (= res!794927 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37825 _keys!1208))))))

(assert (=> start!100362 e!679431))

(declare-fun array_inv!28494 (array!77289) Bool)

(assert (=> start!100362 (array_inv!28494 _keys!1208)))

(assert (=> start!100362 true))

(declare-fun array_inv!28495 (array!77291) Bool)

(assert (=> start!100362 (and (array_inv!28495 _values!996) e!679429)))

(declare-fun b!1195313 () Bool)

(declare-fun res!794921 () Bool)

(assert (=> b!1195313 (=> (not res!794921) (not e!679431))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1195313 (= res!794921 (validKeyInArray!0 k0!934))))

(declare-fun b!1195319 () Bool)

(declare-fun res!794925 () Bool)

(assert (=> b!1195319 (=> (not res!794925) (not e!679431))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1195319 (= res!794925 (and (= (size!37826 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37825 _keys!1208) (size!37826 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1195320 () Bool)

(assert (=> b!1195320 (= e!679431 e!679432)))

(declare-fun res!794922 () Bool)

(assert (=> b!1195320 (=> (not res!794922) (not e!679432))))

(assert (=> b!1195320 (= res!794922 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543192 mask!1564))))

(assert (=> b!1195320 (= lt!543192 (array!77290 (store (arr!37288 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37825 _keys!1208)))))

(declare-fun b!1195321 () Bool)

(declare-fun tp_is_empty!30235 () Bool)

(assert (=> b!1195321 (= e!679433 tp_is_empty!30235)))

(declare-fun b!1195322 () Bool)

(assert (=> b!1195322 (= e!679428 tp_is_empty!30235)))

(assert (= (and start!100362 res!794927) b!1195317))

(assert (= (and b!1195317 res!794926) b!1195319))

(assert (= (and b!1195319 res!794925) b!1195318))

(assert (= (and b!1195318 res!794920) b!1195314))

(assert (= (and b!1195314 res!794923) b!1195316))

(assert (= (and b!1195316 res!794919) b!1195313))

(assert (= (and b!1195313 res!794921) b!1195315))

(assert (= (and b!1195315 res!794924) b!1195320))

(assert (= (and b!1195320 res!794922) b!1195311))

(assert (= (and b!1195312 condMapEmpty!47180) mapIsEmpty!47180))

(assert (= (and b!1195312 (not condMapEmpty!47180)) mapNonEmpty!47180))

(get-info :version)

(assert (= (and mapNonEmpty!47180 ((_ is ValueCellFull!14408) mapValue!47180)) b!1195322))

(assert (= (and b!1195312 ((_ is ValueCellFull!14408) mapDefault!47180)) b!1195321))

(assert (= start!100362 b!1195312))

(declare-fun m!1103667 () Bool)

(assert (=> b!1195320 m!1103667))

(declare-fun m!1103669 () Bool)

(assert (=> b!1195320 m!1103669))

(declare-fun m!1103671 () Bool)

(assert (=> start!100362 m!1103671))

(declare-fun m!1103673 () Bool)

(assert (=> start!100362 m!1103673))

(declare-fun m!1103675 () Bool)

(assert (=> b!1195315 m!1103675))

(declare-fun m!1103677 () Bool)

(assert (=> b!1195318 m!1103677))

(declare-fun m!1103679 () Bool)

(assert (=> b!1195311 m!1103679))

(declare-fun m!1103681 () Bool)

(assert (=> b!1195317 m!1103681))

(declare-fun m!1103683 () Bool)

(assert (=> b!1195313 m!1103683))

(declare-fun m!1103685 () Bool)

(assert (=> b!1195314 m!1103685))

(declare-fun m!1103687 () Bool)

(assert (=> mapNonEmpty!47180 m!1103687))

(check-sat (not start!100362) (not b!1195318) (not b!1195320) tp_is_empty!30235 (not b!1195313) (not b!1195311) (not b!1195317) (not mapNonEmpty!47180) (not b!1195314))
(check-sat)
