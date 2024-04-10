; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99096 () Bool)

(assert start!99096)

(declare-fun b_free!24701 () Bool)

(declare-fun b_next!24701 () Bool)

(assert (=> start!99096 (= b_free!24701 (not b_next!24701))))

(declare-fun tp!86813 () Bool)

(declare-fun b_and!40251 () Bool)

(assert (=> start!99096 (= tp!86813 b_and!40251)))

(declare-fun b!1165546 () Bool)

(declare-fun res!773014 () Bool)

(declare-fun e!662590 () Bool)

(assert (=> b!1165546 (=> (not res!773014) (not e!662590))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1165546 (= res!773014 (validKeyInArray!0 k!934))))

(declare-fun b!1165547 () Bool)

(declare-fun e!662595 () Bool)

(assert (=> b!1165547 (= e!662590 e!662595)))

(declare-fun res!773013 () Bool)

(assert (=> b!1165547 (=> (not res!773013) (not e!662595))))

(declare-datatypes ((array!75293 0))(
  ( (array!75294 (arr!36297 (Array (_ BitVec 32) (_ BitVec 64))) (size!36833 (_ BitVec 32))) )
))
(declare-fun lt!524941 () array!75293)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75293 (_ BitVec 32)) Bool)

(assert (=> b!1165547 (= res!773013 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524941 mask!1564))))

(declare-fun _keys!1208 () array!75293)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1165547 (= lt!524941 (array!75294 (store (arr!36297 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36833 _keys!1208)))))

(declare-fun mapNonEmpty!45671 () Bool)

(declare-fun mapRes!45671 () Bool)

(declare-fun tp!86814 () Bool)

(declare-fun e!662592 () Bool)

(assert (=> mapNonEmpty!45671 (= mapRes!45671 (and tp!86814 e!662592))))

(declare-fun mapKey!45671 () (_ BitVec 32))

(declare-datatypes ((V!44101 0))(
  ( (V!44102 (val!14672 Int)) )
))
(declare-datatypes ((ValueCell!13906 0))(
  ( (ValueCellFull!13906 (v!17309 V!44101)) (EmptyCell!13906) )
))
(declare-fun mapValue!45671 () ValueCell!13906)

(declare-datatypes ((array!75295 0))(
  ( (array!75296 (arr!36298 (Array (_ BitVec 32) ValueCell!13906)) (size!36834 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75295)

(declare-fun mapRest!45671 () (Array (_ BitVec 32) ValueCell!13906))

(assert (=> mapNonEmpty!45671 (= (arr!36298 _values!996) (store mapRest!45671 mapKey!45671 mapValue!45671))))

(declare-fun mapIsEmpty!45671 () Bool)

(assert (=> mapIsEmpty!45671 mapRes!45671))

(declare-fun b!1165548 () Bool)

(declare-fun e!662594 () Bool)

(declare-fun tp_is_empty!29231 () Bool)

(assert (=> b!1165548 (= e!662594 tp_is_empty!29231)))

(declare-fun b!1165549 () Bool)

(declare-fun res!773012 () Bool)

(assert (=> b!1165549 (=> (not res!773012) (not e!662590))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1165549 (= res!773012 (and (= (size!36834 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36833 _keys!1208) (size!36834 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1165550 () Bool)

(declare-fun e!662589 () Bool)

(assert (=> b!1165550 (= e!662589 (and e!662594 mapRes!45671))))

(declare-fun condMapEmpty!45671 () Bool)

(declare-fun mapDefault!45671 () ValueCell!13906)

