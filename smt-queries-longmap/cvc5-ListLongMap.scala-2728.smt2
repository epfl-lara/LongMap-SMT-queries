; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40186 () Bool)

(assert start!40186)

(declare-fun b_free!10453 () Bool)

(declare-fun b_next!10453 () Bool)

(assert (=> start!40186 (= b_free!10453 (not b_next!10453))))

(declare-fun tp!36888 () Bool)

(declare-fun b_and!18421 () Bool)

(assert (=> start!40186 (= tp!36888 b_and!18421)))

(declare-fun b!440228 () Bool)

(declare-fun e!259400 () Bool)

(declare-fun e!259398 () Bool)

(assert (=> b!440228 (= e!259400 e!259398)))

(declare-fun res!260337 () Bool)

(assert (=> b!440228 (=> (not res!260337) (not e!259398))))

(declare-datatypes ((array!27023 0))(
  ( (array!27024 (arr!12961 (Array (_ BitVec 32) (_ BitVec 64))) (size!13313 (_ BitVec 32))) )
))
(declare-fun lt!202520 () array!27023)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27023 (_ BitVec 32)) Bool)

(assert (=> b!440228 (= res!260337 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202520 mask!1025))))

(declare-fun _keys!709 () array!27023)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!440228 (= lt!202520 (array!27024 (store (arr!12961 _keys!709) i!563 k!794) (size!13313 _keys!709)))))

(declare-fun b!440229 () Bool)

(declare-fun res!260334 () Bool)

(assert (=> b!440229 (=> (not res!260334) (not e!259400))))

(declare-datatypes ((List!7766 0))(
  ( (Nil!7763) (Cons!7762 (h!8618 (_ BitVec 64)) (t!13522 List!7766)) )
))
(declare-fun arrayNoDuplicates!0 (array!27023 (_ BitVec 32) List!7766) Bool)

(assert (=> b!440229 (= res!260334 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7763))))

(declare-fun b!440230 () Bool)

(declare-fun e!259399 () Bool)

(assert (=> b!440230 (= e!259399 (not true))))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16579 0))(
  ( (V!16580 (val!5847 Int)) )
))
(declare-datatypes ((ValueCell!5459 0))(
  ( (ValueCellFull!5459 (v!8094 V!16579)) (EmptyCell!5459) )
))
(declare-datatypes ((array!27025 0))(
  ( (array!27026 (arr!12962 (Array (_ BitVec 32) ValueCell!5459)) (size!13314 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27025)

(declare-fun zeroValue!515 () V!16579)

(declare-fun lt!202518 () array!27025)

(declare-fun v!412 () V!16579)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!16579)

(declare-datatypes ((tuple2!7768 0))(
  ( (tuple2!7769 (_1!3895 (_ BitVec 64)) (_2!3895 V!16579)) )
))
(declare-datatypes ((List!7767 0))(
  ( (Nil!7764) (Cons!7763 (h!8619 tuple2!7768) (t!13523 List!7767)) )
))
(declare-datatypes ((ListLongMap!6681 0))(
  ( (ListLongMap!6682 (toList!3356 List!7767)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1545 (array!27023 array!27025 (_ BitVec 32) (_ BitVec 32) V!16579 V!16579 (_ BitVec 32) Int) ListLongMap!6681)

(declare-fun +!1495 (ListLongMap!6681 tuple2!7768) ListLongMap!6681)

(assert (=> b!440230 (= (getCurrentListMapNoExtraKeys!1545 lt!202520 lt!202518 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1495 (getCurrentListMapNoExtraKeys!1545 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7769 k!794 v!412)))))

(declare-datatypes ((Unit!13094 0))(
  ( (Unit!13095) )
))
(declare-fun lt!202519 () Unit!13094)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!664 (array!27023 array!27025 (_ BitVec 32) (_ BitVec 32) V!16579 V!16579 (_ BitVec 32) (_ BitVec 64) V!16579 (_ BitVec 32) Int) Unit!13094)

(assert (=> b!440230 (= lt!202519 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!664 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!440231 () Bool)

(declare-fun e!259402 () Bool)

(declare-fun e!259404 () Bool)

(declare-fun mapRes!19029 () Bool)

(assert (=> b!440231 (= e!259402 (and e!259404 mapRes!19029))))

(declare-fun condMapEmpty!19029 () Bool)

(declare-fun mapDefault!19029 () ValueCell!5459)

