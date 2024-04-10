; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35068 () Bool)

(assert start!35068)

(declare-fun b_free!7735 () Bool)

(declare-fun b_next!7735 () Bool)

(assert (=> start!35068 (= b_free!7735 (not b_next!7735))))

(declare-fun tp!26787 () Bool)

(declare-fun b_and!14967 () Bool)

(assert (=> start!35068 (= tp!26787 b_and!14967)))

(declare-fun b!351512 () Bool)

(declare-fun res!194933 () Bool)

(declare-fun e!215261 () Bool)

(assert (=> b!351512 (=> (not res!194933) (not e!215261))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!11227 0))(
  ( (V!11228 (val!3888 Int)) )
))
(declare-datatypes ((ValueCell!3500 0))(
  ( (ValueCellFull!3500 (v!6076 V!11227)) (EmptyCell!3500) )
))
(declare-datatypes ((array!18963 0))(
  ( (array!18964 (arr!8986 (Array (_ BitVec 32) ValueCell!3500)) (size!9338 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18963)

(declare-datatypes ((array!18965 0))(
  ( (array!18966 (arr!8987 (Array (_ BitVec 32) (_ BitVec 64))) (size!9339 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18965)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!351512 (= res!194933 (and (= (size!9338 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9339 _keys!1895) (size!9338 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!351513 () Bool)

(declare-fun e!215260 () Bool)

(declare-fun tp_is_empty!7687 () Bool)

(assert (=> b!351513 (= e!215260 tp_is_empty!7687)))

(declare-fun b!351514 () Bool)

(declare-fun res!194934 () Bool)

(assert (=> b!351514 (=> (not res!194934) (not e!215261))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!351514 (= res!194934 (validKeyInArray!0 k!1348))))

(declare-fun b!351515 () Bool)

(declare-fun e!215265 () Bool)

(assert (=> b!351515 (= e!215261 e!215265)))

(declare-fun res!194931 () Bool)

(assert (=> b!351515 (=> (not res!194931) (not e!215265))))

(declare-datatypes ((SeekEntryResult!3457 0))(
  ( (MissingZero!3457 (index!16007 (_ BitVec 32))) (Found!3457 (index!16008 (_ BitVec 32))) (Intermediate!3457 (undefined!4269 Bool) (index!16009 (_ BitVec 32)) (x!34987 (_ BitVec 32))) (Undefined!3457) (MissingVacant!3457 (index!16010 (_ BitVec 32))) )
))
(declare-fun lt!164851 () SeekEntryResult!3457)

(assert (=> b!351515 (= res!194931 (and (not (is-Found!3457 lt!164851)) (not (is-MissingZero!3457 lt!164851)) (is-MissingVacant!3457 lt!164851)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18965 (_ BitVec 32)) SeekEntryResult!3457)

(assert (=> b!351515 (= lt!164851 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!351516 () Bool)

(declare-fun res!194927 () Bool)

(assert (=> b!351516 (=> (not res!194927) (not e!215261))))

(declare-datatypes ((List!5226 0))(
  ( (Nil!5223) (Cons!5222 (h!6078 (_ BitVec 64)) (t!10366 List!5226)) )
))
(declare-fun arrayNoDuplicates!0 (array!18965 (_ BitVec 32) List!5226) Bool)

(assert (=> b!351516 (= res!194927 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5223))))

(declare-fun b!351517 () Bool)

(declare-fun res!194926 () Bool)

(assert (=> b!351517 (=> (not res!194926) (not e!215261))))

(declare-fun zeroValue!1467 () V!11227)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11227)

(declare-datatypes ((tuple2!5606 0))(
  ( (tuple2!5607 (_1!2814 (_ BitVec 64)) (_2!2814 V!11227)) )
))
(declare-datatypes ((List!5227 0))(
  ( (Nil!5224) (Cons!5223 (h!6079 tuple2!5606) (t!10367 List!5227)) )
))
(declare-datatypes ((ListLongMap!4519 0))(
  ( (ListLongMap!4520 (toList!2275 List!5227)) )
))
(declare-fun contains!2345 (ListLongMap!4519 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1796 (array!18965 array!18963 (_ BitVec 32) (_ BitVec 32) V!11227 V!11227 (_ BitVec 32) Int) ListLongMap!4519)

(assert (=> b!351517 (= res!194926 (not (contains!2345 (getCurrentListMap!1796 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!351518 () Bool)

(declare-fun e!215266 () Bool)

(assert (=> b!351518 (= e!215266 tp_is_empty!7687)))

(declare-fun mapNonEmpty!13005 () Bool)

(declare-fun mapRes!13005 () Bool)

(declare-fun tp!26786 () Bool)

(assert (=> mapNonEmpty!13005 (= mapRes!13005 (and tp!26786 e!215260))))

(declare-fun mapKey!13005 () (_ BitVec 32))

(declare-fun mapValue!13005 () ValueCell!3500)

(declare-fun mapRest!13005 () (Array (_ BitVec 32) ValueCell!3500))

(assert (=> mapNonEmpty!13005 (= (arr!8986 _values!1525) (store mapRest!13005 mapKey!13005 mapValue!13005))))

(declare-fun b!351519 () Bool)

(declare-fun e!215262 () Bool)

(assert (=> b!351519 (= e!215265 e!215262)))

(declare-fun res!194930 () Bool)

(assert (=> b!351519 (=> (not res!194930) (not e!215262))))

(declare-fun lt!164850 () (_ BitVec 32))

(assert (=> b!351519 (= res!194930 (and (bvsge lt!164850 #b00000000000000000000000000000000) (bvslt lt!164850 (size!9339 _keys!1895))))))

(declare-fun arrayScanForKey!0 (array!18965 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!351519 (= lt!164850 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!351520 () Bool)

(declare-fun res!194929 () Bool)

(assert (=> b!351520 (=> (not res!194929) (not e!215261))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18965 (_ BitVec 32)) Bool)

(assert (=> b!351520 (= res!194929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!351521 () Bool)

(declare-fun arrayContainsKey!0 (array!18965 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!351521 (= e!215262 (not (arrayContainsKey!0 _keys!1895 k!1348 lt!164850)))))

(declare-fun b!351522 () Bool)

(declare-fun res!194928 () Bool)

(assert (=> b!351522 (=> (not res!194928) (not e!215265))))

(assert (=> b!351522 (= res!194928 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!351523 () Bool)

(declare-fun e!215263 () Bool)

(assert (=> b!351523 (= e!215263 (and e!215266 mapRes!13005))))

(declare-fun condMapEmpty!13005 () Bool)

(declare-fun mapDefault!13005 () ValueCell!3500)

