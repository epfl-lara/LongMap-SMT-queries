; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94808 () Bool)

(assert start!94808)

(declare-fun b_free!22037 () Bool)

(declare-fun b_next!22037 () Bool)

(assert (=> start!94808 (= b_free!22037 (not b_next!22037))))

(declare-fun tp!77572 () Bool)

(declare-fun b_and!34879 () Bool)

(assert (=> start!94808 (= tp!77572 b_and!34879)))

(declare-fun b!1071996 () Bool)

(declare-fun res!715073 () Bool)

(declare-fun e!612205 () Bool)

(assert (=> b!1071996 (=> (not res!715073) (not e!612205))))

(declare-datatypes ((array!68665 0))(
  ( (array!68666 (arr!33027 (Array (_ BitVec 32) (_ BitVec 64))) (size!33563 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68665)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68665 (_ BitVec 32)) Bool)

(assert (=> b!1071996 (= res!715073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1071997 () Bool)

(declare-fun e!612201 () Bool)

(declare-fun e!612202 () Bool)

(declare-fun mapRes!40480 () Bool)

(assert (=> b!1071997 (= e!612201 (and e!612202 mapRes!40480))))

(declare-fun condMapEmpty!40480 () Bool)

(declare-datatypes ((V!39597 0))(
  ( (V!39598 (val!12974 Int)) )
))
(declare-datatypes ((ValueCell!12220 0))(
  ( (ValueCellFull!12220 (v!15591 V!39597)) (EmptyCell!12220) )
))
(declare-datatypes ((array!68667 0))(
  ( (array!68668 (arr!33028 (Array (_ BitVec 32) ValueCell!12220)) (size!33564 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68667)

(declare-fun mapDefault!40480 () ValueCell!12220)

