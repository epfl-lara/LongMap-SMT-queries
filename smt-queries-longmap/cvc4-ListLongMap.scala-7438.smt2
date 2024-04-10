; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94504 () Bool)

(assert start!94504)

(declare-fun b_free!21809 () Bool)

(declare-fun b_next!21809 () Bool)

(assert (=> start!94504 (= b_free!21809 (not b_next!21809))))

(declare-fun tp!76876 () Bool)

(declare-fun b_and!34611 () Bool)

(assert (=> start!94504 (= tp!76876 b_and!34611)))

(declare-fun b!1068579 () Bool)

(declare-fun e!609678 () Bool)

(declare-fun e!609683 () Bool)

(assert (=> b!1068579 (= e!609678 (not e!609683))))

(declare-fun res!713025 () Bool)

(assert (=> b!1068579 (=> res!713025 e!609683)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1068579 (= res!713025 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!39293 0))(
  ( (V!39294 (val!12860 Int)) )
))
(declare-datatypes ((tuple2!16336 0))(
  ( (tuple2!16337 (_1!8179 (_ BitVec 64)) (_2!8179 V!39293)) )
))
(declare-datatypes ((List!22886 0))(
  ( (Nil!22883) (Cons!22882 (h!24091 tuple2!16336) (t!32213 List!22886)) )
))
(declare-datatypes ((ListLongMap!14305 0))(
  ( (ListLongMap!14306 (toList!7168 List!22886)) )
))
(declare-fun lt!472102 () ListLongMap!14305)

(declare-fun lt!472104 () ListLongMap!14305)

(assert (=> b!1068579 (= lt!472102 lt!472104)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39293)

(declare-datatypes ((ValueCell!12106 0))(
  ( (ValueCellFull!12106 (v!15475 V!39293)) (EmptyCell!12106) )
))
(declare-datatypes ((array!68219 0))(
  ( (array!68220 (arr!32808 (Array (_ BitVec 32) ValueCell!12106)) (size!33344 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68219)

(declare-fun minValue!907 () V!39293)

(declare-datatypes ((Unit!35135 0))(
  ( (Unit!35136) )
))
(declare-fun lt!472106 () Unit!35135)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39293)

(declare-datatypes ((array!68221 0))(
  ( (array!68222 (arr!32809 (Array (_ BitVec 32) (_ BitVec 64))) (size!33345 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68221)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!785 (array!68221 array!68219 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39293 V!39293 V!39293 V!39293 (_ BitVec 32) Int) Unit!35135)

(assert (=> b!1068579 (= lt!472106 (lemmaNoChangeToArrayThenSameMapNoExtras!785 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3748 (array!68221 array!68219 (_ BitVec 32) (_ BitVec 32) V!39293 V!39293 (_ BitVec 32) Int) ListLongMap!14305)

(assert (=> b!1068579 (= lt!472104 (getCurrentListMapNoExtraKeys!3748 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1068579 (= lt!472102 (getCurrentListMapNoExtraKeys!3748 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068580 () Bool)

(declare-fun res!713029 () Bool)

(assert (=> b!1068580 (=> (not res!713029) (not e!609678))))

(assert (=> b!1068580 (= res!713029 (and (= (size!33344 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33345 _keys!1163) (size!33344 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1068582 () Bool)

(declare-fun e!609681 () Bool)

(assert (=> b!1068582 (= e!609683 e!609681)))

(declare-fun res!713028 () Bool)

(assert (=> b!1068582 (=> res!713028 e!609681)))

(declare-fun lt!472105 () ListLongMap!14305)

(declare-fun contains!6299 (ListLongMap!14305 (_ BitVec 64)) Bool)

(assert (=> b!1068582 (= res!713028 (contains!6299 lt!472105 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4095 (array!68221 array!68219 (_ BitVec 32) (_ BitVec 32) V!39293 V!39293 (_ BitVec 32) Int) ListLongMap!14305)

(assert (=> b!1068582 (= lt!472105 (getCurrentListMap!4095 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068583 () Bool)

(assert (=> b!1068583 (= e!609681 true)))

(declare-fun -!651 (ListLongMap!14305 (_ BitVec 64)) ListLongMap!14305)

(assert (=> b!1068583 (= (-!651 lt!472105 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472105)))

(declare-fun lt!472103 () Unit!35135)

(declare-fun removeNotPresentStillSame!61 (ListLongMap!14305 (_ BitVec 64)) Unit!35135)

(assert (=> b!1068583 (= lt!472103 (removeNotPresentStillSame!61 lt!472105 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1068584 () Bool)

(declare-fun e!609677 () Bool)

(declare-fun tp_is_empty!25619 () Bool)

(assert (=> b!1068584 (= e!609677 tp_is_empty!25619)))

(declare-fun mapIsEmpty!40126 () Bool)

(declare-fun mapRes!40126 () Bool)

(assert (=> mapIsEmpty!40126 mapRes!40126))

(declare-fun res!713027 () Bool)

(assert (=> start!94504 (=> (not res!713027) (not e!609678))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94504 (= res!713027 (validMask!0 mask!1515))))

(assert (=> start!94504 e!609678))

(assert (=> start!94504 true))

(assert (=> start!94504 tp_is_empty!25619))

(declare-fun e!609680 () Bool)

(declare-fun array_inv!25398 (array!68219) Bool)

(assert (=> start!94504 (and (array_inv!25398 _values!955) e!609680)))

(assert (=> start!94504 tp!76876))

(declare-fun array_inv!25399 (array!68221) Bool)

(assert (=> start!94504 (array_inv!25399 _keys!1163)))

(declare-fun b!1068581 () Bool)

(declare-fun e!609679 () Bool)

(assert (=> b!1068581 (= e!609680 (and e!609679 mapRes!40126))))

(declare-fun condMapEmpty!40126 () Bool)

(declare-fun mapDefault!40126 () ValueCell!12106)

