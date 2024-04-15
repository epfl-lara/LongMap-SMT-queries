; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93762 () Bool)

(assert start!93762)

(declare-fun b_free!21241 () Bool)

(declare-fun b_next!21241 () Bool)

(assert (=> start!93762 (= b_free!21241 (not b_next!21241))))

(declare-fun tp!75146 () Bool)

(declare-fun b_and!33929 () Bool)

(assert (=> start!93762 (= tp!75146 b_and!33929)))

(declare-fun mapIsEmpty!39247 () Bool)

(declare-fun mapRes!39247 () Bool)

(assert (=> mapIsEmpty!39247 mapRes!39247))

(declare-fun b!1060439 () Bool)

(declare-fun res!708270 () Bool)

(declare-fun e!603750 () Bool)

(assert (=> b!1060439 (=> (not res!708270) (not e!603750))))

(declare-datatypes ((array!67058 0))(
  ( (array!67059 (arr!32237 (Array (_ BitVec 32) (_ BitVec 64))) (size!32775 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67058)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67058 (_ BitVec 32)) Bool)

(assert (=> b!1060439 (= res!708270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1060440 () Bool)

(declare-fun res!708271 () Bool)

(assert (=> b!1060440 (=> (not res!708271) (not e!603750))))

(declare-datatypes ((List!22509 0))(
  ( (Nil!22506) (Cons!22505 (h!23714 (_ BitVec 64)) (t!31809 List!22509)) )
))
(declare-fun arrayNoDuplicates!0 (array!67058 (_ BitVec 32) List!22509) Bool)

(assert (=> b!1060440 (= res!708271 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22506))))

(declare-fun res!708268 () Bool)

(assert (=> start!93762 (=> (not res!708268) (not e!603750))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93762 (= res!708268 (validMask!0 mask!1515))))

(assert (=> start!93762 e!603750))

(assert (=> start!93762 true))

(declare-fun tp_is_empty!25051 () Bool)

(assert (=> start!93762 tp_is_empty!25051))

(declare-datatypes ((V!38537 0))(
  ( (V!38538 (val!12576 Int)) )
))
(declare-datatypes ((ValueCell!11822 0))(
  ( (ValueCellFull!11822 (v!15185 V!38537)) (EmptyCell!11822) )
))
(declare-datatypes ((array!67060 0))(
  ( (array!67061 (arr!32238 (Array (_ BitVec 32) ValueCell!11822)) (size!32776 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67060)

(declare-fun e!603748 () Bool)

(declare-fun array_inv!24984 (array!67060) Bool)

(assert (=> start!93762 (and (array_inv!24984 _values!955) e!603748)))

(assert (=> start!93762 tp!75146))

(declare-fun array_inv!24985 (array!67058) Bool)

(assert (=> start!93762 (array_inv!24985 _keys!1163)))

(declare-fun b!1060441 () Bool)

(declare-fun res!708269 () Bool)

(assert (=> b!1060441 (=> (not res!708269) (not e!603750))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1060441 (= res!708269 (and (= (size!32776 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32775 _keys!1163) (size!32776 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1060442 () Bool)

(declare-fun e!603749 () Bool)

(assert (=> b!1060442 (= e!603749 tp_is_empty!25051)))

(declare-fun mapNonEmpty!39247 () Bool)

(declare-fun tp!75145 () Bool)

(assert (=> mapNonEmpty!39247 (= mapRes!39247 (and tp!75145 e!603749))))

(declare-fun mapKey!39247 () (_ BitVec 32))

(declare-fun mapRest!39247 () (Array (_ BitVec 32) ValueCell!11822))

(declare-fun mapValue!39247 () ValueCell!11822)

(assert (=> mapNonEmpty!39247 (= (arr!32238 _values!955) (store mapRest!39247 mapKey!39247 mapValue!39247))))

(declare-fun b!1060443 () Bool)

(assert (=> b!1060443 (= e!603750 false)))

(declare-datatypes ((tuple2!15954 0))(
  ( (tuple2!15955 (_1!7988 (_ BitVec 64)) (_2!7988 V!38537)) )
))
(declare-datatypes ((List!22510 0))(
  ( (Nil!22507) (Cons!22506 (h!23715 tuple2!15954) (t!31810 List!22510)) )
))
(declare-datatypes ((ListLongMap!13923 0))(
  ( (ListLongMap!13924 (toList!6977 List!22510)) )
))
(declare-fun lt!467123 () ListLongMap!13923)

(declare-fun minValue!907 () V!38537)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38537)

(declare-fun getCurrentListMapNoExtraKeys!3594 (array!67058 array!67060 (_ BitVec 32) (_ BitVec 32) V!38537 V!38537 (_ BitVec 32) Int) ListLongMap!13923)

(assert (=> b!1060443 (= lt!467123 (getCurrentListMapNoExtraKeys!3594 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!38537)

(declare-fun lt!467122 () ListLongMap!13923)

(assert (=> b!1060443 (= lt!467122 (getCurrentListMapNoExtraKeys!3594 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1060444 () Bool)

(declare-fun e!603746 () Bool)

(assert (=> b!1060444 (= e!603748 (and e!603746 mapRes!39247))))

(declare-fun condMapEmpty!39247 () Bool)

(declare-fun mapDefault!39247 () ValueCell!11822)

(assert (=> b!1060444 (= condMapEmpty!39247 (= (arr!32238 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11822)) mapDefault!39247)))))

(declare-fun b!1060445 () Bool)

(assert (=> b!1060445 (= e!603746 tp_is_empty!25051)))

(assert (= (and start!93762 res!708268) b!1060441))

(assert (= (and b!1060441 res!708269) b!1060439))

(assert (= (and b!1060439 res!708270) b!1060440))

(assert (= (and b!1060440 res!708271) b!1060443))

(assert (= (and b!1060444 condMapEmpty!39247) mapIsEmpty!39247))

(assert (= (and b!1060444 (not condMapEmpty!39247)) mapNonEmpty!39247))

(get-info :version)

(assert (= (and mapNonEmpty!39247 ((_ is ValueCellFull!11822) mapValue!39247)) b!1060442))

(assert (= (and b!1060444 ((_ is ValueCellFull!11822) mapDefault!39247)) b!1060445))

(assert (= start!93762 b!1060444))

(declare-fun m!978997 () Bool)

(assert (=> b!1060443 m!978997))

(declare-fun m!978999 () Bool)

(assert (=> b!1060443 m!978999))

(declare-fun m!979001 () Bool)

(assert (=> b!1060440 m!979001))

(declare-fun m!979003 () Bool)

(assert (=> start!93762 m!979003))

(declare-fun m!979005 () Bool)

(assert (=> start!93762 m!979005))

(declare-fun m!979007 () Bool)

(assert (=> start!93762 m!979007))

(declare-fun m!979009 () Bool)

(assert (=> mapNonEmpty!39247 m!979009))

(declare-fun m!979011 () Bool)

(assert (=> b!1060439 m!979011))

(check-sat (not b!1060439) (not b_next!21241) (not mapNonEmpty!39247) (not b!1060443) b_and!33929 tp_is_empty!25051 (not b!1060440) (not start!93762))
(check-sat b_and!33929 (not b_next!21241))
