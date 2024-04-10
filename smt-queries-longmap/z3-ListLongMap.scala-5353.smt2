; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71694 () Bool)

(assert start!71694)

(declare-fun b_free!13527 () Bool)

(declare-fun b_next!13527 () Bool)

(assert (=> start!71694 (= b_free!13527 (not b_next!13527))))

(declare-fun tp!47377 () Bool)

(declare-fun b_and!22613 () Bool)

(assert (=> start!71694 (= tp!47377 b_and!22613)))

(declare-fun e!465176 () Bool)

(declare-fun b!833800 () Bool)

(declare-datatypes ((V!25317 0))(
  ( (V!25318 (val!7666 Int)) )
))
(declare-datatypes ((tuple2!10180 0))(
  ( (tuple2!10181 (_1!5101 (_ BitVec 64)) (_2!5101 V!25317)) )
))
(declare-fun lt!378588 () tuple2!10180)

(declare-datatypes ((List!15969 0))(
  ( (Nil!15966) (Cons!15965 (h!17096 tuple2!10180) (t!22340 List!15969)) )
))
(declare-datatypes ((ListLongMap!9003 0))(
  ( (ListLongMap!9004 (toList!4517 List!15969)) )
))
(declare-fun lt!378584 () ListLongMap!9003)

(declare-fun lt!378582 () ListLongMap!9003)

(declare-fun +!1995 (ListLongMap!9003 tuple2!10180) ListLongMap!9003)

(assert (=> b!833800 (= e!465176 (= (+!1995 lt!378582 lt!378588) lt!378584))))

(declare-fun b!833801 () Bool)

(declare-fun e!465182 () Bool)

(declare-fun tp_is_empty!15237 () Bool)

(assert (=> b!833801 (= e!465182 tp_is_empty!15237)))

(declare-fun b!833803 () Bool)

(declare-fun e!465178 () Bool)

(assert (=> b!833803 (= e!465178 e!465176)))

(declare-fun res!566968 () Bool)

(assert (=> b!833803 (=> res!566968 e!465176)))

(declare-fun lt!378590 () ListLongMap!9003)

(declare-fun lt!378585 () tuple2!10180)

(assert (=> b!833803 (= res!566968 (not (= lt!378584 (+!1995 (+!1995 lt!378590 lt!378588) lt!378585))))))

(declare-fun lt!378589 () ListLongMap!9003)

(declare-fun lt!378581 () ListLongMap!9003)

(assert (=> b!833803 (and (= lt!378589 lt!378581) (= lt!378584 lt!378581) (= lt!378584 lt!378589))))

(declare-fun lt!378587 () ListLongMap!9003)

(assert (=> b!833803 (= lt!378581 (+!1995 lt!378587 lt!378588))))

(declare-fun lt!378580 () ListLongMap!9003)

(assert (=> b!833803 (= lt!378589 (+!1995 lt!378580 lt!378588))))

(declare-fun zeroValueBefore!34 () V!25317)

(declare-datatypes ((Unit!28577 0))(
  ( (Unit!28578) )
))
(declare-fun lt!378592 () Unit!28577)

(declare-fun zeroValueAfter!34 () V!25317)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!247 (ListLongMap!9003 (_ BitVec 64) V!25317 V!25317) Unit!28577)

