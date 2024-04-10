; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94008 () Bool)

(assert start!94008)

(declare-fun b_free!21445 () Bool)

(declare-fun b_next!21445 () Bool)

(assert (=> start!94008 (= b_free!21445 (not b_next!21445))))

(declare-fun tp!75764 () Bool)

(declare-fun b_and!34177 () Bool)

(assert (=> start!94008 (= tp!75764 b_and!34177)))

(declare-fun b!1063241 () Bool)

(declare-fun e!605793 () Bool)

(declare-fun e!605790 () Bool)

(assert (=> b!1063241 (= e!605793 e!605790)))

(declare-fun res!709919 () Bool)

(assert (=> b!1063241 (=> res!709919 e!605790)))

(declare-datatypes ((V!38809 0))(
  ( (V!38810 (val!12678 Int)) )
))
(declare-datatypes ((tuple2!16046 0))(
  ( (tuple2!16047 (_1!8034 (_ BitVec 64)) (_2!8034 V!38809)) )
))
(declare-datatypes ((List!22625 0))(
  ( (Nil!22622) (Cons!22621 (h!23830 tuple2!16046) (t!31938 List!22625)) )
))
(declare-datatypes ((ListLongMap!14015 0))(
  ( (ListLongMap!14016 (toList!7023 List!22625)) )
))
(declare-fun lt!468582 () ListLongMap!14015)

(declare-fun contains!6253 (ListLongMap!14015 (_ BitVec 64)) Bool)

(assert (=> b!1063241 (= res!709919 (contains!6253 lt!468582 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38809)

(declare-datatypes ((ValueCell!11924 0))(
  ( (ValueCellFull!11924 (v!15289 V!38809)) (EmptyCell!11924) )
))
(declare-datatypes ((array!67509 0))(
  ( (array!67510 (arr!32460 (Array (_ BitVec 32) ValueCell!11924)) (size!32996 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67509)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38809)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67511 0))(
  ( (array!67512 (arr!32461 (Array (_ BitVec 32) (_ BitVec 64))) (size!32997 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67511)

(declare-fun getCurrentListMap!4005 (array!67511 array!67509 (_ BitVec 32) (_ BitVec 32) V!38809 V!38809 (_ BitVec 32) Int) ListLongMap!14015)

(assert (=> b!1063241 (= lt!468582 (getCurrentListMap!4005 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063242 () Bool)

(declare-fun e!605789 () Bool)

(declare-fun tp_is_empty!25255 () Bool)

(assert (=> b!1063242 (= e!605789 tp_is_empty!25255)))

(declare-fun res!709920 () Bool)

(declare-fun e!605791 () Bool)

(assert (=> start!94008 (=> (not res!709920) (not e!605791))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94008 (= res!709920 (validMask!0 mask!1515))))

(assert (=> start!94008 e!605791))

(assert (=> start!94008 true))

(assert (=> start!94008 tp_is_empty!25255))

(declare-fun e!605792 () Bool)

(declare-fun array_inv!25144 (array!67509) Bool)

(assert (=> start!94008 (and (array_inv!25144 _values!955) e!605792)))

(assert (=> start!94008 tp!75764))

(declare-fun array_inv!25145 (array!67511) Bool)

(assert (=> start!94008 (array_inv!25145 _keys!1163)))

(declare-fun b!1063243 () Bool)

(declare-fun res!709921 () Bool)

(assert (=> b!1063243 (=> (not res!709921) (not e!605791))))

(declare-datatypes ((List!22626 0))(
  ( (Nil!22623) (Cons!22622 (h!23831 (_ BitVec 64)) (t!31939 List!22626)) )
))
(declare-fun arrayNoDuplicates!0 (array!67511 (_ BitVec 32) List!22626) Bool)

(assert (=> b!1063243 (= res!709921 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22623))))

(declare-fun b!1063244 () Bool)

(assert (=> b!1063244 (= e!605791 (not e!605793))))

(declare-fun res!709923 () Bool)

(assert (=> b!1063244 (=> res!709923 e!605793)))

(assert (=> b!1063244 (= res!709923 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!468585 () ListLongMap!14015)

(declare-fun lt!468581 () ListLongMap!14015)

(assert (=> b!1063244 (= lt!468585 lt!468581)))

(declare-datatypes ((Unit!34844 0))(
  ( (Unit!34845) )
))
(declare-fun lt!468583 () Unit!34844)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueAfter!47 () V!38809)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!652 (array!67511 array!67509 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38809 V!38809 V!38809 V!38809 (_ BitVec 32) Int) Unit!34844)

(assert (=> b!1063244 (= lt!468583 (lemmaNoChangeToArrayThenSameMapNoExtras!652 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3615 (array!67511 array!67509 (_ BitVec 32) (_ BitVec 32) V!38809 V!38809 (_ BitVec 32) Int) ListLongMap!14015)

(assert (=> b!1063244 (= lt!468581 (getCurrentListMapNoExtraKeys!3615 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1063244 (= lt!468585 (getCurrentListMapNoExtraKeys!3615 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063245 () Bool)

(declare-fun e!605794 () Bool)

(declare-fun mapRes!39559 () Bool)

(assert (=> b!1063245 (= e!605792 (and e!605794 mapRes!39559))))

(declare-fun condMapEmpty!39559 () Bool)

(declare-fun mapDefault!39559 () ValueCell!11924)

