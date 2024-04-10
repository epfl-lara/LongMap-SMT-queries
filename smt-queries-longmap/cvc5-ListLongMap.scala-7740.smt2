; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97184 () Bool)

(assert start!97184)

(declare-fun b!1105602 () Bool)

(declare-fun res!737726 () Bool)

(declare-fun e!630990 () Bool)

(assert (=> b!1105602 (=> (not res!737726) (not e!630990))))

(declare-datatypes ((array!71749 0))(
  ( (array!71750 (arr!34527 (Array (_ BitVec 32) (_ BitVec 64))) (size!35063 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71749)

(declare-datatypes ((List!24077 0))(
  ( (Nil!24074) (Cons!24073 (h!25282 (_ BitVec 64)) (t!34342 List!24077)) )
))
(declare-fun arrayNoDuplicates!0 (array!71749 (_ BitVec 32) List!24077) Bool)

(assert (=> b!1105602 (= res!737726 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24074))))

(declare-fun b!1105603 () Bool)

(declare-fun e!630989 () Bool)

(declare-fun e!630992 () Bool)

(declare-fun mapRes!42940 () Bool)

(assert (=> b!1105603 (= e!630989 (and e!630992 mapRes!42940))))

(declare-fun condMapEmpty!42940 () Bool)

(declare-datatypes ((V!41681 0))(
  ( (V!41682 (val!13764 Int)) )
))
(declare-datatypes ((ValueCell!12998 0))(
  ( (ValueCellFull!12998 (v!16397 V!41681)) (EmptyCell!12998) )
))
(declare-datatypes ((array!71751 0))(
  ( (array!71752 (arr!34528 (Array (_ BitVec 32) ValueCell!12998)) (size!35064 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71751)

(declare-fun mapDefault!42940 () ValueCell!12998)

