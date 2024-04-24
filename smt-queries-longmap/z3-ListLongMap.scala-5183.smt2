; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70250 () Bool)

(assert start!70250)

(declare-fun b_free!12505 () Bool)

(declare-fun b_next!12505 () Bool)

(assert (=> start!70250 (= b_free!12505 (not b_next!12505))))

(declare-fun tp!44230 () Bool)

(declare-fun b_and!21287 () Bool)

(assert (=> start!70250 (= tp!44230 b_and!21287)))

(declare-fun b!815351 () Bool)

(declare-fun e!452048 () Bool)

(declare-fun tp_is_empty!14215 () Bool)

(assert (=> b!815351 (= e!452048 tp_is_empty!14215)))

(declare-fun mapIsEmpty!22903 () Bool)

(declare-fun mapRes!22903 () Bool)

(assert (=> mapIsEmpty!22903 mapRes!22903))

(declare-fun b!815352 () Bool)

(declare-fun e!452049 () Bool)

(assert (=> b!815352 (= e!452049 (not true))))

(declare-datatypes ((V!23955 0))(
  ( (V!23956 (val!7155 Int)) )
))
(declare-datatypes ((tuple2!9292 0))(
  ( (tuple2!9293 (_1!4657 (_ BitVec 64)) (_2!4657 V!23955)) )
))
(declare-datatypes ((List!15111 0))(
  ( (Nil!15108) (Cons!15107 (h!16242 tuple2!9292) (t!21420 List!15111)) )
))
(declare-datatypes ((ListLongMap!8117 0))(
  ( (ListLongMap!8118 (toList!4074 List!15111)) )
))
(declare-fun lt!364978 () ListLongMap!8117)

(declare-fun lt!364980 () ListLongMap!8117)

(assert (=> b!815352 (= lt!364978 lt!364980)))

(declare-fun zeroValueBefore!34 () V!23955)

