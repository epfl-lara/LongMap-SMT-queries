; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97814 () Bool)

(assert start!97814)

(declare-fun b_free!23515 () Bool)

(declare-fun b_next!23515 () Bool)

(assert (=> start!97814 (= b_free!23515 (not b_next!23515))))

(declare-fun tp!83248 () Bool)

(declare-fun b_and!37813 () Bool)

(assert (=> start!97814 (= tp!83248 b_and!37813)))

(declare-fun b!1119254 () Bool)

(declare-fun res!747622 () Bool)

(declare-fun e!637446 () Bool)

(assert (=> b!1119254 (=> (not res!747622) (not e!637446))))

(declare-datatypes ((array!72975 0))(
  ( (array!72976 (arr!35140 (Array (_ BitVec 32) (_ BitVec 64))) (size!35676 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72975)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72975 (_ BitVec 32)) Bool)

(assert (=> b!1119254 (= res!747622 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1119255 () Bool)

(declare-fun res!747615 () Bool)

(assert (=> b!1119255 (=> (not res!747615) (not e!637446))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1119255 (= res!747615 (validKeyInArray!0 k!934))))

(declare-fun b!1119256 () Bool)

(declare-fun e!637447 () Bool)

(declare-fun tp_is_empty!28045 () Bool)

(assert (=> b!1119256 (= e!637447 tp_is_empty!28045)))

(declare-fun mapNonEmpty!43885 () Bool)

(declare-fun mapRes!43885 () Bool)

(declare-fun tp!83249 () Bool)

(assert (=> mapNonEmpty!43885 (= mapRes!43885 (and tp!83249 e!637447))))

(declare-datatypes ((V!42521 0))(
  ( (V!42522 (val!14079 Int)) )
))
(declare-datatypes ((ValueCell!13313 0))(
  ( (ValueCellFull!13313 (v!16712 V!42521)) (EmptyCell!13313) )
))
(declare-fun mapRest!43885 () (Array (_ BitVec 32) ValueCell!13313))

(declare-fun mapKey!43885 () (_ BitVec 32))

(declare-fun mapValue!43885 () ValueCell!13313)

(declare-datatypes ((array!72977 0))(
  ( (array!72978 (arr!35141 (Array (_ BitVec 32) ValueCell!13313)) (size!35677 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72977)

(assert (=> mapNonEmpty!43885 (= (arr!35141 _values!996) (store mapRest!43885 mapKey!43885 mapValue!43885))))

(declare-fun mapIsEmpty!43885 () Bool)

(assert (=> mapIsEmpty!43885 mapRes!43885))

(declare-fun b!1119257 () Bool)

(declare-fun res!747617 () Bool)

(assert (=> b!1119257 (=> (not res!747617) (not e!637446))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1119257 (= res!747617 (and (= (size!35677 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35676 _keys!1208) (size!35677 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!747616 () Bool)

(assert (=> start!97814 (=> (not res!747616) (not e!637446))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97814 (= res!747616 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35676 _keys!1208))))))

(assert (=> start!97814 e!637446))

(assert (=> start!97814 tp_is_empty!28045))

(declare-fun array_inv!26998 (array!72975) Bool)

(assert (=> start!97814 (array_inv!26998 _keys!1208)))

(assert (=> start!97814 true))

(assert (=> start!97814 tp!83248))

(declare-fun e!637444 () Bool)

(declare-fun array_inv!26999 (array!72977) Bool)

(assert (=> start!97814 (and (array_inv!26999 _values!996) e!637444)))

(declare-fun b!1119258 () Bool)

(declare-fun res!747621 () Bool)

(assert (=> b!1119258 (=> (not res!747621) (not e!637446))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1119258 (= res!747621 (= (select (arr!35140 _keys!1208) i!673) k!934))))

(declare-fun b!1119259 () Bool)

(declare-fun e!637443 () Bool)

(declare-fun e!637448 () Bool)

(assert (=> b!1119259 (= e!637443 (not e!637448))))

(declare-fun res!747612 () Bool)

(assert (=> b!1119259 (=> res!747612 e!637448)))

(assert (=> b!1119259 (= res!747612 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!72975 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1119259 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36730 0))(
  ( (Unit!36731) )
))
(declare-fun lt!497703 () Unit!36730)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72975 (_ BitVec 64) (_ BitVec 32)) Unit!36730)

(assert (=> b!1119259 (= lt!497703 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1119260 () Bool)

(declare-fun e!637445 () Bool)

(assert (=> b!1119260 (= e!637444 (and e!637445 mapRes!43885))))

(declare-fun condMapEmpty!43885 () Bool)

(declare-fun mapDefault!43885 () ValueCell!13313)

