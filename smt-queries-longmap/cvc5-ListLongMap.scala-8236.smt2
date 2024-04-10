; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100346 () Bool)

(assert start!100346)

(declare-fun b!1197489 () Bool)

(declare-fun e!680293 () Bool)

(declare-fun tp_is_empty!30391 () Bool)

(assert (=> b!1197489 (= e!680293 tp_is_empty!30391)))

(declare-fun b!1197490 () Bool)

(declare-fun e!680297 () Bool)

(assert (=> b!1197490 (= e!680297 (not true))))

(declare-datatypes ((array!77561 0))(
  ( (array!77562 (arr!37426 (Array (_ BitVec 32) (_ BitVec 64))) (size!37962 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77561)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77561 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1197490 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!39702 0))(
  ( (Unit!39703) )
))
(declare-fun lt!543305 () Unit!39702)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77561 (_ BitVec 64) (_ BitVec 32)) Unit!39702)

(assert (=> b!1197490 (= lt!543305 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapIsEmpty!47426 () Bool)

(declare-fun mapRes!47426 () Bool)

(assert (=> mapIsEmpty!47426 mapRes!47426))

(declare-fun b!1197491 () Bool)

(declare-fun res!796908 () Bool)

(declare-fun e!680294 () Bool)

(assert (=> b!1197491 (=> (not res!796908) (not e!680294))))

(assert (=> b!1197491 (= res!796908 (= (select (arr!37426 _keys!1208) i!673) k!934))))

(declare-fun mapNonEmpty!47426 () Bool)

(declare-fun tp!90081 () Bool)

(declare-fun e!680295 () Bool)

(assert (=> mapNonEmpty!47426 (= mapRes!47426 (and tp!90081 e!680295))))

(declare-fun mapKey!47426 () (_ BitVec 32))

(declare-datatypes ((V!45649 0))(
  ( (V!45650 (val!15252 Int)) )
))
(declare-datatypes ((ValueCell!14486 0))(
  ( (ValueCellFull!14486 (v!17890 V!45649)) (EmptyCell!14486) )
))
(declare-fun mapValue!47426 () ValueCell!14486)

(declare-fun mapRest!47426 () (Array (_ BitVec 32) ValueCell!14486))

(declare-datatypes ((array!77563 0))(
  ( (array!77564 (arr!37427 (Array (_ BitVec 32) ValueCell!14486)) (size!37963 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77563)

(assert (=> mapNonEmpty!47426 (= (arr!37427 _values!996) (store mapRest!47426 mapKey!47426 mapValue!47426))))

(declare-fun b!1197492 () Bool)

(declare-fun res!796913 () Bool)

(assert (=> b!1197492 (=> (not res!796913) (not e!680294))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77561 (_ BitVec 32)) Bool)

(assert (=> b!1197492 (= res!796913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1197493 () Bool)

(declare-fun res!796905 () Bool)

(assert (=> b!1197493 (=> (not res!796905) (not e!680294))))

(declare-datatypes ((List!26334 0))(
  ( (Nil!26331) (Cons!26330 (h!27539 (_ BitVec 64)) (t!39035 List!26334)) )
))
(declare-fun arrayNoDuplicates!0 (array!77561 (_ BitVec 32) List!26334) Bool)

(assert (=> b!1197493 (= res!796905 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26331))))

(declare-fun res!796907 () Bool)

(assert (=> start!100346 (=> (not res!796907) (not e!680294))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100346 (= res!796907 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37962 _keys!1208))))))

(assert (=> start!100346 e!680294))

(declare-fun array_inv!28524 (array!77561) Bool)

(assert (=> start!100346 (array_inv!28524 _keys!1208)))

(assert (=> start!100346 true))

(declare-fun e!680292 () Bool)

(declare-fun array_inv!28525 (array!77563) Bool)

(assert (=> start!100346 (and (array_inv!28525 _values!996) e!680292)))

(declare-fun b!1197488 () Bool)

(assert (=> b!1197488 (= e!680295 tp_is_empty!30391)))

(declare-fun b!1197494 () Bool)

(declare-fun res!796910 () Bool)

(assert (=> b!1197494 (=> (not res!796910) (not e!680294))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1197494 (= res!796910 (validMask!0 mask!1564))))

(declare-fun b!1197495 () Bool)

(declare-fun res!796911 () Bool)

(assert (=> b!1197495 (=> (not res!796911) (not e!680294))))

(assert (=> b!1197495 (= res!796911 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37962 _keys!1208))))))

(declare-fun b!1197496 () Bool)

(assert (=> b!1197496 (= e!680292 (and e!680293 mapRes!47426))))

(declare-fun condMapEmpty!47426 () Bool)

(declare-fun mapDefault!47426 () ValueCell!14486)

