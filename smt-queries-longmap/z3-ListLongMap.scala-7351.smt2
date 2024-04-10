; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93812 () Bool)

(assert start!93812)

(declare-fun b_free!21285 () Bool)

(declare-fun b_next!21285 () Bool)

(assert (=> start!93812 (= b_free!21285 (not b_next!21285))))

(declare-fun tp!75278 () Bool)

(declare-fun b_and!33999 () Bool)

(assert (=> start!93812 (= tp!75278 b_and!33999)))

(declare-fun b!1061054 () Bool)

(declare-fun e!604170 () Bool)

(assert (=> b!1061054 (= e!604170 false)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38595 0))(
  ( (V!38596 (val!12598 Int)) )
))
(declare-fun minValue!907 () V!38595)

(declare-datatypes ((array!67199 0))(
  ( (array!67200 (arr!32307 (Array (_ BitVec 32) (_ BitVec 64))) (size!32843 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67199)

(declare-datatypes ((tuple2!15920 0))(
  ( (tuple2!15921 (_1!7971 (_ BitVec 64)) (_2!7971 V!38595)) )
))
(declare-datatypes ((List!22507 0))(
  ( (Nil!22504) (Cons!22503 (h!23712 tuple2!15920) (t!31816 List!22507)) )
))
(declare-datatypes ((ListLongMap!13889 0))(
  ( (ListLongMap!13890 (toList!6960 List!22507)) )
))
(declare-fun lt!467454 () ListLongMap!13889)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-datatypes ((ValueCell!11844 0))(
  ( (ValueCellFull!11844 (v!15208 V!38595)) (EmptyCell!11844) )
))
(declare-datatypes ((array!67201 0))(
  ( (array!67202 (arr!32308 (Array (_ BitVec 32) ValueCell!11844)) (size!32844 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67201)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38595)

(declare-fun getCurrentListMapNoExtraKeys!3562 (array!67199 array!67201 (_ BitVec 32) (_ BitVec 32) V!38595 V!38595 (_ BitVec 32) Int) ListLongMap!13889)

(assert (=> b!1061054 (= lt!467454 (getCurrentListMapNoExtraKeys!3562 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!38595)

(declare-fun lt!467455 () ListLongMap!13889)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1061054 (= lt!467455 (getCurrentListMapNoExtraKeys!3562 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1061055 () Bool)

(declare-fun e!604171 () Bool)

(declare-fun e!604173 () Bool)

(declare-fun mapRes!39313 () Bool)

(assert (=> b!1061055 (= e!604171 (and e!604173 mapRes!39313))))

(declare-fun condMapEmpty!39313 () Bool)

(declare-fun mapDefault!39313 () ValueCell!11844)

(assert (=> b!1061055 (= condMapEmpty!39313 (= (arr!32308 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11844)) mapDefault!39313)))))

(declare-fun mapNonEmpty!39313 () Bool)

(declare-fun tp!75277 () Bool)

(declare-fun e!604172 () Bool)

(assert (=> mapNonEmpty!39313 (= mapRes!39313 (and tp!75277 e!604172))))

(declare-fun mapRest!39313 () (Array (_ BitVec 32) ValueCell!11844))

(declare-fun mapValue!39313 () ValueCell!11844)

(declare-fun mapKey!39313 () (_ BitVec 32))

(assert (=> mapNonEmpty!39313 (= (arr!32308 _values!955) (store mapRest!39313 mapKey!39313 mapValue!39313))))

(declare-fun b!1061056 () Bool)

(declare-fun res!708604 () Bool)

(assert (=> b!1061056 (=> (not res!708604) (not e!604170))))

(assert (=> b!1061056 (= res!708604 (and (= (size!32844 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32843 _keys!1163) (size!32844 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1061057 () Bool)

(declare-fun res!708602 () Bool)

(assert (=> b!1061057 (=> (not res!708602) (not e!604170))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67199 (_ BitVec 32)) Bool)

(assert (=> b!1061057 (= res!708602 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1061058 () Bool)

(declare-fun tp_is_empty!25095 () Bool)

(assert (=> b!1061058 (= e!604172 tp_is_empty!25095)))

(declare-fun mapIsEmpty!39313 () Bool)

(assert (=> mapIsEmpty!39313 mapRes!39313))

(declare-fun b!1061059 () Bool)

(assert (=> b!1061059 (= e!604173 tp_is_empty!25095)))

(declare-fun b!1061060 () Bool)

(declare-fun res!708603 () Bool)

(assert (=> b!1061060 (=> (not res!708603) (not e!604170))))

(declare-datatypes ((List!22508 0))(
  ( (Nil!22505) (Cons!22504 (h!23713 (_ BitVec 64)) (t!31817 List!22508)) )
))
(declare-fun arrayNoDuplicates!0 (array!67199 (_ BitVec 32) List!22508) Bool)

(assert (=> b!1061060 (= res!708603 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22505))))

(declare-fun res!708601 () Bool)

(assert (=> start!93812 (=> (not res!708601) (not e!604170))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93812 (= res!708601 (validMask!0 mask!1515))))

(assert (=> start!93812 e!604170))

(assert (=> start!93812 true))

(assert (=> start!93812 tp_is_empty!25095))

(declare-fun array_inv!25038 (array!67201) Bool)

(assert (=> start!93812 (and (array_inv!25038 _values!955) e!604171)))

(assert (=> start!93812 tp!75278))

(declare-fun array_inv!25039 (array!67199) Bool)

(assert (=> start!93812 (array_inv!25039 _keys!1163)))

(assert (= (and start!93812 res!708601) b!1061056))

(assert (= (and b!1061056 res!708604) b!1061057))

(assert (= (and b!1061057 res!708602) b!1061060))

(assert (= (and b!1061060 res!708603) b!1061054))

(assert (= (and b!1061055 condMapEmpty!39313) mapIsEmpty!39313))

(assert (= (and b!1061055 (not condMapEmpty!39313)) mapNonEmpty!39313))

(get-info :version)

(assert (= (and mapNonEmpty!39313 ((_ is ValueCellFull!11844) mapValue!39313)) b!1061058))

(assert (= (and b!1061055 ((_ is ValueCellFull!11844) mapDefault!39313)) b!1061059))

(assert (= start!93812 b!1061055))

(declare-fun m!979975 () Bool)

(assert (=> b!1061057 m!979975))

(declare-fun m!979977 () Bool)

(assert (=> b!1061054 m!979977))

(declare-fun m!979979 () Bool)

(assert (=> b!1061054 m!979979))

(declare-fun m!979981 () Bool)

(assert (=> b!1061060 m!979981))

(declare-fun m!979983 () Bool)

(assert (=> start!93812 m!979983))

(declare-fun m!979985 () Bool)

(assert (=> start!93812 m!979985))

(declare-fun m!979987 () Bool)

(assert (=> start!93812 m!979987))

(declare-fun m!979989 () Bool)

(assert (=> mapNonEmpty!39313 m!979989))

(check-sat b_and!33999 (not mapNonEmpty!39313) (not b!1061057) (not b!1061054) (not b_next!21285) tp_is_empty!25095 (not start!93812) (not b!1061060))
(check-sat b_and!33999 (not b_next!21285))
