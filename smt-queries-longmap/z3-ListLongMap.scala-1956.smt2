; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34484 () Bool)

(assert start!34484)

(declare-fun b_free!7407 () Bool)

(declare-fun b_next!7407 () Bool)

(assert (=> start!34484 (= b_free!7407 (not b_next!7407))))

(declare-fun tp!25767 () Bool)

(declare-fun b_and!14615 () Bool)

(assert (=> start!34484 (= tp!25767 b_and!14615)))

(declare-fun b!344542 () Bool)

(declare-fun res!190556 () Bool)

(declare-fun e!211208 () Bool)

(assert (=> b!344542 (=> (not res!190556) (not e!211208))))

(declare-datatypes ((array!18305 0))(
  ( (array!18306 (arr!8669 (Array (_ BitVec 32) (_ BitVec 64))) (size!9021 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18305)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18305 (_ BitVec 32)) Bool)

(assert (=> b!344542 (= res!190556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!344543 () Bool)

(declare-fun res!190558 () Bool)

(assert (=> b!344543 (=> (not res!190558) (not e!211208))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344543 (= res!190558 (validKeyInArray!0 k0!1348))))

(declare-fun res!190555 () Bool)

(assert (=> start!34484 (=> (not res!190555) (not e!211208))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34484 (= res!190555 (validMask!0 mask!2385))))

(assert (=> start!34484 e!211208))

(assert (=> start!34484 true))

(declare-fun tp_is_empty!7359 () Bool)

(assert (=> start!34484 tp_is_empty!7359))

(assert (=> start!34484 tp!25767))

(declare-datatypes ((V!10789 0))(
  ( (V!10790 (val!3724 Int)) )
))
(declare-datatypes ((ValueCell!3336 0))(
  ( (ValueCellFull!3336 (v!5900 V!10789)) (EmptyCell!3336) )
))
(declare-datatypes ((array!18307 0))(
  ( (array!18308 (arr!8670 (Array (_ BitVec 32) ValueCell!3336)) (size!9022 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18307)

(declare-fun e!211207 () Bool)

(declare-fun array_inv!6420 (array!18307) Bool)

(assert (=> start!34484 (and (array_inv!6420 _values!1525) e!211207)))

(declare-fun array_inv!6421 (array!18305) Bool)

(assert (=> start!34484 (array_inv!6421 _keys!1895)))

(declare-fun b!344544 () Bool)

(declare-datatypes ((SeekEntryResult!3342 0))(
  ( (MissingZero!3342 (index!15547 (_ BitVec 32))) (Found!3342 (index!15548 (_ BitVec 32))) (Intermediate!3342 (undefined!4154 Bool) (index!15549 (_ BitVec 32)) (x!34312 (_ BitVec 32))) (Undefined!3342) (MissingVacant!3342 (index!15550 (_ BitVec 32))) )
))
(declare-fun lt!162685 () SeekEntryResult!3342)

(get-info :version)

(assert (=> b!344544 (= e!211208 (and (not ((_ is Found!3342) lt!162685)) (not ((_ is MissingZero!3342) lt!162685)) (not ((_ is MissingVacant!3342) lt!162685)) (not ((_ is Undefined!3342) lt!162685)) (not (= (size!9021 _keys!1895) (bvadd #b00000000000000000000000000000001 mask!2385)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18305 (_ BitVec 32)) SeekEntryResult!3342)

(assert (=> b!344544 (= lt!162685 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!344545 () Bool)

(declare-fun res!190554 () Bool)

(assert (=> b!344545 (=> (not res!190554) (not e!211208))))

(declare-datatypes ((List!5012 0))(
  ( (Nil!5009) (Cons!5008 (h!5864 (_ BitVec 64)) (t!10128 List!5012)) )
))
(declare-fun arrayNoDuplicates!0 (array!18305 (_ BitVec 32) List!5012) Bool)

(assert (=> b!344545 (= res!190554 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5009))))

(declare-fun mapIsEmpty!12477 () Bool)

(declare-fun mapRes!12477 () Bool)

(assert (=> mapIsEmpty!12477 mapRes!12477))

(declare-fun b!344546 () Bool)

(declare-fun e!211209 () Bool)

(assert (=> b!344546 (= e!211207 (and e!211209 mapRes!12477))))

(declare-fun condMapEmpty!12477 () Bool)

(declare-fun mapDefault!12477 () ValueCell!3336)

(assert (=> b!344546 (= condMapEmpty!12477 (= (arr!8670 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3336)) mapDefault!12477)))))

(declare-fun b!344547 () Bool)

(declare-fun e!211205 () Bool)

(assert (=> b!344547 (= e!211205 tp_is_empty!7359)))

(declare-fun mapNonEmpty!12477 () Bool)

(declare-fun tp!25766 () Bool)

(assert (=> mapNonEmpty!12477 (= mapRes!12477 (and tp!25766 e!211205))))

(declare-fun mapValue!12477 () ValueCell!3336)

(declare-fun mapRest!12477 () (Array (_ BitVec 32) ValueCell!3336))

(declare-fun mapKey!12477 () (_ BitVec 32))

(assert (=> mapNonEmpty!12477 (= (arr!8670 _values!1525) (store mapRest!12477 mapKey!12477 mapValue!12477))))

(declare-fun b!344548 () Bool)

(declare-fun res!190557 () Bool)

(assert (=> b!344548 (=> (not res!190557) (not e!211208))))

(declare-fun zeroValue!1467 () V!10789)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10789)

(declare-datatypes ((tuple2!5390 0))(
  ( (tuple2!5391 (_1!2706 (_ BitVec 64)) (_2!2706 V!10789)) )
))
(declare-datatypes ((List!5013 0))(
  ( (Nil!5010) (Cons!5009 (h!5865 tuple2!5390) (t!10129 List!5013)) )
))
(declare-datatypes ((ListLongMap!4303 0))(
  ( (ListLongMap!4304 (toList!2167 List!5013)) )
))
(declare-fun contains!2225 (ListLongMap!4303 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1688 (array!18305 array!18307 (_ BitVec 32) (_ BitVec 32) V!10789 V!10789 (_ BitVec 32) Int) ListLongMap!4303)

(assert (=> b!344548 (= res!190557 (not (contains!2225 (getCurrentListMap!1688 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!344549 () Bool)

(declare-fun res!190559 () Bool)

(assert (=> b!344549 (=> (not res!190559) (not e!211208))))

(assert (=> b!344549 (= res!190559 (and (= (size!9022 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9021 _keys!1895) (size!9022 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!344550 () Bool)

(assert (=> b!344550 (= e!211209 tp_is_empty!7359)))

(assert (= (and start!34484 res!190555) b!344549))

(assert (= (and b!344549 res!190559) b!344542))

(assert (= (and b!344542 res!190556) b!344545))

(assert (= (and b!344545 res!190554) b!344543))

(assert (= (and b!344543 res!190558) b!344548))

(assert (= (and b!344548 res!190557) b!344544))

(assert (= (and b!344546 condMapEmpty!12477) mapIsEmpty!12477))

(assert (= (and b!344546 (not condMapEmpty!12477)) mapNonEmpty!12477))

(assert (= (and mapNonEmpty!12477 ((_ is ValueCellFull!3336) mapValue!12477)) b!344547))

(assert (= (and b!344546 ((_ is ValueCellFull!3336) mapDefault!12477)) b!344550))

(assert (= start!34484 b!344546))

(declare-fun m!346137 () Bool)

(assert (=> b!344544 m!346137))

(declare-fun m!346139 () Bool)

(assert (=> b!344543 m!346139))

(declare-fun m!346141 () Bool)

(assert (=> b!344545 m!346141))

(declare-fun m!346143 () Bool)

(assert (=> b!344548 m!346143))

(assert (=> b!344548 m!346143))

(declare-fun m!346145 () Bool)

(assert (=> b!344548 m!346145))

(declare-fun m!346147 () Bool)

(assert (=> mapNonEmpty!12477 m!346147))

(declare-fun m!346149 () Bool)

(assert (=> b!344542 m!346149))

(declare-fun m!346151 () Bool)

(assert (=> start!34484 m!346151))

(declare-fun m!346153 () Bool)

(assert (=> start!34484 m!346153))

(declare-fun m!346155 () Bool)

(assert (=> start!34484 m!346155))

(check-sat (not mapNonEmpty!12477) tp_is_empty!7359 (not b!344542) (not b!344548) (not b!344545) (not start!34484) (not b!344543) (not b!344544) b_and!14615 (not b_next!7407))
(check-sat b_and!14615 (not b_next!7407))
