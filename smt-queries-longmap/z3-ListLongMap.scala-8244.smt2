; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100414 () Bool)

(assert start!100414)

(declare-fun b_free!25737 () Bool)

(declare-fun b_next!25737 () Bool)

(assert (=> start!100414 (= b_free!25737 (not b_next!25737))))

(declare-fun tp!90200 () Bool)

(declare-fun b_and!42361 () Bool)

(assert (=> start!100414 (= tp!90200 b_and!42361)))

(declare-fun b!1198616 () Bool)

(declare-fun res!797745 () Bool)

(declare-fun e!680856 () Bool)

(assert (=> b!1198616 (=> (not res!797745) (not e!680856))))

(declare-datatypes ((array!77661 0))(
  ( (array!77662 (arr!37475 (Array (_ BitVec 32) (_ BitVec 64))) (size!38011 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77661)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45715 0))(
  ( (V!45716 (val!15277 Int)) )
))
(declare-datatypes ((ValueCell!14511 0))(
  ( (ValueCellFull!14511 (v!17915 V!45715)) (EmptyCell!14511) )
))
(declare-datatypes ((array!77663 0))(
  ( (array!77664 (arr!37476 (Array (_ BitVec 32) ValueCell!14511)) (size!38012 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77663)

(assert (=> b!1198616 (= res!797745 (and (= (size!38012 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38011 _keys!1208) (size!38012 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1198618 () Bool)

(declare-fun res!797747 () Bool)

(assert (=> b!1198618 (=> (not res!797747) (not e!680856))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77661 (_ BitVec 32)) Bool)

(assert (=> b!1198618 (= res!797747 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1198619 () Bool)

(declare-fun res!797748 () Bool)

(assert (=> b!1198619 (=> (not res!797748) (not e!680856))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1198619 (= res!797748 (validMask!0 mask!1564))))

(declare-fun b!1198620 () Bool)

(declare-fun res!797746 () Bool)

(assert (=> b!1198620 (=> (not res!797746) (not e!680856))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1198620 (= res!797746 (validKeyInArray!0 k0!934))))

(declare-fun b!1198621 () Bool)

(declare-fun res!797738 () Bool)

(assert (=> b!1198621 (=> (not res!797738) (not e!680856))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1198621 (= res!797738 (= (select (arr!37475 _keys!1208) i!673) k0!934))))

(declare-fun b!1198622 () Bool)

(declare-fun res!797744 () Bool)

(assert (=> b!1198622 (=> (not res!797744) (not e!680856))))

(assert (=> b!1198622 (= res!797744 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38011 _keys!1208))))))

(declare-fun b!1198623 () Bool)

(declare-fun res!797740 () Bool)

(declare-fun e!680852 () Bool)

(assert (=> b!1198623 (=> (not res!797740) (not e!680852))))

(declare-fun lt!543546 () array!77661)

(declare-datatypes ((List!26365 0))(
  ( (Nil!26362) (Cons!26361 (h!27570 (_ BitVec 64)) (t!39082 List!26365)) )
))
(declare-fun arrayNoDuplicates!0 (array!77661 (_ BitVec 32) List!26365) Bool)

(assert (=> b!1198623 (= res!797740 (arrayNoDuplicates!0 lt!543546 #b00000000000000000000000000000000 Nil!26362))))

(declare-fun b!1198624 () Bool)

(declare-fun e!680854 () Bool)

(assert (=> b!1198624 (= e!680854 true)))

(declare-fun zeroValue!944 () V!45715)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!19548 0))(
  ( (tuple2!19549 (_1!9785 (_ BitVec 64)) (_2!9785 V!45715)) )
))
(declare-datatypes ((List!26366 0))(
  ( (Nil!26363) (Cons!26362 (h!27571 tuple2!19548) (t!39083 List!26366)) )
))
(declare-datatypes ((ListLongMap!17517 0))(
  ( (ListLongMap!17518 (toList!8774 List!26366)) )
))
(declare-fun lt!543545 () ListLongMap!17517)

(declare-fun minValue!944 () V!45715)

(declare-fun getCurrentListMapNoExtraKeys!5213 (array!77661 array!77663 (_ BitVec 32) (_ BitVec 32) V!45715 V!45715 (_ BitVec 32) Int) ListLongMap!17517)

(declare-fun dynLambda!3133 (Int (_ BitVec 64)) V!45715)

(assert (=> b!1198624 (= lt!543545 (getCurrentListMapNoExtraKeys!5213 lt!543546 (array!77664 (store (arr!37476 _values!996) i!673 (ValueCellFull!14511 (dynLambda!3133 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38012 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!543544 () ListLongMap!17517)

(assert (=> b!1198624 (= lt!543544 (getCurrentListMapNoExtraKeys!5213 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1198625 () Bool)

(declare-fun e!680857 () Bool)

(declare-fun tp_is_empty!30441 () Bool)

(assert (=> b!1198625 (= e!680857 tp_is_empty!30441)))

(declare-fun mapIsEmpty!47504 () Bool)

(declare-fun mapRes!47504 () Bool)

(assert (=> mapIsEmpty!47504 mapRes!47504))

(declare-fun b!1198626 () Bool)

(assert (=> b!1198626 (= e!680856 e!680852)))

(declare-fun res!797741 () Bool)

(assert (=> b!1198626 (=> (not res!797741) (not e!680852))))

(assert (=> b!1198626 (= res!797741 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543546 mask!1564))))

(assert (=> b!1198626 (= lt!543546 (array!77662 (store (arr!37475 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38011 _keys!1208)))))

(declare-fun res!797742 () Bool)

(assert (=> start!100414 (=> (not res!797742) (not e!680856))))

(assert (=> start!100414 (= res!797742 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38011 _keys!1208))))))

(assert (=> start!100414 e!680856))

(assert (=> start!100414 tp_is_empty!30441))

(declare-fun array_inv!28562 (array!77661) Bool)

(assert (=> start!100414 (array_inv!28562 _keys!1208)))

(assert (=> start!100414 true))

(assert (=> start!100414 tp!90200))

(declare-fun e!680851 () Bool)

(declare-fun array_inv!28563 (array!77663) Bool)

(assert (=> start!100414 (and (array_inv!28563 _values!996) e!680851)))

(declare-fun b!1198617 () Bool)

(assert (=> b!1198617 (= e!680852 (not e!680854))))

(declare-fun res!797743 () Bool)

(assert (=> b!1198617 (=> res!797743 e!680854)))

(assert (=> b!1198617 (= res!797743 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77661 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1198617 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39742 0))(
  ( (Unit!39743) )
))
(declare-fun lt!543547 () Unit!39742)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77661 (_ BitVec 64) (_ BitVec 32)) Unit!39742)

(assert (=> b!1198617 (= lt!543547 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1198627 () Bool)

(declare-fun res!797739 () Bool)

(assert (=> b!1198627 (=> (not res!797739) (not e!680856))))

(assert (=> b!1198627 (= res!797739 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26362))))

(declare-fun mapNonEmpty!47504 () Bool)

(declare-fun tp!90201 () Bool)

(assert (=> mapNonEmpty!47504 (= mapRes!47504 (and tp!90201 e!680857))))

(declare-fun mapKey!47504 () (_ BitVec 32))

(declare-fun mapValue!47504 () ValueCell!14511)

(declare-fun mapRest!47504 () (Array (_ BitVec 32) ValueCell!14511))

(assert (=> mapNonEmpty!47504 (= (arr!37476 _values!996) (store mapRest!47504 mapKey!47504 mapValue!47504))))

(declare-fun b!1198628 () Bool)

(declare-fun e!680853 () Bool)

(assert (=> b!1198628 (= e!680851 (and e!680853 mapRes!47504))))

(declare-fun condMapEmpty!47504 () Bool)

(declare-fun mapDefault!47504 () ValueCell!14511)

(assert (=> b!1198628 (= condMapEmpty!47504 (= (arr!37476 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14511)) mapDefault!47504)))))

(declare-fun b!1198629 () Bool)

(assert (=> b!1198629 (= e!680853 tp_is_empty!30441)))

(assert (= (and start!100414 res!797742) b!1198619))

(assert (= (and b!1198619 res!797748) b!1198616))

(assert (= (and b!1198616 res!797745) b!1198618))

(assert (= (and b!1198618 res!797747) b!1198627))

(assert (= (and b!1198627 res!797739) b!1198622))

(assert (= (and b!1198622 res!797744) b!1198620))

(assert (= (and b!1198620 res!797746) b!1198621))

(assert (= (and b!1198621 res!797738) b!1198626))

(assert (= (and b!1198626 res!797741) b!1198623))

(assert (= (and b!1198623 res!797740) b!1198617))

(assert (= (and b!1198617 (not res!797743)) b!1198624))

(assert (= (and b!1198628 condMapEmpty!47504) mapIsEmpty!47504))

(assert (= (and b!1198628 (not condMapEmpty!47504)) mapNonEmpty!47504))

(get-info :version)

(assert (= (and mapNonEmpty!47504 ((_ is ValueCellFull!14511) mapValue!47504)) b!1198625))

(assert (= (and b!1198628 ((_ is ValueCellFull!14511) mapDefault!47504)) b!1198629))

(assert (= start!100414 b!1198628))

(declare-fun b_lambda!20933 () Bool)

(assert (=> (not b_lambda!20933) (not b!1198624)))

(declare-fun t!39081 () Bool)

(declare-fun tb!10537 () Bool)

(assert (=> (and start!100414 (= defaultEntry!1004 defaultEntry!1004) t!39081) tb!10537))

(declare-fun result!21651 () Bool)

(assert (=> tb!10537 (= result!21651 tp_is_empty!30441)))

(assert (=> b!1198624 t!39081))

(declare-fun b_and!42363 () Bool)

(assert (= b_and!42361 (and (=> t!39081 result!21651) b_and!42363)))

(declare-fun m!1105341 () Bool)

(assert (=> b!1198618 m!1105341))

(declare-fun m!1105343 () Bool)

(assert (=> b!1198623 m!1105343))

(declare-fun m!1105345 () Bool)

(assert (=> b!1198617 m!1105345))

(declare-fun m!1105347 () Bool)

(assert (=> b!1198617 m!1105347))

(declare-fun m!1105349 () Bool)

(assert (=> b!1198627 m!1105349))

(declare-fun m!1105351 () Bool)

(assert (=> b!1198619 m!1105351))

(declare-fun m!1105353 () Bool)

(assert (=> start!100414 m!1105353))

(declare-fun m!1105355 () Bool)

(assert (=> start!100414 m!1105355))

(declare-fun m!1105357 () Bool)

(assert (=> b!1198626 m!1105357))

(declare-fun m!1105359 () Bool)

(assert (=> b!1198626 m!1105359))

(declare-fun m!1105361 () Bool)

(assert (=> b!1198624 m!1105361))

(declare-fun m!1105363 () Bool)

(assert (=> b!1198624 m!1105363))

(declare-fun m!1105365 () Bool)

(assert (=> b!1198624 m!1105365))

(declare-fun m!1105367 () Bool)

(assert (=> b!1198624 m!1105367))

(declare-fun m!1105369 () Bool)

(assert (=> b!1198620 m!1105369))

(declare-fun m!1105371 () Bool)

(assert (=> b!1198621 m!1105371))

(declare-fun m!1105373 () Bool)

(assert (=> mapNonEmpty!47504 m!1105373))

(check-sat b_and!42363 (not b!1198620) (not b!1198618) (not start!100414) (not b!1198626) (not b!1198624) (not b_next!25737) (not b!1198617) (not b!1198623) tp_is_empty!30441 (not b!1198619) (not b_lambda!20933) (not mapNonEmpty!47504) (not b!1198627))
(check-sat b_and!42363 (not b_next!25737))
