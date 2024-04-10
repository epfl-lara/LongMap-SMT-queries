; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34794 () Bool)

(assert start!34794)

(declare-fun b_free!7579 () Bool)

(declare-fun b_next!7579 () Bool)

(assert (=> start!34794 (= b_free!7579 (not b_next!7579))))

(declare-fun tp!26304 () Bool)

(declare-fun b_and!14801 () Bool)

(assert (=> start!34794 (= tp!26304 b_and!14801)))

(declare-fun b!348113 () Bool)

(declare-fun res!192778 () Bool)

(declare-fun e!213308 () Bool)

(assert (=> b!348113 (=> (not res!192778) (not e!213308))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!11019 0))(
  ( (V!11020 (val!3810 Int)) )
))
(declare-fun zeroValue!1467 () V!11019)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3422 0))(
  ( (ValueCellFull!3422 (v!5993 V!11019)) (EmptyCell!3422) )
))
(declare-datatypes ((array!18649 0))(
  ( (array!18650 (arr!8834 (Array (_ BitVec 32) ValueCell!3422)) (size!9186 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18649)

(declare-datatypes ((array!18651 0))(
  ( (array!18652 (arr!8835 (Array (_ BitVec 32) (_ BitVec 64))) (size!9187 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18651)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11019)

(declare-datatypes ((tuple2!5508 0))(
  ( (tuple2!5509 (_1!2765 (_ BitVec 64)) (_2!2765 V!11019)) )
))
(declare-datatypes ((List!5130 0))(
  ( (Nil!5127) (Cons!5126 (h!5982 tuple2!5508) (t!10260 List!5130)) )
))
(declare-datatypes ((ListLongMap!4421 0))(
  ( (ListLongMap!4422 (toList!2226 List!5130)) )
))
(declare-fun contains!2291 (ListLongMap!4421 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1747 (array!18651 array!18649 (_ BitVec 32) (_ BitVec 32) V!11019 V!11019 (_ BitVec 32) Int) ListLongMap!4421)

(assert (=> b!348113 (= res!192778 (not (contains!2291 (getCurrentListMap!1747 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun mapIsEmpty!12756 () Bool)

(declare-fun mapRes!12756 () Bool)

(assert (=> mapIsEmpty!12756 mapRes!12756))

(declare-fun b!348114 () Bool)

(declare-fun e!213305 () Bool)

(declare-fun tp_is_empty!7531 () Bool)

(assert (=> b!348114 (= e!213305 tp_is_empty!7531)))

(declare-fun b!348115 () Bool)

(declare-fun e!213304 () Bool)

(assert (=> b!348115 (= e!213304 tp_is_empty!7531)))

(declare-fun b!348116 () Bool)

(declare-fun res!192781 () Bool)

(assert (=> b!348116 (=> (not res!192781) (not e!213308))))

(declare-datatypes ((List!5131 0))(
  ( (Nil!5128) (Cons!5127 (h!5983 (_ BitVec 64)) (t!10261 List!5131)) )
))
(declare-fun arrayNoDuplicates!0 (array!18651 (_ BitVec 32) List!5131) Bool)

(assert (=> b!348116 (= res!192781 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5128))))

(declare-fun b!348117 () Bool)

(declare-fun e!213307 () Bool)

(assert (=> b!348117 (= e!213307 (and e!213305 mapRes!12756))))

(declare-fun condMapEmpty!12756 () Bool)

(declare-fun mapDefault!12756 () ValueCell!3422)

