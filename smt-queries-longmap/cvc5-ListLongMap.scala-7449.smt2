; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94588 () Bool)

(assert start!94588)

(declare-fun b_free!21871 () Bool)

(declare-fun b_next!21871 () Bool)

(assert (=> start!94588 (= b_free!21871 (not b_next!21871))))

(declare-fun tp!77066 () Bool)

(declare-fun b_and!34683 () Bool)

(assert (=> start!94588 (= tp!77066 b_and!34683)))

(declare-fun b!1069533 () Bool)

(declare-fun res!713603 () Bool)

(declare-fun e!610390 () Bool)

(assert (=> b!1069533 (=> (not res!713603) (not e!610390))))

(declare-datatypes ((array!68341 0))(
  ( (array!68342 (arr!32868 (Array (_ BitVec 32) (_ BitVec 64))) (size!33404 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68341)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68341 (_ BitVec 32)) Bool)

(assert (=> b!1069533 (= res!713603 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1069534 () Bool)

(declare-fun e!610392 () Bool)

(declare-fun tp_is_empty!25681 () Bool)

(assert (=> b!1069534 (= e!610392 tp_is_empty!25681)))

(declare-fun b!1069535 () Bool)

(declare-fun e!610391 () Bool)

(declare-fun mapRes!40222 () Bool)

(assert (=> b!1069535 (= e!610391 (and e!610392 mapRes!40222))))

(declare-fun condMapEmpty!40222 () Bool)

(declare-datatypes ((V!39377 0))(
  ( (V!39378 (val!12891 Int)) )
))
(declare-datatypes ((ValueCell!12137 0))(
  ( (ValueCellFull!12137 (v!15507 V!39377)) (EmptyCell!12137) )
))
(declare-datatypes ((array!68343 0))(
  ( (array!68344 (arr!32869 (Array (_ BitVec 32) ValueCell!12137)) (size!33405 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68343)

(declare-fun mapDefault!40222 () ValueCell!12137)

