; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96408 () Bool)

(assert start!96408)

(declare-fun b_free!22987 () Bool)

(declare-fun b_next!22987 () Bool)

(assert (=> start!96408 (= b_free!22987 (not b_next!22987))))

(declare-fun tp!80888 () Bool)

(declare-fun b_and!36637 () Bool)

(assert (=> start!96408 (= tp!80888 b_and!36637)))

(declare-fun b!1095838 () Bool)

(declare-fun e!625578 () Bool)

(declare-fun tp_is_empty!27037 () Bool)

(assert (=> b!1095838 (= e!625578 tp_is_empty!27037)))

(declare-fun b!1095839 () Bool)

(declare-fun res!731348 () Bool)

(declare-fun e!625574 () Bool)

(assert (=> b!1095839 (=> (not res!731348) (not e!625574))))

(declare-datatypes ((array!70987 0))(
  ( (array!70988 (arr!34165 (Array (_ BitVec 32) (_ BitVec 64))) (size!34701 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70987)

(declare-datatypes ((List!23857 0))(
  ( (Nil!23854) (Cons!23853 (h!25062 (_ BitVec 64)) (t!33890 List!23857)) )
))
(declare-fun arrayNoDuplicates!0 (array!70987 (_ BitVec 32) List!23857) Bool)

(assert (=> b!1095839 (= res!731348 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23854))))

(declare-fun mapNonEmpty!42316 () Bool)

(declare-fun mapRes!42316 () Bool)

(declare-fun tp!80887 () Bool)

(declare-fun e!625575 () Bool)

(assert (=> mapNonEmpty!42316 (= mapRes!42316 (and tp!80887 e!625575))))

(declare-datatypes ((V!41177 0))(
  ( (V!41178 (val!13575 Int)) )
))
(declare-datatypes ((ValueCell!12809 0))(
  ( (ValueCellFull!12809 (v!16196 V!41177)) (EmptyCell!12809) )
))
(declare-datatypes ((array!70989 0))(
  ( (array!70990 (arr!34166 (Array (_ BitVec 32) ValueCell!12809)) (size!34702 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70989)

(declare-fun mapValue!42316 () ValueCell!12809)

(declare-fun mapKey!42316 () (_ BitVec 32))

(declare-fun mapRest!42316 () (Array (_ BitVec 32) ValueCell!12809))

(assert (=> mapNonEmpty!42316 (= (arr!34166 _values!874) (store mapRest!42316 mapKey!42316 mapValue!42316))))

(declare-fun b!1095840 () Bool)

(declare-fun res!731345 () Bool)

(assert (=> b!1095840 (=> (not res!731345) (not e!625574))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1095840 (= res!731345 (validKeyInArray!0 k!904))))

(declare-fun b!1095841 () Bool)

(declare-fun e!625576 () Bool)

(assert (=> b!1095841 (= e!625574 e!625576)))

(declare-fun res!731342 () Bool)

(assert (=> b!1095841 (=> (not res!731342) (not e!625576))))

(declare-fun lt!489959 () array!70987)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70987 (_ BitVec 32)) Bool)

(assert (=> b!1095841 (= res!731342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489959 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1095841 (= lt!489959 (array!70988 (store (arr!34165 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34701 _keys!1070)))))

(declare-fun mapIsEmpty!42316 () Bool)

(assert (=> mapIsEmpty!42316 mapRes!42316))

(declare-fun res!731349 () Bool)

(assert (=> start!96408 (=> (not res!731349) (not e!625574))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96408 (= res!731349 (validMask!0 mask!1414))))

(assert (=> start!96408 e!625574))

(assert (=> start!96408 tp!80888))

(assert (=> start!96408 true))

(assert (=> start!96408 tp_is_empty!27037))

(declare-fun array_inv!26326 (array!70987) Bool)

(assert (=> start!96408 (array_inv!26326 _keys!1070)))

(declare-fun e!625577 () Bool)

(declare-fun array_inv!26327 (array!70989) Bool)

(assert (=> start!96408 (and (array_inv!26327 _values!874) e!625577)))

(declare-fun b!1095842 () Bool)

(declare-fun res!731350 () Bool)

(assert (=> b!1095842 (=> (not res!731350) (not e!625574))))

(assert (=> b!1095842 (= res!731350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1095843 () Bool)

(assert (=> b!1095843 (= e!625577 (and e!625578 mapRes!42316))))

(declare-fun condMapEmpty!42316 () Bool)

(declare-fun mapDefault!42316 () ValueCell!12809)

