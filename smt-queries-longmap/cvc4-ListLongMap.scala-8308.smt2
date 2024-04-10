; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101200 () Bool)

(assert start!101200)

(declare-fun b_free!26123 () Bool)

(declare-fun b_next!26123 () Bool)

(assert (=> start!101200 (= b_free!26123 (not b_next!26123))))

(declare-fun tp!91391 () Bool)

(declare-fun b_and!43363 () Bool)

(assert (=> start!101200 (= tp!91391 b_and!43363)))

(declare-fun b!1214980 () Bool)

(declare-fun e!689926 () Bool)

(declare-fun e!689925 () Bool)

(assert (=> b!1214980 (= e!689926 (not e!689925))))

(declare-fun res!806667 () Bool)

(assert (=> b!1214980 (=> res!806667 e!689925)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1214980 (= res!806667 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!78433 0))(
  ( (array!78434 (arr!37851 (Array (_ BitVec 32) (_ BitVec 64))) (size!38387 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78433)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78433 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1214980 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40288 0))(
  ( (Unit!40289) )
))
(declare-fun lt!552491 () Unit!40288)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78433 (_ BitVec 64) (_ BitVec 32)) Unit!40288)

(assert (=> b!1214980 (= lt!552491 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun res!806661 () Bool)

(declare-fun e!689928 () Bool)

(assert (=> start!101200 (=> (not res!806661) (not e!689928))))

(assert (=> start!101200 (= res!806661 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38387 _keys!1208))))))

(assert (=> start!101200 e!689928))

(declare-fun tp_is_empty!30827 () Bool)

(assert (=> start!101200 tp_is_empty!30827))

(declare-fun array_inv!28822 (array!78433) Bool)

(assert (=> start!101200 (array_inv!28822 _keys!1208)))

(assert (=> start!101200 true))

(assert (=> start!101200 tp!91391))

(declare-datatypes ((V!46229 0))(
  ( (V!46230 (val!15470 Int)) )
))
(declare-datatypes ((ValueCell!14704 0))(
  ( (ValueCellFull!14704 (v!18123 V!46229)) (EmptyCell!14704) )
))
(declare-datatypes ((array!78435 0))(
  ( (array!78436 (arr!37852 (Array (_ BitVec 32) ValueCell!14704)) (size!38388 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78435)

(declare-fun e!689929 () Bool)

(declare-fun array_inv!28823 (array!78435) Bool)

(assert (=> start!101200 (and (array_inv!28823 _values!996) e!689929)))

(declare-fun b!1214981 () Bool)

(declare-fun res!806668 () Bool)

(assert (=> b!1214981 (=> (not res!806668) (not e!689926))))

(declare-fun lt!552492 () array!78433)

(declare-datatypes ((List!26685 0))(
  ( (Nil!26682) (Cons!26681 (h!27890 (_ BitVec 64)) (t!39788 List!26685)) )
))
(declare-fun arrayNoDuplicates!0 (array!78433 (_ BitVec 32) List!26685) Bool)

(assert (=> b!1214981 (= res!806668 (arrayNoDuplicates!0 lt!552492 #b00000000000000000000000000000000 Nil!26682))))

(declare-fun b!1214982 () Bool)

(declare-fun res!806666 () Bool)

(assert (=> b!1214982 (=> (not res!806666) (not e!689928))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78433 (_ BitVec 32)) Bool)

(assert (=> b!1214982 (= res!806666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1214983 () Bool)

(declare-fun res!806662 () Bool)

(assert (=> b!1214983 (=> (not res!806662) (not e!689928))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1214983 (= res!806662 (validMask!0 mask!1564))))

(declare-fun b!1214984 () Bool)

(declare-fun res!806659 () Bool)

(assert (=> b!1214984 (=> (not res!806659) (not e!689928))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1214984 (= res!806659 (and (= (size!38388 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38387 _keys!1208) (size!38388 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1214985 () Bool)

(declare-fun e!689923 () Bool)

(assert (=> b!1214985 (= e!689923 tp_is_empty!30827)))

(declare-fun b!1214986 () Bool)

(assert (=> b!1214986 (= e!689928 e!689926)))

(declare-fun res!806669 () Bool)

(assert (=> b!1214986 (=> (not res!806669) (not e!689926))))

(assert (=> b!1214986 (= res!806669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552492 mask!1564))))

(assert (=> b!1214986 (= lt!552492 (array!78434 (store (arr!37851 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38387 _keys!1208)))))

(declare-fun b!1214987 () Bool)

(declare-fun res!806663 () Bool)

(assert (=> b!1214987 (=> (not res!806663) (not e!689928))))

(assert (=> b!1214987 (= res!806663 (= (select (arr!37851 _keys!1208) i!673) k!934))))

(declare-fun b!1214988 () Bool)

(assert (=> b!1214988 (= e!689925 true)))

(declare-fun zeroValue!944 () V!46229)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46229)

(declare-datatypes ((tuple2!19886 0))(
  ( (tuple2!19887 (_1!9954 (_ BitVec 64)) (_2!9954 V!46229)) )
))
(declare-datatypes ((List!26686 0))(
  ( (Nil!26683) (Cons!26682 (h!27891 tuple2!19886) (t!39789 List!26686)) )
))
(declare-datatypes ((ListLongMap!17855 0))(
  ( (ListLongMap!17856 (toList!8943 List!26686)) )
))
(declare-fun lt!552490 () ListLongMap!17855)

(declare-fun getCurrentListMapNoExtraKeys!5370 (array!78433 array!78435 (_ BitVec 32) (_ BitVec 32) V!46229 V!46229 (_ BitVec 32) Int) ListLongMap!17855)

(declare-fun dynLambda!3259 (Int (_ BitVec 64)) V!46229)

(assert (=> b!1214988 (= lt!552490 (getCurrentListMapNoExtraKeys!5370 lt!552492 (array!78436 (store (arr!37852 _values!996) i!673 (ValueCellFull!14704 (dynLambda!3259 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38388 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!552489 () ListLongMap!17855)

(assert (=> b!1214988 (= lt!552489 (getCurrentListMapNoExtraKeys!5370 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1214989 () Bool)

(declare-fun mapRes!48115 () Bool)

(assert (=> b!1214989 (= e!689929 (and e!689923 mapRes!48115))))

(declare-fun condMapEmpty!48115 () Bool)

(declare-fun mapDefault!48115 () ValueCell!14704)

