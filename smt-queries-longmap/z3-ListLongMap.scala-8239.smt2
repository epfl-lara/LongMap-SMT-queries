; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100366 () Bool)

(assert start!100366)

(declare-fun b!1197878 () Bool)

(declare-fun res!797210 () Bool)

(declare-fun e!680474 () Bool)

(assert (=> b!1197878 (=> (not res!797210) (not e!680474))))

(declare-datatypes ((array!77599 0))(
  ( (array!77600 (arr!37445 (Array (_ BitVec 32) (_ BitVec 64))) (size!37981 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77599)

(declare-datatypes ((List!26342 0))(
  ( (Nil!26339) (Cons!26338 (h!27547 (_ BitVec 64)) (t!39043 List!26342)) )
))
(declare-fun arrayNoDuplicates!0 (array!77599 (_ BitVec 32) List!26342) Bool)

(assert (=> b!1197878 (= res!797210 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26339))))

(declare-fun b!1197879 () Bool)

(declare-fun res!797205 () Bool)

(assert (=> b!1197879 (=> (not res!797205) (not e!680474))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1197879 (= res!797205 (validKeyInArray!0 k0!934))))

(declare-fun b!1197880 () Bool)

(declare-fun res!797209 () Bool)

(assert (=> b!1197880 (=> (not res!797209) (not e!680474))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77599 (_ BitVec 32)) Bool)

(assert (=> b!1197880 (= res!797209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1197881 () Bool)

(declare-fun res!797207 () Bool)

(assert (=> b!1197881 (=> (not res!797207) (not e!680474))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1197881 (= res!797207 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37981 _keys!1208))))))

(declare-fun b!1197882 () Bool)

(declare-fun e!680475 () Bool)

(declare-fun tp_is_empty!30411 () Bool)

(assert (=> b!1197882 (= e!680475 tp_is_empty!30411)))

(declare-fun res!797206 () Bool)

(assert (=> start!100366 (=> (not res!797206) (not e!680474))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100366 (= res!797206 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37981 _keys!1208))))))

(assert (=> start!100366 e!680474))

(declare-fun array_inv!28540 (array!77599) Bool)

(assert (=> start!100366 (array_inv!28540 _keys!1208)))

(assert (=> start!100366 true))

