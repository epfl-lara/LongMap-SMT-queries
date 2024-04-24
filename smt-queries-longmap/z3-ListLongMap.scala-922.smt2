; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20632 () Bool)

(assert start!20632)

(declare-fun b_free!5287 () Bool)

(declare-fun b_next!5287 () Bool)

(assert (=> start!20632 (= b_free!5287 (not b_next!5287))))

(declare-fun tp!18893 () Bool)

(declare-fun b_and!12047 () Bool)

(assert (=> start!20632 (= tp!18893 b_and!12047)))

(declare-fun mapNonEmpty!8783 () Bool)

(declare-fun mapRes!8783 () Bool)

(declare-fun tp!18892 () Bool)

(declare-fun e!134585 () Bool)

(assert (=> mapNonEmpty!8783 (= mapRes!8783 (and tp!18892 e!134585))))

(declare-datatypes ((V!6505 0))(
  ( (V!6506 (val!2616 Int)) )
))
(declare-datatypes ((ValueCell!2228 0))(
  ( (ValueCellFull!2228 (v!4587 V!6505)) (EmptyCell!2228) )
))
(declare-datatypes ((array!9493 0))(
  ( (array!9494 (arr!4497 (Array (_ BitVec 32) ValueCell!2228)) (size!4822 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9493)

(declare-fun mapValue!8783 () ValueCell!2228)

(declare-fun mapRest!8783 () (Array (_ BitVec 32) ValueCell!2228))

(declare-fun mapKey!8783 () (_ BitVec 32))

(assert (=> mapNonEmpty!8783 (= (arr!4497 _values!649) (store mapRest!8783 mapKey!8783 mapValue!8783))))

(declare-fun b!205859 () Bool)

(declare-fun res!99565 () Bool)

(declare-fun e!134588 () Bool)

(assert (=> b!205859 (=> (not res!99565) (not e!134588))))

(declare-datatypes ((array!9495 0))(
  ( (array!9496 (arr!4498 (Array (_ BitVec 32) (_ BitVec 64))) (size!4823 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9495)

(declare-datatypes ((List!2809 0))(
  ( (Nil!2806) (Cons!2805 (h!3447 (_ BitVec 64)) (t!7732 List!2809)) )
))
(declare-fun arrayNoDuplicates!0 (array!9495 (_ BitVec 32) List!2809) Bool)

(assert (=> b!205859 (= res!99565 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2806))))

(declare-fun b!205860 () Bool)

(declare-fun e!134586 () Bool)

(declare-fun e!134587 () Bool)

(assert (=> b!205860 (= e!134586 e!134587)))

(declare-fun res!99562 () Bool)

(assert (=> b!205860 (=> res!99562 e!134587)))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!205860 (= res!99562 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3918 0))(
  ( (tuple2!3919 (_1!1970 (_ BitVec 64)) (_2!1970 V!6505)) )
))
(declare-datatypes ((List!2810 0))(
  ( (Nil!2807) (Cons!2806 (h!3448 tuple2!3918) (t!7733 List!2810)) )
))
(declare-datatypes ((ListLongMap!2833 0))(
  ( (ListLongMap!2834 (toList!1432 List!2810)) )
))
(declare-fun lt!105003 () ListLongMap!2833)

(declare-fun lt!105008 () ListLongMap!2833)

(assert (=> b!205860 (= lt!105003 lt!105008)))

(declare-fun lt!105013 () ListLongMap!2833)

(declare-fun lt!105007 () tuple2!3918)

(declare-fun +!486 (ListLongMap!2833 tuple2!3918) ListLongMap!2833)

(assert (=> b!205860 (= lt!105008 (+!486 lt!105013 lt!105007))))

(declare-fun lt!105010 () ListLongMap!2833)

(declare-fun lt!105011 () ListLongMap!2833)

(assert (=> b!205860 (= lt!105010 lt!105011)))

(declare-fun lt!105004 () ListLongMap!2833)

(assert (=> b!205860 (= lt!105011 (+!486 lt!105004 lt!105007))))

(declare-fun lt!105005 () ListLongMap!2833)

(assert (=> b!205860 (= lt!105010 (+!486 lt!105005 lt!105007))))

(declare-fun minValue!615 () V!6505)

(assert (=> b!205860 (= lt!105007 (tuple2!3919 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205861 () Bool)

(declare-fun e!134591 () Bool)

(declare-fun tp_is_empty!5143 () Bool)

(assert (=> b!205861 (= e!134591 tp_is_empty!5143)))

(declare-fun b!205862 () Bool)

(declare-fun res!99561 () Bool)

(assert (=> b!205862 (=> (not res!99561) (not e!134588))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!205862 (= res!99561 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4823 _keys!825))))))

(declare-fun mapIsEmpty!8783 () Bool)

(assert (=> mapIsEmpty!8783 mapRes!8783))

(declare-fun b!205863 () Bool)

(declare-fun res!99560 () Bool)

(assert (=> b!205863 (=> (not res!99560) (not e!134588))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!205863 (= res!99560 (validKeyInArray!0 k0!843))))

(declare-fun b!205864 () Bool)

(declare-fun res!99563 () Bool)

(assert (=> b!205864 (=> (not res!99563) (not e!134588))))

(assert (=> b!205864 (= res!99563 (= (select (arr!4498 _keys!825) i!601) k0!843))))

(declare-fun b!205865 () Bool)

(declare-fun e!134589 () Bool)

(assert (=> b!205865 (= e!134589 (and e!134591 mapRes!8783))))

(declare-fun condMapEmpty!8783 () Bool)

(declare-fun mapDefault!8783 () ValueCell!2228)

(assert (=> b!205865 (= condMapEmpty!8783 (= (arr!4497 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2228)) mapDefault!8783)))))

(declare-fun res!99557 () Bool)

(assert (=> start!20632 (=> (not res!99557) (not e!134588))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20632 (= res!99557 (validMask!0 mask!1149))))

(assert (=> start!20632 e!134588))

(declare-fun array_inv!2945 (array!9493) Bool)

(assert (=> start!20632 (and (array_inv!2945 _values!649) e!134589)))

(assert (=> start!20632 true))

(assert (=> start!20632 tp_is_empty!5143))

(declare-fun array_inv!2946 (array!9495) Bool)

(assert (=> start!20632 (array_inv!2946 _keys!825)))

(assert (=> start!20632 tp!18893))

(declare-fun b!205866 () Bool)

(declare-fun res!99564 () Bool)

(assert (=> b!205866 (=> (not res!99564) (not e!134588))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!205866 (= res!99564 (and (= (size!4822 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4823 _keys!825) (size!4822 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!205867 () Bool)

(assert (=> b!205867 (= e!134585 tp_is_empty!5143)))

(declare-fun b!205868 () Bool)

(declare-fun res!99559 () Bool)

(assert (=> b!205868 (=> (not res!99559) (not e!134588))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9495 (_ BitVec 32)) Bool)

(assert (=> b!205868 (= res!99559 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!205869 () Bool)

(assert (=> b!205869 (= e!134588 (not e!134586))))

(declare-fun res!99558 () Bool)

(assert (=> b!205869 (=> res!99558 e!134586)))

(assert (=> b!205869 (= res!99558 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!615 () V!6505)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!1005 (array!9495 array!9493 (_ BitVec 32) (_ BitVec 32) V!6505 V!6505 (_ BitVec 32) Int) ListLongMap!2833)

(assert (=> b!205869 (= lt!105003 (getCurrentListMap!1005 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105014 () array!9493)

(assert (=> b!205869 (= lt!105010 (getCurrentListMap!1005 _keys!825 lt!105014 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205869 (and (= lt!105005 lt!105004) (= lt!105004 lt!105005))))

(declare-fun lt!105009 () tuple2!3918)

(assert (=> b!205869 (= lt!105004 (+!486 lt!105013 lt!105009))))

(declare-fun v!520 () V!6505)

(assert (=> b!205869 (= lt!105009 (tuple2!3919 k0!843 v!520))))

(declare-datatypes ((Unit!6250 0))(
  ( (Unit!6251) )
))
(declare-fun lt!105012 () Unit!6250)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!141 (array!9495 array!9493 (_ BitVec 32) (_ BitVec 32) V!6505 V!6505 (_ BitVec 32) (_ BitVec 64) V!6505 (_ BitVec 32) Int) Unit!6250)

(assert (=> b!205869 (= lt!105012 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!141 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!398 (array!9495 array!9493 (_ BitVec 32) (_ BitVec 32) V!6505 V!6505 (_ BitVec 32) Int) ListLongMap!2833)

(assert (=> b!205869 (= lt!105005 (getCurrentListMapNoExtraKeys!398 _keys!825 lt!105014 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205869 (= lt!105014 (array!9494 (store (arr!4497 _values!649) i!601 (ValueCellFull!2228 v!520)) (size!4822 _values!649)))))

(assert (=> b!205869 (= lt!105013 (getCurrentListMapNoExtraKeys!398 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!205870 () Bool)

(assert (=> b!205870 (= e!134587 true)))

(assert (=> b!205870 (= lt!105011 (+!486 lt!105008 lt!105009))))

(declare-fun lt!105006 () Unit!6250)

(declare-fun addCommutativeForDiffKeys!190 (ListLongMap!2833 (_ BitVec 64) V!6505 (_ BitVec 64) V!6505) Unit!6250)

(assert (=> b!205870 (= lt!105006 (addCommutativeForDiffKeys!190 lt!105013 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (= (and start!20632 res!99557) b!205866))

(assert (= (and b!205866 res!99564) b!205868))

(assert (= (and b!205868 res!99559) b!205859))

(assert (= (and b!205859 res!99565) b!205862))

(assert (= (and b!205862 res!99561) b!205863))

(assert (= (and b!205863 res!99560) b!205864))

(assert (= (and b!205864 res!99563) b!205869))

(assert (= (and b!205869 (not res!99558)) b!205860))

(assert (= (and b!205860 (not res!99562)) b!205870))

(assert (= (and b!205865 condMapEmpty!8783) mapIsEmpty!8783))

(assert (= (and b!205865 (not condMapEmpty!8783)) mapNonEmpty!8783))

(get-info :version)

(assert (= (and mapNonEmpty!8783 ((_ is ValueCellFull!2228) mapValue!8783)) b!205867))

(assert (= (and b!205865 ((_ is ValueCellFull!2228) mapDefault!8783)) b!205861))

(assert (= start!20632 b!205865))

(declare-fun m!233661 () Bool)

(assert (=> b!205863 m!233661))

(declare-fun m!233663 () Bool)

(assert (=> b!205869 m!233663))

(declare-fun m!233665 () Bool)

(assert (=> b!205869 m!233665))

(declare-fun m!233667 () Bool)

(assert (=> b!205869 m!233667))

(declare-fun m!233669 () Bool)

(assert (=> b!205869 m!233669))

(declare-fun m!233671 () Bool)

(assert (=> b!205869 m!233671))

(declare-fun m!233673 () Bool)

(assert (=> b!205869 m!233673))

(declare-fun m!233675 () Bool)

(assert (=> b!205869 m!233675))

(declare-fun m!233677 () Bool)

(assert (=> b!205868 m!233677))

(declare-fun m!233679 () Bool)

(assert (=> b!205860 m!233679))

(declare-fun m!233681 () Bool)

(assert (=> b!205860 m!233681))

(declare-fun m!233683 () Bool)

(assert (=> b!205860 m!233683))

(declare-fun m!233685 () Bool)

(assert (=> mapNonEmpty!8783 m!233685))

(declare-fun m!233687 () Bool)

(assert (=> start!20632 m!233687))

(declare-fun m!233689 () Bool)

(assert (=> start!20632 m!233689))

(declare-fun m!233691 () Bool)

(assert (=> start!20632 m!233691))

(declare-fun m!233693 () Bool)

(assert (=> b!205859 m!233693))

(declare-fun m!233695 () Bool)

(assert (=> b!205870 m!233695))

(declare-fun m!233697 () Bool)

(assert (=> b!205870 m!233697))

(declare-fun m!233699 () Bool)

(assert (=> b!205864 m!233699))

(check-sat (not b!205869) (not mapNonEmpty!8783) (not b!205860) (not start!20632) b_and!12047 (not b!205868) (not b_next!5287) (not b!205863) (not b!205859) tp_is_empty!5143 (not b!205870))
(check-sat b_and!12047 (not b_next!5287))
