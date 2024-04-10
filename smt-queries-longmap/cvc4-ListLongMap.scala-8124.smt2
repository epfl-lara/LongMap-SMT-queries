; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99614 () Bool)

(assert start!99614)

(declare-fun b_free!25193 () Bool)

(declare-fun b_next!25193 () Bool)

(assert (=> start!99614 (= b_free!25193 (not b_next!25193))))

(declare-fun tp!88293 () Bool)

(declare-fun b_and!41253 () Bool)

(assert (=> start!99614 (= tp!88293 b_and!41253)))

(declare-fun b!1180141 () Bool)

(declare-fun res!784127 () Bool)

(declare-fun e!670948 () Bool)

(assert (=> b!1180141 (=> (not res!784127) (not e!670948))))

(declare-datatypes ((V!44757 0))(
  ( (V!44758 (val!14918 Int)) )
))
(declare-datatypes ((tuple2!19102 0))(
  ( (tuple2!19103 (_1!9562 (_ BitVec 64)) (_2!9562 V!44757)) )
))
(declare-datatypes ((List!25840 0))(
  ( (Nil!25837) (Cons!25836 (h!27045 tuple2!19102) (t!38025 List!25840)) )
))
(declare-datatypes ((ListLongMap!17071 0))(
  ( (ListLongMap!17072 (toList!8551 List!25840)) )
))
(declare-fun lt!533509 () ListLongMap!17071)

(declare-fun lt!533511 () ListLongMap!17071)

(declare-fun lt!533521 () tuple2!19102)

(declare-fun +!3862 (ListLongMap!17071 tuple2!19102) ListLongMap!17071)

(assert (=> b!1180141 (= res!784127 (= lt!533511 (+!3862 lt!533509 lt!533521)))))

(declare-fun b!1180142 () Bool)

(declare-fun res!784128 () Bool)

(declare-fun e!670951 () Bool)

(assert (=> b!1180142 (=> (not res!784128) (not e!670951))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1180142 (= res!784128 (validKeyInArray!0 k!934))))

(declare-fun b!1180143 () Bool)

(declare-fun res!784124 () Bool)

(assert (=> b!1180143 (=> (not res!784124) (not e!670951))))

