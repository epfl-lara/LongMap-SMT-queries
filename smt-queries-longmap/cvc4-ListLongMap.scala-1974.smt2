; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34710 () Bool)

(assert start!34710)

(declare-fun b_free!7517 () Bool)

(declare-fun b_next!7517 () Bool)

(assert (=> start!34710 (= b_free!7517 (not b_next!7517))))

(declare-fun tp!26115 () Bool)

(declare-fun b_and!14737 () Bool)

(assert (=> start!34710 (= tp!26115 b_and!14737)))

(declare-fun mapIsEmpty!12660 () Bool)

(declare-fun mapRes!12660 () Bool)

(assert (=> mapIsEmpty!12660 mapRes!12660))

(declare-fun b!346946 () Bool)

(declare-fun res!191973 () Bool)

(declare-fun e!212611 () Bool)

(assert (=> b!346946 (=> (not res!191973) (not e!212611))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!346946 (= res!191973 (validKeyInArray!0 k!1348))))

(declare-fun b!346947 () Bool)

(declare-fun res!191976 () Bool)

(assert (=> b!346947 (=> (not res!191976) (not e!212611))))

(declare-datatypes ((array!18531 0))(
  ( (array!18532 (arr!8776 (Array (_ BitVec 32) (_ BitVec 64))) (size!9128 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18531)

(declare-datatypes ((List!5094 0))(
  ( (Nil!5091) (Cons!5090 (h!5946 (_ BitVec 64)) (t!10222 List!5094)) )
))
(declare-fun arrayNoDuplicates!0 (array!18531 (_ BitVec 32) List!5094) Bool)

(assert (=> b!346947 (= res!191976 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5091))))

(declare-fun mapNonEmpty!12660 () Bool)

(declare-fun tp!26114 () Bool)

(declare-fun e!212616 () Bool)

(assert (=> mapNonEmpty!12660 (= mapRes!12660 (and tp!26114 e!212616))))

(declare-datatypes ((V!10935 0))(
  ( (V!10936 (val!3779 Int)) )
))
(declare-datatypes ((ValueCell!3391 0))(
  ( (ValueCellFull!3391 (v!5961 V!10935)) (EmptyCell!3391) )
))
(declare-fun mapValue!12660 () ValueCell!3391)

(declare-fun mapKey!12660 () (_ BitVec 32))

(declare-datatypes ((array!18533 0))(
  ( (array!18534 (arr!8777 (Array (_ BitVec 32) ValueCell!3391)) (size!9129 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18533)

(declare-fun mapRest!12660 () (Array (_ BitVec 32) ValueCell!3391))

(assert (=> mapNonEmpty!12660 (= (arr!8777 _values!1525) (store mapRest!12660 mapKey!12660 mapValue!12660))))

(declare-fun b!346948 () Bool)

(declare-fun res!191974 () Bool)

(assert (=> b!346948 (=> (not res!191974) (not e!212611))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18531 (_ BitVec 32)) Bool)

(assert (=> b!346948 (= res!191974 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!346949 () Bool)

(declare-fun res!191975 () Bool)

(assert (=> b!346949 (=> (not res!191975) (not e!212611))))

(declare-fun zeroValue!1467 () V!10935)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10935)

(declare-datatypes ((tuple2!5472 0))(
  ( (tuple2!5473 (_1!2747 (_ BitVec 64)) (_2!2747 V!10935)) )
))
(declare-datatypes ((List!5095 0))(
  ( (Nil!5092) (Cons!5091 (h!5947 tuple2!5472) (t!10223 List!5095)) )
))
(declare-datatypes ((ListLongMap!4385 0))(
  ( (ListLongMap!4386 (toList!2208 List!5095)) )
))
(declare-fun contains!2272 (ListLongMap!4385 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1729 (array!18531 array!18533 (_ BitVec 32) (_ BitVec 32) V!10935 V!10935 (_ BitVec 32) Int) ListLongMap!4385)

(assert (=> b!346949 (= res!191975 (not (contains!2272 (getCurrentListMap!1729 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!346950 () Bool)

(declare-fun tp_is_empty!7469 () Bool)

(assert (=> b!346950 (= e!212616 tp_is_empty!7469)))

(declare-fun b!346952 () Bool)

(declare-fun e!212615 () Bool)

(declare-fun e!212612 () Bool)

(assert (=> b!346952 (= e!212615 (and e!212612 mapRes!12660))))

(declare-fun condMapEmpty!12660 () Bool)

(declare-fun mapDefault!12660 () ValueCell!3391)

