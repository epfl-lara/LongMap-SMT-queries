; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94002 () Bool)

(assert start!94002)

(declare-fun b_free!21439 () Bool)

(declare-fun b_next!21439 () Bool)

(assert (=> start!94002 (= b_free!21439 (not b_next!21439))))

(declare-fun tp!75745 () Bool)

(declare-fun b_and!34171 () Bool)

(assert (=> start!94002 (= tp!75745 b_and!34171)))

(declare-fun b!1063160 () Bool)

(declare-fun e!605730 () Bool)

(declare-fun e!605729 () Bool)

(assert (=> b!1063160 (= e!605730 e!605729)))

(declare-fun res!709869 () Bool)

(assert (=> b!1063160 (=> res!709869 e!605729)))

(declare-datatypes ((V!38801 0))(
  ( (V!38802 (val!12675 Int)) )
))
(declare-datatypes ((tuple2!16040 0))(
  ( (tuple2!16041 (_1!8031 (_ BitVec 64)) (_2!8031 V!38801)) )
))
(declare-datatypes ((List!22620 0))(
  ( (Nil!22617) (Cons!22616 (h!23825 tuple2!16040) (t!31933 List!22620)) )
))
(declare-datatypes ((ListLongMap!14009 0))(
  ( (ListLongMap!14010 (toList!7020 List!22620)) )
))
(declare-fun lt!468539 () ListLongMap!14009)

(declare-fun contains!6251 (ListLongMap!14009 (_ BitVec 64)) Bool)

(assert (=> b!1063160 (= res!709869 (contains!6251 lt!468539 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38801)

(declare-datatypes ((ValueCell!11921 0))(
  ( (ValueCellFull!11921 (v!15286 V!38801)) (EmptyCell!11921) )
))
(declare-datatypes ((array!67497 0))(
  ( (array!67498 (arr!32454 (Array (_ BitVec 32) ValueCell!11921)) (size!32990 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67497)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38801)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67499 0))(
  ( (array!67500 (arr!32455 (Array (_ BitVec 32) (_ BitVec 64))) (size!32991 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67499)

(declare-fun getCurrentListMap!4003 (array!67499 array!67497 (_ BitVec 32) (_ BitVec 32) V!38801 V!38801 (_ BitVec 32) Int) ListLongMap!14009)

(assert (=> b!1063160 (= lt!468539 (getCurrentListMap!4003 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063161 () Bool)

(declare-fun e!605727 () Bool)

(declare-fun tp_is_empty!25249 () Bool)

(assert (=> b!1063161 (= e!605727 tp_is_empty!25249)))

(declare-fun mapIsEmpty!39550 () Bool)

(declare-fun mapRes!39550 () Bool)

(assert (=> mapIsEmpty!39550 mapRes!39550))

(declare-fun res!709864 () Bool)

(declare-fun e!605728 () Bool)

(assert (=> start!94002 (=> (not res!709864) (not e!605728))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94002 (= res!709864 (validMask!0 mask!1515))))

(assert (=> start!94002 e!605728))

(assert (=> start!94002 true))

(assert (=> start!94002 tp_is_empty!25249))

(declare-fun e!605732 () Bool)

(declare-fun array_inv!25140 (array!67497) Bool)

(assert (=> start!94002 (and (array_inv!25140 _values!955) e!605732)))

(assert (=> start!94002 tp!75745))

(declare-fun array_inv!25141 (array!67499) Bool)

(assert (=> start!94002 (array_inv!25141 _keys!1163)))

(declare-fun b!1063162 () Bool)

(declare-fun res!709865 () Bool)

(assert (=> b!1063162 (=> (not res!709865) (not e!605728))))

(declare-datatypes ((List!22621 0))(
  ( (Nil!22618) (Cons!22617 (h!23826 (_ BitVec 64)) (t!31934 List!22621)) )
))
(declare-fun arrayNoDuplicates!0 (array!67499 (_ BitVec 32) List!22621) Bool)

(assert (=> b!1063162 (= res!709865 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22618))))

(declare-fun b!1063163 () Bool)

(assert (=> b!1063163 (= e!605728 (not e!605730))))

(declare-fun res!709868 () Bool)

(assert (=> b!1063163 (=> res!709868 e!605730)))

(assert (=> b!1063163 (= res!709868 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!468540 () ListLongMap!14009)

(declare-fun lt!468537 () ListLongMap!14009)

(assert (=> b!1063163 (= lt!468540 lt!468537)))

(declare-datatypes ((Unit!34838 0))(
  ( (Unit!34839) )
))
(declare-fun lt!468536 () Unit!34838)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueAfter!47 () V!38801)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!649 (array!67499 array!67497 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38801 V!38801 V!38801 V!38801 (_ BitVec 32) Int) Unit!34838)

(assert (=> b!1063163 (= lt!468536 (lemmaNoChangeToArrayThenSameMapNoExtras!649 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3612 (array!67499 array!67497 (_ BitVec 32) (_ BitVec 32) V!38801 V!38801 (_ BitVec 32) Int) ListLongMap!14009)

(assert (=> b!1063163 (= lt!468537 (getCurrentListMapNoExtraKeys!3612 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1063163 (= lt!468540 (getCurrentListMapNoExtraKeys!3612 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063164 () Bool)

(declare-fun e!605726 () Bool)

(assert (=> b!1063164 (= e!605732 (and e!605726 mapRes!39550))))

(declare-fun condMapEmpty!39550 () Bool)

(declare-fun mapDefault!39550 () ValueCell!11921)

