; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35018 () Bool)

(assert start!35018)

(declare-fun b_free!7707 () Bool)

(declare-fun b_next!7707 () Bool)

(assert (=> start!35018 (= b_free!7707 (not b_next!7707))))

(declare-fun tp!26699 () Bool)

(declare-fun b_and!14937 () Bool)

(assert (=> start!35018 (= tp!26699 b_and!14937)))

(declare-fun b!350909 () Bool)

(declare-fun e!214921 () Bool)

(declare-fun e!214918 () Bool)

(declare-fun mapRes!12960 () Bool)

(assert (=> b!350909 (= e!214921 (and e!214918 mapRes!12960))))

(declare-fun condMapEmpty!12960 () Bool)

(declare-datatypes ((V!11189 0))(
  ( (V!11190 (val!3874 Int)) )
))
(declare-datatypes ((ValueCell!3486 0))(
  ( (ValueCellFull!3486 (v!6061 V!11189)) (EmptyCell!3486) )
))
(declare-datatypes ((array!18905 0))(
  ( (array!18906 (arr!8958 (Array (_ BitVec 32) ValueCell!3486)) (size!9310 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18905)

(declare-fun mapDefault!12960 () ValueCell!3486)

(assert (=> b!350909 (= condMapEmpty!12960 (= (arr!8958 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3486)) mapDefault!12960)))))

(declare-fun b!350910 () Bool)

(declare-fun res!194537 () Bool)

(declare-fun e!214919 () Bool)

(assert (=> b!350910 (=> (not res!194537) (not e!214919))))

(declare-datatypes ((array!18907 0))(
  ( (array!18908 (arr!8959 (Array (_ BitVec 32) (_ BitVec 64))) (size!9311 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18907)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!18907 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!350910 (= res!194537 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun res!194538 () Bool)

(declare-fun e!214920 () Bool)

(assert (=> start!35018 (=> (not res!194538) (not e!214920))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35018 (= res!194538 (validMask!0 mask!2385))))

(assert (=> start!35018 e!214920))

(assert (=> start!35018 true))

(declare-fun tp_is_empty!7659 () Bool)

(assert (=> start!35018 tp_is_empty!7659))

(assert (=> start!35018 tp!26699))

(declare-fun array_inv!6612 (array!18905) Bool)

(assert (=> start!35018 (and (array_inv!6612 _values!1525) e!214921)))

(declare-fun array_inv!6613 (array!18907) Bool)

(assert (=> start!35018 (array_inv!6613 _keys!1895)))

(declare-fun b!350911 () Bool)

(declare-fun res!194539 () Bool)

(assert (=> b!350911 (=> (not res!194539) (not e!214920))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!350911 (= res!194539 (and (= (size!9310 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9311 _keys!1895) (size!9310 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!350912 () Bool)

(assert (=> b!350912 (= e!214920 e!214919)))

(declare-fun res!194544 () Bool)

(assert (=> b!350912 (=> (not res!194544) (not e!214919))))

(declare-datatypes ((SeekEntryResult!3447 0))(
  ( (MissingZero!3447 (index!15967 (_ BitVec 32))) (Found!3447 (index!15968 (_ BitVec 32))) (Intermediate!3447 (undefined!4259 Bool) (index!15969 (_ BitVec 32)) (x!34927 (_ BitVec 32))) (Undefined!3447) (MissingVacant!3447 (index!15970 (_ BitVec 32))) )
))
(declare-fun lt!164667 () SeekEntryResult!3447)

(get-info :version)

(assert (=> b!350912 (= res!194544 (and (not ((_ is Found!3447) lt!164667)) (not ((_ is MissingZero!3447) lt!164667)) ((_ is MissingVacant!3447) lt!164667)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18907 (_ BitVec 32)) SeekEntryResult!3447)

(assert (=> b!350912 (= lt!164667 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!350913 () Bool)

(declare-fun res!194540 () Bool)

(assert (=> b!350913 (=> (not res!194540) (not e!214920))))

(declare-datatypes ((List!5212 0))(
  ( (Nil!5209) (Cons!5208 (h!6064 (_ BitVec 64)) (t!10350 List!5212)) )
))
(declare-fun arrayNoDuplicates!0 (array!18907 (_ BitVec 32) List!5212) Bool)

(assert (=> b!350913 (= res!194540 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5209))))

(declare-fun mapNonEmpty!12960 () Bool)

(declare-fun tp!26700 () Bool)

(declare-fun e!214916 () Bool)

(assert (=> mapNonEmpty!12960 (= mapRes!12960 (and tp!26700 e!214916))))

(declare-fun mapValue!12960 () ValueCell!3486)

(declare-fun mapKey!12960 () (_ BitVec 32))

(declare-fun mapRest!12960 () (Array (_ BitVec 32) ValueCell!3486))

(assert (=> mapNonEmpty!12960 (= (arr!8958 _values!1525) (store mapRest!12960 mapKey!12960 mapValue!12960))))

(declare-fun mapIsEmpty!12960 () Bool)

(assert (=> mapIsEmpty!12960 mapRes!12960))

(declare-fun b!350914 () Bool)

(declare-fun res!194542 () Bool)

(assert (=> b!350914 (=> (not res!194542) (not e!214920))))

(declare-fun zeroValue!1467 () V!11189)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11189)

(declare-datatypes ((tuple2!5592 0))(
  ( (tuple2!5593 (_1!2807 (_ BitVec 64)) (_2!2807 V!11189)) )
))
(declare-datatypes ((List!5213 0))(
  ( (Nil!5210) (Cons!5209 (h!6065 tuple2!5592) (t!10351 List!5213)) )
))
(declare-datatypes ((ListLongMap!4505 0))(
  ( (ListLongMap!4506 (toList!2268 List!5213)) )
))
(declare-fun contains!2337 (ListLongMap!4505 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1789 (array!18907 array!18905 (_ BitVec 32) (_ BitVec 32) V!11189 V!11189 (_ BitVec 32) Int) ListLongMap!4505)

(assert (=> b!350914 (= res!194542 (not (contains!2337 (getCurrentListMap!1789 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!350915 () Bool)

(assert (=> b!350915 (= e!214916 tp_is_empty!7659)))

(declare-fun b!350916 () Bool)

(assert (=> b!350916 (= e!214919 false)))

(declare-fun lt!164668 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18907 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!350916 (= lt!164668 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!350917 () Bool)

(assert (=> b!350917 (= e!214918 tp_is_empty!7659)))

(declare-fun b!350918 () Bool)

(declare-fun res!194543 () Bool)

(assert (=> b!350918 (=> (not res!194543) (not e!214920))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18907 (_ BitVec 32)) Bool)

(assert (=> b!350918 (= res!194543 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!350919 () Bool)

(declare-fun res!194541 () Bool)

(assert (=> b!350919 (=> (not res!194541) (not e!214920))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!350919 (= res!194541 (validKeyInArray!0 k0!1348))))

(assert (= (and start!35018 res!194538) b!350911))

(assert (= (and b!350911 res!194539) b!350918))

(assert (= (and b!350918 res!194543) b!350913))

(assert (= (and b!350913 res!194540) b!350919))

(assert (= (and b!350919 res!194541) b!350914))

(assert (= (and b!350914 res!194542) b!350912))

(assert (= (and b!350912 res!194544) b!350910))

(assert (= (and b!350910 res!194537) b!350916))

(assert (= (and b!350909 condMapEmpty!12960) mapIsEmpty!12960))

(assert (= (and b!350909 (not condMapEmpty!12960)) mapNonEmpty!12960))

(assert (= (and mapNonEmpty!12960 ((_ is ValueCellFull!3486) mapValue!12960)) b!350915))

(assert (= (and b!350909 ((_ is ValueCellFull!3486) mapDefault!12960)) b!350917))

(assert (= start!35018 b!350909))

(declare-fun m!350977 () Bool)

(assert (=> b!350912 m!350977))

(declare-fun m!350979 () Bool)

(assert (=> b!350916 m!350979))

(declare-fun m!350981 () Bool)

(assert (=> start!35018 m!350981))

(declare-fun m!350983 () Bool)

(assert (=> start!35018 m!350983))

(declare-fun m!350985 () Bool)

(assert (=> start!35018 m!350985))

(declare-fun m!350987 () Bool)

(assert (=> b!350918 m!350987))

(declare-fun m!350989 () Bool)

(assert (=> b!350919 m!350989))

(declare-fun m!350991 () Bool)

(assert (=> b!350910 m!350991))

(declare-fun m!350993 () Bool)

(assert (=> mapNonEmpty!12960 m!350993))

(declare-fun m!350995 () Bool)

(assert (=> b!350913 m!350995))

(declare-fun m!350997 () Bool)

(assert (=> b!350914 m!350997))

(assert (=> b!350914 m!350997))

(declare-fun m!350999 () Bool)

(assert (=> b!350914 m!350999))

(check-sat (not b!350918) (not b!350912) b_and!14937 tp_is_empty!7659 (not b!350914) (not start!35018) (not b!350919) (not b!350913) (not b!350916) (not mapNonEmpty!12960) (not b!350910) (not b_next!7707))
(check-sat b_and!14937 (not b_next!7707))
