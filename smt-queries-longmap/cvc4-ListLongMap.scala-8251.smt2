; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100458 () Bool)

(assert start!100458)

(declare-fun b_free!25781 () Bool)

(declare-fun b_next!25781 () Bool)

(assert (=> start!100458 (= b_free!25781 (not b_next!25781))))

(declare-fun tp!90332 () Bool)

(declare-fun b_and!42449 () Bool)

(assert (=> start!100458 (= tp!90332 b_and!42449)))

(declare-fun b!1199584 () Bool)

(declare-fun e!681317 () Bool)

(declare-fun e!681316 () Bool)

(assert (=> b!1199584 (= e!681317 e!681316)))

(declare-fun res!798471 () Bool)

(assert (=> b!1199584 (=> (not res!798471) (not e!681316))))

(declare-datatypes ((array!77745 0))(
  ( (array!77746 (arr!37517 (Array (_ BitVec 32) (_ BitVec 64))) (size!38053 (_ BitVec 32))) )
))
(declare-fun lt!543811 () array!77745)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77745 (_ BitVec 32)) Bool)

(assert (=> b!1199584 (= res!798471 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543811 mask!1564))))

(declare-fun _keys!1208 () array!77745)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1199584 (= lt!543811 (array!77746 (store (arr!37517 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38053 _keys!1208)))))

(declare-fun b!1199585 () Bool)

(declare-fun e!681315 () Bool)

(assert (=> b!1199585 (= e!681315 true)))

(declare-datatypes ((V!45773 0))(
  ( (V!45774 (val!15299 Int)) )
))
(declare-fun zeroValue!944 () V!45773)

(declare-datatypes ((tuple2!19586 0))(
  ( (tuple2!19587 (_1!9804 (_ BitVec 64)) (_2!9804 V!45773)) )
))
(declare-datatypes ((List!26402 0))(
  ( (Nil!26399) (Cons!26398 (h!27607 tuple2!19586) (t!39163 List!26402)) )
))
(declare-datatypes ((ListLongMap!17555 0))(
  ( (ListLongMap!17556 (toList!8793 List!26402)) )
))
(declare-fun lt!543810 () ListLongMap!17555)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14533 0))(
  ( (ValueCellFull!14533 (v!17937 V!45773)) (EmptyCell!14533) )
))
(declare-datatypes ((array!77747 0))(
  ( (array!77748 (arr!37518 (Array (_ BitVec 32) ValueCell!14533)) (size!38054 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77747)

(declare-fun minValue!944 () V!45773)

(declare-fun getCurrentListMapNoExtraKeys!5232 (array!77745 array!77747 (_ BitVec 32) (_ BitVec 32) V!45773 V!45773 (_ BitVec 32) Int) ListLongMap!17555)

(declare-fun dynLambda!3152 (Int (_ BitVec 64)) V!45773)

(assert (=> b!1199585 (= lt!543810 (getCurrentListMapNoExtraKeys!5232 lt!543811 (array!77748 (store (arr!37518 _values!996) i!673 (ValueCellFull!14533 (dynLambda!3152 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38054 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!543808 () ListLongMap!17555)

(assert (=> b!1199585 (= lt!543808 (getCurrentListMapNoExtraKeys!5232 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!47570 () Bool)

(declare-fun mapRes!47570 () Bool)

(assert (=> mapIsEmpty!47570 mapRes!47570))

(declare-fun b!1199586 () Bool)

(declare-fun res!798464 () Bool)

(assert (=> b!1199586 (=> (not res!798464) (not e!681317))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1199586 (= res!798464 (validKeyInArray!0 k!934))))

(declare-fun res!798468 () Bool)

(assert (=> start!100458 (=> (not res!798468) (not e!681317))))

(assert (=> start!100458 (= res!798468 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38053 _keys!1208))))))

(assert (=> start!100458 e!681317))

(declare-fun tp_is_empty!30485 () Bool)

(assert (=> start!100458 tp_is_empty!30485))

(declare-fun array_inv!28588 (array!77745) Bool)

(assert (=> start!100458 (array_inv!28588 _keys!1208)))

(assert (=> start!100458 true))

(assert (=> start!100458 tp!90332))

(declare-fun e!681314 () Bool)

(declare-fun array_inv!28589 (array!77747) Bool)

(assert (=> start!100458 (and (array_inv!28589 _values!996) e!681314)))

(declare-fun b!1199587 () Bool)

(declare-fun res!798469 () Bool)

(assert (=> b!1199587 (=> (not res!798469) (not e!681317))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1199587 (= res!798469 (validMask!0 mask!1564))))

(declare-fun b!1199588 () Bool)

(declare-fun res!798473 () Bool)

(assert (=> b!1199588 (=> (not res!798473) (not e!681317))))

(assert (=> b!1199588 (= res!798473 (and (= (size!38054 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38053 _keys!1208) (size!38054 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1199589 () Bool)

(declare-fun res!798474 () Bool)

(assert (=> b!1199589 (=> (not res!798474) (not e!681317))))

(assert (=> b!1199589 (= res!798474 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1199590 () Bool)

(declare-fun res!798467 () Bool)

(assert (=> b!1199590 (=> (not res!798467) (not e!681316))))

(declare-datatypes ((List!26403 0))(
  ( (Nil!26400) (Cons!26399 (h!27608 (_ BitVec 64)) (t!39164 List!26403)) )
))
(declare-fun arrayNoDuplicates!0 (array!77745 (_ BitVec 32) List!26403) Bool)

(assert (=> b!1199590 (= res!798467 (arrayNoDuplicates!0 lt!543811 #b00000000000000000000000000000000 Nil!26400))))

(declare-fun b!1199591 () Bool)

(declare-fun e!681313 () Bool)

(assert (=> b!1199591 (= e!681313 tp_is_empty!30485)))

(declare-fun b!1199592 () Bool)

(declare-fun e!681319 () Bool)

(assert (=> b!1199592 (= e!681314 (and e!681319 mapRes!47570))))

(declare-fun condMapEmpty!47570 () Bool)

(declare-fun mapDefault!47570 () ValueCell!14533)

