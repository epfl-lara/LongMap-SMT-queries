; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70114 () Bool)

(assert start!70114)

(declare-fun b_free!12541 () Bool)

(declare-fun b_next!12541 () Bool)

(assert (=> start!70114 (= b_free!12541 (not b_next!12541))))

(declare-fun tp!44340 () Bool)

(declare-fun b_and!21295 () Bool)

(assert (=> start!70114 (= tp!44340 b_and!21295)))

(declare-fun b!814675 () Bool)

(declare-fun res!556430 () Bool)

(declare-fun e!451646 () Bool)

(assert (=> b!814675 (=> (not res!556430) (not e!451646))))

(declare-datatypes ((array!44697 0))(
  ( (array!44698 (arr!21408 (Array (_ BitVec 32) (_ BitVec 64))) (size!21829 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44697)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((V!24003 0))(
  ( (V!24004 (val!7173 Int)) )
))
(declare-datatypes ((ValueCell!6710 0))(
  ( (ValueCellFull!6710 (v!9594 V!24003)) (EmptyCell!6710) )
))
(declare-datatypes ((array!44699 0))(
  ( (array!44700 (arr!21409 (Array (_ BitVec 32) ValueCell!6710)) (size!21830 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44699)

(assert (=> b!814675 (= res!556430 (and (= (size!21830 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21829 _keys!976) (size!21830 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!814676 () Bool)

(declare-fun res!556429 () Bool)

(assert (=> b!814676 (=> (not res!556429) (not e!451646))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44697 (_ BitVec 32)) Bool)

(assert (=> b!814676 (= res!556429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!814677 () Bool)

(declare-fun e!451648 () Bool)

(declare-fun tp_is_empty!14251 () Bool)

(assert (=> b!814677 (= e!451648 tp_is_empty!14251)))

(declare-fun b!814678 () Bool)

(assert (=> b!814678 (= e!451646 (not true))))

(declare-datatypes ((tuple2!9434 0))(
  ( (tuple2!9435 (_1!4728 (_ BitVec 64)) (_2!4728 V!24003)) )
))
(declare-datatypes ((List!15262 0))(
  ( (Nil!15259) (Cons!15258 (h!16387 tuple2!9434) (t!21572 List!15262)) )
))
(declare-datatypes ((ListLongMap!8247 0))(
  ( (ListLongMap!8248 (toList!4139 List!15262)) )
))
(declare-fun lt!364584 () ListLongMap!8247)

(declare-fun lt!364583 () ListLongMap!8247)

(assert (=> b!814678 (= lt!364584 lt!364583)))

(declare-fun zeroValueBefore!34 () V!24003)

(declare-fun zeroValueAfter!34 () V!24003)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27712 0))(
  ( (Unit!27713) )
))
(declare-fun lt!364585 () Unit!27712)

(declare-fun minValue!754 () V!24003)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!297 (array!44697 array!44699 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24003 V!24003 V!24003 V!24003 (_ BitVec 32) Int) Unit!27712)

(assert (=> b!814678 (= lt!364585 (lemmaNoChangeToArrayThenSameMapNoExtras!297 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2204 (array!44697 array!44699 (_ BitVec 32) (_ BitVec 32) V!24003 V!24003 (_ BitVec 32) Int) ListLongMap!8247)

(assert (=> b!814678 (= lt!364583 (getCurrentListMapNoExtraKeys!2204 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!814678 (= lt!364584 (getCurrentListMapNoExtraKeys!2204 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!556431 () Bool)

(assert (=> start!70114 (=> (not res!556431) (not e!451646))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70114 (= res!556431 (validMask!0 mask!1312))))

(assert (=> start!70114 e!451646))

(assert (=> start!70114 tp_is_empty!14251))

(declare-fun array_inv!17211 (array!44697) Bool)

(assert (=> start!70114 (array_inv!17211 _keys!976)))

(assert (=> start!70114 true))

(declare-fun e!451645 () Bool)

(declare-fun array_inv!17212 (array!44699) Bool)

(assert (=> start!70114 (and (array_inv!17212 _values!788) e!451645)))

(assert (=> start!70114 tp!44340))

(declare-fun b!814674 () Bool)

(declare-fun e!451647 () Bool)

(assert (=> b!814674 (= e!451647 tp_is_empty!14251)))

(declare-fun mapIsEmpty!22960 () Bool)

(declare-fun mapRes!22960 () Bool)

(assert (=> mapIsEmpty!22960 mapRes!22960))

(declare-fun b!814679 () Bool)

(assert (=> b!814679 (= e!451645 (and e!451647 mapRes!22960))))

(declare-fun condMapEmpty!22960 () Bool)

(declare-fun mapDefault!22960 () ValueCell!6710)

(assert (=> b!814679 (= condMapEmpty!22960 (= (arr!21409 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6710)) mapDefault!22960)))))

(declare-fun b!814680 () Bool)

(declare-fun res!556428 () Bool)

(assert (=> b!814680 (=> (not res!556428) (not e!451646))))

(declare-datatypes ((List!15263 0))(
  ( (Nil!15260) (Cons!15259 (h!16388 (_ BitVec 64)) (t!21573 List!15263)) )
))
(declare-fun arrayNoDuplicates!0 (array!44697 (_ BitVec 32) List!15263) Bool)

(assert (=> b!814680 (= res!556428 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15260))))

(declare-fun mapNonEmpty!22960 () Bool)

(declare-fun tp!44341 () Bool)

(assert (=> mapNonEmpty!22960 (= mapRes!22960 (and tp!44341 e!451648))))

(declare-fun mapRest!22960 () (Array (_ BitVec 32) ValueCell!6710))

(declare-fun mapKey!22960 () (_ BitVec 32))

(declare-fun mapValue!22960 () ValueCell!6710)

(assert (=> mapNonEmpty!22960 (= (arr!21409 _values!788) (store mapRest!22960 mapKey!22960 mapValue!22960))))

(assert (= (and start!70114 res!556431) b!814675))

(assert (= (and b!814675 res!556430) b!814676))

(assert (= (and b!814676 res!556429) b!814680))

(assert (= (and b!814680 res!556428) b!814678))

(assert (= (and b!814679 condMapEmpty!22960) mapIsEmpty!22960))

(assert (= (and b!814679 (not condMapEmpty!22960)) mapNonEmpty!22960))

(get-info :version)

(assert (= (and mapNonEmpty!22960 ((_ is ValueCellFull!6710) mapValue!22960)) b!814677))

(assert (= (and b!814679 ((_ is ValueCellFull!6710) mapDefault!22960)) b!814674))

(assert (= start!70114 b!814679))

(declare-fun m!755907 () Bool)

(assert (=> b!814678 m!755907))

(declare-fun m!755909 () Bool)

(assert (=> b!814678 m!755909))

(declare-fun m!755911 () Bool)

(assert (=> b!814678 m!755911))

(declare-fun m!755913 () Bool)

(assert (=> mapNonEmpty!22960 m!755913))

(declare-fun m!755915 () Bool)

(assert (=> b!814676 m!755915))

(declare-fun m!755917 () Bool)

(assert (=> start!70114 m!755917))

(declare-fun m!755919 () Bool)

(assert (=> start!70114 m!755919))

(declare-fun m!755921 () Bool)

(assert (=> start!70114 m!755921))

(declare-fun m!755923 () Bool)

(assert (=> b!814680 m!755923))

(check-sat (not b_next!12541) (not b!814678) b_and!21295 (not mapNonEmpty!22960) tp_is_empty!14251 (not start!70114) (not b!814676) (not b!814680))
(check-sat b_and!21295 (not b_next!12541))
