; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78646 () Bool)

(assert start!78646)

(declare-fun b_free!16859 () Bool)

(declare-fun b_next!16859 () Bool)

(assert (=> start!78646 (= b_free!16859 (not b_next!16859))))

(declare-fun tp!59018 () Bool)

(declare-fun b_and!27481 () Bool)

(assert (=> start!78646 (= tp!59018 b_and!27481)))

(declare-fun b!916863 () Bool)

(declare-fun e!514720 () Bool)

(assert (=> b!916863 (= e!514720 false)))

(declare-datatypes ((V!30787 0))(
  ( (V!30788 (val!9734 Int)) )
))
(declare-fun lt!411885 () V!30787)

(declare-datatypes ((tuple2!12632 0))(
  ( (tuple2!12633 (_1!6327 (_ BitVec 64)) (_2!6327 V!30787)) )
))
(declare-datatypes ((List!18443 0))(
  ( (Nil!18440) (Cons!18439 (h!19585 tuple2!12632) (t!26056 List!18443)) )
))
(declare-datatypes ((ListLongMap!11329 0))(
  ( (ListLongMap!11330 (toList!5680 List!18443)) )
))
(declare-fun lt!411886 () ListLongMap!11329)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun apply!536 (ListLongMap!11329 (_ BitVec 64)) V!30787)

(assert (=> b!916863 (= lt!411885 (apply!536 lt!411886 k!1099))))

(declare-fun b!916864 () Bool)

(declare-fun res!618100 () Bool)

(declare-fun e!514716 () Bool)

(assert (=> b!916864 (=> (not res!618100) (not e!514716))))

(declare-datatypes ((array!54720 0))(
  ( (array!54721 (arr!26305 (Array (_ BitVec 32) (_ BitVec 64))) (size!26764 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54720)

(declare-datatypes ((List!18444 0))(
  ( (Nil!18441) (Cons!18440 (h!19586 (_ BitVec 64)) (t!26057 List!18444)) )
))
(declare-fun arrayNoDuplicates!0 (array!54720 (_ BitVec 32) List!18444) Bool)

(assert (=> b!916864 (= res!618100 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18441))))

(declare-fun b!916865 () Bool)

(declare-fun res!618102 () Bool)

(assert (=> b!916865 (=> (not res!618102) (not e!514716))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!916865 (= res!618102 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26764 _keys!1487))))))

(declare-fun b!916866 () Bool)

(declare-fun e!514719 () Bool)

(declare-fun tp_is_empty!19367 () Bool)

(assert (=> b!916866 (= e!514719 tp_is_empty!19367)))

(declare-fun b!916867 () Bool)

(declare-fun e!514717 () Bool)

(declare-fun e!514718 () Bool)

(declare-fun mapRes!30807 () Bool)

(assert (=> b!916867 (= e!514717 (and e!514718 mapRes!30807))))

(declare-fun condMapEmpty!30807 () Bool)

(declare-datatypes ((ValueCell!9202 0))(
  ( (ValueCellFull!9202 (v!12252 V!30787)) (EmptyCell!9202) )
))
(declare-datatypes ((array!54722 0))(
  ( (array!54723 (arr!26306 (Array (_ BitVec 32) ValueCell!9202)) (size!26765 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54722)

(declare-fun mapDefault!30807 () ValueCell!9202)

