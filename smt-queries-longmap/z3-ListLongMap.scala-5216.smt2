; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70512 () Bool)

(assert start!70512)

(declare-fun b_free!12703 () Bool)

(declare-fun b_next!12703 () Bool)

(assert (=> start!70512 (= b_free!12703 (not b_next!12703))))

(declare-fun tp!44836 () Bool)

(declare-fun b_and!21525 () Bool)

(assert (=> start!70512 (= tp!44836 b_and!21525)))

(declare-fun b!818130 () Bool)

(declare-fun res!558209 () Bool)

(declare-fun e!454024 () Bool)

(assert (=> b!818130 (=> (not res!558209) (not e!454024))))

(declare-datatypes ((array!45027 0))(
  ( (array!45028 (arr!21565 (Array (_ BitVec 32) (_ BitVec 64))) (size!21985 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45027)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45027 (_ BitVec 32)) Bool)

(assert (=> b!818130 (= res!558209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!818131 () Bool)

(assert (=> b!818131 (= e!454024 (not true))))

(declare-datatypes ((V!24219 0))(
  ( (V!24220 (val!7254 Int)) )
))
(declare-datatypes ((tuple2!9440 0))(
  ( (tuple2!9441 (_1!4731 (_ BitVec 64)) (_2!4731 V!24219)) )
))
(declare-datatypes ((List!15252 0))(
  ( (Nil!15249) (Cons!15248 (h!16383 tuple2!9440) (t!21569 List!15252)) )
))
(declare-datatypes ((ListLongMap!8265 0))(
  ( (ListLongMap!8266 (toList!4148 List!15252)) )
))
(declare-fun lt!366519 () ListLongMap!8265)

(declare-fun lt!366518 () ListLongMap!8265)

(assert (=> b!818131 (= lt!366519 lt!366518)))

(declare-datatypes ((Unit!27851 0))(
  ( (Unit!27852) )
))
(declare-fun lt!366517 () Unit!27851)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24219)

(declare-fun minValue!754 () V!24219)

(declare-datatypes ((ValueCell!6791 0))(
  ( (ValueCellFull!6791 (v!9683 V!24219)) (EmptyCell!6791) )
))
(declare-datatypes ((array!45029 0))(
  ( (array!45030 (arr!21566 (Array (_ BitVec 32) ValueCell!6791)) (size!21986 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45029)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun zeroValueBefore!34 () V!24219)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!335 (array!45027 array!45029 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24219 V!24219 V!24219 V!24219 (_ BitVec 32) Int) Unit!27851)

(assert (=> b!818131 (= lt!366517 (lemmaNoChangeToArrayThenSameMapNoExtras!335 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2247 (array!45027 array!45029 (_ BitVec 32) (_ BitVec 32) V!24219 V!24219 (_ BitVec 32) Int) ListLongMap!8265)

(assert (=> b!818131 (= lt!366518 (getCurrentListMapNoExtraKeys!2247 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818131 (= lt!366519 (getCurrentListMapNoExtraKeys!2247 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23212 () Bool)

(declare-fun mapRes!23212 () Bool)

(assert (=> mapIsEmpty!23212 mapRes!23212))

(declare-fun res!558212 () Bool)

(assert (=> start!70512 (=> (not res!558212) (not e!454024))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70512 (= res!558212 (validMask!0 mask!1312))))

(assert (=> start!70512 e!454024))

(declare-fun tp_is_empty!14413 () Bool)

(assert (=> start!70512 tp_is_empty!14413))

(declare-fun array_inv!17277 (array!45027) Bool)

(assert (=> start!70512 (array_inv!17277 _keys!976)))

(assert (=> start!70512 true))

(declare-fun e!454025 () Bool)

(declare-fun array_inv!17278 (array!45029) Bool)

(assert (=> start!70512 (and (array_inv!17278 _values!788) e!454025)))

(assert (=> start!70512 tp!44836))

(declare-fun b!818132 () Bool)

(declare-fun e!454027 () Bool)

(assert (=> b!818132 (= e!454027 tp_is_empty!14413)))

(declare-fun b!818133 () Bool)

(declare-fun res!558211 () Bool)

(assert (=> b!818133 (=> (not res!558211) (not e!454024))))

(declare-datatypes ((List!15253 0))(
  ( (Nil!15250) (Cons!15249 (h!16384 (_ BitVec 64)) (t!21570 List!15253)) )
))
(declare-fun arrayNoDuplicates!0 (array!45027 (_ BitVec 32) List!15253) Bool)

(assert (=> b!818133 (= res!558211 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15250))))

(declare-fun mapNonEmpty!23212 () Bool)

(declare-fun tp!44835 () Bool)

(assert (=> mapNonEmpty!23212 (= mapRes!23212 (and tp!44835 e!454027))))

(declare-fun mapRest!23212 () (Array (_ BitVec 32) ValueCell!6791))

(declare-fun mapValue!23212 () ValueCell!6791)

(declare-fun mapKey!23212 () (_ BitVec 32))

(assert (=> mapNonEmpty!23212 (= (arr!21566 _values!788) (store mapRest!23212 mapKey!23212 mapValue!23212))))

(declare-fun b!818134 () Bool)

(declare-fun e!454028 () Bool)

(assert (=> b!818134 (= e!454025 (and e!454028 mapRes!23212))))

(declare-fun condMapEmpty!23212 () Bool)

(declare-fun mapDefault!23212 () ValueCell!6791)

(assert (=> b!818134 (= condMapEmpty!23212 (= (arr!21566 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6791)) mapDefault!23212)))))

(declare-fun b!818135 () Bool)

(declare-fun res!558210 () Bool)

(assert (=> b!818135 (=> (not res!558210) (not e!454024))))

(assert (=> b!818135 (= res!558210 (and (= (size!21986 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21985 _keys!976) (size!21986 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!818136 () Bool)

(assert (=> b!818136 (= e!454028 tp_is_empty!14413)))

(assert (= (and start!70512 res!558212) b!818135))

(assert (= (and b!818135 res!558210) b!818130))

(assert (= (and b!818130 res!558209) b!818133))

(assert (= (and b!818133 res!558211) b!818131))

(assert (= (and b!818134 condMapEmpty!23212) mapIsEmpty!23212))

(assert (= (and b!818134 (not condMapEmpty!23212)) mapNonEmpty!23212))

(get-info :version)

(assert (= (and mapNonEmpty!23212 ((_ is ValueCellFull!6791) mapValue!23212)) b!818132))

(assert (= (and b!818134 ((_ is ValueCellFull!6791) mapDefault!23212)) b!818136))

(assert (= start!70512 b!818134))

(declare-fun m!760129 () Bool)

(assert (=> b!818131 m!760129))

(declare-fun m!760131 () Bool)

(assert (=> b!818131 m!760131))

(declare-fun m!760133 () Bool)

(assert (=> b!818131 m!760133))

(declare-fun m!760135 () Bool)

(assert (=> start!70512 m!760135))

(declare-fun m!760137 () Bool)

(assert (=> start!70512 m!760137))

(declare-fun m!760139 () Bool)

(assert (=> start!70512 m!760139))

(declare-fun m!760141 () Bool)

(assert (=> b!818130 m!760141))

(declare-fun m!760143 () Bool)

(assert (=> b!818133 m!760143))

(declare-fun m!760145 () Bool)

(assert (=> mapNonEmpty!23212 m!760145))

(check-sat (not b!818131) (not mapNonEmpty!23212) (not b_next!12703) tp_is_empty!14413 (not start!70512) b_and!21525 (not b!818133) (not b!818130))
(check-sat b_and!21525 (not b_next!12703))
