; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34778 () Bool)

(assert start!34778)

(declare-fun b_free!7563 () Bool)

(declare-fun b_next!7563 () Bool)

(assert (=> start!34778 (= b_free!7563 (not b_next!7563))))

(declare-fun tp!26255 () Bool)

(declare-fun b_and!14785 () Bool)

(assert (=> start!34778 (= tp!26255 b_and!14785)))

(declare-fun b!347849 () Bool)

(declare-fun res!192590 () Bool)

(declare-fun e!213139 () Bool)

(assert (=> b!347849 (=> (not res!192590) (not e!213139))))

(declare-datatypes ((array!18619 0))(
  ( (array!18620 (arr!8819 (Array (_ BitVec 32) (_ BitVec 64))) (size!9171 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18619)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18619 (_ BitVec 32)) Bool)

(assert (=> b!347849 (= res!192590 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!347850 () Bool)

(declare-fun e!213141 () Bool)

(assert (=> b!347850 (= e!213141 (not true))))

(declare-datatypes ((V!10997 0))(
  ( (V!10998 (val!3802 Int)) )
))
(declare-datatypes ((tuple2!5498 0))(
  ( (tuple2!5499 (_1!2760 (_ BitVec 64)) (_2!2760 V!10997)) )
))
(declare-datatypes ((List!5122 0))(
  ( (Nil!5119) (Cons!5118 (h!5974 tuple2!5498) (t!10252 List!5122)) )
))
(declare-datatypes ((ListLongMap!4411 0))(
  ( (ListLongMap!4412 (toList!2221 List!5122)) )
))
(declare-fun lt!163726 () ListLongMap!4411)

(declare-datatypes ((SeekEntryResult!3403 0))(
  ( (MissingZero!3403 (index!15791 (_ BitVec 32))) (Found!3403 (index!15792 (_ BitVec 32))) (Intermediate!3403 (undefined!4215 Bool) (index!15793 (_ BitVec 32)) (x!34651 (_ BitVec 32))) (Undefined!3403) (MissingVacant!3403 (index!15794 (_ BitVec 32))) )
))
(declare-fun lt!163729 () SeekEntryResult!3403)

(declare-fun contains!2286 (ListLongMap!4411 (_ BitVec 64)) Bool)

(assert (=> b!347850 (contains!2286 lt!163726 (select (arr!8819 _keys!1895) (index!15792 lt!163729)))))

(declare-datatypes ((Unit!10797 0))(
  ( (Unit!10798) )
))
(declare-fun lt!163728 () Unit!10797)

(declare-fun zeroValue!1467 () V!10997)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3414 0))(
  ( (ValueCellFull!3414 (v!5985 V!10997)) (EmptyCell!3414) )
))
(declare-datatypes ((array!18621 0))(
  ( (array!18622 (arr!8820 (Array (_ BitVec 32) ValueCell!3414)) (size!9172 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18621)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10997)

(declare-fun lemmaValidKeyInArrayIsInListMap!176 (array!18619 array!18621 (_ BitVec 32) (_ BitVec 32) V!10997 V!10997 (_ BitVec 32) Int) Unit!10797)

(assert (=> b!347850 (= lt!163728 (lemmaValidKeyInArrayIsInListMap!176 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!15792 lt!163729) defaultEntry!1528))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!18619 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!347850 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-fun lt!163727 () Unit!10797)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18619 (_ BitVec 64) (_ BitVec 32)) Unit!10797)

(assert (=> b!347850 (= lt!163727 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!15792 lt!163729)))))

(declare-fun res!192591 () Bool)

(assert (=> start!34778 (=> (not res!192591) (not e!213139))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34778 (= res!192591 (validMask!0 mask!2385))))

(assert (=> start!34778 e!213139))

(assert (=> start!34778 true))

(declare-fun tp_is_empty!7515 () Bool)

(assert (=> start!34778 tp_is_empty!7515))

(assert (=> start!34778 tp!26255))

(declare-fun e!213137 () Bool)

(declare-fun array_inv!6530 (array!18621) Bool)

(assert (=> start!34778 (and (array_inv!6530 _values!1525) e!213137)))

(declare-fun array_inv!6531 (array!18619) Bool)

(assert (=> start!34778 (array_inv!6531 _keys!1895)))

(declare-fun b!347851 () Bool)

(declare-fun e!213143 () Bool)

(declare-fun mapRes!12732 () Bool)

(assert (=> b!347851 (= e!213137 (and e!213143 mapRes!12732))))

(declare-fun condMapEmpty!12732 () Bool)

(declare-fun mapDefault!12732 () ValueCell!3414)

(assert (=> b!347851 (= condMapEmpty!12732 (= (arr!8820 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3414)) mapDefault!12732)))))

(declare-fun b!347852 () Bool)

(declare-fun e!213138 () Bool)

(assert (=> b!347852 (= e!213139 e!213138)))

(declare-fun res!192592 () Bool)

(assert (=> b!347852 (=> (not res!192592) (not e!213138))))

(assert (=> b!347852 (= res!192592 (not (contains!2286 lt!163726 k0!1348)))))

(declare-fun getCurrentListMap!1742 (array!18619 array!18621 (_ BitVec 32) (_ BitVec 32) V!10997 V!10997 (_ BitVec 32) Int) ListLongMap!4411)