(assert (=> b!833803 (= lt!378592 (addSameAsAddTwiceSameKeyDiffValues!247 lt!378580 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(declare-fun e!465175 () Bool)

(assert (=> b!833803 e!465175))

(declare-fun res!566970 () Bool)

(assert (=> b!833803 (=> (not res!566970) (not e!465175))))

(assert (=> b!833803 (= res!566970 (= lt!378582 lt!378587))))

(declare-fun lt!378586 () tuple2!10180)

(assert (=> b!833803 (= lt!378587 (+!1995 lt!378580 lt!378586))))

(assert (=> b!833803 (= lt!378580 (+!1995 lt!378590 lt!378585))))

(assert (=> b!833803 (= lt!378588 (tuple2!10181 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!465183 () Bool)

(assert (=> b!833803 e!465183))

(declare-fun res!566971 () Bool)

(assert (=> b!833803 (=> (not res!566971) (not e!465183))))

(assert (=> b!833803 (= res!566971 (= lt!378582 (+!1995 (+!1995 lt!378590 lt!378586) lt!378585)))))

(declare-fun minValue!754 () V!25317)

(assert (=> b!833803 (= lt!378585 (tuple2!10181 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!833803 (= lt!378586 (tuple2!10181 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-datatypes ((array!46648 0))(
  ( (array!46649 (arr!22358 (Array (_ BitVec 32) (_ BitVec 64))) (size!22779 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46648)

(declare-datatypes ((ValueCell!7203 0))(
  ( (ValueCellFull!7203 (v!10114 V!25317)) (EmptyCell!7203) )
))
(declare-datatypes ((array!46650 0))(
  ( (array!46651 (arr!22359 (Array (_ BitVec 32) ValueCell!7203)) (size!22780 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46650)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2610 (array!46648 array!46650 (_ BitVec 32) (_ BitVec 32) V!25317 V!25317 (_ BitVec 32) Int) ListLongMap!9003)

(assert (=> b!833803 (= lt!378584 (getCurrentListMap!2610 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!833803 (= lt!378582 (getCurrentListMap!2610 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!833804 () Bool)

(declare-fun res!566967 () Bool)

(declare-fun e!465181 () Bool)

(assert (=> b!833804 (=> (not res!566967) (not e!465181))))

(declare-datatypes ((List!15970 0))(
  ( (Nil!15967) (Cons!15966 (h!17097 (_ BitVec 64)) (t!22341 List!15970)) )
))
(declare-fun arrayNoDuplicates!0 (array!46648 (_ BitVec 32) List!15970) Bool)

(assert (=> b!833804 (= res!566967 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15967))))

(declare-fun lt!378591 () ListLongMap!9003)

(declare-fun b!833805 () Bool)

(assert (=> b!833805 (= e!465183 (= lt!378584 (+!1995 (+!1995 lt!378591 (tuple2!10181 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!378585)))))

(declare-fun b!833806 () Bool)

(declare-fun e!465180 () Bool)

(declare-fun mapRes!24518 () Bool)

(assert (=> b!833806 (= e!465180 (and e!465182 mapRes!24518))))

(declare-fun condMapEmpty!24518 () Bool)

(declare-fun mapDefault!24518 () ValueCell!7203)

(assert (=> b!833806 (= condMapEmpty!24518 (= (arr!22359 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7203)) mapDefault!24518)))))

(declare-fun mapNonEmpty!24518 () Bool)

(declare-fun tp!47378 () Bool)

(declare-fun e!465179 () Bool)

(assert (=> mapNonEmpty!24518 (= mapRes!24518 (and tp!47378 e!465179))))

(declare-fun mapRest!24518 () (Array (_ BitVec 32) ValueCell!7203))

(declare-fun mapKey!24518 () (_ BitVec 32))

(declare-fun mapValue!24518 () ValueCell!7203)

(assert (=> mapNonEmpty!24518 (= (arr!22359 _values!788) (store mapRest!24518 mapKey!24518 mapValue!24518))))

(declare-fun b!833807 () Bool)

(assert (=> b!833807 (= e!465175 (= lt!378584 (+!1995 (+!1995 lt!378591 lt!378585) lt!378588)))))

(declare-fun b!833808 () Bool)

(declare-fun res!566972 () Bool)

(assert (=> b!833808 (=> (not res!566972) (not e!465181))))

(assert (=> b!833808 (= res!566972 (and (= (size!22780 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22779 _keys!976) (size!22780 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!24518 () Bool)

(assert (=> mapIsEmpty!24518 mapRes!24518))

(declare-fun b!833809 () Bool)

(declare-fun res!566966 () Bool)

(assert (=> b!833809 (=> (not res!566966) (not e!465181))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46648 (_ BitVec 32)) Bool)

(assert (=> b!833809 (= res!566966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!833810 () Bool)

(assert (=> b!833810 (= e!465179 tp_is_empty!15237)))

(declare-fun res!566969 () Bool)

(assert (=> start!71694 (=> (not res!566969) (not e!465181))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71694 (= res!566969 (validMask!0 mask!1312))))

(assert (=> start!71694 e!465181))

(assert (=> start!71694 tp_is_empty!15237))

(declare-fun array_inv!17807 (array!46648) Bool)

(assert (=> start!71694 (array_inv!17807 _keys!976)))

(assert (=> start!71694 true))

(declare-fun array_inv!17808 (array!46650) Bool)

(assert (=> start!71694 (and (array_inv!17808 _values!788) e!465180)))

(assert (=> start!71694 tp!47377))

(declare-fun b!833802 () Bool)

(assert (=> b!833802 (= e!465181 (not e!465178))))

(declare-fun res!566965 () Bool)

(assert (=> b!833802 (=> res!566965 e!465178)))

(assert (=> b!833802 (= res!566965 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!833802 (= lt!378590 lt!378591)))

(declare-fun lt!378583 () Unit!28577)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!602 (array!46648 array!46650 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25317 V!25317 V!25317 V!25317 (_ BitVec 32) Int) Unit!28577)

(assert (=> b!833802 (= lt!378583 (lemmaNoChangeToArrayThenSameMapNoExtras!602 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2514 (array!46648 array!46650 (_ BitVec 32) (_ BitVec 32) V!25317 V!25317 (_ BitVec 32) Int) ListLongMap!9003)

(assert (=> b!833802 (= lt!378591 (getCurrentListMapNoExtraKeys!2514 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!833802 (= lt!378590 (getCurrentListMapNoExtraKeys!2514 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!71694 res!566969) b!833808))

(assert (= (and b!833808 res!566972) b!833809))

(assert (= (and b!833809 res!566966) b!833804))

(assert (= (and b!833804 res!566967) b!833802))

(assert (= (and b!833802 (not res!566965)) b!833803))

(assert (= (and b!833803 res!566971) b!833805))

(assert (= (and b!833803 res!566970) b!833807))

(assert (= (and b!833803 (not res!566968)) b!833800))

(assert (= (and b!833806 condMapEmpty!24518) mapIsEmpty!24518))

(assert (= (and b!833806 (not condMapEmpty!24518)) mapNonEmpty!24518))

(get-info :version)

(assert (= (and mapNonEmpty!24518 ((_ is ValueCellFull!7203) mapValue!24518)) b!833810))

(assert (= (and b!833806 ((_ is ValueCellFull!7203) mapDefault!24518)) b!833801))

(assert (= start!71694 b!833806))

(declare-fun m!778737 () Bool)

(assert (=> b!833800 m!778737))

(declare-fun m!778739 () Bool)

(assert (=> b!833802 m!778739))

(declare-fun m!778741 () Bool)

(assert (=> b!833802 m!778741))

(declare-fun m!778743 () Bool)

(assert (=> b!833802 m!778743))

(declare-fun m!778745 () Bool)

(assert (=> b!833804 m!778745))

(declare-fun m!778747 () Bool)

(assert (=> start!71694 m!778747))

(declare-fun m!778749 () Bool)

(assert (=> start!71694 m!778749))

(declare-fun m!778751 () Bool)

(assert (=> start!71694 m!778751))

(declare-fun m!778753 () Bool)

(assert (=> b!833807 m!778753))

(assert (=> b!833807 m!778753))

(declare-fun m!778755 () Bool)

(assert (=> b!833807 m!778755))

(declare-fun m!778757 () Bool)

(assert (=> b!833805 m!778757))

(assert (=> b!833805 m!778757))

(declare-fun m!778759 () Bool)

(assert (=> b!833805 m!778759))

(declare-fun m!778761 () Bool)

(assert (=> mapNonEmpty!24518 m!778761))

(declare-fun m!778763 () Bool)

(assert (=> b!833809 m!778763))

(declare-fun m!778765 () Bool)

(assert (=> b!833803 m!778765))

(declare-fun m!778767 () Bool)

(assert (=> b!833803 m!778767))

(declare-fun m!778769 () Bool)

(assert (=> b!833803 m!778769))

(declare-fun m!778771 () Bool)

(assert (=> b!833803 m!778771))

(declare-fun m!778773 () Bool)

(assert (=> b!833803 m!778773))

(declare-fun m!778775 () Bool)

(assert (=> b!833803 m!778775))

(declare-fun m!778777 () Bool)

(assert (=> b!833803 m!778777))

(declare-fun m!778779 () Bool)

(assert (=> b!833803 m!778779))

(assert (=> b!833803 m!778765))

(declare-fun m!778781 () Bool)

(assert (=> b!833803 m!778781))

(assert (=> b!833803 m!778779))

(declare-fun m!778783 () Bool)

(assert (=> b!833803 m!778783))

(declare-fun m!778785 () Bool)

(assert (=> b!833803 m!778785))

(check-sat (not b!833804) (not start!71694) (not b!833800) b_and!22613 (not b!833809) (not b!833807) (not b!833803) (not b!833805) (not b_next!13527) (not b!833802) (not mapNonEmpty!24518) tp_is_empty!15237)
(check-sat b_and!22613 (not b_next!13527))
