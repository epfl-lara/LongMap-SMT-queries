; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133562 () Bool)

(assert start!133562)

(declare-fun b_free!31979 () Bool)

(declare-fun b_next!31979 () Bool)

(assert (=> start!133562 (= b_free!31979 (not b_next!31979))))

(declare-fun tp!113060 () Bool)

(declare-fun b_and!51469 () Bool)

(assert (=> start!133562 (= tp!113060 b_and!51469)))

(declare-fun b!1561471 () Bool)

(declare-fun e!870168 () Bool)

(declare-fun tp_is_empty!38645 () Bool)

(assert (=> b!1561471 (= e!870168 tp_is_empty!38645)))

(declare-fun b!1561472 () Bool)

(declare-fun res!1067648 () Bool)

(declare-fun e!870165 () Bool)

(assert (=> b!1561472 (=> (not res!1067648) (not e!870165))))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!104008 0))(
  ( (array!104009 (arr!50196 (Array (_ BitVec 32) (_ BitVec 64))) (size!50746 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104008)

(assert (=> b!1561472 (= res!1067648 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50746 _keys!637)) (bvslt from!782 (size!50746 _keys!637))))))

(declare-fun mapNonEmpty!59343 () Bool)

(declare-fun mapRes!59343 () Bool)

(declare-fun tp!113061 () Bool)

(declare-fun e!870166 () Bool)

(assert (=> mapNonEmpty!59343 (= mapRes!59343 (and tp!113061 e!870166))))

(declare-fun mapKey!59343 () (_ BitVec 32))

(declare-datatypes ((V!59733 0))(
  ( (V!59734 (val!19406 Int)) )
))
(declare-datatypes ((ValueCell!18292 0))(
  ( (ValueCellFull!18292 (v!22158 V!59733)) (EmptyCell!18292) )
))
(declare-fun mapValue!59343 () ValueCell!18292)

(declare-datatypes ((array!104010 0))(
  ( (array!104011 (arr!50197 (Array (_ BitVec 32) ValueCell!18292)) (size!50747 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104010)

(declare-fun mapRest!59343 () (Array (_ BitVec 32) ValueCell!18292))

(assert (=> mapNonEmpty!59343 (= (arr!50197 _values!487) (store mapRest!59343 mapKey!59343 mapValue!59343))))

(declare-fun b!1561473 () Bool)

(assert (=> b!1561473 (= e!870166 tp_is_empty!38645)))

(declare-fun res!1067644 () Bool)

(assert (=> start!133562 (=> (not res!1067644) (not e!870165))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133562 (= res!1067644 (validMask!0 mask!947))))

(assert (=> start!133562 e!870165))

(assert (=> start!133562 tp!113060))

(assert (=> start!133562 tp_is_empty!38645))

(assert (=> start!133562 true))

(declare-fun array_inv!39019 (array!104008) Bool)

(assert (=> start!133562 (array_inv!39019 _keys!637)))

(declare-fun e!870167 () Bool)

(declare-fun array_inv!39020 (array!104010) Bool)

(assert (=> start!133562 (and (array_inv!39020 _values!487) e!870167)))

(declare-fun b!1561474 () Bool)

(assert (=> b!1561474 (= e!870165 (not true))))

(declare-fun lt!671221 () V!59733)

(declare-datatypes ((tuple2!25072 0))(
  ( (tuple2!25073 (_1!12547 (_ BitVec 64)) (_2!12547 V!59733)) )
))
(declare-datatypes ((List!36440 0))(
  ( (Nil!36437) (Cons!36436 (h!37882 tuple2!25072) (t!51209 List!36440)) )
))
(declare-datatypes ((ListLongMap!22507 0))(
  ( (ListLongMap!22508 (toList!11269 List!36440)) )
))
(declare-fun lt!671223 () ListLongMap!22507)

(declare-fun contains!10259 (ListLongMap!22507 (_ BitVec 64)) Bool)

(declare-fun +!5039 (ListLongMap!22507 tuple2!25072) ListLongMap!22507)

(assert (=> b!1561474 (not (contains!10259 (+!5039 lt!671223 (tuple2!25073 (select (arr!50196 _keys!637) from!782) lt!671221)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!51932 0))(
  ( (Unit!51933) )
))
(declare-fun lt!671222 () Unit!51932)

(declare-fun addStillNotContains!529 (ListLongMap!22507 (_ BitVec 64) V!59733 (_ BitVec 64)) Unit!51932)

(assert (=> b!1561474 (= lt!671222 (addStillNotContains!529 lt!671223 (select (arr!50196 _keys!637) from!782) lt!671221 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26208 (ValueCell!18292 V!59733) V!59733)

(declare-fun dynLambda!3823 (Int (_ BitVec 64)) V!59733)

(assert (=> b!1561474 (= lt!671221 (get!26208 (select (arr!50197 _values!487) from!782) (dynLambda!3823 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59733)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59733)

(declare-fun getCurrentListMapNoExtraKeys!6653 (array!104008 array!104010 (_ BitVec 32) (_ BitVec 32) V!59733 V!59733 (_ BitVec 32) Int) ListLongMap!22507)

(assert (=> b!1561474 (= lt!671223 (getCurrentListMapNoExtraKeys!6653 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1561475 () Bool)

(declare-fun res!1067647 () Bool)

(assert (=> b!1561475 (=> (not res!1067647) (not e!870165))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1561475 (= res!1067647 (validKeyInArray!0 (select (arr!50196 _keys!637) from!782)))))

(declare-fun b!1561476 () Bool)

(declare-fun res!1067649 () Bool)

(assert (=> b!1561476 (=> (not res!1067649) (not e!870165))))

(declare-datatypes ((List!36441 0))(
  ( (Nil!36438) (Cons!36437 (h!37883 (_ BitVec 64)) (t!51210 List!36441)) )
))
(declare-fun arrayNoDuplicates!0 (array!104008 (_ BitVec 32) List!36441) Bool)

(assert (=> b!1561476 (= res!1067649 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36438))))

(declare-fun b!1561477 () Bool)

(declare-fun res!1067646 () Bool)

(assert (=> b!1561477 (=> (not res!1067646) (not e!870165))))

(assert (=> b!1561477 (= res!1067646 (and (= (size!50747 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50746 _keys!637) (size!50747 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1561478 () Bool)

(declare-fun res!1067645 () Bool)

(assert (=> b!1561478 (=> (not res!1067645) (not e!870165))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104008 (_ BitVec 32)) Bool)

(assert (=> b!1561478 (= res!1067645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1561479 () Bool)

(assert (=> b!1561479 (= e!870167 (and e!870168 mapRes!59343))))

(declare-fun condMapEmpty!59343 () Bool)

(declare-fun mapDefault!59343 () ValueCell!18292)

