; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100406 () Bool)

(assert start!100406)

(declare-fun b_free!25735 () Bool)

(declare-fun b_next!25735 () Bool)

(assert (=> start!100406 (= b_free!25735 (not b_next!25735))))

(declare-fun tp!90194 () Bool)

(declare-fun b_and!42335 () Bool)

(assert (=> start!100406 (= tp!90194 b_and!42335)))

(declare-fun b!1198448 () Bool)

(declare-fun res!797639 () Bool)

(declare-fun e!680752 () Bool)

(assert (=> b!1198448 (=> (not res!797639) (not e!680752))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1198448 (= res!797639 (validKeyInArray!0 k0!934))))

(declare-fun b!1198449 () Bool)

(declare-fun res!797646 () Bool)

(assert (=> b!1198449 (=> (not res!797646) (not e!680752))))

(declare-datatypes ((array!77582 0))(
  ( (array!77583 (arr!37436 (Array (_ BitVec 32) (_ BitVec 64))) (size!37974 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77582)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1198449 (= res!797646 (= (select (arr!37436 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!47501 () Bool)

(declare-fun mapRes!47501 () Bool)

(assert (=> mapIsEmpty!47501 mapRes!47501))

(declare-fun b!1198450 () Bool)

(declare-fun res!797645 () Bool)

(assert (=> b!1198450 (=> (not res!797645) (not e!680752))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77582 (_ BitVec 32)) Bool)

(assert (=> b!1198450 (= res!797645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!47501 () Bool)

(declare-fun tp!90195 () Bool)

(declare-fun e!680754 () Bool)

(assert (=> mapNonEmpty!47501 (= mapRes!47501 (and tp!90195 e!680754))))

(declare-datatypes ((V!45713 0))(
  ( (V!45714 (val!15276 Int)) )
))
(declare-datatypes ((ValueCell!14510 0))(
  ( (ValueCellFull!14510 (v!17913 V!45713)) (EmptyCell!14510) )
))
(declare-fun mapValue!47501 () ValueCell!14510)

(declare-datatypes ((array!77584 0))(
  ( (array!77585 (arr!37437 (Array (_ BitVec 32) ValueCell!14510)) (size!37975 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77584)

(declare-fun mapRest!47501 () (Array (_ BitVec 32) ValueCell!14510))

(declare-fun mapKey!47501 () (_ BitVec 32))

(assert (=> mapNonEmpty!47501 (= (arr!37437 _values!996) (store mapRest!47501 mapKey!47501 mapValue!47501))))

(declare-fun b!1198452 () Bool)

(declare-fun res!797648 () Bool)

(assert (=> b!1198452 (=> (not res!797648) (not e!680752))))

(assert (=> b!1198452 (= res!797648 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37974 _keys!1208))))))

(declare-fun b!1198453 () Bool)

(declare-fun e!680757 () Bool)

(assert (=> b!1198453 (= e!680752 e!680757)))

(declare-fun res!797640 () Bool)

(assert (=> b!1198453 (=> (not res!797640) (not e!680757))))

(declare-fun lt!543340 () array!77582)

(assert (=> b!1198453 (= res!797640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543340 mask!1564))))

(assert (=> b!1198453 (= lt!543340 (array!77583 (store (arr!37436 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37974 _keys!1208)))))

(declare-fun b!1198454 () Bool)

(declare-fun e!680758 () Bool)

(declare-fun e!680753 () Bool)

(assert (=> b!1198454 (= e!680758 (and e!680753 mapRes!47501))))

(declare-fun condMapEmpty!47501 () Bool)

(declare-fun mapDefault!47501 () ValueCell!14510)

(assert (=> b!1198454 (= condMapEmpty!47501 (= (arr!37437 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14510)) mapDefault!47501)))))

(declare-fun b!1198455 () Bool)

(declare-fun e!680755 () Bool)

(assert (=> b!1198455 (= e!680755 true)))

(declare-fun zeroValue!944 () V!45713)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!19636 0))(
  ( (tuple2!19637 (_1!9829 (_ BitVec 64)) (_2!9829 V!45713)) )
))
(declare-datatypes ((List!26424 0))(
  ( (Nil!26421) (Cons!26420 (h!27629 tuple2!19636) (t!39130 List!26424)) )
))
(declare-datatypes ((ListLongMap!17605 0))(
  ( (ListLongMap!17606 (toList!8818 List!26424)) )
))
(declare-fun lt!543343 () ListLongMap!17605)

(declare-fun minValue!944 () V!45713)

(declare-fun getCurrentListMapNoExtraKeys!5267 (array!77582 array!77584 (_ BitVec 32) (_ BitVec 32) V!45713 V!45713 (_ BitVec 32) Int) ListLongMap!17605)

(declare-fun dynLambda!3147 (Int (_ BitVec 64)) V!45713)

(assert (=> b!1198455 (= lt!543343 (getCurrentListMapNoExtraKeys!5267 lt!543340 (array!77585 (store (arr!37437 _values!996) i!673 (ValueCellFull!14510 (dynLambda!3147 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37975 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!543341 () ListLongMap!17605)

(assert (=> b!1198455 (= lt!543341 (getCurrentListMapNoExtraKeys!5267 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1198456 () Bool)

(declare-fun res!797641 () Bool)

(assert (=> b!1198456 (=> (not res!797641) (not e!680752))))

(declare-datatypes ((List!26425 0))(
  ( (Nil!26422) (Cons!26421 (h!27630 (_ BitVec 64)) (t!39131 List!26425)) )
))
(declare-fun arrayNoDuplicates!0 (array!77582 (_ BitVec 32) List!26425) Bool)

(assert (=> b!1198456 (= res!797641 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26422))))

(declare-fun b!1198457 () Bool)

(declare-fun tp_is_empty!30439 () Bool)

(assert (=> b!1198457 (= e!680753 tp_is_empty!30439)))

(declare-fun b!1198458 () Bool)

(declare-fun res!797643 () Bool)

(assert (=> b!1198458 (=> (not res!797643) (not e!680757))))

(assert (=> b!1198458 (= res!797643 (arrayNoDuplicates!0 lt!543340 #b00000000000000000000000000000000 Nil!26422))))

(declare-fun b!1198459 () Bool)

(assert (=> b!1198459 (= e!680757 (not e!680755))))

(declare-fun res!797647 () Bool)

(assert (=> b!1198459 (=> res!797647 e!680755)))

(assert (=> b!1198459 (= res!797647 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77582 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1198459 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39595 0))(
  ( (Unit!39596) )
))
(declare-fun lt!543342 () Unit!39595)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77582 (_ BitVec 64) (_ BitVec 32)) Unit!39595)

(assert (=> b!1198459 (= lt!543342 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1198460 () Bool)

(assert (=> b!1198460 (= e!680754 tp_is_empty!30439)))

(declare-fun b!1198461 () Bool)

(declare-fun res!797644 () Bool)

(assert (=> b!1198461 (=> (not res!797644) (not e!680752))))

(assert (=> b!1198461 (= res!797644 (and (= (size!37975 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37974 _keys!1208) (size!37975 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1198451 () Bool)

(declare-fun res!797649 () Bool)

(assert (=> b!1198451 (=> (not res!797649) (not e!680752))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1198451 (= res!797649 (validMask!0 mask!1564))))

(declare-fun res!797642 () Bool)

(assert (=> start!100406 (=> (not res!797642) (not e!680752))))

(assert (=> start!100406 (= res!797642 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37974 _keys!1208))))))

(assert (=> start!100406 e!680752))

(assert (=> start!100406 tp_is_empty!30439))

(declare-fun array_inv!28648 (array!77582) Bool)

(assert (=> start!100406 (array_inv!28648 _keys!1208)))

(assert (=> start!100406 true))

(assert (=> start!100406 tp!90194))

(declare-fun array_inv!28649 (array!77584) Bool)

(assert (=> start!100406 (and (array_inv!28649 _values!996) e!680758)))

(assert (= (and start!100406 res!797642) b!1198451))

(assert (= (and b!1198451 res!797649) b!1198461))

(assert (= (and b!1198461 res!797644) b!1198450))

(assert (= (and b!1198450 res!797645) b!1198456))

(assert (= (and b!1198456 res!797641) b!1198452))

(assert (= (and b!1198452 res!797648) b!1198448))

(assert (= (and b!1198448 res!797639) b!1198449))

(assert (= (and b!1198449 res!797646) b!1198453))

(assert (= (and b!1198453 res!797640) b!1198458))

(assert (= (and b!1198458 res!797643) b!1198459))

(assert (= (and b!1198459 (not res!797647)) b!1198455))

(assert (= (and b!1198454 condMapEmpty!47501) mapIsEmpty!47501))

(assert (= (and b!1198454 (not condMapEmpty!47501)) mapNonEmpty!47501))

(get-info :version)

(assert (= (and mapNonEmpty!47501 ((_ is ValueCellFull!14510) mapValue!47501)) b!1198460))

(assert (= (and b!1198454 ((_ is ValueCellFull!14510) mapDefault!47501)) b!1198457))

(assert (= start!100406 b!1198454))

(declare-fun b_lambda!20913 () Bool)

(assert (=> (not b_lambda!20913) (not b!1198455)))

(declare-fun t!39129 () Bool)

(declare-fun tb!10527 () Bool)

(assert (=> (and start!100406 (= defaultEntry!1004 defaultEntry!1004) t!39129) tb!10527))

(declare-fun result!21639 () Bool)

(assert (=> tb!10527 (= result!21639 tp_is_empty!30439)))

(assert (=> b!1198455 t!39129))

(declare-fun b_and!42337 () Bool)

(assert (= b_and!42335 (and (=> t!39129 result!21639) b_and!42337)))

(declare-fun m!1104697 () Bool)

(assert (=> b!1198456 m!1104697))

(declare-fun m!1104699 () Bool)

(assert (=> b!1198451 m!1104699))

(declare-fun m!1104701 () Bool)

(assert (=> start!100406 m!1104701))

(declare-fun m!1104703 () Bool)

(assert (=> start!100406 m!1104703))

(declare-fun m!1104705 () Bool)

(assert (=> b!1198458 m!1104705))

(declare-fun m!1104707 () Bool)

(assert (=> b!1198450 m!1104707))

(declare-fun m!1104709 () Bool)

(assert (=> b!1198459 m!1104709))

(declare-fun m!1104711 () Bool)

(assert (=> b!1198459 m!1104711))

(declare-fun m!1104713 () Bool)

(assert (=> b!1198453 m!1104713))

(declare-fun m!1104715 () Bool)

(assert (=> b!1198453 m!1104715))

(declare-fun m!1104717 () Bool)

(assert (=> b!1198455 m!1104717))

(declare-fun m!1104719 () Bool)

(assert (=> b!1198455 m!1104719))

(declare-fun m!1104721 () Bool)

(assert (=> b!1198455 m!1104721))

(declare-fun m!1104723 () Bool)

(assert (=> b!1198455 m!1104723))

(declare-fun m!1104725 () Bool)

(assert (=> mapNonEmpty!47501 m!1104725))

(declare-fun m!1104727 () Bool)

(assert (=> b!1198449 m!1104727))

(declare-fun m!1104729 () Bool)

(assert (=> b!1198448 m!1104729))

(check-sat (not b!1198450) (not b!1198455) (not b!1198459) (not mapNonEmpty!47501) (not b!1198456) (not b!1198458) (not start!100406) tp_is_empty!30439 (not b_lambda!20913) (not b_next!25735) (not b!1198448) b_and!42337 (not b!1198453) (not b!1198451))
(check-sat b_and!42337 (not b_next!25735))
