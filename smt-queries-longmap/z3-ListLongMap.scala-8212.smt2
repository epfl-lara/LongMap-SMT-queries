; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100132 () Bool)

(assert start!100132)

(declare-fun mapIsEmpty!47198 () Bool)

(declare-fun mapRes!47198 () Bool)

(assert (=> mapIsEmpty!47198 mapRes!47198))

(declare-fun b!1194114 () Bool)

(declare-fun e!678631 () Bool)

(assert (=> b!1194114 (= e!678631 false)))

(declare-fun lt!542553 () Bool)

(declare-datatypes ((array!77204 0))(
  ( (array!77205 (arr!37252 (Array (_ BitVec 32) (_ BitVec 64))) (size!37790 (_ BitVec 32))) )
))
(declare-fun lt!542552 () array!77204)

(declare-datatypes ((List!26332 0))(
  ( (Nil!26329) (Cons!26328 (h!27537 (_ BitVec 64)) (t!38994 List!26332)) )
))
(declare-fun arrayNoDuplicates!0 (array!77204 (_ BitVec 32) List!26332) Bool)

(assert (=> b!1194114 (= lt!542553 (arrayNoDuplicates!0 lt!542552 #b00000000000000000000000000000000 Nil!26329))))

(declare-fun b!1194115 () Bool)

(declare-fun res!794509 () Bool)

(declare-fun e!678629 () Bool)

(assert (=> b!1194115 (=> (not res!794509) (not e!678629))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun _keys!1208 () array!77204)

(assert (=> b!1194115 (= res!794509 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37790 _keys!1208))))))

(declare-fun b!1194116 () Bool)

(declare-fun e!678626 () Bool)

(declare-fun tp_is_empty!30247 () Bool)

(assert (=> b!1194116 (= e!678626 tp_is_empty!30247)))

(declare-fun b!1194117 () Bool)

(declare-fun res!794514 () Bool)

(assert (=> b!1194117 (=> (not res!794514) (not e!678629))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1194117 (= res!794514 (= (select (arr!37252 _keys!1208) i!673) k0!934))))

(declare-fun b!1194118 () Bool)

(declare-fun res!794515 () Bool)

(assert (=> b!1194118 (=> (not res!794515) (not e!678629))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45457 0))(
  ( (V!45458 (val!15180 Int)) )
))
(declare-datatypes ((ValueCell!14414 0))(
  ( (ValueCellFull!14414 (v!17817 V!45457)) (EmptyCell!14414) )
))
(declare-datatypes ((array!77206 0))(
  ( (array!77207 (arr!37253 (Array (_ BitVec 32) ValueCell!14414)) (size!37791 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77206)

(assert (=> b!1194118 (= res!794515 (and (= (size!37791 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37790 _keys!1208) (size!37791 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1194119 () Bool)

(declare-fun e!678630 () Bool)

(assert (=> b!1194119 (= e!678630 tp_is_empty!30247)))

(declare-fun b!1194120 () Bool)

(declare-fun e!678627 () Bool)

(assert (=> b!1194120 (= e!678627 (and e!678626 mapRes!47198))))

(declare-fun condMapEmpty!47198 () Bool)

(declare-fun mapDefault!47198 () ValueCell!14414)

(assert (=> b!1194120 (= condMapEmpty!47198 (= (arr!37253 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14414)) mapDefault!47198)))))

(declare-fun b!1194121 () Bool)

(declare-fun res!794511 () Bool)

(assert (=> b!1194121 (=> (not res!794511) (not e!678629))))

(assert (=> b!1194121 (= res!794511 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26329))))

(declare-fun b!1194122 () Bool)

(assert (=> b!1194122 (= e!678629 e!678631)))

(declare-fun res!794507 () Bool)

(assert (=> b!1194122 (=> (not res!794507) (not e!678631))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77204 (_ BitVec 32)) Bool)

(assert (=> b!1194122 (= res!794507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542552 mask!1564))))

(assert (=> b!1194122 (= lt!542552 (array!77205 (store (arr!37252 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37790 _keys!1208)))))

(declare-fun res!794510 () Bool)

(assert (=> start!100132 (=> (not res!794510) (not e!678629))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100132 (= res!794510 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37790 _keys!1208))))))

(assert (=> start!100132 e!678629))

(declare-fun array_inv!28518 (array!77204) Bool)

(assert (=> start!100132 (array_inv!28518 _keys!1208)))

(assert (=> start!100132 true))

(declare-fun array_inv!28519 (array!77206) Bool)

(assert (=> start!100132 (and (array_inv!28519 _values!996) e!678627)))

(declare-fun mapNonEmpty!47198 () Bool)

(declare-fun tp!89808 () Bool)

(assert (=> mapNonEmpty!47198 (= mapRes!47198 (and tp!89808 e!678630))))

(declare-fun mapKey!47198 () (_ BitVec 32))

(declare-fun mapValue!47198 () ValueCell!14414)

(declare-fun mapRest!47198 () (Array (_ BitVec 32) ValueCell!14414))

(assert (=> mapNonEmpty!47198 (= (arr!37253 _values!996) (store mapRest!47198 mapKey!47198 mapValue!47198))))

(declare-fun b!1194123 () Bool)

(declare-fun res!794513 () Bool)

(assert (=> b!1194123 (=> (not res!794513) (not e!678629))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1194123 (= res!794513 (validKeyInArray!0 k0!934))))

(declare-fun b!1194124 () Bool)

(declare-fun res!794512 () Bool)

(assert (=> b!1194124 (=> (not res!794512) (not e!678629))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1194124 (= res!794512 (validMask!0 mask!1564))))

(declare-fun b!1194125 () Bool)

(declare-fun res!794508 () Bool)

(assert (=> b!1194125 (=> (not res!794508) (not e!678629))))

(assert (=> b!1194125 (= res!794508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!100132 res!794510) b!1194124))

(assert (= (and b!1194124 res!794512) b!1194118))

(assert (= (and b!1194118 res!794515) b!1194125))

(assert (= (and b!1194125 res!794508) b!1194121))

(assert (= (and b!1194121 res!794511) b!1194115))

(assert (= (and b!1194115 res!794509) b!1194123))

(assert (= (and b!1194123 res!794513) b!1194117))

(assert (= (and b!1194117 res!794514) b!1194122))

(assert (= (and b!1194122 res!794507) b!1194114))

(assert (= (and b!1194120 condMapEmpty!47198) mapIsEmpty!47198))

(assert (= (and b!1194120 (not condMapEmpty!47198)) mapNonEmpty!47198))

(get-info :version)

(assert (= (and mapNonEmpty!47198 ((_ is ValueCellFull!14414) mapValue!47198)) b!1194119))

(assert (= (and b!1194120 ((_ is ValueCellFull!14414) mapDefault!47198)) b!1194116))

(assert (= start!100132 b!1194120))

(declare-fun m!1101617 () Bool)

(assert (=> mapNonEmpty!47198 m!1101617))

(declare-fun m!1101619 () Bool)

(assert (=> b!1194124 m!1101619))

(declare-fun m!1101621 () Bool)

(assert (=> b!1194121 m!1101621))

(declare-fun m!1101623 () Bool)

(assert (=> b!1194117 m!1101623))

(declare-fun m!1101625 () Bool)

(assert (=> start!100132 m!1101625))

(declare-fun m!1101627 () Bool)

(assert (=> start!100132 m!1101627))

(declare-fun m!1101629 () Bool)

(assert (=> b!1194125 m!1101629))

(declare-fun m!1101631 () Bool)

(assert (=> b!1194123 m!1101631))

(declare-fun m!1101633 () Bool)

(assert (=> b!1194114 m!1101633))

(declare-fun m!1101635 () Bool)

(assert (=> b!1194122 m!1101635))

(declare-fun m!1101637 () Bool)

(assert (=> b!1194122 m!1101637))

(check-sat (not b!1194122) (not b!1194125) tp_is_empty!30247 (not b!1194124) (not b!1194121) (not mapNonEmpty!47198) (not b!1194123) (not b!1194114) (not start!100132))
(check-sat)
