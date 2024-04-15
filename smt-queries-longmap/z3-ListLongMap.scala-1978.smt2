; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34716 () Bool)

(assert start!34716)

(declare-fun b_free!7537 () Bool)

(declare-fun b_next!7537 () Bool)

(assert (=> start!34716 (= b_free!7537 (not b_next!7537))))

(declare-fun tp!26174 () Bool)

(declare-fun b_and!14731 () Bool)

(assert (=> start!34716 (= tp!26174 b_and!14731)))

(declare-fun b!347001 () Bool)

(declare-fun e!212618 () Bool)

(declare-fun tp_is_empty!7489 () Bool)

(assert (=> b!347001 (= e!212618 tp_is_empty!7489)))

(declare-fun b!347002 () Bool)

(declare-fun res!192085 () Bool)

(declare-fun e!212620 () Bool)

(assert (=> b!347002 (=> (not res!192085) (not e!212620))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!347002 (= res!192085 (validKeyInArray!0 k0!1348))))

(declare-fun b!347003 () Bool)

(declare-fun res!192083 () Bool)

(assert (=> b!347003 (=> (not res!192083) (not e!212620))))

(declare-datatypes ((array!18553 0))(
  ( (array!18554 (arr!8787 (Array (_ BitVec 32) (_ BitVec 64))) (size!9140 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18553)

(declare-datatypes ((List!5058 0))(
  ( (Nil!5055) (Cons!5054 (h!5910 (_ BitVec 64)) (t!10177 List!5058)) )
))
(declare-fun arrayNoDuplicates!0 (array!18553 (_ BitVec 32) List!5058) Bool)

(assert (=> b!347003 (= res!192083 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5055))))

(declare-fun res!192089 () Bool)

(assert (=> start!34716 (=> (not res!192089) (not e!212620))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34716 (= res!192089 (validMask!0 mask!2385))))

(assert (=> start!34716 e!212620))

(assert (=> start!34716 true))

(assert (=> start!34716 tp_is_empty!7489))

(assert (=> start!34716 tp!26174))

(declare-datatypes ((V!10963 0))(
  ( (V!10964 (val!3789 Int)) )
))
(declare-datatypes ((ValueCell!3401 0))(
  ( (ValueCellFull!3401 (v!5965 V!10963)) (EmptyCell!3401) )
))
(declare-datatypes ((array!18555 0))(
  ( (array!18556 (arr!8788 (Array (_ BitVec 32) ValueCell!3401)) (size!9141 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18555)

(declare-fun e!212616 () Bool)

(declare-fun array_inv!6524 (array!18555) Bool)

(assert (=> start!34716 (and (array_inv!6524 _values!1525) e!212616)))

(declare-fun array_inv!6525 (array!18553) Bool)

(assert (=> start!34716 (array_inv!6525 _keys!1895)))

(declare-fun b!347004 () Bool)

(declare-fun res!192084 () Bool)

(assert (=> b!347004 (=> (not res!192084) (not e!212620))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!347004 (= res!192084 (and (= (size!9141 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9140 _keys!1895) (size!9141 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!12690 () Bool)

(declare-fun mapRes!12690 () Bool)

(assert (=> mapIsEmpty!12690 mapRes!12690))

(declare-fun b!347005 () Bool)

(declare-fun e!212617 () Bool)

(assert (=> b!347005 (= e!212616 (and e!212617 mapRes!12690))))

(declare-fun condMapEmpty!12690 () Bool)

(declare-fun mapDefault!12690 () ValueCell!3401)

(assert (=> b!347005 (= condMapEmpty!12690 (= (arr!8788 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3401)) mapDefault!12690)))))

(declare-fun b!347006 () Bool)

(declare-fun res!192088 () Bool)

(declare-fun e!212619 () Bool)

(assert (=> b!347006 (=> (not res!192088) (not e!212619))))

(declare-datatypes ((SeekEntryResult!3386 0))(
  ( (MissingZero!3386 (index!15723 (_ BitVec 32))) (Found!3386 (index!15724 (_ BitVec 32))) (Intermediate!3386 (undefined!4198 Bool) (index!15725 (_ BitVec 32)) (x!34587 (_ BitVec 32))) (Undefined!3386) (MissingVacant!3386 (index!15726 (_ BitVec 32))) )
))
(declare-fun lt!163287 () SeekEntryResult!3386)

(declare-fun arrayContainsKey!0 (array!18553 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!347006 (= res!192088 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15724 lt!163287)))))

(declare-fun b!347007 () Bool)

(assert (=> b!347007 (= e!212619 (not true))))

(assert (=> b!347007 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10760 0))(
  ( (Unit!10761) )
))
(declare-fun lt!163286 () Unit!10760)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18553 (_ BitVec 64) (_ BitVec 32)) Unit!10760)

(assert (=> b!347007 (= lt!163286 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!15724 lt!163287)))))

(declare-fun b!347008 () Bool)

(assert (=> b!347008 (= e!212620 e!212619)))

(declare-fun res!192082 () Bool)

(assert (=> b!347008 (=> (not res!192082) (not e!212619))))

(get-info :version)

(assert (=> b!347008 (= res!192082 (and ((_ is Found!3386) lt!163287) (= (select (arr!8787 _keys!1895) (index!15724 lt!163287)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18553 (_ BitVec 32)) SeekEntryResult!3386)

(assert (=> b!347008 (= lt!163287 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!347009 () Bool)

(declare-fun res!192087 () Bool)

(assert (=> b!347009 (=> (not res!192087) (not e!212620))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18553 (_ BitVec 32)) Bool)

(assert (=> b!347009 (= res!192087 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!347010 () Bool)

(declare-fun res!192086 () Bool)

(assert (=> b!347010 (=> (not res!192086) (not e!212620))))

(declare-fun zeroValue!1467 () V!10963)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10963)

(declare-datatypes ((tuple2!5442 0))(
  ( (tuple2!5443 (_1!2732 (_ BitVec 64)) (_2!2732 V!10963)) )
))
(declare-datatypes ((List!5059 0))(
  ( (Nil!5056) (Cons!5055 (h!5911 tuple2!5442) (t!10178 List!5059)) )
))
(declare-datatypes ((ListLongMap!4345 0))(
  ( (ListLongMap!4346 (toList!2188 List!5059)) )
))
(declare-fun contains!2263 (ListLongMap!4345 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1694 (array!18553 array!18555 (_ BitVec 32) (_ BitVec 32) V!10963 V!10963 (_ BitVec 32) Int) ListLongMap!4345)

(assert (=> b!347010 (= res!192086 (not (contains!2263 (getCurrentListMap!1694 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapNonEmpty!12690 () Bool)

(declare-fun tp!26175 () Bool)

(assert (=> mapNonEmpty!12690 (= mapRes!12690 (and tp!26175 e!212618))))

(declare-fun mapKey!12690 () (_ BitVec 32))

(declare-fun mapRest!12690 () (Array (_ BitVec 32) ValueCell!3401))

(declare-fun mapValue!12690 () ValueCell!3401)

(assert (=> mapNonEmpty!12690 (= (arr!8788 _values!1525) (store mapRest!12690 mapKey!12690 mapValue!12690))))

(declare-fun b!347011 () Bool)

(assert (=> b!347011 (= e!212617 tp_is_empty!7489)))

(assert (= (and start!34716 res!192089) b!347004))

(assert (= (and b!347004 res!192084) b!347009))

(assert (= (and b!347009 res!192087) b!347003))

(assert (= (and b!347003 res!192083) b!347002))

(assert (= (and b!347002 res!192085) b!347010))

(assert (= (and b!347010 res!192086) b!347008))

(assert (= (and b!347008 res!192082) b!347006))

(assert (= (and b!347006 res!192088) b!347007))

(assert (= (and b!347005 condMapEmpty!12690) mapIsEmpty!12690))

(assert (= (and b!347005 (not condMapEmpty!12690)) mapNonEmpty!12690))

(assert (= (and mapNonEmpty!12690 ((_ is ValueCellFull!3401) mapValue!12690)) b!347001))

(assert (= (and b!347005 ((_ is ValueCellFull!3401) mapDefault!12690)) b!347011))

(assert (= start!34716 b!347005))

(declare-fun m!347501 () Bool)

(assert (=> b!347009 m!347501))

(declare-fun m!347503 () Bool)

(assert (=> b!347010 m!347503))

(assert (=> b!347010 m!347503))

(declare-fun m!347505 () Bool)

(assert (=> b!347010 m!347505))

(declare-fun m!347507 () Bool)

(assert (=> start!34716 m!347507))

(declare-fun m!347509 () Bool)

(assert (=> start!34716 m!347509))

(declare-fun m!347511 () Bool)

(assert (=> start!34716 m!347511))

(declare-fun m!347513 () Bool)

(assert (=> b!347007 m!347513))

(declare-fun m!347515 () Bool)

(assert (=> b!347007 m!347515))

(declare-fun m!347517 () Bool)

(assert (=> mapNonEmpty!12690 m!347517))

(declare-fun m!347519 () Bool)

(assert (=> b!347008 m!347519))

(declare-fun m!347521 () Bool)

(assert (=> b!347008 m!347521))

(declare-fun m!347523 () Bool)

(assert (=> b!347002 m!347523))

(declare-fun m!347525 () Bool)

(assert (=> b!347006 m!347525))

(declare-fun m!347527 () Bool)

(assert (=> b!347003 m!347527))

(check-sat (not b!347006) (not b!347010) (not b_next!7537) (not start!34716) (not mapNonEmpty!12690) (not b!347007) (not b!347008) (not b!347002) tp_is_empty!7489 b_and!14731 (not b!347003) (not b!347009))
(check-sat b_and!14731 (not b_next!7537))
