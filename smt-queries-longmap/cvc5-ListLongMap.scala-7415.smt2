; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94304 () Bool)

(assert start!94304)

(declare-fun b_free!21667 () Bool)

(declare-fun b_next!21667 () Bool)

(assert (=> start!94304 (= b_free!21667 (not b_next!21667))))

(declare-fun tp!76442 () Bool)

(declare-fun b_and!34439 () Bool)

(assert (=> start!94304 (= tp!76442 b_and!34439)))

(declare-fun b!1066441 () Bool)

(declare-fun e!608117 () Bool)

(declare-fun tp_is_empty!25477 () Bool)

(assert (=> b!1066441 (= e!608117 tp_is_empty!25477)))

(declare-fun b!1066442 () Bool)

(declare-fun res!711781 () Bool)

(declare-fun e!608122 () Bool)

(assert (=> b!1066442 (=> (not res!711781) (not e!608122))))

(declare-datatypes ((array!67939 0))(
  ( (array!67940 (arr!32671 (Array (_ BitVec 32) (_ BitVec 64))) (size!33207 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67939)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67939 (_ BitVec 32)) Bool)

(assert (=> b!1066442 (= res!711781 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1066443 () Bool)

(declare-fun res!711780 () Bool)

(assert (=> b!1066443 (=> (not res!711780) (not e!608122))))

(declare-datatypes ((V!39105 0))(
  ( (V!39106 (val!12789 Int)) )
))
(declare-datatypes ((ValueCell!12035 0))(
  ( (ValueCellFull!12035 (v!15402 V!39105)) (EmptyCell!12035) )
))
(declare-datatypes ((array!67941 0))(
  ( (array!67942 (arr!32672 (Array (_ BitVec 32) ValueCell!12035)) (size!33208 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67941)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1066443 (= res!711780 (and (= (size!33208 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33207 _keys!1163) (size!33208 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1066444 () Bool)

(declare-fun e!608121 () Bool)

(assert (=> b!1066444 (= e!608122 (not e!608121))))

(declare-fun res!711779 () Bool)

(assert (=> b!1066444 (=> res!711779 e!608121)))

(assert (=> b!1066444 (= res!711779 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16218 0))(
  ( (tuple2!16219 (_1!8120 (_ BitVec 64)) (_2!8120 V!39105)) )
))
(declare-datatypes ((List!22782 0))(
  ( (Nil!22779) (Cons!22778 (h!23987 tuple2!16218) (t!32103 List!22782)) )
))
(declare-datatypes ((ListLongMap!14187 0))(
  ( (ListLongMap!14188 (toList!7109 List!22782)) )
))
(declare-fun lt!470811 () ListLongMap!14187)

(declare-fun lt!470809 () ListLongMap!14187)

(assert (=> b!1066444 (= lt!470811 lt!470809)))

(declare-fun zeroValueBefore!47 () V!39105)

(declare-datatypes ((Unit!35013 0))(
  ( (Unit!35014) )
))
(declare-fun lt!470808 () Unit!35013)

(declare-fun minValue!907 () V!39105)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39105)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!732 (array!67939 array!67941 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39105 V!39105 V!39105 V!39105 (_ BitVec 32) Int) Unit!35013)

(assert (=> b!1066444 (= lt!470808 (lemmaNoChangeToArrayThenSameMapNoExtras!732 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3695 (array!67939 array!67941 (_ BitVec 32) (_ BitVec 32) V!39105 V!39105 (_ BitVec 32) Int) ListLongMap!14187)

(assert (=> b!1066444 (= lt!470809 (getCurrentListMapNoExtraKeys!3695 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066444 (= lt!470811 (getCurrentListMapNoExtraKeys!3695 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066445 () Bool)

(declare-fun res!711778 () Bool)

(assert (=> b!1066445 (=> (not res!711778) (not e!608122))))

(declare-datatypes ((List!22783 0))(
  ( (Nil!22780) (Cons!22779 (h!23988 (_ BitVec 64)) (t!32104 List!22783)) )
))
(declare-fun arrayNoDuplicates!0 (array!67939 (_ BitVec 32) List!22783) Bool)

(assert (=> b!1066445 (= res!711778 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22780))))

(declare-fun res!711777 () Bool)

(assert (=> start!94304 (=> (not res!711777) (not e!608122))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94304 (= res!711777 (validMask!0 mask!1515))))

(assert (=> start!94304 e!608122))

(assert (=> start!94304 true))

(assert (=> start!94304 tp_is_empty!25477))

(declare-fun e!608120 () Bool)

(declare-fun array_inv!25298 (array!67941) Bool)

(assert (=> start!94304 (and (array_inv!25298 _values!955) e!608120)))

(assert (=> start!94304 tp!76442))

(declare-fun array_inv!25299 (array!67939) Bool)

(assert (=> start!94304 (array_inv!25299 _keys!1163)))

(declare-fun mapIsEmpty!39904 () Bool)

(declare-fun mapRes!39904 () Bool)

(assert (=> mapIsEmpty!39904 mapRes!39904))

(declare-fun mapNonEmpty!39904 () Bool)

(declare-fun tp!76441 () Bool)

(declare-fun e!608118 () Bool)

(assert (=> mapNonEmpty!39904 (= mapRes!39904 (and tp!76441 e!608118))))

(declare-fun mapValue!39904 () ValueCell!12035)

(declare-fun mapRest!39904 () (Array (_ BitVec 32) ValueCell!12035))

(declare-fun mapKey!39904 () (_ BitVec 32))

(assert (=> mapNonEmpty!39904 (= (arr!32672 _values!955) (store mapRest!39904 mapKey!39904 mapValue!39904))))

(declare-fun b!1066446 () Bool)

(assert (=> b!1066446 (= e!608120 (and e!608117 mapRes!39904))))

(declare-fun condMapEmpty!39904 () Bool)

(declare-fun mapDefault!39904 () ValueCell!12035)