(declare-datatypes ((V!45675 0))(
  ( (V!45676 (val!15262 Int)) )
))
(declare-datatypes ((ValueCell!14496 0))(
  ( (ValueCellFull!14496 (v!17900 V!45675)) (EmptyCell!14496) )
))
(declare-datatypes ((array!77601 0))(
  ( (array!77602 (arr!37446 (Array (_ BitVec 32) ValueCell!14496)) (size!37982 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77601)

(declare-fun e!680473 () Bool)

(declare-fun array_inv!28541 (array!77601) Bool)

(assert (=> start!100366 (and (array_inv!28541 _values!996) e!680473)))

(declare-fun mapNonEmpty!47456 () Bool)

(declare-fun mapRes!47456 () Bool)

(declare-fun tp!90111 () Bool)

(assert (=> mapNonEmpty!47456 (= mapRes!47456 (and tp!90111 e!680475))))

(declare-fun mapKey!47456 () (_ BitVec 32))

(declare-fun mapValue!47456 () ValueCell!14496)

(declare-fun mapRest!47456 () (Array (_ BitVec 32) ValueCell!14496))

(assert (=> mapNonEmpty!47456 (= (arr!37446 _values!996) (store mapRest!47456 mapKey!47456 mapValue!47456))))

(declare-fun b!1197883 () Bool)

(declare-fun res!797214 () Bool)

(declare-fun e!680476 () Bool)

(assert (=> b!1197883 (=> (not res!797214) (not e!680476))))

(declare-fun lt!543366 () array!77599)

(assert (=> b!1197883 (= res!797214 (arrayNoDuplicates!0 lt!543366 #b00000000000000000000000000000000 Nil!26339))))

(declare-fun b!1197884 () Bool)

(assert (=> b!1197884 (= e!680474 e!680476)))

(declare-fun res!797208 () Bool)

(assert (=> b!1197884 (=> (not res!797208) (not e!680476))))

(assert (=> b!1197884 (= res!797208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543366 mask!1564))))

(assert (=> b!1197884 (= lt!543366 (array!77600 (store (arr!37445 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37981 _keys!1208)))))

(declare-fun b!1197885 () Bool)

(declare-fun res!797211 () Bool)

(assert (=> b!1197885 (=> (not res!797211) (not e!680474))))

(assert (=> b!1197885 (= res!797211 (= (select (arr!37445 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!47456 () Bool)

(assert (=> mapIsEmpty!47456 mapRes!47456))

(declare-fun b!1197886 () Bool)

(declare-fun e!680472 () Bool)

(assert (=> b!1197886 (= e!680473 (and e!680472 mapRes!47456))))

(declare-fun condMapEmpty!47456 () Bool)

(declare-fun mapDefault!47456 () ValueCell!14496)

(assert (=> b!1197886 (= condMapEmpty!47456 (= (arr!37446 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14496)) mapDefault!47456)))))

(declare-fun b!1197887 () Bool)

(declare-fun res!797213 () Bool)

(assert (=> b!1197887 (=> (not res!797213) (not e!680474))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1197887 (= res!797213 (and (= (size!37982 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37981 _keys!1208) (size!37982 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1197888 () Bool)

(declare-fun res!797212 () Bool)

(assert (=> b!1197888 (=> (not res!797212) (not e!680474))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1197888 (= res!797212 (validMask!0 mask!1564))))

(declare-fun b!1197889 () Bool)

(assert (=> b!1197889 (= e!680476 (not (or (bvsle from!1455 i!673) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!37981 _keys!1208)) (bvslt i!673 (size!37982 _values!996)))))))

(declare-fun arrayContainsKey!0 (array!77599 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1197889 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39718 0))(
  ( (Unit!39719) )
))
(declare-fun lt!543365 () Unit!39718)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77599 (_ BitVec 64) (_ BitVec 32)) Unit!39718)

(assert (=> b!1197889 (= lt!543365 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1197890 () Bool)

(assert (=> b!1197890 (= e!680472 tp_is_empty!30411)))

(assert (= (and start!100366 res!797206) b!1197888))

(assert (= (and b!1197888 res!797212) b!1197887))

(assert (= (and b!1197887 res!797213) b!1197880))

(assert (= (and b!1197880 res!797209) b!1197878))

(assert (= (and b!1197878 res!797210) b!1197881))

(assert (= (and b!1197881 res!797207) b!1197879))

(assert (= (and b!1197879 res!797205) b!1197885))

(assert (= (and b!1197885 res!797211) b!1197884))

(assert (= (and b!1197884 res!797208) b!1197883))

(assert (= (and b!1197883 res!797214) b!1197889))

(assert (= (and b!1197886 condMapEmpty!47456) mapIsEmpty!47456))

(assert (= (and b!1197886 (not condMapEmpty!47456)) mapNonEmpty!47456))

(get-info :version)

(assert (= (and mapNonEmpty!47456 ((_ is ValueCellFull!14496) mapValue!47456)) b!1197882))

(assert (= (and b!1197886 ((_ is ValueCellFull!14496) mapDefault!47456)) b!1197890))

(assert (= start!100366 b!1197886))

(declare-fun m!1104789 () Bool)

(assert (=> b!1197879 m!1104789))

(declare-fun m!1104791 () Bool)

(assert (=> b!1197880 m!1104791))

(declare-fun m!1104793 () Bool)

(assert (=> b!1197884 m!1104793))

(declare-fun m!1104795 () Bool)

(assert (=> b!1197884 m!1104795))

(declare-fun m!1104797 () Bool)

(assert (=> b!1197889 m!1104797))

(declare-fun m!1104799 () Bool)

(assert (=> b!1197889 m!1104799))

(declare-fun m!1104801 () Bool)

(assert (=> mapNonEmpty!47456 m!1104801))

(declare-fun m!1104803 () Bool)

(assert (=> b!1197888 m!1104803))

(declare-fun m!1104805 () Bool)

(assert (=> b!1197883 m!1104805))

(declare-fun m!1104807 () Bool)

(assert (=> b!1197885 m!1104807))

(declare-fun m!1104809 () Bool)

(assert (=> start!100366 m!1104809))

(declare-fun m!1104811 () Bool)

(assert (=> start!100366 m!1104811))

(declare-fun m!1104813 () Bool)

(assert (=> b!1197878 m!1104813))

(check-sat (not mapNonEmpty!47456) (not b!1197889) (not b!1197888) (not b!1197884) (not b!1197883) tp_is_empty!30411 (not b!1197880) (not b!1197878) (not b!1197879) (not start!100366))
(check-sat)
