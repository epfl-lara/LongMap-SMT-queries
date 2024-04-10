; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99764 () Bool)

(assert start!99764)

(declare-fun b_free!25343 () Bool)

(declare-fun b_next!25343 () Bool)

(assert (=> start!99764 (= b_free!25343 (not b_next!25343))))

(declare-fun tp!88742 () Bool)

(declare-fun b_and!41553 () Bool)

(assert (=> start!99764 (= tp!88742 b_and!41553)))

(declare-fun b!1184919 () Bool)

(declare-fun res!787630 () Bool)

(declare-fun e!673713 () Bool)

(assert (=> b!1184919 (=> (not res!787630) (not e!673713))))

(declare-datatypes ((array!76545 0))(
  ( (array!76546 (arr!36922 (Array (_ BitVec 32) (_ BitVec 64))) (size!37458 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76545)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76545 (_ BitVec 32)) Bool)

(assert (=> b!1184919 (= res!787630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun b!1184920 () Bool)

(declare-fun e!673714 () Bool)

(declare-fun arrayContainsKey!0 (array!76545 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1184920 (= e!673714 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun mapIsEmpty!46637 () Bool)

(declare-fun mapRes!46637 () Bool)

(assert (=> mapIsEmpty!46637 mapRes!46637))

(declare-fun b!1184921 () Bool)

(declare-fun e!673712 () Bool)

(assert (=> b!1184921 (= e!673712 e!673714)))

(declare-fun res!787624 () Bool)

(assert (=> b!1184921 (=> res!787624 e!673714)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1184921 (= res!787624 (not (= (select (arr!36922 _keys!1208) from!1455) k!934)))))

(declare-fun b!1184922 () Bool)

(declare-fun e!673707 () Bool)

(assert (=> b!1184922 (= e!673707 true)))

(declare-datatypes ((V!44957 0))(
  ( (V!44958 (val!14993 Int)) )
))
(declare-datatypes ((tuple2!19228 0))(
  ( (tuple2!19229 (_1!9625 (_ BitVec 64)) (_2!9625 V!44957)) )
))
(declare-datatypes ((List!25968 0))(
  ( (Nil!25965) (Cons!25964 (h!27173 tuple2!19228) (t!38303 List!25968)) )
))
(declare-datatypes ((ListLongMap!17197 0))(
  ( (ListLongMap!17198 (toList!8614 List!25968)) )
))
(declare-fun lt!537545 () ListLongMap!17197)

(declare-fun lt!537546 () ListLongMap!17197)

(declare-fun -!1649 (ListLongMap!17197 (_ BitVec 64)) ListLongMap!17197)

(assert (=> b!1184922 (= (-!1649 lt!537545 k!934) lt!537546)))

(declare-datatypes ((Unit!39242 0))(
  ( (Unit!39243) )
))
(declare-fun lt!537530 () Unit!39242)

(declare-fun lt!537535 () V!44957)

(declare-fun lt!537538 () ListLongMap!17197)

(declare-fun addRemoveCommutativeForDiffKeys!174 (ListLongMap!17197 (_ BitVec 64) V!44957 (_ BitVec 64)) Unit!39242)

(assert (=> b!1184922 (= lt!537530 (addRemoveCommutativeForDiffKeys!174 lt!537538 (select (arr!36922 _keys!1208) from!1455) lt!537535 k!934))))

(declare-fun lt!537536 () ListLongMap!17197)

(declare-fun lt!537528 () ListLongMap!17197)

(declare-fun lt!537529 () ListLongMap!17197)

(assert (=> b!1184922 (and (= lt!537528 lt!537545) (= lt!537536 lt!537529))))

(declare-fun lt!537537 () tuple2!19228)

(declare-fun +!3911 (ListLongMap!17197 tuple2!19228) ListLongMap!17197)

(assert (=> b!1184922 (= lt!537545 (+!3911 lt!537538 lt!537537))))

(assert (=> b!1184922 (not (= (select (arr!36922 _keys!1208) from!1455) k!934))))

(declare-fun lt!537532 () Unit!39242)

(declare-fun e!673704 () Unit!39242)

(assert (=> b!1184922 (= lt!537532 e!673704)))

(declare-fun c!117138 () Bool)

(assert (=> b!1184922 (= c!117138 (= (select (arr!36922 _keys!1208) from!1455) k!934))))

(assert (=> b!1184922 e!673712))

(declare-fun res!787633 () Bool)

(assert (=> b!1184922 (=> (not res!787633) (not e!673712))))

(declare-fun lt!537531 () ListLongMap!17197)

(assert (=> b!1184922 (= res!787633 (= lt!537531 lt!537546))))

(assert (=> b!1184922 (= lt!537546 (+!3911 lt!537536 lt!537537))))

(assert (=> b!1184922 (= lt!537537 (tuple2!19229 (select (arr!36922 _keys!1208) from!1455) lt!537535))))

(declare-fun lt!537540 () V!44957)

(declare-datatypes ((ValueCell!14227 0))(
  ( (ValueCellFull!14227 (v!17631 V!44957)) (EmptyCell!14227) )
))
(declare-datatypes ((array!76547 0))(
  ( (array!76548 (arr!36923 (Array (_ BitVec 32) ValueCell!14227)) (size!37459 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76547)

(declare-fun get!18898 (ValueCell!14227 V!44957) V!44957)

(assert (=> b!1184922 (= lt!537535 (get!18898 (select (arr!36923 _values!996) from!1455) lt!537540))))

(declare-fun b!1184923 () Bool)

(declare-fun res!787623 () Bool)

(assert (=> b!1184923 (=> (not res!787623) (not e!673713))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1184923 (= res!787623 (validMask!0 mask!1564))))

(declare-fun b!1184924 () Bool)

(declare-fun Unit!39244 () Unit!39242)

(assert (=> b!1184924 (= e!673704 Unit!39244)))

(declare-fun b!1184925 () Bool)

(declare-fun res!787627 () Bool)

(declare-fun e!673703 () Bool)

(assert (=> b!1184925 (=> (not res!787627) (not e!673703))))

(declare-fun lt!537534 () array!76545)

(declare-datatypes ((List!25969 0))(
  ( (Nil!25966) (Cons!25965 (h!27174 (_ BitVec 64)) (t!38304 List!25969)) )
))
(declare-fun arrayNoDuplicates!0 (array!76545 (_ BitVec 32) List!25969) Bool)

(assert (=> b!1184925 (= res!787627 (arrayNoDuplicates!0 lt!537534 #b00000000000000000000000000000000 Nil!25966))))

(declare-fun b!1184926 () Bool)

(declare-fun res!787632 () Bool)

(assert (=> b!1184926 (=> (not res!787632) (not e!673713))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1184926 (= res!787632 (and (= (size!37459 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37458 _keys!1208) (size!37459 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1184927 () Bool)

(declare-fun res!787620 () Bool)

(assert (=> b!1184927 (=> (not res!787620) (not e!673713))))

(assert (=> b!1184927 (= res!787620 (= (select (arr!36922 _keys!1208) i!673) k!934))))

(declare-fun b!1184928 () Bool)

(declare-fun e!673706 () Bool)

(declare-fun e!673709 () Bool)

(assert (=> b!1184928 (= e!673706 (and e!673709 mapRes!46637))))

(declare-fun condMapEmpty!46637 () Bool)

(declare-fun mapDefault!46637 () ValueCell!14227)

