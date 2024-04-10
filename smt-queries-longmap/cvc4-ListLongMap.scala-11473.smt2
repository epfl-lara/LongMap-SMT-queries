; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133640 () Bool)

(assert start!133640)

(declare-fun b_free!32057 () Bool)

(declare-fun b_next!32057 () Bool)

(assert (=> start!133640 (= b_free!32057 (not b_next!32057))))

(declare-fun tp!113294 () Bool)

(declare-fun b_and!51625 () Bool)

(assert (=> start!133640 (= tp!113294 b_and!51625)))

(declare-fun b!1562611 () Bool)

(declare-fun res!1068355 () Bool)

(declare-fun e!870759 () Bool)

(assert (=> b!1562611 (=> (not res!1068355) (not e!870759))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!104160 0))(
  ( (array!104161 (arr!50272 (Array (_ BitVec 32) (_ BitVec 64))) (size!50822 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104160)

(declare-datatypes ((V!59837 0))(
  ( (V!59838 (val!19445 Int)) )
))
(declare-datatypes ((ValueCell!18331 0))(
  ( (ValueCellFull!18331 (v!22197 V!59837)) (EmptyCell!18331) )
))
(declare-datatypes ((array!104162 0))(
  ( (array!104163 (arr!50273 (Array (_ BitVec 32) ValueCell!18331)) (size!50823 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104162)

(assert (=> b!1562611 (= res!1068355 (and (= (size!50823 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50822 _keys!637) (size!50823 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1562612 () Bool)

(assert (=> b!1562612 (= e!870759 (not true))))

(declare-fun lt!671753 () Bool)

(declare-datatypes ((tuple2!25122 0))(
  ( (tuple2!25123 (_1!12572 (_ BitVec 64)) (_2!12572 V!59837)) )
))
(declare-datatypes ((List!36492 0))(
  ( (Nil!36489) (Cons!36488 (h!37934 tuple2!25122) (t!51339 List!36492)) )
))
(declare-datatypes ((ListLongMap!22557 0))(
  ( (ListLongMap!22558 (toList!11294 List!36492)) )
))
(declare-fun lt!671752 () ListLongMap!22557)

(declare-fun contains!10284 (ListLongMap!22557 (_ BitVec 64)) Bool)

(assert (=> b!1562612 (= lt!671753 (contains!10284 lt!671752 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1562612 (not (contains!10284 lt!671752 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!671754 () ListLongMap!22557)

(declare-fun lt!671750 () V!59837)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun +!5064 (ListLongMap!22557 tuple2!25122) ListLongMap!22557)

(assert (=> b!1562612 (= lt!671752 (+!5064 lt!671754 (tuple2!25123 (select (arr!50272 _keys!637) from!782) lt!671750)))))

(declare-datatypes ((Unit!51982 0))(
  ( (Unit!51983) )
))
(declare-fun lt!671751 () Unit!51982)

(declare-fun addStillNotContains!554 (ListLongMap!22557 (_ BitVec 64) V!59837 (_ BitVec 64)) Unit!51982)

(assert (=> b!1562612 (= lt!671751 (addStillNotContains!554 lt!671754 (select (arr!50272 _keys!637) from!782) lt!671750 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26259 (ValueCell!18331 V!59837) V!59837)

(declare-fun dynLambda!3848 (Int (_ BitVec 64)) V!59837)

(assert (=> b!1562612 (= lt!671750 (get!26259 (select (arr!50273 _values!487) from!782) (dynLambda!3848 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59837)

(declare-fun minValue!453 () V!59837)

(declare-fun getCurrentListMapNoExtraKeys!6678 (array!104160 array!104162 (_ BitVec 32) (_ BitVec 32) V!59837 V!59837 (_ BitVec 32) Int) ListLongMap!22557)

(assert (=> b!1562612 (= lt!671754 (getCurrentListMapNoExtraKeys!6678 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1562613 () Bool)

(declare-fun res!1068357 () Bool)

(assert (=> b!1562613 (=> (not res!1068357) (not e!870759))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104160 (_ BitVec 32)) Bool)

(assert (=> b!1562613 (= res!1068357 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1562614 () Bool)

(declare-fun res!1068356 () Bool)

(assert (=> b!1562614 (=> (not res!1068356) (not e!870759))))

(assert (=> b!1562614 (= res!1068356 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50822 _keys!637)) (bvslt from!782 (size!50822 _keys!637))))))

(declare-fun b!1562615 () Bool)

(declare-fun e!870761 () Bool)

(declare-fun tp_is_empty!38723 () Bool)

(assert (=> b!1562615 (= e!870761 tp_is_empty!38723)))

(declare-fun b!1562616 () Bool)

(declare-fun e!870762 () Bool)

(assert (=> b!1562616 (= e!870762 tp_is_empty!38723)))

(declare-fun b!1562617 () Bool)

(declare-fun res!1068359 () Bool)

(assert (=> b!1562617 (=> (not res!1068359) (not e!870759))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1562617 (= res!1068359 (validKeyInArray!0 (select (arr!50272 _keys!637) from!782)))))

(declare-fun mapIsEmpty!59460 () Bool)

(declare-fun mapRes!59460 () Bool)

(assert (=> mapIsEmpty!59460 mapRes!59460))

(declare-fun mapNonEmpty!59460 () Bool)

(declare-fun tp!113295 () Bool)

(assert (=> mapNonEmpty!59460 (= mapRes!59460 (and tp!113295 e!870761))))

(declare-fun mapKey!59460 () (_ BitVec 32))

(declare-fun mapValue!59460 () ValueCell!18331)

(declare-fun mapRest!59460 () (Array (_ BitVec 32) ValueCell!18331))

(assert (=> mapNonEmpty!59460 (= (arr!50273 _values!487) (store mapRest!59460 mapKey!59460 mapValue!59460))))

(declare-fun b!1562618 () Bool)

(declare-fun res!1068360 () Bool)

(assert (=> b!1562618 (=> (not res!1068360) (not e!870759))))

(declare-datatypes ((List!36493 0))(
  ( (Nil!36490) (Cons!36489 (h!37935 (_ BitVec 64)) (t!51340 List!36493)) )
))
(declare-fun arrayNoDuplicates!0 (array!104160 (_ BitVec 32) List!36493) Bool)

(assert (=> b!1562618 (= res!1068360 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36490))))

(declare-fun res!1068358 () Bool)

(assert (=> start!133640 (=> (not res!1068358) (not e!870759))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133640 (= res!1068358 (validMask!0 mask!947))))

(assert (=> start!133640 e!870759))

(assert (=> start!133640 tp!113294))

(assert (=> start!133640 tp_is_empty!38723))

(assert (=> start!133640 true))

(declare-fun array_inv!39073 (array!104160) Bool)

(assert (=> start!133640 (array_inv!39073 _keys!637)))

(declare-fun e!870760 () Bool)

(declare-fun array_inv!39074 (array!104162) Bool)

(assert (=> start!133640 (and (array_inv!39074 _values!487) e!870760)))

(declare-fun b!1562619 () Bool)

(assert (=> b!1562619 (= e!870760 (and e!870762 mapRes!59460))))

(declare-fun condMapEmpty!59460 () Bool)

(declare-fun mapDefault!59460 () ValueCell!18331)

