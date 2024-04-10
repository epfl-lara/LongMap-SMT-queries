; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35224 () Bool)

(assert start!35224)

(declare-fun b_free!7799 () Bool)

(declare-fun b_next!7799 () Bool)

(assert (=> start!35224 (= b_free!7799 (not b_next!7799))))

(declare-fun tp!26990 () Bool)

(declare-fun b_and!15039 () Bool)

(assert (=> start!35224 (= tp!26990 b_and!15039)))

(declare-fun b!353123 () Bool)

(declare-fun e!216224 () Bool)

(assert (=> b!353123 (= e!216224 false)))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3480 0))(
  ( (MissingZero!3480 (index!16099 (_ BitVec 32))) (Found!3480 (index!16100 (_ BitVec 32))) (Intermediate!3480 (undefined!4292 Bool) (index!16101 (_ BitVec 32)) (x!35130 (_ BitVec 32))) (Undefined!3480) (MissingVacant!3480 (index!16102 (_ BitVec 32))) )
))
(declare-fun lt!165460 () SeekEntryResult!3480)

(declare-datatypes ((array!19093 0))(
  ( (array!19094 (arr!9047 (Array (_ BitVec 32) (_ BitVec 64))) (size!9399 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!19093)

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19093 (_ BitVec 32)) SeekEntryResult!3480)

(assert (=> b!353123 (= lt!165460 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!353124 () Bool)

(declare-fun res!195814 () Bool)

(assert (=> b!353124 (=> (not res!195814) (not e!216224))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!353124 (= res!195814 (validKeyInArray!0 k!1348))))

(declare-fun mapNonEmpty!13113 () Bool)

(declare-fun mapRes!13113 () Bool)

(declare-fun tp!26991 () Bool)

(declare-fun e!216227 () Bool)

(assert (=> mapNonEmpty!13113 (= mapRes!13113 (and tp!26991 e!216227))))

(declare-datatypes ((V!11311 0))(
  ( (V!11312 (val!3920 Int)) )
))
(declare-datatypes ((ValueCell!3532 0))(
  ( (ValueCellFull!3532 (v!6112 V!11311)) (EmptyCell!3532) )
))
(declare-fun mapRest!13113 () (Array (_ BitVec 32) ValueCell!3532))

(declare-datatypes ((array!19095 0))(
  ( (array!19096 (arr!9048 (Array (_ BitVec 32) ValueCell!3532)) (size!9400 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!19095)

(declare-fun mapValue!13113 () ValueCell!3532)

(declare-fun mapKey!13113 () (_ BitVec 32))

(assert (=> mapNonEmpty!13113 (= (arr!9048 _values!1525) (store mapRest!13113 mapKey!13113 mapValue!13113))))

(declare-fun b!353125 () Bool)

(declare-fun res!195813 () Bool)

(assert (=> b!353125 (=> (not res!195813) (not e!216224))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!353125 (= res!195813 (and (= (size!9400 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9399 _keys!1895) (size!9400 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!353126 () Bool)

(declare-fun e!216228 () Bool)

(declare-fun tp_is_empty!7751 () Bool)

(assert (=> b!353126 (= e!216228 tp_is_empty!7751)))

(declare-fun b!353127 () Bool)

(declare-fun res!195816 () Bool)

(assert (=> b!353127 (=> (not res!195816) (not e!216224))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19093 (_ BitVec 32)) Bool)

(assert (=> b!353127 (= res!195816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!353128 () Bool)

(declare-fun res!195817 () Bool)

(assert (=> b!353128 (=> (not res!195817) (not e!216224))))

(declare-datatypes ((List!5267 0))(
  ( (Nil!5264) (Cons!5263 (h!6119 (_ BitVec 64)) (t!10415 List!5267)) )
))
(declare-fun arrayNoDuplicates!0 (array!19093 (_ BitVec 32) List!5267) Bool)

(assert (=> b!353128 (= res!195817 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5264))))

(declare-fun b!353129 () Bool)

(assert (=> b!353129 (= e!216227 tp_is_empty!7751)))

(declare-fun b!353130 () Bool)

(declare-fun res!195815 () Bool)

(assert (=> b!353130 (=> (not res!195815) (not e!216224))))

(declare-fun zeroValue!1467 () V!11311)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11311)

(declare-datatypes ((tuple2!5648 0))(
  ( (tuple2!5649 (_1!2835 (_ BitVec 64)) (_2!2835 V!11311)) )
))
(declare-datatypes ((List!5268 0))(
  ( (Nil!5265) (Cons!5264 (h!6120 tuple2!5648) (t!10416 List!5268)) )
))
(declare-datatypes ((ListLongMap!4561 0))(
  ( (ListLongMap!4562 (toList!2296 List!5268)) )
))
(declare-fun contains!2370 (ListLongMap!4561 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1817 (array!19093 array!19095 (_ BitVec 32) (_ BitVec 32) V!11311 V!11311 (_ BitVec 32) Int) ListLongMap!4561)

(assert (=> b!353130 (= res!195815 (not (contains!2370 (getCurrentListMap!1817 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!353131 () Bool)

(declare-fun e!216226 () Bool)

(assert (=> b!353131 (= e!216226 (and e!216228 mapRes!13113))))

(declare-fun condMapEmpty!13113 () Bool)

(declare-fun mapDefault!13113 () ValueCell!3532)

