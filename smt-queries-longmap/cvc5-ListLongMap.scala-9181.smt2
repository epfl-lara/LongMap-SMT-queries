; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110434 () Bool)

(assert start!110434)

(declare-fun b!1306516 () Bool)

(declare-fun e!745378 () Bool)

(declare-fun tp_is_empty!34999 () Bool)

(assert (=> b!1306516 (= e!745378 tp_is_empty!34999)))

(declare-fun res!867349 () Bool)

(declare-fun e!745379 () Bool)

(assert (=> start!110434 (=> (not res!867349) (not e!745379))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110434 (= res!867349 (validMask!0 mask!2040))))

(assert (=> start!110434 e!745379))

(assert (=> start!110434 true))

(declare-datatypes ((V!51769 0))(
  ( (V!51770 (val!17574 Int)) )
))
(declare-datatypes ((ValueCell!16601 0))(
  ( (ValueCellFull!16601 (v!20201 V!51769)) (EmptyCell!16601) )
))
(declare-datatypes ((array!87014 0))(
  ( (array!87015 (arr!41987 (Array (_ BitVec 32) ValueCell!16601)) (size!42537 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87014)

(declare-fun e!745380 () Bool)

(declare-fun array_inv!31743 (array!87014) Bool)

(assert (=> start!110434 (and (array_inv!31743 _values!1354) e!745380)))

(declare-datatypes ((array!87016 0))(
  ( (array!87017 (arr!41988 (Array (_ BitVec 32) (_ BitVec 64))) (size!42538 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87016)

(declare-fun array_inv!31744 (array!87016) Bool)

(assert (=> start!110434 (array_inv!31744 _keys!1628)))

(declare-fun b!1306517 () Bool)

(declare-fun mapRes!54127 () Bool)

(assert (=> b!1306517 (= e!745380 (and e!745378 mapRes!54127))))

(declare-fun condMapEmpty!54127 () Bool)

(declare-fun mapDefault!54127 () ValueCell!16601)

