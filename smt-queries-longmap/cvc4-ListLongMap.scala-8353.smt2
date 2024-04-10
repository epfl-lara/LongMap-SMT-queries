; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101704 () Bool)

(assert start!101704)

(declare-fun b_free!26393 () Bool)

(declare-fun b_next!26393 () Bool)

(assert (=> start!101704 (= b_free!26393 (not b_next!26393))))

(declare-fun tp!92225 () Bool)

(declare-fun b_and!44047 () Bool)

(assert (=> start!101704 (= tp!92225 b_and!44047)))

(declare-fun b!1223572 () Bool)

(declare-fun e!694917 () Bool)

(declare-fun tp_is_empty!31097 () Bool)

(assert (=> b!1223572 (= e!694917 tp_is_empty!31097)))

(declare-datatypes ((array!78977 0))(
  ( (array!78978 (arr!38115 (Array (_ BitVec 32) (_ BitVec 64))) (size!38651 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78977)

(declare-fun e!694919 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun b!1223573 () Bool)

(declare-fun arrayContainsKey!0 (array!78977 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1223573 (= e!694919 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1223575 () Bool)

(declare-fun e!694920 () Bool)

(declare-fun e!694926 () Bool)

(assert (=> b!1223575 (= e!694920 e!694926)))

(declare-fun res!812993 () Bool)

(assert (=> b!1223575 (=> res!812993 e!694926)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1223575 (= res!812993 (not (validKeyInArray!0 (select (arr!38115 _keys!1208) from!1455))))))

(declare-datatypes ((V!46589 0))(
  ( (V!46590 (val!15605 Int)) )
))
(declare-datatypes ((tuple2!20106 0))(
  ( (tuple2!20107 (_1!10064 (_ BitVec 64)) (_2!10064 V!46589)) )
))
(declare-datatypes ((List!26907 0))(
  ( (Nil!26904) (Cons!26903 (h!28112 tuple2!20106) (t!40280 List!26907)) )
))
(declare-datatypes ((ListLongMap!18075 0))(
  ( (ListLongMap!18076 (toList!9053 List!26907)) )
))
(declare-fun lt!556940 () ListLongMap!18075)

(declare-fun lt!556938 () ListLongMap!18075)

(assert (=> b!1223575 (= lt!556940 lt!556938)))

(declare-fun lt!556932 () ListLongMap!18075)

(declare-fun -!1955 (ListLongMap!18075 (_ BitVec 64)) ListLongMap!18075)

(assert (=> b!1223575 (= lt!556938 (-!1955 lt!556932 k!934))))

(declare-fun zeroValue!944 () V!46589)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46589)

(declare-fun lt!556933 () array!78977)

(declare-datatypes ((ValueCell!14839 0))(
  ( (ValueCellFull!14839 (v!18267 V!46589)) (EmptyCell!14839) )
))
(declare-datatypes ((array!78979 0))(
  ( (array!78980 (arr!38116 (Array (_ BitVec 32) ValueCell!14839)) (size!38652 (_ BitVec 32))) )
))
(declare-fun lt!556942 () array!78979)

(declare-fun getCurrentListMapNoExtraKeys!5475 (array!78977 array!78979 (_ BitVec 32) (_ BitVec 32) V!46589 V!46589 (_ BitVec 32) Int) ListLongMap!18075)

(assert (=> b!1223575 (= lt!556940 (getCurrentListMapNoExtraKeys!5475 lt!556933 lt!556942 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!78979)

(assert (=> b!1223575 (= lt!556932 (getCurrentListMapNoExtraKeys!5475 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!40536 0))(
  ( (Unit!40537) )
))
(declare-fun lt!556944 () Unit!40536)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1162 (array!78977 array!78979 (_ BitVec 32) (_ BitVec 32) V!46589 V!46589 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40536)

(assert (=> b!1223575 (= lt!556944 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1162 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1223576 () Bool)

(declare-fun res!812992 () Bool)

(declare-fun e!694916 () Bool)

(assert (=> b!1223576 (=> (not res!812992) (not e!694916))))

(declare-datatypes ((List!26908 0))(
  ( (Nil!26905) (Cons!26904 (h!28113 (_ BitVec 64)) (t!40281 List!26908)) )
))
(declare-fun arrayNoDuplicates!0 (array!78977 (_ BitVec 32) List!26908) Bool)

(assert (=> b!1223576 (= res!812992 (arrayNoDuplicates!0 lt!556933 #b00000000000000000000000000000000 Nil!26905))))

(declare-fun b!1223577 () Bool)

(declare-fun res!812981 () Bool)

(declare-fun e!694918 () Bool)

(assert (=> b!1223577 (=> (not res!812981) (not e!694918))))

(assert (=> b!1223577 (= res!812981 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26905))))

(declare-fun mapNonEmpty!48544 () Bool)

(declare-fun mapRes!48544 () Bool)

(declare-fun tp!92224 () Bool)

(declare-fun e!694927 () Bool)

(assert (=> mapNonEmpty!48544 (= mapRes!48544 (and tp!92224 e!694927))))

(declare-fun mapRest!48544 () (Array (_ BitVec 32) ValueCell!14839))

(declare-fun mapKey!48544 () (_ BitVec 32))

(declare-fun mapValue!48544 () ValueCell!14839)

(assert (=> mapNonEmpty!48544 (= (arr!38116 _values!996) (store mapRest!48544 mapKey!48544 mapValue!48544))))

(declare-fun b!1223578 () Bool)

(assert (=> b!1223578 (= e!694918 e!694916)))

(declare-fun res!812983 () Bool)

(assert (=> b!1223578 (=> (not res!812983) (not e!694916))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78977 (_ BitVec 32)) Bool)

(assert (=> b!1223578 (= res!812983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!556933 mask!1564))))

(assert (=> b!1223578 (= lt!556933 (array!78978 (store (arr!38115 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38651 _keys!1208)))))

(declare-fun b!1223579 () Bool)

(declare-fun e!694915 () Bool)

(assert (=> b!1223579 (= e!694915 (and e!694917 mapRes!48544))))

(declare-fun condMapEmpty!48544 () Bool)

(declare-fun mapDefault!48544 () ValueCell!14839)

