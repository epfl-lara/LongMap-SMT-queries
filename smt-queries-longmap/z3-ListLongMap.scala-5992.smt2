; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77786 () Bool)

(assert start!77786)

(declare-fun b_free!16363 () Bool)

(declare-fun b_next!16363 () Bool)

(assert (=> start!77786 (= b_free!16363 (not b_next!16363))))

(declare-fun tp!57354 () Bool)

(declare-fun b_and!26857 () Bool)

(assert (=> start!77786 (= tp!57354 b_and!26857)))

(declare-fun b!907865 () Bool)

(declare-fun res!612787 () Bool)

(declare-fun e!508806 () Bool)

(assert (=> b!907865 (=> (not res!612787) (not e!508806))))

(declare-datatypes ((V!30007 0))(
  ( (V!30008 (val!9441 Int)) )
))
(declare-datatypes ((ValueCell!8909 0))(
  ( (ValueCellFull!8909 (v!11947 V!30007)) (EmptyCell!8909) )
))
(declare-datatypes ((array!53575 0))(
  ( (array!53576 (arr!25746 (Array (_ BitVec 32) ValueCell!8909)) (size!26207 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53575)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53577 0))(
  ( (array!53578 (arr!25747 (Array (_ BitVec 32) (_ BitVec 64))) (size!26208 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53577)

(assert (=> b!907865 (= res!612787 (and (= (size!26207 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26208 _keys!1386) (size!26207 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!907866 () Bool)

(declare-fun e!508804 () Bool)

(declare-fun tp_is_empty!18781 () Bool)

(assert (=> b!907866 (= e!508804 tp_is_empty!18781)))

(declare-fun b!907867 () Bool)

(declare-fun e!508809 () Bool)

(declare-fun e!508810 () Bool)

(assert (=> b!907867 (= e!508809 e!508810)))

(declare-fun res!612784 () Bool)

(assert (=> b!907867 (=> res!612784 e!508810)))

(declare-datatypes ((tuple2!12326 0))(
  ( (tuple2!12327 (_1!6174 (_ BitVec 64)) (_2!6174 V!30007)) )
))
(declare-datatypes ((List!18111 0))(
  ( (Nil!18108) (Cons!18107 (h!19253 tuple2!12326) (t!25637 List!18111)) )
))
(declare-datatypes ((ListLongMap!11013 0))(
  ( (ListLongMap!11014 (toList!5522 List!18111)) )
))
(declare-fun lt!409358 () ListLongMap!11013)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun contains!4523 (ListLongMap!11013 (_ BitVec 64)) Bool)

(assert (=> b!907867 (= res!612784 (not (contains!4523 lt!409358 k0!1033)))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun i!717 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30007)

(declare-fun minValue!1094 () V!30007)

(declare-fun getCurrentListMap!2726 (array!53577 array!53575 (_ BitVec 32) (_ BitVec 32) V!30007 V!30007 (_ BitVec 32) Int) ListLongMap!11013)

(assert (=> b!907867 (= lt!409358 (getCurrentListMap!2726 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!907868 () Bool)

(declare-fun res!612788 () Bool)

(declare-fun e!508811 () Bool)

(assert (=> b!907868 (=> (not res!612788) (not e!508811))))

(assert (=> b!907868 (= res!612788 (and (= (select (arr!25747 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!907869 () Bool)

(declare-fun res!612793 () Bool)

(assert (=> b!907869 (=> (not res!612793) (not e!508806))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53577 (_ BitVec 32)) Bool)

(assert (=> b!907869 (= res!612793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapNonEmpty!29887 () Bool)

(declare-fun mapRes!29887 () Bool)

(declare-fun tp!57355 () Bool)

(declare-fun e!508807 () Bool)

(assert (=> mapNonEmpty!29887 (= mapRes!29887 (and tp!57355 e!508807))))

(declare-fun mapRest!29887 () (Array (_ BitVec 32) ValueCell!8909))

(declare-fun mapKey!29887 () (_ BitVec 32))

(declare-fun mapValue!29887 () ValueCell!8909)

(assert (=> mapNonEmpty!29887 (= (arr!25746 _values!1152) (store mapRest!29887 mapKey!29887 mapValue!29887))))

(declare-fun b!907870 () Bool)

(declare-fun res!612789 () Bool)

(assert (=> b!907870 (=> (not res!612789) (not e!508811))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!907870 (= res!612789 (inRange!0 i!717 mask!1756))))

(declare-fun b!907871 () Bool)

(declare-fun res!612785 () Bool)

(assert (=> b!907871 (=> (not res!612785) (not e!508806))))

(declare-datatypes ((List!18112 0))(
  ( (Nil!18109) (Cons!18108 (h!19254 (_ BitVec 64)) (t!25638 List!18112)) )
))
(declare-fun arrayNoDuplicates!0 (array!53577 (_ BitVec 32) List!18112) Bool)

(assert (=> b!907871 (= res!612785 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18109))))

(declare-fun res!612792 () Bool)

(assert (=> start!77786 (=> (not res!612792) (not e!508806))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77786 (= res!612792 (validMask!0 mask!1756))))

(assert (=> start!77786 e!508806))

(declare-fun e!508805 () Bool)

(declare-fun array_inv!20200 (array!53575) Bool)

(assert (=> start!77786 (and (array_inv!20200 _values!1152) e!508805)))

(assert (=> start!77786 tp!57354))

(assert (=> start!77786 true))

(assert (=> start!77786 tp_is_empty!18781))

(declare-fun array_inv!20201 (array!53577) Bool)

(assert (=> start!77786 (array_inv!20201 _keys!1386)))

(declare-fun b!907872 () Bool)

(assert (=> b!907872 (= e!508805 (and e!508804 mapRes!29887))))

(declare-fun condMapEmpty!29887 () Bool)

(declare-fun mapDefault!29887 () ValueCell!8909)

(assert (=> b!907872 (= condMapEmpty!29887 (= (arr!25746 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8909)) mapDefault!29887)))))

(declare-fun b!907873 () Bool)

(assert (=> b!907873 (= e!508807 tp_is_empty!18781)))

(declare-fun mapIsEmpty!29887 () Bool)

(assert (=> mapIsEmpty!29887 mapRes!29887))

(declare-fun b!907874 () Bool)

(assert (=> b!907874 (= e!508811 (not e!508809))))

(declare-fun res!612786 () Bool)

(assert (=> b!907874 (=> res!612786 e!508809)))

(assert (=> b!907874 (= res!612786 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26208 _keys!1386))))))

(declare-fun lt!409356 () V!30007)

(declare-fun get!13553 (ValueCell!8909 V!30007) V!30007)

(declare-fun dynLambda!1363 (Int (_ BitVec 64)) V!30007)

(assert (=> b!907874 (= lt!409356 (get!13553 (select (arr!25746 _values!1152) i!717) (dynLambda!1363 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53577 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!907874 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30746 0))(
  ( (Unit!30747) )
))
(declare-fun lt!409359 () Unit!30746)

(declare-fun lemmaKeyInListMapIsInArray!239 (array!53577 array!53575 (_ BitVec 32) (_ BitVec 32) V!30007 V!30007 (_ BitVec 64) Int) Unit!30746)

(assert (=> b!907874 (= lt!409359 (lemmaKeyInListMapIsInArray!239 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!907875 () Bool)

(assert (=> b!907875 (= e!508810 true)))

(declare-fun lt!409357 () ListLongMap!11013)

(declare-fun apply!496 (ListLongMap!11013 (_ BitVec 64)) V!30007)

(assert (=> b!907875 (= (apply!496 lt!409357 k0!1033) lt!409356)))

(declare-fun lt!409355 () Unit!30746)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!55 (array!53577 array!53575 (_ BitVec 32) (_ BitVec 32) V!30007 V!30007 (_ BitVec 64) V!30007 (_ BitVec 32) Int) Unit!30746)

(assert (=> b!907875 (= lt!409355 (lemmaListMapApplyFromThenApplyFromZero!55 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409356 i!717 defaultEntry!1160))))

(declare-fun b!907876 () Bool)

(declare-fun res!612791 () Bool)

(assert (=> b!907876 (=> res!612791 e!508810)))

(assert (=> b!907876 (= res!612791 (not (= (apply!496 lt!409358 k0!1033) lt!409356)))))

(declare-fun b!907877 () Bool)

(assert (=> b!907877 (= e!508806 e!508811)))

(declare-fun res!612790 () Bool)

(assert (=> b!907877 (=> (not res!612790) (not e!508811))))

(assert (=> b!907877 (= res!612790 (contains!4523 lt!409357 k0!1033))))

(assert (=> b!907877 (= lt!409357 (getCurrentListMap!2726 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(assert (= (and start!77786 res!612792) b!907865))

(assert (= (and b!907865 res!612787) b!907869))

(assert (= (and b!907869 res!612793) b!907871))

(assert (= (and b!907871 res!612785) b!907877))

(assert (= (and b!907877 res!612790) b!907870))

(assert (= (and b!907870 res!612789) b!907868))

(assert (= (and b!907868 res!612788) b!907874))

(assert (= (and b!907874 (not res!612786)) b!907867))

(assert (= (and b!907867 (not res!612784)) b!907876))

(assert (= (and b!907876 (not res!612791)) b!907875))

(assert (= (and b!907872 condMapEmpty!29887) mapIsEmpty!29887))

(assert (= (and b!907872 (not condMapEmpty!29887)) mapNonEmpty!29887))

(get-info :version)

(assert (= (and mapNonEmpty!29887 ((_ is ValueCellFull!8909) mapValue!29887)) b!907873))

(assert (= (and b!907872 ((_ is ValueCellFull!8909) mapDefault!29887)) b!907866))

(assert (= start!77786 b!907872))

(declare-fun b_lambda!13229 () Bool)

(assert (=> (not b_lambda!13229) (not b!907874)))

(declare-fun t!25636 () Bool)

(declare-fun tb!5377 () Bool)

(assert (=> (and start!77786 (= defaultEntry!1160 defaultEntry!1160) t!25636) tb!5377))

(declare-fun result!10559 () Bool)

(assert (=> tb!5377 (= result!10559 tp_is_empty!18781)))

(assert (=> b!907874 t!25636))

(declare-fun b_and!26859 () Bool)

(assert (= b_and!26857 (and (=> t!25636 result!10559) b_and!26859)))

(declare-fun m!842691 () Bool)

(assert (=> start!77786 m!842691))

(declare-fun m!842693 () Bool)

(assert (=> start!77786 m!842693))

(declare-fun m!842695 () Bool)

(assert (=> start!77786 m!842695))

(declare-fun m!842697 () Bool)

(assert (=> mapNonEmpty!29887 m!842697))

(declare-fun m!842699 () Bool)

(assert (=> b!907869 m!842699))

(declare-fun m!842701 () Bool)

(assert (=> b!907871 m!842701))

(declare-fun m!842703 () Bool)

(assert (=> b!907870 m!842703))

(declare-fun m!842705 () Bool)

(assert (=> b!907876 m!842705))

(declare-fun m!842707 () Bool)

(assert (=> b!907868 m!842707))

(declare-fun m!842709 () Bool)

(assert (=> b!907874 m!842709))

(declare-fun m!842711 () Bool)

(assert (=> b!907874 m!842711))

(declare-fun m!842713 () Bool)

(assert (=> b!907874 m!842713))

(declare-fun m!842715 () Bool)

(assert (=> b!907874 m!842715))

(assert (=> b!907874 m!842709))

(assert (=> b!907874 m!842713))

(declare-fun m!842717 () Bool)

(assert (=> b!907874 m!842717))

(declare-fun m!842719 () Bool)

(assert (=> b!907875 m!842719))

(declare-fun m!842721 () Bool)

(assert (=> b!907875 m!842721))

(declare-fun m!842723 () Bool)

(assert (=> b!907877 m!842723))

(declare-fun m!842725 () Bool)

(assert (=> b!907877 m!842725))

(declare-fun m!842727 () Bool)

(assert (=> b!907867 m!842727))

(declare-fun m!842729 () Bool)

(assert (=> b!907867 m!842729))

(check-sat (not b!907871) (not mapNonEmpty!29887) (not b!907867) (not b!907877) (not b!907874) (not b!907870) b_and!26859 (not b!907876) tp_is_empty!18781 (not start!77786) (not b_lambda!13229) (not b!907875) (not b!907869) (not b_next!16363))
(check-sat b_and!26859 (not b_next!16363))
