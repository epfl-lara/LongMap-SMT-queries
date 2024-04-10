; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93828 () Bool)

(assert start!93828)

(declare-fun b_free!21301 () Bool)

(declare-fun b_next!21301 () Bool)

(assert (=> start!93828 (= b_free!21301 (not b_next!21301))))

(declare-fun tp!75326 () Bool)

(declare-fun b_and!34015 () Bool)

(assert (=> start!93828 (= tp!75326 b_and!34015)))

(declare-fun b!1061222 () Bool)

(declare-fun e!604289 () Bool)

(assert (=> b!1061222 (= e!604289 (not true))))

(declare-datatypes ((V!38617 0))(
  ( (V!38618 (val!12606 Int)) )
))
(declare-datatypes ((tuple2!15928 0))(
  ( (tuple2!15929 (_1!7975 (_ BitVec 64)) (_2!7975 V!38617)) )
))
(declare-datatypes ((List!22515 0))(
  ( (Nil!22512) (Cons!22511 (h!23720 tuple2!15928) (t!31824 List!22515)) )
))
(declare-datatypes ((ListLongMap!13897 0))(
  ( (ListLongMap!13898 (toList!6964 List!22515)) )
))
(declare-fun lt!467505 () ListLongMap!13897)

(declare-fun lt!467504 () ListLongMap!13897)

(assert (=> b!1061222 (= lt!467505 lt!467504)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38617)

(declare-datatypes ((Unit!34730 0))(
  ( (Unit!34731) )
))
(declare-fun lt!467506 () Unit!34730)

(declare-datatypes ((ValueCell!11852 0))(
  ( (ValueCellFull!11852 (v!15216 V!38617)) (EmptyCell!11852) )
))
(declare-datatypes ((array!67225 0))(
  ( (array!67226 (arr!32320 (Array (_ BitVec 32) ValueCell!11852)) (size!32856 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67225)

(declare-fun minValue!907 () V!38617)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38617)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67227 0))(
  ( (array!67228 (arr!32321 (Array (_ BitVec 32) (_ BitVec 64))) (size!32857 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67227)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!603 (array!67227 array!67225 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38617 V!38617 V!38617 V!38617 (_ BitVec 32) Int) Unit!34730)

(assert (=> b!1061222 (= lt!467506 (lemmaNoChangeToArrayThenSameMapNoExtras!603 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3566 (array!67227 array!67225 (_ BitVec 32) (_ BitVec 32) V!38617 V!38617 (_ BitVec 32) Int) ListLongMap!13897)

(assert (=> b!1061222 (= lt!467504 (getCurrentListMapNoExtraKeys!3566 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1061222 (= lt!467505 (getCurrentListMapNoExtraKeys!3566 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1061223 () Bool)

(declare-fun res!708700 () Bool)

(assert (=> b!1061223 (=> (not res!708700) (not e!604289))))

(assert (=> b!1061223 (= res!708700 (and (= (size!32856 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32857 _keys!1163) (size!32856 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1061224 () Bool)

(declare-fun res!708697 () Bool)

(assert (=> b!1061224 (=> (not res!708697) (not e!604289))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67227 (_ BitVec 32)) Bool)

(assert (=> b!1061224 (= res!708697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1061225 () Bool)

(declare-fun e!604290 () Bool)

(declare-fun tp_is_empty!25111 () Bool)

(assert (=> b!1061225 (= e!604290 tp_is_empty!25111)))

(declare-fun mapNonEmpty!39337 () Bool)

(declare-fun mapRes!39337 () Bool)

(declare-fun tp!75325 () Bool)

(assert (=> mapNonEmpty!39337 (= mapRes!39337 (and tp!75325 e!604290))))

(declare-fun mapKey!39337 () (_ BitVec 32))

(declare-fun mapValue!39337 () ValueCell!11852)

(declare-fun mapRest!39337 () (Array (_ BitVec 32) ValueCell!11852))

(assert (=> mapNonEmpty!39337 (= (arr!32320 _values!955) (store mapRest!39337 mapKey!39337 mapValue!39337))))

(declare-fun b!1061226 () Bool)

(declare-fun e!604291 () Bool)

(declare-fun e!604292 () Bool)

(assert (=> b!1061226 (= e!604291 (and e!604292 mapRes!39337))))

(declare-fun condMapEmpty!39337 () Bool)

(declare-fun mapDefault!39337 () ValueCell!11852)

