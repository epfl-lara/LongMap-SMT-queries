; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70618 () Bool)

(assert start!70618)

(declare-fun b_free!12925 () Bool)

(declare-fun b_next!12925 () Bool)

(assert (=> start!70618 (= b_free!12925 (not b_next!12925))))

(declare-fun tp!45514 () Bool)

(declare-fun b_and!21753 () Bool)

(assert (=> start!70618 (= tp!45514 b_and!21753)))

(declare-fun b!820347 () Bool)

(declare-fun e!455763 () Bool)

(declare-fun tp_is_empty!14635 () Bool)

(assert (=> b!820347 (= e!455763 tp_is_empty!14635)))

(declare-fun mapIsEmpty!23557 () Bool)

(declare-fun mapRes!23557 () Bool)

(assert (=> mapIsEmpty!23557 mapRes!23557))

(declare-fun mapNonEmpty!23557 () Bool)

(declare-fun tp!45513 () Bool)

(declare-fun e!455764 () Bool)

(assert (=> mapNonEmpty!23557 (= mapRes!23557 (and tp!45513 e!455764))))

(declare-datatypes ((V!24515 0))(
  ( (V!24516 (val!7365 Int)) )
))
(declare-datatypes ((ValueCell!6902 0))(
  ( (ValueCellFull!6902 (v!9790 V!24515)) (EmptyCell!6902) )
))
(declare-fun mapRest!23557 () (Array (_ BitVec 32) ValueCell!6902))

(declare-datatypes ((array!45441 0))(
  ( (array!45442 (arr!21773 (Array (_ BitVec 32) ValueCell!6902)) (size!22194 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45441)

(declare-fun mapKey!23557 () (_ BitVec 32))

(declare-fun mapValue!23557 () ValueCell!6902)

(assert (=> mapNonEmpty!23557 (= (arr!21773 _values!788) (store mapRest!23557 mapKey!23557 mapValue!23557))))

(declare-fun b!820348 () Bool)

(declare-fun res!559769 () Bool)

(declare-fun e!455765 () Bool)

(assert (=> b!820348 (=> (not res!559769) (not e!455765))))

(declare-datatypes ((array!45443 0))(
  ( (array!45444 (arr!21774 (Array (_ BitVec 32) (_ BitVec 64))) (size!22195 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45443)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45443 (_ BitVec 32)) Bool)

(assert (=> b!820348 (= res!559769 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!820349 () Bool)

(declare-fun res!559768 () Bool)

(assert (=> b!820349 (=> (not res!559768) (not e!455765))))

(declare-datatypes ((List!15534 0))(
  ( (Nil!15531) (Cons!15530 (h!16659 (_ BitVec 64)) (t!21858 List!15534)) )
))
(declare-fun arrayNoDuplicates!0 (array!45443 (_ BitVec 32) List!15534) Bool)

(assert (=> b!820349 (= res!559768 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15531))))

(declare-fun b!820350 () Bool)

(assert (=> b!820350 (= e!455765 (not true))))

(declare-datatypes ((tuple2!9718 0))(
  ( (tuple2!9719 (_1!4870 (_ BitVec 64)) (_2!4870 V!24515)) )
))
(declare-datatypes ((List!15535 0))(
  ( (Nil!15532) (Cons!15531 (h!16660 tuple2!9718) (t!21859 List!15535)) )
))
(declare-datatypes ((ListLongMap!8531 0))(
  ( (ListLongMap!8532 (toList!4281 List!15535)) )
))
(declare-fun lt!368590 () ListLongMap!8531)

(declare-fun lt!368589 () ListLongMap!8531)

(assert (=> b!820350 (= lt!368590 lt!368589)))

(declare-fun zeroValueBefore!34 () V!24515)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24515)

(declare-fun minValue!754 () V!24515)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!27991 0))(
  ( (Unit!27992) )
))
(declare-fun lt!368588 () Unit!27991)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!426 (array!45443 array!45441 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24515 V!24515 V!24515 V!24515 (_ BitVec 32) Int) Unit!27991)

(assert (=> b!820350 (= lt!368588 (lemmaNoChangeToArrayThenSameMapNoExtras!426 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2333 (array!45443 array!45441 (_ BitVec 32) (_ BitVec 32) V!24515 V!24515 (_ BitVec 32) Int) ListLongMap!8531)

(assert (=> b!820350 (= lt!368589 (getCurrentListMapNoExtraKeys!2333 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820350 (= lt!368590 (getCurrentListMapNoExtraKeys!2333 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!820351 () Bool)

(declare-fun res!559770 () Bool)

(assert (=> b!820351 (=> (not res!559770) (not e!455765))))

(assert (=> b!820351 (= res!559770 (and (= (size!22194 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22195 _keys!976) (size!22194 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!820352 () Bool)

(declare-fun e!455766 () Bool)

(assert (=> b!820352 (= e!455766 (and e!455763 mapRes!23557))))

(declare-fun condMapEmpty!23557 () Bool)

(declare-fun mapDefault!23557 () ValueCell!6902)

(assert (=> b!820352 (= condMapEmpty!23557 (= (arr!21773 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6902)) mapDefault!23557)))))

(declare-fun b!820353 () Bool)

(assert (=> b!820353 (= e!455764 tp_is_empty!14635)))

(declare-fun res!559767 () Bool)

(assert (=> start!70618 (=> (not res!559767) (not e!455765))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70618 (= res!559767 (validMask!0 mask!1312))))

(assert (=> start!70618 e!455765))

(assert (=> start!70618 tp_is_empty!14635))

(declare-fun array_inv!17469 (array!45443) Bool)

(assert (=> start!70618 (array_inv!17469 _keys!976)))

(assert (=> start!70618 true))

(declare-fun array_inv!17470 (array!45441) Bool)

(assert (=> start!70618 (and (array_inv!17470 _values!788) e!455766)))

(assert (=> start!70618 tp!45514))

(assert (= (and start!70618 res!559767) b!820351))

(assert (= (and b!820351 res!559770) b!820348))

(assert (= (and b!820348 res!559769) b!820349))

(assert (= (and b!820349 res!559768) b!820350))

(assert (= (and b!820352 condMapEmpty!23557) mapIsEmpty!23557))

(assert (= (and b!820352 (not condMapEmpty!23557)) mapNonEmpty!23557))

(get-info :version)

(assert (= (and mapNonEmpty!23557 ((_ is ValueCellFull!6902) mapValue!23557)) b!820353))

(assert (= (and b!820352 ((_ is ValueCellFull!6902) mapDefault!23557)) b!820347))

(assert (= start!70618 b!820352))

(declare-fun m!761773 () Bool)

(assert (=> b!820348 m!761773))

(declare-fun m!761775 () Bool)

(assert (=> start!70618 m!761775))

(declare-fun m!761777 () Bool)

(assert (=> start!70618 m!761777))

(declare-fun m!761779 () Bool)

(assert (=> start!70618 m!761779))

(declare-fun m!761781 () Bool)

(assert (=> b!820349 m!761781))

(declare-fun m!761783 () Bool)

(assert (=> mapNonEmpty!23557 m!761783))

(declare-fun m!761785 () Bool)

(assert (=> b!820350 m!761785))

(declare-fun m!761787 () Bool)

(assert (=> b!820350 m!761787))

(declare-fun m!761789 () Bool)

(assert (=> b!820350 m!761789))

(check-sat (not b!820349) (not b_next!12925) b_and!21753 tp_is_empty!14635 (not mapNonEmpty!23557) (not start!70618) (not b!820348) (not b!820350))
(check-sat b_and!21753 (not b_next!12925))
