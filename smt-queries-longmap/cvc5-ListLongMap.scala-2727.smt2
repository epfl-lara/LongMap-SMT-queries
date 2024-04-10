; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40180 () Bool)

(assert start!40180)

(declare-fun b_free!10447 () Bool)

(declare-fun b_next!10447 () Bool)

(assert (=> start!40180 (= b_free!10447 (not b_next!10447))))

(declare-fun tp!36870 () Bool)

(declare-fun b_and!18415 () Bool)

(assert (=> start!40180 (= tp!36870 b_and!18415)))

(declare-fun b!440084 () Bool)

(declare-fun res!260213 () Bool)

(declare-fun e!259340 () Bool)

(assert (=> b!440084 (=> (not res!260213) (not e!259340))))

(declare-datatypes ((array!27013 0))(
  ( (array!27014 (arr!12956 (Array (_ BitVec 32) (_ BitVec 64))) (size!13308 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27013)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27013 (_ BitVec 32)) Bool)

(assert (=> b!440084 (= res!260213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!440085 () Bool)

(declare-fun res!260209 () Bool)

(assert (=> b!440085 (=> (not res!260209) (not e!259340))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16571 0))(
  ( (V!16572 (val!5844 Int)) )
))
(declare-datatypes ((ValueCell!5456 0))(
  ( (ValueCellFull!5456 (v!8091 V!16571)) (EmptyCell!5456) )
))
(declare-datatypes ((array!27015 0))(
  ( (array!27016 (arr!12957 (Array (_ BitVec 32) ValueCell!5456)) (size!13309 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27015)

(assert (=> b!440085 (= res!260209 (and (= (size!13309 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13308 _keys!709) (size!13309 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!440086 () Bool)

(declare-fun res!260220 () Bool)

(assert (=> b!440086 (=> (not res!260220) (not e!259340))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27013 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!440086 (= res!260220 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19020 () Bool)

(declare-fun mapRes!19020 () Bool)

(declare-fun tp!36869 () Bool)

(declare-fun e!259337 () Bool)

(assert (=> mapNonEmpty!19020 (= mapRes!19020 (and tp!36869 e!259337))))

(declare-fun mapValue!19020 () ValueCell!5456)

(declare-fun mapRest!19020 () (Array (_ BitVec 32) ValueCell!5456))

(declare-fun mapKey!19020 () (_ BitVec 32))

(assert (=> mapNonEmpty!19020 (= (arr!12957 _values!549) (store mapRest!19020 mapKey!19020 mapValue!19020))))

(declare-fun b!440087 () Bool)

(declare-fun e!259339 () Bool)

(assert (=> b!440087 (= e!259340 e!259339)))

(declare-fun res!260216 () Bool)

(assert (=> b!440087 (=> (not res!260216) (not e!259339))))

(declare-fun lt!202475 () array!27013)

(assert (=> b!440087 (= res!260216 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202475 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!440087 (= lt!202475 (array!27014 (store (arr!12956 _keys!709) i!563 k!794) (size!13308 _keys!709)))))

(declare-fun b!440088 () Bool)

(declare-fun res!260219 () Bool)

(assert (=> b!440088 (=> (not res!260219) (not e!259339))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!440088 (= res!260219 (bvsle from!863 i!563))))

(declare-fun b!440089 () Bool)

(declare-fun e!259338 () Bool)

(assert (=> b!440089 (= e!259339 e!259338)))

(declare-fun res!260215 () Bool)

(assert (=> b!440089 (=> (not res!260215) (not e!259338))))

(assert (=> b!440089 (= res!260215 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16571)

(declare-fun lt!202473 () array!27015)

(declare-fun zeroValue!515 () V!16571)

(declare-datatypes ((tuple2!7764 0))(
  ( (tuple2!7765 (_1!3893 (_ BitVec 64)) (_2!3893 V!16571)) )
))
(declare-datatypes ((List!7762 0))(
  ( (Nil!7759) (Cons!7758 (h!8614 tuple2!7764) (t!13518 List!7762)) )
))
(declare-datatypes ((ListLongMap!6677 0))(
  ( (ListLongMap!6678 (toList!3354 List!7762)) )
))
(declare-fun lt!202471 () ListLongMap!6677)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1543 (array!27013 array!27015 (_ BitVec 32) (_ BitVec 32) V!16571 V!16571 (_ BitVec 32) Int) ListLongMap!6677)

(assert (=> b!440089 (= lt!202471 (getCurrentListMapNoExtraKeys!1543 lt!202475 lt!202473 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16571)

(assert (=> b!440089 (= lt!202473 (array!27016 (store (arr!12957 _values!549) i!563 (ValueCellFull!5456 v!412)) (size!13309 _values!549)))))

(declare-fun lt!202472 () ListLongMap!6677)

(assert (=> b!440089 (= lt!202472 (getCurrentListMapNoExtraKeys!1543 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!440090 () Bool)

(declare-fun res!260212 () Bool)

(assert (=> b!440090 (=> (not res!260212) (not e!259340))))

(declare-datatypes ((List!7763 0))(
  ( (Nil!7760) (Cons!7759 (h!8615 (_ BitVec 64)) (t!13519 List!7763)) )
))
(declare-fun arrayNoDuplicates!0 (array!27013 (_ BitVec 32) List!7763) Bool)

(assert (=> b!440090 (= res!260212 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7760))))

(declare-fun b!440091 () Bool)

(declare-fun tp_is_empty!11599 () Bool)

(assert (=> b!440091 (= e!259337 tp_is_empty!11599)))

(declare-fun b!440092 () Bool)

(declare-fun res!260218 () Bool)

(assert (=> b!440092 (=> (not res!260218) (not e!259340))))

(assert (=> b!440092 (= res!260218 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13308 _keys!709))))))

(declare-fun b!440093 () Bool)

(declare-fun res!260214 () Bool)

(assert (=> b!440093 (=> (not res!260214) (not e!259340))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!440093 (= res!260214 (validKeyInArray!0 k!794))))

(declare-fun b!440094 () Bool)

(declare-fun e!259335 () Bool)

(declare-fun e!259336 () Bool)

(assert (=> b!440094 (= e!259335 (and e!259336 mapRes!19020))))

(declare-fun condMapEmpty!19020 () Bool)

(declare-fun mapDefault!19020 () ValueCell!5456)

