; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99192 () Bool)

(assert start!99192)

(declare-fun b_free!24797 () Bool)

(declare-fun b_next!24797 () Bool)

(assert (=> start!99192 (= b_free!24797 (not b_next!24797))))

(declare-fun tp!87102 () Bool)

(declare-fun b_and!40443 () Bool)

(assert (=> start!99192 (= tp!87102 b_and!40443)))

(declare-fun b!1167783 () Bool)

(declare-fun res!774722 () Bool)

(declare-fun e!663722 () Bool)

(assert (=> b!1167783 (=> (not res!774722) (not e!663722))))

(declare-datatypes ((array!75477 0))(
  ( (array!75478 (arr!36389 (Array (_ BitVec 32) (_ BitVec 64))) (size!36925 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75477)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1167783 (= res!774722 (= (select (arr!36389 _keys!1208) i!673) k!934))))

(declare-fun mapNonEmpty!45815 () Bool)

(declare-fun mapRes!45815 () Bool)

(declare-fun tp!87101 () Bool)

(declare-fun e!663729 () Bool)

(assert (=> mapNonEmpty!45815 (= mapRes!45815 (and tp!87101 e!663729))))

(declare-datatypes ((V!44229 0))(
  ( (V!44230 (val!14720 Int)) )
))
(declare-datatypes ((ValueCell!13954 0))(
  ( (ValueCellFull!13954 (v!17357 V!44229)) (EmptyCell!13954) )
))
(declare-fun mapValue!45815 () ValueCell!13954)

(declare-fun mapRest!45815 () (Array (_ BitVec 32) ValueCell!13954))

(declare-datatypes ((array!75479 0))(
  ( (array!75480 (arr!36390 (Array (_ BitVec 32) ValueCell!13954)) (size!36926 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75479)

(declare-fun mapKey!45815 () (_ BitVec 32))

(assert (=> mapNonEmpty!45815 (= (arr!36390 _values!996) (store mapRest!45815 mapKey!45815 mapValue!45815))))

(declare-fun b!1167784 () Bool)

(declare-fun res!774728 () Bool)

(declare-fun e!663726 () Bool)

(assert (=> b!1167784 (=> (not res!774728) (not e!663726))))

(declare-fun lt!525771 () array!75477)

(declare-datatypes ((List!25520 0))(
  ( (Nil!25517) (Cons!25516 (h!26725 (_ BitVec 64)) (t!37309 List!25520)) )
))
(declare-fun arrayNoDuplicates!0 (array!75477 (_ BitVec 32) List!25520) Bool)

(assert (=> b!1167784 (= res!774728 (arrayNoDuplicates!0 lt!525771 #b00000000000000000000000000000000 Nil!25517))))

(declare-fun b!1167785 () Bool)

(declare-fun e!663728 () Bool)

(declare-fun e!663727 () Bool)

(assert (=> b!1167785 (= e!663728 (and e!663727 mapRes!45815))))

(declare-fun condMapEmpty!45815 () Bool)

(declare-fun mapDefault!45815 () ValueCell!13954)

