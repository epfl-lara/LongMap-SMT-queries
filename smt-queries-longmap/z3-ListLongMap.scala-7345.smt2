; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93768 () Bool)

(assert start!93768)

(declare-fun b_free!21247 () Bool)

(declare-fun b_next!21247 () Bool)

(assert (=> start!93768 (= b_free!21247 (not b_next!21247))))

(declare-fun tp!75164 () Bool)

(declare-fun b_and!33935 () Bool)

(assert (=> start!93768 (= tp!75164 b_and!33935)))

(declare-fun b!1060502 () Bool)

(declare-fun e!603794 () Bool)

(declare-fun e!603795 () Bool)

(declare-fun mapRes!39256 () Bool)

(assert (=> b!1060502 (= e!603794 (and e!603795 mapRes!39256))))

(declare-fun condMapEmpty!39256 () Bool)

(declare-datatypes ((V!38545 0))(
  ( (V!38546 (val!12579 Int)) )
))
(declare-datatypes ((ValueCell!11825 0))(
  ( (ValueCellFull!11825 (v!15188 V!38545)) (EmptyCell!11825) )
))
(declare-datatypes ((array!67068 0))(
  ( (array!67069 (arr!32242 (Array (_ BitVec 32) ValueCell!11825)) (size!32780 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67068)

(declare-fun mapDefault!39256 () ValueCell!11825)

(assert (=> b!1060502 (= condMapEmpty!39256 (= (arr!32242 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11825)) mapDefault!39256)))))

(declare-fun mapNonEmpty!39256 () Bool)

(declare-fun tp!75163 () Bool)

(declare-fun e!603793 () Bool)

(assert (=> mapNonEmpty!39256 (= mapRes!39256 (and tp!75163 e!603793))))

(declare-fun mapRest!39256 () (Array (_ BitVec 32) ValueCell!11825))

(declare-fun mapKey!39256 () (_ BitVec 32))

(declare-fun mapValue!39256 () ValueCell!11825)

(assert (=> mapNonEmpty!39256 (= (arr!32242 _values!955) (store mapRest!39256 mapKey!39256 mapValue!39256))))

(declare-fun mapIsEmpty!39256 () Bool)

(assert (=> mapIsEmpty!39256 mapRes!39256))

(declare-fun b!1060503 () Bool)

(declare-fun tp_is_empty!25057 () Bool)

(assert (=> b!1060503 (= e!603793 tp_is_empty!25057)))

(declare-fun b!1060504 () Bool)

(assert (=> b!1060504 (= e!603795 tp_is_empty!25057)))

(declare-fun res!708305 () Bool)

(declare-fun e!603791 () Bool)

(assert (=> start!93768 (=> (not res!708305) (not e!603791))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93768 (= res!708305 (validMask!0 mask!1515))))

(assert (=> start!93768 e!603791))

(assert (=> start!93768 true))

(assert (=> start!93768 tp_is_empty!25057))

(declare-fun array_inv!24988 (array!67068) Bool)

(assert (=> start!93768 (and (array_inv!24988 _values!955) e!603794)))

(assert (=> start!93768 tp!75164))

(declare-datatypes ((array!67070 0))(
  ( (array!67071 (arr!32243 (Array (_ BitVec 32) (_ BitVec 64))) (size!32781 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67070)

(declare-fun array_inv!24989 (array!67070) Bool)

(assert (=> start!93768 (array_inv!24989 _keys!1163)))

(declare-fun b!1060505 () Bool)

(assert (=> b!1060505 (= e!603791 false)))

(declare-datatypes ((tuple2!15956 0))(
  ( (tuple2!15957 (_1!7989 (_ BitVec 64)) (_2!7989 V!38545)) )
))
(declare-datatypes ((List!22512 0))(
  ( (Nil!22509) (Cons!22508 (h!23717 tuple2!15956) (t!31812 List!22512)) )
))
(declare-datatypes ((ListLongMap!13925 0))(
  ( (ListLongMap!13926 (toList!6978 List!22512)) )
))
(declare-fun lt!467140 () ListLongMap!13925)

(declare-fun minValue!907 () V!38545)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38545)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3595 (array!67070 array!67068 (_ BitVec 32) (_ BitVec 32) V!38545 V!38545 (_ BitVec 32) Int) ListLongMap!13925)

(assert (=> b!1060505 (= lt!467140 (getCurrentListMapNoExtraKeys!3595 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!38545)

(declare-fun lt!467141 () ListLongMap!13925)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1060505 (= lt!467141 (getCurrentListMapNoExtraKeys!3595 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1060506 () Bool)

(declare-fun res!708307 () Bool)

(assert (=> b!1060506 (=> (not res!708307) (not e!603791))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67070 (_ BitVec 32)) Bool)

(assert (=> b!1060506 (= res!708307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1060507 () Bool)

(declare-fun res!708306 () Bool)

(assert (=> b!1060507 (=> (not res!708306) (not e!603791))))

(assert (=> b!1060507 (= res!708306 (and (= (size!32780 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32781 _keys!1163) (size!32780 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1060508 () Bool)

(declare-fun res!708304 () Bool)

(assert (=> b!1060508 (=> (not res!708304) (not e!603791))))

(declare-datatypes ((List!22513 0))(
  ( (Nil!22510) (Cons!22509 (h!23718 (_ BitVec 64)) (t!31813 List!22513)) )
))
(declare-fun arrayNoDuplicates!0 (array!67070 (_ BitVec 32) List!22513) Bool)

(assert (=> b!1060508 (= res!708304 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22510))))

(assert (= (and start!93768 res!708305) b!1060507))

(assert (= (and b!1060507 res!708306) b!1060506))

(assert (= (and b!1060506 res!708307) b!1060508))

(assert (= (and b!1060508 res!708304) b!1060505))

(assert (= (and b!1060502 condMapEmpty!39256) mapIsEmpty!39256))

(assert (= (and b!1060502 (not condMapEmpty!39256)) mapNonEmpty!39256))

(get-info :version)

(assert (= (and mapNonEmpty!39256 ((_ is ValueCellFull!11825) mapValue!39256)) b!1060503))

(assert (= (and b!1060502 ((_ is ValueCellFull!11825) mapDefault!39256)) b!1060504))

(assert (= start!93768 b!1060502))

(declare-fun m!979045 () Bool)

(assert (=> b!1060508 m!979045))

(declare-fun m!979047 () Bool)

(assert (=> b!1060505 m!979047))

(declare-fun m!979049 () Bool)

(assert (=> b!1060505 m!979049))

(declare-fun m!979051 () Bool)

(assert (=> b!1060506 m!979051))

(declare-fun m!979053 () Bool)

(assert (=> start!93768 m!979053))

(declare-fun m!979055 () Bool)

(assert (=> start!93768 m!979055))

(declare-fun m!979057 () Bool)

(assert (=> start!93768 m!979057))

(declare-fun m!979059 () Bool)

(assert (=> mapNonEmpty!39256 m!979059))

(check-sat tp_is_empty!25057 (not mapNonEmpty!39256) (not start!93768) (not b!1060508) (not b!1060506) (not b!1060505) b_and!33935 (not b_next!21247))
(check-sat b_and!33935 (not b_next!21247))
