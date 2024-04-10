; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113372 () Bool)

(assert start!113372)

(declare-fun b_free!31423 () Bool)

(declare-fun b_next!31423 () Bool)

(assert (=> start!113372 (= b_free!31423 (not b_next!31423))))

(declare-fun tp!110073 () Bool)

(declare-fun b_and!50699 () Bool)

(assert (=> start!113372 (= tp!110073 b_and!50699)))

(declare-fun b!1345710 () Bool)

(declare-fun e!765718 () Bool)

(declare-fun e!765717 () Bool)

(assert (=> b!1345710 (= e!765718 e!765717)))

(declare-fun res!892946 () Bool)

(assert (=> b!1345710 (=> (not res!892946) (not e!765717))))

(declare-datatypes ((V!55001 0))(
  ( (V!55002 (val!18786 Int)) )
))
(declare-datatypes ((tuple2!24216 0))(
  ( (tuple2!24217 (_1!12119 (_ BitVec 64)) (_2!12119 V!55001)) )
))
(declare-datatypes ((List!31372 0))(
  ( (Nil!31369) (Cons!31368 (h!32577 tuple2!24216) (t!45952 List!31372)) )
))
(declare-datatypes ((ListLongMap!21873 0))(
  ( (ListLongMap!21874 (toList!10952 List!31372)) )
))
(declare-fun lt!595406 () ListLongMap!21873)

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((array!91686 0))(
  ( (array!91687 (arr!44299 (Array (_ BitVec 32) (_ BitVec 64))) (size!44849 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91686)

(declare-fun lt!595407 () V!55001)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun contains!9128 (ListLongMap!21873 (_ BitVec 64)) Bool)

(declare-fun +!4833 (ListLongMap!21873 tuple2!24216) ListLongMap!21873)

(assert (=> b!1345710 (= res!892946 (contains!9128 (+!4833 lt!595406 (tuple2!24217 (select (arr!44299 _keys!1571) from!1960) lt!595407)) k!1142))))

(declare-fun minValue!1245 () V!55001)

(declare-fun defaultEntry!1306 () Int)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun zeroValue!1245 () V!55001)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17813 0))(
  ( (ValueCellFull!17813 (v!21434 V!55001)) (EmptyCell!17813) )
))
(declare-datatypes ((array!91688 0))(
  ( (array!91689 (arr!44300 (Array (_ BitVec 32) ValueCell!17813)) (size!44850 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91688)

(declare-fun getCurrentListMapNoExtraKeys!6475 (array!91686 array!91688 (_ BitVec 32) (_ BitVec 32) V!55001 V!55001 (_ BitVec 32) Int) ListLongMap!21873)

(assert (=> b!1345710 (= lt!595406 (getCurrentListMapNoExtraKeys!6475 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun get!22380 (ValueCell!17813 V!55001) V!55001)

(declare-fun dynLambda!3772 (Int (_ BitVec 64)) V!55001)

(assert (=> b!1345710 (= lt!595407 (get!22380 (select (arr!44300 _values!1303) from!1960) (dynLambda!3772 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1345712 () Bool)

(declare-fun res!892942 () Bool)

(assert (=> b!1345712 (=> (not res!892942) (not e!765718))))

(declare-datatypes ((List!31373 0))(
  ( (Nil!31370) (Cons!31369 (h!32578 (_ BitVec 64)) (t!45953 List!31373)) )
))
(declare-fun arrayNoDuplicates!0 (array!91686 (_ BitVec 32) List!31373) Bool)

(assert (=> b!1345712 (= res!892942 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31370))))

(declare-fun b!1345713 () Bool)

(declare-fun res!892941 () Bool)

(assert (=> b!1345713 (=> (not res!892941) (not e!765718))))

(assert (=> b!1345713 (= res!892941 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1345714 () Bool)

(declare-fun res!892949 () Bool)

(assert (=> b!1345714 (=> (not res!892949) (not e!765718))))

(assert (=> b!1345714 (= res!892949 (not (= (select (arr!44299 _keys!1571) from!1960) k!1142)))))

(declare-fun b!1345715 () Bool)

(declare-fun res!892950 () Bool)

(assert (=> b!1345715 (=> (not res!892950) (not e!765717))))

(assert (=> b!1345715 (= res!892950 (not (= k!1142 (select (arr!44299 _keys!1571) from!1960))))))

(declare-fun b!1345716 () Bool)

(declare-fun res!892944 () Bool)

(assert (=> b!1345716 (=> (not res!892944) (not e!765718))))

(assert (=> b!1345716 (= res!892944 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44849 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!892948 () Bool)

(assert (=> start!113372 (=> (not res!892948) (not e!765718))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113372 (= res!892948 (validMask!0 mask!1977))))

(assert (=> start!113372 e!765718))

(declare-fun tp_is_empty!37423 () Bool)

(assert (=> start!113372 tp_is_empty!37423))

(assert (=> start!113372 true))

(declare-fun array_inv!33379 (array!91686) Bool)

(assert (=> start!113372 (array_inv!33379 _keys!1571)))

(declare-fun e!765719 () Bool)

(declare-fun array_inv!33380 (array!91688) Bool)

(assert (=> start!113372 (and (array_inv!33380 _values!1303) e!765719)))

(assert (=> start!113372 tp!110073))

(declare-fun b!1345711 () Bool)

(declare-fun res!892945 () Bool)

(assert (=> b!1345711 (=> (not res!892945) (not e!765718))))

(declare-fun getCurrentListMap!5905 (array!91686 array!91688 (_ BitVec 32) (_ BitVec 32) V!55001 V!55001 (_ BitVec 32) Int) ListLongMap!21873)

(assert (=> b!1345711 (= res!892945 (contains!9128 (getCurrentListMap!5905 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1345717 () Bool)

(declare-fun res!892947 () Bool)

(assert (=> b!1345717 (=> (not res!892947) (not e!765718))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1345717 (= res!892947 (validKeyInArray!0 (select (arr!44299 _keys!1571) from!1960)))))

(declare-fun b!1345718 () Bool)

(declare-fun e!765715 () Bool)

(declare-fun mapRes!57841 () Bool)

(assert (=> b!1345718 (= e!765719 (and e!765715 mapRes!57841))))

(declare-fun condMapEmpty!57841 () Bool)

(declare-fun mapDefault!57841 () ValueCell!17813)

