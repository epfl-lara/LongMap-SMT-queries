; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35226 () Bool)

(assert start!35226)

(declare-fun b_free!7801 () Bool)

(declare-fun b_next!7801 () Bool)

(assert (=> start!35226 (= b_free!7801 (not b_next!7801))))

(declare-fun tp!26997 () Bool)

(declare-fun b_and!15041 () Bool)

(assert (=> start!35226 (= tp!26997 b_and!15041)))

(declare-fun b!353150 () Bool)

(declare-fun res!195831 () Bool)

(declare-fun e!216239 () Bool)

(assert (=> b!353150 (=> (not res!195831) (not e!216239))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!11315 0))(
  ( (V!11316 (val!3921 Int)) )
))
(declare-datatypes ((ValueCell!3533 0))(
  ( (ValueCellFull!3533 (v!6113 V!11315)) (EmptyCell!3533) )
))
(declare-datatypes ((array!19097 0))(
  ( (array!19098 (arr!9049 (Array (_ BitVec 32) ValueCell!3533)) (size!9401 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!19097)

(declare-datatypes ((array!19099 0))(
  ( (array!19100 (arr!9050 (Array (_ BitVec 32) (_ BitVec 64))) (size!9402 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!19099)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!353150 (= res!195831 (and (= (size!9401 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9402 _keys!1895) (size!9401 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!353151 () Bool)

(assert (=> b!353151 (= e!216239 false)))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3481 0))(
  ( (MissingZero!3481 (index!16103 (_ BitVec 32))) (Found!3481 (index!16104 (_ BitVec 32))) (Intermediate!3481 (undefined!4293 Bool) (index!16105 (_ BitVec 32)) (x!35139 (_ BitVec 32))) (Undefined!3481) (MissingVacant!3481 (index!16106 (_ BitVec 32))) )
))
(declare-fun lt!165463 () SeekEntryResult!3481)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19099 (_ BitVec 32)) SeekEntryResult!3481)

(assert (=> b!353151 (= lt!165463 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!353152 () Bool)

(declare-fun res!195835 () Bool)

(assert (=> b!353152 (=> (not res!195835) (not e!216239))))

(declare-fun zeroValue!1467 () V!11315)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11315)

(declare-datatypes ((tuple2!5650 0))(
  ( (tuple2!5651 (_1!2836 (_ BitVec 64)) (_2!2836 V!11315)) )
))
(declare-datatypes ((List!5269 0))(
  ( (Nil!5266) (Cons!5265 (h!6121 tuple2!5650) (t!10417 List!5269)) )
))
(declare-datatypes ((ListLongMap!4563 0))(
  ( (ListLongMap!4564 (toList!2297 List!5269)) )
))
(declare-fun contains!2371 (ListLongMap!4563 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1818 (array!19099 array!19097 (_ BitVec 32) (_ BitVec 32) V!11315 V!11315 (_ BitVec 32) Int) ListLongMap!4563)

(assert (=> b!353152 (= res!195835 (not (contains!2371 (getCurrentListMap!1818 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!353153 () Bool)

(declare-fun res!195836 () Bool)

(assert (=> b!353153 (=> (not res!195836) (not e!216239))))

(declare-datatypes ((List!5270 0))(
  ( (Nil!5267) (Cons!5266 (h!6122 (_ BitVec 64)) (t!10418 List!5270)) )
))
(declare-fun arrayNoDuplicates!0 (array!19099 (_ BitVec 32) List!5270) Bool)

(assert (=> b!353153 (= res!195836 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5267))))

(declare-fun res!195832 () Bool)

(assert (=> start!35226 (=> (not res!195832) (not e!216239))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35226 (= res!195832 (validMask!0 mask!2385))))

(assert (=> start!35226 e!216239))

(assert (=> start!35226 true))

(declare-fun tp_is_empty!7753 () Bool)

(assert (=> start!35226 tp_is_empty!7753))

(assert (=> start!35226 tp!26997))

(declare-fun e!216243 () Bool)

(declare-fun array_inv!6668 (array!19097) Bool)

(assert (=> start!35226 (and (array_inv!6668 _values!1525) e!216243)))

(declare-fun array_inv!6669 (array!19099) Bool)

(assert (=> start!35226 (array_inv!6669 _keys!1895)))

(declare-fun b!353154 () Bool)

(declare-fun res!195834 () Bool)

(assert (=> b!353154 (=> (not res!195834) (not e!216239))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!353154 (= res!195834 (validKeyInArray!0 k!1348))))

(declare-fun b!353155 () Bool)

(declare-fun res!195833 () Bool)

(assert (=> b!353155 (=> (not res!195833) (not e!216239))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19099 (_ BitVec 32)) Bool)

(assert (=> b!353155 (= res!195833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!353156 () Bool)

(declare-fun e!216241 () Bool)

(declare-fun mapRes!13116 () Bool)

(assert (=> b!353156 (= e!216243 (and e!216241 mapRes!13116))))

(declare-fun condMapEmpty!13116 () Bool)

(declare-fun mapDefault!13116 () ValueCell!3533)

