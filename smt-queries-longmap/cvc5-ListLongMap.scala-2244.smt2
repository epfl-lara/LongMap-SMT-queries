; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36926 () Bool)

(assert start!36926)

(declare-fun b_free!8053 () Bool)

(declare-fun b_next!8053 () Bool)

(assert (=> start!36926 (= b_free!8053 (not b_next!8053))))

(declare-fun tp!28875 () Bool)

(declare-fun b_and!15295 () Bool)

(assert (=> start!36926 (= tp!28875 b_and!15295)))

(declare-fun b!370073 () Bool)

(declare-fun res!207748 () Bool)

(declare-fun e!226088 () Bool)

(assert (=> b!370073 (=> (not res!207748) (not e!226088))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12707 0))(
  ( (V!12708 (val!4395 Int)) )
))
(declare-datatypes ((ValueCell!4007 0))(
  ( (ValueCellFull!4007 (v!6592 V!12707)) (EmptyCell!4007) )
))
(declare-datatypes ((array!21345 0))(
  ( (array!21346 (arr!10141 (Array (_ BitVec 32) ValueCell!4007)) (size!10493 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21345)

(declare-datatypes ((array!21347 0))(
  ( (array!21348 (arr!10142 (Array (_ BitVec 32) (_ BitVec 64))) (size!10494 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21347)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!370073 (= res!207748 (and (= (size!10493 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10494 _keys!658) (size!10493 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!370074 () Bool)

(declare-fun res!207744 () Bool)

(assert (=> b!370074 (=> (not res!207744) (not e!226088))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!370074 (= res!207744 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10494 _keys!658))))))

(declare-fun b!370075 () Bool)

(declare-fun res!207741 () Bool)

(assert (=> b!370075 (=> (not res!207741) (not e!226088))))

(declare-datatypes ((List!5666 0))(
  ( (Nil!5663) (Cons!5662 (h!6518 (_ BitVec 64)) (t!10816 List!5666)) )
))
(declare-fun arrayNoDuplicates!0 (array!21347 (_ BitVec 32) List!5666) Bool)

(assert (=> b!370075 (= res!207741 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5663))))

(declare-fun b!370076 () Bool)

(declare-fun res!207740 () Bool)

(assert (=> b!370076 (=> (not res!207740) (not e!226088))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!370076 (= res!207740 (validKeyInArray!0 k!778))))

(declare-fun b!370077 () Bool)

(declare-fun res!207745 () Bool)

(assert (=> b!370077 (=> (not res!207745) (not e!226088))))

(assert (=> b!370077 (= res!207745 (or (= (select (arr!10142 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10142 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!370078 () Bool)

(declare-fun e!226087 () Bool)

(declare-fun tp_is_empty!8701 () Bool)

(assert (=> b!370078 (= e!226087 tp_is_empty!8701)))

(declare-fun b!370079 () Bool)

(declare-fun e!226090 () Bool)

(declare-fun mapRes!14616 () Bool)

(assert (=> b!370079 (= e!226090 (and e!226087 mapRes!14616))))

(declare-fun condMapEmpty!14616 () Bool)

(declare-fun mapDefault!14616 () ValueCell!4007)

