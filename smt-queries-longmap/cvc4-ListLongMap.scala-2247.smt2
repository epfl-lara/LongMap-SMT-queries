; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36948 () Bool)

(assert start!36948)

(declare-fun b_free!8075 () Bool)

(declare-fun b_next!8075 () Bool)

(assert (=> start!36948 (= b_free!8075 (not b_next!8075))))

(declare-fun tp!28940 () Bool)

(declare-fun b_and!15317 () Bool)

(assert (=> start!36948 (= tp!28940 b_and!15317)))

(declare-fun b!370502 () Bool)

(declare-fun res!208070 () Bool)

(declare-fun e!226284 () Bool)

(assert (=> b!370502 (=> (not res!208070) (not e!226284))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12735 0))(
  ( (V!12736 (val!4406 Int)) )
))
(declare-datatypes ((ValueCell!4018 0))(
  ( (ValueCellFull!4018 (v!6603 V!12735)) (EmptyCell!4018) )
))
(declare-datatypes ((array!21389 0))(
  ( (array!21390 (arr!10163 (Array (_ BitVec 32) ValueCell!4018)) (size!10515 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21389)

(declare-datatypes ((array!21391 0))(
  ( (array!21392 (arr!10164 (Array (_ BitVec 32) (_ BitVec 64))) (size!10516 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21391)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!370502 (= res!208070 (and (= (size!10515 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10516 _keys!658) (size!10515 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!370503 () Bool)

(declare-fun e!226288 () Bool)

(assert (=> b!370503 (= e!226284 e!226288)))

(declare-fun res!208074 () Bool)

(assert (=> b!370503 (=> (not res!208074) (not e!226288))))

(declare-fun lt!169981 () array!21391)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21391 (_ BitVec 32)) Bool)

(assert (=> b!370503 (= res!208074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169981 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!370503 (= lt!169981 (array!21392 (store (arr!10164 _keys!658) i!548 k!778) (size!10516 _keys!658)))))

(declare-fun b!370504 () Bool)

(declare-fun e!226285 () Bool)

(declare-fun e!226287 () Bool)

(declare-fun mapRes!14649 () Bool)

(assert (=> b!370504 (= e!226285 (and e!226287 mapRes!14649))))

(declare-fun condMapEmpty!14649 () Bool)

(declare-fun mapDefault!14649 () ValueCell!4018)

