; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78708 () Bool)

(assert start!78708)

(declare-fun b_free!16921 () Bool)

(declare-fun b_next!16921 () Bool)

(assert (=> start!78708 (= b_free!16921 (not b_next!16921))))

(declare-fun tp!59203 () Bool)

(declare-fun b_and!27579 () Bool)

(assert (=> start!78708 (= tp!59203 b_and!27579)))

(declare-fun b!917960 () Bool)

(declare-fun e!515333 () Bool)

(declare-fun e!515331 () Bool)

(assert (=> b!917960 (= e!515333 e!515331)))

(declare-fun res!618880 () Bool)

(assert (=> b!917960 (=> (not res!618880) (not e!515331))))

(declare-fun lt!412128 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!917960 (= res!618880 (validKeyInArray!0 lt!412128))))

(declare-datatypes ((array!54842 0))(
  ( (array!54843 (arr!26366 (Array (_ BitVec 32) (_ BitVec 64))) (size!26825 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54842)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!917960 (= lt!412128 (select (arr!26366 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!917961 () Bool)

(declare-fun e!515334 () Bool)

(declare-fun e!515335 () Bool)

(declare-fun mapRes!30900 () Bool)

(assert (=> b!917961 (= e!515334 (and e!515335 mapRes!30900))))

(declare-fun condMapEmpty!30900 () Bool)

(declare-datatypes ((V!30871 0))(
  ( (V!30872 (val!9765 Int)) )
))
(declare-datatypes ((ValueCell!9233 0))(
  ( (ValueCellFull!9233 (v!12283 V!30871)) (EmptyCell!9233) )
))
(declare-datatypes ((array!54844 0))(
  ( (array!54845 (arr!26367 (Array (_ BitVec 32) ValueCell!9233)) (size!26826 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54844)

(declare-fun mapDefault!30900 () ValueCell!9233)

