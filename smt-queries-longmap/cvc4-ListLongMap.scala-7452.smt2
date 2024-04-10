; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94610 () Bool)

(assert start!94610)

(declare-fun b_free!21893 () Bool)

(declare-fun b_next!21893 () Bool)

(assert (=> start!94610 (= b_free!21893 (not b_next!21893))))

(declare-fun tp!77131 () Bool)

(declare-fun b_and!34705 () Bool)

(assert (=> start!94610 (= tp!77131 b_and!34705)))

(declare-fun b!1069764 () Bool)

(declare-fun res!713736 () Bool)

(declare-fun e!610554 () Bool)

(assert (=> b!1069764 (=> (not res!713736) (not e!610554))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39405 0))(
  ( (V!39406 (val!12902 Int)) )
))
(declare-datatypes ((ValueCell!12148 0))(
  ( (ValueCellFull!12148 (v!15518 V!39405)) (EmptyCell!12148) )
))
(declare-datatypes ((array!68383 0))(
  ( (array!68384 (arr!32889 (Array (_ BitVec 32) ValueCell!12148)) (size!33425 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68383)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68385 0))(
  ( (array!68386 (arr!32890 (Array (_ BitVec 32) (_ BitVec 64))) (size!33426 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68385)

(assert (=> b!1069764 (= res!713736 (and (= (size!33425 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33426 _keys!1163) (size!33425 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1069765 () Bool)

(declare-fun res!713735 () Bool)

(assert (=> b!1069765 (=> (not res!713735) (not e!610554))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68385 (_ BitVec 32)) Bool)

(assert (=> b!1069765 (= res!713735 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1069766 () Bool)

(declare-fun res!713738 () Bool)

(assert (=> b!1069766 (=> (not res!713738) (not e!610554))))

(declare-datatypes ((List!22943 0))(
  ( (Nil!22940) (Cons!22939 (h!24148 (_ BitVec 64)) (t!32272 List!22943)) )
))
(declare-fun arrayNoDuplicates!0 (array!68385 (_ BitVec 32) List!22943) Bool)

(assert (=> b!1069766 (= res!713738 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22940))))

(declare-fun b!1069767 () Bool)

(declare-fun e!610557 () Bool)

(declare-fun tp_is_empty!25703 () Bool)

(assert (=> b!1069767 (= e!610557 tp_is_empty!25703)))

(declare-fun mapIsEmpty!40255 () Bool)

(declare-fun mapRes!40255 () Bool)

(assert (=> mapIsEmpty!40255 mapRes!40255))

(declare-fun b!1069769 () Bool)

(declare-fun e!610556 () Bool)

(declare-fun e!610555 () Bool)

(assert (=> b!1069769 (= e!610556 (and e!610555 mapRes!40255))))

(declare-fun condMapEmpty!40255 () Bool)

(declare-fun mapDefault!40255 () ValueCell!12148)

