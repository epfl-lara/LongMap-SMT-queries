; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109154 () Bool)

(assert start!109154)

(declare-fun b_free!28643 () Bool)

(declare-fun b_next!28643 () Bool)

(assert (=> start!109154 (= b_free!28643 (not b_next!28643))))

(declare-fun tp!101047 () Bool)

(declare-fun b_and!46733 () Bool)

(assert (=> start!109154 (= tp!101047 b_and!46733)))

(declare-fun b!1290857 () Bool)

(declare-fun res!857589 () Bool)

(declare-fun e!736925 () Bool)

(assert (=> b!1290857 (=> (not res!857589) (not e!736925))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85604 0))(
  ( (array!85605 (arr!41303 (Array (_ BitVec 32) (_ BitVec 64))) (size!41853 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85604)

(assert (=> b!1290857 (= res!857589 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41853 _keys!1741))))))

(declare-fun b!1290858 () Bool)

(declare-fun e!736924 () Bool)

(assert (=> b!1290858 (= e!736925 (not e!736924))))

(declare-fun res!857581 () Bool)

(assert (=> b!1290858 (=> res!857581 e!736924)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1290858 (= res!857581 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((V!50813 0))(
  ( (V!50814 (val!17216 Int)) )
))
(declare-datatypes ((tuple2!22128 0))(
  ( (tuple2!22129 (_1!11075 (_ BitVec 64)) (_2!11075 V!50813)) )
))
(declare-datatypes ((List!29290 0))(
  ( (Nil!29287) (Cons!29286 (h!30495 tuple2!22128) (t!42854 List!29290)) )
))
(declare-datatypes ((ListLongMap!19785 0))(
  ( (ListLongMap!19786 (toList!9908 List!29290)) )
))
(declare-fun contains!8026 (ListLongMap!19785 (_ BitVec 64)) Bool)

(assert (=> b!1290858 (not (contains!8026 (ListLongMap!19786 Nil!29287) k!1205))))

(declare-datatypes ((Unit!42730 0))(
  ( (Unit!42731) )
))
(declare-fun lt!578840 () Unit!42730)

(declare-fun emptyContainsNothing!90 ((_ BitVec 64)) Unit!42730)

(assert (=> b!1290858 (= lt!578840 (emptyContainsNothing!90 k!1205))))

(declare-fun b!1290859 () Bool)

(declare-fun res!857583 () Bool)

(assert (=> b!1290859 (=> (not res!857583) (not e!736925))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85604 (_ BitVec 32)) Bool)

(assert (=> b!1290859 (= res!857583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1290860 () Bool)

(declare-fun res!857588 () Bool)

(assert (=> b!1290860 (=> (not res!857588) (not e!736925))))

(declare-datatypes ((ValueCell!16243 0))(
  ( (ValueCellFull!16243 (v!19819 V!50813)) (EmptyCell!16243) )
))
(declare-datatypes ((array!85606 0))(
  ( (array!85607 (arr!41304 (Array (_ BitVec 32) ValueCell!16243)) (size!41854 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85606)

(assert (=> b!1290860 (= res!857588 (and (= (size!41854 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41853 _keys!1741) (size!41854 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1290861 () Bool)

(declare-fun res!857585 () Bool)

(assert (=> b!1290861 (=> (not res!857585) (not e!736925))))

(assert (=> b!1290861 (= res!857585 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41853 _keys!1741))))))

(declare-fun b!1290862 () Bool)

(declare-fun res!857584 () Bool)

(assert (=> b!1290862 (=> (not res!857584) (not e!736925))))

(declare-fun minValue!1387 () V!50813)

(declare-fun zeroValue!1387 () V!50813)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4962 (array!85604 array!85606 (_ BitVec 32) (_ BitVec 32) V!50813 V!50813 (_ BitVec 32) Int) ListLongMap!19785)

(assert (=> b!1290862 (= res!857584 (contains!8026 (getCurrentListMap!4962 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun res!857582 () Bool)

(assert (=> start!109154 (=> (not res!857582) (not e!736925))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109154 (= res!857582 (validMask!0 mask!2175))))

(assert (=> start!109154 e!736925))

(declare-fun tp_is_empty!34283 () Bool)

(assert (=> start!109154 tp_is_empty!34283))

(assert (=> start!109154 true))

(declare-fun e!736927 () Bool)

(declare-fun array_inv!31301 (array!85606) Bool)

(assert (=> start!109154 (and (array_inv!31301 _values!1445) e!736927)))

(declare-fun array_inv!31302 (array!85604) Bool)

(assert (=> start!109154 (array_inv!31302 _keys!1741)))

(assert (=> start!109154 tp!101047))

(declare-fun b!1290863 () Bool)

(assert (=> b!1290863 (= e!736924 true)))

(assert (=> b!1290863 false))

(declare-fun lt!578838 () ListLongMap!19785)

(declare-fun lt!578839 () Unit!42730)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!48 ((_ BitVec 64) (_ BitVec 64) V!50813 ListLongMap!19785) Unit!42730)

(assert (=> b!1290863 (= lt!578839 (lemmaInListMapAfterAddingDiffThenInBefore!48 k!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!578838))))

(declare-fun lt!578837 () ListLongMap!19785)

(declare-fun +!4374 (ListLongMap!19785 tuple2!22128) ListLongMap!19785)

(assert (=> b!1290863 (not (contains!8026 (+!4374 lt!578837 (tuple2!22129 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k!1205))))

(declare-fun lt!578836 () Unit!42730)

(declare-fun addStillNotContains!392 (ListLongMap!19785 (_ BitVec 64) V!50813 (_ BitVec 64)) Unit!42730)

(assert (=> b!1290863 (= lt!578836 (addStillNotContains!392 lt!578837 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k!1205))))

(assert (=> b!1290863 (not (contains!8026 lt!578838 k!1205))))

(assert (=> b!1290863 (= lt!578838 (+!4374 lt!578837 (tuple2!22129 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!578835 () Unit!42730)

(assert (=> b!1290863 (= lt!578835 (addStillNotContains!392 lt!578837 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6005 (array!85604 array!85606 (_ BitVec 32) (_ BitVec 32) V!50813 V!50813 (_ BitVec 32) Int) ListLongMap!19785)

(assert (=> b!1290863 (= lt!578837 (getCurrentListMapNoExtraKeys!6005 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun mapNonEmpty!52985 () Bool)

(declare-fun mapRes!52985 () Bool)

(declare-fun tp!101048 () Bool)

(declare-fun e!736926 () Bool)

(assert (=> mapNonEmpty!52985 (= mapRes!52985 (and tp!101048 e!736926))))

(declare-fun mapRest!52985 () (Array (_ BitVec 32) ValueCell!16243))

(declare-fun mapKey!52985 () (_ BitVec 32))

(declare-fun mapValue!52985 () ValueCell!16243)

(assert (=> mapNonEmpty!52985 (= (arr!41304 _values!1445) (store mapRest!52985 mapKey!52985 mapValue!52985))))

(declare-fun b!1290864 () Bool)

(declare-fun res!857587 () Bool)

(assert (=> b!1290864 (=> (not res!857587) (not e!736925))))

(declare-datatypes ((List!29291 0))(
  ( (Nil!29288) (Cons!29287 (h!30496 (_ BitVec 64)) (t!42855 List!29291)) )
))
(declare-fun arrayNoDuplicates!0 (array!85604 (_ BitVec 32) List!29291) Bool)

(assert (=> b!1290864 (= res!857587 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29288))))

(declare-fun b!1290865 () Bool)

(assert (=> b!1290865 (= e!736926 tp_is_empty!34283)))

(declare-fun b!1290866 () Bool)

(declare-fun e!736923 () Bool)

(assert (=> b!1290866 (= e!736923 tp_is_empty!34283)))

(declare-fun b!1290867 () Bool)

(declare-fun res!857586 () Bool)

(assert (=> b!1290867 (=> (not res!857586) (not e!736925))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1290867 (= res!857586 (not (validKeyInArray!0 (select (arr!41303 _keys!1741) from!2144))))))

(declare-fun mapIsEmpty!52985 () Bool)

(assert (=> mapIsEmpty!52985 mapRes!52985))

(declare-fun b!1290868 () Bool)

(assert (=> b!1290868 (= e!736927 (and e!736923 mapRes!52985))))

(declare-fun condMapEmpty!52985 () Bool)

(declare-fun mapDefault!52985 () ValueCell!16243)

