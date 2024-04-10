; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93838 () Bool)

(assert start!93838)

(declare-fun b_free!21311 () Bool)

(declare-fun b_next!21311 () Bool)

(assert (=> start!93838 (= b_free!21311 (not b_next!21311))))

(declare-fun tp!75356 () Bool)

(declare-fun b_and!34025 () Bool)

(assert (=> start!93838 (= tp!75356 b_and!34025)))

(declare-fun b!1061327 () Bool)

(declare-fun res!708759 () Bool)

(declare-fun e!604364 () Bool)

(assert (=> b!1061327 (=> (not res!708759) (not e!604364))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38629 0))(
  ( (V!38630 (val!12611 Int)) )
))
(declare-datatypes ((ValueCell!11857 0))(
  ( (ValueCellFull!11857 (v!15221 V!38629)) (EmptyCell!11857) )
))
(declare-datatypes ((array!67245 0))(
  ( (array!67246 (arr!32330 (Array (_ BitVec 32) ValueCell!11857)) (size!32866 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67245)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67247 0))(
  ( (array!67248 (arr!32331 (Array (_ BitVec 32) (_ BitVec 64))) (size!32867 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67247)

(assert (=> b!1061327 (= res!708759 (and (= (size!32866 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32867 _keys!1163) (size!32866 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1061328 () Bool)

(declare-fun res!708758 () Bool)

(assert (=> b!1061328 (=> (not res!708758) (not e!604364))))

(declare-datatypes ((List!22524 0))(
  ( (Nil!22521) (Cons!22520 (h!23729 (_ BitVec 64)) (t!31833 List!22524)) )
))
(declare-fun arrayNoDuplicates!0 (array!67247 (_ BitVec 32) List!22524) Bool)

(assert (=> b!1061328 (= res!708758 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22521))))

(declare-fun b!1061330 () Bool)

(declare-fun e!604367 () Bool)

(declare-fun tp_is_empty!25121 () Bool)

(assert (=> b!1061330 (= e!604367 tp_is_empty!25121)))

(declare-fun b!1061331 () Bool)

(declare-fun e!604368 () Bool)

(assert (=> b!1061331 (= e!604368 tp_is_empty!25121)))

(declare-fun b!1061332 () Bool)

(assert (=> b!1061332 (= e!604364 (not true))))

(declare-datatypes ((tuple2!15938 0))(
  ( (tuple2!15939 (_1!7980 (_ BitVec 64)) (_2!7980 V!38629)) )
))
(declare-datatypes ((List!22525 0))(
  ( (Nil!22522) (Cons!22521 (h!23730 tuple2!15938) (t!31834 List!22525)) )
))
(declare-datatypes ((ListLongMap!13907 0))(
  ( (ListLongMap!13908 (toList!6969 List!22525)) )
))
(declare-fun lt!467550 () ListLongMap!13907)

(declare-fun lt!467551 () ListLongMap!13907)

(assert (=> b!1061332 (= lt!467550 lt!467551)))

(declare-fun zeroValueBefore!47 () V!38629)

(declare-datatypes ((Unit!34740 0))(
  ( (Unit!34741) )
))
(declare-fun lt!467549 () Unit!34740)

(declare-fun minValue!907 () V!38629)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38629)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!608 (array!67247 array!67245 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38629 V!38629 V!38629 V!38629 (_ BitVec 32) Int) Unit!34740)

(assert (=> b!1061332 (= lt!467549 (lemmaNoChangeToArrayThenSameMapNoExtras!608 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3571 (array!67247 array!67245 (_ BitVec 32) (_ BitVec 32) V!38629 V!38629 (_ BitVec 32) Int) ListLongMap!13907)

(assert (=> b!1061332 (= lt!467551 (getCurrentListMapNoExtraKeys!3571 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1061332 (= lt!467550 (getCurrentListMapNoExtraKeys!3571 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1061333 () Bool)

(declare-fun e!604366 () Bool)

(declare-fun mapRes!39352 () Bool)

(assert (=> b!1061333 (= e!604366 (and e!604368 mapRes!39352))))

(declare-fun condMapEmpty!39352 () Bool)

(declare-fun mapDefault!39352 () ValueCell!11857)

