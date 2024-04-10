; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133638 () Bool)

(assert start!133638)

(declare-fun b_free!32055 () Bool)

(declare-fun b_next!32055 () Bool)

(assert (=> start!133638 (= b_free!32055 (not b_next!32055))))

(declare-fun tp!113289 () Bool)

(declare-fun b_and!51621 () Bool)

(assert (=> start!133638 (= tp!113289 b_and!51621)))

(declare-fun b!1562582 () Bool)

(declare-fun res!1068340 () Bool)

(declare-fun e!870746 () Bool)

(assert (=> b!1562582 (=> (not res!1068340) (not e!870746))))

(declare-datatypes ((array!104156 0))(
  ( (array!104157 (arr!50270 (Array (_ BitVec 32) (_ BitVec 64))) (size!50820 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104156)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1562582 (= res!1068340 (validKeyInArray!0 (select (arr!50270 _keys!637) from!782)))))

(declare-fun mapNonEmpty!59457 () Bool)

(declare-fun mapRes!59457 () Bool)

(declare-fun tp!113288 () Bool)

(declare-fun e!870745 () Bool)

(assert (=> mapNonEmpty!59457 (= mapRes!59457 (and tp!113288 e!870745))))

(declare-datatypes ((V!59835 0))(
  ( (V!59836 (val!19444 Int)) )
))
(declare-datatypes ((ValueCell!18330 0))(
  ( (ValueCellFull!18330 (v!22196 V!59835)) (EmptyCell!18330) )
))
(declare-fun mapValue!59457 () ValueCell!18330)

(declare-datatypes ((array!104158 0))(
  ( (array!104159 (arr!50271 (Array (_ BitVec 32) ValueCell!18330)) (size!50821 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104158)

(declare-fun mapKey!59457 () (_ BitVec 32))

(declare-fun mapRest!59457 () (Array (_ BitVec 32) ValueCell!18330))

(assert (=> mapNonEmpty!59457 (= (arr!50271 _values!487) (store mapRest!59457 mapKey!59457 mapValue!59457))))

(declare-fun b!1562583 () Bool)

(declare-fun res!1068341 () Bool)

(assert (=> b!1562583 (=> (not res!1068341) (not e!870746))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun mask!947 () (_ BitVec 32))

(assert (=> b!1562583 (= res!1068341 (and (= (size!50821 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50820 _keys!637) (size!50821 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1562584 () Bool)

(declare-fun e!870744 () Bool)

(declare-fun e!870748 () Bool)

(assert (=> b!1562584 (= e!870744 (and e!870748 mapRes!59457))))

(declare-fun condMapEmpty!59457 () Bool)

(declare-fun mapDefault!59457 () ValueCell!18330)

(assert (=> b!1562584 (= condMapEmpty!59457 (= (arr!50271 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18330)) mapDefault!59457)))))

(declare-fun b!1562585 () Bool)

(assert (=> b!1562585 (= e!870746 (not true))))

(declare-fun lt!671739 () Bool)

(declare-datatypes ((tuple2!25120 0))(
  ( (tuple2!25121 (_1!12571 (_ BitVec 64)) (_2!12571 V!59835)) )
))
(declare-datatypes ((List!36490 0))(
  ( (Nil!36487) (Cons!36486 (h!37932 tuple2!25120) (t!51335 List!36490)) )
))
(declare-datatypes ((ListLongMap!22555 0))(
  ( (ListLongMap!22556 (toList!11293 List!36490)) )
))
(declare-fun lt!671737 () ListLongMap!22555)

(declare-fun contains!10283 (ListLongMap!22555 (_ BitVec 64)) Bool)

(assert (=> b!1562585 (= lt!671739 (contains!10283 lt!671737 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1562585 (not (contains!10283 lt!671737 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!671736 () ListLongMap!22555)

(declare-fun lt!671738 () V!59835)

(declare-fun +!5063 (ListLongMap!22555 tuple2!25120) ListLongMap!22555)

(assert (=> b!1562585 (= lt!671737 (+!5063 lt!671736 (tuple2!25121 (select (arr!50270 _keys!637) from!782) lt!671738)))))

(declare-datatypes ((Unit!51980 0))(
  ( (Unit!51981) )
))
(declare-fun lt!671735 () Unit!51980)

(declare-fun addStillNotContains!553 (ListLongMap!22555 (_ BitVec 64) V!59835 (_ BitVec 64)) Unit!51980)

(assert (=> b!1562585 (= lt!671735 (addStillNotContains!553 lt!671736 (select (arr!50270 _keys!637) from!782) lt!671738 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26258 (ValueCell!18330 V!59835) V!59835)

(declare-fun dynLambda!3847 (Int (_ BitVec 64)) V!59835)

(assert (=> b!1562585 (= lt!671738 (get!26258 (select (arr!50271 _values!487) from!782) (dynLambda!3847 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59835)

(declare-fun minValue!453 () V!59835)

(declare-fun getCurrentListMapNoExtraKeys!6677 (array!104156 array!104158 (_ BitVec 32) (_ BitVec 32) V!59835 V!59835 (_ BitVec 32) Int) ListLongMap!22555)

(assert (=> b!1562585 (= lt!671736 (getCurrentListMapNoExtraKeys!6677 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1562586 () Bool)

(declare-fun res!1068339 () Bool)

(assert (=> b!1562586 (=> (not res!1068339) (not e!870746))))

(assert (=> b!1562586 (= res!1068339 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50820 _keys!637)) (bvslt from!782 (size!50820 _keys!637))))))

(declare-fun b!1562587 () Bool)

(declare-fun tp_is_empty!38721 () Bool)

(assert (=> b!1562587 (= e!870748 tp_is_empty!38721)))

(declare-fun b!1562588 () Bool)

(declare-fun res!1068337 () Bool)

(assert (=> b!1562588 (=> (not res!1068337) (not e!870746))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104156 (_ BitVec 32)) Bool)

(assert (=> b!1562588 (= res!1068337 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1562589 () Bool)

(declare-fun res!1068342 () Bool)

(assert (=> b!1562589 (=> (not res!1068342) (not e!870746))))

(declare-datatypes ((List!36491 0))(
  ( (Nil!36488) (Cons!36487 (h!37933 (_ BitVec 64)) (t!51336 List!36491)) )
))
(declare-fun arrayNoDuplicates!0 (array!104156 (_ BitVec 32) List!36491) Bool)

(assert (=> b!1562589 (= res!1068342 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36488))))

(declare-fun b!1562590 () Bool)

(assert (=> b!1562590 (= e!870745 tp_is_empty!38721)))

(declare-fun res!1068338 () Bool)

(assert (=> start!133638 (=> (not res!1068338) (not e!870746))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133638 (= res!1068338 (validMask!0 mask!947))))

(assert (=> start!133638 e!870746))

(assert (=> start!133638 tp!113289))

(assert (=> start!133638 tp_is_empty!38721))

(assert (=> start!133638 true))

(declare-fun array_inv!39071 (array!104156) Bool)

(assert (=> start!133638 (array_inv!39071 _keys!637)))

(declare-fun array_inv!39072 (array!104158) Bool)

(assert (=> start!133638 (and (array_inv!39072 _values!487) e!870744)))

(declare-fun mapIsEmpty!59457 () Bool)

(assert (=> mapIsEmpty!59457 mapRes!59457))

(assert (= (and start!133638 res!1068338) b!1562583))

(assert (= (and b!1562583 res!1068341) b!1562588))

(assert (= (and b!1562588 res!1068337) b!1562589))

(assert (= (and b!1562589 res!1068342) b!1562586))

(assert (= (and b!1562586 res!1068339) b!1562582))

(assert (= (and b!1562582 res!1068340) b!1562585))

(assert (= (and b!1562584 condMapEmpty!59457) mapIsEmpty!59457))

(assert (= (and b!1562584 (not condMapEmpty!59457)) mapNonEmpty!59457))

(get-info :version)

(assert (= (and mapNonEmpty!59457 ((_ is ValueCellFull!18330) mapValue!59457)) b!1562590))

(assert (= (and b!1562584 ((_ is ValueCellFull!18330) mapDefault!59457)) b!1562587))

(assert (= start!133638 b!1562584))

(declare-fun b_lambda!24929 () Bool)

(assert (=> (not b_lambda!24929) (not b!1562585)))

(declare-fun t!51334 () Bool)

(declare-fun tb!12599 () Bool)

(assert (=> (and start!133638 (= defaultEntry!495 defaultEntry!495) t!51334) tb!12599))

(declare-fun result!26479 () Bool)

(assert (=> tb!12599 (= result!26479 tp_is_empty!38721)))

(assert (=> b!1562585 t!51334))

(declare-fun b_and!51623 () Bool)

(assert (= b_and!51621 (and (=> t!51334 result!26479) b_and!51623)))

(declare-fun m!1438353 () Bool)

(assert (=> b!1562589 m!1438353))

(declare-fun m!1438355 () Bool)

(assert (=> b!1562585 m!1438355))

(declare-fun m!1438357 () Bool)

(assert (=> b!1562585 m!1438357))

(declare-fun m!1438359 () Bool)

(assert (=> b!1562585 m!1438359))

(assert (=> b!1562585 m!1438355))

(declare-fun m!1438361 () Bool)

(assert (=> b!1562585 m!1438361))

(declare-fun m!1438363 () Bool)

(assert (=> b!1562585 m!1438363))

(assert (=> b!1562585 m!1438363))

(declare-fun m!1438365 () Bool)

(assert (=> b!1562585 m!1438365))

(declare-fun m!1438367 () Bool)

(assert (=> b!1562585 m!1438367))

(declare-fun m!1438369 () Bool)

(assert (=> b!1562585 m!1438369))

(assert (=> b!1562585 m!1438357))

(declare-fun m!1438371 () Bool)

(assert (=> b!1562585 m!1438371))

(declare-fun m!1438373 () Bool)

(assert (=> mapNonEmpty!59457 m!1438373))

(assert (=> b!1562582 m!1438363))

(assert (=> b!1562582 m!1438363))

(declare-fun m!1438375 () Bool)

(assert (=> b!1562582 m!1438375))

(declare-fun m!1438377 () Bool)

(assert (=> b!1562588 m!1438377))

(declare-fun m!1438379 () Bool)

(assert (=> start!133638 m!1438379))

(declare-fun m!1438381 () Bool)

(assert (=> start!133638 m!1438381))

(declare-fun m!1438383 () Bool)

(assert (=> start!133638 m!1438383))

(check-sat (not b!1562589) (not b!1562588) (not start!133638) b_and!51623 (not b_lambda!24929) (not b!1562585) (not mapNonEmpty!59457) (not b_next!32055) (not b!1562582) tp_is_empty!38721)
(check-sat b_and!51623 (not b_next!32055))
