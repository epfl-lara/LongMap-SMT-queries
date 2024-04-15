; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34314 () Bool)

(assert start!34314)

(declare-fun b_free!7303 () Bool)

(declare-fun b_next!7303 () Bool)

(assert (=> start!34314 (= b_free!7303 (not b_next!7303))))

(declare-fun tp!25448 () Bool)

(declare-fun b_and!14481 () Bool)

(assert (=> start!34314 (= tp!25448 b_and!14481)))

(declare-fun b!342420 () Bool)

(declare-fun res!189310 () Bool)

(declare-fun e!209968 () Bool)

(assert (=> b!342420 (=> (not res!189310) (not e!209968))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!10651 0))(
  ( (V!10652 (val!3672 Int)) )
))
(declare-fun zeroValue!1467 () V!10651)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3284 0))(
  ( (ValueCellFull!3284 (v!5840 V!10651)) (EmptyCell!3284) )
))
(declare-datatypes ((array!18089 0))(
  ( (array!18090 (arr!8563 (Array (_ BitVec 32) ValueCell!3284)) (size!8916 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18089)

(declare-datatypes ((array!18091 0))(
  ( (array!18092 (arr!8564 (Array (_ BitVec 32) (_ BitVec 64))) (size!8917 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18091)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10651)

(declare-datatypes ((tuple2!5270 0))(
  ( (tuple2!5271 (_1!2646 (_ BitVec 64)) (_2!2646 V!10651)) )
))
(declare-datatypes ((List!4892 0))(
  ( (Nil!4889) (Cons!4888 (h!5744 tuple2!5270) (t!9995 List!4892)) )
))
(declare-datatypes ((ListLongMap!4173 0))(
  ( (ListLongMap!4174 (toList!2102 List!4892)) )
))
(declare-fun contains!2169 (ListLongMap!4173 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1608 (array!18091 array!18089 (_ BitVec 32) (_ BitVec 32) V!10651 V!10651 (_ BitVec 32) Int) ListLongMap!4173)

(assert (=> b!342420 (= res!189310 (not (contains!2169 (getCurrentListMap!1608 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun res!189308 () Bool)

(assert (=> start!34314 (=> (not res!189308) (not e!209968))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34314 (= res!189308 (validMask!0 mask!2385))))

(assert (=> start!34314 e!209968))

(assert (=> start!34314 true))

(declare-fun tp_is_empty!7255 () Bool)

(assert (=> start!34314 tp_is_empty!7255))

(assert (=> start!34314 tp!25448))

(declare-fun e!209970 () Bool)

(declare-fun array_inv!6368 (array!18089) Bool)

(assert (=> start!34314 (and (array_inv!6368 _values!1525) e!209970)))

(declare-fun array_inv!6369 (array!18091) Bool)

(assert (=> start!34314 (array_inv!6369 _keys!1895)))

(declare-fun b!342421 () Bool)

(declare-fun e!209965 () Bool)

(assert (=> b!342421 (= e!209965 tp_is_empty!7255)))

(declare-fun b!342422 () Bool)

(declare-fun res!189311 () Bool)

(assert (=> b!342422 (=> (not res!189311) (not e!209968))))

(assert (=> b!342422 (= res!189311 (and (= (size!8916 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8917 _keys!1895) (size!8916 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!342423 () Bool)

(declare-datatypes ((Unit!10649 0))(
  ( (Unit!10650) )
))
(declare-fun e!209967 () Unit!10649)

(declare-fun Unit!10651 () Unit!10649)

(assert (=> b!342423 (= e!209967 Unit!10651)))

(declare-fun lt!161987 () Unit!10649)

(declare-fun lemmaArrayContainsKeyThenInListMap!304 (array!18091 array!18089 (_ BitVec 32) (_ BitVec 32) V!10651 V!10651 (_ BitVec 64) (_ BitVec 32) Int) Unit!10649)

(declare-fun arrayScanForKey!0 (array!18091 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!342423 (= lt!161987 (lemmaArrayContainsKeyThenInListMap!304 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!342423 false))

(declare-fun mapNonEmpty!12315 () Bool)

(declare-fun mapRes!12315 () Bool)

(declare-fun tp!25449 () Bool)

(declare-fun e!209969 () Bool)

(assert (=> mapNonEmpty!12315 (= mapRes!12315 (and tp!25449 e!209969))))

(declare-fun mapKey!12315 () (_ BitVec 32))

(declare-fun mapRest!12315 () (Array (_ BitVec 32) ValueCell!3284))

(declare-fun mapValue!12315 () ValueCell!3284)

(assert (=> mapNonEmpty!12315 (= (arr!8563 _values!1525) (store mapRest!12315 mapKey!12315 mapValue!12315))))

(declare-fun b!342424 () Bool)

(declare-fun Unit!10652 () Unit!10649)

(assert (=> b!342424 (= e!209967 Unit!10652)))

(declare-fun b!342425 () Bool)

(assert (=> b!342425 (= e!209970 (and e!209965 mapRes!12315))))

(declare-fun condMapEmpty!12315 () Bool)

(declare-fun mapDefault!12315 () ValueCell!3284)

(assert (=> b!342425 (= condMapEmpty!12315 (= (arr!8563 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3284)) mapDefault!12315)))))

(declare-fun b!342426 () Bool)

(declare-fun e!209966 () Bool)

(assert (=> b!342426 (= e!209968 e!209966)))

(declare-fun res!189313 () Bool)

(assert (=> b!342426 (=> (not res!189313) (not e!209966))))

(declare-datatypes ((SeekEntryResult!3300 0))(
  ( (MissingZero!3300 (index!15379 (_ BitVec 32))) (Found!3300 (index!15380 (_ BitVec 32))) (Intermediate!3300 (undefined!4112 Bool) (index!15381 (_ BitVec 32)) (x!34109 (_ BitVec 32))) (Undefined!3300) (MissingVacant!3300 (index!15382 (_ BitVec 32))) )
))
(declare-fun lt!161988 () SeekEntryResult!3300)

(get-info :version)

(assert (=> b!342426 (= res!189313 (and (not ((_ is Found!3300) lt!161988)) (not ((_ is MissingZero!3300) lt!161988)) ((_ is MissingVacant!3300) lt!161988)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18091 (_ BitVec 32)) SeekEntryResult!3300)

(assert (=> b!342426 (= lt!161988 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12315 () Bool)

(assert (=> mapIsEmpty!12315 mapRes!12315))

(declare-fun b!342427 () Bool)

(declare-fun res!189309 () Bool)

(assert (=> b!342427 (=> (not res!189309) (not e!209968))))

(declare-datatypes ((List!4893 0))(
  ( (Nil!4890) (Cons!4889 (h!5745 (_ BitVec 64)) (t!9996 List!4893)) )
))
(declare-fun arrayNoDuplicates!0 (array!18091 (_ BitVec 32) List!4893) Bool)

(assert (=> b!342427 (= res!189309 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4890))))

(declare-fun b!342428 () Bool)

(assert (=> b!342428 (= e!209966 false)))

(declare-fun lt!161986 () Unit!10649)

(assert (=> b!342428 (= lt!161986 e!209967)))

(declare-fun c!52763 () Bool)

(declare-fun arrayContainsKey!0 (array!18091 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!342428 (= c!52763 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!342429 () Bool)

(declare-fun res!189314 () Bool)

(assert (=> b!342429 (=> (not res!189314) (not e!209968))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18091 (_ BitVec 32)) Bool)

(assert (=> b!342429 (= res!189314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!342430 () Bool)

(declare-fun res!189312 () Bool)

(assert (=> b!342430 (=> (not res!189312) (not e!209968))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!342430 (= res!189312 (validKeyInArray!0 k0!1348))))

(declare-fun b!342431 () Bool)

(assert (=> b!342431 (= e!209969 tp_is_empty!7255)))

(assert (= (and start!34314 res!189308) b!342422))

(assert (= (and b!342422 res!189311) b!342429))

(assert (= (and b!342429 res!189314) b!342427))

(assert (= (and b!342427 res!189309) b!342430))

(assert (= (and b!342430 res!189312) b!342420))

(assert (= (and b!342420 res!189310) b!342426))

(assert (= (and b!342426 res!189313) b!342428))

(assert (= (and b!342428 c!52763) b!342423))

(assert (= (and b!342428 (not c!52763)) b!342424))

(assert (= (and b!342425 condMapEmpty!12315) mapIsEmpty!12315))

(assert (= (and b!342425 (not condMapEmpty!12315)) mapNonEmpty!12315))

(assert (= (and mapNonEmpty!12315 ((_ is ValueCellFull!3284) mapValue!12315)) b!342431))

(assert (= (and b!342425 ((_ is ValueCellFull!3284) mapDefault!12315)) b!342421))

(assert (= start!34314 b!342425))

(declare-fun m!344049 () Bool)

(assert (=> start!34314 m!344049))

(declare-fun m!344051 () Bool)

(assert (=> start!34314 m!344051))

(declare-fun m!344053 () Bool)

(assert (=> start!34314 m!344053))

(declare-fun m!344055 () Bool)

(assert (=> b!342428 m!344055))

(declare-fun m!344057 () Bool)

(assert (=> b!342420 m!344057))

(assert (=> b!342420 m!344057))

(declare-fun m!344059 () Bool)

(assert (=> b!342420 m!344059))

(declare-fun m!344061 () Bool)

(assert (=> b!342430 m!344061))

(declare-fun m!344063 () Bool)

(assert (=> b!342429 m!344063))

(declare-fun m!344065 () Bool)

(assert (=> b!342426 m!344065))

(declare-fun m!344067 () Bool)

(assert (=> b!342423 m!344067))

(assert (=> b!342423 m!344067))

(declare-fun m!344069 () Bool)

(assert (=> b!342423 m!344069))

(declare-fun m!344071 () Bool)

(assert (=> mapNonEmpty!12315 m!344071))

(declare-fun m!344073 () Bool)

(assert (=> b!342427 m!344073))

(check-sat (not b!342429) (not b!342426) (not b!342423) (not b_next!7303) (not b!342420) (not b!342428) tp_is_empty!7255 (not start!34314) (not b!342430) b_and!14481 (not b!342427) (not mapNonEmpty!12315))
(check-sat b_and!14481 (not b_next!7303))