(declare-datatypes ((array!76249 0))(
  ( (array!76250 (arr!36774 (Array (_ BitVec 32) (_ BitVec 64))) (size!37310 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76249)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14152 0))(
  ( (ValueCellFull!14152 (v!17556 V!44757)) (EmptyCell!14152) )
))
(declare-datatypes ((array!76251 0))(
  ( (array!76252 (arr!36775 (Array (_ BitVec 32) ValueCell!14152)) (size!37311 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76251)

(assert (=> b!1180143 (= res!784124 (and (= (size!37311 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37310 _keys!1208) (size!37311 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!46412 () Bool)

(declare-fun mapRes!46412 () Bool)

(assert (=> mapIsEmpty!46412 mapRes!46412))

(declare-fun b!1180145 () Bool)

(declare-fun lt!533517 () ListLongMap!17071)

(declare-fun lt!533513 () ListLongMap!17071)

(assert (=> b!1180145 (= e!670948 (= lt!533517 lt!533513))))

(declare-fun b!1180146 () Bool)

(declare-fun res!784132 () Bool)

(declare-fun e!670942 () Bool)

(assert (=> b!1180146 (=> (not res!784132) (not e!670942))))

(declare-fun lt!533514 () array!76249)

(declare-datatypes ((List!25841 0))(
  ( (Nil!25838) (Cons!25837 (h!27046 (_ BitVec 64)) (t!38026 List!25841)) )
))
(declare-fun arrayNoDuplicates!0 (array!76249 (_ BitVec 32) List!25841) Bool)

(assert (=> b!1180146 (= res!784132 (arrayNoDuplicates!0 lt!533514 #b00000000000000000000000000000000 Nil!25838))))

(declare-fun b!1180147 () Bool)

(declare-fun res!784122 () Bool)

(assert (=> b!1180147 (=> (not res!784122) (not e!670951))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76249 (_ BitVec 32)) Bool)

(assert (=> b!1180147 (= res!784122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1180148 () Bool)

(declare-fun res!784123 () Bool)

(assert (=> b!1180148 (=> (not res!784123) (not e!670951))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1180148 (= res!784123 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37310 _keys!1208))))))

(declare-fun b!1180149 () Bool)

(declare-fun res!784120 () Bool)

(assert (=> b!1180149 (=> (not res!784120) (not e!670951))))

(assert (=> b!1180149 (= res!784120 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25838))))

(declare-fun b!1180150 () Bool)

(declare-fun e!670941 () Bool)

(declare-fun tp_is_empty!29723 () Bool)

(assert (=> b!1180150 (= e!670941 tp_is_empty!29723)))

(declare-fun b!1180151 () Bool)

(declare-fun res!784118 () Bool)

(assert (=> b!1180151 (=> (not res!784118) (not e!670951))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1180151 (= res!784118 (validMask!0 mask!1564))))

(declare-fun b!1180144 () Bool)

(declare-fun e!670944 () Bool)

(assert (=> b!1180144 (= e!670944 tp_is_empty!29723)))

(declare-fun res!784117 () Bool)

(assert (=> start!99614 (=> (not res!784117) (not e!670951))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99614 (= res!784117 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37310 _keys!1208))))))

(assert (=> start!99614 e!670951))

(assert (=> start!99614 tp_is_empty!29723))

(declare-fun array_inv!28080 (array!76249) Bool)

(assert (=> start!99614 (array_inv!28080 _keys!1208)))

(assert (=> start!99614 true))

(assert (=> start!99614 tp!88293))

(declare-fun e!670946 () Bool)

(declare-fun array_inv!28081 (array!76251) Bool)

(assert (=> start!99614 (and (array_inv!28081 _values!996) e!670946)))

(declare-fun b!1180152 () Bool)

(declare-fun e!670945 () Bool)

(assert (=> b!1180152 (= e!670945 true)))

(assert (=> b!1180152 e!670948))

(declare-fun res!784129 () Bool)

(assert (=> b!1180152 (=> (not res!784129) (not e!670948))))

(assert (=> b!1180152 (= res!784129 (not (= (select (arr!36774 _keys!1208) from!1455) k!934)))))

(declare-datatypes ((Unit!39007 0))(
  ( (Unit!39008) )
))
(declare-fun lt!533523 () Unit!39007)

(declare-fun e!670949 () Unit!39007)

(assert (=> b!1180152 (= lt!533523 e!670949)))

(declare-fun c!116913 () Bool)

(assert (=> b!1180152 (= c!116913 (= (select (arr!36774 _keys!1208) from!1455) k!934))))

(declare-fun e!670943 () Bool)

(assert (=> b!1180152 e!670943))

(declare-fun res!784130 () Bool)

(assert (=> b!1180152 (=> (not res!784130) (not e!670943))))

(declare-fun lt!533522 () ListLongMap!17071)

(assert (=> b!1180152 (= res!784130 (= lt!533522 (+!3862 lt!533517 lt!533521)))))

(declare-fun lt!533512 () V!44757)

(declare-fun get!18803 (ValueCell!14152 V!44757) V!44757)

(assert (=> b!1180152 (= lt!533521 (tuple2!19103 (select (arr!36774 _keys!1208) from!1455) (get!18803 (select (arr!36775 _values!996) from!1455) lt!533512)))))

(declare-fun b!1180153 () Bool)

(declare-fun e!670950 () Bool)

(assert (=> b!1180153 (= e!670950 e!670945)))

(declare-fun res!784116 () Bool)

(assert (=> b!1180153 (=> res!784116 e!670945)))

(assert (=> b!1180153 (= res!784116 (not (validKeyInArray!0 (select (arr!36774 _keys!1208) from!1455))))))

(assert (=> b!1180153 (= lt!533513 lt!533517)))

(declare-fun -!1593 (ListLongMap!17071 (_ BitVec 64)) ListLongMap!17071)

(assert (=> b!1180153 (= lt!533517 (-!1593 lt!533509 k!934))))

(declare-fun zeroValue!944 () V!44757)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44757)

(declare-fun lt!533516 () array!76251)

(declare-fun getCurrentListMapNoExtraKeys!5005 (array!76249 array!76251 (_ BitVec 32) (_ BitVec 32) V!44757 V!44757 (_ BitVec 32) Int) ListLongMap!17071)

(assert (=> b!1180153 (= lt!533513 (getCurrentListMapNoExtraKeys!5005 lt!533514 lt!533516 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1180153 (= lt!533509 (getCurrentListMapNoExtraKeys!5005 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!533519 () Unit!39007)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!820 (array!76249 array!76251 (_ BitVec 32) (_ BitVec 32) V!44757 V!44757 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39007)

(assert (=> b!1180153 (= lt!533519 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!820 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1180154 () Bool)

(assert (=> b!1180154 (= e!670946 (and e!670941 mapRes!46412))))

(declare-fun condMapEmpty!46412 () Bool)

(declare-fun mapDefault!46412 () ValueCell!14152)

