; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40920 () Bool)

(assert start!40920)

(declare-fun b_free!10855 () Bool)

(declare-fun b_next!10855 () Bool)

(assert (=> start!40920 (= b_free!10855 (not b_next!10855))))

(declare-fun tp!38391 () Bool)

(declare-fun b_and!18997 () Bool)

(assert (=> start!40920 (= tp!38391 b_and!18997)))

(declare-fun b!454862 () Bool)

(declare-fun e!266050 () Bool)

(assert (=> b!454862 (= e!266050 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!17363 0))(
  ( (V!17364 (val!6141 Int)) )
))
(declare-fun minValue!515 () V!17363)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5753 0))(
  ( (ValueCellFull!5753 (v!8407 V!17363)) (EmptyCell!5753) )
))
(declare-datatypes ((array!28189 0))(
  ( (array!28190 (arr!13538 (Array (_ BitVec 32) ValueCell!5753)) (size!13890 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28189)

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!28191 0))(
  ( (array!28192 (arr!13539 (Array (_ BitVec 32) (_ BitVec 64))) (size!13891 (_ BitVec 32))) )
))
(declare-fun lt!206222 () array!28191)

(declare-fun v!412 () V!17363)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((tuple2!8090 0))(
  ( (tuple2!8091 (_1!4056 (_ BitVec 64)) (_2!4056 V!17363)) )
))
(declare-datatypes ((List!8153 0))(
  ( (Nil!8150) (Cons!8149 (h!9005 tuple2!8090) (t!13981 List!8153)) )
))
(declare-datatypes ((ListLongMap!7003 0))(
  ( (ListLongMap!7004 (toList!3517 List!8153)) )
))
(declare-fun lt!206221 () ListLongMap!7003)

(declare-fun zeroValue!515 () V!17363)

(declare-fun getCurrentListMapNoExtraKeys!1700 (array!28191 array!28189 (_ BitVec 32) (_ BitVec 32) V!17363 V!17363 (_ BitVec 32) Int) ListLongMap!7003)

(assert (=> b!454862 (= lt!206221 (getCurrentListMapNoExtraKeys!1700 lt!206222 (array!28190 (store (arr!13538 _values!549) i!563 (ValueCellFull!5753 v!412)) (size!13890 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206220 () ListLongMap!7003)

(declare-fun _keys!709 () array!28191)

(assert (=> b!454862 (= lt!206220 (getCurrentListMapNoExtraKeys!1700 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!454863 () Bool)

(declare-fun e!266053 () Bool)

(declare-fun tp_is_empty!12193 () Bool)

(assert (=> b!454863 (= e!266053 tp_is_empty!12193)))

(declare-fun b!454864 () Bool)

(declare-fun res!271105 () Bool)

(declare-fun e!266051 () Bool)

(assert (=> b!454864 (=> (not res!271105) (not e!266051))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28191 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!454864 (= res!271105 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!454865 () Bool)

(declare-fun res!271107 () Bool)

(assert (=> b!454865 (=> (not res!271107) (not e!266050))))

(assert (=> b!454865 (= res!271107 (bvsle from!863 i!563))))

(declare-fun b!454866 () Bool)

(declare-fun res!271112 () Bool)

(assert (=> b!454866 (=> (not res!271112) (not e!266051))))

(assert (=> b!454866 (= res!271112 (or (= (select (arr!13539 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13539 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!454867 () Bool)

(assert (=> b!454867 (= e!266051 e!266050)))

(declare-fun res!271110 () Bool)

(assert (=> b!454867 (=> (not res!271110) (not e!266050))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28191 (_ BitVec 32)) Bool)

(assert (=> b!454867 (= res!271110 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206222 mask!1025))))

(assert (=> b!454867 (= lt!206222 (array!28192 (store (arr!13539 _keys!709) i!563 k!794) (size!13891 _keys!709)))))

(declare-fun b!454868 () Bool)

(declare-fun res!271113 () Bool)

(assert (=> b!454868 (=> (not res!271113) (not e!266051))))

(assert (=> b!454868 (= res!271113 (and (= (size!13890 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13891 _keys!709) (size!13890 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!19930 () Bool)

(declare-fun mapRes!19930 () Bool)

(declare-fun tp!38392 () Bool)

(declare-fun e!266048 () Bool)

(assert (=> mapNonEmpty!19930 (= mapRes!19930 (and tp!38392 e!266048))))

(declare-fun mapValue!19930 () ValueCell!5753)

(declare-fun mapKey!19930 () (_ BitVec 32))

(declare-fun mapRest!19930 () (Array (_ BitVec 32) ValueCell!5753))

(assert (=> mapNonEmpty!19930 (= (arr!13538 _values!549) (store mapRest!19930 mapKey!19930 mapValue!19930))))

(declare-fun res!271108 () Bool)

(assert (=> start!40920 (=> (not res!271108) (not e!266051))))

(assert (=> start!40920 (= res!271108 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13891 _keys!709))))))

(assert (=> start!40920 e!266051))

(assert (=> start!40920 tp_is_empty!12193))

(assert (=> start!40920 tp!38391))

(assert (=> start!40920 true))

(declare-fun e!266049 () Bool)

(declare-fun array_inv!9808 (array!28189) Bool)

(assert (=> start!40920 (and (array_inv!9808 _values!549) e!266049)))

(declare-fun array_inv!9809 (array!28191) Bool)

(assert (=> start!40920 (array_inv!9809 _keys!709)))

(declare-fun b!454869 () Bool)

(declare-fun res!271114 () Bool)

(assert (=> b!454869 (=> (not res!271114) (not e!266051))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!454869 (= res!271114 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!19930 () Bool)

(assert (=> mapIsEmpty!19930 mapRes!19930))

(declare-fun b!454870 () Bool)

(declare-fun res!271111 () Bool)

(assert (=> b!454870 (=> (not res!271111) (not e!266051))))

(assert (=> b!454870 (= res!271111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!454871 () Bool)

(assert (=> b!454871 (= e!266049 (and e!266053 mapRes!19930))))

(declare-fun condMapEmpty!19930 () Bool)

(declare-fun mapDefault!19930 () ValueCell!5753)

