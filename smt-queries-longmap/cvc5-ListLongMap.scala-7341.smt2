; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93738 () Bool)

(assert start!93738)

(declare-fun b_free!21223 () Bool)

(declare-fun b_next!21223 () Bool)

(assert (=> start!93738 (= b_free!21223 (not b_next!21223))))

(declare-fun tp!75088 () Bool)

(declare-fun b_and!33933 () Bool)

(assert (=> start!93738 (= tp!75088 b_and!33933)))

(declare-fun b!1060331 () Bool)

(declare-fun e!603656 () Bool)

(assert (=> b!1060331 (= e!603656 false)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38513 0))(
  ( (V!38514 (val!12567 Int)) )
))
(declare-fun zeroValueBefore!47 () V!38513)

(declare-datatypes ((tuple2!15882 0))(
  ( (tuple2!15883 (_1!7952 (_ BitVec 64)) (_2!7952 V!38513)) )
))
(declare-datatypes ((List!22469 0))(
  ( (Nil!22466) (Cons!22465 (h!23674 tuple2!15882) (t!31776 List!22469)) )
))
(declare-datatypes ((ListLongMap!13851 0))(
  ( (ListLongMap!13852 (toList!6941 List!22469)) )
))
(declare-fun lt!467254 () ListLongMap!13851)

(declare-datatypes ((ValueCell!11813 0))(
  ( (ValueCellFull!11813 (v!15177 V!38513)) (EmptyCell!11813) )
))
(declare-datatypes ((array!67085 0))(
  ( (array!67086 (arr!32251 (Array (_ BitVec 32) ValueCell!11813)) (size!32787 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67085)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38513)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67087 0))(
  ( (array!67088 (arr!32252 (Array (_ BitVec 32) (_ BitVec 64))) (size!32788 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67087)

(declare-fun getCurrentListMapNoExtraKeys!3543 (array!67087 array!67085 (_ BitVec 32) (_ BitVec 32) V!38513 V!38513 (_ BitVec 32) Int) ListLongMap!13851)

(assert (=> b!1060331 (= lt!467254 (getCurrentListMapNoExtraKeys!3543 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1060332 () Bool)

(declare-fun res!708203 () Bool)

(assert (=> b!1060332 (=> (not res!708203) (not e!603656))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67087 (_ BitVec 32)) Bool)

(assert (=> b!1060332 (= res!708203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1060333 () Bool)

(declare-fun res!708204 () Bool)

(assert (=> b!1060333 (=> (not res!708204) (not e!603656))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1060333 (= res!708204 (and (= (size!32787 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32788 _keys!1163) (size!32787 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!39217 () Bool)

(declare-fun mapRes!39217 () Bool)

(assert (=> mapIsEmpty!39217 mapRes!39217))

(declare-fun mapNonEmpty!39217 () Bool)

(declare-fun tp!75089 () Bool)

(declare-fun e!603660 () Bool)

(assert (=> mapNonEmpty!39217 (= mapRes!39217 (and tp!75089 e!603660))))

(declare-fun mapRest!39217 () (Array (_ BitVec 32) ValueCell!11813))

(declare-fun mapValue!39217 () ValueCell!11813)

(declare-fun mapKey!39217 () (_ BitVec 32))

(assert (=> mapNonEmpty!39217 (= (arr!32251 _values!955) (store mapRest!39217 mapKey!39217 mapValue!39217))))

(declare-fun b!1060334 () Bool)

(declare-fun e!603657 () Bool)

(declare-fun tp_is_empty!25033 () Bool)

(assert (=> b!1060334 (= e!603657 tp_is_empty!25033)))

(declare-fun b!1060330 () Bool)

(declare-fun e!603658 () Bool)

(assert (=> b!1060330 (= e!603658 (and e!603657 mapRes!39217))))

(declare-fun condMapEmpty!39217 () Bool)

(declare-fun mapDefault!39217 () ValueCell!11813)

