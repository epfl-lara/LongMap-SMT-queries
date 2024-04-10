; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20396 () Bool)

(assert start!20396)

(declare-fun b_free!5055 () Bool)

(declare-fun b_next!5055 () Bool)

(assert (=> start!20396 (= b_free!5055 (not b_next!5055))))

(declare-fun tp!18197 () Bool)

(declare-fun b_and!11801 () Bool)

(assert (=> start!20396 (= tp!18197 b_and!11801)))

(declare-fun b!201618 () Bool)

(declare-fun e!132128 () Bool)

(assert (=> b!201618 (= e!132128 true)))

(declare-datatypes ((V!6195 0))(
  ( (V!6196 (val!2500 Int)) )
))
(declare-datatypes ((tuple2!3786 0))(
  ( (tuple2!3787 (_1!1904 (_ BitVec 64)) (_2!1904 V!6195)) )
))
(declare-datatypes ((List!2698 0))(
  ( (Nil!2695) (Cons!2694 (h!3336 tuple2!3786) (t!7629 List!2698)) )
))
(declare-datatypes ((ListLongMap!2699 0))(
  ( (ListLongMap!2700 (toList!1365 List!2698)) )
))
(declare-fun lt!100610 () ListLongMap!2699)

(declare-fun lt!100616 () ListLongMap!2699)

(declare-fun lt!100620 () tuple2!3786)

(declare-fun lt!100608 () tuple2!3786)

(declare-fun +!392 (ListLongMap!2699 tuple2!3786) ListLongMap!2699)

(assert (=> b!201618 (= (+!392 lt!100610 lt!100620) (+!392 lt!100616 lt!100608))))

(declare-fun minValue!615 () V!6195)

(declare-fun v!520 () V!6195)

(declare-fun k0!843 () (_ BitVec 64))

(declare-datatypes ((Unit!6084 0))(
  ( (Unit!6085) )
))
(declare-fun lt!100609 () Unit!6084)

(declare-fun lt!100619 () ListLongMap!2699)

(declare-fun addCommutativeForDiffKeys!113 (ListLongMap!2699 (_ BitVec 64) V!6195 (_ BitVec 64) V!6195) Unit!6084)

