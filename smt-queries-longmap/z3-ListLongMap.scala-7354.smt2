; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93822 () Bool)

(assert start!93822)

(declare-fun b_free!21301 () Bool)

(declare-fun b_next!21301 () Bool)

(assert (=> start!93822 (= b_free!21301 (not b_next!21301))))

(declare-fun tp!75326 () Bool)

(declare-fun b_and!33989 () Bool)

(assert (=> start!93822 (= tp!75326 b_and!33989)))

(declare-fun b!1061069 () Bool)

(declare-fun res!708631 () Bool)

(declare-fun e!604196 () Bool)

(assert (=> b!1061069 (=> (not res!708631) (not e!604196))))

(declare-datatypes ((array!67172 0))(
  ( (array!67173 (arr!32294 (Array (_ BitVec 32) (_ BitVec 64))) (size!32832 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67172)

(declare-datatypes ((List!22556 0))(
  ( (Nil!22553) (Cons!22552 (h!23761 (_ BitVec 64)) (t!31856 List!22556)) )
))
(declare-fun arrayNoDuplicates!0 (array!67172 (_ BitVec 32) List!22556) Bool)

(assert (=> b!1061069 (= res!708631 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22553))))

(declare-fun b!1061070 () Bool)

(declare-fun res!708630 () Bool)

(assert (=> b!1061070 (=> (not res!708630) (not e!604196))))

(declare-datatypes ((V!38617 0))(
  ( (V!38618 (val!12606 Int)) )
))
(declare-datatypes ((ValueCell!11852 0))(
  ( (ValueCellFull!11852 (v!15215 V!38617)) (EmptyCell!11852) )
))
(declare-datatypes ((array!67174 0))(
  ( (array!67175 (arr!32295 (Array (_ BitVec 32) ValueCell!11852)) (size!32833 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67174)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1061070 (= res!708630 (and (= (size!32833 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32832 _keys!1163) (size!32833 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1061071 () Bool)

(assert (=> b!1061071 (= e!604196 (not true))))

(declare-datatypes ((tuple2!16002 0))(
  ( (tuple2!16003 (_1!8012 (_ BitVec 64)) (_2!8012 V!38617)) )
))
(declare-datatypes ((List!22557 0))(
  ( (Nil!22554) (Cons!22553 (h!23762 tuple2!16002) (t!31857 List!22557)) )
))
(declare-datatypes ((ListLongMap!13971 0))(
  ( (ListLongMap!13972 (toList!7001 List!22557)) )
))
(declare-fun lt!467305 () ListLongMap!13971)

(declare-fun lt!467306 () ListLongMap!13971)

(assert (=> b!1061071 (= lt!467305 lt!467306)))

(declare-fun zeroValueBefore!47 () V!38617)

(declare-fun minValue!907 () V!38617)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38617)

(declare-datatypes ((Unit!34601 0))(
  ( (Unit!34602) )
))
(declare-fun lt!467304 () Unit!34601)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!612 (array!67172 array!67174 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38617 V!38617 V!38617 V!38617 (_ BitVec 32) Int) Unit!34601)

(assert (=> b!1061071 (= lt!467304 (lemmaNoChangeToArrayThenSameMapNoExtras!612 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3618 (array!67172 array!67174 (_ BitVec 32) (_ BitVec 32) V!38617 V!38617 (_ BitVec 32) Int) ListLongMap!13971)

(assert (=> b!1061071 (= lt!467306 (getCurrentListMapNoExtraKeys!3618 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1061071 (= lt!467305 (getCurrentListMapNoExtraKeys!3618 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!708629 () Bool)

(assert (=> start!93822 (=> (not res!708629) (not e!604196))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93822 (= res!708629 (validMask!0 mask!1515))))

(assert (=> start!93822 e!604196))

(assert (=> start!93822 true))

(declare-fun tp_is_empty!25111 () Bool)

(assert (=> start!93822 tp_is_empty!25111))

(declare-fun e!604197 () Bool)

(declare-fun array_inv!25030 (array!67174) Bool)

(assert (=> start!93822 (and (array_inv!25030 _values!955) e!604197)))

(assert (=> start!93822 tp!75326))

(declare-fun array_inv!25031 (array!67172) Bool)

(assert (=> start!93822 (array_inv!25031 _keys!1163)))

(declare-fun mapIsEmpty!39337 () Bool)

(declare-fun mapRes!39337 () Bool)

(assert (=> mapIsEmpty!39337 mapRes!39337))

(declare-fun b!1061072 () Bool)

(declare-fun e!604199 () Bool)

(assert (=> b!1061072 (= e!604199 tp_is_empty!25111)))

(declare-fun b!1061073 () Bool)

(declare-fun e!604200 () Bool)

(assert (=> b!1061073 (= e!604197 (and e!604200 mapRes!39337))))

(declare-fun condMapEmpty!39337 () Bool)

(declare-fun mapDefault!39337 () ValueCell!11852)

(assert (=> b!1061073 (= condMapEmpty!39337 (= (arr!32295 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11852)) mapDefault!39337)))))

(declare-fun mapNonEmpty!39337 () Bool)

(declare-fun tp!75325 () Bool)

(assert (=> mapNonEmpty!39337 (= mapRes!39337 (and tp!75325 e!604199))))

(declare-fun mapValue!39337 () ValueCell!11852)

(declare-fun mapRest!39337 () (Array (_ BitVec 32) ValueCell!11852))

(declare-fun mapKey!39337 () (_ BitVec 32))

(assert (=> mapNonEmpty!39337 (= (arr!32295 _values!955) (store mapRest!39337 mapKey!39337 mapValue!39337))))

(declare-fun b!1061074 () Bool)

(assert (=> b!1061074 (= e!604200 tp_is_empty!25111)))

(declare-fun b!1061075 () Bool)

(declare-fun res!708628 () Bool)

(assert (=> b!1061075 (=> (not res!708628) (not e!604196))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67172 (_ BitVec 32)) Bool)

(assert (=> b!1061075 (= res!708628 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(assert (= (and start!93822 res!708629) b!1061070))

(assert (= (and b!1061070 res!708630) b!1061075))

(assert (= (and b!1061075 res!708628) b!1061069))

(assert (= (and b!1061069 res!708631) b!1061071))

(assert (= (and b!1061073 condMapEmpty!39337) mapIsEmpty!39337))

(assert (= (and b!1061073 (not condMapEmpty!39337)) mapNonEmpty!39337))

(get-info :version)

(assert (= (and mapNonEmpty!39337 ((_ is ValueCellFull!11852) mapValue!39337)) b!1061072))

(assert (= (and b!1061073 ((_ is ValueCellFull!11852) mapDefault!39337)) b!1061074))

(assert (= start!93822 b!1061073))

(declare-fun m!979477 () Bool)

(assert (=> start!93822 m!979477))

(declare-fun m!979479 () Bool)

(assert (=> start!93822 m!979479))

(declare-fun m!979481 () Bool)

(assert (=> start!93822 m!979481))

(declare-fun m!979483 () Bool)

(assert (=> b!1061071 m!979483))

(declare-fun m!979485 () Bool)

(assert (=> b!1061071 m!979485))

(declare-fun m!979487 () Bool)

(assert (=> b!1061071 m!979487))

(declare-fun m!979489 () Bool)

(assert (=> b!1061069 m!979489))

(declare-fun m!979491 () Bool)

(assert (=> mapNonEmpty!39337 m!979491))

(declare-fun m!979493 () Bool)

(assert (=> b!1061075 m!979493))

(check-sat (not b_next!21301) (not start!93822) (not b!1061071) tp_is_empty!25111 (not b!1061069) b_and!33989 (not mapNonEmpty!39337) (not b!1061075))
(check-sat b_and!33989 (not b_next!21301))
