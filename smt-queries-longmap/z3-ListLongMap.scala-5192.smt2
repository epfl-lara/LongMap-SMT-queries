; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70132 () Bool)

(assert start!70132)

(declare-fun b_free!12559 () Bool)

(declare-fun b_next!12559 () Bool)

(assert (=> start!70132 (= b_free!12559 (not b_next!12559))))

(declare-fun tp!44395 () Bool)

(declare-fun b_and!21313 () Bool)

(assert (=> start!70132 (= tp!44395 b_and!21313)))

(declare-fun res!556537 () Bool)

(declare-fun e!451782 () Bool)

(assert (=> start!70132 (=> (not res!556537) (not e!451782))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70132 (= res!556537 (validMask!0 mask!1312))))

(assert (=> start!70132 e!451782))

(declare-fun tp_is_empty!14269 () Bool)

(assert (=> start!70132 tp_is_empty!14269))

(declare-datatypes ((array!44729 0))(
  ( (array!44730 (arr!21424 (Array (_ BitVec 32) (_ BitVec 64))) (size!21845 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44729)

(declare-fun array_inv!17221 (array!44729) Bool)

(assert (=> start!70132 (array_inv!17221 _keys!976)))

(assert (=> start!70132 true))

(declare-datatypes ((V!24027 0))(
  ( (V!24028 (val!7182 Int)) )
))
(declare-datatypes ((ValueCell!6719 0))(
  ( (ValueCellFull!6719 (v!9603 V!24027)) (EmptyCell!6719) )
))
(declare-datatypes ((array!44731 0))(
  ( (array!44732 (arr!21425 (Array (_ BitVec 32) ValueCell!6719)) (size!21846 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44731)

(declare-fun e!451783 () Bool)

(declare-fun array_inv!17222 (array!44731) Bool)

(assert (=> start!70132 (and (array_inv!17222 _values!788) e!451783)))

(assert (=> start!70132 tp!44395))

(declare-fun b!814863 () Bool)

(declare-fun e!451779 () Bool)

(declare-fun mapRes!22987 () Bool)

(assert (=> b!814863 (= e!451783 (and e!451779 mapRes!22987))))

(declare-fun condMapEmpty!22987 () Bool)

(declare-fun mapDefault!22987 () ValueCell!6719)

(assert (=> b!814863 (= condMapEmpty!22987 (= (arr!21425 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6719)) mapDefault!22987)))))

(declare-fun b!814864 () Bool)

(declare-fun res!556538 () Bool)

(assert (=> b!814864 (=> (not res!556538) (not e!451782))))

(declare-datatypes ((List!15269 0))(
  ( (Nil!15266) (Cons!15265 (h!16394 (_ BitVec 64)) (t!21579 List!15269)) )
))
(declare-fun arrayNoDuplicates!0 (array!44729 (_ BitVec 32) List!15269) Bool)

(assert (=> b!814864 (= res!556538 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15266))))

(declare-fun b!814865 () Bool)

(assert (=> b!814865 (= e!451782 (not true))))

(declare-datatypes ((tuple2!9440 0))(
  ( (tuple2!9441 (_1!4731 (_ BitVec 64)) (_2!4731 V!24027)) )
))
(declare-datatypes ((List!15270 0))(
  ( (Nil!15267) (Cons!15266 (h!16395 tuple2!9440) (t!21580 List!15270)) )
))
(declare-datatypes ((ListLongMap!8253 0))(
  ( (ListLongMap!8254 (toList!4142 List!15270)) )
))
(declare-fun lt!364664 () ListLongMap!8253)

(declare-fun lt!364665 () ListLongMap!8253)

(assert (=> b!814865 (= lt!364664 lt!364665)))

(declare-datatypes ((Unit!27718 0))(
  ( (Unit!27719) )
))
(declare-fun lt!364666 () Unit!27718)

(declare-fun zeroValueBefore!34 () V!24027)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24027)

(declare-fun minValue!754 () V!24027)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!300 (array!44729 array!44731 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24027 V!24027 V!24027 V!24027 (_ BitVec 32) Int) Unit!27718)

(assert (=> b!814865 (= lt!364666 (lemmaNoChangeToArrayThenSameMapNoExtras!300 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2207 (array!44729 array!44731 (_ BitVec 32) (_ BitVec 32) V!24027 V!24027 (_ BitVec 32) Int) ListLongMap!8253)

(assert (=> b!814865 (= lt!364665 (getCurrentListMapNoExtraKeys!2207 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!814865 (= lt!364664 (getCurrentListMapNoExtraKeys!2207 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!814866 () Bool)

(declare-fun res!556539 () Bool)

(assert (=> b!814866 (=> (not res!556539) (not e!451782))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44729 (_ BitVec 32)) Bool)

(assert (=> b!814866 (= res!556539 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!22987 () Bool)

(assert (=> mapIsEmpty!22987 mapRes!22987))

(declare-fun b!814867 () Bool)

(declare-fun e!451780 () Bool)

(assert (=> b!814867 (= e!451780 tp_is_empty!14269)))

(declare-fun b!814868 () Bool)

(declare-fun res!556536 () Bool)

(assert (=> b!814868 (=> (not res!556536) (not e!451782))))

(assert (=> b!814868 (= res!556536 (and (= (size!21846 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21845 _keys!976) (size!21846 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!22987 () Bool)

(declare-fun tp!44394 () Bool)

(assert (=> mapNonEmpty!22987 (= mapRes!22987 (and tp!44394 e!451780))))

(declare-fun mapValue!22987 () ValueCell!6719)

(declare-fun mapKey!22987 () (_ BitVec 32))

(declare-fun mapRest!22987 () (Array (_ BitVec 32) ValueCell!6719))

(assert (=> mapNonEmpty!22987 (= (arr!21425 _values!788) (store mapRest!22987 mapKey!22987 mapValue!22987))))

(declare-fun b!814869 () Bool)

(assert (=> b!814869 (= e!451779 tp_is_empty!14269)))

(assert (= (and start!70132 res!556537) b!814868))

(assert (= (and b!814868 res!556536) b!814866))

(assert (= (and b!814866 res!556539) b!814864))

(assert (= (and b!814864 res!556538) b!814865))

(assert (= (and b!814863 condMapEmpty!22987) mapIsEmpty!22987))

(assert (= (and b!814863 (not condMapEmpty!22987)) mapNonEmpty!22987))

(get-info :version)

(assert (= (and mapNonEmpty!22987 ((_ is ValueCellFull!6719) mapValue!22987)) b!814867))

(assert (= (and b!814863 ((_ is ValueCellFull!6719) mapDefault!22987)) b!814869))

(assert (= start!70132 b!814863))

(declare-fun m!756069 () Bool)

(assert (=> b!814866 m!756069))

(declare-fun m!756071 () Bool)

(assert (=> start!70132 m!756071))

(declare-fun m!756073 () Bool)

(assert (=> start!70132 m!756073))

(declare-fun m!756075 () Bool)

(assert (=> start!70132 m!756075))

(declare-fun m!756077 () Bool)

(assert (=> b!814865 m!756077))

(declare-fun m!756079 () Bool)

(assert (=> b!814865 m!756079))

(declare-fun m!756081 () Bool)

(assert (=> b!814865 m!756081))

(declare-fun m!756083 () Bool)

(assert (=> mapNonEmpty!22987 m!756083))

(declare-fun m!756085 () Bool)

(assert (=> b!814864 m!756085))

(check-sat (not b_next!12559) (not b!814865) (not mapNonEmpty!22987) b_and!21313 (not b!814864) (not start!70132) tp_is_empty!14269 (not b!814866))
(check-sat b_and!21313 (not b_next!12559))
