; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100398 () Bool)

(assert start!100398)

(declare-fun b_free!25721 () Bool)

(declare-fun b_next!25721 () Bool)

(assert (=> start!100398 (= b_free!25721 (not b_next!25721))))

(declare-fun tp!90153 () Bool)

(declare-fun b_and!42337 () Bool)

(assert (=> start!100398 (= tp!90153 b_and!42337)))

(declare-fun b!1198272 () Bool)

(declare-fun res!797480 () Bool)

(declare-fun e!680684 () Bool)

(assert (=> b!1198272 (=> (not res!797480) (not e!680684))))

(declare-datatypes ((array!77629 0))(
  ( (array!77630 (arr!37459 (Array (_ BitVec 32) (_ BitVec 64))) (size!37995 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77629)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45693 0))(
  ( (V!45694 (val!15269 Int)) )
))
(declare-datatypes ((ValueCell!14503 0))(
  ( (ValueCellFull!14503 (v!17907 V!45693)) (EmptyCell!14503) )
))
(declare-datatypes ((array!77631 0))(
  ( (array!77632 (arr!37460 (Array (_ BitVec 32) ValueCell!14503)) (size!37996 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77631)

(assert (=> b!1198272 (= res!797480 (and (= (size!37996 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37995 _keys!1208) (size!37996 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1198274 () Bool)

(declare-fun res!797481 () Bool)

(assert (=> b!1198274 (=> (not res!797481) (not e!680684))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77629 (_ BitVec 32)) Bool)

(assert (=> b!1198274 (= res!797481 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1198275 () Bool)

(declare-fun res!797482 () Bool)

(declare-fun e!680689 () Bool)

(assert (=> b!1198275 (=> (not res!797482) (not e!680689))))

(declare-fun lt!543459 () array!77629)

(declare-datatypes ((List!26352 0))(
  ( (Nil!26349) (Cons!26348 (h!27557 (_ BitVec 64)) (t!39059 List!26352)) )
))
(declare-fun arrayNoDuplicates!0 (array!77629 (_ BitVec 32) List!26352) Bool)

(assert (=> b!1198275 (= res!797482 (arrayNoDuplicates!0 lt!543459 #b00000000000000000000000000000000 Nil!26349))))

(declare-fun b!1198276 () Bool)

(declare-fun res!797475 () Bool)

(assert (=> b!1198276 (=> (not res!797475) (not e!680684))))

(assert (=> b!1198276 (= res!797475 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26349))))

(declare-fun b!1198277 () Bool)

(declare-fun res!797478 () Bool)

(assert (=> b!1198277 (=> (not res!797478) (not e!680684))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1198277 (= res!797478 (= (select (arr!37459 _keys!1208) i!673) k!934))))

(declare-fun b!1198278 () Bool)

(declare-fun res!797474 () Bool)

(assert (=> b!1198278 (=> (not res!797474) (not e!680684))))

(assert (=> b!1198278 (= res!797474 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37995 _keys!1208))))))

(declare-fun mapIsEmpty!47480 () Bool)

(declare-fun mapRes!47480 () Bool)

(assert (=> mapIsEmpty!47480 mapRes!47480))

(declare-fun b!1198279 () Bool)

(declare-fun res!797477 () Bool)

(assert (=> b!1198279 (=> (not res!797477) (not e!680684))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1198279 (= res!797477 (validMask!0 mask!1564))))

(declare-fun b!1198280 () Bool)

(assert (=> b!1198280 (= e!680684 e!680689)))

(declare-fun res!797484 () Bool)

(assert (=> b!1198280 (=> (not res!797484) (not e!680689))))

(assert (=> b!1198280 (= res!797484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543459 mask!1564))))

(assert (=> b!1198280 (= lt!543459 (array!77630 (store (arr!37459 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37995 _keys!1208)))))

(declare-fun res!797476 () Bool)

(assert (=> start!100398 (=> (not res!797476) (not e!680684))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100398 (= res!797476 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37995 _keys!1208))))))

(assert (=> start!100398 e!680684))

(declare-fun tp_is_empty!30425 () Bool)

(assert (=> start!100398 tp_is_empty!30425))

(declare-fun array_inv!28546 (array!77629) Bool)

(assert (=> start!100398 (array_inv!28546 _keys!1208)))

(assert (=> start!100398 true))

(assert (=> start!100398 tp!90153))

(declare-fun e!680683 () Bool)

(declare-fun array_inv!28547 (array!77631) Bool)

(assert (=> start!100398 (and (array_inv!28547 _values!996) e!680683)))

(declare-fun b!1198273 () Bool)

(declare-fun e!680687 () Bool)

(assert (=> b!1198273 (= e!680683 (and e!680687 mapRes!47480))))

(declare-fun condMapEmpty!47480 () Bool)

(declare-fun mapDefault!47480 () ValueCell!14503)

