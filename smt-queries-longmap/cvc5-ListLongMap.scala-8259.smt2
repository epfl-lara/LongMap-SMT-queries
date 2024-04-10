; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100502 () Bool)

(assert start!100502)

(declare-fun b_free!25825 () Bool)

(declare-fun b_next!25825 () Bool)

(assert (=> start!100502 (= b_free!25825 (not b_next!25825))))

(declare-fun tp!90464 () Bool)

(declare-fun b_and!42537 () Bool)

(assert (=> start!100502 (= tp!90464 b_and!42537)))

(declare-fun mapIsEmpty!47636 () Bool)

(declare-fun mapRes!47636 () Bool)

(assert (=> mapIsEmpty!47636 mapRes!47636))

(declare-fun b!1200587 () Bool)

(declare-fun e!681806 () Bool)

(assert (=> b!1200587 (= e!681806 true)))

(declare-datatypes ((V!45833 0))(
  ( (V!45834 (val!15321 Int)) )
))
(declare-fun zeroValue!944 () V!45833)

(declare-datatypes ((array!77831 0))(
  ( (array!77832 (arr!37560 (Array (_ BitVec 32) (_ BitVec 64))) (size!38096 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77831)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!544099 () Bool)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14555 0))(
  ( (ValueCellFull!14555 (v!17959 V!45833)) (EmptyCell!14555) )
))
(declare-datatypes ((array!77833 0))(
  ( (array!77834 (arr!37561 (Array (_ BitVec 32) ValueCell!14555)) (size!38097 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77833)

(declare-fun minValue!944 () V!45833)

(declare-datatypes ((tuple2!19614 0))(
  ( (tuple2!19615 (_1!9818 (_ BitVec 64)) (_2!9818 V!45833)) )
))
(declare-datatypes ((List!26434 0))(
  ( (Nil!26431) (Cons!26430 (h!27639 tuple2!19614) (t!39239 List!26434)) )
))
(declare-datatypes ((ListLongMap!17583 0))(
  ( (ListLongMap!17584 (toList!8807 List!26434)) )
))
(declare-fun contains!6868 (ListLongMap!17583 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!5246 (array!77831 array!77833 (_ BitVec 32) (_ BitVec 32) V!45833 V!45833 (_ BitVec 32) Int) ListLongMap!17583)

(assert (=> b!1200587 (= lt!544099 (contains!6868 (getCurrentListMapNoExtraKeys!5246 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun b!1200588 () Bool)

(declare-fun res!799206 () Bool)

(declare-fun e!681799 () Bool)

(assert (=> b!1200588 (=> (not res!799206) (not e!681799))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1200588 (= res!799206 (= (select (arr!37560 _keys!1208) i!673) k!934))))

(declare-fun b!1200589 () Bool)

(declare-fun res!799207 () Bool)

(assert (=> b!1200589 (=> (not res!799207) (not e!681799))))

(declare-datatypes ((List!26435 0))(
  ( (Nil!26432) (Cons!26431 (h!27640 (_ BitVec 64)) (t!39240 List!26435)) )
))
(declare-fun arrayNoDuplicates!0 (array!77831 (_ BitVec 32) List!26435) Bool)

(assert (=> b!1200589 (= res!799207 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26432))))

(declare-fun bm!57301 () Bool)

(declare-fun lt!544102 () array!77831)

(declare-fun call!57305 () ListLongMap!17583)

(declare-fun lt!544098 () array!77833)

(assert (=> bm!57301 (= call!57305 (getCurrentListMapNoExtraKeys!5246 lt!544102 lt!544098 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1200590 () Bool)

(declare-fun res!799214 () Bool)

(assert (=> b!1200590 (=> (not res!799214) (not e!681799))))

(assert (=> b!1200590 (= res!799214 (and (= (size!38097 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38096 _keys!1208) (size!38097 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!47636 () Bool)

(declare-fun tp!90465 () Bool)

(declare-fun e!681801 () Bool)

(assert (=> mapNonEmpty!47636 (= mapRes!47636 (and tp!90465 e!681801))))

(declare-fun mapRest!47636 () (Array (_ BitVec 32) ValueCell!14555))

(declare-fun mapKey!47636 () (_ BitVec 32))

(declare-fun mapValue!47636 () ValueCell!14555)

(assert (=> mapNonEmpty!47636 (= (arr!37561 _values!996) (store mapRest!47636 mapKey!47636 mapValue!47636))))

(declare-fun b!1200591 () Bool)

(declare-fun e!681808 () Bool)

(declare-fun e!681804 () Bool)

(assert (=> b!1200591 (= e!681808 (not e!681804))))

(declare-fun res!799204 () Bool)

(assert (=> b!1200591 (=> res!799204 e!681804)))

(assert (=> b!1200591 (= res!799204 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77831 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1200591 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39806 0))(
  ( (Unit!39807) )
))
(declare-fun lt!544096 () Unit!39806)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77831 (_ BitVec 64) (_ BitVec 32)) Unit!39806)

(assert (=> b!1200591 (= lt!544096 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun res!799203 () Bool)

(assert (=> start!100502 (=> (not res!799203) (not e!681799))))

(assert (=> start!100502 (= res!799203 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38096 _keys!1208))))))

(assert (=> start!100502 e!681799))

(declare-fun tp_is_empty!30529 () Bool)

(assert (=> start!100502 tp_is_empty!30529))

(declare-fun array_inv!28626 (array!77831) Bool)

(assert (=> start!100502 (array_inv!28626 _keys!1208)))

(assert (=> start!100502 true))

(assert (=> start!100502 tp!90464))

(declare-fun e!681800 () Bool)

(declare-fun array_inv!28627 (array!77833) Bool)

(assert (=> start!100502 (and (array_inv!28627 _values!996) e!681800)))

(declare-fun b!1200592 () Bool)

(declare-fun res!799210 () Bool)

(assert (=> b!1200592 (=> (not res!799210) (not e!681799))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1200592 (= res!799210 (validMask!0 mask!1564))))

(declare-fun b!1200593 () Bool)

(assert (=> b!1200593 (= e!681801 tp_is_empty!30529)))

(declare-fun b!1200594 () Bool)

(declare-fun res!799215 () Bool)

(assert (=> b!1200594 (=> (not res!799215) (not e!681808))))

(assert (=> b!1200594 (= res!799215 (arrayNoDuplicates!0 lt!544102 #b00000000000000000000000000000000 Nil!26432))))

(declare-fun b!1200595 () Bool)

(declare-fun e!681803 () Bool)

(declare-fun call!57304 () ListLongMap!17583)

(declare-fun -!1783 (ListLongMap!17583 (_ BitVec 64)) ListLongMap!17583)

(assert (=> b!1200595 (= e!681803 (= call!57305 (-!1783 call!57304 k!934)))))

(declare-fun b!1200596 () Bool)

(assert (=> b!1200596 (= e!681803 (= call!57305 call!57304))))

(declare-fun b!1200597 () Bool)

(declare-fun res!799208 () Bool)

(assert (=> b!1200597 (=> (not res!799208) (not e!681799))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1200597 (= res!799208 (validKeyInArray!0 k!934))))

(declare-fun bm!57302 () Bool)

(assert (=> bm!57302 (= call!57304 (getCurrentListMapNoExtraKeys!5246 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1200598 () Bool)

(declare-fun e!681802 () Bool)

(assert (=> b!1200598 (= e!681804 e!681802)))

(declare-fun res!799213 () Bool)

(assert (=> b!1200598 (=> res!799213 e!681802)))

(assert (=> b!1200598 (= res!799213 (not (= from!1455 i!673)))))

(declare-fun lt!544100 () ListLongMap!17583)

(assert (=> b!1200598 (= lt!544100 (getCurrentListMapNoExtraKeys!5246 lt!544102 lt!544098 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3166 (Int (_ BitVec 64)) V!45833)

(assert (=> b!1200598 (= lt!544098 (array!77834 (store (arr!37561 _values!996) i!673 (ValueCellFull!14555 (dynLambda!3166 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38097 _values!996)))))

(declare-fun lt!544101 () ListLongMap!17583)

(assert (=> b!1200598 (= lt!544101 (getCurrentListMapNoExtraKeys!5246 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1200599 () Bool)

(declare-fun res!799209 () Bool)

(assert (=> b!1200599 (=> (not res!799209) (not e!681799))))

(assert (=> b!1200599 (= res!799209 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38096 _keys!1208))))))

(declare-fun b!1200600 () Bool)

(declare-fun e!681807 () Bool)

(assert (=> b!1200600 (= e!681807 tp_is_empty!30529)))

(declare-fun b!1200601 () Bool)

(assert (=> b!1200601 (= e!681802 e!681806)))

(declare-fun res!799212 () Bool)

(assert (=> b!1200601 (=> res!799212 e!681806)))

(assert (=> b!1200601 (= res!799212 (not (= (select (arr!37560 _keys!1208) from!1455) k!934)))))

(assert (=> b!1200601 e!681803))

(declare-fun c!117449 () Bool)

(assert (=> b!1200601 (= c!117449 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!544097 () Unit!39806)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!990 (array!77831 array!77833 (_ BitVec 32) (_ BitVec 32) V!45833 V!45833 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39806)

(assert (=> b!1200601 (= lt!544097 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!990 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1200602 () Bool)

(declare-fun res!799211 () Bool)

(assert (=> b!1200602 (=> (not res!799211) (not e!681799))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77831 (_ BitVec 32)) Bool)

(assert (=> b!1200602 (= res!799211 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1200603 () Bool)

(assert (=> b!1200603 (= e!681800 (and e!681807 mapRes!47636))))

(declare-fun condMapEmpty!47636 () Bool)

(declare-fun mapDefault!47636 () ValueCell!14555)

