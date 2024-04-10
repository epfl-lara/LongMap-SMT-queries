; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93840 () Bool)

(assert start!93840)

(declare-fun b_free!21313 () Bool)

(declare-fun b_next!21313 () Bool)

(assert (=> start!93840 (= b_free!21313 (not b_next!21313))))

(declare-fun tp!75361 () Bool)

(declare-fun b_and!34027 () Bool)

(assert (=> start!93840 (= tp!75361 b_and!34027)))

(declare-fun b!1061348 () Bool)

(declare-fun res!708772 () Bool)

(declare-fun e!604381 () Bool)

(assert (=> b!1061348 (=> (not res!708772) (not e!604381))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38633 0))(
  ( (V!38634 (val!12612 Int)) )
))
(declare-datatypes ((ValueCell!11858 0))(
  ( (ValueCellFull!11858 (v!15222 V!38633)) (EmptyCell!11858) )
))
(declare-datatypes ((array!67249 0))(
  ( (array!67250 (arr!32332 (Array (_ BitVec 32) ValueCell!11858)) (size!32868 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67249)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67251 0))(
  ( (array!67252 (arr!32333 (Array (_ BitVec 32) (_ BitVec 64))) (size!32869 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67251)

(assert (=> b!1061348 (= res!708772 (and (= (size!32868 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32869 _keys!1163) (size!32868 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!39355 () Bool)

(declare-fun mapRes!39355 () Bool)

(assert (=> mapIsEmpty!39355 mapRes!39355))

(declare-fun b!1061350 () Bool)

(declare-fun res!708771 () Bool)

(assert (=> b!1061350 (=> (not res!708771) (not e!604381))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67251 (_ BitVec 32)) Bool)

(assert (=> b!1061350 (= res!708771 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1061351 () Bool)

(assert (=> b!1061351 (= e!604381 (not true))))

(declare-datatypes ((tuple2!15940 0))(
  ( (tuple2!15941 (_1!7981 (_ BitVec 64)) (_2!7981 V!38633)) )
))
(declare-datatypes ((List!22526 0))(
  ( (Nil!22523) (Cons!22522 (h!23731 tuple2!15940) (t!31835 List!22526)) )
))
(declare-datatypes ((ListLongMap!13909 0))(
  ( (ListLongMap!13910 (toList!6970 List!22526)) )
))
(declare-fun lt!467559 () ListLongMap!13909)

(declare-fun lt!467560 () ListLongMap!13909)

(assert (=> b!1061351 (= lt!467559 lt!467560)))

(declare-fun zeroValueBefore!47 () V!38633)

(declare-datatypes ((Unit!34742 0))(
  ( (Unit!34743) )
))
(declare-fun lt!467558 () Unit!34742)

(declare-fun minValue!907 () V!38633)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38633)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!609 (array!67251 array!67249 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38633 V!38633 V!38633 V!38633 (_ BitVec 32) Int) Unit!34742)

(assert (=> b!1061351 (= lt!467558 (lemmaNoChangeToArrayThenSameMapNoExtras!609 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3572 (array!67251 array!67249 (_ BitVec 32) (_ BitVec 32) V!38633 V!38633 (_ BitVec 32) Int) ListLongMap!13909)

(assert (=> b!1061351 (= lt!467560 (getCurrentListMapNoExtraKeys!3572 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1061351 (= lt!467559 (getCurrentListMapNoExtraKeys!3572 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1061352 () Bool)

(declare-fun e!604379 () Bool)

(declare-fun e!604383 () Bool)

(assert (=> b!1061352 (= e!604379 (and e!604383 mapRes!39355))))

(declare-fun condMapEmpty!39355 () Bool)

(declare-fun mapDefault!39355 () ValueCell!11858)

