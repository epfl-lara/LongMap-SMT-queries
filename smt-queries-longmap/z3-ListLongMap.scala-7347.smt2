; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94022 () Bool)

(assert start!94022)

(declare-fun b_free!21259 () Bool)

(declare-fun b_next!21259 () Bool)

(assert (=> start!94022 (= b_free!21259 (not b_next!21259))))

(declare-fun tp!75199 () Bool)

(declare-fun b_and!33983 () Bool)

(assert (=> start!94022 (= tp!75199 b_and!33983)))

(declare-fun mapNonEmpty!39274 () Bool)

(declare-fun mapRes!39274 () Bool)

(declare-fun tp!75200 () Bool)

(declare-fun e!604829 () Bool)

(assert (=> mapNonEmpty!39274 (= mapRes!39274 (and tp!75200 e!604829))))

(declare-datatypes ((V!38561 0))(
  ( (V!38562 (val!12585 Int)) )
))
(declare-datatypes ((ValueCell!11831 0))(
  ( (ValueCellFull!11831 (v!15191 V!38561)) (EmptyCell!11831) )
))
(declare-fun mapValue!39274 () ValueCell!11831)

(declare-fun mapRest!39274 () (Array (_ BitVec 32) ValueCell!11831))

(declare-datatypes ((array!67201 0))(
  ( (array!67202 (arr!32302 (Array (_ BitVec 32) ValueCell!11831)) (size!32839 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67201)

(declare-fun mapKey!39274 () (_ BitVec 32))

(assert (=> mapNonEmpty!39274 (= (arr!32302 _values!955) (store mapRest!39274 mapKey!39274 mapValue!39274))))

(declare-fun b!1062108 () Bool)

(declare-fun e!604830 () Bool)

(assert (=> b!1062108 (= e!604830 false)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun minValue!907 () V!38561)

(declare-datatypes ((array!67203 0))(
  ( (array!67204 (arr!32303 (Array (_ BitVec 32) (_ BitVec 64))) (size!32840 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67203)

(declare-datatypes ((tuple2!15896 0))(
  ( (tuple2!15897 (_1!7959 (_ BitVec 64)) (_2!7959 V!38561)) )
))
(declare-datatypes ((List!22480 0))(
  ( (Nil!22477) (Cons!22476 (h!23694 tuple2!15896) (t!31781 List!22480)) )
))
(declare-datatypes ((ListLongMap!13873 0))(
  ( (ListLongMap!13874 (toList!6952 List!22480)) )
))
(declare-fun lt!467892 () ListLongMap!13873)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38561)

(declare-fun getCurrentListMapNoExtraKeys!3600 (array!67203 array!67201 (_ BitVec 32) (_ BitVec 32) V!38561 V!38561 (_ BitVec 32) Int) ListLongMap!13873)

(assert (=> b!1062108 (= lt!467892 (getCurrentListMapNoExtraKeys!3600 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!38561)

(declare-fun lt!467891 () ListLongMap!13873)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1062108 (= lt!467891 (getCurrentListMapNoExtraKeys!3600 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!708968 () Bool)

(assert (=> start!94022 (=> (not res!708968) (not e!604830))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94022 (= res!708968 (validMask!0 mask!1515))))

(assert (=> start!94022 e!604830))

(assert (=> start!94022 true))

(declare-fun tp_is_empty!25069 () Bool)

(assert (=> start!94022 tp_is_empty!25069))

(declare-fun e!604833 () Bool)

(declare-fun array_inv!25042 (array!67201) Bool)

(assert (=> start!94022 (and (array_inv!25042 _values!955) e!604833)))

(assert (=> start!94022 tp!75199))

(declare-fun array_inv!25043 (array!67203) Bool)

(assert (=> start!94022 (array_inv!25043 _keys!1163)))

(declare-fun mapIsEmpty!39274 () Bool)

(assert (=> mapIsEmpty!39274 mapRes!39274))

(declare-fun b!1062109 () Bool)

(declare-fun e!604831 () Bool)

(assert (=> b!1062109 (= e!604833 (and e!604831 mapRes!39274))))

(declare-fun condMapEmpty!39274 () Bool)

(declare-fun mapDefault!39274 () ValueCell!11831)

(assert (=> b!1062109 (= condMapEmpty!39274 (= (arr!32302 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11831)) mapDefault!39274)))))

(declare-fun b!1062110 () Bool)

(declare-fun res!708970 () Bool)

(assert (=> b!1062110 (=> (not res!708970) (not e!604830))))

(assert (=> b!1062110 (= res!708970 (and (= (size!32839 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32840 _keys!1163) (size!32839 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1062111 () Bool)

(assert (=> b!1062111 (= e!604831 tp_is_empty!25069)))

(declare-fun b!1062112 () Bool)

(declare-fun res!708969 () Bool)

(assert (=> b!1062112 (=> (not res!708969) (not e!604830))))

(declare-datatypes ((List!22481 0))(
  ( (Nil!22478) (Cons!22477 (h!23695 (_ BitVec 64)) (t!31782 List!22481)) )
))
(declare-fun arrayNoDuplicates!0 (array!67203 (_ BitVec 32) List!22481) Bool)

(assert (=> b!1062112 (= res!708969 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22478))))

(declare-fun b!1062113 () Bool)

(declare-fun res!708967 () Bool)

(assert (=> b!1062113 (=> (not res!708967) (not e!604830))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67203 (_ BitVec 32)) Bool)

(assert (=> b!1062113 (= res!708967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1062114 () Bool)

(assert (=> b!1062114 (= e!604829 tp_is_empty!25069)))

(assert (= (and start!94022 res!708968) b!1062110))

(assert (= (and b!1062110 res!708970) b!1062113))

(assert (= (and b!1062113 res!708967) b!1062112))

(assert (= (and b!1062112 res!708969) b!1062108))

(assert (= (and b!1062109 condMapEmpty!39274) mapIsEmpty!39274))

(assert (= (and b!1062109 (not condMapEmpty!39274)) mapNonEmpty!39274))

(get-info :version)

(assert (= (and mapNonEmpty!39274 ((_ is ValueCellFull!11831) mapValue!39274)) b!1062114))

(assert (= (and b!1062109 ((_ is ValueCellFull!11831) mapDefault!39274)) b!1062111))

(assert (= start!94022 b!1062109))

(declare-fun m!981439 () Bool)

(assert (=> b!1062108 m!981439))

(declare-fun m!981441 () Bool)

(assert (=> b!1062108 m!981441))

(declare-fun m!981443 () Bool)

(assert (=> b!1062112 m!981443))

(declare-fun m!981445 () Bool)

(assert (=> start!94022 m!981445))

(declare-fun m!981447 () Bool)

(assert (=> start!94022 m!981447))

(declare-fun m!981449 () Bool)

(assert (=> start!94022 m!981449))

(declare-fun m!981451 () Bool)

(assert (=> mapNonEmpty!39274 m!981451))

(declare-fun m!981453 () Bool)

(assert (=> b!1062113 m!981453))

(check-sat (not start!94022) (not b_next!21259) (not b!1062112) tp_is_empty!25069 (not mapNonEmpty!39274) (not b!1062113) (not b!1062108) b_and!33983)
(check-sat b_and!33983 (not b_next!21259))
