; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100422 () Bool)

(assert start!100422)

(declare-fun b_free!25745 () Bool)

(declare-fun b_next!25745 () Bool)

(assert (=> start!100422 (= b_free!25745 (not b_next!25745))))

(declare-fun tp!90224 () Bool)

(declare-fun b_and!42377 () Bool)

(assert (=> start!100422 (= tp!90224 b_and!42377)))

(declare-fun b!1198792 () Bool)

(declare-fun res!797872 () Bool)

(declare-fun e!680938 () Bool)

(assert (=> b!1198792 (=> (not res!797872) (not e!680938))))

(declare-datatypes ((array!77675 0))(
  ( (array!77676 (arr!37482 (Array (_ BitVec 32) (_ BitVec 64))) (size!38018 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77675)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45725 0))(
  ( (V!45726 (val!15281 Int)) )
))
(declare-datatypes ((ValueCell!14515 0))(
  ( (ValueCellFull!14515 (v!17919 V!45725)) (EmptyCell!14515) )
))
(declare-datatypes ((array!77677 0))(
  ( (array!77678 (arr!37483 (Array (_ BitVec 32) ValueCell!14515)) (size!38019 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77677)

(assert (=> b!1198792 (= res!797872 (and (= (size!38019 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38018 _keys!1208) (size!38019 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1198793 () Bool)

(declare-fun e!680940 () Bool)

(declare-fun tp_is_empty!30449 () Bool)

(assert (=> b!1198793 (= e!680940 tp_is_empty!30449)))

(declare-fun res!797874 () Bool)

(assert (=> start!100422 (=> (not res!797874) (not e!680938))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100422 (= res!797874 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38018 _keys!1208))))))

(assert (=> start!100422 e!680938))

(assert (=> start!100422 tp_is_empty!30449))

(declare-fun array_inv!28566 (array!77675) Bool)

(assert (=> start!100422 (array_inv!28566 _keys!1208)))

(assert (=> start!100422 true))

(assert (=> start!100422 tp!90224))

(declare-fun e!680935 () Bool)

(declare-fun array_inv!28567 (array!77677) Bool)

(assert (=> start!100422 (and (array_inv!28567 _values!996) e!680935)))

(declare-fun b!1198794 () Bool)

(declare-fun e!680937 () Bool)

(declare-fun e!680941 () Bool)

(assert (=> b!1198794 (= e!680937 (not e!680941))))

(declare-fun res!797873 () Bool)

(assert (=> b!1198794 (=> res!797873 e!680941)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1198794 (= res!797873 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77675 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1198794 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39748 0))(
  ( (Unit!39749) )
))
(declare-fun lt!543595 () Unit!39748)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77675 (_ BitVec 64) (_ BitVec 32)) Unit!39748)

(assert (=> b!1198794 (= lt!543595 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapNonEmpty!47516 () Bool)

(declare-fun mapRes!47516 () Bool)

(declare-fun tp!90225 () Bool)

(declare-fun e!680936 () Bool)

(assert (=> mapNonEmpty!47516 (= mapRes!47516 (and tp!90225 e!680936))))

(declare-fun mapValue!47516 () ValueCell!14515)

(declare-fun mapKey!47516 () (_ BitVec 32))

(declare-fun mapRest!47516 () (Array (_ BitVec 32) ValueCell!14515))

(assert (=> mapNonEmpty!47516 (= (arr!37483 _values!996) (store mapRest!47516 mapKey!47516 mapValue!47516))))

(declare-fun b!1198795 () Bool)

(assert (=> b!1198795 (= e!680938 e!680937)))

(declare-fun res!797875 () Bool)

(assert (=> b!1198795 (=> (not res!797875) (not e!680937))))

(declare-fun lt!543593 () array!77675)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77675 (_ BitVec 32)) Bool)

(assert (=> b!1198795 (= res!797875 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543593 mask!1564))))

(assert (=> b!1198795 (= lt!543593 (array!77676 (store (arr!37482 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38018 _keys!1208)))))

(declare-fun b!1198796 () Bool)

(assert (=> b!1198796 (= e!680941 true)))

(declare-fun zeroValue!944 () V!45725)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19554 0))(
  ( (tuple2!19555 (_1!9788 (_ BitVec 64)) (_2!9788 V!45725)) )
))
(declare-datatypes ((List!26371 0))(
  ( (Nil!26368) (Cons!26367 (h!27576 tuple2!19554) (t!39096 List!26371)) )
))
(declare-datatypes ((ListLongMap!17523 0))(
  ( (ListLongMap!17524 (toList!8777 List!26371)) )
))
(declare-fun lt!543594 () ListLongMap!17523)

(declare-fun minValue!944 () V!45725)

(declare-fun getCurrentListMapNoExtraKeys!5216 (array!77675 array!77677 (_ BitVec 32) (_ BitVec 32) V!45725 V!45725 (_ BitVec 32) Int) ListLongMap!17523)

(declare-fun dynLambda!3136 (Int (_ BitVec 64)) V!45725)

(assert (=> b!1198796 (= lt!543594 (getCurrentListMapNoExtraKeys!5216 lt!543593 (array!77678 (store (arr!37483 _values!996) i!673 (ValueCellFull!14515 (dynLambda!3136 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38019 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!543592 () ListLongMap!17523)

(assert (=> b!1198796 (= lt!543592 (getCurrentListMapNoExtraKeys!5216 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1198797 () Bool)

(assert (=> b!1198797 (= e!680935 (and e!680940 mapRes!47516))))

(declare-fun condMapEmpty!47516 () Bool)

(declare-fun mapDefault!47516 () ValueCell!14515)

