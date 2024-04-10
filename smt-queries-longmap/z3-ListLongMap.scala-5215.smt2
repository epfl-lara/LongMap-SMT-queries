; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70342 () Bool)

(assert start!70342)

(declare-fun b_free!12699 () Bool)

(declare-fun b_next!12699 () Bool)

(assert (=> start!70342 (= b_free!12699 (not b_next!12699))))

(declare-fun tp!44823 () Bool)

(declare-fun b_and!21511 () Bool)

(assert (=> start!70342 (= tp!44823 b_and!21511)))

(declare-fun b!817194 () Bool)

(declare-fun e!453420 () Bool)

(declare-fun tp_is_empty!14409 () Bool)

(assert (=> b!817194 (= e!453420 tp_is_empty!14409)))

(declare-fun res!557840 () Bool)

(declare-fun e!453419 () Bool)

(assert (=> start!70342 (=> (not res!557840) (not e!453419))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70342 (= res!557840 (validMask!0 mask!1312))))

(assert (=> start!70342 e!453419))

(assert (=> start!70342 tp_is_empty!14409))

(declare-datatypes ((array!45018 0))(
  ( (array!45019 (arr!21565 (Array (_ BitVec 32) (_ BitVec 64))) (size!21986 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45018)

(declare-fun array_inv!17255 (array!45018) Bool)

(assert (=> start!70342 (array_inv!17255 _keys!976)))

(assert (=> start!70342 true))

(declare-datatypes ((V!24213 0))(
  ( (V!24214 (val!7252 Int)) )
))
(declare-datatypes ((ValueCell!6789 0))(
  ( (ValueCellFull!6789 (v!9681 V!24213)) (EmptyCell!6789) )
))
(declare-datatypes ((array!45020 0))(
  ( (array!45021 (arr!21566 (Array (_ BitVec 32) ValueCell!6789)) (size!21987 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45020)

(declare-fun e!453418 () Bool)

(declare-fun array_inv!17256 (array!45020) Bool)

(assert (=> start!70342 (and (array_inv!17256 _values!788) e!453418)))

(assert (=> start!70342 tp!44823))

(declare-fun b!817195 () Bool)

(declare-fun res!557842 () Bool)

(assert (=> b!817195 (=> (not res!557842) (not e!453419))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!817195 (= res!557842 (and (= (size!21987 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21986 _keys!976) (size!21987 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!817196 () Bool)

(declare-fun res!557839 () Bool)

(assert (=> b!817196 (=> (not res!557839) (not e!453419))))

(declare-datatypes ((List!15360 0))(
  ( (Nil!15357) (Cons!15356 (h!16485 (_ BitVec 64)) (t!21685 List!15360)) )
))
(declare-fun arrayNoDuplicates!0 (array!45018 (_ BitVec 32) List!15360) Bool)

(assert (=> b!817196 (= res!557839 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15357))))

(declare-fun b!817197 () Bool)

(assert (=> b!817197 (= e!453419 (not true))))

(declare-datatypes ((tuple2!9532 0))(
  ( (tuple2!9533 (_1!4777 (_ BitVec 64)) (_2!4777 V!24213)) )
))
(declare-datatypes ((List!15361 0))(
  ( (Nil!15358) (Cons!15357 (h!16486 tuple2!9532) (t!21686 List!15361)) )
))
(declare-datatypes ((ListLongMap!8355 0))(
  ( (ListLongMap!8356 (toList!4193 List!15361)) )
))
(declare-fun lt!366146 () ListLongMap!8355)

(declare-fun lt!366147 () ListLongMap!8355)

(assert (=> b!817197 (= lt!366146 lt!366147)))

(declare-fun zeroValueBefore!34 () V!24213)

(declare-fun zeroValueAfter!34 () V!24213)

(declare-fun minValue!754 () V!24213)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27870 0))(
  ( (Unit!27871) )
))
(declare-fun lt!366145 () Unit!27870)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!344 (array!45018 array!45020 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24213 V!24213 V!24213 V!24213 (_ BitVec 32) Int) Unit!27870)

(assert (=> b!817197 (= lt!366145 (lemmaNoChangeToArrayThenSameMapNoExtras!344 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2234 (array!45018 array!45020 (_ BitVec 32) (_ BitVec 32) V!24213 V!24213 (_ BitVec 32) Int) ListLongMap!8355)

(assert (=> b!817197 (= lt!366147 (getCurrentListMapNoExtraKeys!2234 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!817197 (= lt!366146 (getCurrentListMapNoExtraKeys!2234 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!817198 () Bool)

(declare-fun e!453417 () Bool)

(assert (=> b!817198 (= e!453417 tp_is_empty!14409)))

(declare-fun b!817199 () Bool)

(declare-fun res!557841 () Bool)

(assert (=> b!817199 (=> (not res!557841) (not e!453419))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45018 (_ BitVec 32)) Bool)

(assert (=> b!817199 (= res!557841 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!23206 () Bool)

(declare-fun mapRes!23206 () Bool)

(declare-fun tp!44824 () Bool)

(assert (=> mapNonEmpty!23206 (= mapRes!23206 (and tp!44824 e!453420))))

(declare-fun mapKey!23206 () (_ BitVec 32))

(declare-fun mapValue!23206 () ValueCell!6789)

(declare-fun mapRest!23206 () (Array (_ BitVec 32) ValueCell!6789))

(assert (=> mapNonEmpty!23206 (= (arr!21566 _values!788) (store mapRest!23206 mapKey!23206 mapValue!23206))))

(declare-fun mapIsEmpty!23206 () Bool)

(assert (=> mapIsEmpty!23206 mapRes!23206))

(declare-fun b!817200 () Bool)

(assert (=> b!817200 (= e!453418 (and e!453417 mapRes!23206))))

(declare-fun condMapEmpty!23206 () Bool)

(declare-fun mapDefault!23206 () ValueCell!6789)

(assert (=> b!817200 (= condMapEmpty!23206 (= (arr!21566 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6789)) mapDefault!23206)))))

(assert (= (and start!70342 res!557840) b!817195))

(assert (= (and b!817195 res!557842) b!817199))

(assert (= (and b!817199 res!557841) b!817196))

(assert (= (and b!817196 res!557839) b!817197))

(assert (= (and b!817200 condMapEmpty!23206) mapIsEmpty!23206))

(assert (= (and b!817200 (not condMapEmpty!23206)) mapNonEmpty!23206))

(get-info :version)

(assert (= (and mapNonEmpty!23206 ((_ is ValueCellFull!6789) mapValue!23206)) b!817194))

(assert (= (and b!817200 ((_ is ValueCellFull!6789) mapDefault!23206)) b!817198))

(assert (= start!70342 b!817200))

(declare-fun m!758811 () Bool)

(assert (=> b!817197 m!758811))

(declare-fun m!758813 () Bool)

(assert (=> b!817197 m!758813))

(declare-fun m!758815 () Bool)

(assert (=> b!817197 m!758815))

(declare-fun m!758817 () Bool)

(assert (=> mapNonEmpty!23206 m!758817))

(declare-fun m!758819 () Bool)

(assert (=> b!817199 m!758819))

(declare-fun m!758821 () Bool)

(assert (=> start!70342 m!758821))

(declare-fun m!758823 () Bool)

(assert (=> start!70342 m!758823))

(declare-fun m!758825 () Bool)

(assert (=> start!70342 m!758825))

(declare-fun m!758827 () Bool)

(assert (=> b!817196 m!758827))

(check-sat (not b!817197) tp_is_empty!14409 b_and!21511 (not mapNonEmpty!23206) (not b!817196) (not start!70342) (not b!817199) (not b_next!12699))
(check-sat b_and!21511 (not b_next!12699))
