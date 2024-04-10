; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133960 () Bool)

(assert start!133960)

(declare-fun b_free!32183 () Bool)

(declare-fun b_next!32183 () Bool)

(assert (=> start!133960 (= b_free!32183 (not b_next!32183))))

(declare-fun tp!113851 () Bool)

(declare-fun b_and!51807 () Bool)

(assert (=> start!133960 (= tp!113851 b_and!51807)))

(declare-fun b!1566041 () Bool)

(declare-fun e!872881 () Bool)

(assert (=> b!1566041 (= e!872881 (not true))))

(declare-fun lt!672527 () Bool)

(declare-datatypes ((V!60149 0))(
  ( (V!60150 (val!19562 Int)) )
))
(declare-datatypes ((tuple2!25238 0))(
  ( (tuple2!25239 (_1!12630 (_ BitVec 64)) (_2!12630 V!60149)) )
))
(declare-datatypes ((List!36626 0))(
  ( (Nil!36623) (Cons!36622 (h!38068 tuple2!25238) (t!51523 List!36626)) )
))
(declare-datatypes ((ListLongMap!22673 0))(
  ( (ListLongMap!22674 (toList!11352 List!36626)) )
))
(declare-fun lt!672530 () ListLongMap!22673)

(declare-fun contains!10343 (ListLongMap!22673 (_ BitVec 64)) Bool)

(assert (=> b!1566041 (= lt!672527 (contains!10343 lt!672530 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1566041 (not (contains!10343 lt!672530 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!672529 () V!60149)

(declare-datatypes ((array!104600 0))(
  ( (array!104601 (arr!50487 (Array (_ BitVec 32) (_ BitVec 64))) (size!51037 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104600)

(declare-fun lt!672528 () ListLongMap!22673)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun +!5082 (ListLongMap!22673 tuple2!25238) ListLongMap!22673)

(assert (=> b!1566041 (= lt!672530 (+!5082 lt!672528 (tuple2!25239 (select (arr!50487 _keys!637) from!782) lt!672529)))))

(declare-datatypes ((Unit!52028 0))(
  ( (Unit!52029) )
))
(declare-fun lt!672526 () Unit!52028)

(declare-fun addStillNotContains!572 (ListLongMap!22673 (_ BitVec 64) V!60149 (_ BitVec 64)) Unit!52028)

(assert (=> b!1566041 (= lt!672526 (addStillNotContains!572 lt!672528 (select (arr!50487 _keys!637) from!782) lt!672529 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-datatypes ((ValueCell!18448 0))(
  ( (ValueCellFull!18448 (v!22318 V!60149)) (EmptyCell!18448) )
))
(declare-datatypes ((array!104602 0))(
  ( (array!104603 (arr!50488 (Array (_ BitVec 32) ValueCell!18448)) (size!51038 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104602)

(declare-fun get!26357 (ValueCell!18448 V!60149) V!60149)

(declare-fun dynLambda!3866 (Int (_ BitVec 64)) V!60149)

(assert (=> b!1566041 (= lt!672529 (get!26357 (select (arr!50488 _values!487) from!782) (dynLambda!3866 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!60149)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!60149)

(declare-fun getCurrentListMapNoExtraKeys!6717 (array!104600 array!104602 (_ BitVec 32) (_ BitVec 32) V!60149 V!60149 (_ BitVec 32) Int) ListLongMap!22673)

(assert (=> b!1566041 (= lt!672528 (getCurrentListMapNoExtraKeys!6717 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun mapNonEmpty!59827 () Bool)

(declare-fun mapRes!59827 () Bool)

(declare-fun tp!113850 () Bool)

(declare-fun e!872884 () Bool)

(assert (=> mapNonEmpty!59827 (= mapRes!59827 (and tp!113850 e!872884))))

(declare-fun mapRest!59827 () (Array (_ BitVec 32) ValueCell!18448))

(declare-fun mapValue!59827 () ValueCell!18448)

(declare-fun mapKey!59827 () (_ BitVec 32))

(assert (=> mapNonEmpty!59827 (= (arr!50488 _values!487) (store mapRest!59827 mapKey!59827 mapValue!59827))))

(declare-fun b!1566042 () Bool)

(declare-fun e!872883 () Bool)

(declare-fun tp_is_empty!38957 () Bool)

(assert (=> b!1566042 (= e!872883 tp_is_empty!38957)))

(declare-fun b!1566043 () Bool)

(assert (=> b!1566043 (= e!872884 tp_is_empty!38957)))

(declare-fun b!1566044 () Bool)

(declare-fun res!1070487 () Bool)

(assert (=> b!1566044 (=> (not res!1070487) (not e!872881))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104600 (_ BitVec 32)) Bool)

(assert (=> b!1566044 (= res!1070487 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1566045 () Bool)

(declare-fun res!1070483 () Bool)

(assert (=> b!1566045 (=> (not res!1070483) (not e!872881))))

(assert (=> b!1566045 (= res!1070483 (and (= (size!51038 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51037 _keys!637) (size!51038 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1566046 () Bool)

(declare-fun res!1070484 () Bool)

(assert (=> b!1566046 (=> (not res!1070484) (not e!872881))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1566046 (= res!1070484 (validKeyInArray!0 (select (arr!50487 _keys!637) from!782)))))

(declare-fun mapIsEmpty!59827 () Bool)

(assert (=> mapIsEmpty!59827 mapRes!59827))

(declare-fun b!1566047 () Bool)

(declare-fun res!1070485 () Bool)

(assert (=> b!1566047 (=> (not res!1070485) (not e!872881))))

(declare-datatypes ((List!36627 0))(
  ( (Nil!36624) (Cons!36623 (h!38069 (_ BitVec 64)) (t!51524 List!36627)) )
))
(declare-fun arrayNoDuplicates!0 (array!104600 (_ BitVec 32) List!36627) Bool)

(assert (=> b!1566047 (= res!1070485 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36624))))

(declare-fun b!1566048 () Bool)

(declare-fun res!1070488 () Bool)

(assert (=> b!1566048 (=> (not res!1070488) (not e!872881))))

(assert (=> b!1566048 (= res!1070488 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51037 _keys!637)) (bvslt from!782 (size!51037 _keys!637))))))

(declare-fun b!1566049 () Bool)

(declare-fun e!872882 () Bool)

(assert (=> b!1566049 (= e!872882 (and e!872883 mapRes!59827))))

(declare-fun condMapEmpty!59827 () Bool)

(declare-fun mapDefault!59827 () ValueCell!18448)

