; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70130 () Bool)

(assert start!70130)

(declare-fun b_free!12537 () Bool)

(declare-fun b_next!12537 () Bool)

(assert (=> start!70130 (= b_free!12537 (not b_next!12537))))

(declare-fun tp!44328 () Bool)

(declare-fun b_and!21317 () Bool)

(assert (=> start!70130 (= tp!44328 b_and!21317)))

(declare-fun b!814878 () Bool)

(declare-fun e!451767 () Bool)

(assert (=> b!814878 (= e!451767 (not true))))

(declare-datatypes ((V!23997 0))(
  ( (V!23998 (val!7171 Int)) )
))
(declare-datatypes ((tuple2!9400 0))(
  ( (tuple2!9401 (_1!4711 (_ BitVec 64)) (_2!4711 V!23997)) )
))
(declare-datatypes ((List!15233 0))(
  ( (Nil!15230) (Cons!15229 (h!16358 tuple2!9400) (t!21552 List!15233)) )
))
(declare-datatypes ((ListLongMap!8223 0))(
  ( (ListLongMap!8224 (toList!4127 List!15233)) )
))
(declare-fun lt!364809 () ListLongMap!8223)

(declare-fun lt!364810 () ListLongMap!8223)

(assert (=> b!814878 (= lt!364809 lt!364810)))

(declare-fun zeroValueBefore!34 () V!23997)

(declare-datatypes ((array!44698 0))(
  ( (array!44699 (arr!21408 (Array (_ BitVec 32) (_ BitVec 64))) (size!21829 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44698)

(declare-datatypes ((Unit!27752 0))(
  ( (Unit!27753) )
))
(declare-fun lt!364808 () Unit!27752)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!23997)

(declare-fun minValue!754 () V!23997)

(declare-datatypes ((ValueCell!6708 0))(
  ( (ValueCellFull!6708 (v!9598 V!23997)) (EmptyCell!6708) )
))
(declare-datatypes ((array!44700 0))(
  ( (array!44701 (arr!21409 (Array (_ BitVec 32) ValueCell!6708)) (size!21830 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44700)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!287 (array!44698 array!44700 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!23997 V!23997 V!23997 V!23997 (_ BitVec 32) Int) Unit!27752)

(assert (=> b!814878 (= lt!364808 (lemmaNoChangeToArrayThenSameMapNoExtras!287 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2177 (array!44698 array!44700 (_ BitVec 32) (_ BitVec 32) V!23997 V!23997 (_ BitVec 32) Int) ListLongMap!8223)

(assert (=> b!814878 (= lt!364810 (getCurrentListMapNoExtraKeys!2177 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!814878 (= lt!364809 (getCurrentListMapNoExtraKeys!2177 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!814879 () Bool)

(declare-fun res!556512 () Bool)

(assert (=> b!814879 (=> (not res!556512) (not e!451767))))

(declare-datatypes ((List!15234 0))(
  ( (Nil!15231) (Cons!15230 (h!16359 (_ BitVec 64)) (t!21553 List!15234)) )
))
(declare-fun arrayNoDuplicates!0 (array!44698 (_ BitVec 32) List!15234) Bool)

(assert (=> b!814879 (= res!556512 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15231))))

(declare-fun b!814880 () Bool)

(declare-fun res!556513 () Bool)

(assert (=> b!814880 (=> (not res!556513) (not e!451767))))

(assert (=> b!814880 (= res!556513 (and (= (size!21830 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21829 _keys!976) (size!21830 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!814881 () Bool)

(declare-fun res!556511 () Bool)

(assert (=> b!814881 (=> (not res!556511) (not e!451767))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44698 (_ BitVec 32)) Bool)

(assert (=> b!814881 (= res!556511 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!22954 () Bool)

(declare-fun mapRes!22954 () Bool)

(declare-fun tp!44329 () Bool)

(declare-fun e!451766 () Bool)

(assert (=> mapNonEmpty!22954 (= mapRes!22954 (and tp!44329 e!451766))))

(declare-fun mapKey!22954 () (_ BitVec 32))

(declare-fun mapRest!22954 () (Array (_ BitVec 32) ValueCell!6708))

(declare-fun mapValue!22954 () ValueCell!6708)

(assert (=> mapNonEmpty!22954 (= (arr!21409 _values!788) (store mapRest!22954 mapKey!22954 mapValue!22954))))

(declare-fun mapIsEmpty!22954 () Bool)

(assert (=> mapIsEmpty!22954 mapRes!22954))

(declare-fun b!814882 () Bool)

(declare-fun tp_is_empty!14247 () Bool)

(assert (=> b!814882 (= e!451766 tp_is_empty!14247)))

(declare-fun res!556510 () Bool)

(assert (=> start!70130 (=> (not res!556510) (not e!451767))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70130 (= res!556510 (validMask!0 mask!1312))))

(assert (=> start!70130 e!451767))

(assert (=> start!70130 tp_is_empty!14247))

(declare-fun array_inv!17127 (array!44698) Bool)

(assert (=> start!70130 (array_inv!17127 _keys!976)))

(assert (=> start!70130 true))

(declare-fun e!451768 () Bool)

(declare-fun array_inv!17128 (array!44700) Bool)

(assert (=> start!70130 (and (array_inv!17128 _values!788) e!451768)))

(assert (=> start!70130 tp!44328))

(declare-fun b!814883 () Bool)

(declare-fun e!451764 () Bool)

(assert (=> b!814883 (= e!451764 tp_is_empty!14247)))

(declare-fun b!814884 () Bool)

(assert (=> b!814884 (= e!451768 (and e!451764 mapRes!22954))))

(declare-fun condMapEmpty!22954 () Bool)

(declare-fun mapDefault!22954 () ValueCell!6708)

(assert (=> b!814884 (= condMapEmpty!22954 (= (arr!21409 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6708)) mapDefault!22954)))))

(assert (= (and start!70130 res!556510) b!814880))

(assert (= (and b!814880 res!556513) b!814881))

(assert (= (and b!814881 res!556511) b!814879))

(assert (= (and b!814879 res!556512) b!814878))

(assert (= (and b!814884 condMapEmpty!22954) mapIsEmpty!22954))

(assert (= (and b!814884 (not condMapEmpty!22954)) mapNonEmpty!22954))

(get-info :version)

(assert (= (and mapNonEmpty!22954 ((_ is ValueCellFull!6708) mapValue!22954)) b!814882))

(assert (= (and b!814884 ((_ is ValueCellFull!6708) mapDefault!22954)) b!814883))

(assert (= start!70130 b!814884))

(declare-fun m!756623 () Bool)

(assert (=> b!814881 m!756623))

(declare-fun m!756625 () Bool)

(assert (=> start!70130 m!756625))

(declare-fun m!756627 () Bool)

(assert (=> start!70130 m!756627))

(declare-fun m!756629 () Bool)

(assert (=> start!70130 m!756629))

(declare-fun m!756631 () Bool)

(assert (=> b!814879 m!756631))

(declare-fun m!756633 () Bool)

(assert (=> mapNonEmpty!22954 m!756633))

(declare-fun m!756635 () Bool)

(assert (=> b!814878 m!756635))

(declare-fun m!756637 () Bool)

(assert (=> b!814878 m!756637))

(declare-fun m!756639 () Bool)

(assert (=> b!814878 m!756639))

(check-sat (not b!814878) (not b!814879) (not b_next!12537) (not mapNonEmpty!22954) (not b!814881) tp_is_empty!14247 b_and!21317 (not start!70130))
(check-sat b_and!21317 (not b_next!12537))
