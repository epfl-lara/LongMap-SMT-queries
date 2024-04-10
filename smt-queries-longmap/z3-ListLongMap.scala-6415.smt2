; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82288 () Bool)

(assert start!82288)

(declare-fun b_free!18561 () Bool)

(declare-fun b_next!18561 () Bool)

(assert (=> start!82288 (= b_free!18561 (not b_next!18561))))

(declare-fun tp!64644 () Bool)

(declare-fun b_and!30049 () Bool)

(assert (=> start!82288 (= tp!64644 b_and!30049)))

(declare-fun b!959302 () Bool)

(declare-fun e!540778 () Bool)

(assert (=> b!959302 (= e!540778 (not true))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-datatypes ((V!33339 0))(
  ( (V!33340 (val!10684 Int)) )
))
(declare-fun minValue!1328 () V!33339)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58629 0))(
  ( (array!58630 (arr!28188 (Array (_ BitVec 32) (_ BitVec 64))) (size!28667 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58629)

(declare-datatypes ((ValueCell!10152 0))(
  ( (ValueCellFull!10152 (v!13241 V!33339)) (EmptyCell!10152) )
))
(declare-datatypes ((array!58631 0))(
  ( (array!58632 (arr!28189 (Array (_ BitVec 32) ValueCell!10152)) (size!28668 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58631)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33339)

(declare-fun i!793 () (_ BitVec 32))

(declare-datatypes ((tuple2!13782 0))(
  ( (tuple2!13783 (_1!6902 (_ BitVec 64)) (_2!6902 V!33339)) )
))
(declare-datatypes ((List!19600 0))(
  ( (Nil!19597) (Cons!19596 (h!20758 tuple2!13782) (t!27963 List!19600)) )
))
(declare-datatypes ((ListLongMap!12479 0))(
  ( (ListLongMap!12480 (toList!6255 List!19600)) )
))
(declare-fun contains!5356 (ListLongMap!12479 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3488 (array!58629 array!58631 (_ BitVec 32) (_ BitVec 32) V!33339 V!33339 (_ BitVec 32) Int) ListLongMap!12479)

(assert (=> b!959302 (contains!5356 (getCurrentListMap!3488 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 #b00000000000000000000000000000000 defaultEntry!1389) (select (arr!28188 _keys!1668) i!793))))

(declare-datatypes ((Unit!32185 0))(
  ( (Unit!32186) )
))
(declare-fun lt!430533 () Unit!32185)

(declare-fun from!2064 () (_ BitVec 32))

(declare-fun lemmaInListMapFromThenInFromSmaller!14 (array!58629 array!58631 (_ BitVec 32) (_ BitVec 32) V!33339 V!33339 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32185)

(assert (=> b!959302 (= lt!430533 (lemmaInListMapFromThenInFromSmaller!14 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 #b00000000000000000000000000000000 i!793 defaultEntry!1389))))

(declare-fun b!959303 () Bool)

(declare-fun e!540779 () Bool)

(declare-fun e!540776 () Bool)

(declare-fun mapRes!33880 () Bool)

(assert (=> b!959303 (= e!540779 (and e!540776 mapRes!33880))))

(declare-fun condMapEmpty!33880 () Bool)

(declare-fun mapDefault!33880 () ValueCell!10152)

(assert (=> b!959303 (= condMapEmpty!33880 (= (arr!28189 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10152)) mapDefault!33880)))))

(declare-fun b!959304 () Bool)

(declare-fun res!642143 () Bool)

(assert (=> b!959304 (=> (not res!642143) (not e!540778))))

(assert (=> b!959304 (= res!642143 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28667 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28667 _keys!1668))))))

(declare-fun b!959305 () Bool)

(declare-fun tp_is_empty!21267 () Bool)

(assert (=> b!959305 (= e!540776 tp_is_empty!21267)))

(declare-fun mapNonEmpty!33880 () Bool)

(declare-fun tp!64643 () Bool)

(declare-fun e!540777 () Bool)

(assert (=> mapNonEmpty!33880 (= mapRes!33880 (and tp!64643 e!540777))))

(declare-fun mapKey!33880 () (_ BitVec 32))

(declare-fun mapValue!33880 () ValueCell!10152)

(declare-fun mapRest!33880 () (Array (_ BitVec 32) ValueCell!10152))

(assert (=> mapNonEmpty!33880 (= (arr!28189 _values!1386) (store mapRest!33880 mapKey!33880 mapValue!33880))))

(declare-fun b!959306 () Bool)

(declare-fun res!642142 () Bool)

(assert (=> b!959306 (=> (not res!642142) (not e!540778))))

(assert (=> b!959306 (= res!642142 (contains!5356 (getCurrentListMap!3488 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28188 _keys!1668) i!793)))))

(declare-fun b!959307 () Bool)

(assert (=> b!959307 (= e!540777 tp_is_empty!21267)))

(declare-fun mapIsEmpty!33880 () Bool)

(assert (=> mapIsEmpty!33880 mapRes!33880))

(declare-fun b!959309 () Bool)

(declare-fun res!642137 () Bool)

(assert (=> b!959309 (=> (not res!642137) (not e!540778))))

(declare-datatypes ((List!19601 0))(
  ( (Nil!19598) (Cons!19597 (h!20759 (_ BitVec 64)) (t!27964 List!19601)) )
))
(declare-fun arrayNoDuplicates!0 (array!58629 (_ BitVec 32) List!19601) Bool)

(assert (=> b!959309 (= res!642137 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19598))))

(declare-fun b!959308 () Bool)

(declare-fun res!642138 () Bool)

(assert (=> b!959308 (=> (not res!642138) (not e!540778))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!959308 (= res!642138 (validKeyInArray!0 (select (arr!28188 _keys!1668) i!793)))))

(declare-fun res!642141 () Bool)

(assert (=> start!82288 (=> (not res!642141) (not e!540778))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82288 (= res!642141 (validMask!0 mask!2088))))

(assert (=> start!82288 e!540778))

(assert (=> start!82288 true))

(assert (=> start!82288 tp_is_empty!21267))

(declare-fun array_inv!21853 (array!58629) Bool)

(assert (=> start!82288 (array_inv!21853 _keys!1668)))

(declare-fun array_inv!21854 (array!58631) Bool)

(assert (=> start!82288 (and (array_inv!21854 _values!1386) e!540779)))

(assert (=> start!82288 tp!64644))

(declare-fun b!959310 () Bool)

(declare-fun res!642140 () Bool)

(assert (=> b!959310 (=> (not res!642140) (not e!540778))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58629 (_ BitVec 32)) Bool)

(assert (=> b!959310 (= res!642140 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!959311 () Bool)

(declare-fun res!642139 () Bool)

(assert (=> b!959311 (=> (not res!642139) (not e!540778))))

(assert (=> b!959311 (= res!642139 (and (= (size!28668 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28667 _keys!1668) (size!28668 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(assert (= (and start!82288 res!642141) b!959311))

(assert (= (and b!959311 res!642139) b!959310))

(assert (= (and b!959310 res!642140) b!959309))

(assert (= (and b!959309 res!642137) b!959304))

(assert (= (and b!959304 res!642143) b!959308))

(assert (= (and b!959308 res!642138) b!959306))

(assert (= (and b!959306 res!642142) b!959302))

(assert (= (and b!959303 condMapEmpty!33880) mapIsEmpty!33880))

(assert (= (and b!959303 (not condMapEmpty!33880)) mapNonEmpty!33880))

(get-info :version)

(assert (= (and mapNonEmpty!33880 ((_ is ValueCellFull!10152) mapValue!33880)) b!959307))

(assert (= (and b!959303 ((_ is ValueCellFull!10152) mapDefault!33880)) b!959305))

(assert (= start!82288 b!959303))

(declare-fun m!889813 () Bool)

(assert (=> start!82288 m!889813))

(declare-fun m!889815 () Bool)

(assert (=> start!82288 m!889815))

(declare-fun m!889817 () Bool)

(assert (=> start!82288 m!889817))

(declare-fun m!889819 () Bool)

(assert (=> mapNonEmpty!33880 m!889819))

(declare-fun m!889821 () Bool)

(assert (=> b!959310 m!889821))

(declare-fun m!889823 () Bool)

(assert (=> b!959309 m!889823))

(declare-fun m!889825 () Bool)

(assert (=> b!959306 m!889825))

(declare-fun m!889827 () Bool)

(assert (=> b!959306 m!889827))

(assert (=> b!959306 m!889825))

(assert (=> b!959306 m!889827))

(declare-fun m!889829 () Bool)

(assert (=> b!959306 m!889829))

(declare-fun m!889831 () Bool)

(assert (=> b!959302 m!889831))

(assert (=> b!959302 m!889827))

(assert (=> b!959302 m!889831))

(assert (=> b!959302 m!889827))

(declare-fun m!889833 () Bool)

(assert (=> b!959302 m!889833))

(declare-fun m!889835 () Bool)

(assert (=> b!959302 m!889835))

(assert (=> b!959308 m!889827))

(assert (=> b!959308 m!889827))

(declare-fun m!889837 () Bool)

(assert (=> b!959308 m!889837))

(check-sat b_and!30049 (not b!959308) (not mapNonEmpty!33880) (not b!959310) (not b!959302) (not b!959309) (not b_next!18561) (not start!82288) tp_is_empty!21267 (not b!959306))
(check-sat b_and!30049 (not b_next!18561))
