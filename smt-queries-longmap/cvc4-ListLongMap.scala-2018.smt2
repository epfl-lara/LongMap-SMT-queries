; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35188 () Bool)

(assert start!35188)

(declare-fun b_free!7781 () Bool)

(declare-fun b_next!7781 () Bool)

(assert (=> start!35188 (= b_free!7781 (not b_next!7781))))

(declare-fun tp!26934 () Bool)

(declare-fun b_and!15019 () Bool)

(assert (=> start!35188 (= tp!26934 b_and!15019)))

(declare-fun mapNonEmpty!13083 () Bool)

(declare-fun mapRes!13083 () Bool)

(declare-fun tp!26933 () Bool)

(declare-fun e!216011 () Bool)

(assert (=> mapNonEmpty!13083 (= mapRes!13083 (and tp!26933 e!216011))))

(declare-datatypes ((V!11287 0))(
  ( (V!11288 (val!3911 Int)) )
))
(declare-datatypes ((ValueCell!3523 0))(
  ( (ValueCellFull!3523 (v!6102 V!11287)) (EmptyCell!3523) )
))
(declare-datatypes ((array!19057 0))(
  ( (array!19058 (arr!9030 (Array (_ BitVec 32) ValueCell!3523)) (size!9382 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!19057)

(declare-fun mapValue!13083 () ValueCell!3523)

(declare-fun mapRest!13083 () (Array (_ BitVec 32) ValueCell!3523))

(declare-fun mapKey!13083 () (_ BitVec 32))

(assert (=> mapNonEmpty!13083 (= (arr!9030 _values!1525) (store mapRest!13083 mapKey!13083 mapValue!13083))))

(declare-fun b!352754 () Bool)

(declare-fun res!195608 () Bool)

(declare-fun e!216009 () Bool)

(assert (=> b!352754 (=> (not res!195608) (not e!216009))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!352754 (= res!195608 (validKeyInArray!0 k!1348))))

(declare-fun mapIsEmpty!13083 () Bool)

(assert (=> mapIsEmpty!13083 mapRes!13083))

(declare-fun b!352755 () Bool)

(declare-fun e!216008 () Bool)

(declare-fun e!216012 () Bool)

(assert (=> b!352755 (= e!216008 (and e!216012 mapRes!13083))))

(declare-fun condMapEmpty!13083 () Bool)

(declare-fun mapDefault!13083 () ValueCell!3523)

