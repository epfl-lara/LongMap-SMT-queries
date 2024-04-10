; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82014 () Bool)

(assert start!82014)

(declare-fun b!956509 () Bool)

(declare-fun e!539005 () Bool)

(declare-fun tp_is_empty!21053 () Bool)

(assert (=> b!956509 (= e!539005 tp_is_empty!21053)))

(declare-fun b!956510 () Bool)

(declare-fun res!640435 () Bool)

(declare-fun e!539006 () Bool)

(assert (=> b!956510 (=> (not res!640435) (not e!539006))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((V!33053 0))(
  ( (V!33054 (val!10577 Int)) )
))
(declare-datatypes ((ValueCell!10045 0))(
  ( (ValueCellFull!10045 (v!13132 V!33053)) (EmptyCell!10045) )
))
(declare-datatypes ((array!58203 0))(
  ( (array!58204 (arr!27981 (Array (_ BitVec 32) ValueCell!10045)) (size!28460 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58203)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-datatypes ((array!58205 0))(
  ( (array!58206 (arr!27982 (Array (_ BitVec 32) (_ BitVec 64))) (size!28461 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58205)

(assert (=> b!956510 (= res!640435 (and (= (size!28460 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28461 _keys!1441) (size!28460 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!33541 () Bool)

(declare-fun mapRes!33541 () Bool)

(assert (=> mapIsEmpty!33541 mapRes!33541))

(declare-fun b!956511 () Bool)

(declare-fun e!539007 () Bool)

(declare-fun e!539004 () Bool)

(assert (=> b!956511 (= e!539007 (and e!539004 mapRes!33541))))

(declare-fun condMapEmpty!33541 () Bool)

(declare-fun mapDefault!33541 () ValueCell!10045)

