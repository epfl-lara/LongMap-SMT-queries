; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20356 () Bool)

(assert start!20356)

(declare-fun b_free!5011 () Bool)

(declare-fun b_next!5011 () Bool)

(assert (=> start!20356 (= b_free!5011 (not b_next!5011))))

(declare-fun tp!18065 () Bool)

(declare-fun b_and!11771 () Bool)

(assert (=> start!20356 (= tp!18065 b_and!11771)))

(declare-fun b!200873 () Bool)

(declare-fun e!131690 () Bool)

(declare-fun tp_is_empty!4867 () Bool)

(assert (=> b!200873 (= e!131690 tp_is_empty!4867)))

(declare-fun b!200874 () Bool)

(declare-fun res!95814 () Bool)

(declare-fun e!131692 () Bool)

(assert (=> b!200874 (=> (not res!95814) (not e!131692))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!8959 0))(
  ( (array!8960 (arr!4230 (Array (_ BitVec 32) (_ BitVec 64))) (size!4555 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8959)

(assert (=> b!200874 (= res!95814 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4555 _keys!825))))))

(declare-fun b!200875 () Bool)

(declare-fun e!131687 () Bool)

(assert (=> b!200875 (= e!131687 true)))

(declare-datatypes ((V!6137 0))(
  ( (V!6138 (val!2478 Int)) )
))
(declare-datatypes ((tuple2!3684 0))(
  ( (tuple2!3685 (_1!1853 (_ BitVec 64)) (_2!1853 V!6137)) )
))
(declare-datatypes ((List!2600 0))(
  ( (Nil!2597) (Cons!2596 (h!3238 tuple2!3684) (t!7523 List!2600)) )
))
(declare-datatypes ((ListLongMap!2599 0))(
  ( (ListLongMap!2600 (toList!1315 List!2600)) )
))
(declare-fun lt!99613 () ListLongMap!2599)

(declare-fun lt!99620 () tuple2!3684)

(declare-fun lt!99617 () tuple2!3684)

(declare-fun lt!99618 () ListLongMap!2599)

(declare-fun +!369 (ListLongMap!2599 tuple2!3684) ListLongMap!2599)

(assert (=> b!200875 (= (+!369 lt!99613 lt!99617) (+!369 lt!99618 lt!99620))))

(declare-fun lt!99622 () ListLongMap!2599)

(declare-fun minValue!615 () V!6137)

(declare-datatypes ((Unit!6022 0))(
  ( (Unit!6023) )
))
(declare-fun lt!99621 () Unit!6022)

(declare-fun v!520 () V!6137)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun addCommutativeForDiffKeys!94 (ListLongMap!2599 (_ BitVec 64) V!6137 (_ BitVec 64) V!6137) Unit!6022)

