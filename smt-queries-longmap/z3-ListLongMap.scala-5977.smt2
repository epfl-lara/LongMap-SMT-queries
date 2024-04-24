; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77856 () Bool)

(assert start!77856)

(declare-fun b_free!16273 () Bool)

(declare-fun b_next!16273 () Bool)

(assert (=> start!77856 (= b_free!16273 (not b_next!16273))))

(declare-fun tp!57082 () Bool)

(declare-fun b_and!26709 () Bool)

(assert (=> start!77856 (= tp!57082 b_and!26709)))

(declare-fun b!907010 () Bool)

(declare-fun res!611828 () Bool)

(declare-fun e!508352 () Bool)

(assert (=> b!907010 (=> (not res!611828) (not e!508352))))

(declare-datatypes ((array!53465 0))(
  ( (array!53466 (arr!25687 (Array (_ BitVec 32) (_ BitVec 64))) (size!26147 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53465)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!907010 (= res!611828 (and (= (select (arr!25687 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!907011 () Bool)

(declare-fun e!508359 () Bool)

(declare-fun tp_is_empty!18691 () Bool)

(assert (=> b!907011 (= e!508359 tp_is_empty!18691)))

(declare-fun b!907012 () Bool)

(declare-fun e!508354 () Bool)

(declare-fun e!508356 () Bool)

(declare-fun mapRes!29749 () Bool)

(assert (=> b!907012 (= e!508354 (and e!508356 mapRes!29749))))

(declare-fun condMapEmpty!29749 () Bool)

(declare-datatypes ((V!29887 0))(
  ( (V!29888 (val!9396 Int)) )
))
(declare-datatypes ((ValueCell!8864 0))(
  ( (ValueCellFull!8864 (v!11898 V!29887)) (EmptyCell!8864) )
))
(declare-datatypes ((array!53467 0))(
  ( (array!53468 (arr!25688 (Array (_ BitVec 32) ValueCell!8864)) (size!26148 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53467)

(declare-fun mapDefault!29749 () ValueCell!8864)

(assert (=> b!907012 (= condMapEmpty!29749 (= (arr!25688 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8864)) mapDefault!29749)))))

(declare-fun b!907013 () Bool)

(declare-fun res!611832 () Bool)

(assert (=> b!907013 (=> (not res!611832) (not e!508352))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!907013 (= res!611832 (inRange!0 i!717 mask!1756))))

(declare-fun b!907014 () Bool)

(declare-fun e!508358 () Bool)

(declare-fun e!508357 () Bool)

(assert (=> b!907014 (= e!508358 e!508357)))

(declare-fun res!611824 () Bool)

(assert (=> b!907014 (=> res!611824 e!508357)))

(declare-datatypes ((tuple2!12158 0))(
  ( (tuple2!12159 (_1!6090 (_ BitVec 64)) (_2!6090 V!29887)) )
))
(declare-datatypes ((List!17998 0))(
  ( (Nil!17995) (Cons!17994 (h!19146 tuple2!12158) (t!25435 List!17998)) )
))
(declare-datatypes ((ListLongMap!10857 0))(
  ( (ListLongMap!10858 (toList!5444 List!17998)) )
))
(declare-fun lt!409160 () ListLongMap!10857)

(declare-fun contains!4499 (ListLongMap!10857 (_ BitVec 64)) Bool)

(assert (=> b!907014 (= res!611824 (not (contains!4499 lt!409160 k0!1033)))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29887)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29887)

(declare-fun getCurrentListMap!2710 (array!53465 array!53467 (_ BitVec 32) (_ BitVec 32) V!29887 V!29887 (_ BitVec 32) Int) ListLongMap!10857)

(assert (=> b!907014 (= lt!409160 (getCurrentListMap!2710 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!907015 () Bool)

(declare-fun res!611833 () Bool)

(assert (=> b!907015 (=> res!611833 e!508357)))

(declare-fun lt!409162 () V!29887)

(declare-fun apply!465 (ListLongMap!10857 (_ BitVec 64)) V!29887)

(assert (=> b!907015 (= res!611833 (not (= (apply!465 lt!409160 k0!1033) lt!409162)))))

(declare-fun b!907016 () Bool)

(assert (=> b!907016 (= e!508357 true)))

(declare-fun lt!409158 () ListLongMap!10857)

(assert (=> b!907016 (= (apply!465 lt!409158 k0!1033) lt!409162)))

(declare-datatypes ((Unit!30742 0))(
  ( (Unit!30743) )
))
(declare-fun lt!409159 () Unit!30742)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!20 (array!53465 array!53467 (_ BitVec 32) (_ BitVec 32) V!29887 V!29887 (_ BitVec 64) V!29887 (_ BitVec 32) Int) Unit!30742)

(assert (=> b!907016 (= lt!409159 (lemmaListMapApplyFromThenApplyFromZero!20 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409162 i!717 defaultEntry!1160))))

(declare-fun b!907017 () Bool)

(declare-fun e!508353 () Bool)

(assert (=> b!907017 (= e!508353 e!508352)))

(declare-fun res!611830 () Bool)

(assert (=> b!907017 (=> (not res!611830) (not e!508352))))

(assert (=> b!907017 (= res!611830 (contains!4499 lt!409158 k0!1033))))

(assert (=> b!907017 (= lt!409158 (getCurrentListMap!2710 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun mapIsEmpty!29749 () Bool)

(assert (=> mapIsEmpty!29749 mapRes!29749))

(declare-fun mapNonEmpty!29749 () Bool)

(declare-fun tp!57081 () Bool)

(assert (=> mapNonEmpty!29749 (= mapRes!29749 (and tp!57081 e!508359))))

(declare-fun mapKey!29749 () (_ BitVec 32))

(declare-fun mapRest!29749 () (Array (_ BitVec 32) ValueCell!8864))

(declare-fun mapValue!29749 () ValueCell!8864)

(assert (=> mapNonEmpty!29749 (= (arr!25688 _values!1152) (store mapRest!29749 mapKey!29749 mapValue!29749))))

(declare-fun b!907018 () Bool)

(assert (=> b!907018 (= e!508352 (not e!508358))))

(declare-fun res!611827 () Bool)

(assert (=> b!907018 (=> res!611827 e!508358)))

(assert (=> b!907018 (= res!611827 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26147 _keys!1386))))))

(declare-fun get!13513 (ValueCell!8864 V!29887) V!29887)

(declare-fun dynLambda!1357 (Int (_ BitVec 64)) V!29887)

(assert (=> b!907018 (= lt!409162 (get!13513 (select (arr!25688 _values!1152) i!717) (dynLambda!1357 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53465 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!907018 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!409161 () Unit!30742)

(declare-fun lemmaKeyInListMapIsInArray!216 (array!53465 array!53467 (_ BitVec 32) (_ BitVec 32) V!29887 V!29887 (_ BitVec 64) Int) Unit!30742)

(assert (=> b!907018 (= lt!409161 (lemmaKeyInListMapIsInArray!216 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!907019 () Bool)

(declare-fun res!611831 () Bool)

(assert (=> b!907019 (=> (not res!611831) (not e!508353))))

(declare-datatypes ((List!17999 0))(
  ( (Nil!17996) (Cons!17995 (h!19147 (_ BitVec 64)) (t!25436 List!17999)) )
))
(declare-fun arrayNoDuplicates!0 (array!53465 (_ BitVec 32) List!17999) Bool)

(assert (=> b!907019 (= res!611831 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17996))))

(declare-fun res!611829 () Bool)

(assert (=> start!77856 (=> (not res!611829) (not e!508353))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77856 (= res!611829 (validMask!0 mask!1756))))

(assert (=> start!77856 e!508353))

(declare-fun array_inv!20176 (array!53467) Bool)

(assert (=> start!77856 (and (array_inv!20176 _values!1152) e!508354)))

(assert (=> start!77856 tp!57082))

(assert (=> start!77856 true))

(assert (=> start!77856 tp_is_empty!18691))

(declare-fun array_inv!20177 (array!53465) Bool)

(assert (=> start!77856 (array_inv!20177 _keys!1386)))

(declare-fun b!907020 () Bool)

(declare-fun res!611826 () Bool)

(assert (=> b!907020 (=> (not res!611826) (not e!508353))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53465 (_ BitVec 32)) Bool)

(assert (=> b!907020 (= res!611826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!907021 () Bool)

(assert (=> b!907021 (= e!508356 tp_is_empty!18691)))

(declare-fun b!907022 () Bool)

(declare-fun res!611825 () Bool)

(assert (=> b!907022 (=> (not res!611825) (not e!508353))))

(assert (=> b!907022 (= res!611825 (and (= (size!26148 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26147 _keys!1386) (size!26148 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(assert (= (and start!77856 res!611829) b!907022))

(assert (= (and b!907022 res!611825) b!907020))

(assert (= (and b!907020 res!611826) b!907019))

(assert (= (and b!907019 res!611831) b!907017))

(assert (= (and b!907017 res!611830) b!907013))

(assert (= (and b!907013 res!611832) b!907010))

(assert (= (and b!907010 res!611828) b!907018))

(assert (= (and b!907018 (not res!611827)) b!907014))

(assert (= (and b!907014 (not res!611824)) b!907015))

(assert (= (and b!907015 (not res!611833)) b!907016))

(assert (= (and b!907012 condMapEmpty!29749) mapIsEmpty!29749))

(assert (= (and b!907012 (not condMapEmpty!29749)) mapNonEmpty!29749))

(get-info :version)

(assert (= (and mapNonEmpty!29749 ((_ is ValueCellFull!8864) mapValue!29749)) b!907011))

(assert (= (and b!907012 ((_ is ValueCellFull!8864) mapDefault!29749)) b!907021))

(assert (= start!77856 b!907012))

(declare-fun b_lambda!13161 () Bool)

(assert (=> (not b_lambda!13161) (not b!907018)))

(declare-fun t!25434 () Bool)

(declare-fun tb!5287 () Bool)

(assert (=> (and start!77856 (= defaultEntry!1160 defaultEntry!1160) t!25434) tb!5287))

(declare-fun result!10377 () Bool)

(assert (=> tb!5287 (= result!10377 tp_is_empty!18691)))

(assert (=> b!907018 t!25434))

(declare-fun b_and!26711 () Bool)

(assert (= b_and!26709 (and (=> t!25434 result!10377) b_and!26711)))

(declare-fun m!842789 () Bool)

(assert (=> b!907020 m!842789))

(declare-fun m!842791 () Bool)

(assert (=> b!907014 m!842791))

(declare-fun m!842793 () Bool)

(assert (=> b!907014 m!842793))

(declare-fun m!842795 () Bool)

(assert (=> b!907019 m!842795))

(declare-fun m!842797 () Bool)

(assert (=> b!907010 m!842797))

(declare-fun m!842799 () Bool)

(assert (=> b!907018 m!842799))

(declare-fun m!842801 () Bool)

(assert (=> b!907018 m!842801))

(declare-fun m!842803 () Bool)

(assert (=> b!907018 m!842803))

(declare-fun m!842805 () Bool)

(assert (=> b!907018 m!842805))

(assert (=> b!907018 m!842799))

(assert (=> b!907018 m!842803))

(declare-fun m!842807 () Bool)

(assert (=> b!907018 m!842807))

(declare-fun m!842809 () Bool)

(assert (=> b!907016 m!842809))

(declare-fun m!842811 () Bool)

(assert (=> b!907016 m!842811))

(declare-fun m!842813 () Bool)

(assert (=> b!907017 m!842813))

(declare-fun m!842815 () Bool)

(assert (=> b!907017 m!842815))

(declare-fun m!842817 () Bool)

(assert (=> b!907013 m!842817))

(declare-fun m!842819 () Bool)

(assert (=> mapNonEmpty!29749 m!842819))

(declare-fun m!842821 () Bool)

(assert (=> start!77856 m!842821))

(declare-fun m!842823 () Bool)

(assert (=> start!77856 m!842823))

(declare-fun m!842825 () Bool)

(assert (=> start!77856 m!842825))

(declare-fun m!842827 () Bool)

(assert (=> b!907015 m!842827))

(check-sat (not b!907017) (not b!907019) (not start!77856) (not b!907018) (not b!907015) b_and!26711 (not b!907013) (not b!907014) tp_is_empty!18691 (not mapNonEmpty!29749) (not b!907020) (not b_next!16273) (not b!907016) (not b_lambda!13161))
(check-sat b_and!26711 (not b_next!16273))
