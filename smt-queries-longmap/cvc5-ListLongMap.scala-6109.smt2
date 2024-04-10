; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78762 () Bool)

(assert start!78762)

(declare-fun b_free!16975 () Bool)

(declare-fun b_next!16975 () Bool)

(assert (=> start!78762 (= b_free!16975 (not b_next!16975))))

(declare-fun tp!59366 () Bool)

(declare-fun b_and!27687 () Bool)

(assert (=> start!78762 (= tp!59366 b_and!27687)))

(declare-fun b!919067 () Bool)

(declare-fun res!619690 () Bool)

(declare-fun e!515898 () Bool)

(assert (=> b!919067 (=> (not res!619690) (not e!515898))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!54950 0))(
  ( (array!54951 (arr!26420 (Array (_ BitVec 32) (_ BitVec 64))) (size!26879 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54950)

(assert (=> b!919067 (= res!619690 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26879 _keys!1487))))))

(declare-fun b!919068 () Bool)

(declare-fun res!619699 () Bool)

(declare-fun e!515901 () Bool)

(assert (=> b!919068 (=> (not res!619699) (not e!515901))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!919068 (= res!619699 (validKeyInArray!0 k!1099))))

(declare-fun b!919070 () Bool)

(declare-fun e!515896 () Bool)

(declare-fun e!515900 () Bool)

(declare-fun mapRes!30981 () Bool)

(assert (=> b!919070 (= e!515896 (and e!515900 mapRes!30981))))

(declare-fun condMapEmpty!30981 () Bool)

(declare-datatypes ((V!30943 0))(
  ( (V!30944 (val!9792 Int)) )
))
(declare-datatypes ((ValueCell!9260 0))(
  ( (ValueCellFull!9260 (v!12310 V!30943)) (EmptyCell!9260) )
))
(declare-datatypes ((array!54952 0))(
  ( (array!54953 (arr!26421 (Array (_ BitVec 32) ValueCell!9260)) (size!26880 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54952)

(declare-fun mapDefault!30981 () ValueCell!9260)

