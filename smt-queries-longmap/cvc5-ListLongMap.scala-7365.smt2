; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93908 () Bool)

(assert start!93908)

(declare-fun b_free!21367 () Bool)

(declare-fun b_next!21367 () Bool)

(assert (=> start!93908 (= b_free!21367 (not b_next!21367))))

(declare-fun tp!75526 () Bool)

(declare-fun b_and!34089 () Bool)

(assert (=> start!93908 (= tp!75526 b_and!34089)))

(declare-fun b!1062031 () Bool)

(declare-fun e!604871 () Bool)

(assert (=> b!1062031 (= e!604871 true)))

(declare-datatypes ((V!38705 0))(
  ( (V!38706 (val!12639 Int)) )
))
(declare-datatypes ((tuple2!15982 0))(
  ( (tuple2!15983 (_1!8002 (_ BitVec 64)) (_2!8002 V!38705)) )
))
(declare-datatypes ((List!22565 0))(
  ( (Nil!22562) (Cons!22561 (h!23770 tuple2!15982) (t!31876 List!22565)) )
))
(declare-datatypes ((ListLongMap!13951 0))(
  ( (ListLongMap!13952 (toList!6991 List!22565)) )
))
(declare-fun lt!467875 () ListLongMap!13951)

(declare-fun -!557 (ListLongMap!13951 (_ BitVec 64)) ListLongMap!13951)

(assert (=> b!1062031 (= (-!557 lt!467875 #b0000000000000000000000000000000000000000000000000000000000000000) lt!467875)))

(declare-datatypes ((Unit!34784 0))(
  ( (Unit!34785) )
))
(declare-fun lt!467872 () Unit!34784)

(declare-fun removeNotPresentStillSame!4 (ListLongMap!13951 (_ BitVec 64)) Unit!34784)

(assert (=> b!1062031 (= lt!467872 (removeNotPresentStillSame!4 lt!467875 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1062032 () Bool)

(declare-fun e!604875 () Bool)

(assert (=> b!1062032 (= e!604875 e!604871)))

(declare-fun res!709159 () Bool)

(assert (=> b!1062032 (=> res!709159 e!604871)))

(declare-fun contains!6225 (ListLongMap!13951 (_ BitVec 64)) Bool)

(assert (=> b!1062032 (= res!709159 (contains!6225 lt!467875 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((ValueCell!11885 0))(
  ( (ValueCellFull!11885 (v!15249 V!38705)) (EmptyCell!11885) )
))
(declare-datatypes ((array!67359 0))(
  ( (array!67360 (arr!32386 (Array (_ BitVec 32) ValueCell!11885)) (size!32922 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67359)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38705)

(declare-fun zeroValueBefore!47 () V!38705)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67361 0))(
  ( (array!67362 (arr!32387 (Array (_ BitVec 32) (_ BitVec 64))) (size!32923 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67361)

(declare-fun getCurrentListMap!3978 (array!67361 array!67359 (_ BitVec 32) (_ BitVec 32) V!38705 V!38705 (_ BitVec 32) Int) ListLongMap!13951)

(assert (=> b!1062032 (= lt!467875 (getCurrentListMap!3978 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39439 () Bool)

(declare-fun mapRes!39439 () Bool)

(assert (=> mapIsEmpty!39439 mapRes!39439))

(declare-fun res!709155 () Bool)

(declare-fun e!604870 () Bool)

(assert (=> start!93908 (=> (not res!709155) (not e!604870))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93908 (= res!709155 (validMask!0 mask!1515))))

(assert (=> start!93908 e!604870))

(assert (=> start!93908 true))

(declare-fun tp_is_empty!25177 () Bool)

(assert (=> start!93908 tp_is_empty!25177))

(declare-fun e!604873 () Bool)

(declare-fun array_inv!25094 (array!67359) Bool)

(assert (=> start!93908 (and (array_inv!25094 _values!955) e!604873)))

(assert (=> start!93908 tp!75526))

(declare-fun array_inv!25095 (array!67361) Bool)

(assert (=> start!93908 (array_inv!25095 _keys!1163)))

(declare-fun b!1062033 () Bool)

(declare-fun e!604874 () Bool)

(assert (=> b!1062033 (= e!604874 tp_is_empty!25177)))

(declare-fun b!1062034 () Bool)

(assert (=> b!1062034 (= e!604870 (not e!604875))))

(declare-fun res!709156 () Bool)

(assert (=> b!1062034 (=> res!709156 e!604875)))

(assert (=> b!1062034 (= res!709156 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!467876 () ListLongMap!13951)

(declare-fun lt!467873 () ListLongMap!13951)

(assert (=> b!1062034 (= lt!467876 lt!467873)))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun lt!467874 () Unit!34784)

(declare-fun zeroValueAfter!47 () V!38705)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!629 (array!67361 array!67359 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38705 V!38705 V!38705 V!38705 (_ BitVec 32) Int) Unit!34784)

(assert (=> b!1062034 (= lt!467874 (lemmaNoChangeToArrayThenSameMapNoExtras!629 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3592 (array!67361 array!67359 (_ BitVec 32) (_ BitVec 32) V!38705 V!38705 (_ BitVec 32) Int) ListLongMap!13951)

(assert (=> b!1062034 (= lt!467873 (getCurrentListMapNoExtraKeys!3592 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1062034 (= lt!467876 (getCurrentListMapNoExtraKeys!3592 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062035 () Bool)

(declare-fun e!604872 () Bool)

(assert (=> b!1062035 (= e!604872 tp_is_empty!25177)))

(declare-fun b!1062036 () Bool)

(declare-fun res!709157 () Bool)

(assert (=> b!1062036 (=> (not res!709157) (not e!604870))))

(declare-datatypes ((List!22566 0))(
  ( (Nil!22563) (Cons!22562 (h!23771 (_ BitVec 64)) (t!31877 List!22566)) )
))
(declare-fun arrayNoDuplicates!0 (array!67361 (_ BitVec 32) List!22566) Bool)

(assert (=> b!1062036 (= res!709157 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22563))))

(declare-fun b!1062037 () Bool)

(declare-fun res!709160 () Bool)

(assert (=> b!1062037 (=> (not res!709160) (not e!604870))))

(assert (=> b!1062037 (= res!709160 (and (= (size!32922 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32923 _keys!1163) (size!32922 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1062038 () Bool)

(assert (=> b!1062038 (= e!604873 (and e!604872 mapRes!39439))))

(declare-fun condMapEmpty!39439 () Bool)

(declare-fun mapDefault!39439 () ValueCell!11885)

