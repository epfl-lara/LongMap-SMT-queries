; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70034 () Bool)

(assert start!70034)

(declare-fun b_free!12475 () Bool)

(declare-fun b_next!12475 () Bool)

(assert (=> start!70034 (= b_free!12475 (not b_next!12475))))

(declare-fun tp!44139 () Bool)

(declare-fun b_and!21221 () Bool)

(assert (=> start!70034 (= tp!44139 b_and!21221)))

(declare-fun res!556004 () Bool)

(declare-fun e!451098 () Bool)

(assert (=> start!70034 (=> (not res!556004) (not e!451098))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70034 (= res!556004 (validMask!0 mask!1312))))

(assert (=> start!70034 e!451098))

(declare-fun tp_is_empty!14185 () Bool)

(assert (=> start!70034 tp_is_empty!14185))

(declare-datatypes ((array!44571 0))(
  ( (array!44572 (arr!21346 (Array (_ BitVec 32) (_ BitVec 64))) (size!21767 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44571)

(declare-fun array_inv!17169 (array!44571) Bool)

(assert (=> start!70034 (array_inv!17169 _keys!976)))

(assert (=> start!70034 true))

(declare-datatypes ((V!23915 0))(
  ( (V!23916 (val!7140 Int)) )
))
(declare-datatypes ((ValueCell!6677 0))(
  ( (ValueCellFull!6677 (v!9561 V!23915)) (EmptyCell!6677) )
))
(declare-datatypes ((array!44573 0))(
  ( (array!44574 (arr!21347 (Array (_ BitVec 32) ValueCell!6677)) (size!21768 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44573)

(declare-fun e!451097 () Bool)

(declare-fun array_inv!17170 (array!44573) Bool)

(assert (=> start!70034 (and (array_inv!17170 _values!788) e!451097)))

(assert (=> start!70034 tp!44139))

(declare-fun b!813896 () Bool)

(declare-fun res!556001 () Bool)

(assert (=> b!813896 (=> (not res!556001) (not e!451098))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44571 (_ BitVec 32)) Bool)

(assert (=> b!813896 (= res!556001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!813897 () Bool)

(declare-fun e!451096 () Bool)

(assert (=> b!813897 (= e!451096 tp_is_empty!14185)))

(declare-fun b!813898 () Bool)

(assert (=> b!813898 (= e!451098 false)))

(declare-fun zeroValueAfter!34 () V!23915)

(declare-fun minValue!754 () V!23915)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9392 0))(
  ( (tuple2!9393 (_1!4707 (_ BitVec 64)) (_2!4707 V!23915)) )
))
(declare-datatypes ((List!15219 0))(
  ( (Nil!15216) (Cons!15215 (h!16344 tuple2!9392) (t!21527 List!15219)) )
))
(declare-datatypes ((ListLongMap!8205 0))(
  ( (ListLongMap!8206 (toList!4118 List!15219)) )
))
(declare-fun lt!364254 () ListLongMap!8205)

(declare-fun getCurrentListMapNoExtraKeys!2183 (array!44571 array!44573 (_ BitVec 32) (_ BitVec 32) V!23915 V!23915 (_ BitVec 32) Int) ListLongMap!8205)

(assert (=> b!813898 (= lt!364254 (getCurrentListMapNoExtraKeys!2183 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!23915)

(declare-fun lt!364253 () ListLongMap!8205)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!813898 (= lt!364253 (getCurrentListMapNoExtraKeys!2183 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!813899 () Bool)

(declare-fun res!556003 () Bool)

(assert (=> b!813899 (=> (not res!556003) (not e!451098))))

(assert (=> b!813899 (= res!556003 (and (= (size!21768 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21767 _keys!976) (size!21768 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!22858 () Bool)

(declare-fun mapRes!22858 () Bool)

(declare-fun tp!44140 () Bool)

(assert (=> mapNonEmpty!22858 (= mapRes!22858 (and tp!44140 e!451096))))

(declare-fun mapRest!22858 () (Array (_ BitVec 32) ValueCell!6677))

(declare-fun mapValue!22858 () ValueCell!6677)

(declare-fun mapKey!22858 () (_ BitVec 32))

(assert (=> mapNonEmpty!22858 (= (arr!21347 _values!788) (store mapRest!22858 mapKey!22858 mapValue!22858))))

(declare-fun b!813900 () Bool)

(declare-fun res!556002 () Bool)

(assert (=> b!813900 (=> (not res!556002) (not e!451098))))

(declare-datatypes ((List!15220 0))(
  ( (Nil!15217) (Cons!15216 (h!16345 (_ BitVec 64)) (t!21528 List!15220)) )
))
(declare-fun arrayNoDuplicates!0 (array!44571 (_ BitVec 32) List!15220) Bool)

(assert (=> b!813900 (= res!556002 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15217))))

(declare-fun mapIsEmpty!22858 () Bool)

(assert (=> mapIsEmpty!22858 mapRes!22858))

(declare-fun b!813901 () Bool)

(declare-fun e!451094 () Bool)

(assert (=> b!813901 (= e!451094 tp_is_empty!14185)))

(declare-fun b!813902 () Bool)

(assert (=> b!813902 (= e!451097 (and e!451094 mapRes!22858))))

(declare-fun condMapEmpty!22858 () Bool)

(declare-fun mapDefault!22858 () ValueCell!6677)

(assert (=> b!813902 (= condMapEmpty!22858 (= (arr!21347 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6677)) mapDefault!22858)))))

(assert (= (and start!70034 res!556004) b!813899))

(assert (= (and b!813899 res!556003) b!813896))

(assert (= (and b!813896 res!556001) b!813900))

(assert (= (and b!813900 res!556002) b!813898))

(assert (= (and b!813902 condMapEmpty!22858) mapIsEmpty!22858))

(assert (= (and b!813902 (not condMapEmpty!22858)) mapNonEmpty!22858))

(get-info :version)

(assert (= (and mapNonEmpty!22858 ((_ is ValueCellFull!6677) mapValue!22858)) b!813897))

(assert (= (and b!813902 ((_ is ValueCellFull!6677) mapDefault!22858)) b!813901))

(assert (= start!70034 b!813902))

(declare-fun m!755253 () Bool)

(assert (=> mapNonEmpty!22858 m!755253))

(declare-fun m!755255 () Bool)

(assert (=> start!70034 m!755255))

(declare-fun m!755257 () Bool)

(assert (=> start!70034 m!755257))

(declare-fun m!755259 () Bool)

(assert (=> start!70034 m!755259))

(declare-fun m!755261 () Bool)

(assert (=> b!813898 m!755261))

(declare-fun m!755263 () Bool)

(assert (=> b!813898 m!755263))

(declare-fun m!755265 () Bool)

(assert (=> b!813896 m!755265))

(declare-fun m!755267 () Bool)

(assert (=> b!813900 m!755267))

(check-sat (not mapNonEmpty!22858) tp_is_empty!14185 (not b!813898) (not start!70034) (not b!813900) (not b_next!12475) b_and!21221 (not b!813896))
(check-sat b_and!21221 (not b_next!12475))
