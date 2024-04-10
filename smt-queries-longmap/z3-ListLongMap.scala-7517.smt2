; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95322 () Bool)

(assert start!95322)

(declare-fun b!1077016 () Bool)

(declare-fun e!615732 () Bool)

(declare-fun e!615731 () Bool)

(declare-fun mapRes!40846 () Bool)

(assert (=> b!1077016 (= e!615732 (and e!615731 mapRes!40846))))

(declare-fun condMapEmpty!40846 () Bool)

(declare-datatypes ((V!39899 0))(
  ( (V!39900 (val!13096 Int)) )
))
(declare-datatypes ((ValueCell!12330 0))(
  ( (ValueCellFull!12330 (v!15715 V!39899)) (EmptyCell!12330) )
))
(declare-datatypes ((array!69105 0))(
  ( (array!69106 (arr!33235 (Array (_ BitVec 32) ValueCell!12330)) (size!33771 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69105)

(declare-fun mapDefault!40846 () ValueCell!12330)

(assert (=> b!1077016 (= condMapEmpty!40846 (= (arr!33235 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12330)) mapDefault!40846)))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun e!615730 () Bool)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun b!1077017 () Bool)

(declare-datatypes ((array!69107 0))(
  ( (array!69108 (arr!33236 (Array (_ BitVec 32) (_ BitVec 64))) (size!33772 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69107)

(assert (=> b!1077017 (= e!615730 (and (= (size!33771 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33772 _keys!1070) (size!33771 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011) (= (size!33772 _keys!1070) (bvadd #b00000000000000000000000000000001 mask!1414)) (bvsgt #b00000000000000000000000000000000 (size!33772 _keys!1070))))))

(declare-fun b!1077018 () Bool)

(declare-fun tp_is_empty!26079 () Bool)

(assert (=> b!1077018 (= e!615731 tp_is_empty!26079)))

(declare-fun mapNonEmpty!40846 () Bool)

(declare-fun tp!78308 () Bool)

(declare-fun e!615728 () Bool)

(assert (=> mapNonEmpty!40846 (= mapRes!40846 (and tp!78308 e!615728))))

(declare-fun mapValue!40846 () ValueCell!12330)

(declare-fun mapRest!40846 () (Array (_ BitVec 32) ValueCell!12330))

(declare-fun mapKey!40846 () (_ BitVec 32))

(assert (=> mapNonEmpty!40846 (= (arr!33235 _values!874) (store mapRest!40846 mapKey!40846 mapValue!40846))))

(declare-fun mapIsEmpty!40846 () Bool)

(assert (=> mapIsEmpty!40846 mapRes!40846))

(declare-fun res!717705 () Bool)

(assert (=> start!95322 (=> (not res!717705) (not e!615730))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95322 (= res!717705 (validMask!0 mask!1414))))

(assert (=> start!95322 e!615730))

(assert (=> start!95322 true))

(declare-fun array_inv!25680 (array!69105) Bool)

(assert (=> start!95322 (and (array_inv!25680 _values!874) e!615732)))

(declare-fun array_inv!25681 (array!69107) Bool)

(assert (=> start!95322 (array_inv!25681 _keys!1070)))

(declare-fun b!1077019 () Bool)

(assert (=> b!1077019 (= e!615728 tp_is_empty!26079)))

(assert (= (and start!95322 res!717705) b!1077017))

(assert (= (and b!1077016 condMapEmpty!40846) mapIsEmpty!40846))

(assert (= (and b!1077016 (not condMapEmpty!40846)) mapNonEmpty!40846))

(get-info :version)

(assert (= (and mapNonEmpty!40846 ((_ is ValueCellFull!12330) mapValue!40846)) b!1077019))

(assert (= (and b!1077016 ((_ is ValueCellFull!12330) mapDefault!40846)) b!1077018))

(assert (= start!95322 b!1077016))

(declare-fun m!996039 () Bool)

(assert (=> mapNonEmpty!40846 m!996039))

(declare-fun m!996041 () Bool)

(assert (=> start!95322 m!996041))

(declare-fun m!996043 () Bool)

(assert (=> start!95322 m!996043))

(declare-fun m!996045 () Bool)

(assert (=> start!95322 m!996045))

(check-sat (not start!95322) (not mapNonEmpty!40846) tp_is_empty!26079)
(check-sat)
(get-model)

(declare-fun d!129797 () Bool)

(assert (=> d!129797 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!95322 d!129797))

(declare-fun d!129799 () Bool)

(assert (=> d!129799 (= (array_inv!25680 _values!874) (bvsge (size!33771 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!95322 d!129799))

(declare-fun d!129801 () Bool)

(assert (=> d!129801 (= (array_inv!25681 _keys!1070) (bvsge (size!33772 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!95322 d!129801))

(declare-fun b!1077039 () Bool)

(declare-fun e!615752 () Bool)

(assert (=> b!1077039 (= e!615752 tp_is_empty!26079)))

(declare-fun mapIsEmpty!40852 () Bool)

(declare-fun mapRes!40852 () Bool)

(assert (=> mapIsEmpty!40852 mapRes!40852))

(declare-fun condMapEmpty!40852 () Bool)

(declare-fun mapDefault!40852 () ValueCell!12330)

(assert (=> mapNonEmpty!40846 (= condMapEmpty!40852 (= mapRest!40846 ((as const (Array (_ BitVec 32) ValueCell!12330)) mapDefault!40852)))))

(assert (=> mapNonEmpty!40846 (= tp!78308 (and e!615752 mapRes!40852))))

(declare-fun mapNonEmpty!40852 () Bool)

(declare-fun tp!78314 () Bool)

(declare-fun e!615753 () Bool)

(assert (=> mapNonEmpty!40852 (= mapRes!40852 (and tp!78314 e!615753))))

(declare-fun mapValue!40852 () ValueCell!12330)

(declare-fun mapRest!40852 () (Array (_ BitVec 32) ValueCell!12330))

(declare-fun mapKey!40852 () (_ BitVec 32))

(assert (=> mapNonEmpty!40852 (= mapRest!40846 (store mapRest!40852 mapKey!40852 mapValue!40852))))

(declare-fun b!1077038 () Bool)

(assert (=> b!1077038 (= e!615753 tp_is_empty!26079)))

(assert (= (and mapNonEmpty!40846 condMapEmpty!40852) mapIsEmpty!40852))

(assert (= (and mapNonEmpty!40846 (not condMapEmpty!40852)) mapNonEmpty!40852))

(assert (= (and mapNonEmpty!40852 ((_ is ValueCellFull!12330) mapValue!40852)) b!1077038))

(assert (= (and mapNonEmpty!40846 ((_ is ValueCellFull!12330) mapDefault!40852)) b!1077039))

(declare-fun m!996055 () Bool)

(assert (=> mapNonEmpty!40852 m!996055))

(check-sat (not mapNonEmpty!40852) tp_is_empty!26079)
(check-sat)
