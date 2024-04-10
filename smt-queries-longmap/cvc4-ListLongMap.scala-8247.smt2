; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100434 () Bool)

(assert start!100434)

(declare-fun b_free!25757 () Bool)

(declare-fun b_next!25757 () Bool)

(assert (=> start!100434 (= b_free!25757 (not b_next!25757))))

(declare-fun tp!90260 () Bool)

(declare-fun b_and!42401 () Bool)

(assert (=> start!100434 (= tp!90260 b_and!42401)))

(declare-fun b!1199056 () Bool)

(declare-fun res!798074 () Bool)

(declare-fun e!681061 () Bool)

(assert (=> b!1199056 (=> (not res!798074) (not e!681061))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1199056 (= res!798074 (validMask!0 mask!1564))))

(declare-fun b!1199057 () Bool)

(declare-fun e!681066 () Bool)

(declare-fun tp_is_empty!30461 () Bool)

(assert (=> b!1199057 (= e!681066 tp_is_empty!30461)))

(declare-fun b!1199058 () Bool)

(declare-fun res!798069 () Bool)

(assert (=> b!1199058 (=> (not res!798069) (not e!681061))))

(declare-datatypes ((array!77699 0))(
  ( (array!77700 (arr!37494 (Array (_ BitVec 32) (_ BitVec 64))) (size!38030 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77699)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45741 0))(
  ( (V!45742 (val!15287 Int)) )
))
(declare-datatypes ((ValueCell!14521 0))(
  ( (ValueCellFull!14521 (v!17925 V!45741)) (EmptyCell!14521) )
))
(declare-datatypes ((array!77701 0))(
  ( (array!77702 (arr!37495 (Array (_ BitVec 32) ValueCell!14521)) (size!38031 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77701)

(assert (=> b!1199058 (= res!798069 (and (= (size!38031 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38030 _keys!1208) (size!38031 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!798073 () Bool)

(assert (=> start!100434 (=> (not res!798073) (not e!681061))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100434 (= res!798073 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38030 _keys!1208))))))

(assert (=> start!100434 e!681061))

(assert (=> start!100434 tp_is_empty!30461))

(declare-fun array_inv!28572 (array!77699) Bool)

(assert (=> start!100434 (array_inv!28572 _keys!1208)))

(assert (=> start!100434 true))

(assert (=> start!100434 tp!90260))

(declare-fun e!681067 () Bool)

(declare-fun array_inv!28573 (array!77701) Bool)

(assert (=> start!100434 (and (array_inv!28573 _values!996) e!681067)))

(declare-fun b!1199059 () Bool)

(declare-fun e!681065 () Bool)

(assert (=> b!1199059 (= e!681065 true)))

(declare-fun zeroValue!944 () V!45741)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19564 0))(
  ( (tuple2!19565 (_1!9793 (_ BitVec 64)) (_2!9793 V!45741)) )
))
(declare-datatypes ((List!26380 0))(
  ( (Nil!26377) (Cons!26376 (h!27585 tuple2!19564) (t!39117 List!26380)) )
))
(declare-datatypes ((ListLongMap!17533 0))(
  ( (ListLongMap!17534 (toList!8782 List!26380)) )
))
(declare-fun lt!543665 () ListLongMap!17533)

(declare-fun lt!543667 () array!77699)

(declare-fun minValue!944 () V!45741)

(declare-fun getCurrentListMapNoExtraKeys!5221 (array!77699 array!77701 (_ BitVec 32) (_ BitVec 32) V!45741 V!45741 (_ BitVec 32) Int) ListLongMap!17533)

(declare-fun dynLambda!3141 (Int (_ BitVec 64)) V!45741)

(assert (=> b!1199059 (= lt!543665 (getCurrentListMapNoExtraKeys!5221 lt!543667 (array!77702 (store (arr!37495 _values!996) i!673 (ValueCellFull!14521 (dynLambda!3141 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38031 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!543666 () ListLongMap!17533)

(assert (=> b!1199059 (= lt!543666 (getCurrentListMapNoExtraKeys!5221 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1199060 () Bool)

(declare-fun res!798077 () Bool)

(assert (=> b!1199060 (=> (not res!798077) (not e!681061))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77699 (_ BitVec 32)) Bool)

(assert (=> b!1199060 (= res!798077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1199061 () Bool)

(declare-fun e!681062 () Bool)

(assert (=> b!1199061 (= e!681061 e!681062)))

(declare-fun res!798068 () Bool)

(assert (=> b!1199061 (=> (not res!798068) (not e!681062))))

(assert (=> b!1199061 (= res!798068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543667 mask!1564))))

(assert (=> b!1199061 (= lt!543667 (array!77700 (store (arr!37494 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38030 _keys!1208)))))

(declare-fun mapIsEmpty!47534 () Bool)

(declare-fun mapRes!47534 () Bool)

(assert (=> mapIsEmpty!47534 mapRes!47534))

(declare-fun b!1199062 () Bool)

(declare-fun res!798070 () Bool)

(assert (=> b!1199062 (=> (not res!798070) (not e!681061))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1199062 (= res!798070 (= (select (arr!37494 _keys!1208) i!673) k!934))))

(declare-fun b!1199063 () Bool)

(declare-fun res!798071 () Bool)

(assert (=> b!1199063 (=> (not res!798071) (not e!681061))))

(declare-datatypes ((List!26381 0))(
  ( (Nil!26378) (Cons!26377 (h!27586 (_ BitVec 64)) (t!39118 List!26381)) )
))
(declare-fun arrayNoDuplicates!0 (array!77699 (_ BitVec 32) List!26381) Bool)

(assert (=> b!1199063 (= res!798071 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26378))))

(declare-fun b!1199064 () Bool)

(declare-fun e!681064 () Bool)

(assert (=> b!1199064 (= e!681067 (and e!681064 mapRes!47534))))

(declare-fun condMapEmpty!47534 () Bool)

(declare-fun mapDefault!47534 () ValueCell!14521)

