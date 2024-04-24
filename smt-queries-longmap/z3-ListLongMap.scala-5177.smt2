; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70214 () Bool)

(assert start!70214)

(declare-fun b_free!12469 () Bool)

(declare-fun b_next!12469 () Bool)

(assert (=> start!70214 (= b_free!12469 (not b_next!12469))))

(declare-fun tp!44122 () Bool)

(declare-fun b_and!21251 () Bool)

(assert (=> start!70214 (= tp!44122 b_and!21251)))

(declare-fun b!814973 () Bool)

(declare-fun e!451781 () Bool)

(assert (=> b!814973 (= e!451781 false)))

(declare-datatypes ((V!23907 0))(
  ( (V!23908 (val!7137 Int)) )
))
(declare-fun zeroValueAfter!34 () V!23907)

(declare-datatypes ((ValueCell!6674 0))(
  ( (ValueCellFull!6674 (v!9564 V!23907)) (EmptyCell!6674) )
))
(declare-datatypes ((array!44563 0))(
  ( (array!44564 (arr!21337 (Array (_ BitVec 32) ValueCell!6674)) (size!21757 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44563)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((array!44565 0))(
  ( (array!44566 (arr!21338 (Array (_ BitVec 32) (_ BitVec 64))) (size!21758 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44565)

(declare-fun minValue!754 () V!23907)

(declare-datatypes ((tuple2!9264 0))(
  ( (tuple2!9265 (_1!4643 (_ BitVec 64)) (_2!4643 V!23907)) )
))
(declare-datatypes ((List!15084 0))(
  ( (Nil!15081) (Cons!15080 (h!16215 tuple2!9264) (t!21393 List!15084)) )
))
(declare-datatypes ((ListLongMap!8089 0))(
  ( (ListLongMap!8090 (toList!4060 List!15084)) )
))
(declare-fun lt!364833 () ListLongMap!8089)

(declare-fun getCurrentListMapNoExtraKeys!2167 (array!44565 array!44563 (_ BitVec 32) (_ BitVec 32) V!23907 V!23907 (_ BitVec 32) Int) ListLongMap!8089)

(assert (=> b!814973 (= lt!364833 (getCurrentListMapNoExtraKeys!2167 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!23907)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!364832 () ListLongMap!8089)

(assert (=> b!814973 (= lt!364832 (getCurrentListMapNoExtraKeys!2167 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!814974 () Bool)

(declare-fun res!556419 () Bool)

(assert (=> b!814974 (=> (not res!556419) (not e!451781))))

(assert (=> b!814974 (= res!556419 (and (= (size!21757 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21758 _keys!976) (size!21757 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!556420 () Bool)

(assert (=> start!70214 (=> (not res!556420) (not e!451781))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70214 (= res!556420 (validMask!0 mask!1312))))

(assert (=> start!70214 e!451781))

(declare-fun tp_is_empty!14179 () Bool)

(assert (=> start!70214 tp_is_empty!14179))

(declare-fun array_inv!17133 (array!44565) Bool)

(assert (=> start!70214 (array_inv!17133 _keys!976)))

(assert (=> start!70214 true))

(declare-fun e!451779 () Bool)

(declare-fun array_inv!17134 (array!44563) Bool)

(assert (=> start!70214 (and (array_inv!17134 _values!788) e!451779)))

(assert (=> start!70214 tp!44122))

(declare-fun mapIsEmpty!22849 () Bool)

(declare-fun mapRes!22849 () Bool)

(assert (=> mapIsEmpty!22849 mapRes!22849))

(declare-fun mapNonEmpty!22849 () Bool)

(declare-fun tp!44121 () Bool)

(declare-fun e!451780 () Bool)

(assert (=> mapNonEmpty!22849 (= mapRes!22849 (and tp!44121 e!451780))))

(declare-fun mapKey!22849 () (_ BitVec 32))

(declare-fun mapValue!22849 () ValueCell!6674)

(declare-fun mapRest!22849 () (Array (_ BitVec 32) ValueCell!6674))

(assert (=> mapNonEmpty!22849 (= (arr!21337 _values!788) (store mapRest!22849 mapKey!22849 mapValue!22849))))

(declare-fun b!814975 () Bool)

(declare-fun e!451778 () Bool)

(assert (=> b!814975 (= e!451778 tp_is_empty!14179)))

(declare-fun b!814976 () Bool)

(declare-fun res!556417 () Bool)

(assert (=> b!814976 (=> (not res!556417) (not e!451781))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44565 (_ BitVec 32)) Bool)

(assert (=> b!814976 (= res!556417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!814977 () Bool)

(assert (=> b!814977 (= e!451779 (and e!451778 mapRes!22849))))

(declare-fun condMapEmpty!22849 () Bool)

(declare-fun mapDefault!22849 () ValueCell!6674)

(assert (=> b!814977 (= condMapEmpty!22849 (= (arr!21337 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6674)) mapDefault!22849)))))

(declare-fun b!814978 () Bool)

(assert (=> b!814978 (= e!451780 tp_is_empty!14179)))

(declare-fun b!814979 () Bool)

(declare-fun res!556418 () Bool)

(assert (=> b!814979 (=> (not res!556418) (not e!451781))))

(declare-datatypes ((List!15085 0))(
  ( (Nil!15082) (Cons!15081 (h!16216 (_ BitVec 64)) (t!21394 List!15085)) )
))
(declare-fun arrayNoDuplicates!0 (array!44565 (_ BitVec 32) List!15085) Bool)

(assert (=> b!814979 (= res!556418 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15082))))

(assert (= (and start!70214 res!556420) b!814974))

(assert (= (and b!814974 res!556419) b!814976))

(assert (= (and b!814976 res!556417) b!814979))

(assert (= (and b!814979 res!556418) b!814973))

(assert (= (and b!814977 condMapEmpty!22849) mapIsEmpty!22849))

(assert (= (and b!814977 (not condMapEmpty!22849)) mapNonEmpty!22849))

(get-info :version)

(assert (= (and mapNonEmpty!22849 ((_ is ValueCellFull!6674) mapValue!22849)) b!814978))

(assert (= (and b!814977 ((_ is ValueCellFull!6674) mapDefault!22849)) b!814975))

(assert (= start!70214 b!814977))

(declare-fun m!757239 () Bool)

(assert (=> mapNonEmpty!22849 m!757239))

(declare-fun m!757241 () Bool)

(assert (=> b!814976 m!757241))

(declare-fun m!757243 () Bool)

(assert (=> b!814979 m!757243))

(declare-fun m!757245 () Bool)

(assert (=> b!814973 m!757245))

(declare-fun m!757247 () Bool)

(assert (=> b!814973 m!757247))

(declare-fun m!757249 () Bool)

(assert (=> start!70214 m!757249))

(declare-fun m!757251 () Bool)

(assert (=> start!70214 m!757251))

(declare-fun m!757253 () Bool)

(assert (=> start!70214 m!757253))

(check-sat tp_is_empty!14179 b_and!21251 (not b_next!12469) (not b!814973) (not mapNonEmpty!22849) (not b!814979) (not start!70214) (not b!814976))
(check-sat b_and!21251 (not b_next!12469))
