; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20110 () Bool)

(assert start!20110)

(declare-fun b_free!4769 () Bool)

(declare-fun b_next!4769 () Bool)

(assert (=> start!20110 (= b_free!4769 (not b_next!4769))))

(declare-fun tp!17338 () Bool)

(declare-fun b_and!11515 () Bool)

(assert (=> start!20110 (= tp!17338 b_and!11515)))

(declare-fun res!93140 () Bool)

(declare-fun e!129746 () Bool)

(assert (=> start!20110 (=> (not res!93140) (not e!129746))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20110 (= res!93140 (validMask!0 mask!1149))))

(assert (=> start!20110 e!129746))

(declare-datatypes ((V!5813 0))(
  ( (V!5814 (val!2357 Int)) )
))
(declare-datatypes ((ValueCell!1969 0))(
  ( (ValueCellFull!1969 (v!4327 V!5813)) (EmptyCell!1969) )
))
(declare-datatypes ((array!8505 0))(
  ( (array!8506 (arr!4003 (Array (_ BitVec 32) ValueCell!1969)) (size!4328 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8505)

(declare-fun e!129748 () Bool)

(declare-fun array_inv!2613 (array!8505) Bool)

(assert (=> start!20110 (and (array_inv!2613 _values!649) e!129748)))

(assert (=> start!20110 true))

(declare-fun tp_is_empty!4625 () Bool)

(assert (=> start!20110 tp_is_empty!4625))

(declare-datatypes ((array!8507 0))(
  ( (array!8508 (arr!4004 (Array (_ BitVec 32) (_ BitVec 64))) (size!4329 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8507)

(declare-fun array_inv!2614 (array!8507) Bool)

(assert (=> start!20110 (array_inv!2614 _keys!825)))

(assert (=> start!20110 tp!17338))

(declare-fun b!197084 () Bool)

(declare-fun res!93142 () Bool)

(assert (=> b!197084 (=> (not res!93142) (not e!129746))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!197084 (= res!93142 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4329 _keys!825))))))

(declare-fun b!197085 () Bool)

(declare-fun res!93144 () Bool)

(assert (=> b!197085 (=> (not res!93144) (not e!129746))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!197085 (= res!93144 (validKeyInArray!0 k!843))))

(declare-fun b!197086 () Bool)

(declare-fun e!129745 () Bool)

(declare-fun mapRes!8006 () Bool)

(assert (=> b!197086 (= e!129748 (and e!129745 mapRes!8006))))

(declare-fun condMapEmpty!8006 () Bool)

(declare-fun mapDefault!8006 () ValueCell!1969)

