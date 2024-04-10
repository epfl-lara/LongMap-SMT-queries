; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71212 () Bool)

(assert start!71212)

(declare-fun b_free!13359 () Bool)

(declare-fun b_next!13359 () Bool)

(assert (=> start!71212 (= b_free!13359 (not b_next!13359))))

(declare-fun tp!46839 () Bool)

(declare-fun b_and!22297 () Bool)

(assert (=> start!71212 (= tp!46839 b_and!22297)))

(declare-fun mapNonEmpty!24232 () Bool)

(declare-fun mapRes!24232 () Bool)

(declare-fun tp!46840 () Bool)

(declare-fun e!460783 () Bool)

(assert (=> mapNonEmpty!24232 (= mapRes!24232 (and tp!46840 e!460783))))

(declare-fun mapKey!24232 () (_ BitVec 32))

(declare-datatypes ((V!25093 0))(
  ( (V!25094 (val!7582 Int)) )
))
(declare-datatypes ((ValueCell!7119 0))(
  ( (ValueCellFull!7119 (v!10017 V!25093)) (EmptyCell!7119) )
))
(declare-fun mapValue!24232 () ValueCell!7119)

(declare-datatypes ((array!46316 0))(
  ( (array!46317 (arr!22202 (Array (_ BitVec 32) ValueCell!7119)) (size!22623 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46316)

(declare-fun mapRest!24232 () (Array (_ BitVec 32) ValueCell!7119))

(assert (=> mapNonEmpty!24232 (= (arr!22202 _values!788) (store mapRest!24232 mapKey!24232 mapValue!24232))))

(declare-fun b!827218 () Bool)

(declare-fun e!460781 () Bool)

(declare-fun tp_is_empty!15069 () Bool)

(assert (=> b!827218 (= e!460781 tp_is_empty!15069)))

(declare-fun b!827219 () Bool)

(declare-fun res!563851 () Bool)

(declare-fun e!460780 () Bool)

(assert (=> b!827219 (=> (not res!563851) (not e!460780))))

(declare-datatypes ((array!46318 0))(
  ( (array!46319 (arr!22203 (Array (_ BitVec 32) (_ BitVec 64))) (size!22624 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46318)

(declare-datatypes ((List!15846 0))(
  ( (Nil!15843) (Cons!15842 (h!16971 (_ BitVec 64)) (t!22195 List!15846)) )
))
(declare-fun arrayNoDuplicates!0 (array!46318 (_ BitVec 32) List!15846) Bool)

(assert (=> b!827219 (= res!563851 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15843))))

(declare-fun res!563849 () Bool)

(assert (=> start!71212 (=> (not res!563849) (not e!460780))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71212 (= res!563849 (validMask!0 mask!1312))))

(assert (=> start!71212 e!460780))

(assert (=> start!71212 tp_is_empty!15069))

(declare-fun array_inv!17695 (array!46318) Bool)

(assert (=> start!71212 (array_inv!17695 _keys!976)))

(assert (=> start!71212 true))

(declare-fun e!460784 () Bool)

(declare-fun array_inv!17696 (array!46316) Bool)

(assert (=> start!71212 (and (array_inv!17696 _values!788) e!460784)))

(assert (=> start!71212 tp!46839))

(declare-fun mapIsEmpty!24232 () Bool)

(assert (=> mapIsEmpty!24232 mapRes!24232))

(declare-fun b!827220 () Bool)

(assert (=> b!827220 (= e!460784 (and e!460781 mapRes!24232))))

(declare-fun condMapEmpty!24232 () Bool)

(declare-fun mapDefault!24232 () ValueCell!7119)

(assert (=> b!827220 (= condMapEmpty!24232 (= (arr!22202 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7119)) mapDefault!24232)))))

(declare-fun b!827221 () Bool)

(assert (=> b!827221 (= e!460783 tp_is_empty!15069)))

(declare-fun b!827222 () Bool)

(declare-fun res!563850 () Bool)

(assert (=> b!827222 (=> (not res!563850) (not e!460780))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46318 (_ BitVec 32)) Bool)

(assert (=> b!827222 (= res!563850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!827223 () Bool)

(declare-fun res!563852 () Bool)

(assert (=> b!827223 (=> (not res!563852) (not e!460780))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!827223 (= res!563852 (and (= (size!22623 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22624 _keys!976) (size!22623 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!827224 () Bool)

(assert (=> b!827224 (= e!460780 false)))

(declare-fun zeroValueAfter!34 () V!25093)

(declare-fun minValue!754 () V!25093)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!10050 0))(
  ( (tuple2!10051 (_1!5036 (_ BitVec 64)) (_2!5036 V!25093)) )
))
(declare-datatypes ((List!15847 0))(
  ( (Nil!15844) (Cons!15843 (h!16972 tuple2!10050) (t!22196 List!15847)) )
))
(declare-datatypes ((ListLongMap!8873 0))(
  ( (ListLongMap!8874 (toList!4452 List!15847)) )
))
(declare-fun lt!374843 () ListLongMap!8873)

(declare-fun getCurrentListMapNoExtraKeys!2454 (array!46318 array!46316 (_ BitVec 32) (_ BitVec 32) V!25093 V!25093 (_ BitVec 32) Int) ListLongMap!8873)

(assert (=> b!827224 (= lt!374843 (getCurrentListMapNoExtraKeys!2454 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!25093)

(declare-fun lt!374842 () ListLongMap!8873)

(assert (=> b!827224 (= lt!374842 (getCurrentListMapNoExtraKeys!2454 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!71212 res!563849) b!827223))

(assert (= (and b!827223 res!563852) b!827222))

(assert (= (and b!827222 res!563850) b!827219))

(assert (= (and b!827219 res!563851) b!827224))

(assert (= (and b!827220 condMapEmpty!24232) mapIsEmpty!24232))

(assert (= (and b!827220 (not condMapEmpty!24232)) mapNonEmpty!24232))

(get-info :version)

(assert (= (and mapNonEmpty!24232 ((_ is ValueCellFull!7119) mapValue!24232)) b!827221))

(assert (= (and b!827220 ((_ is ValueCellFull!7119) mapDefault!24232)) b!827218))

(assert (= start!71212 b!827220))

(declare-fun m!770351 () Bool)

(assert (=> b!827219 m!770351))

(declare-fun m!770353 () Bool)

(assert (=> b!827222 m!770353))

(declare-fun m!770355 () Bool)

(assert (=> start!71212 m!770355))

(declare-fun m!770357 () Bool)

(assert (=> start!71212 m!770357))

(declare-fun m!770359 () Bool)

(assert (=> start!71212 m!770359))

(declare-fun m!770361 () Bool)

(assert (=> b!827224 m!770361))

(declare-fun m!770363 () Bool)

(assert (=> b!827224 m!770363))

(declare-fun m!770365 () Bool)

(assert (=> mapNonEmpty!24232 m!770365))

(check-sat (not b!827222) (not b!827224) (not b!827219) b_and!22297 (not start!71212) (not b_next!13359) (not mapNonEmpty!24232) tp_is_empty!15069)
(check-sat b_and!22297 (not b_next!13359))
