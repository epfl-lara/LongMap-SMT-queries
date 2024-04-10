; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35028 () Bool)

(assert start!35028)

(declare-fun b_free!7717 () Bool)

(declare-fun b_next!7717 () Bool)

(assert (=> start!35028 (= b_free!7717 (not b_next!7717))))

(declare-fun tp!26730 () Bool)

(declare-fun b_and!14947 () Bool)

(assert (=> start!35028 (= tp!26730 b_and!14947)))

(declare-fun b!351074 () Bool)

(declare-fun e!215011 () Bool)

(declare-fun e!215006 () Bool)

(assert (=> b!351074 (= e!215011 e!215006)))

(declare-fun res!194657 () Bool)

(assert (=> b!351074 (=> (not res!194657) (not e!215006))))

(declare-datatypes ((SeekEntryResult!3451 0))(
  ( (MissingZero!3451 (index!15983 (_ BitVec 32))) (Found!3451 (index!15984 (_ BitVec 32))) (Intermediate!3451 (undefined!4263 Bool) (index!15985 (_ BitVec 32)) (x!34947 (_ BitVec 32))) (Undefined!3451) (MissingVacant!3451 (index!15986 (_ BitVec 32))) )
))
(declare-fun lt!164697 () SeekEntryResult!3451)

(assert (=> b!351074 (= res!194657 (and (not (is-Found!3451 lt!164697)) (not (is-MissingZero!3451 lt!164697)) (is-MissingVacant!3451 lt!164697)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((array!18925 0))(
  ( (array!18926 (arr!8968 (Array (_ BitVec 32) (_ BitVec 64))) (size!9320 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18925)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18925 (_ BitVec 32)) SeekEntryResult!3451)

(assert (=> b!351074 (= lt!164697 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!351075 () Bool)

(assert (=> b!351075 (= e!215006 false)))

(declare-fun lt!164698 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18925 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!351075 (= lt!164698 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!351076 () Bool)

(declare-fun res!194660 () Bool)

(assert (=> b!351076 (=> (not res!194660) (not e!215011))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!351076 (= res!194660 (validKeyInArray!0 k!1348))))

(declare-fun b!351077 () Bool)

(declare-fun res!194658 () Bool)

(assert (=> b!351077 (=> (not res!194658) (not e!215011))))

(declare-datatypes ((List!5217 0))(
  ( (Nil!5214) (Cons!5213 (h!6069 (_ BitVec 64)) (t!10355 List!5217)) )
))
(declare-fun arrayNoDuplicates!0 (array!18925 (_ BitVec 32) List!5217) Bool)

(assert (=> b!351077 (= res!194658 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5214))))

(declare-fun mapNonEmpty!12975 () Bool)

(declare-fun mapRes!12975 () Bool)

(declare-fun tp!26729 () Bool)

(declare-fun e!215009 () Bool)

(assert (=> mapNonEmpty!12975 (= mapRes!12975 (and tp!26729 e!215009))))

(declare-datatypes ((V!11203 0))(
  ( (V!11204 (val!3879 Int)) )
))
(declare-datatypes ((ValueCell!3491 0))(
  ( (ValueCellFull!3491 (v!6066 V!11203)) (EmptyCell!3491) )
))
(declare-fun mapValue!12975 () ValueCell!3491)

(declare-datatypes ((array!18927 0))(
  ( (array!18928 (arr!8969 (Array (_ BitVec 32) ValueCell!3491)) (size!9321 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18927)

(declare-fun mapKey!12975 () (_ BitVec 32))

(declare-fun mapRest!12975 () (Array (_ BitVec 32) ValueCell!3491))

(assert (=> mapNonEmpty!12975 (= (arr!8969 _values!1525) (store mapRest!12975 mapKey!12975 mapValue!12975))))

(declare-fun b!351078 () Bool)

(declare-fun res!194661 () Bool)

(assert (=> b!351078 (=> (not res!194661) (not e!215006))))

(declare-fun arrayContainsKey!0 (array!18925 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!351078 (= res!194661 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!351079 () Bool)

(declare-fun e!215008 () Bool)

(declare-fun tp_is_empty!7669 () Bool)

(assert (=> b!351079 (= e!215008 tp_is_empty!7669)))

(declare-fun res!194664 () Bool)

(assert (=> start!35028 (=> (not res!194664) (not e!215011))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35028 (= res!194664 (validMask!0 mask!2385))))

(assert (=> start!35028 e!215011))

(assert (=> start!35028 true))

(assert (=> start!35028 tp_is_empty!7669))

(assert (=> start!35028 tp!26730))

(declare-fun e!215010 () Bool)

(declare-fun array_inv!6620 (array!18927) Bool)

(assert (=> start!35028 (and (array_inv!6620 _values!1525) e!215010)))

(declare-fun array_inv!6621 (array!18925) Bool)

(assert (=> start!35028 (array_inv!6621 _keys!1895)))

(declare-fun mapIsEmpty!12975 () Bool)

(assert (=> mapIsEmpty!12975 mapRes!12975))

(declare-fun b!351080 () Bool)

(declare-fun res!194663 () Bool)

(assert (=> b!351080 (=> (not res!194663) (not e!215011))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!351080 (= res!194663 (and (= (size!9321 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9320 _keys!1895) (size!9321 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!351081 () Bool)

(declare-fun res!194662 () Bool)

(assert (=> b!351081 (=> (not res!194662) (not e!215011))))

(declare-fun zeroValue!1467 () V!11203)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11203)

(declare-datatypes ((tuple2!5598 0))(
  ( (tuple2!5599 (_1!2810 (_ BitVec 64)) (_2!2810 V!11203)) )
))
(declare-datatypes ((List!5218 0))(
  ( (Nil!5215) (Cons!5214 (h!6070 tuple2!5598) (t!10356 List!5218)) )
))
(declare-datatypes ((ListLongMap!4511 0))(
  ( (ListLongMap!4512 (toList!2271 List!5218)) )
))
(declare-fun contains!2340 (ListLongMap!4511 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1792 (array!18925 array!18927 (_ BitVec 32) (_ BitVec 32) V!11203 V!11203 (_ BitVec 32) Int) ListLongMap!4511)

(assert (=> b!351081 (= res!194662 (not (contains!2340 (getCurrentListMap!1792 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!351082 () Bool)

(assert (=> b!351082 (= e!215009 tp_is_empty!7669)))

(declare-fun b!351083 () Bool)

(declare-fun res!194659 () Bool)

(assert (=> b!351083 (=> (not res!194659) (not e!215011))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18925 (_ BitVec 32)) Bool)

(assert (=> b!351083 (= res!194659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!351084 () Bool)

(assert (=> b!351084 (= e!215010 (and e!215008 mapRes!12975))))

(declare-fun condMapEmpty!12975 () Bool)

(declare-fun mapDefault!12975 () ValueCell!3491)

