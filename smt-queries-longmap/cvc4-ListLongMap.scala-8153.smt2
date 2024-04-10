; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99788 () Bool)

(assert start!99788)

(declare-fun b_free!25367 () Bool)

(declare-fun b_next!25367 () Bool)

(assert (=> start!99788 (= b_free!25367 (not b_next!25367))))

(declare-fun tp!88814 () Bool)

(declare-fun b_and!41601 () Bool)

(assert (=> start!99788 (= tp!88814 b_and!41601)))

(declare-fun b!1185663 () Bool)

(declare-fun res!788172 () Bool)

(declare-fun e!674143 () Bool)

(assert (=> b!1185663 (=> (not res!788172) (not e!674143))))

(declare-datatypes ((array!76591 0))(
  ( (array!76592 (arr!36945 (Array (_ BitVec 32) (_ BitVec 64))) (size!37481 (_ BitVec 32))) )
))
(declare-fun lt!538226 () array!76591)

(declare-datatypes ((List!25990 0))(
  ( (Nil!25987) (Cons!25986 (h!27195 (_ BitVec 64)) (t!38349 List!25990)) )
))
(declare-fun arrayNoDuplicates!0 (array!76591 (_ BitVec 32) List!25990) Bool)

(assert (=> b!1185663 (= res!788172 (arrayNoDuplicates!0 lt!538226 #b00000000000000000000000000000000 Nil!25987))))

(declare-fun b!1185664 () Bool)

(declare-fun res!788159 () Bool)

(declare-fun e!674144 () Bool)

(assert (=> b!1185664 (=> (not res!788159) (not e!674144))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1185664 (= res!788159 (validKeyInArray!0 k!934))))

(declare-fun b!1185665 () Bool)

(declare-fun e!674138 () Bool)

(declare-fun tp_is_empty!29897 () Bool)

(assert (=> b!1185665 (= e!674138 tp_is_empty!29897)))

(declare-fun mapNonEmpty!46673 () Bool)

(declare-fun mapRes!46673 () Bool)

(declare-fun tp!88815 () Bool)

(declare-fun e!674140 () Bool)

(assert (=> mapNonEmpty!46673 (= mapRes!46673 (and tp!88815 e!674140))))

(declare-datatypes ((V!44989 0))(
  ( (V!44990 (val!15005 Int)) )
))
(declare-datatypes ((ValueCell!14239 0))(
  ( (ValueCellFull!14239 (v!17643 V!44989)) (EmptyCell!14239) )
))
(declare-fun mapRest!46673 () (Array (_ BitVec 32) ValueCell!14239))

(declare-fun mapKey!46673 () (_ BitVec 32))

(declare-datatypes ((array!76593 0))(
  ( (array!76594 (arr!36946 (Array (_ BitVec 32) ValueCell!14239)) (size!37482 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76593)

(declare-fun mapValue!46673 () ValueCell!14239)

(assert (=> mapNonEmpty!46673 (= (arr!36946 _values!996) (store mapRest!46673 mapKey!46673 mapValue!46673))))

(declare-fun b!1185666 () Bool)

(declare-fun res!788162 () Bool)

(assert (=> b!1185666 (=> (not res!788162) (not e!674144))))

(declare-fun _keys!1208 () array!76591)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1185666 (= res!788162 (and (= (size!37482 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37481 _keys!1208) (size!37482 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!46673 () Bool)

(assert (=> mapIsEmpty!46673 mapRes!46673))

(declare-fun b!1185667 () Bool)

(declare-fun res!788166 () Bool)

(assert (=> b!1185667 (=> (not res!788166) (not e!674144))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76591 (_ BitVec 32)) Bool)

(assert (=> b!1185667 (= res!788166 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1185668 () Bool)

(declare-fun e!674145 () Bool)

(declare-fun e!674135 () Bool)

(assert (=> b!1185668 (= e!674145 e!674135)))

(declare-fun res!788168 () Bool)

(assert (=> b!1185668 (=> res!788168 e!674135)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1185668 (= res!788168 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!538221 () array!76593)

(declare-fun minValue!944 () V!44989)

(declare-datatypes ((tuple2!19250 0))(
  ( (tuple2!19251 (_1!9636 (_ BitVec 64)) (_2!9636 V!44989)) )
))
(declare-datatypes ((List!25991 0))(
  ( (Nil!25988) (Cons!25987 (h!27196 tuple2!19250) (t!38350 List!25991)) )
))
(declare-datatypes ((ListLongMap!17219 0))(
  ( (ListLongMap!17220 (toList!8625 List!25991)) )
))
(declare-fun lt!538223 () ListLongMap!17219)

(declare-fun zeroValue!944 () V!44989)

(declare-fun getCurrentListMapNoExtraKeys!5071 (array!76591 array!76593 (_ BitVec 32) (_ BitVec 32) V!44989 V!44989 (_ BitVec 32) Int) ListLongMap!17219)

(assert (=> b!1185668 (= lt!538223 (getCurrentListMapNoExtraKeys!5071 lt!538226 lt!538221 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!538219 () V!44989)

(assert (=> b!1185668 (= lt!538221 (array!76594 (store (arr!36946 _values!996) i!673 (ValueCellFull!14239 lt!538219)) (size!37482 _values!996)))))

(declare-fun dynLambda!3022 (Int (_ BitVec 64)) V!44989)

(assert (=> b!1185668 (= lt!538219 (dynLambda!3022 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!538228 () ListLongMap!17219)

(assert (=> b!1185668 (= lt!538228 (getCurrentListMapNoExtraKeys!5071 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1185670 () Bool)

(declare-datatypes ((Unit!39284 0))(
  ( (Unit!39285) )
))
(declare-fun e!674146 () Unit!39284)

(declare-fun Unit!39286 () Unit!39284)

(assert (=> b!1185670 (= e!674146 Unit!39286)))

(declare-fun lt!538230 () Unit!39284)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76591 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39284)

(assert (=> b!1185670 (= lt!538230 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76591 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1185670 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!538222 () Unit!39284)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76591 (_ BitVec 32) (_ BitVec 32)) Unit!39284)

(assert (=> b!1185670 (= lt!538222 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1185670 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25987)))

(declare-fun lt!538220 () Unit!39284)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76591 (_ BitVec 64) (_ BitVec 32) List!25990) Unit!39284)

(assert (=> b!1185670 (= lt!538220 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25987))))

(assert (=> b!1185670 false))

(declare-fun b!1185671 () Bool)

(declare-fun Unit!39287 () Unit!39284)

(assert (=> b!1185671 (= e!674146 Unit!39287)))

(declare-fun b!1185672 () Bool)

(assert (=> b!1185672 (= e!674143 (not e!674145))))

(declare-fun res!788164 () Bool)

(assert (=> b!1185672 (=> res!788164 e!674145)))

(assert (=> b!1185672 (= res!788164 (bvsgt from!1455 i!673))))

(assert (=> b!1185672 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!538214 () Unit!39284)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76591 (_ BitVec 64) (_ BitVec 32)) Unit!39284)

(assert (=> b!1185672 (= lt!538214 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1185673 () Bool)

(declare-fun res!788169 () Bool)

(assert (=> b!1185673 (=> (not res!788169) (not e!674144))))

(assert (=> b!1185673 (= res!788169 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25987))))

(declare-fun b!1185674 () Bool)

(declare-fun res!788171 () Bool)

(assert (=> b!1185674 (=> (not res!788171) (not e!674144))))

(assert (=> b!1185674 (= res!788171 (= (select (arr!36945 _keys!1208) i!673) k!934))))

(declare-fun b!1185675 () Bool)

(declare-fun res!788160 () Bool)

(assert (=> b!1185675 (=> (not res!788160) (not e!674144))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1185675 (= res!788160 (validMask!0 mask!1564))))

(declare-fun b!1185676 () Bool)

(declare-fun res!788163 () Bool)

(assert (=> b!1185676 (=> (not res!788163) (not e!674144))))

(assert (=> b!1185676 (= res!788163 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37481 _keys!1208))))))

(declare-fun b!1185677 () Bool)

(declare-fun e!674141 () Bool)

(assert (=> b!1185677 (= e!674141 (and e!674138 mapRes!46673))))

(declare-fun condMapEmpty!46673 () Bool)

(declare-fun mapDefault!46673 () ValueCell!14239)

