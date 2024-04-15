; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70150 () Bool)

(assert start!70150)

(declare-fun b_free!12577 () Bool)

(declare-fun b_next!12577 () Bool)

(assert (=> start!70150 (= b_free!12577 (not b_next!12577))))

(declare-fun tp!44448 () Bool)

(declare-fun b_and!21331 () Bool)

(assert (=> start!70150 (= tp!44448 b_and!21331)))

(declare-fun mapIsEmpty!23014 () Bool)

(declare-fun mapRes!23014 () Bool)

(assert (=> mapIsEmpty!23014 mapRes!23014))

(declare-fun b!815052 () Bool)

(declare-fun e!451914 () Bool)

(declare-fun tp_is_empty!14287 () Bool)

(assert (=> b!815052 (= e!451914 tp_is_empty!14287)))

(declare-fun b!815053 () Bool)

(declare-fun res!556647 () Bool)

(declare-fun e!451918 () Bool)

(assert (=> b!815053 (=> (not res!556647) (not e!451918))))

(declare-datatypes ((array!44763 0))(
  ( (array!44764 (arr!21441 (Array (_ BitVec 32) (_ BitVec 64))) (size!21862 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44763)

(declare-datatypes ((List!15281 0))(
  ( (Nil!15278) (Cons!15277 (h!16406 (_ BitVec 64)) (t!21591 List!15281)) )
))
(declare-fun arrayNoDuplicates!0 (array!44763 (_ BitVec 32) List!15281) Bool)

(assert (=> b!815053 (= res!556647 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15278))))

(declare-fun mapNonEmpty!23014 () Bool)

(declare-fun tp!44449 () Bool)

(declare-fun e!451915 () Bool)

(assert (=> mapNonEmpty!23014 (= mapRes!23014 (and tp!44449 e!451915))))

(declare-datatypes ((V!24051 0))(
  ( (V!24052 (val!7191 Int)) )
))
(declare-datatypes ((ValueCell!6728 0))(
  ( (ValueCellFull!6728 (v!9612 V!24051)) (EmptyCell!6728) )
))
(declare-fun mapRest!23014 () (Array (_ BitVec 32) ValueCell!6728))

(declare-datatypes ((array!44765 0))(
  ( (array!44766 (arr!21442 (Array (_ BitVec 32) ValueCell!6728)) (size!21863 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44765)

(declare-fun mapValue!23014 () ValueCell!6728)

(declare-fun mapKey!23014 () (_ BitVec 32))

(assert (=> mapNonEmpty!23014 (= (arr!21442 _values!788) (store mapRest!23014 mapKey!23014 mapValue!23014))))

(declare-fun b!815054 () Bool)

(assert (=> b!815054 (= e!451915 tp_is_empty!14287)))

(declare-fun res!556644 () Bool)

(assert (=> start!70150 (=> (not res!556644) (not e!451918))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70150 (= res!556644 (validMask!0 mask!1312))))

(assert (=> start!70150 e!451918))

(assert (=> start!70150 tp_is_empty!14287))

(declare-fun array_inv!17237 (array!44763) Bool)

(assert (=> start!70150 (array_inv!17237 _keys!976)))

(assert (=> start!70150 true))

(declare-fun e!451917 () Bool)

(declare-fun array_inv!17238 (array!44765) Bool)

(assert (=> start!70150 (and (array_inv!17238 _values!788) e!451917)))

(assert (=> start!70150 tp!44448))

(declare-fun b!815055 () Bool)

(declare-fun res!556646 () Bool)

(assert (=> b!815055 (=> (not res!556646) (not e!451918))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44763 (_ BitVec 32)) Bool)

(assert (=> b!815055 (= res!556646 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!815056 () Bool)

(assert (=> b!815056 (= e!451918 (not true))))

(declare-datatypes ((tuple2!9452 0))(
  ( (tuple2!9453 (_1!4737 (_ BitVec 64)) (_2!4737 V!24051)) )
))
(declare-datatypes ((List!15282 0))(
  ( (Nil!15279) (Cons!15278 (h!16407 tuple2!9452) (t!21592 List!15282)) )
))
(declare-datatypes ((ListLongMap!8265 0))(
  ( (ListLongMap!8266 (toList!4148 List!15282)) )
))
(declare-fun lt!364745 () ListLongMap!8265)

(declare-fun lt!364746 () ListLongMap!8265)

(assert (=> b!815056 (= lt!364745 lt!364746)))

(declare-fun zeroValueBefore!34 () V!24051)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24051)

(declare-fun minValue!754 () V!24051)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!27730 0))(
  ( (Unit!27731) )
))
(declare-fun lt!364747 () Unit!27730)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!306 (array!44763 array!44765 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24051 V!24051 V!24051 V!24051 (_ BitVec 32) Int) Unit!27730)

(assert (=> b!815056 (= lt!364747 (lemmaNoChangeToArrayThenSameMapNoExtras!306 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2213 (array!44763 array!44765 (_ BitVec 32) (_ BitVec 32) V!24051 V!24051 (_ BitVec 32) Int) ListLongMap!8265)

(assert (=> b!815056 (= lt!364746 (getCurrentListMapNoExtraKeys!2213 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815056 (= lt!364745 (getCurrentListMapNoExtraKeys!2213 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!815057 () Bool)

(assert (=> b!815057 (= e!451917 (and e!451914 mapRes!23014))))

(declare-fun condMapEmpty!23014 () Bool)

(declare-fun mapDefault!23014 () ValueCell!6728)

(assert (=> b!815057 (= condMapEmpty!23014 (= (arr!21442 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6728)) mapDefault!23014)))))

(declare-fun b!815058 () Bool)

(declare-fun res!556645 () Bool)

(assert (=> b!815058 (=> (not res!556645) (not e!451918))))

(assert (=> b!815058 (= res!556645 (and (= (size!21863 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21862 _keys!976) (size!21863 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!70150 res!556644) b!815058))

(assert (= (and b!815058 res!556645) b!815055))

(assert (= (and b!815055 res!556646) b!815053))

(assert (= (and b!815053 res!556647) b!815056))

(assert (= (and b!815057 condMapEmpty!23014) mapIsEmpty!23014))

(assert (= (and b!815057 (not condMapEmpty!23014)) mapNonEmpty!23014))

(get-info :version)

(assert (= (and mapNonEmpty!23014 ((_ is ValueCellFull!6728) mapValue!23014)) b!815054))

(assert (= (and b!815057 ((_ is ValueCellFull!6728) mapDefault!23014)) b!815052))

(assert (= start!70150 b!815057))

(declare-fun m!756231 () Bool)

(assert (=> b!815055 m!756231))

(declare-fun m!756233 () Bool)

(assert (=> mapNonEmpty!23014 m!756233))

(declare-fun m!756235 () Bool)

(assert (=> b!815053 m!756235))

(declare-fun m!756237 () Bool)

(assert (=> start!70150 m!756237))

(declare-fun m!756239 () Bool)

(assert (=> start!70150 m!756239))

(declare-fun m!756241 () Bool)

(assert (=> start!70150 m!756241))

(declare-fun m!756243 () Bool)

(assert (=> b!815056 m!756243))

(declare-fun m!756245 () Bool)

(assert (=> b!815056 m!756245))

(declare-fun m!756247 () Bool)

(assert (=> b!815056 m!756247))

(check-sat (not start!70150) (not b!815053) (not b!815056) (not b_next!12577) tp_is_empty!14287 (not b!815055) (not mapNonEmpty!23014) b_and!21331)
(check-sat b_and!21331 (not b_next!12577))
