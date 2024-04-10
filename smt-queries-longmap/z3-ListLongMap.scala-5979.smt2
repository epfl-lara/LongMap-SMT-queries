; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77702 () Bool)

(assert start!77702)

(declare-fun b_free!16287 () Bool)

(declare-fun b_next!16287 () Bool)

(assert (=> start!77702 (= b_free!16287 (not b_next!16287))))

(declare-fun tp!57122 () Bool)

(declare-fun b_and!26727 () Bool)

(assert (=> start!77702 (= tp!57122 b_and!26727)))

(declare-fun b!906394 () Bool)

(declare-fun e!507945 () Bool)

(declare-fun e!507941 () Bool)

(assert (=> b!906394 (= e!507945 (not e!507941))))

(declare-fun res!611691 () Bool)

(assert (=> b!906394 (=> res!611691 e!507941)))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!53452 0))(
  ( (array!53453 (arr!25685 (Array (_ BitVec 32) (_ BitVec 64))) (size!26144 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53452)

(assert (=> b!906394 (= res!611691 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26144 _keys!1386))))))

(declare-fun defaultEntry!1160 () Int)

(declare-datatypes ((V!29905 0))(
  ( (V!29906 (val!9403 Int)) )
))
(declare-fun lt!408904 () V!29905)

(declare-datatypes ((ValueCell!8871 0))(
  ( (ValueCellFull!8871 (v!11908 V!29905)) (EmptyCell!8871) )
))
(declare-datatypes ((array!53454 0))(
  ( (array!53455 (arr!25686 (Array (_ BitVec 32) ValueCell!8871)) (size!26145 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53454)

(declare-fun get!13503 (ValueCell!8871 V!29905) V!29905)

(declare-fun dynLambda!1347 (Int (_ BitVec 64)) V!29905)

(assert (=> b!906394 (= lt!408904 (get!13503 (select (arr!25686 _values!1152) i!717) (dynLambda!1347 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!53452 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!906394 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((Unit!30762 0))(
  ( (Unit!30763) )
))
(declare-fun lt!408902 () Unit!30762)

(declare-fun zeroValue!1094 () V!29905)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29905)

(declare-fun lemmaKeyInListMapIsInArray!219 (array!53452 array!53454 (_ BitVec 32) (_ BitVec 32) V!29905 V!29905 (_ BitVec 64) Int) Unit!30762)

(assert (=> b!906394 (= lt!408902 (lemmaKeyInListMapIsInArray!219 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!906395 () Bool)

(declare-fun res!611696 () Bool)

(assert (=> b!906395 (=> (not res!611696) (not e!507945))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!906395 (= res!611696 (inRange!0 i!717 mask!1756))))

(declare-fun b!906396 () Bool)

(declare-fun res!611699 () Bool)

(declare-fun e!507942 () Bool)

(assert (=> b!906396 (=> (not res!611699) (not e!507942))))

(assert (=> b!906396 (= res!611699 (and (= (size!26145 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26144 _keys!1386) (size!26145 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!906398 () Bool)

(declare-fun e!507939 () Bool)

(assert (=> b!906398 (= e!507941 e!507939)))

(declare-fun res!611695 () Bool)

(assert (=> b!906398 (=> res!611695 e!507939)))

(declare-datatypes ((tuple2!12240 0))(
  ( (tuple2!12241 (_1!6131 (_ BitVec 64)) (_2!6131 V!29905)) )
))
(declare-datatypes ((List!18045 0))(
  ( (Nil!18042) (Cons!18041 (h!19187 tuple2!12240) (t!25504 List!18045)) )
))
(declare-datatypes ((ListLongMap!10937 0))(
  ( (ListLongMap!10938 (toList!5484 List!18045)) )
))
(declare-fun lt!408906 () ListLongMap!10937)

(declare-fun contains!4529 (ListLongMap!10937 (_ BitVec 64)) Bool)

(assert (=> b!906398 (= res!611695 (not (contains!4529 lt!408906 k0!1033)))))

(declare-fun getCurrentListMap!2750 (array!53452 array!53454 (_ BitVec 32) (_ BitVec 32) V!29905 V!29905 (_ BitVec 32) Int) ListLongMap!10937)

(assert (=> b!906398 (= lt!408906 (getCurrentListMap!2750 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!906399 () Bool)

(assert (=> b!906399 (= e!507939 true)))

(declare-fun lt!408905 () ListLongMap!10937)

(declare-fun apply!470 (ListLongMap!10937 (_ BitVec 64)) V!29905)

(assert (=> b!906399 (= (apply!470 lt!408905 k0!1033) lt!408904)))

(declare-fun lt!408903 () Unit!30762)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!25 (array!53452 array!53454 (_ BitVec 32) (_ BitVec 32) V!29905 V!29905 (_ BitVec 64) V!29905 (_ BitVec 32) Int) Unit!30762)

(assert (=> b!906399 (= lt!408903 (lemmaListMapApplyFromThenApplyFromZero!25 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!408904 i!717 defaultEntry!1160))))

(declare-fun b!906400 () Bool)

(declare-fun res!611697 () Bool)

(assert (=> b!906400 (=> (not res!611697) (not e!507942))))

(declare-datatypes ((List!18046 0))(
  ( (Nil!18043) (Cons!18042 (h!19188 (_ BitVec 64)) (t!25505 List!18046)) )
))
(declare-fun arrayNoDuplicates!0 (array!53452 (_ BitVec 32) List!18046) Bool)

(assert (=> b!906400 (= res!611697 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18043))))

(declare-fun b!906401 () Bool)

(declare-fun res!611694 () Bool)

(assert (=> b!906401 (=> (not res!611694) (not e!507945))))

(assert (=> b!906401 (= res!611694 (and (= (select (arr!25685 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!906402 () Bool)

(declare-fun e!507944 () Bool)

(declare-fun tp_is_empty!18705 () Bool)

(assert (=> b!906402 (= e!507944 tp_is_empty!18705)))

(declare-fun b!906397 () Bool)

(declare-fun e!507938 () Bool)

(declare-fun mapRes!29770 () Bool)

(assert (=> b!906397 (= e!507938 (and e!507944 mapRes!29770))))

(declare-fun condMapEmpty!29770 () Bool)

(declare-fun mapDefault!29770 () ValueCell!8871)

(assert (=> b!906397 (= condMapEmpty!29770 (= (arr!25686 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8871)) mapDefault!29770)))))

(declare-fun res!611693 () Bool)

(assert (=> start!77702 (=> (not res!611693) (not e!507942))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77702 (= res!611693 (validMask!0 mask!1756))))

(assert (=> start!77702 e!507942))

(declare-fun array_inv!20124 (array!53454) Bool)

(assert (=> start!77702 (and (array_inv!20124 _values!1152) e!507938)))

(assert (=> start!77702 tp!57122))

(assert (=> start!77702 true))

(assert (=> start!77702 tp_is_empty!18705))

(declare-fun array_inv!20125 (array!53452) Bool)

(assert (=> start!77702 (array_inv!20125 _keys!1386)))

(declare-fun b!906403 () Bool)

(declare-fun e!507940 () Bool)

(assert (=> b!906403 (= e!507940 tp_is_empty!18705)))

(declare-fun b!906404 () Bool)

(declare-fun res!611692 () Bool)

(assert (=> b!906404 (=> (not res!611692) (not e!507942))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53452 (_ BitVec 32)) Bool)

(assert (=> b!906404 (= res!611692 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!906405 () Bool)

(assert (=> b!906405 (= e!507942 e!507945)))

(declare-fun res!611698 () Bool)

(assert (=> b!906405 (=> (not res!611698) (not e!507945))))

(assert (=> b!906405 (= res!611698 (contains!4529 lt!408905 k0!1033))))

(assert (=> b!906405 (= lt!408905 (getCurrentListMap!2750 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!906406 () Bool)

(declare-fun res!611690 () Bool)

(assert (=> b!906406 (=> res!611690 e!507939)))

(assert (=> b!906406 (= res!611690 (not (= (apply!470 lt!408906 k0!1033) lt!408904)))))

(declare-fun mapNonEmpty!29770 () Bool)

(declare-fun tp!57123 () Bool)

(assert (=> mapNonEmpty!29770 (= mapRes!29770 (and tp!57123 e!507940))))

(declare-fun mapValue!29770 () ValueCell!8871)

(declare-fun mapKey!29770 () (_ BitVec 32))

(declare-fun mapRest!29770 () (Array (_ BitVec 32) ValueCell!8871))

(assert (=> mapNonEmpty!29770 (= (arr!25686 _values!1152) (store mapRest!29770 mapKey!29770 mapValue!29770))))

(declare-fun mapIsEmpty!29770 () Bool)

(assert (=> mapIsEmpty!29770 mapRes!29770))

(assert (= (and start!77702 res!611693) b!906396))

(assert (= (and b!906396 res!611699) b!906404))

(assert (= (and b!906404 res!611692) b!906400))

(assert (= (and b!906400 res!611697) b!906405))

(assert (= (and b!906405 res!611698) b!906395))

(assert (= (and b!906395 res!611696) b!906401))

(assert (= (and b!906401 res!611694) b!906394))

(assert (= (and b!906394 (not res!611691)) b!906398))

(assert (= (and b!906398 (not res!611695)) b!906406))

(assert (= (and b!906406 (not res!611690)) b!906399))

(assert (= (and b!906397 condMapEmpty!29770) mapIsEmpty!29770))

(assert (= (and b!906397 (not condMapEmpty!29770)) mapNonEmpty!29770))

(get-info :version)

(assert (= (and mapNonEmpty!29770 ((_ is ValueCellFull!8871) mapValue!29770)) b!906403))

(assert (= (and b!906397 ((_ is ValueCellFull!8871) mapDefault!29770)) b!906402))

(assert (= start!77702 b!906397))

(declare-fun b_lambda!13161 () Bool)

(assert (=> (not b_lambda!13161) (not b!906394)))

(declare-fun t!25503 () Bool)

(declare-fun tb!5309 () Bool)

(assert (=> (and start!77702 (= defaultEntry!1160 defaultEntry!1160) t!25503) tb!5309))

(declare-fun result!10413 () Bool)

(assert (=> tb!5309 (= result!10413 tp_is_empty!18705)))

(assert (=> b!906394 t!25503))

(declare-fun b_and!26729 () Bool)

(assert (= b_and!26727 (and (=> t!25503 result!10413) b_and!26729)))

(declare-fun m!841775 () Bool)

(assert (=> b!906401 m!841775))

(declare-fun m!841777 () Bool)

(assert (=> b!906406 m!841777))

(declare-fun m!841779 () Bool)

(assert (=> start!77702 m!841779))

(declare-fun m!841781 () Bool)

(assert (=> start!77702 m!841781))

(declare-fun m!841783 () Bool)

(assert (=> start!77702 m!841783))

(declare-fun m!841785 () Bool)

(assert (=> mapNonEmpty!29770 m!841785))

(declare-fun m!841787 () Bool)

(assert (=> b!906405 m!841787))

(declare-fun m!841789 () Bool)

(assert (=> b!906405 m!841789))

(declare-fun m!841791 () Bool)

(assert (=> b!906398 m!841791))

(declare-fun m!841793 () Bool)

(assert (=> b!906398 m!841793))

(declare-fun m!841795 () Bool)

(assert (=> b!906404 m!841795))

(declare-fun m!841797 () Bool)

(assert (=> b!906395 m!841797))

(declare-fun m!841799 () Bool)

(assert (=> b!906399 m!841799))

(declare-fun m!841801 () Bool)

(assert (=> b!906399 m!841801))

(declare-fun m!841803 () Bool)

(assert (=> b!906400 m!841803))

(declare-fun m!841805 () Bool)

(assert (=> b!906394 m!841805))

(declare-fun m!841807 () Bool)

(assert (=> b!906394 m!841807))

(declare-fun m!841809 () Bool)

(assert (=> b!906394 m!841809))

(declare-fun m!841811 () Bool)

(assert (=> b!906394 m!841811))

(assert (=> b!906394 m!841805))

(assert (=> b!906394 m!841809))

(declare-fun m!841813 () Bool)

(assert (=> b!906394 m!841813))

(check-sat tp_is_empty!18705 (not b!906395) (not b!906394) (not b!906405) (not b!906404) (not b_lambda!13161) (not b!906398) (not start!77702) (not mapNonEmpty!29770) (not b!906400) b_and!26729 (not b!906399) (not b!906406) (not b_next!16287))
(check-sat b_and!26729 (not b_next!16287))
