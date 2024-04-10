; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100122 () Bool)

(assert start!100122)

(declare-fun mapIsEmpty!47174 () Bool)

(declare-fun mapRes!47174 () Bool)

(assert (=> mapIsEmpty!47174 mapRes!47174))

(declare-fun mapNonEmpty!47174 () Bool)

(declare-fun tp!89784 () Bool)

(declare-fun e!678567 () Bool)

(assert (=> mapNonEmpty!47174 (= mapRes!47174 (and tp!89784 e!678567))))

(declare-datatypes ((V!45435 0))(
  ( (V!45436 (val!15172 Int)) )
))
(declare-datatypes ((ValueCell!14406 0))(
  ( (ValueCellFull!14406 (v!17810 V!45435)) (EmptyCell!14406) )
))
(declare-fun mapRest!47174 () (Array (_ BitVec 32) ValueCell!14406))

(declare-fun mapKey!47174 () (_ BitVec 32))

(declare-fun mapValue!47174 () ValueCell!14406)

(declare-datatypes ((array!77241 0))(
  ( (array!77242 (arr!37270 (Array (_ BitVec 32) ValueCell!14406)) (size!37806 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77241)

(assert (=> mapNonEmpty!47174 (= (arr!37270 _values!996) (store mapRest!47174 mapKey!47174 mapValue!47174))))

(declare-fun res!794368 () Bool)

(declare-fun e!678566 () Bool)

(assert (=> start!100122 (=> (not res!794368) (not e!678566))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!77243 0))(
  ( (array!77244 (arr!37271 (Array (_ BitVec 32) (_ BitVec 64))) (size!37807 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77243)

(assert (=> start!100122 (= res!794368 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37807 _keys!1208))))))

(assert (=> start!100122 e!678566))

(declare-fun array_inv!28414 (array!77243) Bool)

(assert (=> start!100122 (array_inv!28414 _keys!1208)))

(assert (=> start!100122 true))

(declare-fun e!678565 () Bool)

(declare-fun array_inv!28415 (array!77241) Bool)

(assert (=> start!100122 (and (array_inv!28415 _values!996) e!678565)))

(declare-fun b!1193954 () Bool)

(declare-fun res!794366 () Bool)

(assert (=> b!1193954 (=> (not res!794366) (not e!678566))))

(declare-datatypes ((List!26250 0))(
  ( (Nil!26247) (Cons!26246 (h!27455 (_ BitVec 64)) (t!38921 List!26250)) )
))
(declare-fun arrayNoDuplicates!0 (array!77243 (_ BitVec 32) List!26250) Bool)

(assert (=> b!1193954 (= res!794366 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26247))))

(declare-fun b!1193955 () Bool)

(declare-fun res!794364 () Bool)

(assert (=> b!1193955 (=> (not res!794364) (not e!678566))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77243 (_ BitVec 32)) Bool)

(assert (=> b!1193955 (= res!794364 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1193956 () Bool)

(declare-fun res!794362 () Bool)

(assert (=> b!1193956 (=> (not res!794362) (not e!678566))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1193956 (= res!794362 (and (= (size!37806 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37807 _keys!1208) (size!37806 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1193957 () Bool)

(declare-fun res!794365 () Bool)

(assert (=> b!1193957 (=> (not res!794365) (not e!678566))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1193957 (= res!794365 (validMask!0 mask!1564))))

(declare-fun b!1193958 () Bool)

(assert (=> b!1193958 (= e!678566 false)))

(declare-fun lt!542700 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1193958 (= lt!542700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!77244 (store (arr!37271 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37807 _keys!1208)) mask!1564))))

(declare-fun b!1193959 () Bool)

(declare-fun e!678568 () Bool)

(declare-fun tp_is_empty!30231 () Bool)

(assert (=> b!1193959 (= e!678568 tp_is_empty!30231)))

(declare-fun b!1193960 () Bool)

(declare-fun res!794363 () Bool)

(assert (=> b!1193960 (=> (not res!794363) (not e!678566))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1193960 (= res!794363 (= (select (arr!37271 _keys!1208) i!673) k0!934))))

(declare-fun b!1193961 () Bool)

(assert (=> b!1193961 (= e!678565 (and e!678568 mapRes!47174))))

(declare-fun condMapEmpty!47174 () Bool)

(declare-fun mapDefault!47174 () ValueCell!14406)

(assert (=> b!1193961 (= condMapEmpty!47174 (= (arr!37270 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14406)) mapDefault!47174)))))

(declare-fun b!1193962 () Bool)

(declare-fun res!794361 () Bool)

(assert (=> b!1193962 (=> (not res!794361) (not e!678566))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1193962 (= res!794361 (validKeyInArray!0 k0!934))))

(declare-fun b!1193963 () Bool)

(declare-fun res!794367 () Bool)

(assert (=> b!1193963 (=> (not res!794367) (not e!678566))))

(assert (=> b!1193963 (= res!794367 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37807 _keys!1208))))))

(declare-fun b!1193964 () Bool)

(assert (=> b!1193964 (= e!678567 tp_is_empty!30231)))

(assert (= (and start!100122 res!794368) b!1193957))

(assert (= (and b!1193957 res!794365) b!1193956))

(assert (= (and b!1193956 res!794362) b!1193955))

(assert (= (and b!1193955 res!794364) b!1193954))

(assert (= (and b!1193954 res!794366) b!1193963))

(assert (= (and b!1193963 res!794367) b!1193962))

(assert (= (and b!1193962 res!794361) b!1193960))

(assert (= (and b!1193960 res!794363) b!1193958))

(assert (= (and b!1193961 condMapEmpty!47174) mapIsEmpty!47174))

(assert (= (and b!1193961 (not condMapEmpty!47174)) mapNonEmpty!47174))

(get-info :version)

(assert (= (and mapNonEmpty!47174 ((_ is ValueCellFull!14406) mapValue!47174)) b!1193964))

(assert (= (and b!1193961 ((_ is ValueCellFull!14406) mapDefault!47174)) b!1193959))

(assert (= start!100122 b!1193961))

(declare-fun m!1102055 () Bool)

(assert (=> b!1193962 m!1102055))

(declare-fun m!1102057 () Bool)

(assert (=> b!1193955 m!1102057))

(declare-fun m!1102059 () Bool)

(assert (=> b!1193958 m!1102059))

(declare-fun m!1102061 () Bool)

(assert (=> b!1193958 m!1102061))

(declare-fun m!1102063 () Bool)

(assert (=> b!1193954 m!1102063))

(declare-fun m!1102065 () Bool)

(assert (=> start!100122 m!1102065))

(declare-fun m!1102067 () Bool)

(assert (=> start!100122 m!1102067))

(declare-fun m!1102069 () Bool)

(assert (=> mapNonEmpty!47174 m!1102069))

(declare-fun m!1102071 () Bool)

(assert (=> b!1193957 m!1102071))

(declare-fun m!1102073 () Bool)

(assert (=> b!1193960 m!1102073))

(check-sat (not mapNonEmpty!47174) (not b!1193957) (not b!1193955) (not b!1193962) (not start!100122) tp_is_empty!30231 (not b!1193954) (not b!1193958))
(check-sat)
