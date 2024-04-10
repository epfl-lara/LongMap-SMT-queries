; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101236 () Bool)

(assert start!101236)

(declare-fun b_free!26159 () Bool)

(declare-fun b_next!26159 () Bool)

(assert (=> start!101236 (= b_free!26159 (not b_next!26159))))

(declare-fun tp!91499 () Bool)

(declare-fun b_and!43435 () Bool)

(assert (=> start!101236 (= tp!91499 b_and!43435)))

(declare-fun mapIsEmpty!48169 () Bool)

(declare-fun mapRes!48169 () Bool)

(assert (=> mapIsEmpty!48169 mapRes!48169))

(declare-fun b!1215772 () Bool)

(declare-fun e!690301 () Bool)

(declare-fun tp_is_empty!30863 () Bool)

(assert (=> b!1215772 (= e!690301 tp_is_empty!30863)))

(declare-fun b!1215773 () Bool)

(declare-fun res!807256 () Bool)

(declare-fun e!690303 () Bool)

(assert (=> b!1215773 (=> (not res!807256) (not e!690303))))

(declare-datatypes ((array!78499 0))(
  ( (array!78500 (arr!37884 (Array (_ BitVec 32) (_ BitVec 64))) (size!38420 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78499)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78499 (_ BitVec 32)) Bool)

(assert (=> b!1215773 (= res!807256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1215774 () Bool)

(declare-fun res!807255 () Bool)

(assert (=> b!1215774 (=> (not res!807255) (not e!690303))))

(declare-datatypes ((List!26708 0))(
  ( (Nil!26705) (Cons!26704 (h!27913 (_ BitVec 64)) (t!39847 List!26708)) )
))
(declare-fun arrayNoDuplicates!0 (array!78499 (_ BitVec 32) List!26708) Bool)

(assert (=> b!1215774 (= res!807255 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26705))))

(declare-fun b!1215775 () Bool)

(declare-fun res!807261 () Bool)

(declare-fun e!690304 () Bool)

(assert (=> b!1215775 (=> (not res!807261) (not e!690304))))

(declare-fun lt!552705 () array!78499)

(assert (=> b!1215775 (= res!807261 (arrayNoDuplicates!0 lt!552705 #b00000000000000000000000000000000 Nil!26705))))

(declare-fun b!1215776 () Bool)

(declare-fun e!690307 () Bool)

(assert (=> b!1215776 (= e!690307 true)))

(declare-datatypes ((V!46277 0))(
  ( (V!46278 (val!15488 Int)) )
))
(declare-fun zeroValue!944 () V!46277)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14722 0))(
  ( (ValueCellFull!14722 (v!18141 V!46277)) (EmptyCell!14722) )
))
(declare-datatypes ((array!78501 0))(
  ( (array!78502 (arr!37885 (Array (_ BitVec 32) ValueCell!14722)) (size!38421 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78501)

(declare-fun minValue!944 () V!46277)

(declare-datatypes ((tuple2!19906 0))(
  ( (tuple2!19907 (_1!9964 (_ BitVec 64)) (_2!9964 V!46277)) )
))
(declare-datatypes ((List!26709 0))(
  ( (Nil!26706) (Cons!26705 (h!27914 tuple2!19906) (t!39848 List!26709)) )
))
(declare-datatypes ((ListLongMap!17875 0))(
  ( (ListLongMap!17876 (toList!8953 List!26709)) )
))
(declare-fun lt!552708 () ListLongMap!17875)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5380 (array!78499 array!78501 (_ BitVec 32) (_ BitVec 32) V!46277 V!46277 (_ BitVec 32) Int) ListLongMap!17875)

(declare-fun dynLambda!3269 (Int (_ BitVec 64)) V!46277)

(assert (=> b!1215776 (= lt!552708 (getCurrentListMapNoExtraKeys!5380 lt!552705 (array!78502 (store (arr!37885 _values!996) i!673 (ValueCellFull!14722 (dynLambda!3269 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38421 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!552707 () ListLongMap!17875)

(assert (=> b!1215776 (= lt!552707 (getCurrentListMapNoExtraKeys!5380 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1215777 () Bool)

(declare-fun res!807254 () Bool)

(assert (=> b!1215777 (=> (not res!807254) (not e!690303))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1215777 (= res!807254 (= (select (arr!37884 _keys!1208) i!673) k!934))))

(declare-fun b!1215778 () Bool)

(assert (=> b!1215778 (= e!690304 (not e!690307))))

(declare-fun res!807258 () Bool)

(assert (=> b!1215778 (=> res!807258 e!690307)))

(assert (=> b!1215778 (= res!807258 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78499 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1215778 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40310 0))(
  ( (Unit!40311) )
))
(declare-fun lt!552706 () Unit!40310)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78499 (_ BitVec 64) (_ BitVec 32)) Unit!40310)

(assert (=> b!1215778 (= lt!552706 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1215779 () Bool)

(declare-fun e!690306 () Bool)

(declare-fun e!690302 () Bool)

(assert (=> b!1215779 (= e!690306 (and e!690302 mapRes!48169))))

(declare-fun condMapEmpty!48169 () Bool)

(declare-fun mapDefault!48169 () ValueCell!14722)

