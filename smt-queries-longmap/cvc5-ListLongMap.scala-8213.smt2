; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100144 () Bool)

(assert start!100144)

(declare-fun b!1194348 () Bool)

(declare-fun e!678763 () Bool)

(declare-fun e!678761 () Bool)

(assert (=> b!1194348 (= e!678763 e!678761)))

(declare-fun res!794657 () Bool)

(assert (=> b!1194348 (=> (not res!794657) (not e!678761))))

(declare-datatypes ((array!77285 0))(
  ( (array!77286 (arr!37292 (Array (_ BitVec 32) (_ BitVec 64))) (size!37828 (_ BitVec 32))) )
))
(declare-fun lt!542760 () array!77285)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77285 (_ BitVec 32)) Bool)

(assert (=> b!1194348 (= res!794657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542760 mask!1564))))

(declare-fun _keys!1208 () array!77285)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1194348 (= lt!542760 (array!77286 (store (arr!37292 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37828 _keys!1208)))))

(declare-fun b!1194349 () Bool)

(declare-fun res!794656 () Bool)

(assert (=> b!1194349 (=> (not res!794656) (not e!678763))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1194349 (= res!794656 (validKeyInArray!0 k!934))))

(declare-fun b!1194350 () Bool)

(declare-fun e!678758 () Bool)

(declare-fun tp_is_empty!30253 () Bool)

(assert (=> b!1194350 (= e!678758 tp_is_empty!30253)))

(declare-fun res!794658 () Bool)

(assert (=> start!100144 (=> (not res!794658) (not e!678763))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100144 (= res!794658 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37828 _keys!1208))))))

(assert (=> start!100144 e!678763))

(declare-fun array_inv!28428 (array!77285) Bool)

(assert (=> start!100144 (array_inv!28428 _keys!1208)))

(assert (=> start!100144 true))

(declare-datatypes ((V!45465 0))(
  ( (V!45466 (val!15183 Int)) )
))
(declare-datatypes ((ValueCell!14417 0))(
  ( (ValueCellFull!14417 (v!17821 V!45465)) (EmptyCell!14417) )
))
(declare-datatypes ((array!77287 0))(
  ( (array!77288 (arr!37293 (Array (_ BitVec 32) ValueCell!14417)) (size!37829 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77287)

(declare-fun e!678760 () Bool)

(declare-fun array_inv!28429 (array!77287) Bool)

(assert (=> start!100144 (and (array_inv!28429 _values!996) e!678760)))

(declare-fun b!1194351 () Bool)

(declare-fun res!794665 () Bool)

(assert (=> b!1194351 (=> (not res!794665) (not e!678763))))

(assert (=> b!1194351 (= res!794665 (= (select (arr!37292 _keys!1208) i!673) k!934))))

(declare-fun b!1194352 () Bool)

(declare-fun res!794660 () Bool)

(assert (=> b!1194352 (=> (not res!794660) (not e!678761))))

(declare-datatypes ((List!26260 0))(
  ( (Nil!26257) (Cons!26256 (h!27465 (_ BitVec 64)) (t!38931 List!26260)) )
))
(declare-fun arrayNoDuplicates!0 (array!77285 (_ BitVec 32) List!26260) Bool)

(assert (=> b!1194352 (= res!794660 (arrayNoDuplicates!0 lt!542760 #b00000000000000000000000000000000 Nil!26257))))

(declare-fun b!1194353 () Bool)

(declare-fun res!794664 () Bool)

(assert (=> b!1194353 (=> (not res!794664) (not e!678763))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1194353 (= res!794664 (and (= (size!37829 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37828 _keys!1208) (size!37829 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1194354 () Bool)

(declare-fun res!794661 () Bool)

(assert (=> b!1194354 (=> (not res!794661) (not e!678763))))

(assert (=> b!1194354 (= res!794661 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1194355 () Bool)

(declare-fun res!794663 () Bool)

(assert (=> b!1194355 (=> (not res!794663) (not e!678763))))

(assert (=> b!1194355 (= res!794663 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26257))))

(declare-fun b!1194356 () Bool)

(assert (=> b!1194356 (= e!678761 (bvsge (size!37828 _keys!1208) #b01111111111111111111111111111111))))

(declare-fun b!1194357 () Bool)

(declare-fun e!678762 () Bool)

(declare-fun mapRes!47207 () Bool)

(assert (=> b!1194357 (= e!678760 (and e!678762 mapRes!47207))))

(declare-fun condMapEmpty!47207 () Bool)

(declare-fun mapDefault!47207 () ValueCell!14417)

