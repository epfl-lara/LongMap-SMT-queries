; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100406 () Bool)

(assert start!100406)

(declare-fun b_free!25729 () Bool)

(declare-fun b_next!25729 () Bool)

(assert (=> start!100406 (= b_free!25729 (not b_next!25729))))

(declare-fun tp!90177 () Bool)

(declare-fun b_and!42345 () Bool)

(assert (=> start!100406 (= tp!90177 b_and!42345)))

(declare-fun mapNonEmpty!47492 () Bool)

(declare-fun mapRes!47492 () Bool)

(declare-fun tp!90176 () Bool)

(declare-fun e!680772 () Bool)

(assert (=> mapNonEmpty!47492 (= mapRes!47492 (and tp!90176 e!680772))))

(declare-fun mapKey!47492 () (_ BitVec 32))

(declare-datatypes ((V!45705 0))(
  ( (V!45706 (val!15273 Int)) )
))
(declare-datatypes ((ValueCell!14507 0))(
  ( (ValueCellFull!14507 (v!17911 V!45705)) (EmptyCell!14507) )
))
(declare-fun mapValue!47492 () ValueCell!14507)

(declare-datatypes ((array!77645 0))(
  ( (array!77646 (arr!37467 (Array (_ BitVec 32) ValueCell!14507)) (size!38003 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77645)

(declare-fun mapRest!47492 () (Array (_ BitVec 32) ValueCell!14507))

(assert (=> mapNonEmpty!47492 (= (arr!37467 _values!996) (store mapRest!47492 mapKey!47492 mapValue!47492))))

(declare-fun b!1198440 () Bool)

(declare-fun res!797610 () Bool)

(declare-fun e!680768 () Bool)

(assert (=> b!1198440 (=> (not res!797610) (not e!680768))))

(declare-datatypes ((array!77647 0))(
  ( (array!77648 (arr!37468 (Array (_ BitVec 32) (_ BitVec 64))) (size!38004 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77647)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1198440 (= res!797610 (= (select (arr!37468 _keys!1208) i!673) k!934))))

(declare-fun b!1198441 () Bool)

(declare-fun res!797612 () Bool)

(assert (=> b!1198441 (=> (not res!797612) (not e!680768))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1198441 (= res!797612 (validMask!0 mask!1564))))

(declare-fun b!1198442 () Bool)

(declare-fun e!680770 () Bool)

(assert (=> b!1198442 (= e!680768 e!680770)))

(declare-fun res!797616 () Bool)

(assert (=> b!1198442 (=> (not res!797616) (not e!680770))))

(declare-fun lt!543499 () array!77647)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77647 (_ BitVec 32)) Bool)

(assert (=> b!1198442 (= res!797616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543499 mask!1564))))

(assert (=> b!1198442 (= lt!543499 (array!77648 (store (arr!37468 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38004 _keys!1208)))))

(declare-fun b!1198443 () Bool)

(declare-fun res!797615 () Bool)

(assert (=> b!1198443 (=> (not res!797615) (not e!680768))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1198443 (= res!797615 (and (= (size!38003 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38004 _keys!1208) (size!38003 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!680771 () Bool)

(declare-fun b!1198445 () Bool)

(assert (=> b!1198445 (= e!680771 (or (not (= from!1455 i!673)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38004 _keys!1208)))))))

(declare-fun zeroValue!944 () V!45705)

(declare-datatypes ((tuple2!19540 0))(
  ( (tuple2!19541 (_1!9781 (_ BitVec 64)) (_2!9781 V!45705)) )
))
(declare-datatypes ((List!26358 0))(
  ( (Nil!26355) (Cons!26354 (h!27563 tuple2!19540) (t!39067 List!26358)) )
))
(declare-datatypes ((ListLongMap!17509 0))(
  ( (ListLongMap!17510 (toList!8770 List!26358)) )
))
(declare-fun lt!543497 () ListLongMap!17509)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45705)

(declare-fun getCurrentListMapNoExtraKeys!5209 (array!77647 array!77645 (_ BitVec 32) (_ BitVec 32) V!45705 V!45705 (_ BitVec 32) Int) ListLongMap!17509)

(declare-fun dynLambda!3129 (Int (_ BitVec 64)) V!45705)

(assert (=> b!1198445 (= lt!543497 (getCurrentListMapNoExtraKeys!5209 lt!543499 (array!77646 (store (arr!37467 _values!996) i!673 (ValueCellFull!14507 (dynLambda!3129 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38003 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!543496 () ListLongMap!17509)

(assert (=> b!1198445 (= lt!543496 (getCurrentListMapNoExtraKeys!5209 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!47492 () Bool)

(assert (=> mapIsEmpty!47492 mapRes!47492))

(declare-fun b!1198446 () Bool)

(declare-fun res!797614 () Bool)

(assert (=> b!1198446 (=> (not res!797614) (not e!680768))))

(assert (=> b!1198446 (= res!797614 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1198447 () Bool)

(declare-fun e!680767 () Bool)

(declare-fun tp_is_empty!30433 () Bool)

(assert (=> b!1198447 (= e!680767 tp_is_empty!30433)))

(declare-fun b!1198448 () Bool)

(declare-fun res!797611 () Bool)

(assert (=> b!1198448 (=> (not res!797611) (not e!680768))))

(assert (=> b!1198448 (= res!797611 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38004 _keys!1208))))))

(declare-fun b!1198449 () Bool)

(assert (=> b!1198449 (= e!680770 (not e!680771))))

(declare-fun res!797613 () Bool)

(assert (=> b!1198449 (=> res!797613 e!680771)))

(assert (=> b!1198449 (= res!797613 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77647 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1198449 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39734 0))(
  ( (Unit!39735) )
))
(declare-fun lt!543498 () Unit!39734)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77647 (_ BitVec 64) (_ BitVec 32)) Unit!39734)

(assert (=> b!1198449 (= lt!543498 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1198450 () Bool)

(assert (=> b!1198450 (= e!680772 tp_is_empty!30433)))

(declare-fun res!797609 () Bool)

(assert (=> start!100406 (=> (not res!797609) (not e!680768))))

(assert (=> start!100406 (= res!797609 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38004 _keys!1208))))))

(assert (=> start!100406 e!680768))

(assert (=> start!100406 tp_is_empty!30433))

(declare-fun array_inv!28554 (array!77647) Bool)

(assert (=> start!100406 (array_inv!28554 _keys!1208)))

(assert (=> start!100406 true))

(assert (=> start!100406 tp!90177))

(declare-fun e!680773 () Bool)

(declare-fun array_inv!28555 (array!77645) Bool)

(assert (=> start!100406 (and (array_inv!28555 _values!996) e!680773)))

(declare-fun b!1198444 () Bool)

(assert (=> b!1198444 (= e!680773 (and e!680767 mapRes!47492))))

(declare-fun condMapEmpty!47492 () Bool)

(declare-fun mapDefault!47492 () ValueCell!14507)

