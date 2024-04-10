; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37130 () Bool)

(assert start!37130)

(declare-fun b_free!8257 () Bool)

(declare-fun b_next!8257 () Bool)

(assert (=> start!37130 (= b_free!8257 (not b_next!8257))))

(declare-fun tp!29487 () Bool)

(declare-fun b_and!15499 () Bool)

(assert (=> start!37130 (= tp!29487 b_and!15499)))

(declare-fun b!374217 () Bool)

(declare-fun e!228084 () Bool)

(declare-fun tp_is_empty!8905 () Bool)

(assert (=> b!374217 (= e!228084 tp_is_empty!8905)))

(declare-fun b!374218 () Bool)

(declare-fun res!210966 () Bool)

(declare-fun e!228083 () Bool)

(assert (=> b!374218 (=> (not res!210966) (not e!228083))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!21749 0))(
  ( (array!21750 (arr!10343 (Array (_ BitVec 32) (_ BitVec 64))) (size!10695 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21749)

(assert (=> b!374218 (= res!210966 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10695 _keys!658))))))

(declare-fun b!374219 () Bool)

(declare-fun res!210977 () Bool)

(assert (=> b!374219 (=> (not res!210977) (not e!228083))))

(declare-datatypes ((List!5823 0))(
  ( (Nil!5820) (Cons!5819 (h!6675 (_ BitVec 64)) (t!10973 List!5823)) )
))
(declare-fun arrayNoDuplicates!0 (array!21749 (_ BitVec 32) List!5823) Bool)

(assert (=> b!374219 (= res!210977 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5820))))

(declare-fun mapIsEmpty!14922 () Bool)

(declare-fun mapRes!14922 () Bool)

(assert (=> mapIsEmpty!14922 mapRes!14922))

(declare-fun b!374220 () Bool)

(declare-fun res!210968 () Bool)

(declare-fun e!228082 () Bool)

(assert (=> b!374220 (=> (not res!210968) (not e!228082))))

(declare-fun lt!172369 () array!21749)

(assert (=> b!374220 (= res!210968 (arrayNoDuplicates!0 lt!172369 #b00000000000000000000000000000000 Nil!5820))))

(declare-fun b!374221 () Bool)

(declare-fun res!210970 () Bool)

(assert (=> b!374221 (=> (not res!210970) (not e!228083))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21749 (_ BitVec 32)) Bool)

(assert (=> b!374221 (= res!210970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!374222 () Bool)

(declare-fun res!210967 () Bool)

(assert (=> b!374222 (=> (not res!210967) (not e!228083))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!374222 (= res!210967 (validKeyInArray!0 k!778))))

(declare-fun b!374223 () Bool)

(declare-fun e!228086 () Bool)

(assert (=> b!374223 (= e!228086 tp_is_empty!8905)))

(declare-fun b!374224 () Bool)

(declare-fun e!228081 () Bool)

(assert (=> b!374224 (= e!228081 (and e!228086 mapRes!14922))))

(declare-fun condMapEmpty!14922 () Bool)

(declare-datatypes ((V!12979 0))(
  ( (V!12980 (val!4497 Int)) )
))
(declare-datatypes ((ValueCell!4109 0))(
  ( (ValueCellFull!4109 (v!6694 V!12979)) (EmptyCell!4109) )
))
(declare-datatypes ((array!21751 0))(
  ( (array!21752 (arr!10344 (Array (_ BitVec 32) ValueCell!4109)) (size!10696 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21751)

(declare-fun mapDefault!14922 () ValueCell!4109)

