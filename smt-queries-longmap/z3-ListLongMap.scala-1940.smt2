; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34320 () Bool)

(assert start!34320)

(declare-fun b_free!7309 () Bool)

(declare-fun b_next!7309 () Bool)

(assert (=> start!34320 (= b_free!7309 (not b_next!7309))))

(declare-fun tp!25466 () Bool)

(declare-fun b_and!14527 () Bool)

(assert (=> start!34320 (= tp!25466 b_and!14527)))

(declare-fun mapIsEmpty!12324 () Bool)

(declare-fun mapRes!12324 () Bool)

(assert (=> mapIsEmpty!12324 mapRes!12324))

(declare-fun b!342750 () Bool)

(declare-fun e!210172 () Bool)

(declare-fun tp_is_empty!7261 () Bool)

(assert (=> b!342750 (= e!210172 tp_is_empty!7261)))

(declare-fun mapNonEmpty!12324 () Bool)

(declare-fun tp!25467 () Bool)

(assert (=> mapNonEmpty!12324 (= mapRes!12324 (and tp!25467 e!210172))))

(declare-datatypes ((V!10659 0))(
  ( (V!10660 (val!3675 Int)) )
))
(declare-datatypes ((ValueCell!3287 0))(
  ( (ValueCellFull!3287 (v!5850 V!10659)) (EmptyCell!3287) )
))
(declare-fun mapRest!12324 () (Array (_ BitVec 32) ValueCell!3287))

(declare-fun mapKey!12324 () (_ BitVec 32))

(declare-fun mapValue!12324 () ValueCell!3287)

