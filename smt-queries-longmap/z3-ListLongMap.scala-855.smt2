; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20230 () Bool)

(assert start!20230)

(declare-fun b_free!4885 () Bool)

(declare-fun b_next!4885 () Bool)

(assert (=> start!20230 (= b_free!4885 (not b_next!4885))))

(declare-fun tp!17686 () Bool)

(declare-fun b_and!11645 () Bool)

(assert (=> start!20230 (= tp!17686 b_and!11645)))

(declare-fun b!198871 () Bool)

(declare-fun res!94382 () Bool)

(declare-fun e!130643 () Bool)

(assert (=> b!198871 (=> (not res!94382) (not e!130643))))

(declare-datatypes ((array!8713 0))(
  ( (array!8714 (arr!4107 (Array (_ BitVec 32) (_ BitVec 64))) (size!4432 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8713)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!198871 (= res!94382 (= (select (arr!4107 _keys!825) i!601) k0!843))))

(declare-fun b!198872 () Bool)

(declare-fun res!94381 () Bool)

(assert (=> b!198872 (=> (not res!94381) (not e!130643))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!198872 (= res!94381 (validKeyInArray!0 k0!843))))

(declare-fun b!198874 () Bool)

(declare-fun res!94383 () Bool)

(assert (=> b!198874 (=> (not res!94383) (not e!130643))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8713 (_ BitVec 32)) Bool)

(assert (=> b!198874 (= res!94383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!198875 () Bool)

(assert (=> b!198875 (= e!130643 (not true))))

(declare-datatypes ((V!5969 0))(
  ( (V!5970 (val!2415 Int)) )
))
(declare-datatypes ((tuple2!3598 0))(
  ( (tuple2!3599 (_1!1810 (_ BitVec 64)) (_2!1810 V!5969)) )
))
(declare-datatypes ((List!2520 0))(
  ( (Nil!2517) (Cons!2516 (h!3158 tuple2!3598) (t!7443 List!2520)) )
))
(declare-datatypes ((ListLongMap!2513 0))(
  ( (ListLongMap!2514 (toList!1272 List!2520)) )
))
(declare-fun lt!98111 () ListLongMap!2513)

(declare-fun lt!98112 () ListLongMap!2513)

(assert (=> b!198875 (and (= lt!98111 lt!98112) (= lt!98112 lt!98111))))

(declare-fun lt!98114 () ListLongMap!2513)

(declare-fun v!520 () V!5969)

(declare-fun +!326 (ListLongMap!2513 tuple2!3598) ListLongMap!2513)

(assert (=> b!198875 (= lt!98112 (+!326 lt!98114 (tuple2!3599 k0!843 v!520)))))

(declare-datatypes ((Unit!5938 0))(
  ( (Unit!5939) )
))
(declare-fun lt!98113 () Unit!5938)

(declare-datatypes ((ValueCell!2027 0))(
  ( (ValueCellFull!2027 (v!4386 V!5969)) (EmptyCell!2027) )
))
(declare-datatypes ((array!8715 0))(
  ( (array!8716 (arr!4108 (Array (_ BitVec 32) ValueCell!2027)) (size!4433 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8715)

(declare-fun zeroValue!615 () V!5969)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5969)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!5 (array!8713 array!8715 (_ BitVec 32) (_ BitVec 32) V!5969 V!5969 (_ BitVec 32) (_ BitVec 64) V!5969 (_ BitVec 32) Int) Unit!5938)

(assert (=> b!198875 (= lt!98113 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!5 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!262 (array!8713 array!8715 (_ BitVec 32) (_ BitVec 32) V!5969 V!5969 (_ BitVec 32) Int) ListLongMap!2513)

(assert (=> b!198875 (= lt!98111 (getCurrentListMapNoExtraKeys!262 _keys!825 (array!8716 (store (arr!4108 _values!649) i!601 (ValueCellFull!2027 v!520)) (size!4433 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!198875 (= lt!98114 (getCurrentListMapNoExtraKeys!262 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!198876 () Bool)

(declare-fun res!94378 () Bool)

(assert (=> b!198876 (=> (not res!94378) (not e!130643))))

(assert (=> b!198876 (= res!94378 (and (= (size!4433 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4432 _keys!825) (size!4433 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!8180 () Bool)

(declare-fun mapRes!8180 () Bool)

(declare-fun tp!17687 () Bool)

(declare-fun e!130640 () Bool)

(assert (=> mapNonEmpty!8180 (= mapRes!8180 (and tp!17687 e!130640))))

(declare-fun mapRest!8180 () (Array (_ BitVec 32) ValueCell!2027))

(declare-fun mapValue!8180 () ValueCell!2027)

(declare-fun mapKey!8180 () (_ BitVec 32))

(assert (=> mapNonEmpty!8180 (= (arr!4108 _values!649) (store mapRest!8180 mapKey!8180 mapValue!8180))))

(declare-fun b!198877 () Bool)

(declare-fun res!94379 () Bool)

(assert (=> b!198877 (=> (not res!94379) (not e!130643))))

(assert (=> b!198877 (= res!94379 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4432 _keys!825))))))

(declare-fun mapIsEmpty!8180 () Bool)

(assert (=> mapIsEmpty!8180 mapRes!8180))

(declare-fun b!198878 () Bool)

(declare-fun tp_is_empty!4741 () Bool)

(assert (=> b!198878 (= e!130640 tp_is_empty!4741)))

(declare-fun b!198873 () Bool)

(declare-fun e!130641 () Bool)

(assert (=> b!198873 (= e!130641 tp_is_empty!4741)))

(declare-fun res!94384 () Bool)

(assert (=> start!20230 (=> (not res!94384) (not e!130643))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20230 (= res!94384 (validMask!0 mask!1149))))

(assert (=> start!20230 e!130643))

(declare-fun e!130642 () Bool)

(declare-fun array_inv!2679 (array!8715) Bool)

(assert (=> start!20230 (and (array_inv!2679 _values!649) e!130642)))

(assert (=> start!20230 true))

(assert (=> start!20230 tp_is_empty!4741))

(declare-fun array_inv!2680 (array!8713) Bool)

(assert (=> start!20230 (array_inv!2680 _keys!825)))

(assert (=> start!20230 tp!17686))

(declare-fun b!198879 () Bool)

(assert (=> b!198879 (= e!130642 (and e!130641 mapRes!8180))))

(declare-fun condMapEmpty!8180 () Bool)

(declare-fun mapDefault!8180 () ValueCell!2027)

(assert (=> b!198879 (= condMapEmpty!8180 (= (arr!4108 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2027)) mapDefault!8180)))))

(declare-fun b!198880 () Bool)

(declare-fun res!94380 () Bool)

(assert (=> b!198880 (=> (not res!94380) (not e!130643))))

(declare-datatypes ((List!2521 0))(
  ( (Nil!2518) (Cons!2517 (h!3159 (_ BitVec 64)) (t!7444 List!2521)) )
))
(declare-fun arrayNoDuplicates!0 (array!8713 (_ BitVec 32) List!2521) Bool)

(assert (=> b!198880 (= res!94380 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2518))))

(assert (= (and start!20230 res!94384) b!198876))

(assert (= (and b!198876 res!94378) b!198874))

(assert (= (and b!198874 res!94383) b!198880))

(assert (= (and b!198880 res!94380) b!198877))

(assert (= (and b!198877 res!94379) b!198872))

(assert (= (and b!198872 res!94381) b!198871))

(assert (= (and b!198871 res!94382) b!198875))

(assert (= (and b!198879 condMapEmpty!8180) mapIsEmpty!8180))

(assert (= (and b!198879 (not condMapEmpty!8180)) mapNonEmpty!8180))

(get-info :version)

(assert (= (and mapNonEmpty!8180 ((_ is ValueCellFull!2027) mapValue!8180)) b!198878))

(assert (= (and b!198879 ((_ is ValueCellFull!2027) mapDefault!8180)) b!198873))

(assert (= start!20230 b!198879))

(declare-fun m!225549 () Bool)

(assert (=> b!198880 m!225549))

(declare-fun m!225551 () Bool)

(assert (=> mapNonEmpty!8180 m!225551))

(declare-fun m!225553 () Bool)

(assert (=> b!198874 m!225553))

(declare-fun m!225555 () Bool)

(assert (=> start!20230 m!225555))

(declare-fun m!225557 () Bool)

(assert (=> start!20230 m!225557))

(declare-fun m!225559 () Bool)

(assert (=> start!20230 m!225559))

(declare-fun m!225561 () Bool)

(assert (=> b!198872 m!225561))

(declare-fun m!225563 () Bool)

(assert (=> b!198875 m!225563))

(declare-fun m!225565 () Bool)

(assert (=> b!198875 m!225565))

(declare-fun m!225567 () Bool)

(assert (=> b!198875 m!225567))

(declare-fun m!225569 () Bool)

(assert (=> b!198875 m!225569))

(declare-fun m!225571 () Bool)

(assert (=> b!198875 m!225571))

(declare-fun m!225573 () Bool)

(assert (=> b!198871 m!225573))

(check-sat (not mapNonEmpty!8180) tp_is_empty!4741 (not b_next!4885) (not b!198872) (not b!198880) (not b!198875) (not start!20230) b_and!11645 (not b!198874))
(check-sat b_and!11645 (not b_next!4885))
