; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133920 () Bool)

(assert start!133920)

(declare-fun b_free!32143 () Bool)

(declare-fun b_next!32143 () Bool)

(assert (=> start!133920 (= b_free!32143 (not b_next!32143))))

(declare-fun tp!113731 () Bool)

(declare-fun b_and!51727 () Bool)

(assert (=> start!133920 (= tp!113731 b_and!51727)))

(declare-fun mapNonEmpty!59767 () Bool)

(declare-fun mapRes!59767 () Bool)

(declare-fun tp!113730 () Bool)

(declare-fun e!872562 () Bool)

(assert (=> mapNonEmpty!59767 (= mapRes!59767 (and tp!113730 e!872562))))

(declare-datatypes ((V!60097 0))(
  ( (V!60098 (val!19542 Int)) )
))
(declare-datatypes ((ValueCell!18428 0))(
  ( (ValueCellFull!18428 (v!22298 V!60097)) (EmptyCell!18428) )
))
(declare-fun mapValue!59767 () ValueCell!18428)

(declare-datatypes ((array!104524 0))(
  ( (array!104525 (arr!50449 (Array (_ BitVec 32) ValueCell!18428)) (size!50999 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104524)

(declare-fun mapKey!59767 () (_ BitVec 32))

(declare-fun mapRest!59767 () (Array (_ BitVec 32) ValueCell!18428))

(assert (=> mapNonEmpty!59767 (= (arr!50449 _values!487) (store mapRest!59767 mapKey!59767 mapValue!59767))))

(declare-fun b!1565434 () Bool)

(declare-fun e!872564 () Bool)

(declare-fun tp_is_empty!38917 () Bool)

(assert (=> b!1565434 (= e!872564 tp_is_empty!38917)))

(declare-fun res!1070097 () Bool)

(declare-fun e!872563 () Bool)

(assert (=> start!133920 (=> (not res!1070097) (not e!872563))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133920 (= res!1070097 (validMask!0 mask!947))))

(assert (=> start!133920 e!872563))

(assert (=> start!133920 tp!113731))

(assert (=> start!133920 tp_is_empty!38917))

(assert (=> start!133920 true))

(declare-datatypes ((array!104526 0))(
  ( (array!104527 (arr!50450 (Array (_ BitVec 32) (_ BitVec 64))) (size!51000 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104526)

(declare-fun array_inv!39203 (array!104526) Bool)

(assert (=> start!133920 (array_inv!39203 _keys!637)))

(declare-fun e!872566 () Bool)

(declare-fun array_inv!39204 (array!104524) Bool)

(assert (=> start!133920 (and (array_inv!39204 _values!487) e!872566)))

(declare-fun b!1565435 () Bool)

(assert (=> b!1565435 (= e!872562 tp_is_empty!38917)))

(declare-fun b!1565436 () Bool)

(assert (=> b!1565436 (= e!872563 (not true))))

(declare-datatypes ((tuple2!25212 0))(
  ( (tuple2!25213 (_1!12617 (_ BitVec 64)) (_2!12617 V!60097)) )
))
(declare-datatypes ((List!36599 0))(
  ( (Nil!36596) (Cons!36595 (h!38041 tuple2!25212) (t!51456 List!36599)) )
))
(declare-datatypes ((ListLongMap!22647 0))(
  ( (ListLongMap!22648 (toList!11339 List!36599)) )
))
(declare-fun lt!672268 () ListLongMap!22647)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun lt!672267 () V!60097)

(declare-fun contains!10330 (ListLongMap!22647 (_ BitVec 64)) Bool)

(declare-fun +!5069 (ListLongMap!22647 tuple2!25212) ListLongMap!22647)

(assert (=> b!1565436 (not (contains!10330 (+!5069 lt!672268 (tuple2!25213 (select (arr!50450 _keys!637) from!782) lt!672267)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!52002 0))(
  ( (Unit!52003) )
))
(declare-fun lt!672269 () Unit!52002)

(declare-fun addStillNotContains!559 (ListLongMap!22647 (_ BitVec 64) V!60097 (_ BitVec 64)) Unit!52002)

(assert (=> b!1565436 (= lt!672269 (addStillNotContains!559 lt!672268 (select (arr!50450 _keys!637) from!782) lt!672267 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26332 (ValueCell!18428 V!60097) V!60097)

(declare-fun dynLambda!3853 (Int (_ BitVec 64)) V!60097)

(assert (=> b!1565436 (= lt!672267 (get!26332 (select (arr!50449 _values!487) from!782) (dynLambda!3853 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!60097)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!60097)

(declare-fun getCurrentListMapNoExtraKeys!6704 (array!104526 array!104524 (_ BitVec 32) (_ BitVec 32) V!60097 V!60097 (_ BitVec 32) Int) ListLongMap!22647)

(assert (=> b!1565436 (= lt!672268 (getCurrentListMapNoExtraKeys!6704 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun mapIsEmpty!59767 () Bool)

(assert (=> mapIsEmpty!59767 mapRes!59767))

(declare-fun b!1565437 () Bool)

(declare-fun res!1070099 () Bool)

(assert (=> b!1565437 (=> (not res!1070099) (not e!872563))))

(declare-datatypes ((List!36600 0))(
  ( (Nil!36597) (Cons!36596 (h!38042 (_ BitVec 64)) (t!51457 List!36600)) )
))
(declare-fun arrayNoDuplicates!0 (array!104526 (_ BitVec 32) List!36600) Bool)

(assert (=> b!1565437 (= res!1070099 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36597))))

(declare-fun b!1565438 () Bool)

(declare-fun res!1070098 () Bool)

(assert (=> b!1565438 (=> (not res!1070098) (not e!872563))))

(assert (=> b!1565438 (= res!1070098 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51000 _keys!637)) (bvslt from!782 (size!51000 _keys!637))))))

(declare-fun b!1565439 () Bool)

(assert (=> b!1565439 (= e!872566 (and e!872564 mapRes!59767))))

(declare-fun condMapEmpty!59767 () Bool)

(declare-fun mapDefault!59767 () ValueCell!18428)

