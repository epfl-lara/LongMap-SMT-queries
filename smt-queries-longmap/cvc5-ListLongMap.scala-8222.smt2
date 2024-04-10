; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100240 () Bool)

(assert start!100240)

(declare-fun b!1195554 () Bool)

(declare-fun res!795555 () Bool)

(declare-fun e!679358 () Bool)

(assert (=> b!1195554 (=> (not res!795555) (not e!679358))))

(declare-datatypes ((array!77395 0))(
  ( (array!77396 (arr!37344 (Array (_ BitVec 32) (_ BitVec 64))) (size!37880 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77395)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45537 0))(
  ( (V!45538 (val!15210 Int)) )
))
(declare-datatypes ((ValueCell!14444 0))(
  ( (ValueCellFull!14444 (v!17848 V!45537)) (EmptyCell!14444) )
))
(declare-datatypes ((array!77397 0))(
  ( (array!77398 (arr!37345 (Array (_ BitVec 32) ValueCell!14444)) (size!37881 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77397)

(assert (=> b!1195554 (= res!795555 (and (= (size!37881 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37880 _keys!1208) (size!37881 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1195555 () Bool)

(declare-fun e!679360 () Bool)

(declare-fun tp_is_empty!30307 () Bool)

(assert (=> b!1195555 (= e!679360 tp_is_empty!30307)))

(declare-fun res!795553 () Bool)

(assert (=> start!100240 (=> (not res!795553) (not e!679358))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100240 (= res!795553 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37880 _keys!1208))))))

(assert (=> start!100240 e!679358))

(declare-fun array_inv!28464 (array!77395) Bool)

(assert (=> start!100240 (array_inv!28464 _keys!1208)))

(assert (=> start!100240 true))

(declare-fun e!679363 () Bool)

(declare-fun array_inv!28465 (array!77397) Bool)

(assert (=> start!100240 (and (array_inv!28465 _values!996) e!679363)))

(declare-fun b!1195556 () Bool)

(declare-fun res!795554 () Bool)

(declare-fun e!679361 () Bool)

(assert (=> b!1195556 (=> (not res!795554) (not e!679361))))

(declare-fun lt!542946 () array!77395)

(declare-datatypes ((List!26282 0))(
  ( (Nil!26279) (Cons!26278 (h!27487 (_ BitVec 64)) (t!38953 List!26282)) )
))
(declare-fun arrayNoDuplicates!0 (array!77395 (_ BitVec 32) List!26282) Bool)

(assert (=> b!1195556 (= res!795554 (arrayNoDuplicates!0 lt!542946 #b00000000000000000000000000000000 Nil!26279))))

(declare-fun b!1195557 () Bool)

(declare-fun res!795547 () Bool)

(assert (=> b!1195557 (=> (not res!795547) (not e!679358))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1195557 (= res!795547 (validMask!0 mask!1564))))

(declare-fun b!1195558 () Bool)

(declare-fun res!795550 () Bool)

(assert (=> b!1195558 (=> (not res!795550) (not e!679358))))

(assert (=> b!1195558 (= res!795550 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26279))))

(declare-fun mapNonEmpty!47297 () Bool)

(declare-fun mapRes!47297 () Bool)

(declare-fun tp!89907 () Bool)

(declare-fun e!679359 () Bool)

(assert (=> mapNonEmpty!47297 (= mapRes!47297 (and tp!89907 e!679359))))

(declare-fun mapKey!47297 () (_ BitVec 32))

(declare-fun mapRest!47297 () (Array (_ BitVec 32) ValueCell!14444))

(declare-fun mapValue!47297 () ValueCell!14444)

(assert (=> mapNonEmpty!47297 (= (arr!37345 _values!996) (store mapRest!47297 mapKey!47297 mapValue!47297))))

(declare-fun b!1195559 () Bool)

(declare-fun res!795549 () Bool)

(assert (=> b!1195559 (=> (not res!795549) (not e!679358))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1195559 (= res!795549 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37880 _keys!1208))))))

(declare-fun b!1195560 () Bool)

(assert (=> b!1195560 (= e!679361 (not true))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77395 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1195560 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39636 0))(
  ( (Unit!39637) )
))
(declare-fun lt!542945 () Unit!39636)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77395 (_ BitVec 64) (_ BitVec 32)) Unit!39636)

(assert (=> b!1195560 (= lt!542945 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1195561 () Bool)

(assert (=> b!1195561 (= e!679359 tp_is_empty!30307)))

(declare-fun b!1195562 () Bool)

(declare-fun res!795551 () Bool)

(assert (=> b!1195562 (=> (not res!795551) (not e!679358))))

(assert (=> b!1195562 (= res!795551 (= (select (arr!37344 _keys!1208) i!673) k!934))))

(declare-fun b!1195563 () Bool)

(assert (=> b!1195563 (= e!679358 e!679361)))

(declare-fun res!795552 () Bool)

(assert (=> b!1195563 (=> (not res!795552) (not e!679361))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77395 (_ BitVec 32)) Bool)

(assert (=> b!1195563 (= res!795552 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542946 mask!1564))))

(assert (=> b!1195563 (= lt!542946 (array!77396 (store (arr!37344 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37880 _keys!1208)))))

(declare-fun b!1195564 () Bool)

(assert (=> b!1195564 (= e!679363 (and e!679360 mapRes!47297))))

(declare-fun condMapEmpty!47297 () Bool)

(declare-fun mapDefault!47297 () ValueCell!14444)

