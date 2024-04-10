; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100222 () Bool)

(assert start!100222)

(declare-fun res!795283 () Bool)

(declare-fun e!679196 () Bool)

(assert (=> start!100222 (=> (not res!795283) (not e!679196))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!77359 0))(
  ( (array!77360 (arr!37326 (Array (_ BitVec 32) (_ BitVec 64))) (size!37862 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77359)

(assert (=> start!100222 (= res!795283 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37862 _keys!1208))))))

(assert (=> start!100222 e!679196))

(declare-fun array_inv!28450 (array!77359) Bool)

(assert (=> start!100222 (array_inv!28450 _keys!1208)))

(assert (=> start!100222 true))

(declare-datatypes ((V!45513 0))(
  ( (V!45514 (val!15201 Int)) )
))
(declare-datatypes ((ValueCell!14435 0))(
  ( (ValueCellFull!14435 (v!17839 V!45513)) (EmptyCell!14435) )
))
(declare-datatypes ((array!77361 0))(
  ( (array!77362 (arr!37327 (Array (_ BitVec 32) ValueCell!14435)) (size!37863 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77361)

(declare-fun e!679201 () Bool)

(declare-fun array_inv!28451 (array!77361) Bool)

(assert (=> start!100222 (and (array_inv!28451 _values!996) e!679201)))

(declare-fun b!1195203 () Bool)

(declare-fun res!795285 () Bool)

(assert (=> b!1195203 (=> (not res!795285) (not e!679196))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77359 (_ BitVec 32)) Bool)

(assert (=> b!1195203 (= res!795285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1195204 () Bool)

(declare-fun res!795282 () Bool)

(declare-fun e!679198 () Bool)

(assert (=> b!1195204 (=> (not res!795282) (not e!679198))))

(declare-fun lt!542891 () array!77359)

(declare-datatypes ((List!26274 0))(
  ( (Nil!26271) (Cons!26270 (h!27479 (_ BitVec 64)) (t!38945 List!26274)) )
))
(declare-fun arrayNoDuplicates!0 (array!77359 (_ BitVec 32) List!26274) Bool)

(assert (=> b!1195204 (= res!795282 (arrayNoDuplicates!0 lt!542891 #b00000000000000000000000000000000 Nil!26271))))

(declare-fun mapIsEmpty!47270 () Bool)

(declare-fun mapRes!47270 () Bool)

(assert (=> mapIsEmpty!47270 mapRes!47270))

(declare-fun b!1195205 () Bool)

(declare-fun res!795277 () Bool)

(assert (=> b!1195205 (=> (not res!795277) (not e!679196))))

(assert (=> b!1195205 (= res!795277 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26271))))

(declare-fun b!1195206 () Bool)

(declare-fun res!795284 () Bool)

(assert (=> b!1195206 (=> (not res!795284) (not e!679196))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1195206 (= res!795284 (validMask!0 mask!1564))))

(declare-fun b!1195207 () Bool)

(declare-fun res!795280 () Bool)

(assert (=> b!1195207 (=> (not res!795280) (not e!679196))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1195207 (= res!795280 (= (select (arr!37326 _keys!1208) i!673) k!934))))

(declare-fun b!1195208 () Bool)

(declare-fun res!795281 () Bool)

(assert (=> b!1195208 (=> (not res!795281) (not e!679196))))

(assert (=> b!1195208 (= res!795281 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37862 _keys!1208))))))

(declare-fun mapNonEmpty!47270 () Bool)

(declare-fun tp!89880 () Bool)

(declare-fun e!679197 () Bool)

(assert (=> mapNonEmpty!47270 (= mapRes!47270 (and tp!89880 e!679197))))

(declare-fun mapValue!47270 () ValueCell!14435)

(declare-fun mapKey!47270 () (_ BitVec 32))

(declare-fun mapRest!47270 () (Array (_ BitVec 32) ValueCell!14435))

(assert (=> mapNonEmpty!47270 (= (arr!37327 _values!996) (store mapRest!47270 mapKey!47270 mapValue!47270))))

(declare-fun b!1195209 () Bool)

(declare-fun e!679199 () Bool)

(assert (=> b!1195209 (= e!679201 (and e!679199 mapRes!47270))))

(declare-fun condMapEmpty!47270 () Bool)

(declare-fun mapDefault!47270 () ValueCell!14435)

