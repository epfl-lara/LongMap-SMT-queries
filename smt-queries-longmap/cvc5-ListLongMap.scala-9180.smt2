; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110416 () Bool)

(assert start!110416)

(declare-fun b!1306407 () Bool)

(declare-fun e!745302 () Bool)

(declare-datatypes ((List!29788 0))(
  ( (Nil!29785) (Cons!29784 (h!30993 (_ BitVec 64)) (t!43394 List!29788)) )
))
(declare-fun contains!8324 (List!29788 (_ BitVec 64)) Bool)

(assert (=> b!1306407 (= e!745302 (contains!8324 Nil!29785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1306408 () Bool)

(declare-fun res!867281 () Bool)

(declare-fun e!745300 () Bool)

(assert (=> b!1306408 (=> (not res!867281) (not e!745300))))

(declare-fun noDuplicate!2059 (List!29788) Bool)

(assert (=> b!1306408 (= res!867281 (noDuplicate!2059 Nil!29785))))

(declare-fun b!1306409 () Bool)

(declare-fun e!745299 () Bool)

(declare-fun e!745298 () Bool)

(declare-fun mapRes!54115 () Bool)

(assert (=> b!1306409 (= e!745299 (and e!745298 mapRes!54115))))

(declare-fun condMapEmpty!54115 () Bool)

(declare-datatypes ((V!51761 0))(
  ( (V!51762 (val!17571 Int)) )
))
(declare-datatypes ((ValueCell!16598 0))(
  ( (ValueCellFull!16598 (v!20197 V!51761)) (EmptyCell!16598) )
))
(declare-datatypes ((array!87002 0))(
  ( (array!87003 (arr!41982 (Array (_ BitVec 32) ValueCell!16598)) (size!42532 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87002)

(declare-fun mapDefault!54115 () ValueCell!16598)

