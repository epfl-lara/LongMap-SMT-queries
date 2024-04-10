; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100532 () Bool)

(assert start!100532)

(declare-fun b_free!25855 () Bool)

(declare-fun b_next!25855 () Bool)

(assert (=> start!100532 (= b_free!25855 (not b_next!25855))))

(declare-fun tp!90555 () Bool)

(declare-fun b_and!42597 () Bool)

(assert (=> start!100532 (= tp!90555 b_and!42597)))

(declare-fun bm!57457 () Bool)

(declare-datatypes ((Unit!39835 0))(
  ( (Unit!39836) )
))
(declare-fun call!57464 () Unit!39835)

(declare-fun call!57462 () Unit!39835)

(assert (=> bm!57457 (= call!57464 call!57462)))

(declare-fun b!1201522 () Bool)

(declare-fun call!57467 () Bool)

(assert (=> b!1201522 call!57467))

(declare-fun lt!544506 () Unit!39835)

(assert (=> b!1201522 (= lt!544506 call!57464)))

(declare-fun e!682312 () Unit!39835)

(assert (=> b!1201522 (= e!682312 lt!544506)))

(declare-fun mapIsEmpty!47681 () Bool)

(declare-fun mapRes!47681 () Bool)

(assert (=> mapIsEmpty!47681 mapRes!47681))

(declare-fun b!1201523 () Bool)

(declare-fun res!799819 () Bool)

(declare-fun e!682304 () Bool)

(assert (=> b!1201523 (=> (not res!799819) (not e!682304))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1201523 (= res!799819 (validKeyInArray!0 k!934))))

(declare-fun b!1201524 () Bool)

(declare-fun res!799822 () Bool)

(assert (=> b!1201524 (=> (not res!799822) (not e!682304))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1201524 (= res!799822 (validMask!0 mask!1564))))

(declare-datatypes ((V!45873 0))(
  ( (V!45874 (val!15336 Int)) )
))
(declare-fun zeroValue!944 () V!45873)

(declare-datatypes ((array!77891 0))(
  ( (array!77892 (arr!37590 (Array (_ BitVec 32) (_ BitVec 64))) (size!38126 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77891)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!19644 0))(
  ( (tuple2!19645 (_1!9833 (_ BitVec 64)) (_2!9833 V!45873)) )
))
(declare-datatypes ((List!26461 0))(
  ( (Nil!26458) (Cons!26457 (h!27666 tuple2!19644) (t!39296 List!26461)) )
))
(declare-datatypes ((ListLongMap!17613 0))(
  ( (ListLongMap!17614 (toList!8822 List!26461)) )
))
(declare-fun call!57466 () ListLongMap!17613)

(declare-fun bm!57458 () Bool)

(declare-datatypes ((ValueCell!14570 0))(
  ( (ValueCellFull!14570 (v!17974 V!45873)) (EmptyCell!14570) )
))
(declare-datatypes ((array!77893 0))(
  ( (array!77894 (arr!37591 (Array (_ BitVec 32) ValueCell!14570)) (size!38127 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77893)

(declare-fun minValue!944 () V!45873)

(declare-fun getCurrentListMapNoExtraKeys!5260 (array!77891 array!77893 (_ BitVec 32) (_ BitVec 32) V!45873 V!45873 (_ BitVec 32) Int) ListLongMap!17613)

(assert (=> bm!57458 (= call!57466 (getCurrentListMapNoExtraKeys!5260 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1201526 () Bool)

(declare-fun e!682315 () Bool)

(declare-fun e!682314 () Bool)

(assert (=> b!1201526 (= e!682315 (and e!682314 mapRes!47681))))

(declare-fun condMapEmpty!47681 () Bool)

(declare-fun mapDefault!47681 () ValueCell!14570)

