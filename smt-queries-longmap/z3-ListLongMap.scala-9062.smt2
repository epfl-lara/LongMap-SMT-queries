; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109156 () Bool)

(assert start!109156)

(declare-fun b_free!28645 () Bool)

(declare-fun b_next!28645 () Bool)

(assert (=> start!109156 (= b_free!28645 (not b_next!28645))))

(declare-fun tp!101055 () Bool)

(declare-fun b_and!46717 () Bool)

(assert (=> start!109156 (= tp!101055 b_and!46717)))

(declare-fun b!1290829 () Bool)

(declare-fun e!736913 () Bool)

(declare-fun e!736915 () Bool)

(declare-fun mapRes!52988 () Bool)

(assert (=> b!1290829 (= e!736913 (and e!736915 mapRes!52988))))

(declare-fun condMapEmpty!52988 () Bool)

(declare-datatypes ((V!50817 0))(
  ( (V!50818 (val!17217 Int)) )
))
(declare-datatypes ((ValueCell!16244 0))(
  ( (ValueCellFull!16244 (v!19819 V!50817)) (EmptyCell!16244) )
))
(declare-datatypes ((array!85499 0))(
  ( (array!85500 (arr!41251 (Array (_ BitVec 32) ValueCell!16244)) (size!41803 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85499)

(declare-fun mapDefault!52988 () ValueCell!16244)

(assert (=> b!1290829 (= condMapEmpty!52988 (= (arr!41251 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16244)) mapDefault!52988)))))

(declare-fun mapNonEmpty!52988 () Bool)

(declare-fun tp!101054 () Bool)

(declare-fun e!736914 () Bool)

(assert (=> mapNonEmpty!52988 (= mapRes!52988 (and tp!101054 e!736914))))

(declare-fun mapRest!52988 () (Array (_ BitVec 32) ValueCell!16244))

(declare-fun mapKey!52988 () (_ BitVec 32))

(declare-fun mapValue!52988 () ValueCell!16244)

(assert (=> mapNonEmpty!52988 (= (arr!41251 _values!1445) (store mapRest!52988 mapKey!52988 mapValue!52988))))

(declare-fun b!1290830 () Bool)

(declare-fun tp_is_empty!34285 () Bool)

(assert (=> b!1290830 (= e!736915 tp_is_empty!34285)))

(declare-fun b!1290831 () Bool)

(declare-fun res!857583 () Bool)

(declare-fun e!736912 () Bool)

(assert (=> b!1290831 (=> (not res!857583) (not e!736912))))

(declare-datatypes ((array!85501 0))(
  ( (array!85502 (arr!41252 (Array (_ BitVec 32) (_ BitVec 64))) (size!41804 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85501)

(declare-datatypes ((List!29336 0))(
  ( (Nil!29333) (Cons!29332 (h!30541 (_ BitVec 64)) (t!42892 List!29336)) )
))
(declare-fun arrayNoDuplicates!0 (array!85501 (_ BitVec 32) List!29336) Bool)

(assert (=> b!1290831 (= res!857583 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29333))))

(declare-fun b!1290832 () Bool)

(declare-fun res!857587 () Bool)

(assert (=> b!1290832 (=> (not res!857587) (not e!736912))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1290832 (= res!857587 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41804 _keys!1741))))))

(declare-fun res!857588 () Bool)

(assert (=> start!109156 (=> (not res!857588) (not e!736912))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109156 (= res!857588 (validMask!0 mask!2175))))

(assert (=> start!109156 e!736912))

(assert (=> start!109156 tp_is_empty!34285))

(assert (=> start!109156 true))

(declare-fun array_inv!31425 (array!85499) Bool)

(assert (=> start!109156 (and (array_inv!31425 _values!1445) e!736913)))

(declare-fun array_inv!31426 (array!85501) Bool)

(assert (=> start!109156 (array_inv!31426 _keys!1741)))

(assert (=> start!109156 tp!101055))

(declare-fun mapIsEmpty!52988 () Bool)

(assert (=> mapIsEmpty!52988 mapRes!52988))

(declare-fun b!1290833 () Bool)

(declare-fun res!857589 () Bool)

(assert (=> b!1290833 (=> (not res!857589) (not e!736912))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85501 (_ BitVec 32)) Bool)

(assert (=> b!1290833 (= res!857589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1290834 () Bool)

(declare-fun e!736917 () Bool)

(assert (=> b!1290834 (= e!736917 true)))

(assert (=> b!1290834 false))

(declare-fun minValue!1387 () V!50817)

(declare-datatypes ((Unit!42560 0))(
  ( (Unit!42561) )
))
(declare-fun lt!578675 () Unit!42560)

(declare-datatypes ((tuple2!22180 0))(
  ( (tuple2!22181 (_1!11101 (_ BitVec 64)) (_2!11101 V!50817)) )
))
(declare-datatypes ((List!29337 0))(
  ( (Nil!29334) (Cons!29333 (h!30542 tuple2!22180) (t!42893 List!29337)) )
))
(declare-datatypes ((ListLongMap!19837 0))(
  ( (ListLongMap!19838 (toList!9934 List!29337)) )
))
(declare-fun lt!578678 () ListLongMap!19837)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!49 ((_ BitVec 64) (_ BitVec 64) V!50817 ListLongMap!19837) Unit!42560)

(assert (=> b!1290834 (= lt!578675 (lemmaInListMapAfterAddingDiffThenInBefore!49 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!578678))))

(declare-fun lt!578679 () ListLongMap!19837)

(declare-fun contains!7982 (ListLongMap!19837 (_ BitVec 64)) Bool)

(declare-fun +!4408 (ListLongMap!19837 tuple2!22180) ListLongMap!19837)

(assert (=> b!1290834 (not (contains!7982 (+!4408 lt!578679 (tuple2!22181 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!578677 () Unit!42560)

(declare-fun addStillNotContains!385 (ListLongMap!19837 (_ BitVec 64) V!50817 (_ BitVec 64)) Unit!42560)

(assert (=> b!1290834 (= lt!578677 (addStillNotContains!385 lt!578679 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1290834 (not (contains!7982 lt!578678 k0!1205))))

(declare-fun zeroValue!1387 () V!50817)

(assert (=> b!1290834 (= lt!578678 (+!4408 lt!578679 (tuple2!22181 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!578676 () Unit!42560)

(assert (=> b!1290834 (= lt!578676 (addStillNotContains!385 lt!578679 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6039 (array!85501 array!85499 (_ BitVec 32) (_ BitVec 32) V!50817 V!50817 (_ BitVec 32) Int) ListLongMap!19837)

(assert (=> b!1290834 (= lt!578679 (getCurrentListMapNoExtraKeys!6039 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1290835 () Bool)

(assert (=> b!1290835 (= e!736912 (not e!736917))))

(declare-fun res!857586 () Bool)

(assert (=> b!1290835 (=> res!857586 e!736917)))

(assert (=> b!1290835 (= res!857586 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1290835 (not (contains!7982 (ListLongMap!19838 Nil!29334) k0!1205))))

(declare-fun lt!578680 () Unit!42560)

(declare-fun emptyContainsNothing!78 ((_ BitVec 64)) Unit!42560)

(assert (=> b!1290835 (= lt!578680 (emptyContainsNothing!78 k0!1205))))

(declare-fun b!1290836 () Bool)

(declare-fun res!857585 () Bool)

(assert (=> b!1290836 (=> (not res!857585) (not e!736912))))

(declare-fun getCurrentListMap!4882 (array!85501 array!85499 (_ BitVec 32) (_ BitVec 32) V!50817 V!50817 (_ BitVec 32) Int) ListLongMap!19837)

(assert (=> b!1290836 (= res!857585 (contains!7982 (getCurrentListMap!4882 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1290837 () Bool)

(declare-fun res!857582 () Bool)

(assert (=> b!1290837 (=> (not res!857582) (not e!736912))))

(assert (=> b!1290837 (= res!857582 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41804 _keys!1741))))))

(declare-fun b!1290838 () Bool)

(declare-fun res!857584 () Bool)

(assert (=> b!1290838 (=> (not res!857584) (not e!736912))))

(assert (=> b!1290838 (= res!857584 (and (= (size!41803 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41804 _keys!1741) (size!41803 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1290839 () Bool)

(declare-fun res!857581 () Bool)

(assert (=> b!1290839 (=> (not res!857581) (not e!736912))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1290839 (= res!857581 (not (validKeyInArray!0 (select (arr!41252 _keys!1741) from!2144))))))

(declare-fun b!1290840 () Bool)

(assert (=> b!1290840 (= e!736914 tp_is_empty!34285)))

(assert (= (and start!109156 res!857588) b!1290838))

(assert (= (and b!1290838 res!857584) b!1290833))

(assert (= (and b!1290833 res!857589) b!1290831))

(assert (= (and b!1290831 res!857583) b!1290837))

(assert (= (and b!1290837 res!857582) b!1290836))

(assert (= (and b!1290836 res!857585) b!1290832))

(assert (= (and b!1290832 res!857587) b!1290839))

(assert (= (and b!1290839 res!857581) b!1290835))

(assert (= (and b!1290835 (not res!857586)) b!1290834))

(assert (= (and b!1290829 condMapEmpty!52988) mapIsEmpty!52988))

(assert (= (and b!1290829 (not condMapEmpty!52988)) mapNonEmpty!52988))

(get-info :version)

(assert (= (and mapNonEmpty!52988 ((_ is ValueCellFull!16244) mapValue!52988)) b!1290840))

(assert (= (and b!1290829 ((_ is ValueCellFull!16244) mapDefault!52988)) b!1290830))

(assert (= start!109156 b!1290829))

(declare-fun m!1183035 () Bool)

(assert (=> b!1290836 m!1183035))

(assert (=> b!1290836 m!1183035))

(declare-fun m!1183037 () Bool)

(assert (=> b!1290836 m!1183037))

(declare-fun m!1183039 () Bool)

(assert (=> b!1290835 m!1183039))

(declare-fun m!1183041 () Bool)

(assert (=> b!1290835 m!1183041))

(declare-fun m!1183043 () Bool)

(assert (=> start!109156 m!1183043))

(declare-fun m!1183045 () Bool)

(assert (=> start!109156 m!1183045))

(declare-fun m!1183047 () Bool)

(assert (=> start!109156 m!1183047))

(declare-fun m!1183049 () Bool)

(assert (=> b!1290839 m!1183049))

(assert (=> b!1290839 m!1183049))

(declare-fun m!1183051 () Bool)

(assert (=> b!1290839 m!1183051))

(declare-fun m!1183053 () Bool)

(assert (=> b!1290833 m!1183053))

(declare-fun m!1183055 () Bool)

(assert (=> b!1290831 m!1183055))

(declare-fun m!1183057 () Bool)

(assert (=> b!1290834 m!1183057))

(declare-fun m!1183059 () Bool)

(assert (=> b!1290834 m!1183059))

(declare-fun m!1183061 () Bool)

(assert (=> b!1290834 m!1183061))

(declare-fun m!1183063 () Bool)

(assert (=> b!1290834 m!1183063))

(declare-fun m!1183065 () Bool)

(assert (=> b!1290834 m!1183065))

(assert (=> b!1290834 m!1183057))

(declare-fun m!1183067 () Bool)

(assert (=> b!1290834 m!1183067))

(declare-fun m!1183069 () Bool)

(assert (=> b!1290834 m!1183069))

(declare-fun m!1183071 () Bool)

(assert (=> b!1290834 m!1183071))

(declare-fun m!1183073 () Bool)

(assert (=> mapNonEmpty!52988 m!1183073))

(check-sat (not b!1290836) (not b!1290835) b_and!46717 (not b_next!28645) (not b!1290831) (not mapNonEmpty!52988) tp_is_empty!34285 (not start!109156) (not b!1290833) (not b!1290839) (not b!1290834))
(check-sat b_and!46717 (not b_next!28645))
