; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94536 () Bool)

(assert start!94536)

(declare-fun b_free!21841 () Bool)

(declare-fun b_next!21841 () Bool)

(assert (=> start!94536 (= b_free!21841 (not b_next!21841))))

(declare-fun tp!76973 () Bool)

(declare-fun b_and!34643 () Bool)

(assert (=> start!94536 (= tp!76973 b_and!34643)))

(declare-fun b!1069011 () Bool)

(declare-fun res!713314 () Bool)

(declare-fun e!610015 () Bool)

(assert (=> b!1069011 (=> (not res!713314) (not e!610015))))

(declare-datatypes ((array!68279 0))(
  ( (array!68280 (arr!32838 (Array (_ BitVec 32) (_ BitVec 64))) (size!33374 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68279)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68279 (_ BitVec 32)) Bool)

(assert (=> b!1069011 (= res!713314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!40174 () Bool)

(declare-fun mapRes!40174 () Bool)

(declare-fun tp!76972 () Bool)

(declare-fun e!610019 () Bool)

(assert (=> mapNonEmpty!40174 (= mapRes!40174 (and tp!76972 e!610019))))

(declare-fun mapKey!40174 () (_ BitVec 32))

(declare-datatypes ((V!39337 0))(
  ( (V!39338 (val!12876 Int)) )
))
(declare-datatypes ((ValueCell!12122 0))(
  ( (ValueCellFull!12122 (v!15491 V!39337)) (EmptyCell!12122) )
))
(declare-fun mapRest!40174 () (Array (_ BitVec 32) ValueCell!12122))

(declare-fun mapValue!40174 () ValueCell!12122)

(declare-datatypes ((array!68281 0))(
  ( (array!68282 (arr!32839 (Array (_ BitVec 32) ValueCell!12122)) (size!33375 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68281)

(assert (=> mapNonEmpty!40174 (= (arr!32839 _values!955) (store mapRest!40174 mapKey!40174 mapValue!40174))))

(declare-fun res!713313 () Bool)

(assert (=> start!94536 (=> (not res!713313) (not e!610015))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94536 (= res!713313 (validMask!0 mask!1515))))

(assert (=> start!94536 e!610015))

(assert (=> start!94536 true))

(declare-fun tp_is_empty!25651 () Bool)

(assert (=> start!94536 tp_is_empty!25651))

(declare-fun e!610016 () Bool)

(declare-fun array_inv!25416 (array!68281) Bool)

(assert (=> start!94536 (and (array_inv!25416 _values!955) e!610016)))

(assert (=> start!94536 tp!76973))

(declare-fun array_inv!25417 (array!68279) Bool)

(assert (=> start!94536 (array_inv!25417 _keys!1163)))

(declare-fun b!1069012 () Bool)

(declare-fun e!610013 () Bool)

(assert (=> b!1069012 (= e!610016 (and e!610013 mapRes!40174))))

(declare-fun condMapEmpty!40174 () Bool)

(declare-fun mapDefault!40174 () ValueCell!12122)

