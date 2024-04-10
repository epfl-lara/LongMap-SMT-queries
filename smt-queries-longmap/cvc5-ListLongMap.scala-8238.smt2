; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100358 () Bool)

(assert start!100358)

(declare-fun b!1197722 () Bool)

(declare-fun res!797092 () Bool)

(declare-fun e!680404 () Bool)

(assert (=> b!1197722 (=> (not res!797092) (not e!680404))))

(declare-datatypes ((array!77583 0))(
  ( (array!77584 (arr!37437 (Array (_ BitVec 32) (_ BitVec 64))) (size!37973 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77583)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1197722 (= res!797092 (= (select (arr!37437 _keys!1208) i!673) k!934))))

(declare-fun b!1197723 () Bool)

(declare-fun e!680402 () Bool)

(assert (=> b!1197723 (= e!680404 e!680402)))

(declare-fun res!797094 () Bool)

(assert (=> b!1197723 (=> (not res!797094) (not e!680402))))

(declare-fun lt!543342 () array!77583)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77583 (_ BitVec 32)) Bool)

(assert (=> b!1197723 (= res!797094 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543342 mask!1564))))

(assert (=> b!1197723 (= lt!543342 (array!77584 (store (arr!37437 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37973 _keys!1208)))))

(declare-fun b!1197724 () Bool)

(declare-fun res!797088 () Bool)

(assert (=> b!1197724 (=> (not res!797088) (not e!680404))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1197724 (= res!797088 (validKeyInArray!0 k!934))))

(declare-fun mapNonEmpty!47444 () Bool)

(declare-fun mapRes!47444 () Bool)

(declare-fun tp!90099 () Bool)

(declare-fun e!680401 () Bool)

(assert (=> mapNonEmpty!47444 (= mapRes!47444 (and tp!90099 e!680401))))

(declare-datatypes ((V!45665 0))(
  ( (V!45666 (val!15258 Int)) )
))
(declare-datatypes ((ValueCell!14492 0))(
  ( (ValueCellFull!14492 (v!17896 V!45665)) (EmptyCell!14492) )
))
(declare-fun mapRest!47444 () (Array (_ BitVec 32) ValueCell!14492))

(declare-fun mapValue!47444 () ValueCell!14492)

(declare-fun mapKey!47444 () (_ BitVec 32))

(declare-datatypes ((array!77585 0))(
  ( (array!77586 (arr!37438 (Array (_ BitVec 32) ValueCell!14492)) (size!37974 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77585)

(assert (=> mapNonEmpty!47444 (= (arr!37438 _values!996) (store mapRest!47444 mapKey!47444 mapValue!47444))))

(declare-fun b!1197725 () Bool)

(declare-fun res!797089 () Bool)

(assert (=> b!1197725 (=> (not res!797089) (not e!680402))))

(declare-datatypes ((List!26338 0))(
  ( (Nil!26335) (Cons!26334 (h!27543 (_ BitVec 64)) (t!39039 List!26338)) )
))
(declare-fun arrayNoDuplicates!0 (array!77583 (_ BitVec 32) List!26338) Bool)

(assert (=> b!1197725 (= res!797089 (arrayNoDuplicates!0 lt!543342 #b00000000000000000000000000000000 Nil!26335))))

(declare-fun b!1197726 () Bool)

(declare-fun res!797086 () Bool)

(assert (=> b!1197726 (=> (not res!797086) (not e!680404))))

(assert (=> b!1197726 (= res!797086 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!797087 () Bool)

(assert (=> start!100358 (=> (not res!797087) (not e!680404))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100358 (= res!797087 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37973 _keys!1208))))))

(assert (=> start!100358 e!680404))

(declare-fun array_inv!28532 (array!77583) Bool)

(assert (=> start!100358 (array_inv!28532 _keys!1208)))

(assert (=> start!100358 true))

(declare-fun e!680400 () Bool)

(declare-fun array_inv!28533 (array!77585) Bool)

(assert (=> start!100358 (and (array_inv!28533 _values!996) e!680400)))

(declare-fun b!1197727 () Bool)

(declare-fun res!797093 () Bool)

(assert (=> b!1197727 (=> (not res!797093) (not e!680404))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1197727 (= res!797093 (validMask!0 mask!1564))))

(declare-fun b!1197728 () Bool)

(declare-fun res!797085 () Bool)

(assert (=> b!1197728 (=> (not res!797085) (not e!680404))))

(assert (=> b!1197728 (= res!797085 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26335))))

(declare-fun mapIsEmpty!47444 () Bool)

(assert (=> mapIsEmpty!47444 mapRes!47444))

(declare-fun b!1197729 () Bool)

(declare-fun e!680403 () Bool)

(declare-fun tp_is_empty!30403 () Bool)

(assert (=> b!1197729 (= e!680403 tp_is_empty!30403)))

(declare-fun b!1197730 () Bool)

(declare-fun res!797090 () Bool)

(assert (=> b!1197730 (=> (not res!797090) (not e!680404))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1197730 (= res!797090 (and (= (size!37974 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37973 _keys!1208) (size!37974 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1197731 () Bool)

(declare-fun res!797091 () Bool)

(assert (=> b!1197731 (=> (not res!797091) (not e!680404))))

(assert (=> b!1197731 (= res!797091 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37973 _keys!1208))))))

(declare-fun b!1197732 () Bool)

(assert (=> b!1197732 (= e!680402 (not true))))

(declare-fun arrayContainsKey!0 (array!77583 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1197732 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39712 0))(
  ( (Unit!39713) )
))
(declare-fun lt!543341 () Unit!39712)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77583 (_ BitVec 64) (_ BitVec 32)) Unit!39712)

(assert (=> b!1197732 (= lt!543341 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1197733 () Bool)

(assert (=> b!1197733 (= e!680401 tp_is_empty!30403)))

(declare-fun b!1197734 () Bool)

(assert (=> b!1197734 (= e!680400 (and e!680403 mapRes!47444))))

(declare-fun condMapEmpty!47444 () Bool)

(declare-fun mapDefault!47444 () ValueCell!14492)

