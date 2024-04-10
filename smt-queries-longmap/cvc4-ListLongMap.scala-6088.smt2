; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78640 () Bool)

(assert start!78640)

(declare-fun b_free!16853 () Bool)

(declare-fun b_next!16853 () Bool)

(assert (=> start!78640 (= b_free!16853 (not b_next!16853))))

(declare-fun tp!59000 () Bool)

(declare-fun b_and!27475 () Bool)

(assert (=> start!78640 (= tp!59000 b_and!27475)))

(declare-fun b!916782 () Bool)

(declare-fun res!618045 () Bool)

(declare-fun e!514662 () Bool)

(assert (=> b!916782 (=> (not res!618045) (not e!514662))))

(declare-datatypes ((array!54708 0))(
  ( (array!54709 (arr!26299 (Array (_ BitVec 32) (_ BitVec 64))) (size!26758 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54708)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54708 (_ BitVec 32)) Bool)

(assert (=> b!916782 (= res!618045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!916783 () Bool)

(declare-fun res!618049 () Bool)

(assert (=> b!916783 (=> (not res!618049) (not e!514662))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30779 0))(
  ( (V!30780 (val!9731 Int)) )
))
(declare-datatypes ((ValueCell!9199 0))(
  ( (ValueCellFull!9199 (v!12249 V!30779)) (EmptyCell!9199) )
))
(declare-datatypes ((array!54710 0))(
  ( (array!54711 (arr!26300 (Array (_ BitVec 32) ValueCell!9199)) (size!26759 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54710)

(assert (=> b!916783 (= res!618049 (and (= (size!26759 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26758 _keys!1487) (size!26759 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!916784 () Bool)

(declare-fun e!514664 () Bool)

(declare-fun tp_is_empty!19361 () Bool)

(assert (=> b!916784 (= e!514664 tp_is_empty!19361)))

(declare-fun b!916785 () Bool)

(declare-fun res!618048 () Bool)

(assert (=> b!916785 (=> (not res!618048) (not e!514662))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!916785 (= res!618048 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26758 _keys!1487))))))

(declare-fun b!916786 () Bool)

(declare-fun e!514666 () Bool)

(declare-fun e!514661 () Bool)

(declare-fun mapRes!30798 () Bool)

(assert (=> b!916786 (= e!514666 (and e!514661 mapRes!30798))))

(declare-fun condMapEmpty!30798 () Bool)

(declare-fun mapDefault!30798 () ValueCell!9199)

