; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36796 () Bool)

(assert start!36796)

(declare-fun mapIsEmpty!14421 () Bool)

(declare-fun mapRes!14421 () Bool)

(assert (=> mapIsEmpty!14421 mapRes!14421))

(declare-fun b!367542 () Bool)

(declare-fun e!224917 () Bool)

(declare-fun e!224920 () Bool)

(assert (=> b!367542 (= e!224917 e!224920)))

(declare-fun res!205797 () Bool)

(assert (=> b!367542 (=> (not res!205797) (not e!224920))))

(declare-datatypes ((array!21101 0))(
  ( (array!21102 (arr!10019 (Array (_ BitVec 32) (_ BitVec 64))) (size!10371 (_ BitVec 32))) )
))
(declare-fun lt!169400 () array!21101)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21101 (_ BitVec 32)) Bool)

(assert (=> b!367542 (= res!205797 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169400 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!21101)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!367542 (= lt!169400 (array!21102 (store (arr!10019 _keys!658) i!548 k0!778) (size!10371 _keys!658)))))

(declare-fun b!367543 () Bool)

(assert (=> b!367543 (= e!224920 false)))

(declare-fun lt!169401 () Bool)

(declare-datatypes ((List!5569 0))(
  ( (Nil!5566) (Cons!5565 (h!6421 (_ BitVec 64)) (t!10719 List!5569)) )
))
(declare-fun arrayNoDuplicates!0 (array!21101 (_ BitVec 32) List!5569) Bool)

