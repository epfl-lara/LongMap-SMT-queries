; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93710 () Bool)

(assert start!93710)

(declare-fun b_free!21195 () Bool)

(declare-fun b_next!21195 () Bool)

(assert (=> start!93710 (= b_free!21195 (not b_next!21195))))

(declare-fun tp!75005 () Bool)

(declare-fun b_and!33905 () Bool)

(assert (=> start!93710 (= tp!75005 b_and!33905)))

(declare-fun b!1060036 () Bool)

(declare-fun e!603450 () Bool)

(declare-fun tp_is_empty!25005 () Bool)

(assert (=> b!1060036 (= e!603450 tp_is_empty!25005)))

(declare-fun b!1060037 () Bool)

(declare-fun res!708036 () Bool)

(declare-fun e!603446 () Bool)

(assert (=> b!1060037 (=> (not res!708036) (not e!603446))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38475 0))(
  ( (V!38476 (val!12553 Int)) )
))
(declare-datatypes ((ValueCell!11799 0))(
  ( (ValueCellFull!11799 (v!15163 V!38475)) (EmptyCell!11799) )
))
(declare-datatypes ((array!67033 0))(
  ( (array!67034 (arr!32225 (Array (_ BitVec 32) ValueCell!11799)) (size!32761 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67033)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67035 0))(
  ( (array!67036 (arr!32226 (Array (_ BitVec 32) (_ BitVec 64))) (size!32762 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67035)

(assert (=> b!1060037 (= res!708036 (and (= (size!32761 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32762 _keys!1163) (size!32761 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1060038 () Bool)

(declare-fun e!603448 () Bool)

(declare-fun mapRes!39175 () Bool)

(assert (=> b!1060038 (= e!603448 (and e!603450 mapRes!39175))))

(declare-fun condMapEmpty!39175 () Bool)

(declare-fun mapDefault!39175 () ValueCell!11799)

(assert (=> b!1060038 (= condMapEmpty!39175 (= (arr!32225 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11799)) mapDefault!39175)))))

(declare-fun mapIsEmpty!39175 () Bool)

(assert (=> mapIsEmpty!39175 mapRes!39175))

(declare-fun b!1060039 () Bool)

(declare-fun e!603449 () Bool)

(assert (=> b!1060039 (= e!603449 tp_is_empty!25005)))

(declare-fun b!1060040 () Bool)

(assert (=> b!1060040 (= e!603446 false)))

(declare-fun zeroValueBefore!47 () V!38475)

(declare-datatypes ((tuple2!15868 0))(
  ( (tuple2!15869 (_1!7945 (_ BitVec 64)) (_2!7945 V!38475)) )
))
(declare-datatypes ((List!22455 0))(
  ( (Nil!22452) (Cons!22451 (h!23660 tuple2!15868) (t!31762 List!22455)) )
))
(declare-datatypes ((ListLongMap!13837 0))(
  ( (ListLongMap!13838 (toList!6934 List!22455)) )
))
(declare-fun lt!467212 () ListLongMap!13837)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38475)

(declare-fun getCurrentListMapNoExtraKeys!3536 (array!67035 array!67033 (_ BitVec 32) (_ BitVec 32) V!38475 V!38475 (_ BitVec 32) Int) ListLongMap!13837)

(assert (=> b!1060040 (= lt!467212 (getCurrentListMapNoExtraKeys!3536 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!708035 () Bool)

(assert (=> start!93710 (=> (not res!708035) (not e!603446))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93710 (= res!708035 (validMask!0 mask!1515))))

(assert (=> start!93710 e!603446))

(assert (=> start!93710 true))

(assert (=> start!93710 tp_is_empty!25005))

(declare-fun array_inv!24974 (array!67033) Bool)

(assert (=> start!93710 (and (array_inv!24974 _values!955) e!603448)))

(assert (=> start!93710 tp!75005))

(declare-fun array_inv!24975 (array!67035) Bool)

(assert (=> start!93710 (array_inv!24975 _keys!1163)))

(declare-fun b!1060041 () Bool)

(declare-fun res!708034 () Bool)

(assert (=> b!1060041 (=> (not res!708034) (not e!603446))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67035 (_ BitVec 32)) Bool)

(assert (=> b!1060041 (= res!708034 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1060042 () Bool)

(declare-fun res!708037 () Bool)

(assert (=> b!1060042 (=> (not res!708037) (not e!603446))))

(declare-datatypes ((List!22456 0))(
  ( (Nil!22453) (Cons!22452 (h!23661 (_ BitVec 64)) (t!31763 List!22456)) )
))
(declare-fun arrayNoDuplicates!0 (array!67035 (_ BitVec 32) List!22456) Bool)

(assert (=> b!1060042 (= res!708037 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22453))))

(declare-fun mapNonEmpty!39175 () Bool)

(declare-fun tp!75004 () Bool)

(assert (=> mapNonEmpty!39175 (= mapRes!39175 (and tp!75004 e!603449))))

(declare-fun mapRest!39175 () (Array (_ BitVec 32) ValueCell!11799))

(declare-fun mapKey!39175 () (_ BitVec 32))

(declare-fun mapValue!39175 () ValueCell!11799)

(assert (=> mapNonEmpty!39175 (= (arr!32225 _values!955) (store mapRest!39175 mapKey!39175 mapValue!39175))))

(assert (= (and start!93710 res!708035) b!1060037))

(assert (= (and b!1060037 res!708036) b!1060041))

(assert (= (and b!1060041 res!708034) b!1060042))

(assert (= (and b!1060042 res!708037) b!1060040))

(assert (= (and b!1060038 condMapEmpty!39175) mapIsEmpty!39175))

(assert (= (and b!1060038 (not condMapEmpty!39175)) mapNonEmpty!39175))

(get-info :version)

(assert (= (and mapNonEmpty!39175 ((_ is ValueCellFull!11799) mapValue!39175)) b!1060039))

(assert (= (and b!1060038 ((_ is ValueCellFull!11799) mapDefault!39175)) b!1060036))

(assert (= start!93710 b!1060038))

(declare-fun m!979251 () Bool)

(assert (=> mapNonEmpty!39175 m!979251))

(declare-fun m!979253 () Bool)

(assert (=> b!1060042 m!979253))

(declare-fun m!979255 () Bool)

(assert (=> b!1060040 m!979255))

(declare-fun m!979257 () Bool)

(assert (=> b!1060041 m!979257))

(declare-fun m!979259 () Bool)

(assert (=> start!93710 m!979259))

(declare-fun m!979261 () Bool)

(assert (=> start!93710 m!979261))

(declare-fun m!979263 () Bool)

(assert (=> start!93710 m!979263))

(check-sat (not b!1060042) tp_is_empty!25005 (not mapNonEmpty!39175) (not start!93710) (not b!1060040) (not b!1060041) b_and!33905 (not b_next!21195))
(check-sat b_and!33905 (not b_next!21195))
