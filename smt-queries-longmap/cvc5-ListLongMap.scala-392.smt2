; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7380 () Bool)

(assert start!7380)

(declare-fun b!47361 () Bool)

(declare-fun res!27554 () Bool)

(declare-fun e!30321 () Bool)

(assert (=> b!47361 (=> (not res!27554) (not e!30321))))

(declare-datatypes ((List!1257 0))(
  ( (Nil!1254) (Cons!1253 (h!1833 (_ BitVec 64)) (t!4285 List!1257)) )
))
(declare-fun noDuplicate!38 (List!1257) Bool)

(assert (=> b!47361 (= res!27554 (noDuplicate!38 Nil!1254))))

(declare-fun b!47362 () Bool)

(declare-fun e!30318 () Bool)

(declare-fun contains!584 (List!1257 (_ BitVec 64)) Bool)

(assert (=> b!47362 (= e!30318 (contains!584 Nil!1254 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!47363 () Bool)

(declare-fun e!30320 () Bool)

(declare-fun tp_is_empty!2029 () Bool)

(assert (=> b!47363 (= e!30320 tp_is_empty!2029)))

(declare-fun b!47364 () Bool)

(declare-fun e!30322 () Bool)

(declare-fun mapRes!2084 () Bool)

(assert (=> b!47364 (= e!30322 (and e!30320 mapRes!2084))))

(declare-fun condMapEmpty!2084 () Bool)

(declare-datatypes ((V!2439 0))(
  ( (V!2440 (val!1053 Int)) )
))
(declare-datatypes ((ValueCell!725 0))(
  ( (ValueCellFull!725 (v!2113 V!2439)) (EmptyCell!725) )
))
(declare-datatypes ((array!3123 0))(
  ( (array!3124 (arr!1497 (Array (_ BitVec 32) ValueCell!725)) (size!1719 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3123)

(declare-fun mapDefault!2084 () ValueCell!725)

