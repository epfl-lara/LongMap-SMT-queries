; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34674 () Bool)

(assert start!34674)

(declare-fun b_free!7495 () Bool)

(declare-fun b_next!7495 () Bool)

(assert (=> start!34674 (= b_free!7495 (not b_next!7495))))

(declare-fun tp!26048 () Bool)

(declare-fun b_and!14689 () Bool)

(assert (=> start!34674 (= tp!26048 b_and!14689)))

(declare-fun b!346308 () Bool)

(declare-fun e!212242 () Bool)

(declare-fun e!212238 () Bool)

(declare-fun mapRes!12627 () Bool)

(assert (=> b!346308 (= e!212242 (and e!212238 mapRes!12627))))

(declare-fun condMapEmpty!12627 () Bool)

(declare-datatypes ((V!10907 0))(
  ( (V!10908 (val!3768 Int)) )
))
(declare-datatypes ((ValueCell!3380 0))(
  ( (ValueCellFull!3380 (v!5944 V!10907)) (EmptyCell!3380) )
))
(declare-datatypes ((array!18473 0))(
  ( (array!18474 (arr!8747 (Array (_ BitVec 32) ValueCell!3380)) (size!9100 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18473)

(declare-fun mapDefault!12627 () ValueCell!3380)

(assert (=> b!346308 (= condMapEmpty!12627 (= (arr!8747 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3380)) mapDefault!12627)))))

(declare-fun b!346309 () Bool)

(declare-fun e!212241 () Bool)

(declare-fun tp_is_empty!7447 () Bool)

(assert (=> b!346309 (= e!212241 tp_is_empty!7447)))

(declare-fun b!346310 () Bool)

(declare-fun e!212240 () Bool)

(assert (=> b!346310 (= e!212240 (not true))))

(declare-datatypes ((array!18475 0))(
  ( (array!18476 (arr!8748 (Array (_ BitVec 32) (_ BitVec 64))) (size!9101 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18475)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!18475 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!346310 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10730 0))(
  ( (Unit!10731) )
))
(declare-fun lt!163160 () Unit!10730)

(declare-datatypes ((SeekEntryResult!3369 0))(
  ( (MissingZero!3369 (index!15655 (_ BitVec 32))) (Found!3369 (index!15656 (_ BitVec 32))) (Intermediate!3369 (undefined!4181 Bool) (index!15657 (_ BitVec 32)) (x!34514 (_ BitVec 32))) (Undefined!3369) (MissingVacant!3369 (index!15658 (_ BitVec 32))) )
))
(declare-fun lt!163161 () SeekEntryResult!3369)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18475 (_ BitVec 64) (_ BitVec 32)) Unit!10730)

(assert (=> b!346310 (= lt!163160 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!15656 lt!163161)))))

(declare-fun mapNonEmpty!12627 () Bool)

(declare-fun tp!26049 () Bool)

(assert (=> mapNonEmpty!12627 (= mapRes!12627 (and tp!26049 e!212241))))

(declare-fun mapValue!12627 () ValueCell!3380)

(declare-fun mapKey!12627 () (_ BitVec 32))

(declare-fun mapRest!12627 () (Array (_ BitVec 32) ValueCell!3380))

(assert (=> mapNonEmpty!12627 (= (arr!8747 _values!1525) (store mapRest!12627 mapKey!12627 mapValue!12627))))

(declare-fun b!346311 () Bool)

(declare-fun res!191582 () Bool)

(declare-fun e!212239 () Bool)

(assert (=> b!346311 (=> (not res!191582) (not e!212239))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun zeroValue!1467 () V!10907)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10907)

