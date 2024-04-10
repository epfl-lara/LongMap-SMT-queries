; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100762 () Bool)

(assert start!100762)

(declare-fun b_free!25933 () Bool)

(declare-fun b_next!25933 () Bool)

(assert (=> start!100762 (= b_free!25933 (not b_next!25933))))

(declare-fun tp!90802 () Bool)

(declare-fun b_and!42849 () Bool)

(assert (=> start!100762 (= tp!90802 b_and!42849)))

(declare-fun res!801936 () Bool)

(declare-fun e!684710 () Bool)

(assert (=> start!100762 (=> (not res!801936) (not e!684710))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!78055 0))(
  ( (array!78056 (arr!37668 (Array (_ BitVec 32) (_ BitVec 64))) (size!38204 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78055)

(assert (=> start!100762 (= res!801936 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38204 _keys!1208))))))

(assert (=> start!100762 e!684710))

(declare-fun tp_is_empty!30637 () Bool)

(assert (=> start!100762 tp_is_empty!30637))

(declare-fun array_inv!28698 (array!78055) Bool)

(assert (=> start!100762 (array_inv!28698 _keys!1208)))

(assert (=> start!100762 true))

(assert (=> start!100762 tp!90802))

(declare-datatypes ((V!45977 0))(
  ( (V!45978 (val!15375 Int)) )
))
(declare-datatypes ((ValueCell!14609 0))(
  ( (ValueCellFull!14609 (v!18019 V!45977)) (EmptyCell!14609) )
))
(declare-datatypes ((array!78057 0))(
  ( (array!78058 (arr!37669 (Array (_ BitVec 32) ValueCell!14609)) (size!38205 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78057)

(declare-fun e!684700 () Bool)

(declare-fun array_inv!28699 (array!78057) Bool)

(assert (=> start!100762 (and (array_inv!28699 _values!996) e!684700)))

(declare-fun b!1205693 () Bool)

(declare-fun e!684706 () Bool)

(declare-fun e!684701 () Bool)

(assert (=> b!1205693 (= e!684706 e!684701)))

(declare-fun res!801927 () Bool)

(assert (=> b!1205693 (=> res!801927 e!684701)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1205693 (= res!801927 (not (= from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!546882 () array!78057)

(declare-datatypes ((tuple2!19722 0))(
  ( (tuple2!19723 (_1!9872 (_ BitVec 64)) (_2!9872 V!45977)) )
))
(declare-datatypes ((List!26528 0))(
  ( (Nil!26525) (Cons!26524 (h!27733 tuple2!19722) (t!39441 List!26528)) )
))
(declare-datatypes ((ListLongMap!17691 0))(
  ( (ListLongMap!17692 (toList!8861 List!26528)) )
))
(declare-fun lt!546883 () ListLongMap!17691)

(declare-fun lt!546881 () array!78055)

(declare-fun minValue!944 () V!45977)

(declare-fun zeroValue!944 () V!45977)

(declare-fun getCurrentListMapNoExtraKeys!5296 (array!78055 array!78057 (_ BitVec 32) (_ BitVec 32) V!45977 V!45977 (_ BitVec 32) Int) ListLongMap!17691)

(assert (=> b!1205693 (= lt!546883 (getCurrentListMapNoExtraKeys!5296 lt!546881 lt!546882 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3204 (Int (_ BitVec 64)) V!45977)

(assert (=> b!1205693 (= lt!546882 (array!78058 (store (arr!37669 _values!996) i!673 (ValueCellFull!14609 (dynLambda!3204 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38205 _values!996)))))

(declare-fun lt!546879 () ListLongMap!17691)

(assert (=> b!1205693 (= lt!546879 (getCurrentListMapNoExtraKeys!5296 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1205694 () Bool)

(declare-fun e!684696 () Bool)

(assert (=> b!1205694 (= e!684696 (not e!684706))))

(declare-fun res!801935 () Bool)

(assert (=> b!1205694 (=> res!801935 e!684706)))

(assert (=> b!1205694 (= res!801935 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78055 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1205694 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39972 0))(
  ( (Unit!39973) )
))
(declare-fun lt!546884 () Unit!39972)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78055 (_ BitVec 64) (_ BitVec 32)) Unit!39972)

(assert (=> b!1205694 (= lt!546884 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1205695 () Bool)

(declare-fun e!684705 () Unit!39972)

(declare-fun Unit!39974 () Unit!39972)

(assert (=> b!1205695 (= e!684705 Unit!39974)))

(declare-fun b!1205696 () Bool)

(declare-fun e!684708 () Unit!39972)

(declare-fun lt!546875 () Unit!39972)

(assert (=> b!1205696 (= e!684708 lt!546875)))

(declare-fun lt!546880 () ListLongMap!17691)

(declare-fun lt!546888 () Unit!39972)

(declare-fun addStillContains!1013 (ListLongMap!17691 (_ BitVec 64) V!45977 (_ BitVec 64)) Unit!39972)

(assert (=> b!1205696 (= lt!546888 (addStillContains!1013 lt!546880 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun lt!546877 () ListLongMap!17691)

(declare-fun +!3984 (ListLongMap!17691 tuple2!19722) ListLongMap!17691)

(assert (=> b!1205696 (= lt!546877 (+!3984 lt!546880 (tuple2!19723 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun call!58527 () Bool)

(assert (=> b!1205696 call!58527))

(declare-fun call!58528 () Unit!39972)

(assert (=> b!1205696 (= lt!546875 call!58528)))

(declare-fun call!58530 () ListLongMap!17691)

(declare-fun contains!6921 (ListLongMap!17691 (_ BitVec 64)) Bool)

(assert (=> b!1205696 (contains!6921 call!58530 k!934)))

(declare-fun bm!58521 () Bool)

(declare-fun call!58524 () Bool)

(assert (=> bm!58521 (= call!58524 call!58527)))

(declare-fun b!1205697 () Bool)

(declare-fun lt!546886 () Unit!39972)

(assert (=> b!1205697 (= e!684705 lt!546886)))

(declare-fun call!58525 () Unit!39972)

(assert (=> b!1205697 (= lt!546886 call!58525)))

(assert (=> b!1205697 call!58524))

(declare-fun b!1205698 () Bool)

(declare-fun res!801928 () Bool)

(assert (=> b!1205698 (=> (not res!801928) (not e!684710))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78055 (_ BitVec 32)) Bool)

(assert (=> b!1205698 (= res!801928 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun call!58531 () ListLongMap!17691)

(declare-fun bm!58522 () Bool)

(assert (=> bm!58522 (= call!58531 (getCurrentListMapNoExtraKeys!5296 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1205699 () Bool)

(declare-fun c!118326 () Bool)

(declare-fun lt!546887 () Bool)

(assert (=> b!1205699 (= c!118326 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!546887))))

(declare-fun e!684709 () Unit!39972)

(assert (=> b!1205699 (= e!684709 e!684705)))

(declare-fun b!1205700 () Bool)

(declare-fun e!684698 () Bool)

(assert (=> b!1205700 (= e!684698 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!58529 () ListLongMap!17691)

(declare-fun bm!58523 () Bool)

(declare-fun c!118325 () Bool)

(assert (=> bm!58523 (= call!58527 (contains!6921 (ite c!118325 lt!546877 call!58529) k!934))))

(declare-fun b!1205701 () Bool)

(declare-fun e!684703 () Bool)

(declare-fun mapRes!47811 () Bool)

(assert (=> b!1205701 (= e!684700 (and e!684703 mapRes!47811))))

(declare-fun condMapEmpty!47811 () Bool)

(declare-fun mapDefault!47811 () ValueCell!14609)

