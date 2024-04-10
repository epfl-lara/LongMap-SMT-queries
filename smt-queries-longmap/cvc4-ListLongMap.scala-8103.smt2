; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99488 () Bool)

(assert start!99488)

(declare-fun b_free!25067 () Bool)

(declare-fun b_next!25067 () Bool)

(assert (=> start!99488 (= b_free!25067 (not b_next!25067))))

(declare-fun tp!87914 () Bool)

(declare-fun b_and!41001 () Bool)

(assert (=> start!99488 (= tp!87914 b_and!41001)))

(declare-fun b!1176021 () Bool)

(declare-fun e!668488 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!76001 0))(
  ( (array!76002 (arr!36650 (Array (_ BitVec 32) (_ BitVec 64))) (size!37186 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76001)

(assert (=> b!1176021 (= e!668488 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!37186 _keys!1208))))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1176021 (not (= (select (arr!36650 _keys!1208) from!1455) k!934))))

(declare-datatypes ((Unit!38816 0))(
  ( (Unit!38817) )
))
(declare-fun lt!530688 () Unit!38816)

(declare-fun e!668491 () Unit!38816)

(assert (=> b!1176021 (= lt!530688 e!668491)))

(declare-fun c!116724 () Bool)

(assert (=> b!1176021 (= c!116724 (= (select (arr!36650 _keys!1208) from!1455) k!934))))

(declare-fun e!668484 () Bool)

(assert (=> b!1176021 e!668484))

(declare-fun res!781080 () Bool)

(assert (=> b!1176021 (=> (not res!781080) (not e!668484))))

(declare-datatypes ((V!44589 0))(
  ( (V!44590 (val!14855 Int)) )
))
(declare-fun lt!530677 () V!44589)

(declare-datatypes ((tuple2!18992 0))(
  ( (tuple2!18993 (_1!9507 (_ BitVec 64)) (_2!9507 V!44589)) )
))
(declare-datatypes ((List!25733 0))(
  ( (Nil!25730) (Cons!25729 (h!26938 tuple2!18992) (t!37792 List!25733)) )
))
(declare-datatypes ((ListLongMap!16961 0))(
  ( (ListLongMap!16962 (toList!8496 List!25733)) )
))
(declare-fun lt!530676 () ListLongMap!16961)

(declare-fun lt!530683 () ListLongMap!16961)

(declare-datatypes ((ValueCell!14089 0))(
  ( (ValueCellFull!14089 (v!17493 V!44589)) (EmptyCell!14089) )
))
(declare-datatypes ((array!76003 0))(
  ( (array!76004 (arr!36651 (Array (_ BitVec 32) ValueCell!14089)) (size!37187 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76003)

(declare-fun +!3812 (ListLongMap!16961 tuple2!18992) ListLongMap!16961)

(declare-fun get!18714 (ValueCell!14089 V!44589) V!44589)

(assert (=> b!1176021 (= res!781080 (= lt!530676 (+!3812 lt!530683 (tuple2!18993 (select (arr!36650 _keys!1208) from!1455) (get!18714 (select (arr!36651 _values!996) from!1455) lt!530677)))))))

(declare-fun b!1176022 () Bool)

(declare-fun e!668490 () Bool)

(assert (=> b!1176022 (= e!668484 e!668490)))

(declare-fun res!781076 () Bool)

(assert (=> b!1176022 (=> res!781076 e!668490)))

(assert (=> b!1176022 (= res!781076 (not (= (select (arr!36650 _keys!1208) from!1455) k!934)))))

(declare-fun b!1176023 () Bool)

(declare-fun res!781068 () Bool)

(declare-fun e!668483 () Bool)

(assert (=> b!1176023 (=> (not res!781068) (not e!668483))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1176023 (= res!781068 (validKeyInArray!0 k!934))))

(declare-fun b!1176024 () Bool)

(declare-fun e!668494 () Bool)

(assert (=> b!1176024 (= e!668483 e!668494)))

(declare-fun res!781073 () Bool)

(assert (=> b!1176024 (=> (not res!781073) (not e!668494))))

(declare-fun lt!530679 () array!76001)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76001 (_ BitVec 32)) Bool)

(assert (=> b!1176024 (= res!781073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!530679 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1176024 (= lt!530679 (array!76002 (store (arr!36650 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37186 _keys!1208)))))

(declare-fun b!1176026 () Bool)

(declare-fun e!668486 () Bool)

(declare-fun e!668487 () Bool)

(declare-fun mapRes!46223 () Bool)

(assert (=> b!1176026 (= e!668486 (and e!668487 mapRes!46223))))

(declare-fun condMapEmpty!46223 () Bool)

(declare-fun mapDefault!46223 () ValueCell!14089)