(assert (=> b!200875 (= lt!99621 (addCommutativeForDiffKeys!94 lt!99622 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun mapNonEmpty!8369 () Bool)

(declare-fun mapRes!8369 () Bool)

(declare-fun tp!18064 () Bool)

(declare-fun e!131693 () Bool)

(assert (=> mapNonEmpty!8369 (= mapRes!8369 (and tp!18064 e!131693))))

(declare-fun mapKey!8369 () (_ BitVec 32))

(declare-datatypes ((ValueCell!2090 0))(
  ( (ValueCellFull!2090 (v!4449 V!6137)) (EmptyCell!2090) )
))
(declare-fun mapValue!8369 () ValueCell!2090)

(declare-datatypes ((array!8961 0))(
  ( (array!8962 (arr!4231 (Array (_ BitVec 32) ValueCell!2090)) (size!4556 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8961)

(declare-fun mapRest!8369 () (Array (_ BitVec 32) ValueCell!2090))

(assert (=> mapNonEmpty!8369 (= (arr!4231 _values!649) (store mapRest!8369 mapKey!8369 mapValue!8369))))

(declare-fun b!200876 () Bool)

(declare-fun res!95820 () Bool)

(assert (=> b!200876 (=> (not res!95820) (not e!131692))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!200876 (= res!95820 (and (= (size!4556 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4555 _keys!825) (size!4556 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!200877 () Bool)

(declare-fun res!95815 () Bool)

(assert (=> b!200877 (=> (not res!95815) (not e!131692))))

(declare-datatypes ((List!2601 0))(
  ( (Nil!2598) (Cons!2597 (h!3239 (_ BitVec 64)) (t!7524 List!2601)) )
))
(declare-fun arrayNoDuplicates!0 (array!8959 (_ BitVec 32) List!2601) Bool)

(assert (=> b!200877 (= res!95815 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2598))))

(declare-fun res!95816 () Bool)

(assert (=> start!20356 (=> (not res!95816) (not e!131692))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20356 (= res!95816 (validMask!0 mask!1149))))

(assert (=> start!20356 e!131692))

(declare-fun e!131689 () Bool)

(declare-fun array_inv!2759 (array!8961) Bool)

(assert (=> start!20356 (and (array_inv!2759 _values!649) e!131689)))

(assert (=> start!20356 true))

(assert (=> start!20356 tp_is_empty!4867))

(declare-fun array_inv!2760 (array!8959) Bool)

(assert (=> start!20356 (array_inv!2760 _keys!825)))

(assert (=> start!20356 tp!18065))

(declare-fun mapIsEmpty!8369 () Bool)

(assert (=> mapIsEmpty!8369 mapRes!8369))

(declare-fun b!200878 () Bool)

(assert (=> b!200878 (= e!131689 (and e!131690 mapRes!8369))))

(declare-fun condMapEmpty!8369 () Bool)

(declare-fun mapDefault!8369 () ValueCell!2090)

(assert (=> b!200878 (= condMapEmpty!8369 (= (arr!4231 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2090)) mapDefault!8369)))))

(declare-fun b!200879 () Bool)

(declare-fun e!131691 () Bool)

(assert (=> b!200879 (= e!131691 e!131687)))

(declare-fun res!95821 () Bool)

(assert (=> b!200879 (=> res!95821 e!131687)))

(assert (=> b!200879 (= res!95821 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!99615 () ListLongMap!2599)

(assert (=> b!200879 (= lt!99615 lt!99613)))

(assert (=> b!200879 (= lt!99613 (+!369 lt!99622 lt!99620))))

(declare-fun lt!99616 () Unit!6022)

(declare-fun zeroValue!615 () V!6137)

(declare-fun lt!99612 () ListLongMap!2599)

(assert (=> b!200879 (= lt!99616 (addCommutativeForDiffKeys!94 lt!99612 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!99623 () ListLongMap!2599)

(assert (=> b!200879 (= lt!99623 (+!369 lt!99615 lt!99617))))

(declare-fun lt!99619 () ListLongMap!2599)

(declare-fun lt!99626 () tuple2!3684)

(assert (=> b!200879 (= lt!99615 (+!369 lt!99619 lt!99626))))

(declare-fun lt!99611 () ListLongMap!2599)

(assert (=> b!200879 (= lt!99611 lt!99618)))

(assert (=> b!200879 (= lt!99618 (+!369 lt!99622 lt!99617))))

(assert (=> b!200879 (= lt!99622 (+!369 lt!99612 lt!99626))))

(declare-fun lt!99625 () ListLongMap!2599)

(assert (=> b!200879 (= lt!99623 (+!369 (+!369 lt!99625 lt!99626) lt!99617))))

(assert (=> b!200879 (= lt!99617 (tuple2!3685 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!200879 (= lt!99626 (tuple2!3685 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!200880 () Bool)

(assert (=> b!200880 (= e!131693 tp_is_empty!4867)))

(declare-fun b!200881 () Bool)

(assert (=> b!200881 (= e!131692 (not e!131691))))

(declare-fun res!95817 () Bool)

(assert (=> b!200881 (=> res!95817 e!131691)))

(assert (=> b!200881 (= res!95817 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!909 (array!8959 array!8961 (_ BitVec 32) (_ BitVec 32) V!6137 V!6137 (_ BitVec 32) Int) ListLongMap!2599)

(assert (=> b!200881 (= lt!99611 (getCurrentListMap!909 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99614 () array!8961)

(assert (=> b!200881 (= lt!99623 (getCurrentListMap!909 _keys!825 lt!99614 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200881 (and (= lt!99625 lt!99619) (= lt!99619 lt!99625))))

(assert (=> b!200881 (= lt!99619 (+!369 lt!99612 lt!99620))))

(assert (=> b!200881 (= lt!99620 (tuple2!3685 k0!843 v!520))))

(declare-fun lt!99624 () Unit!6022)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!45 (array!8959 array!8961 (_ BitVec 32) (_ BitVec 32) V!6137 V!6137 (_ BitVec 32) (_ BitVec 64) V!6137 (_ BitVec 32) Int) Unit!6022)

(assert (=> b!200881 (= lt!99624 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!45 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!302 (array!8959 array!8961 (_ BitVec 32) (_ BitVec 32) V!6137 V!6137 (_ BitVec 32) Int) ListLongMap!2599)

(assert (=> b!200881 (= lt!99625 (getCurrentListMapNoExtraKeys!302 _keys!825 lt!99614 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200881 (= lt!99614 (array!8962 (store (arr!4231 _values!649) i!601 (ValueCellFull!2090 v!520)) (size!4556 _values!649)))))

(assert (=> b!200881 (= lt!99612 (getCurrentListMapNoExtraKeys!302 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!200882 () Bool)

(declare-fun res!95813 () Bool)

(assert (=> b!200882 (=> (not res!95813) (not e!131692))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8959 (_ BitVec 32)) Bool)

(assert (=> b!200882 (= res!95813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!200883 () Bool)

(declare-fun res!95818 () Bool)

(assert (=> b!200883 (=> (not res!95818) (not e!131692))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!200883 (= res!95818 (validKeyInArray!0 k0!843))))

(declare-fun b!200884 () Bool)

(declare-fun res!95819 () Bool)

(assert (=> b!200884 (=> (not res!95819) (not e!131692))))

(assert (=> b!200884 (= res!95819 (= (select (arr!4230 _keys!825) i!601) k0!843))))

(assert (= (and start!20356 res!95816) b!200876))

(assert (= (and b!200876 res!95820) b!200882))

(assert (= (and b!200882 res!95813) b!200877))

(assert (= (and b!200877 res!95815) b!200874))

(assert (= (and b!200874 res!95814) b!200883))

(assert (= (and b!200883 res!95818) b!200884))

(assert (= (and b!200884 res!95819) b!200881))

(assert (= (and b!200881 (not res!95817)) b!200879))

(assert (= (and b!200879 (not res!95821)) b!200875))

(assert (= (and b!200878 condMapEmpty!8369) mapIsEmpty!8369))

(assert (= (and b!200878 (not condMapEmpty!8369)) mapNonEmpty!8369))

(get-info :version)

(assert (= (and mapNonEmpty!8369 ((_ is ValueCellFull!2090) mapValue!8369)) b!200880))

(assert (= (and b!200878 ((_ is ValueCellFull!2090) mapDefault!8369)) b!200873))

(assert (= start!20356 b!200878))

(declare-fun m!227661 () Bool)

(assert (=> b!200879 m!227661))

(declare-fun m!227663 () Bool)

(assert (=> b!200879 m!227663))

(declare-fun m!227665 () Bool)

(assert (=> b!200879 m!227665))

(declare-fun m!227667 () Bool)

(assert (=> b!200879 m!227667))

(declare-fun m!227669 () Bool)

(assert (=> b!200879 m!227669))

(declare-fun m!227671 () Bool)

(assert (=> b!200879 m!227671))

(declare-fun m!227673 () Bool)

(assert (=> b!200879 m!227673))

(assert (=> b!200879 m!227665))

(declare-fun m!227675 () Bool)

(assert (=> b!200879 m!227675))

(declare-fun m!227677 () Bool)

(assert (=> b!200883 m!227677))

(declare-fun m!227679 () Bool)

(assert (=> b!200881 m!227679))

(declare-fun m!227681 () Bool)

(assert (=> b!200881 m!227681))

(declare-fun m!227683 () Bool)

(assert (=> b!200881 m!227683))

(declare-fun m!227685 () Bool)

(assert (=> b!200881 m!227685))

(declare-fun m!227687 () Bool)

(assert (=> b!200881 m!227687))

(declare-fun m!227689 () Bool)

(assert (=> b!200881 m!227689))

(declare-fun m!227691 () Bool)

(assert (=> b!200881 m!227691))

(declare-fun m!227693 () Bool)

(assert (=> b!200884 m!227693))

(declare-fun m!227695 () Bool)

(assert (=> b!200875 m!227695))

(declare-fun m!227697 () Bool)

(assert (=> b!200875 m!227697))

(declare-fun m!227699 () Bool)

(assert (=> b!200875 m!227699))

(declare-fun m!227701 () Bool)

(assert (=> b!200877 m!227701))

(declare-fun m!227703 () Bool)

(assert (=> b!200882 m!227703))

(declare-fun m!227705 () Bool)

(assert (=> start!20356 m!227705))

(declare-fun m!227707 () Bool)

(assert (=> start!20356 m!227707))

(declare-fun m!227709 () Bool)

(assert (=> start!20356 m!227709))

(declare-fun m!227711 () Bool)

(assert (=> mapNonEmpty!8369 m!227711))

(check-sat (not b!200881) (not start!20356) (not b!200879) (not b!200882) tp_is_empty!4867 (not mapNonEmpty!8369) (not b!200883) (not b!200877) (not b_next!5011) b_and!11771 (not b!200875))
(check-sat b_and!11771 (not b_next!5011))
