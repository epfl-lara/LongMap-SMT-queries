; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94006 () Bool)

(assert start!94006)

(declare-fun b_free!21443 () Bool)

(declare-fun b_next!21443 () Bool)

(assert (=> start!94006 (= b_free!21443 (not b_next!21443))))

(declare-fun tp!75757 () Bool)

(declare-fun b_and!34175 () Bool)

(assert (=> start!94006 (= tp!75757 b_and!34175)))

(declare-fun b!1063214 () Bool)

(declare-fun e!605771 () Bool)

(declare-fun tp_is_empty!25253 () Bool)

(assert (=> b!1063214 (= e!605771 tp_is_empty!25253)))

(declare-fun b!1063215 () Bool)

(declare-fun e!605772 () Bool)

(assert (=> b!1063215 (= e!605772 true)))

(declare-datatypes ((V!38805 0))(
  ( (V!38806 (val!12677 Int)) )
))
(declare-datatypes ((tuple2!16044 0))(
  ( (tuple2!16045 (_1!8033 (_ BitVec 64)) (_2!8033 V!38805)) )
))
(declare-datatypes ((List!22624 0))(
  ( (Nil!22621) (Cons!22620 (h!23829 tuple2!16044) (t!31937 List!22624)) )
))
(declare-datatypes ((ListLongMap!14013 0))(
  ( (ListLongMap!14014 (toList!7022 List!22624)) )
))
(declare-fun lt!468568 () ListLongMap!14013)

(declare-fun -!583 (ListLongMap!14013 (_ BitVec 64)) ListLongMap!14013)

(assert (=> b!1063215 (= (-!583 lt!468568 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468568)))

(declare-datatypes ((Unit!34842 0))(
  ( (Unit!34843) )
))
(declare-fun lt!468566 () Unit!34842)

(declare-fun removeNotPresentStillSame!30 (ListLongMap!14013 (_ BitVec 64)) Unit!34842)

(assert (=> b!1063215 (= lt!468566 (removeNotPresentStillSame!30 lt!468568 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1063216 () Bool)

(declare-fun e!605770 () Bool)

(declare-fun e!605773 () Bool)

(assert (=> b!1063216 (= e!605770 (not e!605773))))

(declare-fun res!709903 () Bool)

(assert (=> b!1063216 (=> res!709903 e!605773)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1063216 (= res!709903 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!468569 () ListLongMap!14013)

(declare-fun lt!468567 () ListLongMap!14013)

(assert (=> b!1063216 (= lt!468569 lt!468567)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38805)

(declare-datatypes ((ValueCell!11923 0))(
  ( (ValueCellFull!11923 (v!15288 V!38805)) (EmptyCell!11923) )
))
(declare-datatypes ((array!67505 0))(
  ( (array!67506 (arr!32458 (Array (_ BitVec 32) ValueCell!11923)) (size!32994 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67505)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38805)

(declare-fun lt!468570 () Unit!34842)

(declare-fun minValue!907 () V!38805)

(declare-datatypes ((array!67507 0))(
  ( (array!67508 (arr!32459 (Array (_ BitVec 32) (_ BitVec 64))) (size!32995 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67507)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!651 (array!67507 array!67505 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38805 V!38805 V!38805 V!38805 (_ BitVec 32) Int) Unit!34842)

(assert (=> b!1063216 (= lt!468570 (lemmaNoChangeToArrayThenSameMapNoExtras!651 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3614 (array!67507 array!67505 (_ BitVec 32) (_ BitVec 32) V!38805 V!38805 (_ BitVec 32) Int) ListLongMap!14013)

(assert (=> b!1063216 (= lt!468567 (getCurrentListMapNoExtraKeys!3614 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1063216 (= lt!468569 (getCurrentListMapNoExtraKeys!3614 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063217 () Bool)

(declare-fun res!709901 () Bool)

(assert (=> b!1063217 (=> (not res!709901) (not e!605770))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67507 (_ BitVec 32)) Bool)

(assert (=> b!1063217 (= res!709901 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!39556 () Bool)

(declare-fun mapRes!39556 () Bool)

(assert (=> mapIsEmpty!39556 mapRes!39556))

(declare-fun b!1063218 () Bool)

(declare-fun e!605774 () Bool)

(assert (=> b!1063218 (= e!605774 (and e!605771 mapRes!39556))))

(declare-fun condMapEmpty!39556 () Bool)

(declare-fun mapDefault!39556 () ValueCell!11923)

