; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78010 () Bool)

(assert start!78010)

(declare-fun b_free!16555 () Bool)

(declare-fun b_next!16555 () Bool)

(assert (=> start!78010 (= b_free!16555 (not b_next!16555))))

(declare-fun tp!57937 () Bool)

(declare-fun b_and!27101 () Bool)

(assert (=> start!78010 (= tp!57937 b_and!27101)))

(declare-fun mapNonEmpty!30181 () Bool)

(declare-fun mapRes!30181 () Bool)

(declare-fun tp!57936 () Bool)

(declare-fun e!510600 () Bool)

(assert (=> mapNonEmpty!30181 (= mapRes!30181 (and tp!57936 e!510600))))

(declare-datatypes ((V!30263 0))(
  ( (V!30264 (val!9537 Int)) )
))
(declare-datatypes ((ValueCell!9005 0))(
  ( (ValueCellFull!9005 (v!12045 V!30263)) (EmptyCell!9005) )
))
(declare-datatypes ((array!53951 0))(
  ( (array!53952 (arr!25932 (Array (_ BitVec 32) ValueCell!9005)) (size!26393 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53951)

(declare-fun mapRest!30181 () (Array (_ BitVec 32) ValueCell!9005))

(declare-fun mapValue!30181 () ValueCell!9005)

(declare-fun mapKey!30181 () (_ BitVec 32))

(assert (=> mapNonEmpty!30181 (= (arr!25932 _values!1152) (store mapRest!30181 mapKey!30181 mapValue!30181))))

(declare-fun b!910604 () Bool)

(declare-fun tp_is_empty!18973 () Bool)

(assert (=> b!910604 (= e!510600 tp_is_empty!18973)))

(declare-fun b!910605 () Bool)

(declare-fun e!510601 () Bool)

(declare-fun e!510599 () Bool)

(assert (=> b!910605 (= e!510601 (and e!510599 mapRes!30181))))

(declare-fun condMapEmpty!30181 () Bool)

(declare-fun mapDefault!30181 () ValueCell!9005)

(assert (=> b!910605 (= condMapEmpty!30181 (= (arr!25932 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9005)) mapDefault!30181)))))

(declare-fun mapIsEmpty!30181 () Bool)

(assert (=> mapIsEmpty!30181 mapRes!30181))

(declare-fun b!910606 () Bool)

(assert (=> b!910606 (= e!510599 tp_is_empty!18973)))

(declare-fun b!910607 () Bool)

(declare-fun res!614482 () Bool)

(declare-fun e!510602 () Bool)

(assert (=> b!910607 (=> (not res!614482) (not e!510602))))

(declare-datatypes ((array!53953 0))(
  ( (array!53954 (arr!25933 (Array (_ BitVec 32) (_ BitVec 64))) (size!26394 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53953)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53953 (_ BitVec 32)) Bool)

(assert (=> b!910607 (= res!614482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun res!614485 () Bool)

(assert (=> start!78010 (=> (not res!614485) (not e!510602))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78010 (= res!614485 (validMask!0 mask!1756))))

(assert (=> start!78010 e!510602))

(declare-fun array_inv!20334 (array!53951) Bool)

(assert (=> start!78010 (and (array_inv!20334 _values!1152) e!510601)))

(assert (=> start!78010 tp!57937))

(assert (=> start!78010 true))

(assert (=> start!78010 tp_is_empty!18973))

(declare-fun array_inv!20335 (array!53953) Bool)

(assert (=> start!78010 (array_inv!20335 _keys!1386)))

(declare-fun b!910603 () Bool)

(declare-fun res!614484 () Bool)

(assert (=> b!910603 (=> (not res!614484) (not e!510602))))

(declare-datatypes ((List!18248 0))(
  ( (Nil!18245) (Cons!18244 (h!19390 (_ BitVec 64)) (t!25824 List!18248)) )
))
(declare-fun arrayNoDuplicates!0 (array!53953 (_ BitVec 32) List!18248) Bool)

(assert (=> b!910603 (= res!614484 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18245))))

(declare-fun b!910608 () Bool)

(assert (=> b!910608 (= e!510602 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30263)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30263)

(declare-fun lt!410079 () Bool)

(declare-datatypes ((tuple2!12462 0))(
  ( (tuple2!12463 (_1!6242 (_ BitVec 64)) (_2!6242 V!30263)) )
))
(declare-datatypes ((List!18249 0))(
  ( (Nil!18246) (Cons!18245 (h!19391 tuple2!12462) (t!25825 List!18249)) )
))
(declare-datatypes ((ListLongMap!11149 0))(
  ( (ListLongMap!11150 (toList!5590 List!18249)) )
))
(declare-fun contains!4591 (ListLongMap!11149 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2792 (array!53953 array!53951 (_ BitVec 32) (_ BitVec 32) V!30263 V!30263 (_ BitVec 32) Int) ListLongMap!11149)

(assert (=> b!910608 (= lt!410079 (contains!4591 (getCurrentListMap!2792 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!910609 () Bool)

(declare-fun res!614483 () Bool)

(assert (=> b!910609 (=> (not res!614483) (not e!510602))))

(assert (=> b!910609 (= res!614483 (and (= (size!26393 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26394 _keys!1386) (size!26393 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(assert (= (and start!78010 res!614485) b!910609))

(assert (= (and b!910609 res!614483) b!910607))

(assert (= (and b!910607 res!614482) b!910603))

(assert (= (and b!910603 res!614484) b!910608))

(assert (= (and b!910605 condMapEmpty!30181) mapIsEmpty!30181))

(assert (= (and b!910605 (not condMapEmpty!30181)) mapNonEmpty!30181))

(get-info :version)

(assert (= (and mapNonEmpty!30181 ((_ is ValueCellFull!9005) mapValue!30181)) b!910604))

(assert (= (and b!910605 ((_ is ValueCellFull!9005) mapDefault!30181)) b!910606))

(assert (= start!78010 b!910605))

(declare-fun m!844987 () Bool)

(assert (=> mapNonEmpty!30181 m!844987))

(declare-fun m!844989 () Bool)

(assert (=> b!910603 m!844989))

(declare-fun m!844991 () Bool)

(assert (=> b!910607 m!844991))

(declare-fun m!844993 () Bool)

(assert (=> b!910608 m!844993))

(assert (=> b!910608 m!844993))

(declare-fun m!844995 () Bool)

(assert (=> b!910608 m!844995))

(declare-fun m!844997 () Bool)

(assert (=> start!78010 m!844997))

(declare-fun m!844999 () Bool)

(assert (=> start!78010 m!844999))

(declare-fun m!845001 () Bool)

(assert (=> start!78010 m!845001))

(check-sat (not b!910608) (not b!910603) tp_is_empty!18973 (not start!78010) (not b!910607) b_and!27101 (not b_next!16555) (not mapNonEmpty!30181))
(check-sat b_and!27101 (not b_next!16555))
