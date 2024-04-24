; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36852 () Bool)

(assert start!36852)

(declare-fun b_free!7993 () Bool)

(declare-fun b_next!7993 () Bool)

(assert (=> start!36852 (= b_free!7993 (not b_next!7993))))

(declare-fun tp!28695 () Bool)

(declare-fun b_and!15249 () Bool)

(assert (=> start!36852 (= tp!28695 b_and!15249)))

(declare-fun b!368854 () Bool)

(declare-fun e!225516 () Bool)

(declare-fun e!225517 () Bool)

(declare-fun mapRes!14526 () Bool)

(assert (=> b!368854 (= e!225516 (and e!225517 mapRes!14526))))

(declare-fun condMapEmpty!14526 () Bool)

(declare-datatypes ((V!12627 0))(
  ( (V!12628 (val!4365 Int)) )
))
(declare-datatypes ((ValueCell!3977 0))(
  ( (ValueCellFull!3977 (v!6563 V!12627)) (EmptyCell!3977) )
))
(declare-datatypes ((array!21216 0))(
  ( (array!21217 (arr!10076 (Array (_ BitVec 32) ValueCell!3977)) (size!10428 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21216)

(declare-fun mapDefault!14526 () ValueCell!3977)

(assert (=> b!368854 (= condMapEmpty!14526 (= (arr!10076 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3977)) mapDefault!14526)))))

(declare-fun b!368855 () Bool)

(declare-fun res!206845 () Bool)

(declare-fun e!225518 () Bool)

(assert (=> b!368855 (=> (not res!206845) (not e!225518))))

(declare-datatypes ((array!21218 0))(
  ( (array!21219 (arr!10077 (Array (_ BitVec 32) (_ BitVec 64))) (size!10429 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21218)

(declare-datatypes ((List!5523 0))(
  ( (Nil!5520) (Cons!5519 (h!6375 (_ BitVec 64)) (t!10665 List!5523)) )
))
(declare-fun arrayNoDuplicates!0 (array!21218 (_ BitVec 32) List!5523) Bool)

(assert (=> b!368855 (= res!206845 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5520))))

(declare-fun b!368856 () Bool)

(declare-fun res!206840 () Bool)

(assert (=> b!368856 (=> (not res!206840) (not e!225518))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21218 (_ BitVec 32)) Bool)

(assert (=> b!368856 (= res!206840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!368857 () Bool)

(declare-fun tp_is_empty!8641 () Bool)

(assert (=> b!368857 (= e!225517 tp_is_empty!8641)))

(declare-fun b!368858 () Bool)

(declare-fun e!225519 () Bool)

(assert (=> b!368858 (= e!225518 e!225519)))

(declare-fun res!206842 () Bool)

(assert (=> b!368858 (=> (not res!206842) (not e!225519))))

(declare-fun lt!169632 () array!21218)

(assert (=> b!368858 (= res!206842 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169632 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!368858 (= lt!169632 (array!21219 (store (arr!10077 _keys!658) i!548 k0!778) (size!10429 _keys!658)))))

(declare-fun b!368859 () Bool)

(declare-fun res!206846 () Bool)

(assert (=> b!368859 (=> (not res!206846) (not e!225518))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!368859 (= res!206846 (and (= (size!10428 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10429 _keys!658) (size!10428 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!368860 () Bool)

(declare-fun res!206838 () Bool)

(assert (=> b!368860 (=> (not res!206838) (not e!225518))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!368860 (= res!206838 (validKeyInArray!0 k0!778))))

(declare-fun mapNonEmpty!14526 () Bool)

(declare-fun tp!28694 () Bool)

(declare-fun e!225514 () Bool)

(assert (=> mapNonEmpty!14526 (= mapRes!14526 (and tp!28694 e!225514))))

(declare-fun mapRest!14526 () (Array (_ BitVec 32) ValueCell!3977))

(declare-fun mapKey!14526 () (_ BitVec 32))

(declare-fun mapValue!14526 () ValueCell!3977)

(assert (=> mapNonEmpty!14526 (= (arr!10076 _values!506) (store mapRest!14526 mapKey!14526 mapValue!14526))))

(declare-fun res!206839 () Bool)

(assert (=> start!36852 (=> (not res!206839) (not e!225518))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36852 (= res!206839 (validMask!0 mask!970))))

(assert (=> start!36852 e!225518))

(declare-fun array_inv!7478 (array!21216) Bool)

(assert (=> start!36852 (and (array_inv!7478 _values!506) e!225516)))

(assert (=> start!36852 tp!28695))

(assert (=> start!36852 true))

(assert (=> start!36852 tp_is_empty!8641))

(declare-fun array_inv!7479 (array!21218) Bool)

(assert (=> start!36852 (array_inv!7479 _keys!658)))

(declare-fun mapIsEmpty!14526 () Bool)

(assert (=> mapIsEmpty!14526 mapRes!14526))

(declare-fun b!368861 () Bool)

(assert (=> b!368861 (= e!225514 tp_is_empty!8641)))

(declare-fun b!368862 () Bool)

(declare-fun res!206844 () Bool)

(assert (=> b!368862 (=> (not res!206844) (not e!225518))))

(declare-fun arrayContainsKey!0 (array!21218 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!368862 (= res!206844 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!368863 () Bool)

(declare-fun res!206837 () Bool)

(assert (=> b!368863 (=> (not res!206837) (not e!225519))))

(assert (=> b!368863 (= res!206837 (arrayNoDuplicates!0 lt!169632 #b00000000000000000000000000000000 Nil!5520))))

(declare-fun b!368864 () Bool)

(declare-fun res!206841 () Bool)

(assert (=> b!368864 (=> (not res!206841) (not e!225518))))

(assert (=> b!368864 (= res!206841 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10429 _keys!658))))))

(declare-fun b!368865 () Bool)

(assert (=> b!368865 (= e!225519 false)))

(declare-datatypes ((tuple2!5698 0))(
  ( (tuple2!5699 (_1!2860 (_ BitVec 64)) (_2!2860 V!12627)) )
))
(declare-datatypes ((List!5524 0))(
  ( (Nil!5521) (Cons!5520 (h!6376 tuple2!5698) (t!10666 List!5524)) )
))
(declare-datatypes ((ListLongMap!4613 0))(
  ( (ListLongMap!4614 (toList!2322 List!5524)) )
))
(declare-fun lt!169633 () ListLongMap!4613)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12627)

(declare-fun v!373 () V!12627)

(declare-fun minValue!472 () V!12627)

(declare-fun getCurrentListMapNoExtraKeys!631 (array!21218 array!21216 (_ BitVec 32) (_ BitVec 32) V!12627 V!12627 (_ BitVec 32) Int) ListLongMap!4613)

(assert (=> b!368865 (= lt!169633 (getCurrentListMapNoExtraKeys!631 lt!169632 (array!21217 (store (arr!10076 _values!506) i!548 (ValueCellFull!3977 v!373)) (size!10428 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169631 () ListLongMap!4613)

(assert (=> b!368865 (= lt!169631 (getCurrentListMapNoExtraKeys!631 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!368866 () Bool)

(declare-fun res!206843 () Bool)

(assert (=> b!368866 (=> (not res!206843) (not e!225518))))

(assert (=> b!368866 (= res!206843 (or (= (select (arr!10077 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10077 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!36852 res!206839) b!368859))

(assert (= (and b!368859 res!206846) b!368856))

(assert (= (and b!368856 res!206840) b!368855))

(assert (= (and b!368855 res!206845) b!368864))

(assert (= (and b!368864 res!206841) b!368860))

(assert (= (and b!368860 res!206838) b!368866))

(assert (= (and b!368866 res!206843) b!368862))

(assert (= (and b!368862 res!206844) b!368858))

(assert (= (and b!368858 res!206842) b!368863))

(assert (= (and b!368863 res!206837) b!368865))

(assert (= (and b!368854 condMapEmpty!14526) mapIsEmpty!14526))

(assert (= (and b!368854 (not condMapEmpty!14526)) mapNonEmpty!14526))

(get-info :version)

(assert (= (and mapNonEmpty!14526 ((_ is ValueCellFull!3977) mapValue!14526)) b!368861))

(assert (= (and b!368854 ((_ is ValueCellFull!3977) mapDefault!14526)) b!368857))

(assert (= start!36852 b!368854))

(declare-fun m!365633 () Bool)

(assert (=> mapNonEmpty!14526 m!365633))

(declare-fun m!365635 () Bool)

(assert (=> b!368865 m!365635))

(declare-fun m!365637 () Bool)

(assert (=> b!368865 m!365637))

(declare-fun m!365639 () Bool)

(assert (=> b!368865 m!365639))

(declare-fun m!365641 () Bool)

(assert (=> b!368862 m!365641))

(declare-fun m!365643 () Bool)

(assert (=> b!368863 m!365643))

(declare-fun m!365645 () Bool)

(assert (=> b!368858 m!365645))

(declare-fun m!365647 () Bool)

(assert (=> b!368858 m!365647))

(declare-fun m!365649 () Bool)

(assert (=> start!36852 m!365649))

(declare-fun m!365651 () Bool)

(assert (=> start!36852 m!365651))

(declare-fun m!365653 () Bool)

(assert (=> start!36852 m!365653))

(declare-fun m!365655 () Bool)

(assert (=> b!368860 m!365655))

(declare-fun m!365657 () Bool)

(assert (=> b!368856 m!365657))

(declare-fun m!365659 () Bool)

(assert (=> b!368866 m!365659))

(declare-fun m!365661 () Bool)

(assert (=> b!368855 m!365661))

(check-sat b_and!15249 (not b!368862) (not b_next!7993) (not b!368858) (not b!368856) (not b!368855) (not start!36852) (not b!368865) (not b!368863) (not b!368860) (not mapNonEmpty!14526) tp_is_empty!8641)
(check-sat b_and!15249 (not b_next!7993))
