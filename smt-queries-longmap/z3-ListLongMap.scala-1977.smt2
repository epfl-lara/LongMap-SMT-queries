; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34710 () Bool)

(assert start!34710)

(declare-fun b_free!7531 () Bool)

(declare-fun b_next!7531 () Bool)

(assert (=> start!34710 (= b_free!7531 (not b_next!7531))))

(declare-fun tp!26156 () Bool)

(declare-fun b_and!14725 () Bool)

(assert (=> start!34710 (= tp!26156 b_and!14725)))

(declare-fun mapNonEmpty!12681 () Bool)

(declare-fun mapRes!12681 () Bool)

(declare-fun tp!26157 () Bool)

(declare-fun e!212565 () Bool)

(assert (=> mapNonEmpty!12681 (= mapRes!12681 (and tp!26157 e!212565))))

(declare-fun mapKey!12681 () (_ BitVec 32))

(declare-datatypes ((V!10955 0))(
  ( (V!10956 (val!3786 Int)) )
))
(declare-datatypes ((ValueCell!3398 0))(
  ( (ValueCellFull!3398 (v!5962 V!10955)) (EmptyCell!3398) )
))
(declare-datatypes ((array!18541 0))(
  ( (array!18542 (arr!8781 (Array (_ BitVec 32) ValueCell!3398)) (size!9134 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18541)

(declare-fun mapRest!12681 () (Array (_ BitVec 32) ValueCell!3398))

(declare-fun mapValue!12681 () ValueCell!3398)

(assert (=> mapNonEmpty!12681 (= (arr!8781 _values!1525) (store mapRest!12681 mapKey!12681 mapValue!12681))))

(declare-fun res!192016 () Bool)

(declare-fun e!212562 () Bool)

(assert (=> start!34710 (=> (not res!192016) (not e!212562))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34710 (= res!192016 (validMask!0 mask!2385))))

(assert (=> start!34710 e!212562))

(assert (=> start!34710 true))

(declare-fun tp_is_empty!7483 () Bool)

(assert (=> start!34710 tp_is_empty!7483))

(assert (=> start!34710 tp!26156))

(declare-fun e!212561 () Bool)

(declare-fun array_inv!6520 (array!18541) Bool)

(assert (=> start!34710 (and (array_inv!6520 _values!1525) e!212561)))

(declare-datatypes ((array!18543 0))(
  ( (array!18544 (arr!8782 (Array (_ BitVec 32) (_ BitVec 64))) (size!9135 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18543)

(declare-fun array_inv!6521 (array!18543) Bool)

(assert (=> start!34710 (array_inv!6521 _keys!1895)))

(declare-fun b!346902 () Bool)

(declare-fun e!212566 () Bool)

(assert (=> b!346902 (= e!212566 (not true))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!18543 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!346902 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((SeekEntryResult!3383 0))(
  ( (MissingZero!3383 (index!15711 (_ BitVec 32))) (Found!3383 (index!15712 (_ BitVec 32))) (Intermediate!3383 (undefined!4195 Bool) (index!15713 (_ BitVec 32)) (x!34576 (_ BitVec 32))) (Undefined!3383) (MissingVacant!3383 (index!15714 (_ BitVec 32))) )
))
(declare-fun lt!163268 () SeekEntryResult!3383)

(declare-datatypes ((Unit!10754 0))(
  ( (Unit!10755) )
))
(declare-fun lt!163269 () Unit!10754)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18543 (_ BitVec 64) (_ BitVec 32)) Unit!10754)

(assert (=> b!346902 (= lt!163269 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!15712 lt!163268)))))

(declare-fun b!346903 () Bool)

(assert (=> b!346903 (= e!212565 tp_is_empty!7483)))

(declare-fun b!346904 () Bool)

(declare-fun res!192014 () Bool)

(assert (=> b!346904 (=> (not res!192014) (not e!212562))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!346904 (= res!192014 (validKeyInArray!0 k0!1348))))

(declare-fun b!346905 () Bool)

(declare-fun res!192010 () Bool)

(assert (=> b!346905 (=> (not res!192010) (not e!212562))))

(declare-fun zeroValue!1467 () V!10955)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10955)

(declare-datatypes ((tuple2!5436 0))(
  ( (tuple2!5437 (_1!2729 (_ BitVec 64)) (_2!2729 V!10955)) )
))
(declare-datatypes ((List!5053 0))(
  ( (Nil!5050) (Cons!5049 (h!5905 tuple2!5436) (t!10172 List!5053)) )
))
(declare-datatypes ((ListLongMap!4339 0))(
  ( (ListLongMap!4340 (toList!2185 List!5053)) )
))
(declare-fun contains!2260 (ListLongMap!4339 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1691 (array!18543 array!18541 (_ BitVec 32) (_ BitVec 32) V!10955 V!10955 (_ BitVec 32) Int) ListLongMap!4339)

(assert (=> b!346905 (= res!192010 (not (contains!2260 (getCurrentListMap!1691 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!346906 () Bool)

(declare-fun res!192012 () Bool)

(assert (=> b!346906 (=> (not res!192012) (not e!212562))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18543 (_ BitVec 32)) Bool)

(assert (=> b!346906 (= res!192012 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!346907 () Bool)

(declare-fun res!192015 () Bool)

(assert (=> b!346907 (=> (not res!192015) (not e!212566))))

(assert (=> b!346907 (= res!192015 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15712 lt!163268)))))

(declare-fun b!346908 () Bool)

(assert (=> b!346908 (= e!212562 e!212566)))

(declare-fun res!192017 () Bool)

(assert (=> b!346908 (=> (not res!192017) (not e!212566))))

(get-info :version)

(assert (=> b!346908 (= res!192017 (and ((_ is Found!3383) lt!163268) (= (select (arr!8782 _keys!1895) (index!15712 lt!163268)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18543 (_ BitVec 32)) SeekEntryResult!3383)

(assert (=> b!346908 (= lt!163268 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12681 () Bool)

(assert (=> mapIsEmpty!12681 mapRes!12681))

(declare-fun b!346909 () Bool)

(declare-fun res!192011 () Bool)

(assert (=> b!346909 (=> (not res!192011) (not e!212562))))

(assert (=> b!346909 (= res!192011 (and (= (size!9134 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9135 _keys!1895) (size!9134 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!346910 () Bool)

(declare-fun e!212564 () Bool)

(assert (=> b!346910 (= e!212561 (and e!212564 mapRes!12681))))

(declare-fun condMapEmpty!12681 () Bool)

(declare-fun mapDefault!12681 () ValueCell!3398)

(assert (=> b!346910 (= condMapEmpty!12681 (= (arr!8781 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3398)) mapDefault!12681)))))

(declare-fun b!346911 () Bool)

(declare-fun res!192013 () Bool)

(assert (=> b!346911 (=> (not res!192013) (not e!212562))))

(declare-datatypes ((List!5054 0))(
  ( (Nil!5051) (Cons!5050 (h!5906 (_ BitVec 64)) (t!10173 List!5054)) )
))
(declare-fun arrayNoDuplicates!0 (array!18543 (_ BitVec 32) List!5054) Bool)

(assert (=> b!346911 (= res!192013 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5051))))

(declare-fun b!346912 () Bool)

(assert (=> b!346912 (= e!212564 tp_is_empty!7483)))

(assert (= (and start!34710 res!192016) b!346909))

(assert (= (and b!346909 res!192011) b!346906))

(assert (= (and b!346906 res!192012) b!346911))

(assert (= (and b!346911 res!192013) b!346904))

(assert (= (and b!346904 res!192014) b!346905))

(assert (= (and b!346905 res!192010) b!346908))

(assert (= (and b!346908 res!192017) b!346907))

(assert (= (and b!346907 res!192015) b!346902))

(assert (= (and b!346910 condMapEmpty!12681) mapIsEmpty!12681))

(assert (= (and b!346910 (not condMapEmpty!12681)) mapNonEmpty!12681))

(assert (= (and mapNonEmpty!12681 ((_ is ValueCellFull!3398) mapValue!12681)) b!346903))

(assert (= (and b!346910 ((_ is ValueCellFull!3398) mapDefault!12681)) b!346912))

(assert (= start!34710 b!346910))

(declare-fun m!347417 () Bool)

(assert (=> mapNonEmpty!12681 m!347417))

(declare-fun m!347419 () Bool)

(assert (=> b!346911 m!347419))

(declare-fun m!347421 () Bool)

(assert (=> b!346904 m!347421))

(declare-fun m!347423 () Bool)

(assert (=> start!34710 m!347423))

(declare-fun m!347425 () Bool)

(assert (=> start!34710 m!347425))

(declare-fun m!347427 () Bool)

(assert (=> start!34710 m!347427))

(declare-fun m!347429 () Bool)

(assert (=> b!346908 m!347429))

(declare-fun m!347431 () Bool)

(assert (=> b!346908 m!347431))

(declare-fun m!347433 () Bool)

(assert (=> b!346907 m!347433))

(declare-fun m!347435 () Bool)

(assert (=> b!346906 m!347435))

(declare-fun m!347437 () Bool)

(assert (=> b!346902 m!347437))

(declare-fun m!347439 () Bool)

(assert (=> b!346902 m!347439))

(declare-fun m!347441 () Bool)

(assert (=> b!346905 m!347441))

(assert (=> b!346905 m!347441))

(declare-fun m!347443 () Bool)

(assert (=> b!346905 m!347443))

(check-sat (not b!346904) (not b!346905) b_and!14725 (not start!34710) (not mapNonEmpty!12681) tp_is_empty!7483 (not b_next!7531) (not b!346908) (not b!346911) (not b!346907) (not b!346902) (not b!346906))
(check-sat b_and!14725 (not b_next!7531))
