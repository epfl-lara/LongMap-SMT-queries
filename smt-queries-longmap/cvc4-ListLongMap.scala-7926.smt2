; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98400 () Bool)

(assert start!98400)

(declare-fun b_free!24005 () Bool)

(declare-fun b_next!24005 () Bool)

(assert (=> start!98400 (= b_free!24005 (not b_next!24005))))

(declare-fun tp!84726 () Bool)

(declare-fun b_and!38859 () Bool)

(assert (=> start!98400 (= tp!84726 b_and!38859)))

(declare-fun b!1135457 () Bool)

(declare-fun res!757931 () Bool)

(declare-fun e!646171 () Bool)

(assert (=> b!1135457 (=> (not res!757931) (not e!646171))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!73931 0))(
  ( (array!73932 (arr!35616 (Array (_ BitVec 32) (_ BitVec 64))) (size!36152 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73931)

(assert (=> b!1135457 (= res!757931 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36152 _keys!1208))))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!646179 () Bool)

(declare-fun b!1135458 () Bool)

(declare-fun arrayContainsKey!0 (array!73931 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1135458 (= e!646179 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1135459 () Bool)

(declare-fun e!646163 () Bool)

(declare-fun tp_is_empty!28535 () Bool)

(assert (=> b!1135459 (= e!646163 tp_is_empty!28535)))

(declare-datatypes ((V!43173 0))(
  ( (V!43174 (val!14324 Int)) )
))
(declare-fun zeroValue!944 () V!43173)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18078 0))(
  ( (tuple2!18079 (_1!9050 (_ BitVec 64)) (_2!9050 V!43173)) )
))
(declare-datatypes ((List!24836 0))(
  ( (Nil!24833) (Cons!24832 (h!26041 tuple2!18078) (t!35833 List!24836)) )
))
(declare-datatypes ((ListLongMap!16047 0))(
  ( (ListLongMap!16048 (toList!8039 List!24836)) )
))
(declare-fun call!49605 () ListLongMap!16047)

(declare-datatypes ((ValueCell!13558 0))(
  ( (ValueCellFull!13558 (v!16961 V!43173)) (EmptyCell!13558) )
))
(declare-datatypes ((array!73933 0))(
  ( (array!73934 (arr!35617 (Array (_ BitVec 32) ValueCell!13558)) (size!36153 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73933)

(declare-fun minValue!944 () V!43173)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun bm!49599 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4525 (array!73931 array!73933 (_ BitVec 32) (_ BitVec 32) V!43173 V!43173 (_ BitVec 32) Int) ListLongMap!16047)

(assert (=> bm!49599 (= call!49605 (getCurrentListMapNoExtraKeys!4525 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!110941 () Bool)

(declare-fun call!49603 () Bool)

(declare-fun call!49602 () ListLongMap!16047)

(declare-fun lt!504758 () ListLongMap!16047)

(declare-fun bm!49600 () Bool)

(declare-fun contains!6571 (ListLongMap!16047 (_ BitVec 64)) Bool)

(assert (=> bm!49600 (= call!49603 (contains!6571 (ite c!110941 lt!504758 call!49602) k!934))))

(declare-fun lt!504761 () ListLongMap!16047)

(declare-fun c!110942 () Bool)

(declare-fun bm!49601 () Bool)

(declare-fun call!49606 () ListLongMap!16047)

(declare-fun +!3476 (ListLongMap!16047 tuple2!18078) ListLongMap!16047)

(assert (=> bm!49601 (= call!49606 (+!3476 lt!504761 (ite (or c!110941 c!110942) (tuple2!18079 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18079 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1135460 () Bool)

(declare-fun e!646169 () Bool)

(assert (=> b!1135460 (= e!646169 tp_is_empty!28535)))

(declare-fun b!1135461 () Bool)

(declare-fun res!757923 () Bool)

(declare-fun e!646176 () Bool)

(assert (=> b!1135461 (=> res!757923 e!646176)))

(declare-datatypes ((List!24837 0))(
  ( (Nil!24834) (Cons!24833 (h!26042 (_ BitVec 64)) (t!35834 List!24837)) )
))
(declare-fun contains!6572 (List!24837 (_ BitVec 64)) Bool)

(assert (=> b!1135461 (= res!757923 (contains!6572 Nil!24834 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1135462 () Bool)

(declare-fun e!646172 () Bool)

(declare-fun mapRes!44627 () Bool)

(assert (=> b!1135462 (= e!646172 (and e!646163 mapRes!44627))))

(declare-fun condMapEmpty!44627 () Bool)

(declare-fun mapDefault!44627 () ValueCell!13558)

