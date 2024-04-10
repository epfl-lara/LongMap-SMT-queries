; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20398 () Bool)

(assert start!20398)

(declare-fun b_free!5057 () Bool)

(declare-fun b_next!5057 () Bool)

(assert (=> start!20398 (= b_free!5057 (not b_next!5057))))

(declare-fun tp!18203 () Bool)

(declare-fun b_and!11803 () Bool)

(assert (=> start!20398 (= tp!18203 b_and!11803)))

(declare-fun b!201654 () Bool)

(declare-fun e!132147 () Bool)

(assert (=> b!201654 (= e!132147 true)))

(declare-datatypes ((V!6197 0))(
  ( (V!6198 (val!2501 Int)) )
))
(declare-datatypes ((tuple2!3788 0))(
  ( (tuple2!3789 (_1!1905 (_ BitVec 64)) (_2!1905 V!6197)) )
))
(declare-datatypes ((List!2700 0))(
  ( (Nil!2697) (Cons!2696 (h!3338 tuple2!3788) (t!7631 List!2700)) )
))
(declare-datatypes ((ListLongMap!2701 0))(
  ( (ListLongMap!2702 (toList!1366 List!2700)) )
))
(declare-fun lt!100671 () ListLongMap!2701)

(declare-fun lt!100670 () ListLongMap!2701)

(declare-fun lt!100667 () tuple2!3788)

(declare-fun lt!100658 () tuple2!3788)

(declare-fun +!393 (ListLongMap!2701 tuple2!3788) ListLongMap!2701)

(assert (=> b!201654 (= (+!393 lt!100671 lt!100658) (+!393 lt!100670 lt!100667))))

(declare-fun minValue!615 () V!6197)

(declare-datatypes ((Unit!6086 0))(
  ( (Unit!6087) )
))
(declare-fun lt!100660 () Unit!6086)

(declare-fun v!520 () V!6197)

(declare-fun lt!100661 () ListLongMap!2701)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun addCommutativeForDiffKeys!114 (ListLongMap!2701 (_ BitVec 64) V!6197 (_ BitVec 64) V!6197) Unit!6086)

(assert (=> b!201654 (= lt!100660 (addCommutativeForDiffKeys!114 lt!100661 k!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun mapIsEmpty!8438 () Bool)

(declare-fun mapRes!8438 () Bool)

(assert (=> mapIsEmpty!8438 mapRes!8438))

(declare-fun b!201655 () Bool)

(declare-fun res!96414 () Bool)

(declare-fun e!132150 () Bool)

(assert (=> b!201655 (=> (not res!96414) (not e!132150))))

(declare-datatypes ((array!9055 0))(
  ( (array!9056 (arr!4278 (Array (_ BitVec 32) (_ BitVec 64))) (size!4603 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9055)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9055 (_ BitVec 32)) Bool)

(assert (=> b!201655 (= res!96414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapNonEmpty!8438 () Bool)

(declare-fun tp!18202 () Bool)

(declare-fun e!132146 () Bool)

(assert (=> mapNonEmpty!8438 (= mapRes!8438 (and tp!18202 e!132146))))

(declare-datatypes ((ValueCell!2113 0))(
  ( (ValueCellFull!2113 (v!4471 V!6197)) (EmptyCell!2113) )
))
(declare-fun mapValue!8438 () ValueCell!2113)

(declare-fun mapKey!8438 () (_ BitVec 32))

(declare-datatypes ((array!9057 0))(
  ( (array!9058 (arr!4279 (Array (_ BitVec 32) ValueCell!2113)) (size!4604 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9057)

(declare-fun mapRest!8438 () (Array (_ BitVec 32) ValueCell!2113))

(assert (=> mapNonEmpty!8438 (= (arr!4279 _values!649) (store mapRest!8438 mapKey!8438 mapValue!8438))))

(declare-fun b!201656 () Bool)

(declare-fun tp_is_empty!4913 () Bool)

(assert (=> b!201656 (= e!132146 tp_is_empty!4913)))

(declare-fun b!201657 () Bool)

(declare-fun e!132149 () Bool)

(assert (=> b!201657 (= e!132149 e!132147)))

(declare-fun res!96421 () Bool)

(assert (=> b!201657 (=> res!96421 e!132147)))

(assert (=> b!201657 (= res!96421 (= k!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!100668 () ListLongMap!2701)

(assert (=> b!201657 (= lt!100668 lt!100671)))

(assert (=> b!201657 (= lt!100671 (+!393 lt!100661 lt!100667))))

(declare-fun lt!100669 () Unit!6086)

(declare-fun zeroValue!615 () V!6197)

(declare-fun lt!100656 () ListLongMap!2701)

(assert (=> b!201657 (= lt!100669 (addCommutativeForDiffKeys!114 lt!100656 k!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!100665 () ListLongMap!2701)

(assert (=> b!201657 (= lt!100665 (+!393 lt!100668 lt!100658))))

(declare-fun lt!100657 () ListLongMap!2701)

(declare-fun lt!100664 () tuple2!3788)

(assert (=> b!201657 (= lt!100668 (+!393 lt!100657 lt!100664))))

(declare-fun lt!100662 () ListLongMap!2701)

(assert (=> b!201657 (= lt!100662 lt!100670)))

(assert (=> b!201657 (= lt!100670 (+!393 lt!100661 lt!100658))))

(assert (=> b!201657 (= lt!100661 (+!393 lt!100656 lt!100664))))

(declare-fun lt!100663 () ListLongMap!2701)

(assert (=> b!201657 (= lt!100665 (+!393 (+!393 lt!100663 lt!100664) lt!100658))))

(assert (=> b!201657 (= lt!100658 (tuple2!3789 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!201657 (= lt!100664 (tuple2!3789 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!201658 () Bool)

(declare-fun e!132151 () Bool)

(declare-fun e!132148 () Bool)

(assert (=> b!201658 (= e!132151 (and e!132148 mapRes!8438))))

(declare-fun condMapEmpty!8438 () Bool)

(declare-fun mapDefault!8438 () ValueCell!2113)

