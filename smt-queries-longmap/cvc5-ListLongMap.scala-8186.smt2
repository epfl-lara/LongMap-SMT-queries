; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99982 () Bool)

(assert start!99982)

(declare-fun b_free!25561 () Bool)

(declare-fun b_next!25561 () Bool)

(assert (=> start!99982 (= b_free!25561 (not b_next!25561))))

(declare-fun tp!89397 () Bool)

(declare-fun b_and!41989 () Bool)

(assert (=> start!99982 (= tp!89397 b_and!41989)))

(declare-fun b!1190857 () Bool)

(declare-fun res!792040 () Bool)

(declare-fun e!676976 () Bool)

(assert (=> b!1190857 (=> (not res!792040) (not e!676976))))

(declare-datatypes ((array!76973 0))(
  ( (array!76974 (arr!37136 (Array (_ BitVec 32) (_ BitVec 64))) (size!37672 (_ BitVec 32))) )
))
(declare-fun lt!541610 () array!76973)

(declare-datatypes ((List!26149 0))(
  ( (Nil!26146) (Cons!26145 (h!27354 (_ BitVec 64)) (t!38702 List!26149)) )
))
(declare-fun arrayNoDuplicates!0 (array!76973 (_ BitVec 32) List!26149) Bool)

(assert (=> b!1190857 (= res!792040 (arrayNoDuplicates!0 lt!541610 #b00000000000000000000000000000000 Nil!26146))))

(declare-fun b!1190859 () Bool)

(declare-fun e!676974 () Bool)

(declare-fun tp_is_empty!30091 () Bool)

(assert (=> b!1190859 (= e!676974 tp_is_empty!30091)))

(declare-fun b!1190860 () Bool)

(declare-fun e!676971 () Bool)

(assert (=> b!1190860 (= e!676971 e!676976)))

(declare-fun res!792037 () Bool)

(assert (=> b!1190860 (=> (not res!792037) (not e!676976))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76973 (_ BitVec 32)) Bool)

(assert (=> b!1190860 (= res!792037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541610 mask!1564))))

(declare-fun _keys!1208 () array!76973)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1190860 (= lt!541610 (array!76974 (store (arr!37136 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37672 _keys!1208)))))

(declare-fun b!1190861 () Bool)

(declare-fun e!676978 () Bool)

(assert (=> b!1190861 (= e!676978 true)))

(declare-datatypes ((V!45249 0))(
  ( (V!45250 (val!15102 Int)) )
))
(declare-fun zeroValue!944 () V!45249)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun minValue!944 () V!45249)

(declare-datatypes ((ValueCell!14336 0))(
  ( (ValueCellFull!14336 (v!17740 V!45249)) (EmptyCell!14336) )
))
(declare-datatypes ((array!76975 0))(
  ( (array!76976 (arr!37137 (Array (_ BitVec 32) ValueCell!14336)) (size!37673 (_ BitVec 32))) )
))
(declare-fun lt!541611 () array!76975)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun _values!996 () array!76975)

(declare-datatypes ((tuple2!19404 0))(
  ( (tuple2!19405 (_1!9713 (_ BitVec 64)) (_2!9713 V!45249)) )
))
(declare-datatypes ((List!26150 0))(
  ( (Nil!26147) (Cons!26146 (h!27355 tuple2!19404) (t!38703 List!26150)) )
))
(declare-datatypes ((ListLongMap!17373 0))(
  ( (ListLongMap!17374 (toList!8702 List!26150)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5143 (array!76973 array!76975 (_ BitVec 32) (_ BitVec 32) V!45249 V!45249 (_ BitVec 32) Int) ListLongMap!17373)

(declare-fun -!1728 (ListLongMap!17373 (_ BitVec 64)) ListLongMap!17373)

(assert (=> b!1190861 (= (getCurrentListMapNoExtraKeys!5143 lt!541610 lt!541611 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1728 (getCurrentListMapNoExtraKeys!5143 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-datatypes ((Unit!39502 0))(
  ( (Unit!39503) )
))
(declare-fun lt!541609 () Unit!39502)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!937 (array!76973 array!76975 (_ BitVec 32) (_ BitVec 32) V!45249 V!45249 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39502)

(assert (=> b!1190861 (= lt!541609 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!937 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1190862 () Bool)

(declare-fun res!792039 () Bool)

(assert (=> b!1190862 (=> (not res!792039) (not e!676971))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1190862 (= res!792039 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!46964 () Bool)

(declare-fun mapRes!46964 () Bool)

(assert (=> mapIsEmpty!46964 mapRes!46964))

(declare-fun b!1190863 () Bool)

(declare-fun e!676977 () Bool)

(assert (=> b!1190863 (= e!676977 tp_is_empty!30091)))

(declare-fun b!1190864 () Bool)

(declare-fun res!792042 () Bool)

(assert (=> b!1190864 (=> (not res!792042) (not e!676971))))

(assert (=> b!1190864 (= res!792042 (and (= (size!37673 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37672 _keys!1208) (size!37673 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1190865 () Bool)

(declare-fun res!792036 () Bool)

(assert (=> b!1190865 (=> (not res!792036) (not e!676971))))

(assert (=> b!1190865 (= res!792036 (= (select (arr!37136 _keys!1208) i!673) k!934))))

(declare-fun b!1190866 () Bool)

(declare-fun e!676972 () Bool)

(assert (=> b!1190866 (= e!676976 (not e!676972))))

(declare-fun res!792032 () Bool)

(assert (=> b!1190866 (=> res!792032 e!676972)))

(assert (=> b!1190866 (= res!792032 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76973 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1190866 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!541613 () Unit!39502)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76973 (_ BitVec 64) (_ BitVec 32)) Unit!39502)

(assert (=> b!1190866 (= lt!541613 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun res!792034 () Bool)

(assert (=> start!99982 (=> (not res!792034) (not e!676971))))

(assert (=> start!99982 (= res!792034 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37672 _keys!1208))))))

(assert (=> start!99982 e!676971))

(assert (=> start!99982 tp_is_empty!30091))

(declare-fun array_inv!28320 (array!76973) Bool)

(assert (=> start!99982 (array_inv!28320 _keys!1208)))

(assert (=> start!99982 true))

(assert (=> start!99982 tp!89397))

(declare-fun e!676975 () Bool)

(declare-fun array_inv!28321 (array!76975) Bool)

(assert (=> start!99982 (and (array_inv!28321 _values!996) e!676975)))

(declare-fun b!1190858 () Bool)

(assert (=> b!1190858 (= e!676975 (and e!676977 mapRes!46964))))

(declare-fun condMapEmpty!46964 () Bool)

(declare-fun mapDefault!46964 () ValueCell!14336)

