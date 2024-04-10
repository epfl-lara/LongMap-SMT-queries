; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93876 () Bool)

(assert start!93876)

(declare-fun b_free!21349 () Bool)

(declare-fun b_next!21349 () Bool)

(assert (=> start!93876 (= b_free!21349 (not b_next!21349))))

(declare-fun tp!75469 () Bool)

(declare-fun b_and!34063 () Bool)

(assert (=> start!93876 (= tp!75469 b_and!34063)))

(declare-fun b!1061726 () Bool)

(declare-fun e!604649 () Bool)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67321 0))(
  ( (array!67322 (arr!32368 (Array (_ BitVec 32) (_ BitVec 64))) (size!32904 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67321)

(assert (=> b!1061726 (= e!604649 (not (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!32904 _keys!1163)))))))

(declare-datatypes ((V!38681 0))(
  ( (V!38682 (val!12630 Int)) )
))
(declare-datatypes ((tuple2!15966 0))(
  ( (tuple2!15967 (_1!7994 (_ BitVec 64)) (_2!7994 V!38681)) )
))
(declare-datatypes ((List!22551 0))(
  ( (Nil!22548) (Cons!22547 (h!23756 tuple2!15966) (t!31860 List!22551)) )
))
(declare-datatypes ((ListLongMap!13935 0))(
  ( (ListLongMap!13936 (toList!6983 List!22551)) )
))
(declare-fun lt!467721 () ListLongMap!13935)

(declare-fun lt!467720 () ListLongMap!13935)

(assert (=> b!1061726 (= lt!467721 lt!467720)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38681)

(declare-datatypes ((Unit!34768 0))(
  ( (Unit!34769) )
))
(declare-fun lt!467722 () Unit!34768)

(declare-datatypes ((ValueCell!11876 0))(
  ( (ValueCellFull!11876 (v!15240 V!38681)) (EmptyCell!11876) )
))
(declare-datatypes ((array!67323 0))(
  ( (array!67324 (arr!32369 (Array (_ BitVec 32) ValueCell!11876)) (size!32905 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67323)

(declare-fun minValue!907 () V!38681)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38681)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!622 (array!67321 array!67323 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38681 V!38681 V!38681 V!38681 (_ BitVec 32) Int) Unit!34768)

(assert (=> b!1061726 (= lt!467722 (lemmaNoChangeToArrayThenSameMapNoExtras!622 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3585 (array!67321 array!67323 (_ BitVec 32) (_ BitVec 32) V!38681 V!38681 (_ BitVec 32) Int) ListLongMap!13935)

(assert (=> b!1061726 (= lt!467720 (getCurrentListMapNoExtraKeys!3585 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1061726 (= lt!467721 (getCurrentListMapNoExtraKeys!3585 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1061727 () Bool)

(declare-fun res!708987 () Bool)

(assert (=> b!1061727 (=> (not res!708987) (not e!604649))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67321 (_ BitVec 32)) Bool)

(assert (=> b!1061727 (= res!708987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1061728 () Bool)

(declare-fun res!708986 () Bool)

(assert (=> b!1061728 (=> (not res!708986) (not e!604649))))

(assert (=> b!1061728 (= res!708986 (and (= (size!32905 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32904 _keys!1163) (size!32905 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1061729 () Bool)

(declare-fun e!604650 () Bool)

(declare-fun e!604651 () Bool)

(declare-fun mapRes!39409 () Bool)

(assert (=> b!1061729 (= e!604650 (and e!604651 mapRes!39409))))

(declare-fun condMapEmpty!39409 () Bool)

(declare-fun mapDefault!39409 () ValueCell!11876)

