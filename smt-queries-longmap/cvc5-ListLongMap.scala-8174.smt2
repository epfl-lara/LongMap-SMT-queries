; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99910 () Bool)

(assert start!99910)

(declare-fun b_free!25489 () Bool)

(declare-fun b_next!25489 () Bool)

(assert (=> start!99910 (= b_free!25489 (not b_next!25489))))

(declare-fun tp!89180 () Bool)

(declare-fun b_and!41845 () Bool)

(assert (=> start!99910 (= tp!89180 b_and!41845)))

(declare-fun b!1189165 () Bool)

(declare-fun res!790741 () Bool)

(declare-fun e!676110 () Bool)

(assert (=> b!1189165 (=> (not res!790741) (not e!676110))))

(declare-datatypes ((array!76833 0))(
  ( (array!76834 (arr!37066 (Array (_ BitVec 32) (_ BitVec 64))) (size!37602 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76833)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1189165 (= res!790741 (= (select (arr!37066 _keys!1208) i!673) k!934))))

(declare-fun b!1189166 () Bool)

(declare-fun res!790745 () Bool)

(assert (=> b!1189166 (=> (not res!790745) (not e!676110))))

(assert (=> b!1189166 (= res!790745 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37602 _keys!1208))))))

(declare-fun b!1189167 () Bool)

(declare-fun e!676112 () Bool)

(assert (=> b!1189167 (= e!676110 e!676112)))

(declare-fun res!790739 () Bool)

(assert (=> b!1189167 (=> (not res!790739) (not e!676112))))

(declare-fun lt!540963 () array!76833)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76833 (_ BitVec 32)) Bool)

(assert (=> b!1189167 (= res!790739 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!540963 mask!1564))))

(assert (=> b!1189167 (= lt!540963 (array!76834 (store (arr!37066 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37602 _keys!1208)))))

(declare-fun mapNonEmpty!46856 () Bool)

(declare-fun mapRes!46856 () Bool)

(declare-fun tp!89181 () Bool)

(declare-fun e!676107 () Bool)

(assert (=> mapNonEmpty!46856 (= mapRes!46856 (and tp!89181 e!676107))))

(declare-datatypes ((V!45153 0))(
  ( (V!45154 (val!15066 Int)) )
))
(declare-datatypes ((ValueCell!14300 0))(
  ( (ValueCellFull!14300 (v!17704 V!45153)) (EmptyCell!14300) )
))
(declare-fun mapRest!46856 () (Array (_ BitVec 32) ValueCell!14300))

(declare-datatypes ((array!76835 0))(
  ( (array!76836 (arr!37067 (Array (_ BitVec 32) ValueCell!14300)) (size!37603 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76835)

(declare-fun mapValue!46856 () ValueCell!14300)

(declare-fun mapKey!46856 () (_ BitVec 32))

(assert (=> mapNonEmpty!46856 (= (arr!37067 _values!996) (store mapRest!46856 mapKey!46856 mapValue!46856))))

(declare-fun b!1189168 () Bool)

(declare-fun e!676109 () Bool)

(declare-fun e!676114 () Bool)

(assert (=> b!1189168 (= e!676109 (and e!676114 mapRes!46856))))

(declare-fun condMapEmpty!46856 () Bool)

(declare-fun mapDefault!46856 () ValueCell!14300)

