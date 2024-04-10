; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100136 () Bool)

(assert start!100136)

(declare-fun res!794548 () Bool)

(declare-fun e!678690 () Bool)

(assert (=> start!100136 (=> (not res!794548) (not e!678690))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!77269 0))(
  ( (array!77270 (arr!37284 (Array (_ BitVec 32) (_ BitVec 64))) (size!37820 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77269)

(assert (=> start!100136 (= res!794548 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37820 _keys!1208))))))

(assert (=> start!100136 e!678690))

(declare-fun array_inv!28424 (array!77269) Bool)

(assert (=> start!100136 (array_inv!28424 _keys!1208)))

(assert (=> start!100136 true))

(declare-datatypes ((V!45453 0))(
  ( (V!45454 (val!15179 Int)) )
))
(declare-datatypes ((ValueCell!14413 0))(
  ( (ValueCellFull!14413 (v!17817 V!45453)) (EmptyCell!14413) )
))
(declare-datatypes ((array!77271 0))(
  ( (array!77272 (arr!37285 (Array (_ BitVec 32) ValueCell!14413)) (size!37821 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77271)

(declare-fun e!678686 () Bool)

(declare-fun array_inv!28425 (array!77271) Bool)

(assert (=> start!100136 (and (array_inv!28425 _values!996) e!678686)))

(declare-fun b!1194202 () Bool)

(declare-fun e!678687 () Bool)

(assert (=> b!1194202 (= e!678690 e!678687)))

(declare-fun res!794550 () Bool)

(assert (=> b!1194202 (=> (not res!794550) (not e!678687))))

(declare-fun lt!542738 () array!77269)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77269 (_ BitVec 32)) Bool)

(assert (=> b!1194202 (= res!794550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542738 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1194202 (= lt!542738 (array!77270 (store (arr!37284 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37820 _keys!1208)))))

(declare-fun b!1194203 () Bool)

(declare-fun e!678691 () Bool)

(declare-fun tp_is_empty!30245 () Bool)

(assert (=> b!1194203 (= e!678691 tp_is_empty!30245)))

(declare-fun b!1194204 () Bool)

(declare-fun res!794546 () Bool)

(assert (=> b!1194204 (=> (not res!794546) (not e!678690))))

(assert (=> b!1194204 (= res!794546 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37820 _keys!1208))))))

(declare-fun b!1194205 () Bool)

(declare-fun res!794547 () Bool)

(assert (=> b!1194205 (=> (not res!794547) (not e!678690))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1194205 (= res!794547 (= (select (arr!37284 _keys!1208) i!673) k!934))))

(declare-fun b!1194206 () Bool)

(assert (=> b!1194206 (= e!678687 false)))

(declare-fun lt!542739 () Bool)

(declare-datatypes ((List!26256 0))(
  ( (Nil!26253) (Cons!26252 (h!27461 (_ BitVec 64)) (t!38927 List!26256)) )
))
(declare-fun arrayNoDuplicates!0 (array!77269 (_ BitVec 32) List!26256) Bool)

(assert (=> b!1194206 (= lt!542739 (arrayNoDuplicates!0 lt!542738 #b00000000000000000000000000000000 Nil!26253))))

(declare-fun b!1194207 () Bool)

(declare-fun res!794549 () Bool)

(assert (=> b!1194207 (=> (not res!794549) (not e!678690))))

(assert (=> b!1194207 (= res!794549 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1194208 () Bool)

(declare-fun res!794551 () Bool)

(assert (=> b!1194208 (=> (not res!794551) (not e!678690))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1194208 (= res!794551 (validMask!0 mask!1564))))

(declare-fun b!1194209 () Bool)

(declare-fun res!794552 () Bool)

(assert (=> b!1194209 (=> (not res!794552) (not e!678690))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1194209 (= res!794552 (validKeyInArray!0 k!934))))

(declare-fun b!1194210 () Bool)

(declare-fun e!678688 () Bool)

(assert (=> b!1194210 (= e!678688 tp_is_empty!30245)))

(declare-fun b!1194211 () Bool)

(declare-fun res!794553 () Bool)

(assert (=> b!1194211 (=> (not res!794553) (not e!678690))))

(assert (=> b!1194211 (= res!794553 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26253))))

(declare-fun b!1194212 () Bool)

(declare-fun res!794554 () Bool)

(assert (=> b!1194212 (=> (not res!794554) (not e!678690))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1194212 (= res!794554 (and (= (size!37821 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37820 _keys!1208) (size!37821 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!47195 () Bool)

(declare-fun mapRes!47195 () Bool)

(declare-fun tp!89805 () Bool)

(assert (=> mapNonEmpty!47195 (= mapRes!47195 (and tp!89805 e!678688))))

(declare-fun mapValue!47195 () ValueCell!14413)

(declare-fun mapKey!47195 () (_ BitVec 32))

(declare-fun mapRest!47195 () (Array (_ BitVec 32) ValueCell!14413))

(assert (=> mapNonEmpty!47195 (= (arr!37285 _values!996) (store mapRest!47195 mapKey!47195 mapValue!47195))))

(declare-fun b!1194213 () Bool)

(assert (=> b!1194213 (= e!678686 (and e!678691 mapRes!47195))))

(declare-fun condMapEmpty!47195 () Bool)

(declare-fun mapDefault!47195 () ValueCell!14413)

