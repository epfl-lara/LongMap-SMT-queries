; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96412 () Bool)

(assert start!96412)

(declare-fun b_free!22991 () Bool)

(declare-fun b_next!22991 () Bool)

(assert (=> start!96412 (= b_free!22991 (not b_next!22991))))

(declare-fun tp!80900 () Bool)

(declare-fun b_and!36645 () Bool)

(assert (=> start!96412 (= tp!80900 b_and!36645)))

(declare-fun b!1095914 () Bool)

(declare-fun res!731396 () Bool)

(declare-fun e!625611 () Bool)

(assert (=> b!1095914 (=> (not res!731396) (not e!625611))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!70995 0))(
  ( (array!70996 (arr!34169 (Array (_ BitVec 32) (_ BitVec 64))) (size!34705 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70995)

(declare-datatypes ((V!41181 0))(
  ( (V!41182 (val!13577 Int)) )
))
(declare-datatypes ((ValueCell!12811 0))(
  ( (ValueCellFull!12811 (v!16198 V!41181)) (EmptyCell!12811) )
))
(declare-datatypes ((array!70997 0))(
  ( (array!70998 (arr!34170 (Array (_ BitVec 32) ValueCell!12811)) (size!34706 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70997)

(assert (=> b!1095914 (= res!731396 (and (= (size!34706 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34705 _keys!1070) (size!34706 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1095915 () Bool)

(declare-fun e!625612 () Bool)

(declare-fun e!625613 () Bool)

(declare-fun mapRes!42322 () Bool)

(assert (=> b!1095915 (= e!625612 (and e!625613 mapRes!42322))))

(declare-fun condMapEmpty!42322 () Bool)

(declare-fun mapDefault!42322 () ValueCell!12811)

