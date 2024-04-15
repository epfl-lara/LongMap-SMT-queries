; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37728 () Bool)

(assert start!37728)

(declare-fun b_free!8845 () Bool)

(declare-fun b_next!8845 () Bool)

(assert (=> start!37728 (= b_free!8845 (not b_next!8845))))

(declare-fun tp!31286 () Bool)

(declare-fun b_and!16061 () Bool)

(assert (=> start!37728 (= tp!31286 b_and!16061)))

(declare-fun res!221054 () Bool)

(declare-fun e!234602 () Bool)

(assert (=> start!37728 (=> (not res!221054) (not e!234602))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37728 (= res!221054 (validMask!0 mask!970))))

(assert (=> start!37728 e!234602))

(declare-datatypes ((V!13795 0))(
  ( (V!13796 (val!4803 Int)) )
))
(declare-datatypes ((ValueCell!4415 0))(
  ( (ValueCellFull!4415 (v!6994 V!13795)) (EmptyCell!4415) )
))
(declare-datatypes ((array!22917 0))(
  ( (array!22918 (arr!10927 (Array (_ BitVec 32) ValueCell!4415)) (size!11280 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22917)

(declare-fun e!234598 () Bool)

(declare-fun array_inv!8040 (array!22917) Bool)

(assert (=> start!37728 (and (array_inv!8040 _values!506) e!234598)))

(assert (=> start!37728 tp!31286))

(assert (=> start!37728 true))

(declare-fun tp_is_empty!9517 () Bool)

(assert (=> start!37728 tp_is_empty!9517))

(declare-datatypes ((array!22919 0))(
  ( (array!22920 (arr!10928 (Array (_ BitVec 32) (_ BitVec 64))) (size!11281 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22919)

(declare-fun array_inv!8041 (array!22919) Bool)

(assert (=> start!37728 (array_inv!8041 _keys!658)))

(declare-fun b!386911 () Bool)

(declare-fun res!221051 () Bool)

(assert (=> b!386911 (=> (not res!221051) (not e!234602))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22919 (_ BitVec 32)) Bool)

(assert (=> b!386911 (= res!221051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!386912 () Bool)

(declare-fun res!221053 () Bool)

(assert (=> b!386912 (=> (not res!221053) (not e!234602))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!386912 (= res!221053 (validKeyInArray!0 k0!778))))

(declare-fun b!386913 () Bool)

(declare-fun res!221057 () Bool)

(assert (=> b!386913 (=> (not res!221057) (not e!234602))))

(declare-datatypes ((List!6274 0))(
  ( (Nil!6271) (Cons!6270 (h!7126 (_ BitVec 64)) (t!11415 List!6274)) )
))
(declare-fun arrayNoDuplicates!0 (array!22919 (_ BitVec 32) List!6274) Bool)

(assert (=> b!386913 (= res!221057 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6271))))

(declare-fun b!386914 () Bool)

(declare-fun res!221056 () Bool)

(assert (=> b!386914 (=> (not res!221056) (not e!234602))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!386914 (= res!221056 (and (= (size!11280 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11281 _keys!658) (size!11280 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!386915 () Bool)

(declare-fun e!234601 () Bool)

(assert (=> b!386915 (= e!234601 tp_is_empty!9517)))

(declare-fun b!386916 () Bool)

(declare-fun res!221052 () Bool)

(assert (=> b!386916 (=> (not res!221052) (not e!234602))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!386916 (= res!221052 (or (= (select (arr!10928 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10928 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!386917 () Bool)

(declare-fun res!221055 () Bool)

(assert (=> b!386917 (=> (not res!221055) (not e!234602))))

(assert (=> b!386917 (= res!221055 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11281 _keys!658))))))

(declare-fun b!386918 () Bool)

(declare-fun mapRes!15840 () Bool)

(assert (=> b!386918 (= e!234598 (and e!234601 mapRes!15840))))

(declare-fun condMapEmpty!15840 () Bool)

(declare-fun mapDefault!15840 () ValueCell!4415)

(assert (=> b!386918 (= condMapEmpty!15840 (= (arr!10927 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4415)) mapDefault!15840)))))

(declare-fun mapIsEmpty!15840 () Bool)

(assert (=> mapIsEmpty!15840 mapRes!15840))

(declare-fun b!386919 () Bool)

(declare-fun e!234600 () Bool)

(assert (=> b!386919 (= e!234602 e!234600)))

(declare-fun res!221048 () Bool)

(assert (=> b!386919 (=> (not res!221048) (not e!234600))))

(declare-fun lt!181744 () array!22919)

(assert (=> b!386919 (= res!221048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181744 mask!970))))

(assert (=> b!386919 (= lt!181744 (array!22920 (store (arr!10928 _keys!658) i!548 k0!778) (size!11281 _keys!658)))))

(declare-fun b!386920 () Bool)

(declare-fun res!221050 () Bool)

(assert (=> b!386920 (=> (not res!221050) (not e!234600))))

(assert (=> b!386920 (= res!221050 (arrayNoDuplicates!0 lt!181744 #b00000000000000000000000000000000 Nil!6271))))

(declare-fun b!386921 () Bool)

(assert (=> b!386921 (= e!234600 false)))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6438 0))(
  ( (tuple2!6439 (_1!3230 (_ BitVec 64)) (_2!3230 V!13795)) )
))
(declare-datatypes ((List!6275 0))(
  ( (Nil!6272) (Cons!6271 (h!7127 tuple2!6438) (t!11416 List!6275)) )
))
(declare-datatypes ((ListLongMap!5341 0))(
  ( (ListLongMap!5342 (toList!2686 List!6275)) )
))
(declare-fun lt!181745 () ListLongMap!5341)

(declare-fun zeroValue!472 () V!13795)

(declare-fun v!373 () V!13795)

(declare-fun minValue!472 () V!13795)

(declare-fun getCurrentListMapNoExtraKeys!926 (array!22919 array!22917 (_ BitVec 32) (_ BitVec 32) V!13795 V!13795 (_ BitVec 32) Int) ListLongMap!5341)

(assert (=> b!386921 (= lt!181745 (getCurrentListMapNoExtraKeys!926 lt!181744 (array!22918 (store (arr!10927 _values!506) i!548 (ValueCellFull!4415 v!373)) (size!11280 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181746 () ListLongMap!5341)

(assert (=> b!386921 (= lt!181746 (getCurrentListMapNoExtraKeys!926 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!386922 () Bool)

(declare-fun res!221049 () Bool)

(assert (=> b!386922 (=> (not res!221049) (not e!234602))))

(declare-fun arrayContainsKey!0 (array!22919 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!386922 (= res!221049 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!386923 () Bool)

(declare-fun e!234599 () Bool)

(assert (=> b!386923 (= e!234599 tp_is_empty!9517)))

(declare-fun mapNonEmpty!15840 () Bool)

(declare-fun tp!31287 () Bool)

(assert (=> mapNonEmpty!15840 (= mapRes!15840 (and tp!31287 e!234599))))

(declare-fun mapRest!15840 () (Array (_ BitVec 32) ValueCell!4415))

(declare-fun mapKey!15840 () (_ BitVec 32))

(declare-fun mapValue!15840 () ValueCell!4415)

(assert (=> mapNonEmpty!15840 (= (arr!10927 _values!506) (store mapRest!15840 mapKey!15840 mapValue!15840))))

(assert (= (and start!37728 res!221054) b!386914))

(assert (= (and b!386914 res!221056) b!386911))

(assert (= (and b!386911 res!221051) b!386913))

(assert (= (and b!386913 res!221057) b!386917))

(assert (= (and b!386917 res!221055) b!386912))

(assert (= (and b!386912 res!221053) b!386916))

(assert (= (and b!386916 res!221052) b!386922))

(assert (= (and b!386922 res!221049) b!386919))

(assert (= (and b!386919 res!221048) b!386920))

(assert (= (and b!386920 res!221050) b!386921))

(assert (= (and b!386918 condMapEmpty!15840) mapIsEmpty!15840))

(assert (= (and b!386918 (not condMapEmpty!15840)) mapNonEmpty!15840))

(get-info :version)

(assert (= (and mapNonEmpty!15840 ((_ is ValueCellFull!4415) mapValue!15840)) b!386923))

(assert (= (and b!386918 ((_ is ValueCellFull!4415) mapDefault!15840)) b!386915))

(assert (= start!37728 b!386918))

(declare-fun m!382631 () Bool)

(assert (=> b!386921 m!382631))

(declare-fun m!382633 () Bool)

(assert (=> b!386921 m!382633))

(declare-fun m!382635 () Bool)

(assert (=> b!386921 m!382635))

(declare-fun m!382637 () Bool)

(assert (=> mapNonEmpty!15840 m!382637))

(declare-fun m!382639 () Bool)

(assert (=> b!386919 m!382639))

(declare-fun m!382641 () Bool)

(assert (=> b!386919 m!382641))

(declare-fun m!382643 () Bool)

(assert (=> b!386911 m!382643))

(declare-fun m!382645 () Bool)

(assert (=> b!386922 m!382645))

(declare-fun m!382647 () Bool)

(assert (=> start!37728 m!382647))

(declare-fun m!382649 () Bool)

(assert (=> start!37728 m!382649))

(declare-fun m!382651 () Bool)

(assert (=> start!37728 m!382651))

(declare-fun m!382653 () Bool)

(assert (=> b!386916 m!382653))

(declare-fun m!382655 () Bool)

(assert (=> b!386920 m!382655))

(declare-fun m!382657 () Bool)

(assert (=> b!386913 m!382657))

(declare-fun m!382659 () Bool)

(assert (=> b!386912 m!382659))

(check-sat (not start!37728) (not b!386912) (not mapNonEmpty!15840) (not b!386921) (not b_next!8845) (not b!386911) (not b!386919) (not b!386920) (not b!386922) (not b!386913) b_and!16061 tp_is_empty!9517)
(check-sat b_and!16061 (not b_next!8845))