(declare-datatypes ((array!44631 0))(
  ( (array!44632 (arr!21371 (Array (_ BitVec 32) (_ BitVec 64))) (size!21791 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44631)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!23955)

(declare-fun minValue!754 () V!23955)

(declare-datatypes ((ValueCell!6692 0))(
  ( (ValueCellFull!6692 (v!9582 V!23955)) (EmptyCell!6692) )
))
(declare-datatypes ((array!44633 0))(
  ( (array!44634 (arr!21372 (Array (_ BitVec 32) ValueCell!6692)) (size!21792 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44633)

(declare-datatypes ((Unit!27715 0))(
  ( (Unit!27716) )
))
(declare-fun lt!364979 () Unit!27715)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!269 (array!44631 array!44633 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!23955 V!23955 V!23955 V!23955 (_ BitVec 32) Int) Unit!27715)

(assert (=> b!815352 (= lt!364979 (lemmaNoChangeToArrayThenSameMapNoExtras!269 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2181 (array!44631 array!44633 (_ BitVec 32) (_ BitVec 32) V!23955 V!23955 (_ BitVec 32) Int) ListLongMap!8117)

(assert (=> b!815352 (= lt!364980 (getCurrentListMapNoExtraKeys!2181 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815352 (= lt!364978 (getCurrentListMapNoExtraKeys!2181 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!815353 () Bool)

(declare-fun res!556635 () Bool)

(assert (=> b!815353 (=> (not res!556635) (not e!452049))))

(declare-datatypes ((List!15112 0))(
  ( (Nil!15109) (Cons!15108 (h!16243 (_ BitVec 64)) (t!21421 List!15112)) )
))
(declare-fun arrayNoDuplicates!0 (array!44631 (_ BitVec 32) List!15112) Bool)

(assert (=> b!815353 (= res!556635 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15109))))

(declare-fun b!815354 () Bool)

(declare-fun res!556634 () Bool)

(assert (=> b!815354 (=> (not res!556634) (not e!452049))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44631 (_ BitVec 32)) Bool)

(assert (=> b!815354 (= res!556634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!815355 () Bool)

(declare-fun res!556633 () Bool)

(assert (=> b!815355 (=> (not res!556633) (not e!452049))))

(assert (=> b!815355 (= res!556633 (and (= (size!21792 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21791 _keys!976) (size!21792 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!22903 () Bool)

(declare-fun tp!44229 () Bool)

(assert (=> mapNonEmpty!22903 (= mapRes!22903 (and tp!44229 e!452048))))

(declare-fun mapKey!22903 () (_ BitVec 32))

(declare-fun mapRest!22903 () (Array (_ BitVec 32) ValueCell!6692))

(declare-fun mapValue!22903 () ValueCell!6692)

(assert (=> mapNonEmpty!22903 (= (arr!21372 _values!788) (store mapRest!22903 mapKey!22903 mapValue!22903))))

(declare-fun b!815356 () Bool)

(declare-fun e!452047 () Bool)

(assert (=> b!815356 (= e!452047 tp_is_empty!14215)))

(declare-fun res!556636 () Bool)

(assert (=> start!70250 (=> (not res!556636) (not e!452049))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70250 (= res!556636 (validMask!0 mask!1312))))

(assert (=> start!70250 e!452049))

(assert (=> start!70250 tp_is_empty!14215))

(declare-fun array_inv!17155 (array!44631) Bool)

(assert (=> start!70250 (array_inv!17155 _keys!976)))

(assert (=> start!70250 true))

(declare-fun e!452051 () Bool)

(declare-fun array_inv!17156 (array!44633) Bool)

(assert (=> start!70250 (and (array_inv!17156 _values!788) e!452051)))

(assert (=> start!70250 tp!44230))

(declare-fun b!815357 () Bool)

(assert (=> b!815357 (= e!452051 (and e!452047 mapRes!22903))))

(declare-fun condMapEmpty!22903 () Bool)

(declare-fun mapDefault!22903 () ValueCell!6692)

(assert (=> b!815357 (= condMapEmpty!22903 (= (arr!21372 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6692)) mapDefault!22903)))))

(assert (= (and start!70250 res!556636) b!815355))

(assert (= (and b!815355 res!556633) b!815354))

(assert (= (and b!815354 res!556634) b!815353))

(assert (= (and b!815353 res!556635) b!815352))

(assert (= (and b!815357 condMapEmpty!22903) mapIsEmpty!22903))

(assert (= (and b!815357 (not condMapEmpty!22903)) mapNonEmpty!22903))

(get-info :version)

(assert (= (and mapNonEmpty!22903 ((_ is ValueCellFull!6692) mapValue!22903)) b!815351))

(assert (= (and b!815357 ((_ is ValueCellFull!6692) mapDefault!22903)) b!815356))

(assert (= start!70250 b!815357))

(declare-fun m!757551 () Bool)

(assert (=> b!815352 m!757551))

(declare-fun m!757553 () Bool)

(assert (=> b!815352 m!757553))

(declare-fun m!757555 () Bool)

(assert (=> b!815352 m!757555))

(declare-fun m!757557 () Bool)

(assert (=> mapNonEmpty!22903 m!757557))

(declare-fun m!757559 () Bool)

(assert (=> b!815354 m!757559))

(declare-fun m!757561 () Bool)

(assert (=> start!70250 m!757561))

(declare-fun m!757563 () Bool)

(assert (=> start!70250 m!757563))

(declare-fun m!757565 () Bool)

(assert (=> start!70250 m!757565))

(declare-fun m!757567 () Bool)

(assert (=> b!815353 m!757567))

(check-sat (not b!815353) (not b!815354) tp_is_empty!14215 (not b!815352) b_and!21287 (not b_next!12505) (not start!70250) (not mapNonEmpty!22903))
(check-sat b_and!21287 (not b_next!12505))