(assert (=> b!367543 (= lt!169401 (arrayNoDuplicates!0 lt!169400 #b00000000000000000000000000000000 Nil!5566))))

(declare-fun res!205800 () Bool)

(assert (=> start!36796 (=> (not res!205800) (not e!224917))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36796 (= res!205800 (validMask!0 mask!970))))

(assert (=> start!36796 e!224917))

(assert (=> start!36796 true))

(declare-datatypes ((V!12533 0))(
  ( (V!12534 (val!4330 Int)) )
))
(declare-datatypes ((ValueCell!3942 0))(
  ( (ValueCellFull!3942 (v!6527 V!12533)) (EmptyCell!3942) )
))
(declare-datatypes ((array!21103 0))(
  ( (array!21104 (arr!10020 (Array (_ BitVec 32) ValueCell!3942)) (size!10372 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21103)

(declare-fun e!224921 () Bool)

(declare-fun array_inv!7408 (array!21103) Bool)

(assert (=> start!36796 (and (array_inv!7408 _values!506) e!224921)))

(declare-fun array_inv!7409 (array!21101) Bool)

(assert (=> start!36796 (array_inv!7409 _keys!658)))

(declare-fun b!367544 () Bool)

(declare-fun e!224919 () Bool)

(assert (=> b!367544 (= e!224921 (and e!224919 mapRes!14421))))

(declare-fun condMapEmpty!14421 () Bool)

(declare-fun mapDefault!14421 () ValueCell!3942)

(assert (=> b!367544 (= condMapEmpty!14421 (= (arr!10020 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3942)) mapDefault!14421)))))

(declare-fun b!367545 () Bool)

(declare-fun res!205798 () Bool)

(assert (=> b!367545 (=> (not res!205798) (not e!224917))))

(assert (=> b!367545 (= res!205798 (or (= (select (arr!10019 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10019 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!367546 () Bool)

(declare-fun res!205802 () Bool)

(assert (=> b!367546 (=> (not res!205802) (not e!224917))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!367546 (= res!205802 (validKeyInArray!0 k0!778))))

(declare-fun b!367547 () Bool)

(declare-fun res!205799 () Bool)

(assert (=> b!367547 (=> (not res!205799) (not e!224917))))

(declare-fun arrayContainsKey!0 (array!21101 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!367547 (= res!205799 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!14421 () Bool)

(declare-fun tp!28497 () Bool)

(declare-fun e!224916 () Bool)

(assert (=> mapNonEmpty!14421 (= mapRes!14421 (and tp!28497 e!224916))))

(declare-fun mapValue!14421 () ValueCell!3942)

(declare-fun mapRest!14421 () (Array (_ BitVec 32) ValueCell!3942))

(declare-fun mapKey!14421 () (_ BitVec 32))

(assert (=> mapNonEmpty!14421 (= (arr!10020 _values!506) (store mapRest!14421 mapKey!14421 mapValue!14421))))

(declare-fun b!367548 () Bool)

(declare-fun res!205794 () Bool)

(assert (=> b!367548 (=> (not res!205794) (not e!224917))))

(assert (=> b!367548 (= res!205794 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5566))))

(declare-fun b!367549 () Bool)

(declare-fun res!205796 () Bool)

(assert (=> b!367549 (=> (not res!205796) (not e!224917))))

(assert (=> b!367549 (= res!205796 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10371 _keys!658))))))

(declare-fun b!367550 () Bool)

(declare-fun res!205801 () Bool)

(assert (=> b!367550 (=> (not res!205801) (not e!224917))))

(assert (=> b!367550 (= res!205801 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!367551 () Bool)

(declare-fun tp_is_empty!8571 () Bool)

(assert (=> b!367551 (= e!224919 tp_is_empty!8571)))

(declare-fun b!367552 () Bool)

(assert (=> b!367552 (= e!224916 tp_is_empty!8571)))

(declare-fun b!367553 () Bool)

(declare-fun res!205795 () Bool)

(assert (=> b!367553 (=> (not res!205795) (not e!224917))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!367553 (= res!205795 (and (= (size!10372 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10371 _keys!658) (size!10372 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(assert (= (and start!36796 res!205800) b!367553))

(assert (= (and b!367553 res!205795) b!367550))

(assert (= (and b!367550 res!205801) b!367548))

(assert (= (and b!367548 res!205794) b!367549))

(assert (= (and b!367549 res!205796) b!367546))

(assert (= (and b!367546 res!205802) b!367545))

(assert (= (and b!367545 res!205798) b!367547))

(assert (= (and b!367547 res!205799) b!367542))

(assert (= (and b!367542 res!205797) b!367543))

(assert (= (and b!367544 condMapEmpty!14421) mapIsEmpty!14421))

(assert (= (and b!367544 (not condMapEmpty!14421)) mapNonEmpty!14421))

(get-info :version)

(assert (= (and mapNonEmpty!14421 ((_ is ValueCellFull!3942) mapValue!14421)) b!367552))

(assert (= (and b!367544 ((_ is ValueCellFull!3942) mapDefault!14421)) b!367551))

(assert (= start!36796 b!367544))

(declare-fun m!364491 () Bool)

(assert (=> b!367547 m!364491))

(declare-fun m!364493 () Bool)

(assert (=> b!367545 m!364493))

(declare-fun m!364495 () Bool)

(assert (=> b!367548 m!364495))

(declare-fun m!364497 () Bool)

(assert (=> b!367543 m!364497))

(declare-fun m!364499 () Bool)

(assert (=> mapNonEmpty!14421 m!364499))

(declare-fun m!364501 () Bool)

(assert (=> start!36796 m!364501))

(declare-fun m!364503 () Bool)

(assert (=> start!36796 m!364503))

(declare-fun m!364505 () Bool)

(assert (=> start!36796 m!364505))

(declare-fun m!364507 () Bool)

(assert (=> b!367542 m!364507))

(declare-fun m!364509 () Bool)

(assert (=> b!367542 m!364509))

(declare-fun m!364511 () Bool)

(assert (=> b!367546 m!364511))

(declare-fun m!364513 () Bool)

(assert (=> b!367550 m!364513))

(check-sat (not b!367547) (not b!367548) (not b!367543) (not b!367542) (not b!367550) (not mapNonEmpty!14421) (not start!36796) tp_is_empty!8571 (not b!367546))
(check-sat)
