; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100244 () Bool)

(assert start!100244)

(declare-fun b!1195632 () Bool)

(declare-fun res!795614 () Bool)

(declare-fun e!679399 () Bool)

(assert (=> b!1195632 (=> (not res!795614) (not e!679399))))

(declare-datatypes ((array!77403 0))(
  ( (array!77404 (arr!37348 (Array (_ BitVec 32) (_ BitVec 64))) (size!37884 (_ BitVec 32))) )
))
(declare-fun lt!542957 () array!77403)

(declare-datatypes ((List!26284 0))(
  ( (Nil!26281) (Cons!26280 (h!27489 (_ BitVec 64)) (t!38955 List!26284)) )
))
(declare-fun arrayNoDuplicates!0 (array!77403 (_ BitVec 32) List!26284) Bool)

(assert (=> b!1195632 (= res!795614 (arrayNoDuplicates!0 lt!542957 #b00000000000000000000000000000000 Nil!26281))))

(declare-fun b!1195633 () Bool)

(assert (=> b!1195633 (= e!679399 (not true))))

(declare-fun _keys!1208 () array!77403)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77403 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1195633 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!39640 0))(
  ( (Unit!39641) )
))
(declare-fun lt!542958 () Unit!39640)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77403 (_ BitVec 64) (_ BitVec 32)) Unit!39640)

(assert (=> b!1195633 (= lt!542958 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1195634 () Bool)

(declare-fun e!679394 () Bool)

(assert (=> b!1195634 (= e!679394 e!679399)))

(declare-fun res!795607 () Bool)

(assert (=> b!1195634 (=> (not res!795607) (not e!679399))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77403 (_ BitVec 32)) Bool)

(assert (=> b!1195634 (= res!795607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542957 mask!1564))))

(assert (=> b!1195634 (= lt!542957 (array!77404 (store (arr!37348 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37884 _keys!1208)))))

(declare-fun b!1195635 () Bool)

(declare-fun e!679396 () Bool)

(declare-fun tp_is_empty!30311 () Bool)

(assert (=> b!1195635 (= e!679396 tp_is_empty!30311)))

(declare-fun b!1195636 () Bool)

(declare-fun res!795609 () Bool)

(assert (=> b!1195636 (=> (not res!795609) (not e!679394))))

(assert (=> b!1195636 (= res!795609 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26281))))

(declare-fun mapIsEmpty!47303 () Bool)

(declare-fun mapRes!47303 () Bool)

(assert (=> mapIsEmpty!47303 mapRes!47303))

(declare-fun b!1195637 () Bool)

(declare-fun res!795611 () Bool)

(assert (=> b!1195637 (=> (not res!795611) (not e!679394))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1195637 (= res!795611 (validMask!0 mask!1564))))

(declare-fun b!1195638 () Bool)

(declare-fun res!795612 () Bool)

(assert (=> b!1195638 (=> (not res!795612) (not e!679394))))

(assert (=> b!1195638 (= res!795612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!47303 () Bool)

(declare-fun tp!89913 () Bool)

(assert (=> mapNonEmpty!47303 (= mapRes!47303 (and tp!89913 e!679396))))

(declare-datatypes ((V!45541 0))(
  ( (V!45542 (val!15212 Int)) )
))
(declare-datatypes ((ValueCell!14446 0))(
  ( (ValueCellFull!14446 (v!17850 V!45541)) (EmptyCell!14446) )
))
(declare-fun mapValue!47303 () ValueCell!14446)

(declare-fun mapRest!47303 () (Array (_ BitVec 32) ValueCell!14446))

(declare-datatypes ((array!77405 0))(
  ( (array!77406 (arr!37349 (Array (_ BitVec 32) ValueCell!14446)) (size!37885 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77405)

(declare-fun mapKey!47303 () (_ BitVec 32))

(assert (=> mapNonEmpty!47303 (= (arr!37349 _values!996) (store mapRest!47303 mapKey!47303 mapValue!47303))))

(declare-fun res!795608 () Bool)

(assert (=> start!100244 (=> (not res!795608) (not e!679394))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100244 (= res!795608 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37884 _keys!1208))))))

(assert (=> start!100244 e!679394))

(declare-fun array_inv!28468 (array!77403) Bool)

(assert (=> start!100244 (array_inv!28468 _keys!1208)))

(assert (=> start!100244 true))

(declare-fun e!679395 () Bool)

(declare-fun array_inv!28469 (array!77405) Bool)

(assert (=> start!100244 (and (array_inv!28469 _values!996) e!679395)))

(declare-fun b!1195639 () Bool)

(declare-fun e!679398 () Bool)

(assert (=> b!1195639 (= e!679398 tp_is_empty!30311)))

(declare-fun b!1195640 () Bool)

(assert (=> b!1195640 (= e!679395 (and e!679398 mapRes!47303))))

(declare-fun condMapEmpty!47303 () Bool)

(declare-fun mapDefault!47303 () ValueCell!14446)