(declare-datatypes ((tuple2!5410 0))(
  ( (tuple2!5411 (_1!2716 (_ BitVec 64)) (_2!2716 V!10907)) )
))
(declare-datatypes ((List!5027 0))(
  ( (Nil!5024) (Cons!5023 (h!5879 tuple2!5410) (t!10146 List!5027)) )
))
(declare-datatypes ((ListLongMap!4313 0))(
  ( (ListLongMap!4314 (toList!2172 List!5027)) )
))
(declare-fun contains!2247 (ListLongMap!4313 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1678 (array!18475 array!18473 (_ BitVec 32) (_ BitVec 32) V!10907 V!10907 (_ BitVec 32) Int) ListLongMap!4313)

(assert (=> b!346311 (= res!191582 (not (contains!2247 (getCurrentListMap!1678 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!346312 () Bool)

(declare-fun res!191584 () Bool)

(assert (=> b!346312 (=> (not res!191584) (not e!212239))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!346312 (= res!191584 (validKeyInArray!0 k0!1348))))

(declare-fun b!346313 () Bool)

(declare-fun res!191580 () Bool)

(assert (=> b!346313 (=> (not res!191580) (not e!212239))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18475 (_ BitVec 32)) Bool)

(assert (=> b!346313 (= res!191580 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!346314 () Bool)

(declare-fun res!191578 () Bool)

(assert (=> b!346314 (=> (not res!191578) (not e!212240))))

(assert (=> b!346314 (= res!191578 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15656 lt!163161)))))

(declare-fun b!346315 () Bool)

(declare-fun res!191581 () Bool)

(assert (=> b!346315 (=> (not res!191581) (not e!212239))))

(declare-datatypes ((List!5028 0))(
  ( (Nil!5025) (Cons!5024 (h!5880 (_ BitVec 64)) (t!10147 List!5028)) )
))
(declare-fun arrayNoDuplicates!0 (array!18475 (_ BitVec 32) List!5028) Bool)

(assert (=> b!346315 (= res!191581 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5025))))

(declare-fun b!346317 () Bool)

(assert (=> b!346317 (= e!212239 e!212240)))

(declare-fun res!191585 () Bool)

(assert (=> b!346317 (=> (not res!191585) (not e!212240))))

(get-info :version)

(assert (=> b!346317 (= res!191585 (and ((_ is Found!3369) lt!163161) (= (select (arr!8748 _keys!1895) (index!15656 lt!163161)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18475 (_ BitVec 32)) SeekEntryResult!3369)

(assert (=> b!346317 (= lt!163161 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12627 () Bool)

(assert (=> mapIsEmpty!12627 mapRes!12627))

(declare-fun b!346318 () Bool)

(declare-fun res!191579 () Bool)

(assert (=> b!346318 (=> (not res!191579) (not e!212239))))

(assert (=> b!346318 (= res!191579 (and (= (size!9100 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9101 _keys!1895) (size!9100 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!346316 () Bool)

(assert (=> b!346316 (= e!212238 tp_is_empty!7447)))

(declare-fun res!191583 () Bool)

(assert (=> start!34674 (=> (not res!191583) (not e!212239))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34674 (= res!191583 (validMask!0 mask!2385))))

(assert (=> start!34674 e!212239))

(assert (=> start!34674 true))

(assert (=> start!34674 tp_is_empty!7447))

(assert (=> start!34674 tp!26048))

(declare-fun array_inv!6498 (array!18473) Bool)

(assert (=> start!34674 (and (array_inv!6498 _values!1525) e!212242)))

(declare-fun array_inv!6499 (array!18475) Bool)

(assert (=> start!34674 (array_inv!6499 _keys!1895)))

(assert (= (and start!34674 res!191583) b!346318))

(assert (= (and b!346318 res!191579) b!346313))

(assert (= (and b!346313 res!191580) b!346315))

(assert (= (and b!346315 res!191581) b!346312))

(assert (= (and b!346312 res!191584) b!346311))

(assert (= (and b!346311 res!191582) b!346317))

(assert (= (and b!346317 res!191585) b!346314))

(assert (= (and b!346314 res!191578) b!346310))

(assert (= (and b!346308 condMapEmpty!12627) mapIsEmpty!12627))

(assert (= (and b!346308 (not condMapEmpty!12627)) mapNonEmpty!12627))

(assert (= (and mapNonEmpty!12627 ((_ is ValueCellFull!3380) mapValue!12627)) b!346309))

(assert (= (and b!346308 ((_ is ValueCellFull!3380) mapDefault!12627)) b!346316))

(assert (= start!34674 b!346308))

(declare-fun m!346913 () Bool)

(assert (=> b!346312 m!346913))

(declare-fun m!346915 () Bool)

(assert (=> b!346310 m!346915))

(declare-fun m!346917 () Bool)

(assert (=> b!346310 m!346917))

(declare-fun m!346919 () Bool)

(assert (=> b!346315 m!346919))

(declare-fun m!346921 () Bool)

(assert (=> b!346313 m!346921))

(declare-fun m!346923 () Bool)

(assert (=> start!34674 m!346923))

(declare-fun m!346925 () Bool)

(assert (=> start!34674 m!346925))

(declare-fun m!346927 () Bool)

(assert (=> start!34674 m!346927))

(declare-fun m!346929 () Bool)

(assert (=> mapNonEmpty!12627 m!346929))

(declare-fun m!346931 () Bool)

(assert (=> b!346314 m!346931))

(declare-fun m!346933 () Bool)

(assert (=> b!346311 m!346933))

(assert (=> b!346311 m!346933))

(declare-fun m!346935 () Bool)

(assert (=> b!346311 m!346935))

(declare-fun m!346937 () Bool)

(assert (=> b!346317 m!346937))

(declare-fun m!346939 () Bool)

(assert (=> b!346317 m!346939))

(check-sat tp_is_empty!7447 (not mapNonEmpty!12627) b_and!14689 (not b!346310) (not b!346312) (not b_next!7495) (not b!346317) (not b!346314) (not b!346311) (not start!34674) (not b!346315) (not b!346313))
(check-sat b_and!14689 (not b_next!7495))
