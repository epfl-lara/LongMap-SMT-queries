; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95702 () Bool)

(assert start!95702)

(declare-fun b_free!22355 () Bool)

(declare-fun b_next!22355 () Bool)

(assert (=> start!95702 (= b_free!22355 (not b_next!22355))))

(declare-fun tp!78913 () Bool)

(declare-fun b_and!35385 () Bool)

(assert (=> start!95702 (= tp!78913 b_and!35385)))

(declare-fun b!1081957 () Bool)

(declare-fun res!721190 () Bool)

(declare-fun e!618372 () Bool)

(assert (=> b!1081957 (=> (not res!721190) (not e!618372))))

(declare-datatypes ((array!69661 0))(
  ( (array!69662 (arr!33504 (Array (_ BitVec 32) (_ BitVec 64))) (size!34040 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69661)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69661 (_ BitVec 32)) Bool)

(assert (=> b!1081957 (= res!721190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1081958 () Bool)

(declare-fun res!721194 () Bool)

(assert (=> b!1081958 (=> (not res!721194) (not e!618372))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40269 0))(
  ( (V!40270 (val!13235 Int)) )
))
(declare-datatypes ((ValueCell!12469 0))(
  ( (ValueCellFull!12469 (v!15856 V!40269)) (EmptyCell!12469) )
))
(declare-datatypes ((array!69663 0))(
  ( (array!69664 (arr!33505 (Array (_ BitVec 32) ValueCell!12469)) (size!34041 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69663)

(assert (=> b!1081958 (= res!721194 (and (= (size!34041 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34040 _keys!1070) (size!34041 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1081959 () Bool)

(declare-fun res!721195 () Bool)

(assert (=> b!1081959 (=> (not res!721195) (not e!618372))))

(declare-datatypes ((List!23352 0))(
  ( (Nil!23349) (Cons!23348 (h!24557 (_ BitVec 64)) (t!32765 List!23352)) )
))
(declare-fun arrayNoDuplicates!0 (array!69661 (_ BitVec 32) List!23352) Bool)

(assert (=> b!1081959 (= res!721195 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23349))))

(declare-fun b!1081960 () Bool)

(declare-fun e!618374 () Bool)

(assert (=> b!1081960 (= e!618372 e!618374)))

(declare-fun res!721197 () Bool)

(assert (=> b!1081960 (=> (not res!721197) (not e!618374))))

(declare-fun lt!479466 () array!69661)

(assert (=> b!1081960 (= res!721197 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479466 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1081960 (= lt!479466 (array!69662 (store (arr!33504 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34040 _keys!1070)))))

(declare-fun mapIsEmpty!41290 () Bool)

(declare-fun mapRes!41290 () Bool)

(assert (=> mapIsEmpty!41290 mapRes!41290))

(declare-fun b!1081961 () Bool)

(declare-fun res!721189 () Bool)

(assert (=> b!1081961 (=> (not res!721189) (not e!618374))))

(assert (=> b!1081961 (= res!721189 (arrayNoDuplicates!0 lt!479466 #b00000000000000000000000000000000 Nil!23349))))

(declare-fun b!1081962 () Bool)

(declare-fun res!721193 () Bool)

(assert (=> b!1081962 (=> (not res!721193) (not e!618372))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1081962 (= res!721193 (validKeyInArray!0 k!904))))

(declare-fun b!1081963 () Bool)

(declare-fun res!721191 () Bool)

(assert (=> b!1081963 (=> (not res!721191) (not e!618372))))

(assert (=> b!1081963 (= res!721191 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34040 _keys!1070))))))

(declare-fun b!1081964 () Bool)

(declare-fun e!618376 () Bool)

(declare-fun e!618373 () Bool)

(assert (=> b!1081964 (= e!618376 (and e!618373 mapRes!41290))))

(declare-fun condMapEmpty!41290 () Bool)

(declare-fun mapDefault!41290 () ValueCell!12469)

