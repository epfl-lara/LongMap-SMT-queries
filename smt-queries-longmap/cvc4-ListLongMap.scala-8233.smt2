; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100310 () Bool)

(assert start!100310)

(declare-fun b_free!25697 () Bool)

(declare-fun b_next!25697 () Bool)

(assert (=> start!100310 (= b_free!25697 (not b_next!25697))))

(declare-fun tp!90039 () Bool)

(declare-fun b_and!42261 () Bool)

(assert (=> start!100310 (= tp!90039 b_and!42261)))

(declare-fun b!1197013 () Bool)

(declare-fun e!680045 () Bool)

(declare-fun e!680042 () Bool)

(assert (=> b!1197013 (= e!680045 e!680042)))

(declare-fun res!796626 () Bool)

(assert (=> b!1197013 (=> (not res!796626) (not e!680042))))

(declare-datatypes ((array!77533 0))(
  ( (array!77534 (arr!37413 (Array (_ BitVec 32) (_ BitVec 64))) (size!37949 (_ BitVec 32))) )
))
(declare-fun lt!543182 () array!77533)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77533 (_ BitVec 32)) Bool)

(assert (=> b!1197013 (= res!796626 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543182 mask!1564))))

(declare-fun _keys!1208 () array!77533)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1197013 (= lt!543182 (array!77534 (store (arr!37413 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37949 _keys!1208)))))

(declare-fun b!1197014 () Bool)

(declare-fun e!680047 () Bool)

(declare-fun tp_is_empty!30377 () Bool)

(assert (=> b!1197014 (= e!680047 tp_is_empty!30377)))

(declare-fun b!1197015 () Bool)

(declare-fun e!680043 () Bool)

(assert (=> b!1197015 (= e!680043 tp_is_empty!30377)))

(declare-fun b!1197016 () Bool)

(declare-fun e!680040 () Bool)

(declare-datatypes ((V!45629 0))(
  ( (V!45630 (val!15245 Int)) )
))
(declare-datatypes ((tuple2!19512 0))(
  ( (tuple2!19513 (_1!9767 (_ BitVec 64)) (_2!9767 V!45629)) )
))
(declare-datatypes ((List!26321 0))(
  ( (Nil!26318) (Cons!26317 (h!27526 tuple2!19512) (t!39010 List!26321)) )
))
(declare-datatypes ((ListLongMap!17481 0))(
  ( (ListLongMap!17482 (toList!8756 List!26321)) )
))
(declare-fun call!57213 () ListLongMap!17481)

(declare-fun call!57212 () ListLongMap!17481)

(assert (=> b!1197016 (= e!680040 (= call!57213 call!57212))))

(declare-fun b!1197017 () Bool)

(declare-fun res!796631 () Bool)

(assert (=> b!1197017 (=> (not res!796631) (not e!680045))))

(assert (=> b!1197017 (= res!796631 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37949 _keys!1208))))))

(declare-fun b!1197018 () Bool)

(declare-fun e!680046 () Bool)

(assert (=> b!1197018 (= e!680042 (not e!680046))))

(declare-fun res!796623 () Bool)

(assert (=> b!1197018 (=> res!796623 e!680046)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1197018 (= res!796623 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!37949 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77533 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1197018 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39692 0))(
  ( (Unit!39693) )
))
(declare-fun lt!543181 () Unit!39692)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77533 (_ BitVec 64) (_ BitVec 32)) Unit!39692)

(assert (=> b!1197018 (= lt!543181 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun zeroValue!944 () V!45629)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!57209 () Bool)

(declare-datatypes ((ValueCell!14479 0))(
  ( (ValueCellFull!14479 (v!17883 V!45629)) (EmptyCell!14479) )
))
(declare-datatypes ((array!77535 0))(
  ( (array!77536 (arr!37414 (Array (_ BitVec 32) ValueCell!14479)) (size!37950 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77535)

(declare-fun minValue!944 () V!45629)

(declare-fun getCurrentListMapNoExtraKeys!5196 (array!77533 array!77535 (_ BitVec 32) (_ BitVec 32) V!45629 V!45629 (_ BitVec 32) Int) ListLongMap!17481)

(assert (=> bm!57209 (= call!57212 (getCurrentListMapNoExtraKeys!5196 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1197019 () Bool)

(declare-fun res!796628 () Bool)

(assert (=> b!1197019 (=> (not res!796628) (not e!680045))))

(assert (=> b!1197019 (= res!796628 (= (select (arr!37413 _keys!1208) i!673) k!934))))

(declare-fun b!1197020 () Bool)

(declare-fun res!796632 () Bool)

(assert (=> b!1197020 (=> (not res!796632) (not e!680042))))

(declare-datatypes ((List!26322 0))(
  ( (Nil!26319) (Cons!26318 (h!27527 (_ BitVec 64)) (t!39011 List!26322)) )
))
(declare-fun arrayNoDuplicates!0 (array!77533 (_ BitVec 32) List!26322) Bool)

(assert (=> b!1197020 (= res!796632 (arrayNoDuplicates!0 lt!543182 #b00000000000000000000000000000000 Nil!26319))))

(declare-fun mapNonEmpty!47402 () Bool)

(declare-fun mapRes!47402 () Bool)

(declare-fun tp!90038 () Bool)

(assert (=> mapNonEmpty!47402 (= mapRes!47402 (and tp!90038 e!680047))))

(declare-fun mapValue!47402 () ValueCell!14479)

(declare-fun mapRest!47402 () (Array (_ BitVec 32) ValueCell!14479))

(declare-fun mapKey!47402 () (_ BitVec 32))

(assert (=> mapNonEmpty!47402 (= (arr!37414 _values!996) (store mapRest!47402 mapKey!47402 mapValue!47402))))

(declare-fun res!796633 () Bool)

(assert (=> start!100310 (=> (not res!796633) (not e!680045))))

(assert (=> start!100310 (= res!796633 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37949 _keys!1208))))))

(assert (=> start!100310 e!680045))

(assert (=> start!100310 tp_is_empty!30377))

(declare-fun array_inv!28512 (array!77533) Bool)

(assert (=> start!100310 (array_inv!28512 _keys!1208)))

(assert (=> start!100310 true))

(assert (=> start!100310 tp!90039))

(declare-fun e!680041 () Bool)

(declare-fun array_inv!28513 (array!77535) Bool)

(assert (=> start!100310 (and (array_inv!28513 _values!996) e!680041)))

(declare-fun b!1197021 () Bool)

(assert (=> b!1197021 (= e!680041 (and e!680043 mapRes!47402))))

(declare-fun condMapEmpty!47402 () Bool)

(declare-fun mapDefault!47402 () ValueCell!14479)

