; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35040 () Bool)

(assert start!35040)

(declare-fun b_free!7729 () Bool)

(declare-fun b_next!7729 () Bool)

(assert (=> start!35040 (= b_free!7729 (not b_next!7729))))

(declare-fun tp!26766 () Bool)

(declare-fun b_and!14959 () Bool)

(assert (=> start!35040 (= tp!26766 b_and!14959)))

(declare-fun b!351272 () Bool)

(declare-fun e!215119 () Bool)

(declare-fun lt!164733 () (_ BitVec 32))

(declare-datatypes ((array!18949 0))(
  ( (array!18950 (arr!8980 (Array (_ BitVec 32) (_ BitVec 64))) (size!9332 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18949)

(assert (=> b!351272 (= e!215119 (or (bvslt lt!164733 #b00000000000000000000000000000000) (bvsge lt!164733 (size!9332 _keys!1895))))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!18949 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!351272 (= lt!164733 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!351273 () Bool)

(declare-fun res!194805 () Bool)

(declare-fun e!215116 () Bool)

(assert (=> b!351273 (=> (not res!194805) (not e!215116))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18949 (_ BitVec 32)) Bool)

(assert (=> b!351273 (= res!194805 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!351275 () Bool)

(declare-fun res!194801 () Bool)

(assert (=> b!351275 (=> (not res!194801) (not e!215119))))

(declare-fun arrayContainsKey!0 (array!18949 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!351275 (= res!194801 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!12993 () Bool)

(declare-fun mapRes!12993 () Bool)

(declare-fun tp!26765 () Bool)

(declare-fun e!215114 () Bool)

(assert (=> mapNonEmpty!12993 (= mapRes!12993 (and tp!26765 e!215114))))

(declare-datatypes ((V!11219 0))(
  ( (V!11220 (val!3885 Int)) )
))
(declare-datatypes ((ValueCell!3497 0))(
  ( (ValueCellFull!3497 (v!6072 V!11219)) (EmptyCell!3497) )
))
(declare-fun mapRest!12993 () (Array (_ BitVec 32) ValueCell!3497))

(declare-datatypes ((array!18951 0))(
  ( (array!18952 (arr!8981 (Array (_ BitVec 32) ValueCell!3497)) (size!9333 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18951)

(declare-fun mapKey!12993 () (_ BitVec 32))

(declare-fun mapValue!12993 () ValueCell!3497)

(assert (=> mapNonEmpty!12993 (= (arr!8981 _values!1525) (store mapRest!12993 mapKey!12993 mapValue!12993))))

(declare-fun b!351276 () Bool)

(declare-fun e!215118 () Bool)

(declare-fun e!215117 () Bool)

(assert (=> b!351276 (= e!215118 (and e!215117 mapRes!12993))))

(declare-fun condMapEmpty!12993 () Bool)

(declare-fun mapDefault!12993 () ValueCell!3497)

