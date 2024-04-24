; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70220 () Bool)

(assert start!70220)

(declare-fun b_free!12475 () Bool)

(declare-fun b_next!12475 () Bool)

(assert (=> start!70220 (= b_free!12475 (not b_next!12475))))

(declare-fun tp!44140 () Bool)

(declare-fun b_and!21257 () Bool)

(assert (=> start!70220 (= tp!44140 b_and!21257)))

(declare-fun b!815036 () Bool)

(declare-fun res!556453 () Bool)

(declare-fun e!451825 () Bool)

(assert (=> b!815036 (=> (not res!556453) (not e!451825))))

(declare-datatypes ((array!44575 0))(
  ( (array!44576 (arr!21343 (Array (_ BitVec 32) (_ BitVec 64))) (size!21763 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44575)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!23915 0))(
  ( (V!23916 (val!7140 Int)) )
))
(declare-datatypes ((ValueCell!6677 0))(
  ( (ValueCellFull!6677 (v!9567 V!23915)) (EmptyCell!6677) )
))
(declare-datatypes ((array!44577 0))(
  ( (array!44578 (arr!21344 (Array (_ BitVec 32) ValueCell!6677)) (size!21764 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44577)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!815036 (= res!556453 (and (= (size!21764 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21763 _keys!976) (size!21764 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!815037 () Bool)

(declare-fun res!556454 () Bool)

(assert (=> b!815037 (=> (not res!556454) (not e!451825))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44575 (_ BitVec 32)) Bool)

(assert (=> b!815037 (= res!556454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!556456 () Bool)

(assert (=> start!70220 (=> (not res!556456) (not e!451825))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70220 (= res!556456 (validMask!0 mask!1312))))

(assert (=> start!70220 e!451825))

(declare-fun tp_is_empty!14185 () Bool)

(assert (=> start!70220 tp_is_empty!14185))

(declare-fun array_inv!17137 (array!44575) Bool)

(assert (=> start!70220 (array_inv!17137 _keys!976)))

(assert (=> start!70220 true))

(declare-fun e!451826 () Bool)

(declare-fun array_inv!17138 (array!44577) Bool)

(assert (=> start!70220 (and (array_inv!17138 _values!788) e!451826)))

(assert (=> start!70220 tp!44140))

(declare-fun b!815038 () Bool)

(assert (=> b!815038 (= e!451825 false)))

(declare-fun zeroValueAfter!34 () V!23915)

(declare-fun defaultEntry!796 () Int)

(declare-fun minValue!754 () V!23915)

(declare-datatypes ((tuple2!9270 0))(
  ( (tuple2!9271 (_1!4646 (_ BitVec 64)) (_2!4646 V!23915)) )
))
(declare-datatypes ((List!15089 0))(
  ( (Nil!15086) (Cons!15085 (h!16220 tuple2!9270) (t!21398 List!15089)) )
))
(declare-datatypes ((ListLongMap!8095 0))(
  ( (ListLongMap!8096 (toList!4063 List!15089)) )
))
(declare-fun lt!364850 () ListLongMap!8095)

(declare-fun getCurrentListMapNoExtraKeys!2170 (array!44575 array!44577 (_ BitVec 32) (_ BitVec 32) V!23915 V!23915 (_ BitVec 32) Int) ListLongMap!8095)

(assert (=> b!815038 (= lt!364850 (getCurrentListMapNoExtraKeys!2170 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!23915)

(declare-fun lt!364851 () ListLongMap!8095)

(assert (=> b!815038 (= lt!364851 (getCurrentListMapNoExtraKeys!2170 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!815039 () Bool)

(declare-fun res!556455 () Bool)

(assert (=> b!815039 (=> (not res!556455) (not e!451825))))

(declare-datatypes ((List!15090 0))(
  ( (Nil!15087) (Cons!15086 (h!16221 (_ BitVec 64)) (t!21399 List!15090)) )
))
(declare-fun arrayNoDuplicates!0 (array!44575 (_ BitVec 32) List!15090) Bool)

(assert (=> b!815039 (= res!556455 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15087))))

(declare-fun b!815040 () Bool)

(declare-fun e!451822 () Bool)

(assert (=> b!815040 (= e!451822 tp_is_empty!14185)))

(declare-fun b!815041 () Bool)

(declare-fun e!451823 () Bool)

(assert (=> b!815041 (= e!451823 tp_is_empty!14185)))

(declare-fun mapIsEmpty!22858 () Bool)

(declare-fun mapRes!22858 () Bool)

(assert (=> mapIsEmpty!22858 mapRes!22858))

(declare-fun mapNonEmpty!22858 () Bool)

(declare-fun tp!44139 () Bool)

(assert (=> mapNonEmpty!22858 (= mapRes!22858 (and tp!44139 e!451822))))

(declare-fun mapKey!22858 () (_ BitVec 32))

(declare-fun mapRest!22858 () (Array (_ BitVec 32) ValueCell!6677))

(declare-fun mapValue!22858 () ValueCell!6677)

(assert (=> mapNonEmpty!22858 (= (arr!21344 _values!788) (store mapRest!22858 mapKey!22858 mapValue!22858))))

(declare-fun b!815042 () Bool)

(assert (=> b!815042 (= e!451826 (and e!451823 mapRes!22858))))

(declare-fun condMapEmpty!22858 () Bool)

(declare-fun mapDefault!22858 () ValueCell!6677)

(assert (=> b!815042 (= condMapEmpty!22858 (= (arr!21344 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6677)) mapDefault!22858)))))

(assert (= (and start!70220 res!556456) b!815036))

(assert (= (and b!815036 res!556453) b!815037))

(assert (= (and b!815037 res!556454) b!815039))

(assert (= (and b!815039 res!556455) b!815038))

(assert (= (and b!815042 condMapEmpty!22858) mapIsEmpty!22858))

(assert (= (and b!815042 (not condMapEmpty!22858)) mapNonEmpty!22858))

(get-info :version)

(assert (= (and mapNonEmpty!22858 ((_ is ValueCellFull!6677) mapValue!22858)) b!815040))

(assert (= (and b!815042 ((_ is ValueCellFull!6677) mapDefault!22858)) b!815041))

(assert (= start!70220 b!815042))

(declare-fun m!757287 () Bool)

(assert (=> start!70220 m!757287))

(declare-fun m!757289 () Bool)

(assert (=> start!70220 m!757289))

(declare-fun m!757291 () Bool)

(assert (=> start!70220 m!757291))

(declare-fun m!757293 () Bool)

(assert (=> b!815039 m!757293))

(declare-fun m!757295 () Bool)

(assert (=> b!815037 m!757295))

(declare-fun m!757297 () Bool)

(assert (=> b!815038 m!757297))

(declare-fun m!757299 () Bool)

(assert (=> b!815038 m!757299))

(declare-fun m!757301 () Bool)

(assert (=> mapNonEmpty!22858 m!757301))

(check-sat (not b!815037) (not mapNonEmpty!22858) (not b!815039) (not start!70220) (not b_next!12475) (not b!815038) tp_is_empty!14185 b_and!21257)
(check-sat b_and!21257 (not b_next!12475))
