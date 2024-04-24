; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94094 () Bool)

(assert start!94094)

(declare-fun b_free!21331 () Bool)

(declare-fun b_next!21331 () Bool)

(assert (=> start!94094 (= b_free!21331 (not b_next!21331))))

(declare-fun tp!75415 () Bool)

(declare-fun b_and!34055 () Bool)

(assert (=> start!94094 (= tp!75415 b_and!34055)))

(declare-fun b!1062864 () Bool)

(declare-fun e!605371 () Bool)

(declare-fun tp_is_empty!25141 () Bool)

(assert (=> b!1062864 (= e!605371 tp_is_empty!25141)))

(declare-fun b!1062865 () Bool)

(declare-fun res!709402 () Bool)

(declare-fun e!605373 () Bool)

(assert (=> b!1062865 (=> (not res!709402) (not e!605373))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38657 0))(
  ( (V!38658 (val!12621 Int)) )
))
(declare-datatypes ((ValueCell!11867 0))(
  ( (ValueCellFull!11867 (v!15227 V!38657)) (EmptyCell!11867) )
))
(declare-datatypes ((array!67335 0))(
  ( (array!67336 (arr!32369 (Array (_ BitVec 32) ValueCell!11867)) (size!32906 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67335)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67337 0))(
  ( (array!67338 (arr!32370 (Array (_ BitVec 32) (_ BitVec 64))) (size!32907 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67337)

(assert (=> b!1062865 (= res!709402 (and (= (size!32906 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32907 _keys!1163) (size!32906 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!709399 () Bool)

(assert (=> start!94094 (=> (not res!709399) (not e!605373))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94094 (= res!709399 (validMask!0 mask!1515))))

(assert (=> start!94094 e!605373))

(assert (=> start!94094 true))

(assert (=> start!94094 tp_is_empty!25141))

(declare-fun e!605370 () Bool)

(declare-fun array_inv!25098 (array!67335) Bool)

(assert (=> start!94094 (and (array_inv!25098 _values!955) e!605370)))

(assert (=> start!94094 tp!75415))

(declare-fun array_inv!25099 (array!67337) Bool)

(assert (=> start!94094 (array_inv!25099 _keys!1163)))

(declare-fun b!1062866 () Bool)

(declare-fun e!605369 () Bool)

(declare-fun mapRes!39382 () Bool)

(assert (=> b!1062866 (= e!605370 (and e!605369 mapRes!39382))))

(declare-fun condMapEmpty!39382 () Bool)

(declare-fun mapDefault!39382 () ValueCell!11867)

(assert (=> b!1062866 (= condMapEmpty!39382 (= (arr!32369 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11867)) mapDefault!39382)))))

(declare-fun b!1062867 () Bool)

(declare-fun res!709401 () Bool)

(assert (=> b!1062867 (=> (not res!709401) (not e!605373))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67337 (_ BitVec 32)) Bool)

(assert (=> b!1062867 (= res!709401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1062868 () Bool)

(declare-fun res!709400 () Bool)

(assert (=> b!1062868 (=> (not res!709400) (not e!605373))))

(declare-datatypes ((List!22527 0))(
  ( (Nil!22524) (Cons!22523 (h!23741 (_ BitVec 64)) (t!31828 List!22527)) )
))
(declare-fun arrayNoDuplicates!0 (array!67337 (_ BitVec 32) List!22527) Bool)

(assert (=> b!1062868 (= res!709400 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22524))))

(declare-fun b!1062869 () Bool)

(assert (=> b!1062869 (= e!605373 (not true))))

(declare-datatypes ((tuple2!15940 0))(
  ( (tuple2!15941 (_1!7981 (_ BitVec 64)) (_2!7981 V!38657)) )
))
(declare-datatypes ((List!22528 0))(
  ( (Nil!22525) (Cons!22524 (h!23742 tuple2!15940) (t!31829 List!22528)) )
))
(declare-datatypes ((ListLongMap!13917 0))(
  ( (ListLongMap!13918 (toList!6974 List!22528)) )
))
(declare-fun lt!468155 () ListLongMap!13917)

(declare-fun lt!468156 () ListLongMap!13917)

(assert (=> b!1062869 (= lt!468155 lt!468156)))

(declare-fun zeroValueBefore!47 () V!38657)

(declare-fun minValue!907 () V!38657)

(declare-datatypes ((Unit!34753 0))(
  ( (Unit!34754) )
))
(declare-fun lt!468154 () Unit!34753)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38657)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!625 (array!67337 array!67335 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38657 V!38657 V!38657 V!38657 (_ BitVec 32) Int) Unit!34753)

(assert (=> b!1062869 (= lt!468154 (lemmaNoChangeToArrayThenSameMapNoExtras!625 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3622 (array!67337 array!67335 (_ BitVec 32) (_ BitVec 32) V!38657 V!38657 (_ BitVec 32) Int) ListLongMap!13917)

(assert (=> b!1062869 (= lt!468156 (getCurrentListMapNoExtraKeys!3622 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1062869 (= lt!468155 (getCurrentListMapNoExtraKeys!3622 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39382 () Bool)

(assert (=> mapIsEmpty!39382 mapRes!39382))

(declare-fun mapNonEmpty!39382 () Bool)

(declare-fun tp!75416 () Bool)

(assert (=> mapNonEmpty!39382 (= mapRes!39382 (and tp!75416 e!605371))))

(declare-fun mapRest!39382 () (Array (_ BitVec 32) ValueCell!11867))

(declare-fun mapValue!39382 () ValueCell!11867)

(declare-fun mapKey!39382 () (_ BitVec 32))

(assert (=> mapNonEmpty!39382 (= (arr!32369 _values!955) (store mapRest!39382 mapKey!39382 mapValue!39382))))

(declare-fun b!1062870 () Bool)

(assert (=> b!1062870 (= e!605369 tp_is_empty!25141)))

(assert (= (and start!94094 res!709399) b!1062865))

(assert (= (and b!1062865 res!709402) b!1062867))

(assert (= (and b!1062867 res!709401) b!1062868))

(assert (= (and b!1062868 res!709400) b!1062869))

(assert (= (and b!1062866 condMapEmpty!39382) mapIsEmpty!39382))

(assert (= (and b!1062866 (not condMapEmpty!39382)) mapNonEmpty!39382))

(get-info :version)

(assert (= (and mapNonEmpty!39382 ((_ is ValueCellFull!11867) mapValue!39382)) b!1062864))

(assert (= (and b!1062866 ((_ is ValueCellFull!11867) mapDefault!39382)) b!1062870))

(assert (= start!94094 b!1062866))

(declare-fun m!982045 () Bool)

(assert (=> b!1062869 m!982045))

(declare-fun m!982047 () Bool)

(assert (=> b!1062869 m!982047))

(declare-fun m!982049 () Bool)

(assert (=> b!1062869 m!982049))

(declare-fun m!982051 () Bool)

(assert (=> b!1062867 m!982051))

(declare-fun m!982053 () Bool)

(assert (=> mapNonEmpty!39382 m!982053))

(declare-fun m!982055 () Bool)

(assert (=> start!94094 m!982055))

(declare-fun m!982057 () Bool)

(assert (=> start!94094 m!982057))

(declare-fun m!982059 () Bool)

(assert (=> start!94094 m!982059))

(declare-fun m!982061 () Bool)

(assert (=> b!1062868 m!982061))

(check-sat (not mapNonEmpty!39382) (not start!94094) (not b!1062867) (not b!1062869) (not b_next!21331) (not b!1062868) tp_is_empty!25141 b_and!34055)
(check-sat b_and!34055 (not b_next!21331))
