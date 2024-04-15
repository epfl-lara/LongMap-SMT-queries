; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93852 () Bool)

(assert start!93852)

(declare-fun b_free!21331 () Bool)

(declare-fun b_next!21331 () Bool)

(assert (=> start!93852 (= b_free!21331 (not b_next!21331))))

(declare-fun tp!75416 () Bool)

(declare-fun b_and!34019 () Bool)

(assert (=> start!93852 (= tp!75416 b_and!34019)))

(declare-fun b!1061384 () Bool)

(declare-fun e!604424 () Bool)

(declare-fun e!604422 () Bool)

(declare-fun mapRes!39382 () Bool)

(assert (=> b!1061384 (= e!604424 (and e!604422 mapRes!39382))))

(declare-fun condMapEmpty!39382 () Bool)

(declare-datatypes ((V!38657 0))(
  ( (V!38658 (val!12621 Int)) )
))
(declare-datatypes ((ValueCell!11867 0))(
  ( (ValueCellFull!11867 (v!15230 V!38657)) (EmptyCell!11867) )
))
(declare-datatypes ((array!67232 0))(
  ( (array!67233 (arr!32324 (Array (_ BitVec 32) ValueCell!11867)) (size!32862 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67232)

(declare-fun mapDefault!39382 () ValueCell!11867)

(assert (=> b!1061384 (= condMapEmpty!39382 (= (arr!32324 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11867)) mapDefault!39382)))))

(declare-fun b!1061385 () Bool)

(declare-fun tp_is_empty!25141 () Bool)

(assert (=> b!1061385 (= e!604422 tp_is_empty!25141)))

(declare-fun mapIsEmpty!39382 () Bool)

(assert (=> mapIsEmpty!39382 mapRes!39382))

(declare-fun b!1061386 () Bool)

(declare-fun e!604421 () Bool)

(assert (=> b!1061386 (= e!604421 (not true))))

(declare-datatypes ((tuple2!16024 0))(
  ( (tuple2!16025 (_1!8023 (_ BitVec 64)) (_2!8023 V!38657)) )
))
(declare-datatypes ((List!22579 0))(
  ( (Nil!22576) (Cons!22575 (h!23784 tuple2!16024) (t!31879 List!22579)) )
))
(declare-datatypes ((ListLongMap!13993 0))(
  ( (ListLongMap!13994 (toList!7012 List!22579)) )
))
(declare-fun lt!467441 () ListLongMap!13993)

(declare-fun lt!467439 () ListLongMap!13993)

(assert (=> b!1061386 (= lt!467441 lt!467439)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38657)

(declare-fun minValue!907 () V!38657)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-datatypes ((Unit!34623 0))(
  ( (Unit!34624) )
))
(declare-fun lt!467440 () Unit!34623)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38657)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67234 0))(
  ( (array!67235 (arr!32325 (Array (_ BitVec 32) (_ BitVec 64))) (size!32863 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67234)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!623 (array!67234 array!67232 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38657 V!38657 V!38657 V!38657 (_ BitVec 32) Int) Unit!34623)

(assert (=> b!1061386 (= lt!467440 (lemmaNoChangeToArrayThenSameMapNoExtras!623 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3629 (array!67234 array!67232 (_ BitVec 32) (_ BitVec 32) V!38657 V!38657 (_ BitVec 32) Int) ListLongMap!13993)

(assert (=> b!1061386 (= lt!467439 (getCurrentListMapNoExtraKeys!3629 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1061386 (= lt!467441 (getCurrentListMapNoExtraKeys!3629 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1061387 () Bool)

(declare-fun res!708809 () Bool)

(assert (=> b!1061387 (=> (not res!708809) (not e!604421))))

(assert (=> b!1061387 (= res!708809 (and (= (size!32862 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32863 _keys!1163) (size!32862 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!708810 () Bool)

(assert (=> start!93852 (=> (not res!708810) (not e!604421))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93852 (= res!708810 (validMask!0 mask!1515))))

(assert (=> start!93852 e!604421))

(assert (=> start!93852 true))

(assert (=> start!93852 tp_is_empty!25141))

(declare-fun array_inv!25048 (array!67232) Bool)

(assert (=> start!93852 (and (array_inv!25048 _values!955) e!604424)))

(assert (=> start!93852 tp!75416))

(declare-fun array_inv!25049 (array!67234) Bool)

(assert (=> start!93852 (array_inv!25049 _keys!1163)))

(declare-fun b!1061388 () Bool)

(declare-fun res!708811 () Bool)

(assert (=> b!1061388 (=> (not res!708811) (not e!604421))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67234 (_ BitVec 32)) Bool)

(assert (=> b!1061388 (= res!708811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1061389 () Bool)

(declare-fun res!708808 () Bool)

(assert (=> b!1061389 (=> (not res!708808) (not e!604421))))

(declare-datatypes ((List!22580 0))(
  ( (Nil!22577) (Cons!22576 (h!23785 (_ BitVec 64)) (t!31880 List!22580)) )
))
(declare-fun arrayNoDuplicates!0 (array!67234 (_ BitVec 32) List!22580) Bool)

(assert (=> b!1061389 (= res!708808 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22577))))

(declare-fun b!1061390 () Bool)

(declare-fun e!604423 () Bool)

(assert (=> b!1061390 (= e!604423 tp_is_empty!25141)))

(declare-fun mapNonEmpty!39382 () Bool)

(declare-fun tp!75415 () Bool)

(assert (=> mapNonEmpty!39382 (= mapRes!39382 (and tp!75415 e!604423))))

(declare-fun mapKey!39382 () (_ BitVec 32))

(declare-fun mapRest!39382 () (Array (_ BitVec 32) ValueCell!11867))

(declare-fun mapValue!39382 () ValueCell!11867)

(assert (=> mapNonEmpty!39382 (= (arr!32324 _values!955) (store mapRest!39382 mapKey!39382 mapValue!39382))))

(assert (= (and start!93852 res!708810) b!1061387))

(assert (= (and b!1061387 res!708809) b!1061388))

(assert (= (and b!1061388 res!708811) b!1061389))

(assert (= (and b!1061389 res!708808) b!1061386))

(assert (= (and b!1061384 condMapEmpty!39382) mapIsEmpty!39382))

(assert (= (and b!1061384 (not condMapEmpty!39382)) mapNonEmpty!39382))

(get-info :version)

(assert (= (and mapNonEmpty!39382 ((_ is ValueCellFull!11867) mapValue!39382)) b!1061390))

(assert (= (and b!1061384 ((_ is ValueCellFull!11867) mapDefault!39382)) b!1061385))

(assert (= start!93852 b!1061384))

(declare-fun m!979747 () Bool)

(assert (=> b!1061389 m!979747))

(declare-fun m!979749 () Bool)

(assert (=> b!1061386 m!979749))

(declare-fun m!979751 () Bool)

(assert (=> b!1061386 m!979751))

(declare-fun m!979753 () Bool)

(assert (=> b!1061386 m!979753))

(declare-fun m!979755 () Bool)

(assert (=> mapNonEmpty!39382 m!979755))

(declare-fun m!979757 () Bool)

(assert (=> start!93852 m!979757))

(declare-fun m!979759 () Bool)

(assert (=> start!93852 m!979759))

(declare-fun m!979761 () Bool)

(assert (=> start!93852 m!979761))

(declare-fun m!979763 () Bool)

(assert (=> b!1061388 m!979763))

(check-sat (not mapNonEmpty!39382) tp_is_empty!25141 (not b_next!21331) (not b!1061389) (not b!1061388) (not b!1061386) (not start!93852) b_and!34019)
(check-sat b_and!34019 (not b_next!21331))