(declare-datatypes ((array!18108 0))(
  ( (array!18109 (arr!8572 (Array (_ BitVec 32) ValueCell!3287)) (size!8924 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18108)

(assert (=> mapNonEmpty!12324 (= (arr!8572 _values!1525) (store mapRest!12324 mapKey!12324 mapValue!12324))))

(declare-fun b!342751 () Bool)

(declare-datatypes ((Unit!10656 0))(
  ( (Unit!10657) )
))
(declare-fun e!210171 () Unit!10656)

(declare-fun Unit!10658 () Unit!10656)

(assert (=> b!342751 (= e!210171 Unit!10658)))

(declare-fun b!342752 () Bool)

(declare-fun res!189502 () Bool)

(declare-fun e!210175 () Bool)

(assert (=> b!342752 (=> (not res!189502) (not e!210175))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((array!18110 0))(
  ( (array!18111 (arr!8573 (Array (_ BitVec 32) (_ BitVec 64))) (size!8925 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18110)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!342752 (= res!189502 (and (= (size!8924 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8925 _keys!1895) (size!8924 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun res!189498 () Bool)

(assert (=> start!34320 (=> (not res!189498) (not e!210175))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34320 (= res!189498 (validMask!0 mask!2385))))

(assert (=> start!34320 e!210175))

(assert (=> start!34320 true))

(assert (=> start!34320 tp_is_empty!7261))

(assert (=> start!34320 tp!25466))

(declare-fun e!210174 () Bool)

(declare-fun array_inv!6338 (array!18108) Bool)

(assert (=> start!34320 (and (array_inv!6338 _values!1525) e!210174)))

(declare-fun array_inv!6339 (array!18110) Bool)

(assert (=> start!34320 (array_inv!6339 _keys!1895)))

(declare-fun b!342753 () Bool)

(declare-fun e!210176 () Bool)

(assert (=> b!342753 (= e!210174 (and e!210176 mapRes!12324))))

(declare-fun condMapEmpty!12324 () Bool)

(declare-fun mapDefault!12324 () ValueCell!3287)

(assert (=> b!342753 (= condMapEmpty!12324 (= (arr!8572 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3287)) mapDefault!12324)))))

(declare-fun b!342754 () Bool)

(declare-fun res!189499 () Bool)

(assert (=> b!342754 (=> (not res!189499) (not e!210175))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!342754 (= res!189499 (validKeyInArray!0 k0!1348))))

(declare-fun b!342755 () Bool)

(declare-fun Unit!10659 () Unit!10656)

(assert (=> b!342755 (= e!210171 Unit!10659)))

(declare-fun zeroValue!1467 () V!10659)

(declare-fun lt!162267 () Unit!10656)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10659)

(declare-fun lemmaArrayContainsKeyThenInListMap!316 (array!18110 array!18108 (_ BitVec 32) (_ BitVec 32) V!10659 V!10659 (_ BitVec 64) (_ BitVec 32) Int) Unit!10656)

(declare-fun arrayScanForKey!0 (array!18110 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!342755 (= lt!162267 (lemmaArrayContainsKeyThenInListMap!316 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!342755 false))

(declare-fun b!342756 () Bool)

(assert (=> b!342756 (= e!210176 tp_is_empty!7261)))

(declare-fun b!342757 () Bool)

(declare-fun res!189503 () Bool)

(assert (=> b!342757 (=> (not res!189503) (not e!210175))))

(declare-datatypes ((List!4844 0))(
  ( (Nil!4841) (Cons!4840 (h!5696 (_ BitVec 64)) (t!9948 List!4844)) )
))
(declare-fun arrayNoDuplicates!0 (array!18110 (_ BitVec 32) List!4844) Bool)

(assert (=> b!342757 (= res!189503 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4841))))

(declare-fun b!342758 () Bool)

(declare-fun res!189497 () Bool)

(assert (=> b!342758 (=> (not res!189497) (not e!210175))))

(declare-datatypes ((tuple2!5242 0))(
  ( (tuple2!5243 (_1!2632 (_ BitVec 64)) (_2!2632 V!10659)) )
))
(declare-datatypes ((List!4845 0))(
  ( (Nil!4842) (Cons!4841 (h!5697 tuple2!5242) (t!9949 List!4845)) )
))
(declare-datatypes ((ListLongMap!4157 0))(
  ( (ListLongMap!4158 (toList!2094 List!4845)) )
))
(declare-fun contains!2169 (ListLongMap!4157 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1623 (array!18110 array!18108 (_ BitVec 32) (_ BitVec 32) V!10659 V!10659 (_ BitVec 32) Int) ListLongMap!4157)

(assert (=> b!342758 (= res!189497 (not (contains!2169 (getCurrentListMap!1623 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!342759 () Bool)

(declare-fun e!210173 () Bool)

(assert (=> b!342759 (= e!210173 false)))

(declare-fun lt!162266 () Unit!10656)

(assert (=> b!342759 (= lt!162266 e!210171)))

(declare-fun c!52820 () Bool)

(declare-fun arrayContainsKey!0 (array!18110 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!342759 (= c!52820 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!342760 () Bool)

(declare-fun res!189500 () Bool)

(assert (=> b!342760 (=> (not res!189500) (not e!210175))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18110 (_ BitVec 32)) Bool)

(assert (=> b!342760 (= res!189500 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!342761 () Bool)

(assert (=> b!342761 (= e!210175 e!210173)))

(declare-fun res!189501 () Bool)

(assert (=> b!342761 (=> (not res!189501) (not e!210173))))

(declare-datatypes ((SeekEntryResult!3259 0))(
  ( (MissingZero!3259 (index!15215 (_ BitVec 32))) (Found!3259 (index!15216 (_ BitVec 32))) (Intermediate!3259 (undefined!4071 Bool) (index!15217 (_ BitVec 32)) (x!34078 (_ BitVec 32))) (Undefined!3259) (MissingVacant!3259 (index!15218 (_ BitVec 32))) )
))
(declare-fun lt!162268 () SeekEntryResult!3259)

(get-info :version)

(assert (=> b!342761 (= res!189501 (and (not ((_ is Found!3259) lt!162268)) (not ((_ is MissingZero!3259) lt!162268)) ((_ is MissingVacant!3259) lt!162268)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18110 (_ BitVec 32)) SeekEntryResult!3259)

(assert (=> b!342761 (= lt!162268 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(assert (= (and start!34320 res!189498) b!342752))

(assert (= (and b!342752 res!189502) b!342760))

(assert (= (and b!342760 res!189500) b!342757))

(assert (= (and b!342757 res!189503) b!342754))

(assert (= (and b!342754 res!189499) b!342758))

(assert (= (and b!342758 res!189497) b!342761))

(assert (= (and b!342761 res!189501) b!342759))

(assert (= (and b!342759 c!52820) b!342755))

(assert (= (and b!342759 (not c!52820)) b!342751))

(assert (= (and b!342753 condMapEmpty!12324) mapIsEmpty!12324))

(assert (= (and b!342753 (not condMapEmpty!12324)) mapNonEmpty!12324))

(assert (= (and mapNonEmpty!12324 ((_ is ValueCellFull!3287) mapValue!12324)) b!342750))

(assert (= (and b!342753 ((_ is ValueCellFull!3287) mapDefault!12324)) b!342756))

(assert (= start!34320 b!342753))

(declare-fun m!345081 () Bool)

(assert (=> b!342754 m!345081))

(declare-fun m!345083 () Bool)

(assert (=> mapNonEmpty!12324 m!345083))

(declare-fun m!345085 () Bool)

(assert (=> b!342755 m!345085))

(assert (=> b!342755 m!345085))

(declare-fun m!345087 () Bool)

(assert (=> b!342755 m!345087))

(declare-fun m!345089 () Bool)

(assert (=> b!342759 m!345089))

(declare-fun m!345091 () Bool)

(assert (=> b!342758 m!345091))

(assert (=> b!342758 m!345091))

(declare-fun m!345093 () Bool)

(assert (=> b!342758 m!345093))

(declare-fun m!345095 () Bool)

(assert (=> b!342760 m!345095))

(declare-fun m!345097 () Bool)

(assert (=> start!34320 m!345097))

(declare-fun m!345099 () Bool)

(assert (=> start!34320 m!345099))

(declare-fun m!345101 () Bool)

(assert (=> start!34320 m!345101))

(declare-fun m!345103 () Bool)

(assert (=> b!342761 m!345103))

(declare-fun m!345105 () Bool)

(assert (=> b!342757 m!345105))

(check-sat (not b_next!7309) (not mapNonEmpty!12324) (not b!342757) b_and!14527 (not b!342758) (not b!342759) (not b!342761) (not b!342755) (not b!342760) tp_is_empty!7261 (not b!342754) (not start!34320))
(check-sat b_and!14527 (not b_next!7309))
