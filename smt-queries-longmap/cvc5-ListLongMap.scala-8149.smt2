; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99760 () Bool)

(assert start!99760)

(declare-fun b_free!25339 () Bool)

(declare-fun b_next!25339 () Bool)

(assert (=> start!99760 (= b_free!25339 (not b_next!25339))))

(declare-fun tp!88731 () Bool)

(declare-fun b_and!41545 () Bool)

(assert (=> start!99760 (= tp!88731 b_and!41545)))

(declare-fun b!1184795 () Bool)

(declare-fun res!787534 () Bool)

(declare-fun e!673639 () Bool)

(assert (=> b!1184795 (=> (not res!787534) (not e!673639))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1184795 (= res!787534 (validMask!0 mask!1564))))

(declare-fun b!1184796 () Bool)

(declare-fun res!787529 () Bool)

(declare-fun e!673638 () Bool)

(assert (=> b!1184796 (=> (not res!787529) (not e!673638))))

(declare-datatypes ((array!76537 0))(
  ( (array!76538 (arr!36918 (Array (_ BitVec 32) (_ BitVec 64))) (size!37454 (_ BitVec 32))) )
))
(declare-fun lt!537415 () array!76537)

(declare-datatypes ((List!25964 0))(
  ( (Nil!25961) (Cons!25960 (h!27169 (_ BitVec 64)) (t!38295 List!25964)) )
))
(declare-fun arrayNoDuplicates!0 (array!76537 (_ BitVec 32) List!25964) Bool)

(assert (=> b!1184796 (= res!787529 (arrayNoDuplicates!0 lt!537415 #b00000000000000000000000000000000 Nil!25961))))

(declare-fun b!1184797 () Bool)

(declare-fun res!787532 () Bool)

(assert (=> b!1184797 (=> (not res!787532) (not e!673639))))

(declare-fun _keys!1208 () array!76537)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1184797 (= res!787532 (= (select (arr!36918 _keys!1208) i!673) k!934))))

(declare-fun b!1184798 () Bool)

(declare-fun res!787533 () Bool)

(assert (=> b!1184798 (=> (not res!787533) (not e!673639))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!44953 0))(
  ( (V!44954 (val!14991 Int)) )
))
(declare-datatypes ((ValueCell!14225 0))(
  ( (ValueCellFull!14225 (v!17629 V!44953)) (EmptyCell!14225) )
))
(declare-datatypes ((array!76539 0))(
  ( (array!76540 (arr!36919 (Array (_ BitVec 32) ValueCell!14225)) (size!37455 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76539)

(assert (=> b!1184798 (= res!787533 (and (= (size!37455 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37454 _keys!1208) (size!37455 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1184800 () Bool)

(declare-fun e!673636 () Bool)

(declare-fun e!673640 () Bool)

(assert (=> b!1184800 (= e!673636 e!673640)))

(declare-fun res!787541 () Bool)

(assert (=> b!1184800 (=> res!787541 e!673640)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1184800 (= res!787541 (not (= (select (arr!36918 _keys!1208) from!1455) k!934)))))

(declare-fun b!1184801 () Bool)

(declare-fun res!787536 () Bool)

(assert (=> b!1184801 (=> (not res!787536) (not e!673639))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1184801 (= res!787536 (validKeyInArray!0 k!934))))

(declare-fun b!1184802 () Bool)

(declare-fun e!673637 () Bool)

(assert (=> b!1184802 (= e!673637 true)))

(declare-datatypes ((tuple2!19224 0))(
  ( (tuple2!19225 (_1!9623 (_ BitVec 64)) (_2!9623 V!44953)) )
))
(declare-datatypes ((List!25965 0))(
  ( (Nil!25962) (Cons!25961 (h!27170 tuple2!19224) (t!38296 List!25965)) )
))
(declare-datatypes ((ListLongMap!17193 0))(
  ( (ListLongMap!17194 (toList!8612 List!25965)) )
))
(declare-fun lt!537416 () ListLongMap!17193)

(declare-fun lt!537423 () ListLongMap!17193)

(declare-fun -!1647 (ListLongMap!17193 (_ BitVec 64)) ListLongMap!17193)

(assert (=> b!1184802 (= (-!1647 lt!537416 k!934) lt!537423)))

(declare-datatypes ((Unit!39236 0))(
  ( (Unit!39237) )
))
(declare-fun lt!537418 () Unit!39236)

(declare-fun lt!537425 () ListLongMap!17193)

(declare-fun lt!537422 () V!44953)

(declare-fun addRemoveCommutativeForDiffKeys!172 (ListLongMap!17193 (_ BitVec 64) V!44953 (_ BitVec 64)) Unit!39236)

(assert (=> b!1184802 (= lt!537418 (addRemoveCommutativeForDiffKeys!172 lt!537425 (select (arr!36918 _keys!1208) from!1455) lt!537422 k!934))))

(declare-fun lt!537424 () ListLongMap!17193)

(declare-fun lt!537430 () ListLongMap!17193)

(declare-fun lt!537426 () ListLongMap!17193)

(assert (=> b!1184802 (and (= lt!537424 lt!537416) (= lt!537426 lt!537430))))

(declare-fun lt!537432 () tuple2!19224)

(declare-fun +!3909 (ListLongMap!17193 tuple2!19224) ListLongMap!17193)

(assert (=> b!1184802 (= lt!537416 (+!3909 lt!537425 lt!537432))))

(assert (=> b!1184802 (not (= (select (arr!36918 _keys!1208) from!1455) k!934))))

(declare-fun lt!537431 () Unit!39236)

(declare-fun e!673642 () Unit!39236)

(assert (=> b!1184802 (= lt!537431 e!673642)))

(declare-fun c!117132 () Bool)

(assert (=> b!1184802 (= c!117132 (= (select (arr!36918 _keys!1208) from!1455) k!934))))

(assert (=> b!1184802 e!673636))

(declare-fun res!787538 () Bool)

(assert (=> b!1184802 (=> (not res!787538) (not e!673636))))

(declare-fun lt!537429 () ListLongMap!17193)

(assert (=> b!1184802 (= res!787538 (= lt!537429 lt!537423))))

(assert (=> b!1184802 (= lt!537423 (+!3909 lt!537426 lt!537432))))

(assert (=> b!1184802 (= lt!537432 (tuple2!19225 (select (arr!36918 _keys!1208) from!1455) lt!537422))))

(declare-fun lt!537420 () V!44953)

(declare-fun get!18896 (ValueCell!14225 V!44953) V!44953)

(assert (=> b!1184802 (= lt!537422 (get!18896 (select (arr!36919 _values!996) from!1455) lt!537420))))

(declare-fun b!1184803 () Bool)

(assert (=> b!1184803 (= e!673639 e!673638)))

(declare-fun res!787530 () Bool)

(assert (=> b!1184803 (=> (not res!787530) (not e!673638))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76537 (_ BitVec 32)) Bool)

(assert (=> b!1184803 (= res!787530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!537415 mask!1564))))

(assert (=> b!1184803 (= lt!537415 (array!76538 (store (arr!36918 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37454 _keys!1208)))))

(declare-fun b!1184804 () Bool)

(declare-fun e!673641 () Bool)

(declare-fun e!673634 () Bool)

(declare-fun mapRes!46631 () Bool)

(assert (=> b!1184804 (= e!673641 (and e!673634 mapRes!46631))))

(declare-fun condMapEmpty!46631 () Bool)

(declare-fun mapDefault!46631 () ValueCell!14225)

