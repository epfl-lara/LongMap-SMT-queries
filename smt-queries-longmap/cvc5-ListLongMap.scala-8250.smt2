; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100448 () Bool)

(assert start!100448)

(declare-fun b_free!25771 () Bool)

(declare-fun b_next!25771 () Bool)

(assert (=> start!100448 (= b_free!25771 (not b_next!25771))))

(declare-fun tp!90303 () Bool)

(declare-fun b_and!42429 () Bool)

(assert (=> start!100448 (= tp!90303 b_and!42429)))

(declare-fun b!1199364 () Bool)

(declare-fun e!681210 () Bool)

(assert (=> b!1199364 (= e!681210 true)))

(declare-datatypes ((V!45761 0))(
  ( (V!45762 (val!15294 Int)) )
))
(declare-fun zeroValue!944 () V!45761)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!77725 0))(
  ( (array!77726 (arr!37507 (Array (_ BitVec 32) (_ BitVec 64))) (size!38043 (_ BitVec 32))) )
))
(declare-fun lt!543751 () array!77725)

(declare-fun minValue!944 () V!45761)

(declare-datatypes ((ValueCell!14528 0))(
  ( (ValueCellFull!14528 (v!17932 V!45761)) (EmptyCell!14528) )
))
(declare-datatypes ((array!77727 0))(
  ( (array!77728 (arr!37508 (Array (_ BitVec 32) ValueCell!14528)) (size!38044 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77727)

(declare-datatypes ((tuple2!19576 0))(
  ( (tuple2!19577 (_1!9799 (_ BitVec 64)) (_2!9799 V!45761)) )
))
(declare-datatypes ((List!26392 0))(
  ( (Nil!26389) (Cons!26388 (h!27597 tuple2!19576) (t!39143 List!26392)) )
))
(declare-datatypes ((ListLongMap!17545 0))(
  ( (ListLongMap!17546 (toList!8788 List!26392)) )
))
(declare-fun lt!543749 () ListLongMap!17545)

(declare-fun getCurrentListMapNoExtraKeys!5227 (array!77725 array!77727 (_ BitVec 32) (_ BitVec 32) V!45761 V!45761 (_ BitVec 32) Int) ListLongMap!17545)

(declare-fun dynLambda!3147 (Int (_ BitVec 64)) V!45761)

(assert (=> b!1199364 (= lt!543749 (getCurrentListMapNoExtraKeys!5227 lt!543751 (array!77728 (store (arr!37508 _values!996) i!673 (ValueCellFull!14528 (dynLambda!3147 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38044 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _keys!1208 () array!77725)

(declare-fun lt!543748 () ListLongMap!17545)

(assert (=> b!1199364 (= lt!543748 (getCurrentListMapNoExtraKeys!5227 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1199365 () Bool)

(declare-fun res!798309 () Bool)

(declare-fun e!681212 () Bool)

(assert (=> b!1199365 (=> (not res!798309) (not e!681212))))

(assert (=> b!1199365 (= res!798309 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38043 _keys!1208))))))

(declare-fun b!1199366 () Bool)

(declare-fun res!798301 () Bool)

(declare-fun e!681213 () Bool)

(assert (=> b!1199366 (=> (not res!798301) (not e!681213))))

(declare-datatypes ((List!26393 0))(
  ( (Nil!26390) (Cons!26389 (h!27598 (_ BitVec 64)) (t!39144 List!26393)) )
))
(declare-fun arrayNoDuplicates!0 (array!77725 (_ BitVec 32) List!26393) Bool)

(assert (=> b!1199366 (= res!798301 (arrayNoDuplicates!0 lt!543751 #b00000000000000000000000000000000 Nil!26390))))

(declare-fun b!1199367 () Bool)

(declare-fun res!798303 () Bool)

(assert (=> b!1199367 (=> (not res!798303) (not e!681212))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1199367 (= res!798303 (= (select (arr!37507 _keys!1208) i!673) k!934))))

(declare-fun b!1199368 () Bool)

(declare-fun e!681211 () Bool)

(declare-fun e!681209 () Bool)

(declare-fun mapRes!47555 () Bool)

(assert (=> b!1199368 (= e!681211 (and e!681209 mapRes!47555))))

(declare-fun condMapEmpty!47555 () Bool)

(declare-fun mapDefault!47555 () ValueCell!14528)

