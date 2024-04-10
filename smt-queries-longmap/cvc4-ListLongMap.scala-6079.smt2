; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78586 () Bool)

(assert start!78586)

(declare-fun b_free!16799 () Bool)

(declare-fun b_next!16799 () Bool)

(assert (=> start!78586 (= b_free!16799 (not b_next!16799))))

(declare-fun tp!58838 () Bool)

(declare-fun b_and!27421 () Bool)

(assert (=> start!78586 (= tp!58838 b_and!27421)))

(declare-fun mapNonEmpty!30717 () Bool)

(declare-fun mapRes!30717 () Bool)

(declare-fun tp!58837 () Bool)

(declare-fun e!514214 () Bool)

(assert (=> mapNonEmpty!30717 (= mapRes!30717 (and tp!58837 e!514214))))

(declare-datatypes ((V!30707 0))(
  ( (V!30708 (val!9704 Int)) )
))
(declare-datatypes ((ValueCell!9172 0))(
  ( (ValueCellFull!9172 (v!12222 V!30707)) (EmptyCell!9172) )
))
(declare-fun mapValue!30717 () ValueCell!9172)

(declare-fun mapKey!30717 () (_ BitVec 32))

(declare-fun mapRest!30717 () (Array (_ BitVec 32) ValueCell!9172))

(declare-datatypes ((array!54606 0))(
  ( (array!54607 (arr!26248 (Array (_ BitVec 32) ValueCell!9172)) (size!26707 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54606)

(assert (=> mapNonEmpty!30717 (= (arr!26248 _values!1231) (store mapRest!30717 mapKey!30717 mapValue!30717))))

(declare-fun b!916081 () Bool)

(declare-fun res!617589 () Bool)

(declare-fun e!514213 () Bool)

(assert (=> b!916081 (=> (not res!617589) (not e!514213))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!54608 0))(
  ( (array!54609 (arr!26249 (Array (_ BitVec 32) (_ BitVec 64))) (size!26708 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54608)

(assert (=> b!916081 (= res!617589 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26708 _keys!1487))))))

(declare-fun b!916082 () Bool)

(declare-fun res!617586 () Bool)

(assert (=> b!916082 (=> (not res!617586) (not e!514213))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54608 (_ BitVec 32)) Bool)

(assert (=> b!916082 (= res!617586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!916083 () Bool)

(declare-fun e!514216 () Bool)

(declare-fun e!514212 () Bool)

(assert (=> b!916083 (= e!514216 (and e!514212 mapRes!30717))))

(declare-fun condMapEmpty!30717 () Bool)

(declare-fun mapDefault!30717 () ValueCell!9172)

