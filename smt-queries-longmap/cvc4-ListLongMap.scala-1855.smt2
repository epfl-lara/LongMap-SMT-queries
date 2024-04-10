; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33514 () Bool)

(assert start!33514)

(declare-fun b_free!6803 () Bool)

(declare-fun b_next!6803 () Bool)

(assert (=> start!33514 (= b_free!6803 (not b_next!6803))))

(declare-fun tp!23903 () Bool)

(declare-fun b_and!13977 () Bool)

(assert (=> start!33514 (= tp!23903 b_and!13977)))

(declare-fun b!332575 () Bool)

(declare-fun res!183216 () Bool)

(declare-fun e!204224 () Bool)

(assert (=> b!332575 (=> (not res!183216) (not e!204224))))

(declare-datatypes ((array!17107 0))(
  ( (array!17108 (arr!8087 (Array (_ BitVec 32) (_ BitVec 64))) (size!8439 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17107)

(declare-datatypes ((List!4599 0))(
  ( (Nil!4596) (Cons!4595 (h!5451 (_ BitVec 64)) (t!9681 List!4599)) )
))
(declare-fun arrayNoDuplicates!0 (array!17107 (_ BitVec 32) List!4599) Bool)

(assert (=> b!332575 (= res!183216 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4596))))

(declare-fun mapNonEmpty!11520 () Bool)

(declare-fun mapRes!11520 () Bool)

(declare-fun tp!23904 () Bool)

(declare-fun e!204226 () Bool)

(assert (=> mapNonEmpty!11520 (= mapRes!11520 (and tp!23904 e!204226))))

(declare-datatypes ((V!9983 0))(
  ( (V!9984 (val!3422 Int)) )
))
(declare-datatypes ((ValueCell!3034 0))(
  ( (ValueCellFull!3034 (v!5581 V!9983)) (EmptyCell!3034) )
))
(declare-fun mapValue!11520 () ValueCell!3034)

(declare-datatypes ((array!17109 0))(
  ( (array!17110 (arr!8088 (Array (_ BitVec 32) ValueCell!3034)) (size!8440 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17109)

(declare-fun mapKey!11520 () (_ BitVec 32))

(declare-fun mapRest!11520 () (Array (_ BitVec 32) ValueCell!3034))

(assert (=> mapNonEmpty!11520 (= (arr!8088 _values!1525) (store mapRest!11520 mapKey!11520 mapValue!11520))))

(declare-fun b!332576 () Bool)

(assert (=> b!332576 (= e!204224 false)))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun lt!159028 () Bool)

(declare-fun zeroValue!1467 () V!9983)

(declare-fun minValue!1467 () V!9983)

(declare-datatypes ((tuple2!4986 0))(
  ( (tuple2!4987 (_1!2504 (_ BitVec 64)) (_2!2504 V!9983)) )
))
(declare-datatypes ((List!4600 0))(
  ( (Nil!4597) (Cons!4596 (h!5452 tuple2!4986) (t!9682 List!4600)) )
))
(declare-datatypes ((ListLongMap!3899 0))(
  ( (ListLongMap!3900 (toList!1965 List!4600)) )
))
(declare-fun contains!2006 (ListLongMap!3899 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1493 (array!17107 array!17109 (_ BitVec 32) (_ BitVec 32) V!9983 V!9983 (_ BitVec 32) Int) ListLongMap!3899)

(assert (=> b!332576 (= lt!159028 (contains!2006 (getCurrentListMap!1493 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348))))

(declare-fun mapIsEmpty!11520 () Bool)

(assert (=> mapIsEmpty!11520 mapRes!11520))

(declare-fun b!332577 () Bool)

(declare-fun tp_is_empty!6755 () Bool)

(assert (=> b!332577 (= e!204226 tp_is_empty!6755)))

(declare-fun b!332578 () Bool)

(declare-fun res!183215 () Bool)

(assert (=> b!332578 (=> (not res!183215) (not e!204224))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!332578 (= res!183215 (validKeyInArray!0 k!1348))))

(declare-fun b!332579 () Bool)

(declare-fun res!183218 () Bool)

(assert (=> b!332579 (=> (not res!183218) (not e!204224))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17107 (_ BitVec 32)) Bool)

(assert (=> b!332579 (= res!183218 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!332574 () Bool)

(declare-fun e!204228 () Bool)

(assert (=> b!332574 (= e!204228 tp_is_empty!6755)))

(declare-fun res!183214 () Bool)

(assert (=> start!33514 (=> (not res!183214) (not e!204224))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33514 (= res!183214 (validMask!0 mask!2385))))

(assert (=> start!33514 e!204224))

(assert (=> start!33514 true))

(assert (=> start!33514 tp_is_empty!6755))

(assert (=> start!33514 tp!23903))

(declare-fun e!204227 () Bool)

(declare-fun array_inv!6026 (array!17109) Bool)

(assert (=> start!33514 (and (array_inv!6026 _values!1525) e!204227)))

(declare-fun array_inv!6027 (array!17107) Bool)

(assert (=> start!33514 (array_inv!6027 _keys!1895)))

(declare-fun b!332580 () Bool)

(assert (=> b!332580 (= e!204227 (and e!204228 mapRes!11520))))

(declare-fun condMapEmpty!11520 () Bool)

(declare-fun mapDefault!11520 () ValueCell!3034)

