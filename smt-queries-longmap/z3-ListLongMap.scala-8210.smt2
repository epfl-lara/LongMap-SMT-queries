; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100128 () Bool)

(assert start!100128)

(declare-fun b!1194058 () Bool)

(declare-fun res!794439 () Bool)

(declare-fun e!678619 () Bool)

(assert (=> b!1194058 (=> (not res!794439) (not e!678619))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!77253 0))(
  ( (array!77254 (arr!37276 (Array (_ BitVec 32) (_ BitVec 64))) (size!37812 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77253)

(assert (=> b!1194058 (= res!794439 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37812 _keys!1208))))))

(declare-fun b!1194059 () Bool)

(declare-fun res!794438 () Bool)

(assert (=> b!1194059 (=> (not res!794438) (not e!678619))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1194059 (= res!794438 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!47183 () Bool)

(declare-fun mapRes!47183 () Bool)

(assert (=> mapIsEmpty!47183 mapRes!47183))

(declare-fun b!1194060 () Bool)

(declare-fun res!794445 () Bool)

(assert (=> b!1194060 (=> (not res!794445) (not e!678619))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45443 0))(
  ( (V!45444 (val!15175 Int)) )
))
(declare-datatypes ((ValueCell!14409 0))(
  ( (ValueCellFull!14409 (v!17813 V!45443)) (EmptyCell!14409) )
))
(declare-datatypes ((array!77255 0))(
  ( (array!77256 (arr!37277 (Array (_ BitVec 32) ValueCell!14409)) (size!37813 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77255)

(assert (=> b!1194060 (= res!794445 (and (= (size!37813 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37812 _keys!1208) (size!37813 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1194061 () Bool)

(declare-fun e!678615 () Bool)

(declare-fun e!678616 () Bool)

(assert (=> b!1194061 (= e!678615 (and e!678616 mapRes!47183))))

(declare-fun condMapEmpty!47183 () Bool)

(declare-fun mapDefault!47183 () ValueCell!14409)

(assert (=> b!1194061 (= condMapEmpty!47183 (= (arr!37277 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14409)) mapDefault!47183)))))

(declare-fun b!1194062 () Bool)

(declare-fun res!794443 () Bool)

(assert (=> b!1194062 (=> (not res!794443) (not e!678619))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1194062 (= res!794443 (= (select (arr!37276 _keys!1208) i!673) k0!934))))

(declare-fun b!1194063 () Bool)

(declare-fun res!794444 () Bool)

(assert (=> b!1194063 (=> (not res!794444) (not e!678619))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77253 (_ BitVec 32)) Bool)

(assert (=> b!1194063 (= res!794444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1194064 () Bool)

(declare-fun tp_is_empty!30237 () Bool)

(assert (=> b!1194064 (= e!678616 tp_is_empty!30237)))

(declare-fun mapNonEmpty!47183 () Bool)

(declare-fun tp!89793 () Bool)

(declare-fun e!678617 () Bool)

(assert (=> mapNonEmpty!47183 (= mapRes!47183 (and tp!89793 e!678617))))

(declare-fun mapKey!47183 () (_ BitVec 32))

(declare-fun mapRest!47183 () (Array (_ BitVec 32) ValueCell!14409))

(declare-fun mapValue!47183 () ValueCell!14409)

(assert (=> mapNonEmpty!47183 (= (arr!37277 _values!996) (store mapRest!47183 mapKey!47183 mapValue!47183))))

(declare-fun b!1194065 () Bool)

(declare-fun e!678618 () Bool)

(assert (=> b!1194065 (= e!678619 e!678618)))

(declare-fun res!794440 () Bool)

(assert (=> b!1194065 (=> (not res!794440) (not e!678618))))

(declare-fun lt!542714 () array!77253)

(assert (=> b!1194065 (= res!794440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542714 mask!1564))))

(assert (=> b!1194065 (= lt!542714 (array!77254 (store (arr!37276 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37812 _keys!1208)))))

(declare-fun res!794441 () Bool)

(assert (=> start!100128 (=> (not res!794441) (not e!678619))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100128 (= res!794441 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37812 _keys!1208))))))

(assert (=> start!100128 e!678619))

(declare-fun array_inv!28418 (array!77253) Bool)

(assert (=> start!100128 (array_inv!28418 _keys!1208)))

(assert (=> start!100128 true))

(declare-fun array_inv!28419 (array!77255) Bool)

(assert (=> start!100128 (and (array_inv!28419 _values!996) e!678615)))

(declare-fun b!1194066 () Bool)

(declare-fun res!794442 () Bool)

(assert (=> b!1194066 (=> (not res!794442) (not e!678619))))

(declare-datatypes ((List!26253 0))(
  ( (Nil!26250) (Cons!26249 (h!27458 (_ BitVec 64)) (t!38924 List!26253)) )
))
(declare-fun arrayNoDuplicates!0 (array!77253 (_ BitVec 32) List!26253) Bool)

(assert (=> b!1194066 (= res!794442 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26250))))

(declare-fun b!1194067 () Bool)

(declare-fun res!794446 () Bool)

(assert (=> b!1194067 (=> (not res!794446) (not e!678619))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1194067 (= res!794446 (validKeyInArray!0 k0!934))))

(declare-fun b!1194068 () Bool)

(assert (=> b!1194068 (= e!678618 false)))

(declare-fun lt!542715 () Bool)

(assert (=> b!1194068 (= lt!542715 (arrayNoDuplicates!0 lt!542714 #b00000000000000000000000000000000 Nil!26250))))

(declare-fun b!1194069 () Bool)

(assert (=> b!1194069 (= e!678617 tp_is_empty!30237)))

(assert (= (and start!100128 res!794441) b!1194059))

(assert (= (and b!1194059 res!794438) b!1194060))

(assert (= (and b!1194060 res!794445) b!1194063))

(assert (= (and b!1194063 res!794444) b!1194066))

(assert (= (and b!1194066 res!794442) b!1194058))

(assert (= (and b!1194058 res!794439) b!1194067))

(assert (= (and b!1194067 res!794446) b!1194062))

(assert (= (and b!1194062 res!794443) b!1194065))

(assert (= (and b!1194065 res!794440) b!1194068))

(assert (= (and b!1194061 condMapEmpty!47183) mapIsEmpty!47183))

(assert (= (and b!1194061 (not condMapEmpty!47183)) mapNonEmpty!47183))

(get-info :version)

(assert (= (and mapNonEmpty!47183 ((_ is ValueCellFull!14409) mapValue!47183)) b!1194069))

(assert (= (and b!1194061 ((_ is ValueCellFull!14409) mapDefault!47183)) b!1194064))

(assert (= start!100128 b!1194061))

(declare-fun m!1102117 () Bool)

(assert (=> b!1194066 m!1102117))

(declare-fun m!1102119 () Bool)

(assert (=> b!1194063 m!1102119))

(declare-fun m!1102121 () Bool)

(assert (=> b!1194068 m!1102121))

(declare-fun m!1102123 () Bool)

(assert (=> b!1194062 m!1102123))

(declare-fun m!1102125 () Bool)

(assert (=> b!1194059 m!1102125))

(declare-fun m!1102127 () Bool)

(assert (=> b!1194065 m!1102127))

(declare-fun m!1102129 () Bool)

(assert (=> b!1194065 m!1102129))

(declare-fun m!1102131 () Bool)

(assert (=> mapNonEmpty!47183 m!1102131))

(declare-fun m!1102133 () Bool)

(assert (=> b!1194067 m!1102133))

(declare-fun m!1102135 () Bool)

(assert (=> start!100128 m!1102135))

(declare-fun m!1102137 () Bool)

(assert (=> start!100128 m!1102137))

(check-sat (not start!100128) (not b!1194068) (not b!1194059) (not b!1194065) tp_is_empty!30237 (not b!1194067) (not mapNonEmpty!47183) (not b!1194066) (not b!1194063))
(check-sat)
