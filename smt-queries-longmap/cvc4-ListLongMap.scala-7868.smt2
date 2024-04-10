; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97956 () Bool)

(assert start!97956)

(declare-fun b_free!23657 () Bool)

(declare-fun b_next!23657 () Bool)

(assert (=> start!97956 (= b_free!23657 (not b_next!23657))))

(declare-fun tp!83674 () Bool)

(declare-fun b_and!38097 () Bool)

(assert (=> start!97956 (= tp!83674 b_and!38097)))

(declare-fun b!1122797 () Bool)

(declare-fun res!750133 () Bool)

(declare-fun e!639230 () Bool)

(assert (=> b!1122797 (=> (not res!750133) (not e!639230))))

(declare-datatypes ((array!73249 0))(
  ( (array!73250 (arr!35277 (Array (_ BitVec 32) (_ BitVec 64))) (size!35813 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73249)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!42709 0))(
  ( (V!42710 (val!14150 Int)) )
))
(declare-datatypes ((ValueCell!13384 0))(
  ( (ValueCellFull!13384 (v!16783 V!42709)) (EmptyCell!13384) )
))
(declare-datatypes ((array!73251 0))(
  ( (array!73252 (arr!35278 (Array (_ BitVec 32) ValueCell!13384)) (size!35814 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73251)

(assert (=> b!1122797 (= res!750133 (and (= (size!35814 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35813 _keys!1208) (size!35814 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1122798 () Bool)

(declare-fun e!639232 () Bool)

(assert (=> b!1122798 (= e!639230 e!639232)))

(declare-fun res!750135 () Bool)

(assert (=> b!1122798 (=> (not res!750135) (not e!639232))))

(declare-fun lt!498851 () array!73249)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73249 (_ BitVec 32)) Bool)

(assert (=> b!1122798 (= res!750135 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498851 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1122798 (= lt!498851 (array!73250 (store (arr!35277 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35813 _keys!1208)))))

(declare-fun b!1122799 () Bool)

(declare-fun e!639235 () Bool)

(declare-fun e!639234 () Bool)

(assert (=> b!1122799 (= e!639235 e!639234)))

(declare-fun res!750128 () Bool)

(assert (=> b!1122799 (=> res!750128 e!639234)))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1122799 (= res!750128 (not (= (select (arr!35277 _keys!1208) from!1455) k!934)))))

(declare-fun e!639231 () Bool)

(assert (=> b!1122799 e!639231))

(declare-fun c!109476 () Bool)

(assert (=> b!1122799 (= c!109476 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!42709)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42709)

(declare-datatypes ((Unit!36826 0))(
  ( (Unit!36827) )
))
(declare-fun lt!498852 () Unit!36826)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!340 (array!73249 array!73251 (_ BitVec 32) (_ BitVec 32) V!42709 V!42709 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36826)

(assert (=> b!1122799 (= lt!498852 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!340 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122800 () Bool)

(declare-fun e!639228 () Bool)

(declare-fun e!639233 () Bool)

(declare-fun mapRes!44098 () Bool)

(assert (=> b!1122800 (= e!639228 (and e!639233 mapRes!44098))))

(declare-fun condMapEmpty!44098 () Bool)

(declare-fun mapDefault!44098 () ValueCell!13384)

