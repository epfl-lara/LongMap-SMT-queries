; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38190 () Bool)

(assert start!38190)

(declare-fun b_free!9049 () Bool)

(declare-fun b_next!9049 () Bool)

(assert (=> start!38190 (= b_free!9049 (not b_next!9049))))

(declare-fun tp!31932 () Bool)

(declare-fun b_and!16423 () Bool)

(assert (=> start!38190 (= tp!31932 b_and!16423)))

(declare-fun b!393784 () Bool)

(declare-fun res!225632 () Bool)

(declare-fun e!238407 () Bool)

(assert (=> b!393784 (=> (not res!225632) (not e!238407))))

(declare-datatypes ((array!23349 0))(
  ( (array!23350 (arr!11132 (Array (_ BitVec 32) (_ BitVec 64))) (size!11484 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23349)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23349 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!393784 (= res!225632 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!393785 () Bool)

(declare-fun e!238403 () Bool)

(assert (=> b!393785 (= e!238407 e!238403)))

(declare-fun res!225634 () Bool)

(assert (=> b!393785 (=> (not res!225634) (not e!238403))))

(declare-fun lt!186439 () array!23349)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23349 (_ BitVec 32)) Bool)

(assert (=> b!393785 (= res!225634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!186439 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!393785 (= lt!186439 (array!23350 (store (arr!11132 _keys!658) i!548 k!778) (size!11484 _keys!658)))))

(declare-fun b!393786 () Bool)

(declare-fun res!225638 () Bool)

(assert (=> b!393786 (=> (not res!225638) (not e!238407))))

(assert (=> b!393786 (= res!225638 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11484 _keys!658))))))

(declare-fun b!393787 () Bool)

(declare-fun res!225630 () Bool)

(assert (=> b!393787 (=> (not res!225630) (not e!238407))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!14067 0))(
  ( (V!14068 (val!4905 Int)) )
))
(declare-datatypes ((ValueCell!4517 0))(
  ( (ValueCellFull!4517 (v!7146 V!14067)) (EmptyCell!4517) )
))
(declare-datatypes ((array!23351 0))(
  ( (array!23352 (arr!11133 (Array (_ BitVec 32) ValueCell!4517)) (size!11485 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23351)

(assert (=> b!393787 (= res!225630 (and (= (size!11485 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11484 _keys!658) (size!11485 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!225636 () Bool)

(assert (=> start!38190 (=> (not res!225636) (not e!238407))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38190 (= res!225636 (validMask!0 mask!970))))

(assert (=> start!38190 e!238407))

(declare-fun e!238406 () Bool)

(declare-fun array_inv!8174 (array!23351) Bool)

(assert (=> start!38190 (and (array_inv!8174 _values!506) e!238406)))

(assert (=> start!38190 tp!31932))

(assert (=> start!38190 true))

(declare-fun tp_is_empty!9721 () Bool)

(assert (=> start!38190 tp_is_empty!9721))

(declare-fun array_inv!8175 (array!23349) Bool)

(assert (=> start!38190 (array_inv!8175 _keys!658)))

(declare-fun b!393788 () Bool)

(declare-fun e!238404 () Bool)

(declare-fun mapRes!16179 () Bool)

(assert (=> b!393788 (= e!238406 (and e!238404 mapRes!16179))))

(declare-fun condMapEmpty!16179 () Bool)

(declare-fun mapDefault!16179 () ValueCell!4517)

