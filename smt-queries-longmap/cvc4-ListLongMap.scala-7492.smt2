; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94928 () Bool)

(assert start!94928)

(declare-fun b_free!22133 () Bool)

(declare-fun b_next!22133 () Bool)

(assert (=> start!94928 (= b_free!22133 (not b_next!22133))))

(declare-fun tp!77864 () Bool)

(declare-fun b_and!34987 () Bool)

(assert (=> start!94928 (= tp!77864 b_and!34987)))

(declare-fun b!1073342 () Bool)

(declare-fun e!613191 () Bool)

(declare-fun tp_is_empty!25943 () Bool)

(assert (=> b!1073342 (= e!613191 tp_is_empty!25943)))

(declare-fun b!1073343 () Bool)

(declare-fun res!715887 () Bool)

(declare-fun e!613193 () Bool)

(assert (=> b!1073343 (=> (not res!715887) (not e!613193))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39725 0))(
  ( (V!39726 (val!13022 Int)) )
))
(declare-datatypes ((ValueCell!12268 0))(
  ( (ValueCellFull!12268 (v!15640 V!39725)) (EmptyCell!12268) )
))
(declare-datatypes ((array!68849 0))(
  ( (array!68850 (arr!33118 (Array (_ BitVec 32) ValueCell!12268)) (size!33654 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68849)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68851 0))(
  ( (array!68852 (arr!33119 (Array (_ BitVec 32) (_ BitVec 64))) (size!33655 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68851)

(assert (=> b!1073343 (= res!715887 (and (= (size!33654 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33655 _keys!1163) (size!33654 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!715888 () Bool)

(assert (=> start!94928 (=> (not res!715888) (not e!613193))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94928 (= res!715888 (validMask!0 mask!1515))))

(assert (=> start!94928 e!613193))

(assert (=> start!94928 true))

(assert (=> start!94928 tp_is_empty!25943))

(declare-fun e!613190 () Bool)

(declare-fun array_inv!25596 (array!68849) Bool)

(assert (=> start!94928 (and (array_inv!25596 _values!955) e!613190)))

(assert (=> start!94928 tp!77864))

(declare-fun array_inv!25597 (array!68851) Bool)

(assert (=> start!94928 (array_inv!25597 _keys!1163)))

(declare-fun b!1073344 () Bool)

(declare-fun e!613192 () Bool)

(assert (=> b!1073344 (= e!613192 tp_is_empty!25943)))

(declare-fun mapIsEmpty!40627 () Bool)

(declare-fun mapRes!40627 () Bool)

(assert (=> mapIsEmpty!40627 mapRes!40627))

(declare-fun b!1073345 () Bool)

(declare-fun res!715886 () Bool)

(assert (=> b!1073345 (=> (not res!715886) (not e!613193))))

(declare-datatypes ((List!23118 0))(
  ( (Nil!23115) (Cons!23114 (h!24323 (_ BitVec 64)) (t!32455 List!23118)) )
))
(declare-fun arrayNoDuplicates!0 (array!68851 (_ BitVec 32) List!23118) Bool)

(assert (=> b!1073345 (= res!715886 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23115))))

(declare-fun b!1073346 () Bool)

(assert (=> b!1073346 (= e!613193 false)))

(declare-datatypes ((tuple2!16580 0))(
  ( (tuple2!16581 (_1!8301 (_ BitVec 64)) (_2!8301 V!39725)) )
))
(declare-datatypes ((List!23119 0))(
  ( (Nil!23116) (Cons!23115 (h!24324 tuple2!16580) (t!32456 List!23119)) )
))
(declare-datatypes ((ListLongMap!14549 0))(
  ( (ListLongMap!14550 (toList!7290 List!23119)) )
))
(declare-fun lt!476019 () ListLongMap!14549)

(declare-fun minValue!907 () V!39725)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39725)

(declare-fun getCurrentListMapNoExtraKeys!3854 (array!68851 array!68849 (_ BitVec 32) (_ BitVec 32) V!39725 V!39725 (_ BitVec 32) Int) ListLongMap!14549)

(assert (=> b!1073346 (= lt!476019 (getCurrentListMapNoExtraKeys!3854 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!39725)

(declare-fun lt!476020 () ListLongMap!14549)

(assert (=> b!1073346 (= lt!476020 (getCurrentListMapNoExtraKeys!3854 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1073347 () Bool)

(declare-fun res!715885 () Bool)

(assert (=> b!1073347 (=> (not res!715885) (not e!613193))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68851 (_ BitVec 32)) Bool)

(assert (=> b!1073347 (= res!715885 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!40627 () Bool)

(declare-fun tp!77863 () Bool)

(assert (=> mapNonEmpty!40627 (= mapRes!40627 (and tp!77863 e!613191))))

(declare-fun mapValue!40627 () ValueCell!12268)

(declare-fun mapRest!40627 () (Array (_ BitVec 32) ValueCell!12268))

(declare-fun mapKey!40627 () (_ BitVec 32))

(assert (=> mapNonEmpty!40627 (= (arr!33118 _values!955) (store mapRest!40627 mapKey!40627 mapValue!40627))))

(declare-fun b!1073348 () Bool)

(assert (=> b!1073348 (= e!613190 (and e!613192 mapRes!40627))))

(declare-fun condMapEmpty!40627 () Bool)

(declare-fun mapDefault!40627 () ValueCell!12268)

