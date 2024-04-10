; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99682 () Bool)

(assert start!99682)

(declare-fun b_free!25261 () Bool)

(declare-fun b_next!25261 () Bool)

(assert (=> start!99682 (= b_free!25261 (not b_next!25261))))

(declare-fun tp!88496 () Bool)

(declare-fun b_and!41389 () Bool)

(assert (=> start!99682 (= tp!88496 b_and!41389)))

(declare-fun b!1182377 () Bool)

(declare-fun e!672231 () Bool)

(declare-fun e!672233 () Bool)

(assert (=> b!1182377 (= e!672231 e!672233)))

(declare-fun res!785786 () Bool)

(assert (=> b!1182377 (=> (not res!785786) (not e!672233))))

(declare-datatypes ((array!76385 0))(
  ( (array!76386 (arr!36842 (Array (_ BitVec 32) (_ BitVec 64))) (size!37378 (_ BitVec 32))) )
))
(declare-fun lt!535196 () array!76385)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76385 (_ BitVec 32)) Bool)

(assert (=> b!1182377 (= res!785786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!535196 mask!1564))))

(declare-fun _keys!1208 () array!76385)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1182377 (= lt!535196 (array!76386 (store (arr!36842 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37378 _keys!1208)))))

(declare-fun b!1182378 () Bool)

(declare-fun res!785781 () Bool)

(assert (=> b!1182378 (=> (not res!785781) (not e!672233))))

(declare-datatypes ((List!25903 0))(
  ( (Nil!25900) (Cons!25899 (h!27108 (_ BitVec 64)) (t!38156 List!25903)) )
))
(declare-fun arrayNoDuplicates!0 (array!76385 (_ BitVec 32) List!25903) Bool)

(assert (=> b!1182378 (= res!785781 (arrayNoDuplicates!0 lt!535196 #b00000000000000000000000000000000 Nil!25900))))

(declare-fun b!1182379 () Bool)

(declare-datatypes ((Unit!39117 0))(
  ( (Unit!39118) )
))
(declare-fun e!672235 () Unit!39117)

(declare-fun Unit!39119 () Unit!39117)

(assert (=> b!1182379 (= e!672235 Unit!39119)))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!535194 () Unit!39117)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76385 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39117)

(assert (=> b!1182379 (= lt!535194 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76385 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1182379 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!535203 () Unit!39117)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76385 (_ BitVec 32) (_ BitVec 32)) Unit!39117)

(assert (=> b!1182379 (= lt!535203 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1182379 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25900)))

(declare-fun lt!535205 () Unit!39117)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76385 (_ BitVec 64) (_ BitVec 32) List!25903) Unit!39117)

(assert (=> b!1182379 (= lt!535205 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25900))))

(assert (=> b!1182379 false))

(declare-fun b!1182380 () Bool)

(declare-fun res!785783 () Bool)

(assert (=> b!1182380 (=> (not res!785783) (not e!672231))))

(assert (=> b!1182380 (= res!785783 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!785785 () Bool)

(assert (=> start!99682 (=> (not res!785785) (not e!672231))))

(assert (=> start!99682 (= res!785785 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37378 _keys!1208))))))

(assert (=> start!99682 e!672231))

(declare-fun tp_is_empty!29791 () Bool)

(assert (=> start!99682 tp_is_empty!29791))

(declare-fun array_inv!28130 (array!76385) Bool)

(assert (=> start!99682 (array_inv!28130 _keys!1208)))

(assert (=> start!99682 true))

(assert (=> start!99682 tp!88496))

