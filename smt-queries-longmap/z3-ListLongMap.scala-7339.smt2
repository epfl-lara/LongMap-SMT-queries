; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93962 () Bool)

(assert start!93962)

(declare-fun b_free!21211 () Bool)

(declare-fun b_next!21211 () Bool)

(assert (=> start!93962 (= b_free!21211 (not b_next!21211))))

(declare-fun tp!75052 () Bool)

(declare-fun b_and!33931 () Bool)

(assert (=> start!93962 (= tp!75052 b_and!33931)))

(declare-fun b!1061531 () Bool)

(declare-fun res!708653 () Bool)

(declare-fun e!604422 () Bool)

(assert (=> b!1061531 (=> (not res!708653) (not e!604422))))

(declare-datatypes ((array!67111 0))(
  ( (array!67112 (arr!32258 (Array (_ BitVec 32) (_ BitVec 64))) (size!32795 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67111)

(declare-datatypes ((List!22450 0))(
  ( (Nil!22447) (Cons!22446 (h!23664 (_ BitVec 64)) (t!31749 List!22450)) )
))
(declare-fun arrayNoDuplicates!0 (array!67111 (_ BitVec 32) List!22450) Bool)

(assert (=> b!1061531 (= res!708653 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22447))))

(declare-fun b!1061532 () Bool)

(declare-fun res!708654 () Bool)

(assert (=> b!1061532 (=> (not res!708654) (not e!604422))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38497 0))(
  ( (V!38498 (val!12561 Int)) )
))
(declare-datatypes ((ValueCell!11807 0))(
  ( (ValueCellFull!11807 (v!15167 V!38497)) (EmptyCell!11807) )
))
(declare-datatypes ((array!67113 0))(
  ( (array!67114 (arr!32259 (Array (_ BitVec 32) ValueCell!11807)) (size!32796 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67113)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1061532 (= res!708654 (and (= (size!32796 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32795 _keys!1163) (size!32796 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1061533 () Bool)

(declare-fun e!604425 () Bool)

(declare-fun tp_is_empty!25021 () Bool)

(assert (=> b!1061533 (= e!604425 tp_is_empty!25021)))

(declare-fun mapIsEmpty!39199 () Bool)

(declare-fun mapRes!39199 () Bool)

(assert (=> mapIsEmpty!39199 mapRes!39199))

(declare-fun b!1061534 () Bool)

(declare-fun res!708655 () Bool)

(assert (=> b!1061534 (=> (not res!708655) (not e!604422))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67111 (_ BitVec 32)) Bool)

(assert (=> b!1061534 (= res!708655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!39199 () Bool)

(declare-fun tp!75053 () Bool)

(assert (=> mapNonEmpty!39199 (= mapRes!39199 (and tp!75053 e!604425))))

(declare-fun mapRest!39199 () (Array (_ BitVec 32) ValueCell!11807))

(declare-fun mapValue!39199 () ValueCell!11807)

(declare-fun mapKey!39199 () (_ BitVec 32))

(assert (=> mapNonEmpty!39199 (= (arr!32259 _values!955) (store mapRest!39199 mapKey!39199 mapValue!39199))))

(declare-fun b!1061535 () Bool)

(declare-fun e!604421 () Bool)

(declare-fun e!604424 () Bool)

(assert (=> b!1061535 (= e!604421 (and e!604424 mapRes!39199))))

(declare-fun condMapEmpty!39199 () Bool)

(declare-fun mapDefault!39199 () ValueCell!11807)

(assert (=> b!1061535 (= condMapEmpty!39199 (= (arr!32259 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11807)) mapDefault!39199)))))

(declare-fun b!1061536 () Bool)

(assert (=> b!1061536 (= e!604422 false)))

(declare-fun zeroValueBefore!47 () V!38497)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38497)

(declare-datatypes ((tuple2!15866 0))(
  ( (tuple2!15867 (_1!7944 (_ BitVec 64)) (_2!7944 V!38497)) )
))
(declare-datatypes ((List!22451 0))(
  ( (Nil!22448) (Cons!22447 (h!23665 tuple2!15866) (t!31750 List!22451)) )
))
(declare-datatypes ((ListLongMap!13843 0))(
  ( (ListLongMap!13844 (toList!6937 List!22451)) )
))
(declare-fun lt!467751 () ListLongMap!13843)

(declare-fun getCurrentListMapNoExtraKeys!3585 (array!67111 array!67113 (_ BitVec 32) (_ BitVec 32) V!38497 V!38497 (_ BitVec 32) Int) ListLongMap!13843)

(assert (=> b!1061536 (= lt!467751 (getCurrentListMapNoExtraKeys!3585 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1061537 () Bool)

(assert (=> b!1061537 (= e!604424 tp_is_empty!25021)))

(declare-fun res!708652 () Bool)

(assert (=> start!93962 (=> (not res!708652) (not e!604422))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93962 (= res!708652 (validMask!0 mask!1515))))

(assert (=> start!93962 e!604422))

(assert (=> start!93962 true))

(assert (=> start!93962 tp_is_empty!25021))

(declare-fun array_inv!25014 (array!67113) Bool)

(assert (=> start!93962 (and (array_inv!25014 _values!955) e!604421)))

(assert (=> start!93962 tp!75052))

(declare-fun array_inv!25015 (array!67111) Bool)

(assert (=> start!93962 (array_inv!25015 _keys!1163)))

(assert (= (and start!93962 res!708652) b!1061532))

(assert (= (and b!1061532 res!708654) b!1061534))

(assert (= (and b!1061534 res!708655) b!1061531))

(assert (= (and b!1061531 res!708653) b!1061536))

(assert (= (and b!1061535 condMapEmpty!39199) mapIsEmpty!39199))

(assert (= (and b!1061535 (not condMapEmpty!39199)) mapNonEmpty!39199))

(get-info :version)

(assert (= (and mapNonEmpty!39199 ((_ is ValueCellFull!11807) mapValue!39199)) b!1061533))

(assert (= (and b!1061535 ((_ is ValueCellFull!11807) mapDefault!39199)) b!1061537))

(assert (= start!93962 b!1061535))

(declare-fun m!981035 () Bool)

(assert (=> mapNonEmpty!39199 m!981035))

(declare-fun m!981037 () Bool)

(assert (=> start!93962 m!981037))

(declare-fun m!981039 () Bool)

(assert (=> start!93962 m!981039))

(declare-fun m!981041 () Bool)

(assert (=> start!93962 m!981041))

(declare-fun m!981043 () Bool)

(assert (=> b!1061531 m!981043))

(declare-fun m!981045 () Bool)

(assert (=> b!1061534 m!981045))

(declare-fun m!981047 () Bool)

(assert (=> b!1061536 m!981047))

(check-sat (not b!1061531) (not b!1061534) b_and!33931 (not b_next!21211) (not mapNonEmpty!39199) tp_is_empty!25021 (not start!93962) (not b!1061536))
(check-sat b_and!33931 (not b_next!21211))
