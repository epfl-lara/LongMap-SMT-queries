; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99842 () Bool)

(assert start!99842)

(declare-fun b_free!25421 () Bool)

(declare-fun b_next!25421 () Bool)

(assert (=> start!99842 (= b_free!25421 (not b_next!25421))))

(declare-fun tp!88976 () Bool)

(declare-fun b_and!41709 () Bool)

(assert (=> start!99842 (= tp!88976 b_and!41709)))

(declare-fun b!1187337 () Bool)

(declare-fun e!675112 () Bool)

(assert (=> b!1187337 (= e!675112 true)))

(declare-datatypes ((V!45061 0))(
  ( (V!45062 (val!15032 Int)) )
))
(declare-datatypes ((tuple2!19296 0))(
  ( (tuple2!19297 (_1!9659 (_ BitVec 64)) (_2!9659 V!45061)) )
))
(declare-datatypes ((List!26036 0))(
  ( (Nil!26033) (Cons!26032 (h!27241 tuple2!19296) (t!38449 List!26036)) )
))
(declare-datatypes ((ListLongMap!17265 0))(
  ( (ListLongMap!17266 (toList!8648 List!26036)) )
))
(declare-fun lt!539751 () ListLongMap!17265)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun lt!539753 () ListLongMap!17265)

(declare-fun -!1679 (ListLongMap!17265 (_ BitVec 64)) ListLongMap!17265)

(assert (=> b!1187337 (= (-!1679 lt!539751 k!934) lt!539753)))

(declare-datatypes ((array!76697 0))(
  ( (array!76698 (arr!36998 (Array (_ BitVec 32) (_ BitVec 64))) (size!37534 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76697)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!539761 () V!45061)

(declare-fun lt!539768 () ListLongMap!17265)

(declare-datatypes ((Unit!39371 0))(
  ( (Unit!39372) )
))
(declare-fun lt!539769 () Unit!39371)

(declare-fun addRemoveCommutativeForDiffKeys!199 (ListLongMap!17265 (_ BitVec 64) V!45061 (_ BitVec 64)) Unit!39371)

(assert (=> b!1187337 (= lt!539769 (addRemoveCommutativeForDiffKeys!199 lt!539768 (select (arr!36998 _keys!1208) from!1455) lt!539761 k!934))))

(declare-fun lt!539756 () ListLongMap!17265)

(declare-fun lt!539767 () ListLongMap!17265)

(declare-fun lt!539754 () ListLongMap!17265)

(assert (=> b!1187337 (and (= lt!539767 lt!539751) (= lt!539754 lt!539756))))

(declare-fun lt!539759 () tuple2!19296)

(declare-fun +!3936 (ListLongMap!17265 tuple2!19296) ListLongMap!17265)

(assert (=> b!1187337 (= lt!539751 (+!3936 lt!539768 lt!539759))))

(assert (=> b!1187337 (not (= (select (arr!36998 _keys!1208) from!1455) k!934))))

(declare-fun lt!539760 () Unit!39371)

(declare-fun e!675118 () Unit!39371)

(assert (=> b!1187337 (= lt!539760 e!675118)))

(declare-fun c!117255 () Bool)

(assert (=> b!1187337 (= c!117255 (= (select (arr!36998 _keys!1208) from!1455) k!934))))

(declare-fun e!675107 () Bool)

(assert (=> b!1187337 e!675107))

(declare-fun res!789386 () Bool)

(assert (=> b!1187337 (=> (not res!789386) (not e!675107))))

(declare-fun lt!539766 () ListLongMap!17265)

(assert (=> b!1187337 (= res!789386 (= lt!539766 lt!539753))))

(assert (=> b!1187337 (= lt!539753 (+!3936 lt!539754 lt!539759))))

(assert (=> b!1187337 (= lt!539759 (tuple2!19297 (select (arr!36998 _keys!1208) from!1455) lt!539761))))

(declare-datatypes ((ValueCell!14266 0))(
  ( (ValueCellFull!14266 (v!17670 V!45061)) (EmptyCell!14266) )
))
(declare-datatypes ((array!76699 0))(
  ( (array!76700 (arr!36999 (Array (_ BitVec 32) ValueCell!14266)) (size!37535 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76699)

(declare-fun lt!539752 () V!45061)

(declare-fun get!18949 (ValueCell!14266 V!45061) V!45061)

(assert (=> b!1187337 (= lt!539761 (get!18949 (select (arr!36999 _values!996) from!1455) lt!539752))))

(declare-fun b!1187338 () Bool)

(declare-fun res!789382 () Bool)

(declare-fun e!675114 () Bool)

(assert (=> b!1187338 (=> (not res!789382) (not e!675114))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76697 (_ BitVec 32)) Bool)

(assert (=> b!1187338 (= res!789382 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1187339 () Bool)

(declare-fun Unit!39373 () Unit!39371)

(assert (=> b!1187339 (= e!675118 Unit!39373)))

(declare-fun b!1187340 () Bool)

(declare-fun res!789374 () Bool)

(assert (=> b!1187340 (=> (not res!789374) (not e!675114))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1187340 (= res!789374 (validKeyInArray!0 k!934))))

(declare-fun b!1187341 () Bool)

(declare-fun res!789376 () Bool)

(declare-fun e!675117 () Bool)

(assert (=> b!1187341 (=> (not res!789376) (not e!675117))))

(declare-fun lt!539764 () array!76697)

(declare-datatypes ((List!26037 0))(
  ( (Nil!26034) (Cons!26033 (h!27242 (_ BitVec 64)) (t!38450 List!26037)) )
))
(declare-fun arrayNoDuplicates!0 (array!76697 (_ BitVec 32) List!26037) Bool)

(assert (=> b!1187341 (= res!789376 (arrayNoDuplicates!0 lt!539764 #b00000000000000000000000000000000 Nil!26034))))

(declare-fun b!1187342 () Bool)

(assert (=> b!1187342 (= e!675114 e!675117)))

(declare-fun res!789385 () Bool)

(assert (=> b!1187342 (=> (not res!789385) (not e!675117))))

(assert (=> b!1187342 (= res!789385 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!539764 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1187342 (= lt!539764 (array!76698 (store (arr!36998 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37534 _keys!1208)))))

(declare-fun b!1187343 () Bool)

(declare-fun e!675109 () Bool)

(declare-fun e!675110 () Bool)

(declare-fun mapRes!46754 () Bool)

(assert (=> b!1187343 (= e!675109 (and e!675110 mapRes!46754))))

(declare-fun condMapEmpty!46754 () Bool)

(declare-fun mapDefault!46754 () ValueCell!14266)

