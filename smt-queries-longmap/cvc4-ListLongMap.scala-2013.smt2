; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35106 () Bool)

(assert start!35106)

(declare-fun b_free!7751 () Bool)

(declare-fun b_next!7751 () Bool)

(assert (=> start!35106 (= b_free!7751 (not b_next!7751))))

(declare-fun tp!26837 () Bool)

(declare-fun b_and!14985 () Bool)

(assert (=> start!35106 (= tp!26837 b_and!14985)))

(declare-fun b!351932 () Bool)

(declare-fun res!195173 () Bool)

(declare-fun e!215513 () Bool)

(assert (=> b!351932 (=> (not res!195173) (not e!215513))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!11247 0))(
  ( (V!11248 (val!3896 Int)) )
))
(declare-fun zeroValue!1467 () V!11247)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3508 0))(
  ( (ValueCellFull!3508 (v!6085 V!11247)) (EmptyCell!3508) )
))
(declare-datatypes ((array!18995 0))(
  ( (array!18996 (arr!9001 (Array (_ BitVec 32) ValueCell!3508)) (size!9353 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18995)

(declare-datatypes ((array!18997 0))(
  ( (array!18998 (arr!9002 (Array (_ BitVec 32) (_ BitVec 64))) (size!9354 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18997)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11247)

(declare-datatypes ((tuple2!5618 0))(
  ( (tuple2!5619 (_1!2820 (_ BitVec 64)) (_2!2820 V!11247)) )
))
(declare-datatypes ((List!5239 0))(
  ( (Nil!5236) (Cons!5235 (h!6091 tuple2!5618) (t!10381 List!5239)) )
))
(declare-datatypes ((ListLongMap!4531 0))(
  ( (ListLongMap!4532 (toList!2281 List!5239)) )
))
(declare-fun contains!2352 (ListLongMap!4531 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1802 (array!18997 array!18995 (_ BitVec 32) (_ BitVec 32) V!11247 V!11247 (_ BitVec 32) Int) ListLongMap!4531)

(assert (=> b!351932 (= res!195173 (not (contains!2352 (getCurrentListMap!1802 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun mapNonEmpty!13032 () Bool)

(declare-fun mapRes!13032 () Bool)

(declare-fun tp!26838 () Bool)

(declare-fun e!215515 () Bool)

(assert (=> mapNonEmpty!13032 (= mapRes!13032 (and tp!26838 e!215515))))

(declare-fun mapValue!13032 () ValueCell!3508)

(declare-fun mapRest!13032 () (Array (_ BitVec 32) ValueCell!3508))

(declare-fun mapKey!13032 () (_ BitVec 32))

(assert (=> mapNonEmpty!13032 (= (arr!9001 _values!1525) (store mapRest!13032 mapKey!13032 mapValue!13032))))

(declare-fun b!351933 () Bool)

(declare-fun e!215516 () Bool)

(declare-fun lt!165014 () Bool)

(assert (=> b!351933 (= e!215516 lt!165014)))

(declare-datatypes ((Unit!10880 0))(
  ( (Unit!10881) )
))
(declare-fun lt!165016 () Unit!10880)

(declare-fun e!215517 () Unit!10880)

(assert (=> b!351933 (= lt!165016 e!215517)))

(declare-fun c!53505 () Bool)

(assert (=> b!351933 (= c!53505 lt!165014)))

(declare-fun arrayContainsKey!0 (array!18997 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!351933 (= lt!165014 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!351934 () Bool)

(declare-fun res!195174 () Bool)

(assert (=> b!351934 (=> (not res!195174) (not e!215513))))

(declare-datatypes ((List!5240 0))(
  ( (Nil!5237) (Cons!5236 (h!6092 (_ BitVec 64)) (t!10382 List!5240)) )
))
(declare-fun arrayNoDuplicates!0 (array!18997 (_ BitVec 32) List!5240) Bool)

(assert (=> b!351934 (= res!195174 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5237))))

(declare-fun b!351935 () Bool)

(declare-fun e!215514 () Bool)

(declare-fun e!215512 () Bool)

(assert (=> b!351935 (= e!215514 (and e!215512 mapRes!13032))))

(declare-fun condMapEmpty!13032 () Bool)

(declare-fun mapDefault!13032 () ValueCell!3508)