(declare-datatypes ((V!44849 0))(
  ( (V!44850 (val!14952 Int)) )
))
(declare-datatypes ((ValueCell!14186 0))(
  ( (ValueCellFull!14186 (v!17590 V!44849)) (EmptyCell!14186) )
))
(declare-datatypes ((array!76387 0))(
  ( (array!76388 (arr!36843 (Array (_ BitVec 32) ValueCell!14186)) (size!37379 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76387)

(declare-fun e!672237 () Bool)

(declare-fun array_inv!28131 (array!76387) Bool)

(assert (=> start!99682 (and (array_inv!28131 _values!996) e!672237)))

(declare-fun b!1182381 () Bool)

(declare-fun res!785780 () Bool)

(assert (=> b!1182381 (=> (not res!785780) (not e!672231))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1182381 (= res!785780 (and (= (size!37379 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37378 _keys!1208) (size!37379 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1182382 () Bool)

(declare-fun res!785787 () Bool)

(assert (=> b!1182382 (=> (not res!785787) (not e!672231))))

(assert (=> b!1182382 (= res!785787 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25900))))

(declare-fun b!1182383 () Bool)

(declare-fun e!672228 () Bool)

(assert (=> b!1182383 (= e!672228 tp_is_empty!29791)))

(declare-fun b!1182384 () Bool)

(declare-fun e!672232 () Bool)

(assert (=> b!1182384 (= e!672232 true)))

(declare-datatypes ((tuple2!19162 0))(
  ( (tuple2!19163 (_1!9592 (_ BitVec 64)) (_2!9592 V!44849)) )
))
(declare-datatypes ((List!25904 0))(
  ( (Nil!25901) (Cons!25900 (h!27109 tuple2!19162) (t!38157 List!25904)) )
))
(declare-datatypes ((ListLongMap!17131 0))(
  ( (ListLongMap!17132 (toList!8581 List!25904)) )
))
(declare-fun lt!535195 () ListLongMap!17131)

(declare-fun lt!535200 () ListLongMap!17131)

(declare-fun -!1619 (ListLongMap!17131 (_ BitVec 64)) ListLongMap!17131)

(assert (=> b!1182384 (= (-!1619 lt!535195 k!934) lt!535200)))

(declare-fun lt!535208 () Unit!39117)

(declare-fun lt!535209 () V!44849)

(declare-fun lt!535193 () ListLongMap!17131)

(declare-fun addRemoveCommutativeForDiffKeys!148 (ListLongMap!17131 (_ BitVec 64) V!44849 (_ BitVec 64)) Unit!39117)

(assert (=> b!1182384 (= lt!535208 (addRemoveCommutativeForDiffKeys!148 lt!535193 (select (arr!36842 _keys!1208) from!1455) lt!535209 k!934))))

(declare-fun lt!535206 () ListLongMap!17131)

(declare-fun lt!535192 () ListLongMap!17131)

(declare-fun lt!535197 () ListLongMap!17131)

(assert (=> b!1182384 (and (= lt!535197 lt!535195) (= lt!535206 lt!535192))))

(declare-fun lt!535202 () tuple2!19162)

(declare-fun +!3885 (ListLongMap!17131 tuple2!19162) ListLongMap!17131)

(assert (=> b!1182384 (= lt!535195 (+!3885 lt!535193 lt!535202))))

(assert (=> b!1182384 (not (= (select (arr!36842 _keys!1208) from!1455) k!934))))

(declare-fun lt!535201 () Unit!39117)

(assert (=> b!1182384 (= lt!535201 e!672235)))

(declare-fun c!117015 () Bool)

(assert (=> b!1182384 (= c!117015 (= (select (arr!36842 _keys!1208) from!1455) k!934))))

(declare-fun e!672227 () Bool)

(assert (=> b!1182384 e!672227))

(declare-fun res!785777 () Bool)

(assert (=> b!1182384 (=> (not res!785777) (not e!672227))))

(declare-fun lt!535199 () ListLongMap!17131)

(assert (=> b!1182384 (= res!785777 (= lt!535199 lt!535200))))

(assert (=> b!1182384 (= lt!535200 (+!3885 lt!535206 lt!535202))))

(assert (=> b!1182384 (= lt!535202 (tuple2!19163 (select (arr!36842 _keys!1208) from!1455) lt!535209))))

(declare-fun lt!535204 () V!44849)

(declare-fun get!18846 (ValueCell!14186 V!44849) V!44849)

(assert (=> b!1182384 (= lt!535209 (get!18846 (select (arr!36843 _values!996) from!1455) lt!535204))))

(declare-fun b!1182385 () Bool)

(declare-fun res!785779 () Bool)

(assert (=> b!1182385 (=> (not res!785779) (not e!672231))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1182385 (= res!785779 (validMask!0 mask!1564))))

(declare-fun b!1182386 () Bool)

(declare-fun e!672229 () Bool)

(assert (=> b!1182386 (= e!672229 tp_is_empty!29791)))

(declare-fun b!1182387 () Bool)

(declare-fun Unit!39120 () Unit!39117)

(assert (=> b!1182387 (= e!672235 Unit!39120)))

(declare-fun b!1182388 () Bool)

(declare-fun res!785784 () Bool)

(assert (=> b!1182388 (=> (not res!785784) (not e!672231))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1182388 (= res!785784 (validKeyInArray!0 k!934))))

(declare-fun b!1182389 () Bool)

(declare-fun mapRes!46514 () Bool)

(assert (=> b!1182389 (= e!672237 (and e!672229 mapRes!46514))))

(declare-fun condMapEmpty!46514 () Bool)

(declare-fun mapDefault!46514 () ValueCell!14186)

