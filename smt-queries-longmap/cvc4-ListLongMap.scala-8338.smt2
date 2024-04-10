; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101486 () Bool)

(assert start!101486)

(declare-fun b_free!26303 () Bool)

(declare-fun b_next!26303 () Bool)

(assert (=> start!101486 (= b_free!26303 (not b_next!26303))))

(declare-fun tp!91942 () Bool)

(declare-fun b_and!43795 () Bool)

(assert (=> start!101486 (= tp!91942 b_and!43795)))

(declare-fun b!1220136 () Bool)

(declare-fun res!810495 () Bool)

(declare-fun e!692817 () Bool)

(assert (=> b!1220136 (=> (not res!810495) (not e!692817))))

(declare-datatypes ((array!78791 0))(
  ( (array!78792 (arr!38026 (Array (_ BitVec 32) (_ BitVec 64))) (size!38562 (_ BitVec 32))) )
))
(declare-fun lt!554829 () array!78791)

(declare-datatypes ((List!26830 0))(
  ( (Nil!26827) (Cons!26826 (h!28035 (_ BitVec 64)) (t!40113 List!26830)) )
))
(declare-fun arrayNoDuplicates!0 (array!78791 (_ BitVec 32) List!26830) Bool)

(assert (=> b!1220136 (= res!810495 (arrayNoDuplicates!0 lt!554829 #b00000000000000000000000000000000 Nil!26827))))

(declare-fun b!1220137 () Bool)

(declare-fun res!810503 () Bool)

(declare-fun e!692824 () Bool)

(assert (=> b!1220137 (=> (not res!810503) (not e!692824))))

(declare-fun _keys!1208 () array!78791)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78791 (_ BitVec 32)) Bool)

(assert (=> b!1220137 (= res!810503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1220138 () Bool)

(declare-fun res!810491 () Bool)

(assert (=> b!1220138 (=> (not res!810491) (not e!692824))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1220138 (= res!810491 (validMask!0 mask!1564))))

(declare-fun e!692820 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun b!1220139 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78791 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1220139 (= e!692820 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1220140 () Bool)

(declare-fun e!692822 () Bool)

(declare-fun e!692816 () Bool)

(assert (=> b!1220140 (= e!692822 e!692816)))

(declare-fun res!810494 () Bool)

(assert (=> b!1220140 (=> res!810494 e!692816)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1220140 (= res!810494 (not (validKeyInArray!0 (select (arr!38026 _keys!1208) from!1455))))))

(declare-datatypes ((V!46469 0))(
  ( (V!46470 (val!15560 Int)) )
))
(declare-datatypes ((tuple2!20030 0))(
  ( (tuple2!20031 (_1!10026 (_ BitVec 64)) (_2!10026 V!46469)) )
))
(declare-datatypes ((List!26831 0))(
  ( (Nil!26828) (Cons!26827 (h!28036 tuple2!20030) (t!40114 List!26831)) )
))
(declare-datatypes ((ListLongMap!17999 0))(
  ( (ListLongMap!18000 (toList!9015 List!26831)) )
))
(declare-fun lt!554832 () ListLongMap!17999)

(declare-fun lt!554835 () ListLongMap!17999)

(assert (=> b!1220140 (= lt!554832 lt!554835)))

(declare-fun lt!554836 () ListLongMap!17999)

(declare-fun -!1924 (ListLongMap!17999 (_ BitVec 64)) ListLongMap!17999)

(assert (=> b!1220140 (= lt!554835 (-!1924 lt!554836 k!934))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14794 0))(
  ( (ValueCellFull!14794 (v!18217 V!46469)) (EmptyCell!14794) )
))
(declare-datatypes ((array!78793 0))(
  ( (array!78794 (arr!38027 (Array (_ BitVec 32) ValueCell!14794)) (size!38563 (_ BitVec 32))) )
))
(declare-fun lt!554837 () array!78793)

(declare-fun minValue!944 () V!46469)

(declare-fun zeroValue!944 () V!46469)

(declare-fun getCurrentListMapNoExtraKeys!5438 (array!78791 array!78793 (_ BitVec 32) (_ BitVec 32) V!46469 V!46469 (_ BitVec 32) Int) ListLongMap!17999)

(assert (=> b!1220140 (= lt!554832 (getCurrentListMapNoExtraKeys!5438 lt!554829 lt!554837 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!78793)

(assert (=> b!1220140 (= lt!554836 (getCurrentListMapNoExtraKeys!5438 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!40432 0))(
  ( (Unit!40433) )
))
(declare-fun lt!554833 () Unit!40432)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1131 (array!78791 array!78793 (_ BitVec 32) (_ BitVec 32) V!46469 V!46469 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40432)

(assert (=> b!1220140 (= lt!554833 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1131 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!48397 () Bool)

(declare-fun mapRes!48397 () Bool)

(assert (=> mapIsEmpty!48397 mapRes!48397))

(declare-fun b!1220141 () Bool)

(declare-fun e!692814 () Bool)

(declare-fun tp_is_empty!31007 () Bool)

(assert (=> b!1220141 (= e!692814 tp_is_empty!31007)))

(declare-fun b!1220142 () Bool)

(declare-fun e!692818 () Bool)

(assert (=> b!1220142 (= e!692818 (and e!692814 mapRes!48397))))

(declare-fun condMapEmpty!48397 () Bool)

(declare-fun mapDefault!48397 () ValueCell!14794)

