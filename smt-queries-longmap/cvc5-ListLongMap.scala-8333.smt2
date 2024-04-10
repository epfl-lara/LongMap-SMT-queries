; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101424 () Bool)

(assert start!101424)

(declare-fun b_free!26269 () Bool)

(declare-fun b_next!26269 () Bool)

(assert (=> start!101424 (= b_free!26269 (not b_next!26269))))

(declare-fun tp!91837 () Bool)

(declare-fun b_and!43709 () Bool)

(assert (=> start!101424 (= tp!91837 b_and!43709)))

(declare-fun b!1218986 () Bool)

(declare-fun e!692104 () Bool)

(declare-fun e!692105 () Bool)

(assert (=> b!1218986 (= e!692104 e!692105)))

(declare-fun res!809619 () Bool)

(assert (=> b!1218986 (=> res!809619 e!692105)))

(declare-datatypes ((array!78721 0))(
  ( (array!78722 (arr!37992 (Array (_ BitVec 32) (_ BitVec 64))) (size!38528 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78721)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1218986 (= res!809619 (not (= (select (arr!37992 _keys!1208) from!1455) k!934)))))

(declare-fun e!692109 () Bool)

(assert (=> b!1218986 e!692109))

(declare-fun res!809618 () Bool)

(assert (=> b!1218986 (=> (not res!809618) (not e!692109))))

(declare-datatypes ((V!46425 0))(
  ( (V!46426 (val!15543 Int)) )
))
(declare-datatypes ((tuple2!19998 0))(
  ( (tuple2!19999 (_1!10010 (_ BitVec 64)) (_2!10010 V!46425)) )
))
(declare-datatypes ((List!26800 0))(
  ( (Nil!26797) (Cons!26796 (h!28005 tuple2!19998) (t!40049 List!26800)) )
))
(declare-datatypes ((ListLongMap!17967 0))(
  ( (ListLongMap!17968 (toList!8999 List!26800)) )
))
(declare-fun lt!554181 () ListLongMap!17967)

(declare-fun lt!554186 () V!46425)

(declare-fun lt!554180 () ListLongMap!17967)

(declare-datatypes ((ValueCell!14777 0))(
  ( (ValueCellFull!14777 (v!18199 V!46425)) (EmptyCell!14777) )
))
(declare-datatypes ((array!78723 0))(
  ( (array!78724 (arr!37993 (Array (_ BitVec 32) ValueCell!14777)) (size!38529 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78723)

(declare-fun +!4068 (ListLongMap!17967 tuple2!19998) ListLongMap!17967)

(declare-fun get!19371 (ValueCell!14777 V!46425) V!46425)

(assert (=> b!1218986 (= res!809618 (= lt!554180 (+!4068 lt!554181 (tuple2!19999 (select (arr!37992 _keys!1208) from!1455) (get!19371 (select (arr!37993 _values!996) from!1455) lt!554186)))))))

(declare-fun b!1218987 () Bool)

(declare-fun res!809616 () Bool)

(declare-fun e!692106 () Bool)

(assert (=> b!1218987 (=> (not res!809616) (not e!692106))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78721 (_ BitVec 32)) Bool)

(assert (=> b!1218987 (= res!809616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1218988 () Bool)

(declare-fun e!692111 () Bool)

(declare-fun e!692112 () Bool)

(declare-fun mapRes!48343 () Bool)

(assert (=> b!1218988 (= e!692111 (and e!692112 mapRes!48343))))

(declare-fun condMapEmpty!48343 () Bool)

(declare-fun mapDefault!48343 () ValueCell!14777)

