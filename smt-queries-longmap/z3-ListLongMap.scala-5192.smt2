; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70318 () Bool)

(assert start!70318)

(declare-fun b_free!12559 () Bool)

(declare-fun b_next!12559 () Bool)

(assert (=> start!70318 (= b_free!12559 (not b_next!12559))))

(declare-fun tp!44394 () Bool)

(declare-fun b_and!21349 () Bool)

(assert (=> start!70318 (= tp!44394 b_and!21349)))

(declare-fun b!816003 () Bool)

(declare-fun res!556989 () Bool)

(declare-fun e!452508 () Bool)

(assert (=> b!816003 (=> (not res!556989) (not e!452508))))

(declare-datatypes ((array!44737 0))(
  ( (array!44738 (arr!21423 (Array (_ BitVec 32) (_ BitVec 64))) (size!21843 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44737)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24027 0))(
  ( (V!24028 (val!7182 Int)) )
))
(declare-datatypes ((ValueCell!6719 0))(
  ( (ValueCellFull!6719 (v!9609 V!24027)) (EmptyCell!6719) )
))
(declare-datatypes ((array!44739 0))(
  ( (array!44740 (arr!21424 (Array (_ BitVec 32) ValueCell!6719)) (size!21844 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44739)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!816003 (= res!556989 (and (= (size!21844 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21843 _keys!976) (size!21844 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!22987 () Bool)

(declare-fun mapRes!22987 () Bool)

(assert (=> mapIsEmpty!22987 mapRes!22987))

(declare-fun b!816004 () Bool)

(assert (=> b!816004 (= e!452508 (not true))))

(declare-datatypes ((tuple2!9334 0))(
  ( (tuple2!9335 (_1!4678 (_ BitVec 64)) (_2!4678 V!24027)) )
))
(declare-datatypes ((List!15150 0))(
  ( (Nil!15147) (Cons!15146 (h!16281 tuple2!9334) (t!21461 List!15150)) )
))
(declare-datatypes ((ListLongMap!8159 0))(
  ( (ListLongMap!8160 (toList!4095 List!15150)) )
))
(declare-fun lt!365261 () ListLongMap!8159)

(declare-fun lt!365263 () ListLongMap!8159)

(assert (=> b!816004 (= lt!365261 lt!365263)))

(declare-fun zeroValueBefore!34 () V!24027)

(declare-datatypes ((Unit!27757 0))(
  ( (Unit!27758) )
))
(declare-fun lt!365262 () Unit!27757)

(declare-fun zeroValueAfter!34 () V!24027)

(declare-fun minValue!754 () V!24027)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!290 (array!44737 array!44739 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24027 V!24027 V!24027 V!24027 (_ BitVec 32) Int) Unit!27757)

(assert (=> b!816004 (= lt!365262 (lemmaNoChangeToArrayThenSameMapNoExtras!290 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2202 (array!44737 array!44739 (_ BitVec 32) (_ BitVec 32) V!24027 V!24027 (_ BitVec 32) Int) ListLongMap!8159)

(assert (=> b!816004 (= lt!365263 (getCurrentListMapNoExtraKeys!2202 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!816004 (= lt!365261 (getCurrentListMapNoExtraKeys!2202 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!816005 () Bool)

(declare-fun e!452510 () Bool)

(declare-fun tp_is_empty!14269 () Bool)

(assert (=> b!816005 (= e!452510 tp_is_empty!14269)))

(declare-fun res!556991 () Bool)

(assert (=> start!70318 (=> (not res!556991) (not e!452508))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70318 (= res!556991 (validMask!0 mask!1312))))

(assert (=> start!70318 e!452508))

(assert (=> start!70318 tp_is_empty!14269))

(declare-fun array_inv!17183 (array!44737) Bool)

(assert (=> start!70318 (array_inv!17183 _keys!976)))

(assert (=> start!70318 true))

(declare-fun e!452507 () Bool)

(declare-fun array_inv!17184 (array!44739) Bool)

(assert (=> start!70318 (and (array_inv!17184 _values!788) e!452507)))

(assert (=> start!70318 tp!44394))

(declare-fun b!816006 () Bool)

(declare-fun e!452509 () Bool)

(assert (=> b!816006 (= e!452507 (and e!452509 mapRes!22987))))

(declare-fun condMapEmpty!22987 () Bool)

(declare-fun mapDefault!22987 () ValueCell!6719)

(assert (=> b!816006 (= condMapEmpty!22987 (= (arr!21424 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6719)) mapDefault!22987)))))

(declare-fun b!816007 () Bool)

(assert (=> b!816007 (= e!452509 tp_is_empty!14269)))

(declare-fun mapNonEmpty!22987 () Bool)

(declare-fun tp!44395 () Bool)

(assert (=> mapNonEmpty!22987 (= mapRes!22987 (and tp!44395 e!452510))))

(declare-fun mapRest!22987 () (Array (_ BitVec 32) ValueCell!6719))

(declare-fun mapKey!22987 () (_ BitVec 32))

(declare-fun mapValue!22987 () ValueCell!6719)

(assert (=> mapNonEmpty!22987 (= (arr!21424 _values!788) (store mapRest!22987 mapKey!22987 mapValue!22987))))

(declare-fun b!816008 () Bool)

(declare-fun res!556990 () Bool)

(assert (=> b!816008 (=> (not res!556990) (not e!452508))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44737 (_ BitVec 32)) Bool)

(assert (=> b!816008 (= res!556990 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!816009 () Bool)

(declare-fun res!556988 () Bool)

(assert (=> b!816009 (=> (not res!556988) (not e!452508))))

(declare-datatypes ((List!15151 0))(
  ( (Nil!15148) (Cons!15147 (h!16282 (_ BitVec 64)) (t!21462 List!15151)) )
))
(declare-fun arrayNoDuplicates!0 (array!44737 (_ BitVec 32) List!15151) Bool)

(assert (=> b!816009 (= res!556988 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15148))))

(assert (= (and start!70318 res!556991) b!816003))

(assert (= (and b!816003 res!556989) b!816008))

(assert (= (and b!816008 res!556990) b!816009))

(assert (= (and b!816009 res!556988) b!816004))

(assert (= (and b!816006 condMapEmpty!22987) mapIsEmpty!22987))

(assert (= (and b!816006 (not condMapEmpty!22987)) mapNonEmpty!22987))

(get-info :version)

(assert (= (and mapNonEmpty!22987 ((_ is ValueCellFull!6719) mapValue!22987)) b!816005))

(assert (= (and b!816006 ((_ is ValueCellFull!6719) mapDefault!22987)) b!816007))

(assert (= start!70318 b!816006))

(declare-fun m!758103 () Bool)

(assert (=> start!70318 m!758103))

(declare-fun m!758105 () Bool)

(assert (=> start!70318 m!758105))

(declare-fun m!758107 () Bool)

(assert (=> start!70318 m!758107))

(declare-fun m!758109 () Bool)

(assert (=> b!816008 m!758109))

(declare-fun m!758111 () Bool)

(assert (=> b!816004 m!758111))

(declare-fun m!758113 () Bool)

(assert (=> b!816004 m!758113))

(declare-fun m!758115 () Bool)

(assert (=> b!816004 m!758115))

(declare-fun m!758117 () Bool)

(assert (=> mapNonEmpty!22987 m!758117))

(declare-fun m!758119 () Bool)

(assert (=> b!816009 m!758119))

(check-sat (not b!816004) (not b!816008) (not b!816009) (not mapNonEmpty!22987) tp_is_empty!14269 (not b_next!12559) (not start!70318) b_and!21349)
(check-sat b_and!21349 (not b_next!12559))
