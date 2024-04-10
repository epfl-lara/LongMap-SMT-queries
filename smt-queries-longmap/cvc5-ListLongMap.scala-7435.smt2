; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94460 () Bool)

(assert start!94460)

(declare-fun b_free!21787 () Bool)

(declare-fun b_next!21787 () Bool)

(assert (=> start!94460 (= b_free!21787 (not b_next!21787))))

(declare-fun tp!76808 () Bool)

(declare-fun b_and!34579 () Bool)

(assert (=> start!94460 (= tp!76808 b_and!34579)))

(declare-fun b!1068125 () Bool)

(declare-fun e!609346 () Bool)

(declare-fun tp_is_empty!25597 () Bool)

(assert (=> b!1068125 (= e!609346 tp_is_empty!25597)))

(declare-fun res!712769 () Bool)

(declare-fun e!609352 () Bool)

(assert (=> start!94460 (=> (not res!712769) (not e!609352))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94460 (= res!712769 (validMask!0 mask!1515))))

(assert (=> start!94460 e!609352))

(assert (=> start!94460 true))

(assert (=> start!94460 tp_is_empty!25597))

(declare-datatypes ((V!39265 0))(
  ( (V!39266 (val!12849 Int)) )
))
(declare-datatypes ((ValueCell!12095 0))(
  ( (ValueCellFull!12095 (v!15463 V!39265)) (EmptyCell!12095) )
))
(declare-datatypes ((array!68177 0))(
  ( (array!68178 (arr!32788 (Array (_ BitVec 32) ValueCell!12095)) (size!33324 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68177)

(declare-fun e!609351 () Bool)

(declare-fun array_inv!25384 (array!68177) Bool)

(assert (=> start!94460 (and (array_inv!25384 _values!955) e!609351)))

(assert (=> start!94460 tp!76808))

(declare-datatypes ((array!68179 0))(
  ( (array!68180 (arr!32789 (Array (_ BitVec 32) (_ BitVec 64))) (size!33325 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68179)

(declare-fun array_inv!25385 (array!68179) Bool)

(assert (=> start!94460 (array_inv!25385 _keys!1163)))

(declare-fun b!1068126 () Bool)

(declare-fun e!609347 () Bool)

(assert (=> b!1068126 (= e!609352 (not e!609347))))

(declare-fun res!712767 () Bool)

(assert (=> b!1068126 (=> res!712767 e!609347)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1068126 (= res!712767 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!16318 0))(
  ( (tuple2!16319 (_1!8170 (_ BitVec 64)) (_2!8170 V!39265)) )
))
(declare-datatypes ((List!22871 0))(
  ( (Nil!22868) (Cons!22867 (h!24076 tuple2!16318) (t!32196 List!22871)) )
))
(declare-datatypes ((ListLongMap!14287 0))(
  ( (ListLongMap!14288 (toList!7159 List!22871)) )
))
(declare-fun lt!471814 () ListLongMap!14287)

(declare-fun lt!471817 () ListLongMap!14287)

(assert (=> b!1068126 (= lt!471814 lt!471817)))

(declare-fun zeroValueBefore!47 () V!39265)

(declare-datatypes ((Unit!35115 0))(
  ( (Unit!35116) )
))
(declare-fun lt!471816 () Unit!35115)

(declare-fun minValue!907 () V!39265)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39265)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!776 (array!68179 array!68177 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39265 V!39265 V!39265 V!39265 (_ BitVec 32) Int) Unit!35115)

(assert (=> b!1068126 (= lt!471816 (lemmaNoChangeToArrayThenSameMapNoExtras!776 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3739 (array!68179 array!68177 (_ BitVec 32) (_ BitVec 32) V!39265 V!39265 (_ BitVec 32) Int) ListLongMap!14287)

(assert (=> b!1068126 (= lt!471817 (getCurrentListMapNoExtraKeys!3739 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1068126 (= lt!471814 (getCurrentListMapNoExtraKeys!3739 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068127 () Bool)

(declare-fun res!712765 () Bool)

(assert (=> b!1068127 (=> (not res!712765) (not e!609352))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68179 (_ BitVec 32)) Bool)

(assert (=> b!1068127 (= res!712765 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!40090 () Bool)

(declare-fun mapRes!40090 () Bool)

(assert (=> mapIsEmpty!40090 mapRes!40090))

(declare-fun b!1068128 () Bool)

(declare-fun e!609349 () Bool)

(assert (=> b!1068128 (= e!609351 (and e!609349 mapRes!40090))))

(declare-fun condMapEmpty!40090 () Bool)

(declare-fun mapDefault!40090 () ValueCell!12095)

