; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78000 () Bool)

(assert start!78000)

(declare-fun b_free!16527 () Bool)

(declare-fun b_next!16527 () Bool)

(assert (=> start!78000 (= b_free!16527 (not b_next!16527))))

(declare-fun tp!57851 () Bool)

(declare-fun b_and!27099 () Bool)

(assert (=> start!78000 (= tp!57851 b_and!27099)))

(declare-fun res!614426 () Bool)

(declare-fun e!510536 () Bool)

(assert (=> start!78000 (=> (not res!614426) (not e!510536))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78000 (= res!614426 (validMask!0 mask!1756))))

(assert (=> start!78000 e!510536))

(declare-datatypes ((V!30225 0))(
  ( (V!30226 (val!9523 Int)) )
))
(declare-datatypes ((ValueCell!8991 0))(
  ( (ValueCellFull!8991 (v!12032 V!30225)) (EmptyCell!8991) )
))
(declare-datatypes ((array!53906 0))(
  ( (array!53907 (arr!25909 (Array (_ BitVec 32) ValueCell!8991)) (size!26368 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53906)

(declare-fun e!510537 () Bool)

(declare-fun array_inv!20262 (array!53906) Bool)

(assert (=> start!78000 (and (array_inv!20262 _values!1152) e!510537)))

(assert (=> start!78000 tp!57851))

(assert (=> start!78000 true))

(declare-fun tp_is_empty!18945 () Bool)

(assert (=> start!78000 tp_is_empty!18945))

(declare-datatypes ((array!53908 0))(
  ( (array!53909 (arr!25910 (Array (_ BitVec 32) (_ BitVec 64))) (size!26369 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53908)

(declare-fun array_inv!20263 (array!53908) Bool)

(assert (=> start!78000 (array_inv!20263 _keys!1386)))

(declare-fun b!910548 () Bool)

(declare-fun res!614427 () Bool)

(assert (=> b!910548 (=> (not res!614427) (not e!510536))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!910548 (= res!614427 (and (= (size!26368 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26369 _keys!1386) (size!26368 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!910549 () Bool)

(declare-fun e!510540 () Bool)

(declare-fun mapRes!30139 () Bool)

(assert (=> b!910549 (= e!510537 (and e!510540 mapRes!30139))))

(declare-fun condMapEmpty!30139 () Bool)

(declare-fun mapDefault!30139 () ValueCell!8991)

(assert (=> b!910549 (= condMapEmpty!30139 (= (arr!25909 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8991)) mapDefault!30139)))))

(declare-fun mapNonEmpty!30139 () Bool)

(declare-fun tp!57852 () Bool)

(declare-fun e!510539 () Bool)

(assert (=> mapNonEmpty!30139 (= mapRes!30139 (and tp!57852 e!510539))))

(declare-fun mapKey!30139 () (_ BitVec 32))

(declare-fun mapValue!30139 () ValueCell!8991)

(declare-fun mapRest!30139 () (Array (_ BitVec 32) ValueCell!8991))

(assert (=> mapNonEmpty!30139 (= (arr!25909 _values!1152) (store mapRest!30139 mapKey!30139 mapValue!30139))))

(declare-fun b!910550 () Bool)

(assert (=> b!910550 (= e!510536 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30225)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun lt!410273 () Bool)

(declare-fun minValue!1094 () V!30225)

(declare-datatypes ((tuple2!12410 0))(
  ( (tuple2!12411 (_1!6216 (_ BitVec 64)) (_2!6216 V!30225)) )
))
(declare-datatypes ((List!18200 0))(
  ( (Nil!18197) (Cons!18196 (h!19342 tuple2!12410) (t!25785 List!18200)) )
))
(declare-datatypes ((ListLongMap!11107 0))(
  ( (ListLongMap!11108 (toList!5569 List!18200)) )
))
(declare-fun contains!4613 (ListLongMap!11107 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2831 (array!53908 array!53906 (_ BitVec 32) (_ BitVec 32) V!30225 V!30225 (_ BitVec 32) Int) ListLongMap!11107)

(assert (=> b!910550 (= lt!410273 (contains!4613 (getCurrentListMap!2831 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!910551 () Bool)

(assert (=> b!910551 (= e!510540 tp_is_empty!18945)))

(declare-fun mapIsEmpty!30139 () Bool)

(assert (=> mapIsEmpty!30139 mapRes!30139))

(declare-fun b!910552 () Bool)

(declare-fun res!614424 () Bool)

(assert (=> b!910552 (=> (not res!614424) (not e!510536))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53908 (_ BitVec 32)) Bool)

(assert (=> b!910552 (= res!614424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!910553 () Bool)

(declare-fun res!614425 () Bool)

(assert (=> b!910553 (=> (not res!614425) (not e!510536))))

(declare-datatypes ((List!18201 0))(
  ( (Nil!18198) (Cons!18197 (h!19343 (_ BitVec 64)) (t!25786 List!18201)) )
))
(declare-fun arrayNoDuplicates!0 (array!53908 (_ BitVec 32) List!18201) Bool)

(assert (=> b!910553 (= res!614425 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18198))))

(declare-fun b!910554 () Bool)

(assert (=> b!910554 (= e!510539 tp_is_empty!18945)))

(assert (= (and start!78000 res!614426) b!910548))

(assert (= (and b!910548 res!614427) b!910552))

(assert (= (and b!910552 res!614424) b!910553))

(assert (= (and b!910553 res!614425) b!910550))

(assert (= (and b!910549 condMapEmpty!30139) mapIsEmpty!30139))

(assert (= (and b!910549 (not condMapEmpty!30139)) mapNonEmpty!30139))

(get-info :version)

(assert (= (and mapNonEmpty!30139 ((_ is ValueCellFull!8991) mapValue!30139)) b!910554))

(assert (= (and b!910549 ((_ is ValueCellFull!8991) mapDefault!30139)) b!910551))

(assert (= start!78000 b!910549))

(declare-fun m!845521 () Bool)

(assert (=> mapNonEmpty!30139 m!845521))

(declare-fun m!845523 () Bool)

(assert (=> b!910550 m!845523))

(assert (=> b!910550 m!845523))

(declare-fun m!845525 () Bool)

(assert (=> b!910550 m!845525))

(declare-fun m!845527 () Bool)

(assert (=> b!910552 m!845527))

(declare-fun m!845529 () Bool)

(assert (=> start!78000 m!845529))

(declare-fun m!845531 () Bool)

(assert (=> start!78000 m!845531))

(declare-fun m!845533 () Bool)

(assert (=> start!78000 m!845533))

(declare-fun m!845535 () Bool)

(assert (=> b!910553 m!845535))

(check-sat (not mapNonEmpty!30139) (not b!910552) (not b!910553) (not b!910550) (not b_next!16527) tp_is_empty!18945 b_and!27099 (not start!78000))
(check-sat b_and!27099 (not b_next!16527))
