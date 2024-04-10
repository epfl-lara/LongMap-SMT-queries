; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36944 () Bool)

(assert start!36944)

(declare-fun b_free!8071 () Bool)

(declare-fun b_next!8071 () Bool)

(assert (=> start!36944 (= b_free!8071 (not b_next!8071))))

(declare-fun tp!28929 () Bool)

(declare-fun b_and!15313 () Bool)

(assert (=> start!36944 (= tp!28929 b_and!15313)))

(declare-fun b!370424 () Bool)

(declare-fun e!226249 () Bool)

(declare-fun e!226250 () Bool)

(assert (=> b!370424 (= e!226249 e!226250)))

(declare-fun res!208013 () Bool)

(assert (=> b!370424 (=> (not res!208013) (not e!226250))))

(declare-datatypes ((array!21381 0))(
  ( (array!21382 (arr!10159 (Array (_ BitVec 32) (_ BitVec 64))) (size!10511 (_ BitVec 32))) )
))
(declare-fun lt!169965 () array!21381)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21381 (_ BitVec 32)) Bool)

(assert (=> b!370424 (= res!208013 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169965 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!21381)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!370424 (= lt!169965 (array!21382 (store (arr!10159 _keys!658) i!548 k!778) (size!10511 _keys!658)))))

(declare-fun mapIsEmpty!14643 () Bool)

(declare-fun mapRes!14643 () Bool)

(assert (=> mapIsEmpty!14643 mapRes!14643))

(declare-fun b!370425 () Bool)

(declare-fun res!208015 () Bool)

(assert (=> b!370425 (=> (not res!208015) (not e!226249))))

(assert (=> b!370425 (= res!208015 (or (= (select (arr!10159 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10159 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!370426 () Bool)

(declare-fun res!208012 () Bool)

(assert (=> b!370426 (=> (not res!208012) (not e!226249))))

(declare-fun arrayContainsKey!0 (array!21381 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!370426 (= res!208012 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!370427 () Bool)

(declare-fun res!208011 () Bool)

(assert (=> b!370427 (=> (not res!208011) (not e!226249))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12731 0))(
  ( (V!12732 (val!4404 Int)) )
))
(declare-datatypes ((ValueCell!4016 0))(
  ( (ValueCellFull!4016 (v!6601 V!12731)) (EmptyCell!4016) )
))
(declare-datatypes ((array!21383 0))(
  ( (array!21384 (arr!10160 (Array (_ BitVec 32) ValueCell!4016)) (size!10512 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21383)

(assert (=> b!370427 (= res!208011 (and (= (size!10512 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10511 _keys!658) (size!10512 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!370428 () Bool)

(declare-fun res!208016 () Bool)

(assert (=> b!370428 (=> (not res!208016) (not e!226249))))

(declare-datatypes ((List!5680 0))(
  ( (Nil!5677) (Cons!5676 (h!6532 (_ BitVec 64)) (t!10830 List!5680)) )
))
(declare-fun arrayNoDuplicates!0 (array!21381 (_ BitVec 32) List!5680) Bool)

(assert (=> b!370428 (= res!208016 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5677))))

(declare-fun b!370429 () Bool)

(declare-fun e!226253 () Bool)

(declare-fun tp_is_empty!8719 () Bool)

(assert (=> b!370429 (= e!226253 tp_is_empty!8719)))

(declare-fun b!370430 () Bool)

(declare-fun e!226252 () Bool)

(declare-fun e!226248 () Bool)

(assert (=> b!370430 (= e!226252 (and e!226248 mapRes!14643))))

(declare-fun condMapEmpty!14643 () Bool)

(declare-fun mapDefault!14643 () ValueCell!4016)

