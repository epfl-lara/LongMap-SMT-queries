; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93932 () Bool)

(assert start!93932)

(declare-fun b_free!21391 () Bool)

(declare-fun b_next!21391 () Bool)

(assert (=> start!93932 (= b_free!21391 (not b_next!21391))))

(declare-fun tp!75599 () Bool)

(declare-fun b_and!34113 () Bool)

(assert (=> start!93932 (= tp!75599 b_and!34113)))

(declare-fun b!1062355 () Bool)

(declare-fun e!605126 () Bool)

(assert (=> b!1062355 (= e!605126 true)))

(declare-datatypes ((V!38737 0))(
  ( (V!38738 (val!12651 Int)) )
))
(declare-datatypes ((tuple2!16002 0))(
  ( (tuple2!16003 (_1!8012 (_ BitVec 64)) (_2!8012 V!38737)) )
))
(declare-datatypes ((List!22585 0))(
  ( (Nil!22582) (Cons!22581 (h!23790 tuple2!16002) (t!31896 List!22585)) )
))
(declare-datatypes ((ListLongMap!13971 0))(
  ( (ListLongMap!13972 (toList!7001 List!22585)) )
))
(declare-fun lt!468052 () ListLongMap!13971)

(declare-fun -!565 (ListLongMap!13971 (_ BitVec 64)) ListLongMap!13971)

(assert (=> b!1062355 (= (-!565 lt!468052 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468052)))

(declare-datatypes ((Unit!34800 0))(
  ( (Unit!34801) )
))
(declare-fun lt!468054 () Unit!34800)

(declare-fun removeNotPresentStillSame!12 (ListLongMap!13971 (_ BitVec 64)) Unit!34800)

(assert (=> b!1062355 (= lt!468054 (removeNotPresentStillSame!12 lt!468052 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1062356 () Bool)

(declare-fun e!605122 () Bool)

(declare-fun tp_is_empty!25201 () Bool)

(assert (=> b!1062356 (= e!605122 tp_is_empty!25201)))

(declare-fun b!1062357 () Bool)

(declare-fun e!605128 () Bool)

(declare-fun e!605123 () Bool)

(assert (=> b!1062357 (= e!605128 (not e!605123))))

(declare-fun res!709376 () Bool)

(assert (=> b!1062357 (=> res!709376 e!605123)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1062357 (= res!709376 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!468053 () ListLongMap!13971)

(declare-fun lt!468056 () ListLongMap!13971)

(assert (=> b!1062357 (= lt!468053 lt!468056)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38737)

(declare-fun lt!468055 () Unit!34800)

(declare-datatypes ((ValueCell!11897 0))(
  ( (ValueCellFull!11897 (v!15261 V!38737)) (EmptyCell!11897) )
))
(declare-datatypes ((array!67405 0))(
  ( (array!67406 (arr!32409 (Array (_ BitVec 32) ValueCell!11897)) (size!32945 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67405)

(declare-fun minValue!907 () V!38737)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38737)

(declare-datatypes ((array!67407 0))(
  ( (array!67408 (arr!32410 (Array (_ BitVec 32) (_ BitVec 64))) (size!32946 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67407)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!636 (array!67407 array!67405 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38737 V!38737 V!38737 V!38737 (_ BitVec 32) Int) Unit!34800)

(assert (=> b!1062357 (= lt!468055 (lemmaNoChangeToArrayThenSameMapNoExtras!636 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3599 (array!67407 array!67405 (_ BitVec 32) (_ BitVec 32) V!38737 V!38737 (_ BitVec 32) Int) ListLongMap!13971)

(assert (=> b!1062357 (= lt!468056 (getCurrentListMapNoExtraKeys!3599 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1062357 (= lt!468053 (getCurrentListMapNoExtraKeys!3599 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062358 () Bool)

(declare-fun e!605124 () Bool)

(assert (=> b!1062358 (= e!605124 tp_is_empty!25201)))

(declare-fun mapIsEmpty!39475 () Bool)

(declare-fun mapRes!39475 () Bool)

(assert (=> mapIsEmpty!39475 mapRes!39475))

(declare-fun b!1062359 () Bool)

(declare-fun res!709375 () Bool)

(assert (=> b!1062359 (=> (not res!709375) (not e!605128))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67407 (_ BitVec 32)) Bool)

(assert (=> b!1062359 (= res!709375 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1062360 () Bool)

(declare-fun res!709371 () Bool)

(assert (=> b!1062360 (=> (not res!709371) (not e!605128))))

(declare-datatypes ((List!22586 0))(
  ( (Nil!22583) (Cons!22582 (h!23791 (_ BitVec 64)) (t!31897 List!22586)) )
))
(declare-fun arrayNoDuplicates!0 (array!67407 (_ BitVec 32) List!22586) Bool)

(assert (=> b!1062360 (= res!709371 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22583))))

(declare-fun b!1062361 () Bool)

(declare-fun e!605127 () Bool)

(assert (=> b!1062361 (= e!605127 (and e!605124 mapRes!39475))))

(declare-fun condMapEmpty!39475 () Bool)

(declare-fun mapDefault!39475 () ValueCell!11897)

