; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36706 () Bool)

(assert start!36706)

(declare-fun mapIsEmpty!14331 () Bool)

(declare-fun mapRes!14331 () Bool)

(assert (=> mapIsEmpty!14331 mapRes!14331))

(declare-fun b!366390 () Bool)

(declare-fun res!204943 () Bool)

(declare-fun e!224328 () Bool)

(assert (=> b!366390 (=> (not res!204943) (not e!224328))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!366390 (= res!204943 (validKeyInArray!0 k!778))))

(declare-fun res!204939 () Bool)

(assert (=> start!36706 (=> (not res!204939) (not e!224328))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36706 (= res!204939 (validMask!0 mask!970))))

(assert (=> start!36706 e!224328))

(assert (=> start!36706 true))

(declare-datatypes ((V!12459 0))(
  ( (V!12460 (val!4302 Int)) )
))
(declare-datatypes ((ValueCell!3914 0))(
  ( (ValueCellFull!3914 (v!6498 V!12459)) (EmptyCell!3914) )
))
(declare-datatypes ((array!20985 0))(
  ( (array!20986 (arr!9963 (Array (_ BitVec 32) ValueCell!3914)) (size!10315 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20985)

(declare-fun e!224331 () Bool)

(declare-fun array_inv!7370 (array!20985) Bool)

(assert (=> start!36706 (and (array_inv!7370 _values!506) e!224331)))

(declare-datatypes ((array!20987 0))(
  ( (array!20988 (arr!9964 (Array (_ BitVec 32) (_ BitVec 64))) (size!10316 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20987)

(declare-fun array_inv!7371 (array!20987) Bool)

(assert (=> start!36706 (array_inv!7371 _keys!658)))

(declare-fun b!366391 () Bool)

(declare-fun res!204947 () Bool)

(assert (=> b!366391 (=> (not res!204947) (not e!224328))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!366391 (= res!204947 (or (= (select (arr!9964 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9964 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!366392 () Bool)

(declare-fun e!224330 () Bool)

(assert (=> b!366392 (= e!224331 (and e!224330 mapRes!14331))))

(declare-fun condMapEmpty!14331 () Bool)

(declare-fun mapDefault!14331 () ValueCell!3914)