(assert (=> b!201618 (= lt!100609 (addCommutativeForDiffKeys!113 lt!100619 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!201619 () Bool)

(declare-fun res!96393 () Bool)

(declare-fun e!132130 () Bool)

(assert (=> b!201619 (=> (not res!96393) (not e!132130))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!201619 (= res!96393 (validKeyInArray!0 k0!843))))

(declare-fun b!201620 () Bool)

(declare-fun e!132129 () Bool)

(assert (=> b!201620 (= e!132130 (not e!132129))))

(declare-fun res!96387 () Bool)

(assert (=> b!201620 (=> res!96387 e!132129)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!201620 (= res!96387 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((ValueCell!2112 0))(
  ( (ValueCellFull!2112 (v!4470 V!6195)) (EmptyCell!2112) )
))
(declare-datatypes ((array!9051 0))(
  ( (array!9052 (arr!4276 (Array (_ BitVec 32) ValueCell!2112)) (size!4601 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9051)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6195)

(declare-fun lt!100623 () ListLongMap!2699)

(declare-datatypes ((array!9053 0))(
  ( (array!9054 (arr!4277 (Array (_ BitVec 32) (_ BitVec 64))) (size!4602 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9053)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!953 (array!9053 array!9051 (_ BitVec 32) (_ BitVec 32) V!6195 V!6195 (_ BitVec 32) Int) ListLongMap!2699)

(assert (=> b!201620 (= lt!100623 (getCurrentListMap!953 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!100621 () ListLongMap!2699)

(declare-fun lt!100615 () array!9051)

(assert (=> b!201620 (= lt!100621 (getCurrentListMap!953 _keys!825 lt!100615 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!100612 () ListLongMap!2699)

(declare-fun lt!100613 () ListLongMap!2699)

(assert (=> b!201620 (and (= lt!100612 lt!100613) (= lt!100613 lt!100612))))

(declare-fun lt!100617 () ListLongMap!2699)

(assert (=> b!201620 (= lt!100613 (+!392 lt!100617 lt!100608))))

(assert (=> b!201620 (= lt!100608 (tuple2!3787 k0!843 v!520))))

(declare-fun lt!100611 () Unit!6084)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!66 (array!9053 array!9051 (_ BitVec 32) (_ BitVec 32) V!6195 V!6195 (_ BitVec 32) (_ BitVec 64) V!6195 (_ BitVec 32) Int) Unit!6084)

(assert (=> b!201620 (= lt!100611 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!66 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!327 (array!9053 array!9051 (_ BitVec 32) (_ BitVec 32) V!6195 V!6195 (_ BitVec 32) Int) ListLongMap!2699)

(assert (=> b!201620 (= lt!100612 (getCurrentListMapNoExtraKeys!327 _keys!825 lt!100615 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201620 (= lt!100615 (array!9052 (store (arr!4276 _values!649) i!601 (ValueCellFull!2112 v!520)) (size!4601 _values!649)))))

(assert (=> b!201620 (= lt!100617 (getCurrentListMapNoExtraKeys!327 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!201621 () Bool)

(declare-fun res!96391 () Bool)

(assert (=> b!201621 (=> (not res!96391) (not e!132130))))

(declare-datatypes ((List!2699 0))(
  ( (Nil!2696) (Cons!2695 (h!3337 (_ BitVec 64)) (t!7630 List!2699)) )
))
(declare-fun arrayNoDuplicates!0 (array!9053 (_ BitVec 32) List!2699) Bool)

(assert (=> b!201621 (= res!96391 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2696))))

(declare-fun b!201622 () Bool)

(declare-fun res!96392 () Bool)

(assert (=> b!201622 (=> (not res!96392) (not e!132130))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9053 (_ BitVec 32)) Bool)

(assert (=> b!201622 (= res!96392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!201623 () Bool)

(declare-fun e!132126 () Bool)

(declare-fun tp_is_empty!4911 () Bool)

(assert (=> b!201623 (= e!132126 tp_is_empty!4911)))

(declare-fun b!201624 () Bool)

(assert (=> b!201624 (= e!132129 e!132128)))

(declare-fun res!96394 () Bool)

(assert (=> b!201624 (=> res!96394 e!132128)))

(assert (=> b!201624 (= res!96394 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!100614 () ListLongMap!2699)

(assert (=> b!201624 (= lt!100614 lt!100610)))

(assert (=> b!201624 (= lt!100610 (+!392 lt!100619 lt!100608))))

(declare-fun lt!100618 () Unit!6084)

(assert (=> b!201624 (= lt!100618 (addCommutativeForDiffKeys!113 lt!100617 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(assert (=> b!201624 (= lt!100621 (+!392 lt!100614 lt!100620))))

(declare-fun lt!100622 () tuple2!3786)

(assert (=> b!201624 (= lt!100614 (+!392 lt!100613 lt!100622))))

(assert (=> b!201624 (= lt!100623 lt!100616)))

(assert (=> b!201624 (= lt!100616 (+!392 lt!100619 lt!100620))))

(assert (=> b!201624 (= lt!100619 (+!392 lt!100617 lt!100622))))

(assert (=> b!201624 (= lt!100621 (+!392 (+!392 lt!100612 lt!100622) lt!100620))))

(assert (=> b!201624 (= lt!100620 (tuple2!3787 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!201624 (= lt!100622 (tuple2!3787 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun mapNonEmpty!8435 () Bool)

(declare-fun mapRes!8435 () Bool)

(declare-fun tp!18196 () Bool)

(declare-fun e!132125 () Bool)

(assert (=> mapNonEmpty!8435 (= mapRes!8435 (and tp!18196 e!132125))))

(declare-fun mapKey!8435 () (_ BitVec 32))

(declare-fun mapValue!8435 () ValueCell!2112)

(declare-fun mapRest!8435 () (Array (_ BitVec 32) ValueCell!2112))

(assert (=> mapNonEmpty!8435 (= (arr!4276 _values!649) (store mapRest!8435 mapKey!8435 mapValue!8435))))

(declare-fun b!201625 () Bool)

(declare-fun res!96390 () Bool)

(assert (=> b!201625 (=> (not res!96390) (not e!132130))))

(assert (=> b!201625 (= res!96390 (and (= (size!4601 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4602 _keys!825) (size!4601 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!201626 () Bool)

(assert (=> b!201626 (= e!132125 tp_is_empty!4911)))

(declare-fun res!96388 () Bool)

(assert (=> start!20396 (=> (not res!96388) (not e!132130))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20396 (= res!96388 (validMask!0 mask!1149))))

(assert (=> start!20396 e!132130))

(declare-fun e!132127 () Bool)

(declare-fun array_inv!2823 (array!9051) Bool)

(assert (=> start!20396 (and (array_inv!2823 _values!649) e!132127)))

(assert (=> start!20396 true))

(assert (=> start!20396 tp_is_empty!4911))

(declare-fun array_inv!2824 (array!9053) Bool)

(assert (=> start!20396 (array_inv!2824 _keys!825)))

(assert (=> start!20396 tp!18197))

(declare-fun b!201627 () Bool)

(declare-fun res!96389 () Bool)

(assert (=> b!201627 (=> (not res!96389) (not e!132130))))

(assert (=> b!201627 (= res!96389 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4602 _keys!825))))))

(declare-fun b!201628 () Bool)

(declare-fun res!96386 () Bool)

(assert (=> b!201628 (=> (not res!96386) (not e!132130))))

(assert (=> b!201628 (= res!96386 (= (select (arr!4277 _keys!825) i!601) k0!843))))

(declare-fun mapIsEmpty!8435 () Bool)

(assert (=> mapIsEmpty!8435 mapRes!8435))

(declare-fun b!201629 () Bool)

(assert (=> b!201629 (= e!132127 (and e!132126 mapRes!8435))))

(declare-fun condMapEmpty!8435 () Bool)

(declare-fun mapDefault!8435 () ValueCell!2112)

(assert (=> b!201629 (= condMapEmpty!8435 (= (arr!4276 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2112)) mapDefault!8435)))))

(assert (= (and start!20396 res!96388) b!201625))

(assert (= (and b!201625 res!96390) b!201622))

(assert (= (and b!201622 res!96392) b!201621))

(assert (= (and b!201621 res!96391) b!201627))

(assert (= (and b!201627 res!96389) b!201619))

(assert (= (and b!201619 res!96393) b!201628))

(assert (= (and b!201628 res!96386) b!201620))

(assert (= (and b!201620 (not res!96387)) b!201624))

(assert (= (and b!201624 (not res!96394)) b!201618))

(assert (= (and b!201629 condMapEmpty!8435) mapIsEmpty!8435))

(assert (= (and b!201629 (not condMapEmpty!8435)) mapNonEmpty!8435))

(get-info :version)

(assert (= (and mapNonEmpty!8435 ((_ is ValueCellFull!2112) mapValue!8435)) b!201626))

(assert (= (and b!201629 ((_ is ValueCellFull!2112) mapDefault!8435)) b!201623))

(assert (= start!20396 b!201629))

(declare-fun m!228623 () Bool)

(assert (=> b!201619 m!228623))

(declare-fun m!228625 () Bool)

(assert (=> start!20396 m!228625))

(declare-fun m!228627 () Bool)

(assert (=> start!20396 m!228627))

(declare-fun m!228629 () Bool)

(assert (=> start!20396 m!228629))

(declare-fun m!228631 () Bool)

(assert (=> b!201620 m!228631))

(declare-fun m!228633 () Bool)

(assert (=> b!201620 m!228633))

(declare-fun m!228635 () Bool)

(assert (=> b!201620 m!228635))

(declare-fun m!228637 () Bool)

(assert (=> b!201620 m!228637))

(declare-fun m!228639 () Bool)

(assert (=> b!201620 m!228639))

(declare-fun m!228641 () Bool)

(assert (=> b!201620 m!228641))

(declare-fun m!228643 () Bool)

(assert (=> b!201620 m!228643))

(declare-fun m!228645 () Bool)

(assert (=> b!201618 m!228645))

(declare-fun m!228647 () Bool)

(assert (=> b!201618 m!228647))

(declare-fun m!228649 () Bool)

(assert (=> b!201618 m!228649))

(declare-fun m!228651 () Bool)

(assert (=> b!201622 m!228651))

(declare-fun m!228653 () Bool)

(assert (=> mapNonEmpty!8435 m!228653))

(declare-fun m!228655 () Bool)

(assert (=> b!201624 m!228655))

(declare-fun m!228657 () Bool)

(assert (=> b!201624 m!228657))

(declare-fun m!228659 () Bool)

(assert (=> b!201624 m!228659))

(declare-fun m!228661 () Bool)

(assert (=> b!201624 m!228661))

(declare-fun m!228663 () Bool)

(assert (=> b!201624 m!228663))

(declare-fun m!228665 () Bool)

(assert (=> b!201624 m!228665))

(assert (=> b!201624 m!228665))

(declare-fun m!228667 () Bool)

(assert (=> b!201624 m!228667))

(declare-fun m!228669 () Bool)

(assert (=> b!201624 m!228669))

(declare-fun m!228671 () Bool)

(assert (=> b!201621 m!228671))

(declare-fun m!228673 () Bool)

(assert (=> b!201628 m!228673))

(check-sat (not b!201624) (not b!201622) (not b!201619) (not mapNonEmpty!8435) (not b!201620) tp_is_empty!4911 b_and!11801 (not b!201618) (not b!201621) (not start!20396) (not b_next!5055))
(check-sat b_and!11801 (not b_next!5055))
