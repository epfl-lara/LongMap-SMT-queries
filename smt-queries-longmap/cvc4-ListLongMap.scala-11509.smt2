; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133942 () Bool)

(assert start!133942)

(declare-fun b_free!32165 () Bool)

(declare-fun b_next!32165 () Bool)

(assert (=> start!133942 (= b_free!32165 (not b_next!32165))))

(declare-fun tp!113796 () Bool)

(declare-fun b_and!51771 () Bool)

(assert (=> start!133942 (= tp!113796 b_and!51771)))

(declare-fun b!1565753 () Bool)

(declare-fun e!872728 () Bool)

(declare-fun tp_is_empty!38939 () Bool)

(assert (=> b!1565753 (= e!872728 tp_is_empty!38939)))

(declare-fun b!1565754 () Bool)

(declare-fun res!1070296 () Bool)

(declare-fun e!872731 () Bool)

(assert (=> b!1565754 (=> (not res!1070296) (not e!872731))))

(declare-datatypes ((array!104568 0))(
  ( (array!104569 (arr!50471 (Array (_ BitVec 32) (_ BitVec 64))) (size!51021 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104568)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104568 (_ BitVec 32)) Bool)

(assert (=> b!1565754 (= res!1070296 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun res!1070295 () Bool)

(assert (=> start!133942 (=> (not res!1070295) (not e!872731))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133942 (= res!1070295 (validMask!0 mask!947))))

(assert (=> start!133942 e!872731))

(assert (=> start!133942 tp!113796))

(assert (=> start!133942 tp_is_empty!38939))

(assert (=> start!133942 true))

(declare-fun array_inv!39219 (array!104568) Bool)

(assert (=> start!133942 (array_inv!39219 _keys!637)))

(declare-datatypes ((V!60125 0))(
  ( (V!60126 (val!19553 Int)) )
))
(declare-datatypes ((ValueCell!18439 0))(
  ( (ValueCellFull!18439 (v!22309 V!60125)) (EmptyCell!18439) )
))
(declare-datatypes ((array!104570 0))(
  ( (array!104571 (arr!50472 (Array (_ BitVec 32) ValueCell!18439)) (size!51022 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104570)

(declare-fun e!872730 () Bool)

(declare-fun array_inv!39220 (array!104570) Bool)

(assert (=> start!133942 (and (array_inv!39220 _values!487) e!872730)))

(declare-fun b!1565755 () Bool)

(declare-fun res!1070298 () Bool)

(assert (=> b!1565755 (=> (not res!1070298) (not e!872731))))

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1565755 (= res!1070298 (validKeyInArray!0 (select (arr!50471 _keys!637) from!782)))))

(declare-fun b!1565756 () Bool)

(declare-fun res!1070297 () Bool)

(assert (=> b!1565756 (=> (not res!1070297) (not e!872731))))

(assert (=> b!1565756 (= res!1070297 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51021 _keys!637)) (bvslt from!782 (size!51021 _keys!637))))))

(declare-fun mapIsEmpty!59800 () Bool)

(declare-fun mapRes!59800 () Bool)

(assert (=> mapIsEmpty!59800 mapRes!59800))

(declare-fun b!1565757 () Bool)

(declare-fun res!1070299 () Bool)

(assert (=> b!1565757 (=> (not res!1070299) (not e!872731))))

(declare-datatypes ((List!36616 0))(
  ( (Nil!36613) (Cons!36612 (h!38058 (_ BitVec 64)) (t!51495 List!36616)) )
))
(declare-fun arrayNoDuplicates!0 (array!104568 (_ BitVec 32) List!36616) Bool)

(assert (=> b!1565757 (= res!1070299 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36613))))

(declare-fun mapNonEmpty!59800 () Bool)

(declare-fun tp!113797 () Bool)

(assert (=> mapNonEmpty!59800 (= mapRes!59800 (and tp!113797 e!872728))))

(declare-fun mapKey!59800 () (_ BitVec 32))

(declare-fun mapRest!59800 () (Array (_ BitVec 32) ValueCell!18439))

(declare-fun mapValue!59800 () ValueCell!18439)

(assert (=> mapNonEmpty!59800 (= (arr!50472 _values!487) (store mapRest!59800 mapKey!59800 mapValue!59800))))

(declare-fun b!1565758 () Bool)

(assert (=> b!1565758 (= e!872731 (not true))))

(declare-fun lt!672402 () Bool)

(declare-datatypes ((tuple2!25228 0))(
  ( (tuple2!25229 (_1!12625 (_ BitVec 64)) (_2!12625 V!60125)) )
))
(declare-datatypes ((List!36617 0))(
  ( (Nil!36614) (Cons!36613 (h!38059 tuple2!25228) (t!51496 List!36617)) )
))
(declare-datatypes ((ListLongMap!22663 0))(
  ( (ListLongMap!22664 (toList!11347 List!36617)) )
))
(declare-fun lt!672403 () ListLongMap!22663)

(declare-fun contains!10338 (ListLongMap!22663 (_ BitVec 64)) Bool)

(assert (=> b!1565758 (= lt!672402 (contains!10338 lt!672403 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1565758 (not (contains!10338 lt!672403 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!672404 () V!60125)

(declare-fun lt!672401 () ListLongMap!22663)

(declare-fun +!5077 (ListLongMap!22663 tuple2!25228) ListLongMap!22663)

(assert (=> b!1565758 (= lt!672403 (+!5077 lt!672401 (tuple2!25229 (select (arr!50471 _keys!637) from!782) lt!672404)))))

(declare-datatypes ((Unit!52018 0))(
  ( (Unit!52019) )
))
(declare-fun lt!672400 () Unit!52018)

(declare-fun addStillNotContains!567 (ListLongMap!22663 (_ BitVec 64) V!60125 (_ BitVec 64)) Unit!52018)

(assert (=> b!1565758 (= lt!672400 (addStillNotContains!567 lt!672401 (select (arr!50471 _keys!637) from!782) lt!672404 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26346 (ValueCell!18439 V!60125) V!60125)

(declare-fun dynLambda!3861 (Int (_ BitVec 64)) V!60125)

(assert (=> b!1565758 (= lt!672404 (get!26346 (select (arr!50472 _values!487) from!782) (dynLambda!3861 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!60125)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!60125)

(declare-fun getCurrentListMapNoExtraKeys!6712 (array!104568 array!104570 (_ BitVec 32) (_ BitVec 32) V!60125 V!60125 (_ BitVec 32) Int) ListLongMap!22663)

(assert (=> b!1565758 (= lt!672401 (getCurrentListMapNoExtraKeys!6712 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1565759 () Bool)

(declare-fun res!1070294 () Bool)

(assert (=> b!1565759 (=> (not res!1070294) (not e!872731))))

(assert (=> b!1565759 (= res!1070294 (and (= (size!51022 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51021 _keys!637) (size!51022 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1565760 () Bool)

(declare-fun e!872729 () Bool)

(assert (=> b!1565760 (= e!872730 (and e!872729 mapRes!59800))))

(declare-fun condMapEmpty!59800 () Bool)

(declare-fun mapDefault!59800 () ValueCell!18439)

