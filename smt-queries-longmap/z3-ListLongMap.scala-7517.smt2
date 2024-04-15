; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95314 () Bool)

(assert start!95314)

(declare-fun mapNonEmpty!40843 () Bool)

(declare-fun mapRes!40843 () Bool)

(declare-fun tp!78305 () Bool)

(declare-fun e!615621 () Bool)

(assert (=> mapNonEmpty!40843 (= mapRes!40843 (and tp!78305 e!615621))))

(declare-datatypes ((V!39897 0))(
  ( (V!39898 (val!13095 Int)) )
))
(declare-datatypes ((ValueCell!12329 0))(
  ( (ValueCellFull!12329 (v!15713 V!39897)) (EmptyCell!12329) )
))
(declare-datatypes ((array!69032 0))(
  ( (array!69033 (arr!33199 (Array (_ BitVec 32) ValueCell!12329)) (size!33737 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69032)

(declare-fun mapValue!40843 () ValueCell!12329)

(declare-fun mapRest!40843 () (Array (_ BitVec 32) ValueCell!12329))

(declare-fun mapKey!40843 () (_ BitVec 32))

(assert (=> mapNonEmpty!40843 (= (arr!33199 _values!874) (store mapRest!40843 mapKey!40843 mapValue!40843))))

(declare-fun b!1076851 () Bool)

(declare-fun tp_is_empty!26077 () Bool)

(assert (=> b!1076851 (= e!615621 tp_is_empty!26077)))

(declare-fun mapIsEmpty!40843 () Bool)

(assert (=> mapIsEmpty!40843 mapRes!40843))

(declare-fun res!717633 () Bool)

(declare-fun e!615623 () Bool)

(assert (=> start!95314 (=> (not res!717633) (not e!615623))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95314 (= res!717633 (validMask!0 mask!1414))))

(assert (=> start!95314 e!615623))

(assert (=> start!95314 true))

(declare-fun e!615624 () Bool)

(declare-fun array_inv!25678 (array!69032) Bool)

(assert (=> start!95314 (and (array_inv!25678 _values!874) e!615624)))

(declare-datatypes ((array!69034 0))(
  ( (array!69035 (arr!33200 (Array (_ BitVec 32) (_ BitVec 64))) (size!33738 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69034)

(declare-fun array_inv!25679 (array!69034) Bool)

(assert (=> start!95314 (array_inv!25679 _keys!1070)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun b!1076852 () Bool)

(assert (=> b!1076852 (= e!615623 (and (= (size!33737 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33738 _keys!1070) (size!33737 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011) (= (size!33738 _keys!1070) (bvadd #b00000000000000000000000000000001 mask!1414)) (bvsgt #b00000000000000000000000000000000 (size!33738 _keys!1070))))))

(declare-fun b!1076853 () Bool)

(declare-fun e!615622 () Bool)

(assert (=> b!1076853 (= e!615624 (and e!615622 mapRes!40843))))

(declare-fun condMapEmpty!40843 () Bool)

(declare-fun mapDefault!40843 () ValueCell!12329)

(assert (=> b!1076853 (= condMapEmpty!40843 (= (arr!33199 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12329)) mapDefault!40843)))))

(declare-fun b!1076854 () Bool)

(assert (=> b!1076854 (= e!615622 tp_is_empty!26077)))

(assert (= (and start!95314 res!717633) b!1076852))

(assert (= (and b!1076853 condMapEmpty!40843) mapIsEmpty!40843))

(assert (= (and b!1076853 (not condMapEmpty!40843)) mapNonEmpty!40843))

(get-info :version)

(assert (= (and mapNonEmpty!40843 ((_ is ValueCellFull!12329) mapValue!40843)) b!1076851))

(assert (= (and b!1076853 ((_ is ValueCellFull!12329) mapDefault!40843)) b!1076854))

(assert (= start!95314 b!1076853))

(declare-fun m!995405 () Bool)

(assert (=> mapNonEmpty!40843 m!995405))

(declare-fun m!995407 () Bool)

(assert (=> start!95314 m!995407))

(declare-fun m!995409 () Bool)

(assert (=> start!95314 m!995409))

(declare-fun m!995411 () Bool)

(assert (=> start!95314 m!995411))

(check-sat (not start!95314) (not mapNonEmpty!40843) tp_is_empty!26077)
(check-sat)
(get-model)

(declare-fun d!129641 () Bool)

(assert (=> d!129641 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!95314 d!129641))

(declare-fun d!129643 () Bool)

(assert (=> d!129643 (= (array_inv!25678 _values!874) (bvsge (size!33737 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!95314 d!129643))

(declare-fun d!129645 () Bool)

(assert (=> d!129645 (= (array_inv!25679 _keys!1070) (bvsge (size!33738 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!95314 d!129645))

(declare-fun b!1076886 () Bool)

(declare-fun e!615659 () Bool)

(assert (=> b!1076886 (= e!615659 tp_is_empty!26077)))

(declare-fun b!1076885 () Bool)

(declare-fun e!615660 () Bool)

(assert (=> b!1076885 (= e!615660 tp_is_empty!26077)))

(declare-fun condMapEmpty!40852 () Bool)

(declare-fun mapDefault!40852 () ValueCell!12329)

(assert (=> mapNonEmpty!40843 (= condMapEmpty!40852 (= mapRest!40843 ((as const (Array (_ BitVec 32) ValueCell!12329)) mapDefault!40852)))))

(declare-fun mapRes!40852 () Bool)

(assert (=> mapNonEmpty!40843 (= tp!78305 (and e!615659 mapRes!40852))))

(declare-fun mapNonEmpty!40852 () Bool)

(declare-fun tp!78314 () Bool)

(assert (=> mapNonEmpty!40852 (= mapRes!40852 (and tp!78314 e!615660))))

(declare-fun mapRest!40852 () (Array (_ BitVec 32) ValueCell!12329))

(declare-fun mapKey!40852 () (_ BitVec 32))

(declare-fun mapValue!40852 () ValueCell!12329)

(assert (=> mapNonEmpty!40852 (= mapRest!40843 (store mapRest!40852 mapKey!40852 mapValue!40852))))

(declare-fun mapIsEmpty!40852 () Bool)

(assert (=> mapIsEmpty!40852 mapRes!40852))

(assert (= (and mapNonEmpty!40843 condMapEmpty!40852) mapIsEmpty!40852))

(assert (= (and mapNonEmpty!40843 (not condMapEmpty!40852)) mapNonEmpty!40852))

(assert (= (and mapNonEmpty!40852 ((_ is ValueCellFull!12329) mapValue!40852)) b!1076885))

(assert (= (and mapNonEmpty!40843 ((_ is ValueCellFull!12329) mapDefault!40852)) b!1076886))

(declare-fun m!995429 () Bool)

(assert (=> mapNonEmpty!40852 m!995429))

(check-sat (not mapNonEmpty!40852) tp_is_empty!26077)
(check-sat)