(assert (=> b!347852 (= lt!163726 (getCurrentListMap!1742 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!347853 () Bool)

(declare-fun res!192586 () Bool)

(assert (=> b!347853 (=> (not res!192586) (not e!213141))))

(assert (=> b!347853 (= res!192586 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15792 lt!163729)))))

(declare-fun mapIsEmpty!12732 () Bool)

(assert (=> mapIsEmpty!12732 mapRes!12732))

(declare-fun b!347854 () Bool)

(declare-fun e!213142 () Bool)

(assert (=> b!347854 (= e!213142 tp_is_empty!7515)))

(declare-fun mapNonEmpty!12732 () Bool)

(declare-fun tp!26256 () Bool)

(assert (=> mapNonEmpty!12732 (= mapRes!12732 (and tp!26256 e!213142))))

(declare-fun mapKey!12732 () (_ BitVec 32))

(declare-fun mapValue!12732 () ValueCell!3414)

(declare-fun mapRest!12732 () (Array (_ BitVec 32) ValueCell!3414))

(assert (=> mapNonEmpty!12732 (= (arr!8820 _values!1525) (store mapRest!12732 mapKey!12732 mapValue!12732))))

(declare-fun b!347855 () Bool)

(declare-fun res!192588 () Bool)

(assert (=> b!347855 (=> (not res!192588) (not e!213139))))

(assert (=> b!347855 (= res!192588 (and (= (size!9172 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9171 _keys!1895) (size!9172 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!347856 () Bool)

(assert (=> b!347856 (= e!213143 tp_is_empty!7515)))

(declare-fun b!347857 () Bool)

(declare-fun res!192587 () Bool)

(assert (=> b!347857 (=> (not res!192587) (not e!213139))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!347857 (= res!192587 (validKeyInArray!0 k0!1348))))

(declare-fun b!347858 () Bool)

(assert (=> b!347858 (= e!213138 e!213141)))

(declare-fun res!192585 () Bool)

(assert (=> b!347858 (=> (not res!192585) (not e!213141))))

(get-info :version)

(assert (=> b!347858 (= res!192585 (and ((_ is Found!3403) lt!163729) (= (select (arr!8819 _keys!1895) (index!15792 lt!163729)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18619 (_ BitVec 32)) SeekEntryResult!3403)

(assert (=> b!347858 (= lt!163729 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!347859 () Bool)

(declare-fun res!192589 () Bool)

(assert (=> b!347859 (=> (not res!192589) (not e!213139))))

(declare-datatypes ((List!5123 0))(
  ( (Nil!5120) (Cons!5119 (h!5975 (_ BitVec 64)) (t!10253 List!5123)) )
))
(declare-fun arrayNoDuplicates!0 (array!18619 (_ BitVec 32) List!5123) Bool)

(assert (=> b!347859 (= res!192589 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5120))))

(assert (= (and start!34778 res!192591) b!347855))

(assert (= (and b!347855 res!192588) b!347849))

(assert (= (and b!347849 res!192590) b!347859))

(assert (= (and b!347859 res!192589) b!347857))

(assert (= (and b!347857 res!192587) b!347852))

(assert (= (and b!347852 res!192592) b!347858))

(assert (= (and b!347858 res!192585) b!347853))

(assert (= (and b!347853 res!192586) b!347850))

(assert (= (and b!347851 condMapEmpty!12732) mapIsEmpty!12732))

(assert (= (and b!347851 (not condMapEmpty!12732)) mapNonEmpty!12732))

(assert (= (and mapNonEmpty!12732 ((_ is ValueCellFull!3414) mapValue!12732)) b!347854))

(assert (= (and b!347851 ((_ is ValueCellFull!3414) mapDefault!12732)) b!347856))

(assert (= start!34778 b!347851))

(declare-fun m!348717 () Bool)

(assert (=> b!347858 m!348717))

(declare-fun m!348719 () Bool)

(assert (=> b!347858 m!348719))

(declare-fun m!348721 () Bool)

(assert (=> b!347850 m!348721))

(declare-fun m!348723 () Bool)

(assert (=> b!347850 m!348723))

(declare-fun m!348725 () Bool)

(assert (=> b!347850 m!348725))

(assert (=> b!347850 m!348717))

(declare-fun m!348727 () Bool)

(assert (=> b!347850 m!348727))

(assert (=> b!347850 m!348717))

(declare-fun m!348729 () Bool)

(assert (=> b!347859 m!348729))

(declare-fun m!348731 () Bool)

(assert (=> b!347849 m!348731))

(declare-fun m!348733 () Bool)

(assert (=> b!347852 m!348733))

(declare-fun m!348735 () Bool)

(assert (=> b!347852 m!348735))

(declare-fun m!348737 () Bool)

(assert (=> b!347857 m!348737))

(declare-fun m!348739 () Bool)

(assert (=> b!347853 m!348739))

(declare-fun m!348741 () Bool)

(assert (=> mapNonEmpty!12732 m!348741))

(declare-fun m!348743 () Bool)

(assert (=> start!34778 m!348743))

(declare-fun m!348745 () Bool)

(assert (=> start!34778 m!348745))

(declare-fun m!348747 () Bool)

(assert (=> start!34778 m!348747))

(check-sat (not b!347853) (not b!347849) (not b!347857) b_and!14785 (not mapNonEmpty!12732) (not b!347852) tp_is_empty!7515 (not b!347859) (not b!347858) (not start!34778) (not b_next!7563) (not b!347850))
(check-sat b_and!14785 (not b_next!7563))
