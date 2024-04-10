; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113162 () Bool)

(assert start!113162)

(declare-fun b_free!31213 () Bool)

(declare-fun b_next!31213 () Bool)

(assert (=> start!113162 (= b_free!31213 (not b_next!31213))))

(declare-fun tp!109444 () Bool)

(declare-fun b_and!50333 () Bool)

(assert (=> start!113162 (= tp!109444 b_and!50333)))

(declare-fun b!1341941 () Bool)

(declare-fun res!890278 () Bool)

(declare-fun e!764078 () Bool)

(assert (=> b!1341941 (=> (not res!890278) (not e!764078))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((array!91278 0))(
  ( (array!91279 (arr!44095 (Array (_ BitVec 32) (_ BitVec 64))) (size!44645 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91278)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1341941 (= res!890278 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44645 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1341942 () Bool)

(assert (=> b!1341942 (= e!764078 (not true))))

(declare-datatypes ((V!54721 0))(
  ( (V!54722 (val!18681 Int)) )
))
(declare-datatypes ((tuple2!24060 0))(
  ( (tuple2!24061 (_1!12041 (_ BitVec 64)) (_2!12041 V!54721)) )
))
(declare-datatypes ((List!31216 0))(
  ( (Nil!31213) (Cons!31212 (h!32421 tuple2!24060) (t!45640 List!31216)) )
))
(declare-datatypes ((ListLongMap!21717 0))(
  ( (ListLongMap!21718 (toList!10874 List!31216)) )
))
(declare-fun lt!594288 () ListLongMap!21717)

(declare-fun contains!9050 (ListLongMap!21717 (_ BitVec 64)) Bool)

(assert (=> b!1341942 (contains!9050 lt!594288 k!1142)))

(declare-fun lt!594287 () V!54721)

(declare-datatypes ((Unit!44049 0))(
  ( (Unit!44050) )
))
(declare-fun lt!594286 () Unit!44049)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!355 ((_ BitVec 64) (_ BitVec 64) V!54721 ListLongMap!21717) Unit!44049)

(assert (=> b!1341942 (= lt!594286 (lemmaInListMapAfterAddingDiffThenInBefore!355 k!1142 (select (arr!44095 _keys!1571) from!1960) lt!594287 lt!594288))))

(declare-fun lt!594285 () ListLongMap!21717)

(assert (=> b!1341942 (contains!9050 lt!594285 k!1142)))

(declare-fun zeroValue!1245 () V!54721)

(declare-fun lt!594284 () Unit!44049)

(assert (=> b!1341942 (= lt!594284 (lemmaInListMapAfterAddingDiffThenInBefore!355 k!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594285))))

(declare-fun +!4786 (ListLongMap!21717 tuple2!24060) ListLongMap!21717)

(assert (=> b!1341942 (= lt!594285 (+!4786 lt!594288 (tuple2!24061 (select (arr!44095 _keys!1571) from!1960) lt!594287)))))

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((ValueCell!17708 0))(
  ( (ValueCellFull!17708 (v!21329 V!54721)) (EmptyCell!17708) )
))
(declare-datatypes ((array!91280 0))(
  ( (array!91281 (arr!44096 (Array (_ BitVec 32) ValueCell!17708)) (size!44646 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91280)

(declare-fun get!22263 (ValueCell!17708 V!54721) V!54721)

(declare-fun dynLambda!3725 (Int (_ BitVec 64)) V!54721)

(assert (=> b!1341942 (= lt!594287 (get!22263 (select (arr!44096 _values!1303) from!1960) (dynLambda!3725 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1245 () V!54721)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6428 (array!91278 array!91280 (_ BitVec 32) (_ BitVec 32) V!54721 V!54721 (_ BitVec 32) Int) ListLongMap!21717)

(assert (=> b!1341942 (= lt!594288 (getCurrentListMapNoExtraKeys!6428 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1341943 () Bool)

(declare-fun res!890279 () Bool)

(assert (=> b!1341943 (=> (not res!890279) (not e!764078))))

(declare-datatypes ((List!31217 0))(
  ( (Nil!31214) (Cons!31213 (h!32422 (_ BitVec 64)) (t!45641 List!31217)) )
))
(declare-fun arrayNoDuplicates!0 (array!91278 (_ BitVec 32) List!31217) Bool)

(assert (=> b!1341943 (= res!890279 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31214))))

(declare-fun b!1341944 () Bool)

(declare-fun e!764074 () Bool)

(declare-fun tp_is_empty!37213 () Bool)

(assert (=> b!1341944 (= e!764074 tp_is_empty!37213)))

(declare-fun b!1341945 () Bool)

(declare-fun e!764077 () Bool)

(assert (=> b!1341945 (= e!764077 tp_is_empty!37213)))

(declare-fun res!890274 () Bool)

(assert (=> start!113162 (=> (not res!890274) (not e!764078))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113162 (= res!890274 (validMask!0 mask!1977))))

(assert (=> start!113162 e!764078))

(assert (=> start!113162 tp_is_empty!37213))

(assert (=> start!113162 true))

(declare-fun array_inv!33239 (array!91278) Bool)

(assert (=> start!113162 (array_inv!33239 _keys!1571)))

(declare-fun e!764076 () Bool)

(declare-fun array_inv!33240 (array!91280) Bool)

(assert (=> start!113162 (and (array_inv!33240 _values!1303) e!764076)))

(assert (=> start!113162 tp!109444))

(declare-fun b!1341946 () Bool)

(declare-fun res!890272 () Bool)

(assert (=> b!1341946 (=> (not res!890272) (not e!764078))))

(declare-fun getCurrentListMap!5838 (array!91278 array!91280 (_ BitVec 32) (_ BitVec 32) V!54721 V!54721 (_ BitVec 32) Int) ListLongMap!21717)

(assert (=> b!1341946 (= res!890272 (contains!9050 (getCurrentListMap!5838 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1341947 () Bool)

(declare-fun res!890277 () Bool)

(assert (=> b!1341947 (=> (not res!890277) (not e!764078))))

(assert (=> b!1341947 (= res!890277 (and (= (size!44646 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44645 _keys!1571) (size!44646 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!57526 () Bool)

(declare-fun mapRes!57526 () Bool)

(declare-fun tp!109443 () Bool)

(assert (=> mapNonEmpty!57526 (= mapRes!57526 (and tp!109443 e!764077))))

(declare-fun mapKey!57526 () (_ BitVec 32))

(declare-fun mapRest!57526 () (Array (_ BitVec 32) ValueCell!17708))

(declare-fun mapValue!57526 () ValueCell!17708)

(assert (=> mapNonEmpty!57526 (= (arr!44096 _values!1303) (store mapRest!57526 mapKey!57526 mapValue!57526))))

(declare-fun b!1341948 () Bool)

(declare-fun res!890280 () Bool)

(assert (=> b!1341948 (=> (not res!890280) (not e!764078))))

(assert (=> b!1341948 (= res!890280 (not (= (select (arr!44095 _keys!1571) from!1960) k!1142)))))

(declare-fun b!1341949 () Bool)

(declare-fun res!890275 () Bool)

(assert (=> b!1341949 (=> (not res!890275) (not e!764078))))

(assert (=> b!1341949 (= res!890275 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1341950 () Bool)

(declare-fun res!890273 () Bool)

(assert (=> b!1341950 (=> (not res!890273) (not e!764078))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1341950 (= res!890273 (validKeyInArray!0 (select (arr!44095 _keys!1571) from!1960)))))

(declare-fun b!1341951 () Bool)

(declare-fun res!890276 () Bool)

(assert (=> b!1341951 (=> (not res!890276) (not e!764078))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91278 (_ BitVec 32)) Bool)

(assert (=> b!1341951 (= res!890276 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1341952 () Bool)

(assert (=> b!1341952 (= e!764076 (and e!764074 mapRes!57526))))

(declare-fun condMapEmpty!57526 () Bool)

(declare-fun mapDefault!57526 () ValueCell!17708)

