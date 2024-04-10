; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96212 () Bool)

(assert start!96212)

(declare-fun b_free!22865 () Bool)

(declare-fun b_next!22865 () Bool)

(assert (=> start!96212 (= b_free!22865 (not b_next!22865))))

(declare-fun tp!80443 () Bool)

(declare-fun b_and!36405 () Bool)

(assert (=> start!96212 (= tp!80443 b_and!36405)))

(declare-fun b!1092709 () Bool)

(declare-fun res!729144 () Bool)

(declare-fun e!624000 () Bool)

(assert (=> b!1092709 (=> (not res!729144) (not e!624000))))

(declare-datatypes ((array!70653 0))(
  ( (array!70654 (arr!34000 (Array (_ BitVec 32) (_ BitVec 64))) (size!34536 (_ BitVec 32))) )
))
(declare-fun lt!488474 () array!70653)

(declare-datatypes ((List!23753 0))(
  ( (Nil!23750) (Cons!23749 (h!24958 (_ BitVec 64)) (t!33676 List!23753)) )
))
(declare-fun arrayNoDuplicates!0 (array!70653 (_ BitVec 32) List!23753) Bool)

(assert (=> b!1092709 (= res!729144 (arrayNoDuplicates!0 lt!488474 #b00000000000000000000000000000000 Nil!23750))))

(declare-fun b!1092710 () Bool)

(declare-fun e!623997 () Bool)

(declare-fun e!624002 () Bool)

(declare-fun mapRes!42055 () Bool)

(assert (=> b!1092710 (= e!623997 (and e!624002 mapRes!42055))))

(declare-fun condMapEmpty!42055 () Bool)

(declare-datatypes ((V!40949 0))(
  ( (V!40950 (val!13490 Int)) )
))
(declare-datatypes ((ValueCell!12724 0))(
  ( (ValueCellFull!12724 (v!16111 V!40949)) (EmptyCell!12724) )
))
(declare-datatypes ((array!70655 0))(
  ( (array!70656 (arr!34001 (Array (_ BitVec 32) ValueCell!12724)) (size!34537 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70655)

(declare-fun mapDefault!42055 () ValueCell!12724)

