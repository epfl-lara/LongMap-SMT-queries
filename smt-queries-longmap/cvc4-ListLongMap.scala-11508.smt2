; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133936 () Bool)

(assert start!133936)

(declare-fun b_free!32159 () Bool)

(declare-fun b_next!32159 () Bool)

(assert (=> start!133936 (= b_free!32159 (not b_next!32159))))

(declare-fun tp!113779 () Bool)

(declare-fun b_and!51759 () Bool)

(assert (=> start!133936 (= tp!113779 b_and!51759)))

(declare-fun mapNonEmpty!59791 () Bool)

(declare-fun mapRes!59791 () Bool)

(declare-fun tp!113778 () Bool)

(declare-fun e!872685 () Bool)

(assert (=> mapNonEmpty!59791 (= mapRes!59791 (and tp!113778 e!872685))))

(declare-datatypes ((V!60117 0))(
  ( (V!60118 (val!19550 Int)) )
))
(declare-datatypes ((ValueCell!18436 0))(
  ( (ValueCellFull!18436 (v!22306 V!60117)) (EmptyCell!18436) )
))
(declare-fun mapRest!59791 () (Array (_ BitVec 32) ValueCell!18436))

(declare-fun mapValue!59791 () ValueCell!18436)

(declare-fun mapKey!59791 () (_ BitVec 32))

(declare-datatypes ((array!104556 0))(
  ( (array!104557 (arr!50465 (Array (_ BitVec 32) ValueCell!18436)) (size!51015 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104556)

(assert (=> mapNonEmpty!59791 (= (arr!50465 _values!487) (store mapRest!59791 mapKey!59791 mapValue!59791))))

(declare-fun b!1565666 () Bool)

(declare-fun tp_is_empty!38933 () Bool)

(assert (=> b!1565666 (= e!872685 tp_is_empty!38933)))

(declare-fun b!1565667 () Bool)

(declare-fun res!1070242 () Bool)

(declare-fun e!872686 () Bool)

(assert (=> b!1565667 (=> (not res!1070242) (not e!872686))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!104558 0))(
  ( (array!104559 (arr!50466 (Array (_ BitVec 32) (_ BitVec 64))) (size!51016 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104558)

(assert (=> b!1565667 (= res!1070242 (and (= (size!51015 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51016 _keys!637) (size!51015 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1565668 () Bool)

(assert (=> b!1565668 (= e!872686 (not true))))

(declare-fun lt!672359 () Bool)

(declare-datatypes ((tuple2!25222 0))(
  ( (tuple2!25223 (_1!12622 (_ BitVec 64)) (_2!12622 V!60117)) )
))
(declare-datatypes ((List!36610 0))(
  ( (Nil!36607) (Cons!36606 (h!38052 tuple2!25222) (t!51483 List!36610)) )
))
(declare-datatypes ((ListLongMap!22657 0))(
  ( (ListLongMap!22658 (toList!11344 List!36610)) )
))
(declare-fun lt!672358 () ListLongMap!22657)

(declare-fun contains!10335 (ListLongMap!22657 (_ BitVec 64)) Bool)

(assert (=> b!1565668 (= lt!672359 (contains!10335 lt!672358 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1565668 (not (contains!10335 lt!672358 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!672355 () ListLongMap!22657)

(declare-fun lt!672356 () V!60117)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun +!5074 (ListLongMap!22657 tuple2!25222) ListLongMap!22657)

(assert (=> b!1565668 (= lt!672358 (+!5074 lt!672355 (tuple2!25223 (select (arr!50466 _keys!637) from!782) lt!672356)))))

(declare-datatypes ((Unit!52012 0))(
  ( (Unit!52013) )
))
(declare-fun lt!672357 () Unit!52012)

(declare-fun addStillNotContains!564 (ListLongMap!22657 (_ BitVec 64) V!60117 (_ BitVec 64)) Unit!52012)

(assert (=> b!1565668 (= lt!672357 (addStillNotContains!564 lt!672355 (select (arr!50466 _keys!637) from!782) lt!672356 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26341 (ValueCell!18436 V!60117) V!60117)

(declare-fun dynLambda!3858 (Int (_ BitVec 64)) V!60117)

(assert (=> b!1565668 (= lt!672356 (get!26341 (select (arr!50465 _values!487) from!782) (dynLambda!3858 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!453 () V!60117)

(declare-fun zeroValue!453 () V!60117)

(declare-fun getCurrentListMapNoExtraKeys!6709 (array!104558 array!104556 (_ BitVec 32) (_ BitVec 32) V!60117 V!60117 (_ BitVec 32) Int) ListLongMap!22657)

(assert (=> b!1565668 (= lt!672355 (getCurrentListMapNoExtraKeys!6709 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun mapIsEmpty!59791 () Bool)

(assert (=> mapIsEmpty!59791 mapRes!59791))

(declare-fun b!1565669 () Bool)

(declare-fun res!1070244 () Bool)

(assert (=> b!1565669 (=> (not res!1070244) (not e!872686))))

(declare-datatypes ((List!36611 0))(
  ( (Nil!36608) (Cons!36607 (h!38053 (_ BitVec 64)) (t!51484 List!36611)) )
))
(declare-fun arrayNoDuplicates!0 (array!104558 (_ BitVec 32) List!36611) Bool)

(assert (=> b!1565669 (= res!1070244 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36608))))

(declare-fun b!1565670 () Bool)

(declare-fun res!1070240 () Bool)

(assert (=> b!1565670 (=> (not res!1070240) (not e!872686))))

(assert (=> b!1565670 (= res!1070240 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51016 _keys!637)) (bvslt from!782 (size!51016 _keys!637))))))

(declare-fun b!1565671 () Bool)

(declare-fun e!872682 () Bool)

(declare-fun e!872684 () Bool)

(assert (=> b!1565671 (= e!872682 (and e!872684 mapRes!59791))))

(declare-fun condMapEmpty!59791 () Bool)

(declare-fun mapDefault!59791 () ValueCell!18436)

