; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40106 () Bool)

(assert start!40106)

(declare-fun b_free!10373 () Bool)

(declare-fun b_next!10373 () Bool)

(assert (=> start!40106 (= b_free!10373 (not b_next!10373))))

(declare-fun tp!36648 () Bool)

(declare-fun b_and!18341 () Bool)

(assert (=> start!40106 (= tp!36648 b_and!18341)))

(declare-fun b!438308 () Bool)

(declare-fun res!258776 () Bool)

(declare-fun e!258560 () Bool)

(assert (=> b!438308 (=> (not res!258776) (not e!258560))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!438308 (= res!258776 (validKeyInArray!0 k!794))))

(declare-fun b!438309 () Bool)

(declare-fun e!258558 () Bool)

(assert (=> b!438309 (= e!258560 e!258558)))

(declare-fun res!258775 () Bool)

(assert (=> b!438309 (=> (not res!258775) (not e!258558))))

(declare-datatypes ((array!26867 0))(
  ( (array!26868 (arr!12883 (Array (_ BitVec 32) (_ BitVec 64))) (size!13235 (_ BitVec 32))) )
))
(declare-fun lt!201916 () array!26867)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26867 (_ BitVec 32)) Bool)

(assert (=> b!438309 (= res!258775 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201916 mask!1025))))

(declare-fun _keys!709 () array!26867)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!438309 (= lt!201916 (array!26868 (store (arr!12883 _keys!709) i!563 k!794) (size!13235 _keys!709)))))

(declare-fun b!438310 () Bool)

(declare-fun res!258772 () Bool)

(assert (=> b!438310 (=> (not res!258772) (not e!258558))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!438310 (= res!258772 (bvsle from!863 i!563))))

(declare-fun b!438311 () Bool)

(declare-fun res!258769 () Bool)

(assert (=> b!438311 (=> (not res!258769) (not e!258560))))

(declare-datatypes ((List!7699 0))(
  ( (Nil!7696) (Cons!7695 (h!8551 (_ BitVec 64)) (t!13455 List!7699)) )
))
(declare-fun arrayNoDuplicates!0 (array!26867 (_ BitVec 32) List!7699) Bool)

(assert (=> b!438311 (= res!258769 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7696))))

(declare-fun b!438313 () Bool)

(declare-fun e!258561 () Bool)

(assert (=> b!438313 (= e!258558 e!258561)))

(declare-fun res!258768 () Bool)

(assert (=> b!438313 (=> (not res!258768) (not e!258561))))

(assert (=> b!438313 (= res!258768 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16471 0))(
  ( (V!16472 (val!5807 Int)) )
))
(declare-fun zeroValue!515 () V!16471)

(declare-datatypes ((ValueCell!5419 0))(
  ( (ValueCellFull!5419 (v!8054 V!16471)) (EmptyCell!5419) )
))
(declare-datatypes ((array!26869 0))(
  ( (array!26870 (arr!12884 (Array (_ BitVec 32) ValueCell!5419)) (size!13236 (_ BitVec 32))) )
))
(declare-fun lt!201917 () array!26869)

(declare-datatypes ((tuple2!7700 0))(
  ( (tuple2!7701 (_1!3861 (_ BitVec 64)) (_2!3861 V!16471)) )
))
(declare-datatypes ((List!7700 0))(
  ( (Nil!7697) (Cons!7696 (h!8552 tuple2!7700) (t!13456 List!7700)) )
))
(declare-datatypes ((ListLongMap!6613 0))(
  ( (ListLongMap!6614 (toList!3322 List!7700)) )
))
(declare-fun lt!201919 () ListLongMap!6613)

(declare-fun minValue!515 () V!16471)

(declare-fun getCurrentListMapNoExtraKeys!1511 (array!26867 array!26869 (_ BitVec 32) (_ BitVec 32) V!16471 V!16471 (_ BitVec 32) Int) ListLongMap!6613)

(assert (=> b!438313 (= lt!201919 (getCurrentListMapNoExtraKeys!1511 lt!201916 lt!201917 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26869)

(declare-fun v!412 () V!16471)

(assert (=> b!438313 (= lt!201917 (array!26870 (store (arr!12884 _values!549) i!563 (ValueCellFull!5419 v!412)) (size!13236 _values!549)))))

(declare-fun lt!201920 () ListLongMap!6613)

(assert (=> b!438313 (= lt!201920 (getCurrentListMapNoExtraKeys!1511 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!438314 () Bool)

(declare-fun e!258564 () Bool)

(declare-fun e!258562 () Bool)

(declare-fun mapRes!18909 () Bool)

(assert (=> b!438314 (= e!258564 (and e!258562 mapRes!18909))))

(declare-fun condMapEmpty!18909 () Bool)

(declare-fun mapDefault!18909 () ValueCell!5419)

