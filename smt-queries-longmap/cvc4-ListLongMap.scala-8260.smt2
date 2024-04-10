; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100512 () Bool)

(assert start!100512)

(declare-fun b_free!25835 () Bool)

(declare-fun b_next!25835 () Bool)

(assert (=> start!100512 (= b_free!25835 (not b_next!25835))))

(declare-fun tp!90495 () Bool)

(declare-fun b_and!42557 () Bool)

(assert (=> start!100512 (= tp!90495 b_and!42557)))

(declare-fun b!1200883 () Bool)

(declare-fun e!681967 () Bool)

(assert (=> b!1200883 (= e!681967 true)))

(declare-datatypes ((V!45845 0))(
  ( (V!45846 (val!15326 Int)) )
))
(declare-datatypes ((tuple2!19624 0))(
  ( (tuple2!19625 (_1!9823 (_ BitVec 64)) (_2!9823 V!45845)) )
))
(declare-datatypes ((List!26442 0))(
  ( (Nil!26439) (Cons!26438 (h!27647 tuple2!19624) (t!39257 List!26442)) )
))
(declare-datatypes ((ListLongMap!17593 0))(
  ( (ListLongMap!17594 (toList!8812 List!26442)) )
))
(declare-fun lt!544209 () ListLongMap!17593)

(declare-fun zeroValue!944 () V!45845)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun contains!6871 (ListLongMap!17593 (_ BitVec 64)) Bool)

(declare-fun +!3950 (ListLongMap!17593 tuple2!19624) ListLongMap!17593)

(assert (=> b!1200883 (contains!6871 (+!3950 lt!544209 (tuple2!19625 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k!934)))

(declare-datatypes ((Unit!39812 0))(
  ( (Unit!39813) )
))
(declare-fun lt!544216 () Unit!39812)

(declare-fun addStillContains!977 (ListLongMap!17593 (_ BitVec 64) V!45845 (_ BitVec 64)) Unit!39812)

(assert (=> b!1200883 (= lt!544216 (addStillContains!977 lt!544209 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun b!1200884 () Bool)

(declare-fun e!681958 () Bool)

(declare-fun call!57335 () ListLongMap!17593)

(declare-fun call!57334 () ListLongMap!17593)

(assert (=> b!1200884 (= e!681958 (= call!57335 call!57334))))

(declare-fun b!1200885 () Bool)

(declare-fun -!1786 (ListLongMap!17593 (_ BitVec 64)) ListLongMap!17593)

(assert (=> b!1200885 (= e!681958 (= call!57335 (-!1786 call!57334 k!934)))))

(declare-fun b!1200886 () Bool)

(declare-fun res!799427 () Bool)

(assert (=> b!1200886 (=> res!799427 e!681967)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1200886 (= res!799427 (or (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1200887 () Bool)

(declare-fun res!799428 () Bool)

(declare-fun e!681963 () Bool)

(assert (=> b!1200887 (=> (not res!799428) (not e!681963))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1200887 (= res!799428 (validKeyInArray!0 k!934))))

(declare-fun b!1200888 () Bool)

(declare-fun e!681961 () Bool)

(assert (=> b!1200888 (= e!681961 e!681967)))

(declare-fun res!799426 () Bool)

(assert (=> b!1200888 (=> res!799426 e!681967)))

(assert (=> b!1200888 (= res!799426 (not (contains!6871 lt!544209 k!934)))))

(declare-datatypes ((array!77851 0))(
  ( (array!77852 (arr!37570 (Array (_ BitVec 32) (_ BitVec 64))) (size!38106 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77851)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14560 0))(
  ( (ValueCellFull!14560 (v!17964 V!45845)) (EmptyCell!14560) )
))
(declare-datatypes ((array!77853 0))(
  ( (array!77854 (arr!37571 (Array (_ BitVec 32) ValueCell!14560)) (size!38107 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77853)

(declare-fun minValue!944 () V!45845)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5251 (array!77851 array!77853 (_ BitVec 32) (_ BitVec 32) V!45845 V!45845 (_ BitVec 32) Int) ListLongMap!17593)

(assert (=> b!1200888 (= lt!544209 (getCurrentListMapNoExtraKeys!5251 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!799421 () Bool)

(assert (=> start!100512 (=> (not res!799421) (not e!681963))))

(assert (=> start!100512 (= res!799421 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38106 _keys!1208))))))

(assert (=> start!100512 e!681963))

(declare-fun tp_is_empty!30539 () Bool)

(assert (=> start!100512 tp_is_empty!30539))

(declare-fun array_inv!28632 (array!77851) Bool)

(assert (=> start!100512 (array_inv!28632 _keys!1208)))

(assert (=> start!100512 true))

(assert (=> start!100512 tp!90495))

(declare-fun e!681962 () Bool)

(declare-fun array_inv!28633 (array!77853) Bool)

(assert (=> start!100512 (and (array_inv!28633 _values!996) e!681962)))

(declare-fun b!1200889 () Bool)

(declare-fun res!799415 () Bool)

(declare-fun e!681965 () Bool)

(assert (=> b!1200889 (=> (not res!799415) (not e!681965))))

(declare-fun lt!544211 () array!77851)

(declare-datatypes ((List!26443 0))(
  ( (Nil!26440) (Cons!26439 (h!27648 (_ BitVec 64)) (t!39258 List!26443)) )
))
(declare-fun arrayNoDuplicates!0 (array!77851 (_ BitVec 32) List!26443) Bool)

(assert (=> b!1200889 (= res!799415 (arrayNoDuplicates!0 lt!544211 #b00000000000000000000000000000000 Nil!26440))))

(declare-fun b!1200890 () Bool)

(assert (=> b!1200890 (= e!681963 e!681965)))

(declare-fun res!799422 () Bool)

(assert (=> b!1200890 (=> (not res!799422) (not e!681965))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77851 (_ BitVec 32)) Bool)

(assert (=> b!1200890 (= res!799422 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544211 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1200890 (= lt!544211 (array!77852 (store (arr!37570 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38106 _keys!1208)))))

(declare-fun b!1200891 () Bool)

(declare-fun e!681960 () Bool)

(declare-fun mapRes!47651 () Bool)

(assert (=> b!1200891 (= e!681962 (and e!681960 mapRes!47651))))

(declare-fun condMapEmpty!47651 () Bool)

(declare-fun mapDefault!47651 () ValueCell!14560)

