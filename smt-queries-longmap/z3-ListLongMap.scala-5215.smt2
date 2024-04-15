; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70320 () Bool)

(assert start!70320)

(declare-fun b_free!12697 () Bool)

(declare-fun b_next!12697 () Bool)

(assert (=> start!70320 (= b_free!12697 (not b_next!12697))))

(declare-fun tp!44818 () Bool)

(declare-fun b_and!21483 () Bool)

(assert (=> start!70320 (= tp!44818 b_and!21483)))

(declare-fun b!816927 () Bool)

(declare-fun e!453253 () Bool)

(declare-fun e!453252 () Bool)

(declare-fun mapRes!23203 () Bool)

(assert (=> b!816927 (= e!453253 (and e!453252 mapRes!23203))))

(declare-fun condMapEmpty!23203 () Bool)

(declare-datatypes ((V!24211 0))(
  ( (V!24212 (val!7251 Int)) )
))
(declare-datatypes ((ValueCell!6788 0))(
  ( (ValueCellFull!6788 (v!9674 V!24211)) (EmptyCell!6788) )
))
(declare-datatypes ((array!44993 0))(
  ( (array!44994 (arr!21553 (Array (_ BitVec 32) ValueCell!6788)) (size!21974 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44993)

(declare-fun mapDefault!23203 () ValueCell!6788)

(assert (=> b!816927 (= condMapEmpty!23203 (= (arr!21553 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6788)) mapDefault!23203)))))

(declare-fun b!816928 () Bool)

(declare-fun res!557722 () Bool)

(declare-fun e!453255 () Bool)

(assert (=> b!816928 (=> (not res!557722) (not e!453255))))

(declare-datatypes ((array!44995 0))(
  ( (array!44996 (arr!21554 (Array (_ BitVec 32) (_ BitVec 64))) (size!21975 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44995)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44995 (_ BitVec 32)) Bool)

(assert (=> b!816928 (= res!557722 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!23203 () Bool)

(assert (=> mapIsEmpty!23203 mapRes!23203))

(declare-fun b!816929 () Bool)

(declare-fun e!453251 () Bool)

(declare-fun tp_is_empty!14407 () Bool)

(assert (=> b!816929 (= e!453251 tp_is_empty!14407)))

(declare-fun b!816930 () Bool)

(declare-fun res!557721 () Bool)

(assert (=> b!816930 (=> (not res!557721) (not e!453255))))

(declare-datatypes ((List!15370 0))(
  ( (Nil!15367) (Cons!15366 (h!16495 (_ BitVec 64)) (t!21686 List!15370)) )
))
(declare-fun arrayNoDuplicates!0 (array!44995 (_ BitVec 32) List!15370) Bool)

(assert (=> b!816930 (= res!557721 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15367))))

(declare-fun res!557724 () Bool)

(assert (=> start!70320 (=> (not res!557724) (not e!453255))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70320 (= res!557724 (validMask!0 mask!1312))))

(assert (=> start!70320 e!453255))

(assert (=> start!70320 tp_is_empty!14407))

(declare-fun array_inv!17315 (array!44995) Bool)

(assert (=> start!70320 (array_inv!17315 _keys!976)))

(assert (=> start!70320 true))

(declare-fun array_inv!17316 (array!44993) Bool)

(assert (=> start!70320 (and (array_inv!17316 _values!788) e!453253)))

(assert (=> start!70320 tp!44818))

(declare-fun b!816931 () Bool)

(assert (=> b!816931 (= e!453252 tp_is_empty!14407)))

(declare-fun b!816932 () Bool)

(assert (=> b!816932 (= e!453255 (not true))))

(declare-datatypes ((tuple2!9548 0))(
  ( (tuple2!9549 (_1!4785 (_ BitVec 64)) (_2!4785 V!24211)) )
))
(declare-datatypes ((List!15371 0))(
  ( (Nil!15368) (Cons!15367 (h!16496 tuple2!9548) (t!21687 List!15371)) )
))
(declare-datatypes ((ListLongMap!8361 0))(
  ( (ListLongMap!8362 (toList!4196 List!15371)) )
))
(declare-fun lt!365893 () ListLongMap!8361)

(declare-fun lt!365894 () ListLongMap!8361)

(assert (=> b!816932 (= lt!365893 lt!365894)))

(declare-fun zeroValueBefore!34 () V!24211)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24211)

(declare-fun minValue!754 () V!24211)

(declare-datatypes ((Unit!27820 0))(
  ( (Unit!27821) )
))
(declare-fun lt!365895 () Unit!27820)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!349 (array!44995 array!44993 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24211 V!24211 V!24211 V!24211 (_ BitVec 32) Int) Unit!27820)

(assert (=> b!816932 (= lt!365895 (lemmaNoChangeToArrayThenSameMapNoExtras!349 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2256 (array!44995 array!44993 (_ BitVec 32) (_ BitVec 32) V!24211 V!24211 (_ BitVec 32) Int) ListLongMap!8361)

(assert (=> b!816932 (= lt!365894 (getCurrentListMapNoExtraKeys!2256 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!816932 (= lt!365893 (getCurrentListMapNoExtraKeys!2256 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!816933 () Bool)

(declare-fun res!557723 () Bool)

(assert (=> b!816933 (=> (not res!557723) (not e!453255))))

(assert (=> b!816933 (= res!557723 (and (= (size!21974 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21975 _keys!976) (size!21974 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!23203 () Bool)

(declare-fun tp!44817 () Bool)

(assert (=> mapNonEmpty!23203 (= mapRes!23203 (and tp!44817 e!453251))))

(declare-fun mapRest!23203 () (Array (_ BitVec 32) ValueCell!6788))

(declare-fun mapKey!23203 () (_ BitVec 32))

(declare-fun mapValue!23203 () ValueCell!6788)

(assert (=> mapNonEmpty!23203 (= (arr!21553 _values!788) (store mapRest!23203 mapKey!23203 mapValue!23203))))

(assert (= (and start!70320 res!557724) b!816933))

(assert (= (and b!816933 res!557723) b!816928))

(assert (= (and b!816928 res!557722) b!816930))

(assert (= (and b!816930 res!557721) b!816932))

(assert (= (and b!816927 condMapEmpty!23203) mapIsEmpty!23203))

(assert (= (and b!816927 (not condMapEmpty!23203)) mapNonEmpty!23203))

(get-info :version)

(assert (= (and mapNonEmpty!23203 ((_ is ValueCellFull!6788) mapValue!23203)) b!816929))

(assert (= (and b!816927 ((_ is ValueCellFull!6788) mapDefault!23203)) b!816931))

(assert (= start!70320 b!816927))

(declare-fun m!758041 () Bool)

(assert (=> b!816928 m!758041))

(declare-fun m!758043 () Bool)

(assert (=> mapNonEmpty!23203 m!758043))

(declare-fun m!758045 () Bool)

(assert (=> b!816930 m!758045))

(declare-fun m!758047 () Bool)

(assert (=> start!70320 m!758047))

(declare-fun m!758049 () Bool)

(assert (=> start!70320 m!758049))

(declare-fun m!758051 () Bool)

(assert (=> start!70320 m!758051))

(declare-fun m!758053 () Bool)

(assert (=> b!816932 m!758053))

(declare-fun m!758055 () Bool)

(assert (=> b!816932 m!758055))

(declare-fun m!758057 () Bool)

(assert (=> b!816932 m!758057))

(check-sat (not start!70320) (not b!816930) (not b_next!12697) tp_is_empty!14407 (not mapNonEmpty!23203) (not b!816928) (not b!816932) b_and!21483)
(check-sat b_and!21483 (not b_next!12697))
