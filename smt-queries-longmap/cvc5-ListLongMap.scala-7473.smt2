; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94762 () Bool)

(assert start!94762)

(declare-fun b_free!22015 () Bool)

(declare-fun b_next!22015 () Bool)

(assert (=> start!94762 (= b_free!22015 (not b_next!22015))))

(declare-fun tp!77503 () Bool)

(declare-fun b_and!34845 () Bool)

(assert (=> start!94762 (= tp!77503 b_and!34845)))

(declare-fun res!714789 () Bool)

(declare-fun e!611850 () Bool)

(assert (=> start!94762 (=> (not res!714789) (not e!611850))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94762 (= res!714789 (validMask!0 mask!1515))))

(assert (=> start!94762 e!611850))

(assert (=> start!94762 true))

(declare-fun tp_is_empty!25825 () Bool)

(assert (=> start!94762 tp_is_empty!25825))

(declare-datatypes ((V!39569 0))(
  ( (V!39570 (val!12963 Int)) )
))
(declare-datatypes ((ValueCell!12209 0))(
  ( (ValueCellFull!12209 (v!15579 V!39569)) (EmptyCell!12209) )
))
(declare-datatypes ((array!68623 0))(
  ( (array!68624 (arr!33007 (Array (_ BitVec 32) ValueCell!12209)) (size!33543 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68623)

(declare-fun e!611848 () Bool)

(declare-fun array_inv!25524 (array!68623) Bool)

(assert (=> start!94762 (and (array_inv!25524 _values!955) e!611848)))

(assert (=> start!94762 tp!77503))

(declare-datatypes ((array!68625 0))(
  ( (array!68626 (arr!33008 (Array (_ BitVec 32) (_ BitVec 64))) (size!33544 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68625)

(declare-fun array_inv!25525 (array!68625) Bool)

(assert (=> start!94762 (array_inv!25525 _keys!1163)))

(declare-fun e!611851 () Bool)

(declare-datatypes ((tuple2!16500 0))(
  ( (tuple2!16501 (_1!8261 (_ BitVec 64)) (_2!8261 V!39569)) )
))
(declare-datatypes ((List!23040 0))(
  ( (Nil!23037) (Cons!23036 (h!24245 tuple2!16500) (t!32373 List!23040)) )
))
(declare-datatypes ((ListLongMap!14469 0))(
  ( (ListLongMap!14470 (toList!7250 List!23040)) )
))
(declare-fun lt!474179 () ListLongMap!14469)

(declare-fun lt!474186 () ListLongMap!14469)

(declare-fun lt!474183 () tuple2!16500)

(declare-fun b!1071507 () Bool)

(declare-fun +!3185 (ListLongMap!14469 tuple2!16500) ListLongMap!14469)

(assert (=> b!1071507 (= e!611851 (= lt!474186 (+!3185 lt!474179 lt!474183)))))

(declare-fun b!1071508 () Bool)

(declare-fun e!611852 () Bool)

(assert (=> b!1071508 (= e!611852 true)))

(declare-fun lt!474178 () ListLongMap!14469)

(declare-fun lt!474188 () ListLongMap!14469)

(declare-fun -!683 (ListLongMap!14469 (_ BitVec 64)) ListLongMap!14469)

(assert (=> b!1071508 (= lt!474178 (-!683 lt!474188 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!474180 () ListLongMap!14469)

(declare-fun lt!474181 () ListLongMap!14469)

(assert (=> b!1071508 (= lt!474180 lt!474181)))

(declare-fun zeroValueBefore!47 () V!39569)

(declare-fun lt!474177 () ListLongMap!14469)

(declare-datatypes ((Unit!35296 0))(
  ( (Unit!35297) )
))
(declare-fun lt!474185 () Unit!35296)

(declare-fun minValue!907 () V!39569)

(declare-fun addCommutativeForDiffKeys!728 (ListLongMap!14469 (_ BitVec 64) V!39569 (_ BitVec 64) V!39569) Unit!35296)

(assert (=> b!1071508 (= lt!474185 (addCommutativeForDiffKeys!728 lt!474177 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!474176 () ListLongMap!14469)

(assert (=> b!1071508 (= (-!683 lt!474181 #b0000000000000000000000000000000000000000000000000000000000000000) lt!474176)))

(declare-fun lt!474182 () tuple2!16500)

(assert (=> b!1071508 (= lt!474181 (+!3185 lt!474176 lt!474182))))

(declare-fun lt!474184 () Unit!35296)

(declare-fun addThenRemoveForNewKeyIsSame!53 (ListLongMap!14469 (_ BitVec 64) V!39569) Unit!35296)

(assert (=> b!1071508 (= lt!474184 (addThenRemoveForNewKeyIsSame!53 lt!474176 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> b!1071508 (= lt!474176 (+!3185 lt!474177 lt!474183))))

(assert (=> b!1071508 e!611851))

(declare-fun res!714786 () Bool)

(assert (=> b!1071508 (=> (not res!714786) (not e!611851))))

(assert (=> b!1071508 (= res!714786 (= lt!474188 lt!474180))))

(assert (=> b!1071508 (= lt!474180 (+!3185 (+!3185 lt!474177 lt!474182) lt!474183))))

(assert (=> b!1071508 (= lt!474183 (tuple2!16501 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1071508 (= lt!474182 (tuple2!16501 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39569)

(declare-fun getCurrentListMap!4149 (array!68625 array!68623 (_ BitVec 32) (_ BitVec 32) V!39569 V!39569 (_ BitVec 32) Int) ListLongMap!14469)

(assert (=> b!1071508 (= lt!474186 (getCurrentListMap!4149 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1071508 (= lt!474188 (getCurrentListMap!4149 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071509 () Bool)

(assert (=> b!1071509 (= e!611850 (not e!611852))))

(declare-fun res!714785 () Bool)

(assert (=> b!1071509 (=> res!714785 e!611852)))

(assert (=> b!1071509 (= res!714785 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1071509 (= lt!474177 lt!474179)))

(declare-fun lt!474187 () Unit!35296)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!857 (array!68625 array!68623 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39569 V!39569 V!39569 V!39569 (_ BitVec 32) Int) Unit!35296)

(assert (=> b!1071509 (= lt!474187 (lemmaNoChangeToArrayThenSameMapNoExtras!857 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3820 (array!68625 array!68623 (_ BitVec 32) (_ BitVec 32) V!39569 V!39569 (_ BitVec 32) Int) ListLongMap!14469)

(assert (=> b!1071509 (= lt!474179 (getCurrentListMapNoExtraKeys!3820 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071509 (= lt!474177 (getCurrentListMapNoExtraKeys!3820 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071510 () Bool)

(declare-fun res!714788 () Bool)

(assert (=> b!1071510 (=> (not res!714788) (not e!611850))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68625 (_ BitVec 32)) Bool)

(assert (=> b!1071510 (= res!714788 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1071511 () Bool)

(declare-fun e!611849 () Bool)

(assert (=> b!1071511 (= e!611849 tp_is_empty!25825)))

(declare-fun b!1071512 () Bool)

(declare-fun mapRes!40444 () Bool)

(assert (=> b!1071512 (= e!611848 (and e!611849 mapRes!40444))))

(declare-fun condMapEmpty!40444 () Bool)

(declare-fun mapDefault!40444 () ValueCell!12209)

