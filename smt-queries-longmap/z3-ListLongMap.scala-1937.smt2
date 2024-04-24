; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34302 () Bool)

(assert start!34302)

(declare-fun b_free!7291 () Bool)

(declare-fun b_next!7291 () Bool)

(assert (=> start!34302 (= b_free!7291 (not b_next!7291))))

(declare-fun tp!25413 () Bool)

(declare-fun b_and!14509 () Bool)

(assert (=> start!34302 (= tp!25413 b_and!14509)))

(declare-fun b!342426 () Bool)

(declare-fun e!209982 () Bool)

(assert (=> b!342426 (= e!209982 false)))

(declare-datatypes ((Unit!10630 0))(
  ( (Unit!10631) )
))
(declare-fun lt!162187 () Unit!10630)

(declare-fun e!209983 () Unit!10630)

(assert (=> b!342426 (= lt!162187 e!209983)))

(declare-fun c!52793 () Bool)

(declare-datatypes ((array!18072 0))(
  ( (array!18073 (arr!8554 (Array (_ BitVec 32) (_ BitVec 64))) (size!8906 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18072)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!18072 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!342426 (= c!52793 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!342427 () Bool)

(declare-fun res!189313 () Bool)

(declare-fun e!209981 () Bool)

(assert (=> b!342427 (=> (not res!189313) (not e!209981))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10635 0))(
  ( (V!10636 (val!3666 Int)) )
))
(declare-datatypes ((ValueCell!3278 0))(
  ( (ValueCellFull!3278 (v!5841 V!10635)) (EmptyCell!3278) )
))
(declare-datatypes ((array!18074 0))(
  ( (array!18075 (arr!8555 (Array (_ BitVec 32) ValueCell!3278)) (size!8907 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18074)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!342427 (= res!189313 (and (= (size!8907 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8906 _keys!1895) (size!8907 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!342428 () Bool)

(declare-fun res!189308 () Bool)

(assert (=> b!342428 (=> (not res!189308) (not e!209981))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!342428 (= res!189308 (validKeyInArray!0 k0!1348))))

(declare-fun b!342429 () Bool)

(declare-fun e!209984 () Bool)

(declare-fun e!209987 () Bool)

(declare-fun mapRes!12297 () Bool)

(assert (=> b!342429 (= e!209984 (and e!209987 mapRes!12297))))

(declare-fun condMapEmpty!12297 () Bool)

(declare-fun mapDefault!12297 () ValueCell!3278)

(assert (=> b!342429 (= condMapEmpty!12297 (= (arr!8555 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3278)) mapDefault!12297)))))

(declare-fun b!342430 () Bool)

(assert (=> b!342430 (= e!209981 e!209982)))

(declare-fun res!189311 () Bool)

(assert (=> b!342430 (=> (not res!189311) (not e!209982))))

(declare-datatypes ((SeekEntryResult!3254 0))(
  ( (MissingZero!3254 (index!15195 (_ BitVec 32))) (Found!3254 (index!15196 (_ BitVec 32))) (Intermediate!3254 (undefined!4066 Bool) (index!15197 (_ BitVec 32)) (x!34049 (_ BitVec 32))) (Undefined!3254) (MissingVacant!3254 (index!15198 (_ BitVec 32))) )
))
(declare-fun lt!162186 () SeekEntryResult!3254)

(get-info :version)

(assert (=> b!342430 (= res!189311 (and (not ((_ is Found!3254) lt!162186)) (not ((_ is MissingZero!3254) lt!162186)) ((_ is MissingVacant!3254) lt!162186)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18072 (_ BitVec 32)) SeekEntryResult!3254)

(assert (=> b!342430 (= lt!162186 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!342431 () Bool)

(declare-fun res!189310 () Bool)

(assert (=> b!342431 (=> (not res!189310) (not e!209981))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18072 (_ BitVec 32)) Bool)

(assert (=> b!342431 (= res!189310 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun res!189309 () Bool)

(assert (=> start!34302 (=> (not res!189309) (not e!209981))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34302 (= res!189309 (validMask!0 mask!2385))))

(assert (=> start!34302 e!209981))

(assert (=> start!34302 true))

(declare-fun tp_is_empty!7243 () Bool)

(assert (=> start!34302 tp_is_empty!7243))

(assert (=> start!34302 tp!25413))

(declare-fun array_inv!6326 (array!18074) Bool)

(assert (=> start!34302 (and (array_inv!6326 _values!1525) e!209984)))

(declare-fun array_inv!6327 (array!18072) Bool)

(assert (=> start!34302 (array_inv!6327 _keys!1895)))

(declare-fun mapNonEmpty!12297 () Bool)

(declare-fun tp!25412 () Bool)

(declare-fun e!209985 () Bool)

(assert (=> mapNonEmpty!12297 (= mapRes!12297 (and tp!25412 e!209985))))

(declare-fun mapValue!12297 () ValueCell!3278)

(declare-fun mapKey!12297 () (_ BitVec 32))

(declare-fun mapRest!12297 () (Array (_ BitVec 32) ValueCell!3278))

(assert (=> mapNonEmpty!12297 (= (arr!8555 _values!1525) (store mapRest!12297 mapKey!12297 mapValue!12297))))

(declare-fun b!342432 () Bool)

(declare-fun res!189314 () Bool)

(assert (=> b!342432 (=> (not res!189314) (not e!209981))))

(declare-fun zeroValue!1467 () V!10635)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10635)

(declare-datatypes ((tuple2!5228 0))(
  ( (tuple2!5229 (_1!2625 (_ BitVec 64)) (_2!2625 V!10635)) )
))
(declare-datatypes ((List!4831 0))(
  ( (Nil!4828) (Cons!4827 (h!5683 tuple2!5228) (t!9935 List!4831)) )
))
(declare-datatypes ((ListLongMap!4143 0))(
  ( (ListLongMap!4144 (toList!2087 List!4831)) )
))
(declare-fun contains!2162 (ListLongMap!4143 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1616 (array!18072 array!18074 (_ BitVec 32) (_ BitVec 32) V!10635 V!10635 (_ BitVec 32) Int) ListLongMap!4143)

(assert (=> b!342432 (= res!189314 (not (contains!2162 (getCurrentListMap!1616 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!342433 () Bool)

(declare-fun Unit!10632 () Unit!10630)

(assert (=> b!342433 (= e!209983 Unit!10632)))

(declare-fun b!342434 () Bool)

(assert (=> b!342434 (= e!209987 tp_is_empty!7243)))

(declare-fun b!342435 () Bool)

(declare-fun res!189312 () Bool)

(assert (=> b!342435 (=> (not res!189312) (not e!209981))))

(declare-datatypes ((List!4832 0))(
  ( (Nil!4829) (Cons!4828 (h!5684 (_ BitVec 64)) (t!9936 List!4832)) )
))
(declare-fun arrayNoDuplicates!0 (array!18072 (_ BitVec 32) List!4832) Bool)

(assert (=> b!342435 (= res!189312 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4829))))

(declare-fun mapIsEmpty!12297 () Bool)

(assert (=> mapIsEmpty!12297 mapRes!12297))

(declare-fun b!342436 () Bool)

(declare-fun Unit!10633 () Unit!10630)

(assert (=> b!342436 (= e!209983 Unit!10633)))

(declare-fun lt!162185 () Unit!10630)

(declare-fun lemmaArrayContainsKeyThenInListMap!309 (array!18072 array!18074 (_ BitVec 32) (_ BitVec 32) V!10635 V!10635 (_ BitVec 64) (_ BitVec 32) Int) Unit!10630)

(declare-fun arrayScanForKey!0 (array!18072 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!342436 (= lt!162185 (lemmaArrayContainsKeyThenInListMap!309 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!342436 false))

(declare-fun b!342437 () Bool)

(assert (=> b!342437 (= e!209985 tp_is_empty!7243)))

(assert (= (and start!34302 res!189309) b!342427))

(assert (= (and b!342427 res!189313) b!342431))

(assert (= (and b!342431 res!189310) b!342435))

(assert (= (and b!342435 res!189312) b!342428))

(assert (= (and b!342428 res!189308) b!342432))

(assert (= (and b!342432 res!189314) b!342430))

(assert (= (and b!342430 res!189311) b!342426))

(assert (= (and b!342426 c!52793) b!342436))

(assert (= (and b!342426 (not c!52793)) b!342433))

(assert (= (and b!342429 condMapEmpty!12297) mapIsEmpty!12297))

(assert (= (and b!342429 (not condMapEmpty!12297)) mapNonEmpty!12297))

(assert (= (and mapNonEmpty!12297 ((_ is ValueCellFull!3278) mapValue!12297)) b!342437))

(assert (= (and b!342429 ((_ is ValueCellFull!3278) mapDefault!12297)) b!342434))

(assert (= start!34302 b!342429))

(declare-fun m!344847 () Bool)

(assert (=> b!342426 m!344847))

(declare-fun m!344849 () Bool)

(assert (=> b!342428 m!344849))

(declare-fun m!344851 () Bool)

(assert (=> b!342432 m!344851))

(assert (=> b!342432 m!344851))

(declare-fun m!344853 () Bool)

(assert (=> b!342432 m!344853))

(declare-fun m!344855 () Bool)

(assert (=> b!342436 m!344855))

(assert (=> b!342436 m!344855))

(declare-fun m!344857 () Bool)

(assert (=> b!342436 m!344857))

(declare-fun m!344859 () Bool)

(assert (=> b!342435 m!344859))

(declare-fun m!344861 () Bool)

(assert (=> b!342431 m!344861))

(declare-fun m!344863 () Bool)

(assert (=> mapNonEmpty!12297 m!344863))

(declare-fun m!344865 () Bool)

(assert (=> start!34302 m!344865))

(declare-fun m!344867 () Bool)

(assert (=> start!34302 m!344867))

(declare-fun m!344869 () Bool)

(assert (=> start!34302 m!344869))

(declare-fun m!344871 () Bool)

(assert (=> b!342430 m!344871))

(check-sat b_and!14509 (not b!342431) (not mapNonEmpty!12297) (not b_next!7291) (not b!342435) (not start!34302) (not b!342426) tp_is_empty!7243 (not b!342432) (not b!342428) (not b!342430) (not b!342436))
(check-sat b_and!14509 (not b_next!7291))
