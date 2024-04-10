; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37658 () Bool)

(assert start!37658)

(declare-fun b!385558 () Bool)

(declare-fun e!234024 () Bool)

(assert (=> b!385558 (= e!234024 false)))

(declare-fun k!778 () (_ BitVec 64))

(declare-datatypes ((array!22765 0))(
  ( (array!22766 (arr!10851 (Array (_ BitVec 32) (_ BitVec 64))) (size!11203 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22765)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun lt!181632 () Bool)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22765 (_ BitVec 32)) Bool)

(assert (=> b!385558 (= lt!181632 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!22766 (store (arr!10851 _keys!658) i!548 k!778) (size!11203 _keys!658)) mask!970))))

(declare-fun b!385559 () Bool)

(declare-fun e!234023 () Bool)

(declare-fun tp_is_empty!9433 () Bool)

(assert (=> b!385559 (= e!234023 tp_is_empty!9433)))

(declare-fun b!385560 () Bool)

(declare-fun e!234026 () Bool)

(assert (=> b!385560 (= e!234026 tp_is_empty!9433)))

(declare-fun b!385561 () Bool)

(declare-fun res!219938 () Bool)

(assert (=> b!385561 (=> (not res!219938) (not e!234024))))

(assert (=> b!385561 (= res!219938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!385562 () Bool)

(declare-fun res!219937 () Bool)

(assert (=> b!385562 (=> (not res!219937) (not e!234024))))

(declare-fun arrayContainsKey!0 (array!22765 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!385562 (= res!219937 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!385563 () Bool)

(declare-fun res!219935 () Bool)

(assert (=> b!385563 (=> (not res!219935) (not e!234024))))

(assert (=> b!385563 (= res!219935 (or (= (select (arr!10851 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10851 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15714 () Bool)

(declare-fun mapRes!15714 () Bool)

(assert (=> mapIsEmpty!15714 mapRes!15714))

(declare-fun res!219936 () Bool)

(assert (=> start!37658 (=> (not res!219936) (not e!234024))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37658 (= res!219936 (validMask!0 mask!970))))

(assert (=> start!37658 e!234024))

(assert (=> start!37658 true))

(declare-datatypes ((V!13683 0))(
  ( (V!13684 (val!4761 Int)) )
))
(declare-datatypes ((ValueCell!4373 0))(
  ( (ValueCellFull!4373 (v!6958 V!13683)) (EmptyCell!4373) )
))
(declare-datatypes ((array!22767 0))(
  ( (array!22768 (arr!10852 (Array (_ BitVec 32) ValueCell!4373)) (size!11204 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22767)

(declare-fun e!234022 () Bool)

(declare-fun array_inv!7988 (array!22767) Bool)

(assert (=> start!37658 (and (array_inv!7988 _values!506) e!234022)))

(declare-fun array_inv!7989 (array!22765) Bool)

(assert (=> start!37658 (array_inv!7989 _keys!658)))

(declare-fun b!385564 () Bool)

(declare-fun res!219934 () Bool)

(assert (=> b!385564 (=> (not res!219934) (not e!234024))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!385564 (= res!219934 (and (= (size!11204 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11203 _keys!658) (size!11204 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!385565 () Bool)

(declare-fun res!219931 () Bool)

(assert (=> b!385565 (=> (not res!219931) (not e!234024))))

(declare-datatypes ((List!6247 0))(
  ( (Nil!6244) (Cons!6243 (h!7099 (_ BitVec 64)) (t!11397 List!6247)) )
))
(declare-fun arrayNoDuplicates!0 (array!22765 (_ BitVec 32) List!6247) Bool)

(assert (=> b!385565 (= res!219931 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6244))))

(declare-fun b!385566 () Bool)

(declare-fun res!219933 () Bool)

(assert (=> b!385566 (=> (not res!219933) (not e!234024))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!385566 (= res!219933 (validKeyInArray!0 k!778))))

(declare-fun b!385567 () Bool)

(assert (=> b!385567 (= e!234022 (and e!234026 mapRes!15714))))

(declare-fun condMapEmpty!15714 () Bool)

(declare-fun mapDefault!15714 () ValueCell!4373)

