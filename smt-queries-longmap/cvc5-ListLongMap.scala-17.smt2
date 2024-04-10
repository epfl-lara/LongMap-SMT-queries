; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!512 () Bool)

(assert start!512)

(declare-fun b!2996 () Bool)

(declare-fun res!4947 () Bool)

(declare-fun e!1291 () Bool)

(assert (=> b!2996 (=> (not res!4947) (not e!1291))))

(declare-datatypes ((List!40 0))(
  ( (Nil!37) (Cons!36 (h!602 (_ BitVec 64)) (t!2167 List!40)) )
))
(declare-fun noDuplicate!7 (List!40) Bool)

(assert (=> b!2996 (= res!4947 (noDuplicate!7 Nil!37))))

(declare-fun res!4948 () Bool)

(assert (=> start!512 (=> (not res!4948) (not e!1291))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!512 (= res!4948 (validMask!0 mask!2250))))

(assert (=> start!512 e!1291))

(assert (=> start!512 true))

(declare-datatypes ((V!291 0))(
  ( (V!292 (val!48 Int)) )
))
(declare-datatypes ((ValueCell!26 0))(
  ( (ValueCellFull!26 (v!1134 V!291)) (EmptyCell!26) )
))
(declare-datatypes ((array!107 0))(
  ( (array!108 (arr!48 (Array (_ BitVec 32) ValueCell!26)) (size!110 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!107)

(declare-fun e!1289 () Bool)

(declare-fun array_inv!29 (array!107) Bool)

(assert (=> start!512 (and (array_inv!29 _values!1492) e!1289)))

(declare-datatypes ((array!109 0))(
  ( (array!110 (arr!49 (Array (_ BitVec 32) (_ BitVec 64))) (size!111 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!109)

(declare-fun array_inv!30 (array!109) Bool)

(assert (=> start!512 (array_inv!30 _keys!1806)))

(declare-fun b!2997 () Bool)

(declare-fun e!1292 () Bool)

(declare-fun tp_is_empty!85 () Bool)

(assert (=> b!2997 (= e!1292 tp_is_empty!85)))

(declare-fun b!2998 () Bool)

(declare-fun e!1288 () Bool)

(declare-fun contains!11 (List!40 (_ BitVec 64)) Bool)

(assert (=> b!2998 (= e!1288 (contains!11 Nil!37 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!2999 () Bool)

(declare-fun e!1290 () Bool)

(assert (=> b!2999 (= e!1290 tp_is_empty!85)))

(declare-fun b!3000 () Bool)

(declare-fun res!4944 () Bool)

(assert (=> b!3000 (=> (not res!4944) (not e!1291))))

(assert (=> b!3000 (= res!4944 (and (bvsle #b00000000000000000000000000000000 (size!111 _keys!1806)) (bvslt (size!111 _keys!1806) #b01111111111111111111111111111111)))))

(declare-fun b!3001 () Bool)

(declare-fun mapRes!80 () Bool)

(assert (=> b!3001 (= e!1289 (and e!1292 mapRes!80))))

(declare-fun condMapEmpty!80 () Bool)

(declare-fun mapDefault!80 () ValueCell!26)

