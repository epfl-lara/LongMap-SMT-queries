; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100092 () Bool)

(assert start!100092)

(declare-fun mapIsEmpty!47129 () Bool)

(declare-fun mapRes!47129 () Bool)

(assert (=> mapIsEmpty!47129 mapRes!47129))

(declare-fun b!1193430 () Bool)

(declare-fun res!794008 () Bool)

(declare-fun e!678281 () Bool)

(assert (=> b!1193430 (=> (not res!794008) (not e!678281))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1193430 (= res!794008 (validKeyInArray!0 k0!934))))

(declare-fun b!1193431 () Bool)

(declare-fun e!678285 () Bool)

(declare-fun tp_is_empty!30201 () Bool)

(assert (=> b!1193431 (= e!678285 tp_is_empty!30201)))

(declare-fun b!1193432 () Bool)

(declare-fun res!794010 () Bool)

(declare-fun e!678282 () Bool)

(assert (=> b!1193432 (=> (not res!794010) (not e!678282))))

(declare-datatypes ((array!77181 0))(
  ( (array!77182 (arr!37240 (Array (_ BitVec 32) (_ BitVec 64))) (size!37776 (_ BitVec 32))) )
))
(declare-fun lt!542579 () array!77181)

(declare-datatypes ((List!26231 0))(
  ( (Nil!26228) (Cons!26227 (h!27436 (_ BitVec 64)) (t!38890 List!26231)) )
))
(declare-fun arrayNoDuplicates!0 (array!77181 (_ BitVec 32) List!26231) Bool)

