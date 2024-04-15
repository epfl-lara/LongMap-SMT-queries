; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77986 () Bool)

(assert start!77986)

(declare-fun b_free!16531 () Bool)

(declare-fun b_next!16531 () Bool)

(assert (=> start!77986 (= b_free!16531 (not b_next!16531))))

(declare-fun tp!57865 () Bool)

(declare-fun b_and!27077 () Bool)

(assert (=> start!77986 (= tp!57865 b_and!27077)))

(declare-fun mapNonEmpty!30145 () Bool)

(declare-fun mapRes!30145 () Bool)

(declare-fun tp!57864 () Bool)

(declare-fun e!510421 () Bool)

(assert (=> mapNonEmpty!30145 (= mapRes!30145 (and tp!57864 e!510421))))

(declare-datatypes ((V!30231 0))(
  ( (V!30232 (val!9525 Int)) )
))
(declare-datatypes ((ValueCell!8993 0))(
  ( (ValueCellFull!8993 (v!12033 V!30231)) (EmptyCell!8993) )
))
(declare-datatypes ((array!53903 0))(
  ( (array!53904 (arr!25908 (Array (_ BitVec 32) ValueCell!8993)) (size!26369 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53903)

(declare-fun mapRest!30145 () (Array (_ BitVec 32) ValueCell!8993))

(declare-fun mapValue!30145 () ValueCell!8993)

(declare-fun mapKey!30145 () (_ BitVec 32))

(assert (=> mapNonEmpty!30145 (= (arr!25908 _values!1152) (store mapRest!30145 mapKey!30145 mapValue!30145))))

(declare-fun b!910351 () Bool)

(declare-fun e!510420 () Bool)

(declare-fun e!510418 () Bool)

(assert (=> b!910351 (= e!510420 (and e!510418 mapRes!30145))))

(declare-fun condMapEmpty!30145 () Bool)

(declare-fun mapDefault!30145 () ValueCell!8993)

(assert (=> b!910351 (= condMapEmpty!30145 (= (arr!25908 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8993)) mapDefault!30145)))))

(declare-fun mapIsEmpty!30145 () Bool)

(assert (=> mapIsEmpty!30145 mapRes!30145))

(declare-fun res!614340 () Bool)

(declare-fun e!510419 () Bool)

(assert (=> start!77986 (=> (not res!614340) (not e!510419))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77986 (= res!614340 (validMask!0 mask!1756))))

(assert (=> start!77986 e!510419))

(declare-fun array_inv!20314 (array!53903) Bool)

(assert (=> start!77986 (and (array_inv!20314 _values!1152) e!510420)))

(assert (=> start!77986 tp!57865))

(assert (=> start!77986 true))

(declare-fun tp_is_empty!18949 () Bool)

(assert (=> start!77986 tp_is_empty!18949))

(declare-datatypes ((array!53905 0))(
  ( (array!53906 (arr!25909 (Array (_ BitVec 32) (_ BitVec 64))) (size!26370 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53905)

(declare-fun array_inv!20315 (array!53905) Bool)

(assert (=> start!77986 (array_inv!20315 _keys!1386)))

(declare-fun b!910352 () Bool)

(declare-fun res!614341 () Bool)

(assert (=> b!910352 (=> (not res!614341) (not e!510419))))

(declare-datatypes ((List!18230 0))(
  ( (Nil!18227) (Cons!18226 (h!19372 (_ BitVec 64)) (t!25806 List!18230)) )
))
(declare-fun arrayNoDuplicates!0 (array!53905 (_ BitVec 32) List!18230) Bool)

(assert (=> b!910352 (= res!614341 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18227))))

(declare-fun b!910353 () Bool)

(declare-fun res!614338 () Bool)

(assert (=> b!910353 (=> (not res!614338) (not e!510419))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!910353 (= res!614338 (and (= (size!26369 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26370 _keys!1386) (size!26369 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!910354 () Bool)

(assert (=> b!910354 (= e!510419 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!410043 () Bool)

(declare-fun zeroValue!1094 () V!30231)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30231)

(declare-datatypes ((tuple2!12446 0))(
  ( (tuple2!12447 (_1!6234 (_ BitVec 64)) (_2!6234 V!30231)) )
))
(declare-datatypes ((List!18231 0))(
  ( (Nil!18228) (Cons!18227 (h!19373 tuple2!12446) (t!25807 List!18231)) )
))
(declare-datatypes ((ListLongMap!11133 0))(
  ( (ListLongMap!11134 (toList!5582 List!18231)) )
))
(declare-fun contains!4583 (ListLongMap!11133 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2784 (array!53905 array!53903 (_ BitVec 32) (_ BitVec 32) V!30231 V!30231 (_ BitVec 32) Int) ListLongMap!11133)

(assert (=> b!910354 (= lt!410043 (contains!4583 (getCurrentListMap!2784 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!910355 () Bool)

(assert (=> b!910355 (= e!510418 tp_is_empty!18949)))

(declare-fun b!910356 () Bool)

(assert (=> b!910356 (= e!510421 tp_is_empty!18949)))

(declare-fun b!910357 () Bool)

(declare-fun res!614339 () Bool)

(assert (=> b!910357 (=> (not res!614339) (not e!510419))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53905 (_ BitVec 32)) Bool)

(assert (=> b!910357 (= res!614339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(assert (= (and start!77986 res!614340) b!910353))

(assert (= (and b!910353 res!614338) b!910357))

(assert (= (and b!910357 res!614339) b!910352))

(assert (= (and b!910352 res!614341) b!910354))

(assert (= (and b!910351 condMapEmpty!30145) mapIsEmpty!30145))

(assert (= (and b!910351 (not condMapEmpty!30145)) mapNonEmpty!30145))

(get-info :version)

(assert (= (and mapNonEmpty!30145 ((_ is ValueCellFull!8993) mapValue!30145)) b!910356))

(assert (= (and b!910351 ((_ is ValueCellFull!8993) mapDefault!30145)) b!910355))

(assert (= start!77986 b!910351))

(declare-fun m!844795 () Bool)

(assert (=> start!77986 m!844795))

(declare-fun m!844797 () Bool)

(assert (=> start!77986 m!844797))

(declare-fun m!844799 () Bool)

(assert (=> start!77986 m!844799))

(declare-fun m!844801 () Bool)

(assert (=> mapNonEmpty!30145 m!844801))

(declare-fun m!844803 () Bool)

(assert (=> b!910354 m!844803))

(assert (=> b!910354 m!844803))

(declare-fun m!844805 () Bool)

(assert (=> b!910354 m!844805))

(declare-fun m!844807 () Bool)

(assert (=> b!910352 m!844807))

(declare-fun m!844809 () Bool)

(assert (=> b!910357 m!844809))

(check-sat (not start!77986) (not b!910354) (not b_next!16531) (not b!910357) tp_is_empty!18949 b_and!27077 (not mapNonEmpty!30145) (not b!910352))
(check-sat b_and!27077 (not b_next!16531))
