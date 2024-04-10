; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77832 () Bool)

(assert start!77832)

(declare-fun b_free!16391 () Bool)

(declare-fun b_next!16391 () Bool)

(assert (=> start!77832 (= b_free!16391 (not b_next!16391))))

(declare-fun tp!57438 () Bool)

(declare-fun b_and!26939 () Bool)

(assert (=> start!77832 (= tp!57438 b_and!26939)))

(declare-fun b!908678 () Bool)

(declare-fun res!613319 () Bool)

(declare-fun e!509289 () Bool)

(assert (=> b!908678 (=> (not res!613319) (not e!509289))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!908678 (= res!613319 (inRange!0 i!717 mask!1756))))

(declare-fun b!908679 () Bool)

(declare-fun e!509290 () Bool)

(declare-fun e!509292 () Bool)

(declare-fun mapRes!29929 () Bool)

(assert (=> b!908679 (= e!509290 (and e!509292 mapRes!29929))))

(declare-fun condMapEmpty!29929 () Bool)

(declare-datatypes ((V!30043 0))(
  ( (V!30044 (val!9455 Int)) )
))
(declare-datatypes ((ValueCell!8923 0))(
  ( (ValueCellFull!8923 (v!11962 V!30043)) (EmptyCell!8923) )
))
(declare-datatypes ((array!53648 0))(
  ( (array!53649 (arr!25782 (Array (_ BitVec 32) ValueCell!8923)) (size!26241 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53648)

(declare-fun mapDefault!29929 () ValueCell!8923)

