; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100096 () Bool)

(assert start!100096)

(declare-fun b_free!25669 () Bool)

(declare-fun b_next!25669 () Bool)

(assert (=> start!100096 (= b_free!25669 (not b_next!25669))))

(declare-fun tp!89730 () Bool)

(declare-fun b_and!42205 () Bool)

(assert (=> start!100096 (= tp!89730 b_and!42205)))

(declare-fun b!1193516 () Bool)

(declare-fun res!794067 () Bool)

(declare-fun e!678330 () Bool)

(assert (=> b!1193516 (=> (not res!794067) (not e!678330))))

(declare-datatypes ((array!77189 0))(
  ( (array!77190 (arr!37244 (Array (_ BitVec 32) (_ BitVec 64))) (size!37780 (_ BitVec 32))) )
))
(declare-fun lt!542599 () array!77189)

(declare-datatypes ((List!26233 0))(
  ( (Nil!26230) (Cons!26229 (h!27438 (_ BitVec 64)) (t!38894 List!26233)) )
))
(declare-fun arrayNoDuplicates!0 (array!77189 (_ BitVec 32) List!26233) Bool)

(assert (=> b!1193516 (= res!794067 (arrayNoDuplicates!0 lt!542599 #b00000000000000000000000000000000 Nil!26230))))

(declare-fun b!1193517 () Bool)

(declare-fun res!794071 () Bool)

(declare-fun e!678326 () Bool)

(assert (=> b!1193517 (=> (not res!794071) (not e!678326))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun _keys!1208 () array!77189)

(assert (=> b!1193517 (= res!794071 (= (select (arr!37244 _keys!1208) i!673) k!934))))

(declare-fun mapIsEmpty!47135 () Bool)

(declare-fun mapRes!47135 () Bool)

(assert (=> mapIsEmpty!47135 mapRes!47135))

(declare-fun b!1193518 () Bool)

(declare-fun res!794068 () Bool)

(assert (=> b!1193518 (=> (not res!794068) (not e!678326))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77189 (_ BitVec 32)) Bool)

(assert (=> b!1193518 (= res!794068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-datatypes ((V!45401 0))(
  ( (V!45402 (val!15159 Int)) )
))
(declare-fun zeroValue!944 () V!45401)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!57119 () Bool)

(declare-fun minValue!944 () V!45401)

(declare-datatypes ((ValueCell!14393 0))(
  ( (ValueCellFull!14393 (v!17797 V!45401)) (EmptyCell!14393) )
))
(declare-datatypes ((array!77191 0))(
  ( (array!77192 (arr!37245 (Array (_ BitVec 32) ValueCell!14393)) (size!37781 (_ BitVec 32))) )
))
(declare-fun lt!542601 () array!77191)

(declare-datatypes ((tuple2!19486 0))(
  ( (tuple2!19487 (_1!9754 (_ BitVec 64)) (_2!9754 V!45401)) )
))
(declare-datatypes ((List!26234 0))(
  ( (Nil!26231) (Cons!26230 (h!27439 tuple2!19486) (t!38895 List!26234)) )
))
(declare-datatypes ((ListLongMap!17455 0))(
  ( (ListLongMap!17456 (toList!8743 List!26234)) )
))
(declare-fun call!57122 () ListLongMap!17455)

(declare-fun getCurrentListMapNoExtraKeys!5184 (array!77189 array!77191 (_ BitVec 32) (_ BitVec 32) V!45401 V!45401 (_ BitVec 32) Int) ListLongMap!17455)

(assert (=> bm!57119 (= call!57122 (getCurrentListMapNoExtraKeys!5184 lt!542599 lt!542601 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1193519 () Bool)

(declare-fun e!678331 () Bool)

(declare-fun e!678324 () Bool)

(assert (=> b!1193519 (= e!678331 (and e!678324 mapRes!47135))))

(declare-fun condMapEmpty!47135 () Bool)

(declare-fun _values!996 () array!77191)

(declare-fun mapDefault!47135 () ValueCell!14393)

