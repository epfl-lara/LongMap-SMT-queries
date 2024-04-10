; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40884 () Bool)

(assert start!40884)

(declare-fun b_free!10819 () Bool)

(declare-fun b_next!10819 () Bool)

(assert (=> start!40884 (= b_free!10819 (not b_next!10819))))

(declare-fun tp!38284 () Bool)

(declare-fun b_and!18961 () Bool)

(assert (=> start!40884 (= tp!38284 b_and!18961)))

(declare-fun b!454052 () Bool)

(declare-fun res!270464 () Bool)

(declare-fun e!265726 () Bool)

(assert (=> b!454052 (=> (not res!270464) (not e!265726))))

(declare-datatypes ((array!28119 0))(
  ( (array!28120 (arr!13503 (Array (_ BitVec 32) (_ BitVec 64))) (size!13855 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28119)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28119 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!454052 (= res!270464 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!454053 () Bool)

(declare-fun res!270460 () Bool)

(assert (=> b!454053 (=> (not res!270460) (not e!265726))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!454053 (= res!270460 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13855 _keys!709))))))

(declare-fun b!454054 () Bool)

(declare-fun res!270458 () Bool)

(assert (=> b!454054 (=> (not res!270458) (not e!265726))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!454054 (= res!270458 (validMask!0 mask!1025))))

(declare-fun b!454055 () Bool)

(declare-fun res!270457 () Bool)

(assert (=> b!454055 (=> (not res!270457) (not e!265726))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!454055 (= res!270457 (validKeyInArray!0 k!794))))

(declare-fun b!454056 () Bool)

(declare-fun res!270467 () Bool)

(declare-fun e!265729 () Bool)

(assert (=> b!454056 (=> (not res!270467) (not e!265729))))

(declare-fun lt!206058 () array!28119)

(declare-datatypes ((List!8124 0))(
  ( (Nil!8121) (Cons!8120 (h!8976 (_ BitVec 64)) (t!13952 List!8124)) )
))
(declare-fun arrayNoDuplicates!0 (array!28119 (_ BitVec 32) List!8124) Bool)

(assert (=> b!454056 (= res!270467 (arrayNoDuplicates!0 lt!206058 #b00000000000000000000000000000000 Nil!8121))))

(declare-fun b!454057 () Bool)

(assert (=> b!454057 (= e!265729 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17315 0))(
  ( (V!17316 (val!6123 Int)) )
))
(declare-datatypes ((ValueCell!5735 0))(
  ( (ValueCellFull!5735 (v!8389 V!17315)) (EmptyCell!5735) )
))
(declare-datatypes ((array!28121 0))(
  ( (array!28122 (arr!13504 (Array (_ BitVec 32) ValueCell!5735)) (size!13856 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28121)

(declare-fun zeroValue!515 () V!17315)

(declare-datatypes ((tuple2!8066 0))(
  ( (tuple2!8067 (_1!4044 (_ BitVec 64)) (_2!4044 V!17315)) )
))
(declare-datatypes ((List!8125 0))(
  ( (Nil!8122) (Cons!8121 (h!8977 tuple2!8066) (t!13953 List!8125)) )
))
(declare-datatypes ((ListLongMap!6979 0))(
  ( (ListLongMap!6980 (toList!3505 List!8125)) )
))
(declare-fun lt!206060 () ListLongMap!6979)

(declare-fun v!412 () V!17315)

(declare-fun minValue!515 () V!17315)

(declare-fun getCurrentListMapNoExtraKeys!1688 (array!28119 array!28121 (_ BitVec 32) (_ BitVec 32) V!17315 V!17315 (_ BitVec 32) Int) ListLongMap!6979)

(assert (=> b!454057 (= lt!206060 (getCurrentListMapNoExtraKeys!1688 lt!206058 (array!28122 (store (arr!13504 _values!549) i!563 (ValueCellFull!5735 v!412)) (size!13856 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206059 () ListLongMap!6979)

(assert (=> b!454057 (= lt!206059 (getCurrentListMapNoExtraKeys!1688 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!454058 () Bool)

(declare-fun e!265727 () Bool)

(declare-fun e!265724 () Bool)

(declare-fun mapRes!19876 () Bool)

(assert (=> b!454058 (= e!265727 (and e!265724 mapRes!19876))))

(declare-fun condMapEmpty!19876 () Bool)

(declare-fun mapDefault!19876 () ValueCell!5735)