(assert (=> b!1193432 (= res!794010 (arrayNoDuplicates!0 lt!542579 #b00000000000000000000000000000000 Nil!26228))))

(declare-fun b!1193433 () Bool)

(declare-fun res!794007 () Bool)

(assert (=> b!1193433 (=> (not res!794007) (not e!678281))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1193433 (= res!794007 (validMask!0 mask!1564))))

(declare-fun b!1193434 () Bool)

(declare-fun res!794004 () Bool)

(assert (=> b!1193434 (=> (not res!794004) (not e!678281))))

(declare-fun _keys!1208 () array!77181)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77181 (_ BitVec 32)) Bool)

(assert (=> b!1193434 (= res!794004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1193435 () Bool)

(assert (=> b!1193435 (= e!678281 e!678282)))

(declare-fun res!794009 () Bool)

(assert (=> b!1193435 (=> (not res!794009) (not e!678282))))

(assert (=> b!1193435 (= res!794009 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542579 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1193435 (= lt!542579 (array!77182 (store (arr!37240 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37776 _keys!1208)))))

(declare-fun b!1193436 () Bool)

(assert (=> b!1193436 (= e!678282 (not true))))

(declare-fun arrayContainsKey!0 (array!77181 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1193436 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39590 0))(
  ( (Unit!39591) )
))
(declare-fun lt!542580 () Unit!39590)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77181 (_ BitVec 64) (_ BitVec 32)) Unit!39590)

(assert (=> b!1193436 (= lt!542580 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1193437 () Bool)

(declare-fun e!678283 () Bool)

(assert (=> b!1193437 (= e!678283 (and e!678285 mapRes!47129))))

(declare-fun condMapEmpty!47129 () Bool)

(declare-datatypes ((V!45395 0))(
  ( (V!45396 (val!15157 Int)) )
))
(declare-datatypes ((ValueCell!14391 0))(
  ( (ValueCellFull!14391 (v!17795 V!45395)) (EmptyCell!14391) )
))
(declare-datatypes ((array!77183 0))(
  ( (array!77184 (arr!37241 (Array (_ BitVec 32) ValueCell!14391)) (size!37777 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77183)

(declare-fun mapDefault!47129 () ValueCell!14391)

(assert (=> b!1193437 (= condMapEmpty!47129 (= (arr!37241 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14391)) mapDefault!47129)))))

(declare-fun b!1193438 () Bool)

(declare-fun res!794006 () Bool)

(assert (=> b!1193438 (=> (not res!794006) (not e!678281))))

(assert (=> b!1193438 (= res!794006 (= (select (arr!37240 _keys!1208) i!673) k0!934))))

(declare-fun b!1193439 () Bool)

(declare-fun res!794002 () Bool)

(assert (=> b!1193439 (=> (not res!794002) (not e!678281))))

(assert (=> b!1193439 (= res!794002 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26228))))

(declare-fun b!1193440 () Bool)

(declare-fun e!678286 () Bool)

(assert (=> b!1193440 (= e!678286 tp_is_empty!30201)))

(declare-fun b!1193441 () Bool)

(declare-fun res!794011 () Bool)

(assert (=> b!1193441 (=> (not res!794011) (not e!678281))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1193441 (= res!794011 (and (= (size!37777 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37776 _keys!1208) (size!37777 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1193442 () Bool)

(declare-fun res!794003 () Bool)

(assert (=> b!1193442 (=> (not res!794003) (not e!678281))))

(assert (=> b!1193442 (= res!794003 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37776 _keys!1208))))))

(declare-fun mapNonEmpty!47129 () Bool)

(declare-fun tp!89721 () Bool)

(assert (=> mapNonEmpty!47129 (= mapRes!47129 (and tp!89721 e!678286))))

(declare-fun mapRest!47129 () (Array (_ BitVec 32) ValueCell!14391))

(declare-fun mapValue!47129 () ValueCell!14391)

(declare-fun mapKey!47129 () (_ BitVec 32))

(assert (=> mapNonEmpty!47129 (= (arr!37241 _values!996) (store mapRest!47129 mapKey!47129 mapValue!47129))))

(declare-fun res!794005 () Bool)

(assert (=> start!100092 (=> (not res!794005) (not e!678281))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100092 (= res!794005 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37776 _keys!1208))))))

(assert (=> start!100092 e!678281))

(declare-fun array_inv!28392 (array!77181) Bool)

(assert (=> start!100092 (array_inv!28392 _keys!1208)))

(assert (=> start!100092 true))

(declare-fun array_inv!28393 (array!77183) Bool)

(assert (=> start!100092 (and (array_inv!28393 _values!996) e!678283)))

(assert (= (and start!100092 res!794005) b!1193433))

(assert (= (and b!1193433 res!794007) b!1193441))

(assert (= (and b!1193441 res!794011) b!1193434))

(assert (= (and b!1193434 res!794004) b!1193439))

(assert (= (and b!1193439 res!794002) b!1193442))

(assert (= (and b!1193442 res!794003) b!1193430))

(assert (= (and b!1193430 res!794008) b!1193438))

(assert (= (and b!1193438 res!794006) b!1193435))

(assert (= (and b!1193435 res!794009) b!1193432))

(assert (= (and b!1193432 res!794010) b!1193436))

(assert (= (and b!1193437 condMapEmpty!47129) mapIsEmpty!47129))

(assert (= (and b!1193437 (not condMapEmpty!47129)) mapNonEmpty!47129))

(get-info :version)

(assert (= (and mapNonEmpty!47129 ((_ is ValueCellFull!14391) mapValue!47129)) b!1193440))

(assert (= (and b!1193437 ((_ is ValueCellFull!14391) mapDefault!47129)) b!1193431))

(assert (= start!100092 b!1193437))

(declare-fun m!1101677 () Bool)

(assert (=> start!100092 m!1101677))

(declare-fun m!1101679 () Bool)

(assert (=> start!100092 m!1101679))

(declare-fun m!1101681 () Bool)

(assert (=> b!1193433 m!1101681))

(declare-fun m!1101683 () Bool)

(assert (=> b!1193430 m!1101683))

(declare-fun m!1101685 () Bool)

(assert (=> b!1193438 m!1101685))

(declare-fun m!1101687 () Bool)

(assert (=> mapNonEmpty!47129 m!1101687))

(declare-fun m!1101689 () Bool)

(assert (=> b!1193439 m!1101689))

(declare-fun m!1101691 () Bool)

(assert (=> b!1193436 m!1101691))

(declare-fun m!1101693 () Bool)

(assert (=> b!1193436 m!1101693))

(declare-fun m!1101695 () Bool)

(assert (=> b!1193432 m!1101695))

(declare-fun m!1101697 () Bool)

(assert (=> b!1193435 m!1101697))

(declare-fun m!1101699 () Bool)

(assert (=> b!1193435 m!1101699))

(declare-fun m!1101701 () Bool)

(assert (=> b!1193434 m!1101701))

(check-sat (not b!1193436) (not b!1193434) (not b!1193433) (not b!1193432) (not b!1193435) tp_is_empty!30201 (not start!100092) (not mapNonEmpty!47129) (not b!1193439) (not b!1193430))
(check-sat)
