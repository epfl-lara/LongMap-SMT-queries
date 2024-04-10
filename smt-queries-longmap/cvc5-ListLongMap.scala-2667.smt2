; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39820 () Bool)

(assert start!39820)

(declare-fun b_free!10087 () Bool)

(declare-fun b_next!10087 () Bool)

(assert (=> start!39820 (= b_free!10087 (not b_next!10087))))

(declare-fun tp!35790 () Bool)

(declare-fun b_and!17833 () Bool)

(assert (=> start!39820 (= tp!35790 b_and!17833)))

(declare-fun b!429905 () Bool)

(declare-fun res!252544 () Bool)

(declare-fun e!254574 () Bool)

(assert (=> b!429905 (=> (not res!252544) (not e!254574))))

(declare-datatypes ((array!26313 0))(
  ( (array!26314 (arr!12606 (Array (_ BitVec 32) (_ BitVec 64))) (size!12958 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26313)

(declare-datatypes ((List!7475 0))(
  ( (Nil!7472) (Cons!7471 (h!8327 (_ BitVec 64)) (t!13011 List!7475)) )
))
(declare-fun arrayNoDuplicates!0 (array!26313 (_ BitVec 32) List!7475) Bool)

(assert (=> b!429905 (= res!252544 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7472))))

(declare-fun b!429906 () Bool)

(declare-fun res!252537 () Bool)

(assert (=> b!429906 (=> (not res!252537) (not e!254574))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!429906 (= res!252537 (or (= (select (arr!12606 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12606 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!429907 () Bool)

(declare-fun res!252541 () Bool)

(assert (=> b!429907 (=> (not res!252541) (not e!254574))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!429907 (= res!252541 (validMask!0 mask!1025))))

(declare-fun b!429908 () Bool)

(declare-fun e!254569 () Bool)

(declare-fun e!254572 () Bool)

(assert (=> b!429908 (= e!254569 e!254572)))

(declare-fun res!252538 () Bool)

(assert (=> b!429908 (=> (not res!252538) (not e!254572))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!429908 (= res!252538 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!16091 0))(
  ( (V!16092 (val!5664 Int)) )
))
(declare-fun minValue!515 () V!16091)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16091)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5276 0))(
  ( (ValueCellFull!5276 (v!7911 V!16091)) (EmptyCell!5276) )
))
(declare-datatypes ((array!26315 0))(
  ( (array!26316 (arr!12607 (Array (_ BitVec 32) ValueCell!5276)) (size!12959 (_ BitVec 32))) )
))
(declare-fun lt!196503 () array!26315)

(declare-fun lt!196496 () array!26313)

(declare-datatypes ((tuple2!7458 0))(
  ( (tuple2!7459 (_1!3740 (_ BitVec 64)) (_2!3740 V!16091)) )
))
(declare-datatypes ((List!7476 0))(
  ( (Nil!7473) (Cons!7472 (h!8328 tuple2!7458) (t!13012 List!7476)) )
))
(declare-datatypes ((ListLongMap!6371 0))(
  ( (ListLongMap!6372 (toList!3201 List!7476)) )
))
(declare-fun lt!196502 () ListLongMap!6371)

(declare-fun getCurrentListMapNoExtraKeys!1403 (array!26313 array!26315 (_ BitVec 32) (_ BitVec 32) V!16091 V!16091 (_ BitVec 32) Int) ListLongMap!6371)

(assert (=> b!429908 (= lt!196502 (getCurrentListMapNoExtraKeys!1403 lt!196496 lt!196503 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26315)

(declare-fun v!412 () V!16091)

(assert (=> b!429908 (= lt!196503 (array!26316 (store (arr!12607 _values!549) i!563 (ValueCellFull!5276 v!412)) (size!12959 _values!549)))))

(declare-fun lt!196505 () ListLongMap!6371)

(assert (=> b!429908 (= lt!196505 (getCurrentListMapNoExtraKeys!1403 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!429909 () Bool)

(declare-fun e!254576 () Bool)

(declare-fun tp_is_empty!11239 () Bool)

(assert (=> b!429909 (= e!254576 tp_is_empty!11239)))

(declare-fun res!252539 () Bool)

(assert (=> start!39820 (=> (not res!252539) (not e!254574))))

(assert (=> start!39820 (= res!252539 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12958 _keys!709))))))

(assert (=> start!39820 e!254574))

(assert (=> start!39820 tp_is_empty!11239))

(assert (=> start!39820 tp!35790))

(assert (=> start!39820 true))

(declare-fun e!254575 () Bool)

(declare-fun array_inv!9180 (array!26315) Bool)

(assert (=> start!39820 (and (array_inv!9180 _values!549) e!254575)))

(declare-fun array_inv!9181 (array!26313) Bool)

(assert (=> start!39820 (array_inv!9181 _keys!709)))

(declare-fun b!429910 () Bool)

(declare-fun res!252536 () Bool)

(assert (=> b!429910 (=> (not res!252536) (not e!254574))))

(assert (=> b!429910 (= res!252536 (and (= (size!12959 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12958 _keys!709) (size!12959 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!18480 () Bool)

(declare-fun mapRes!18480 () Bool)

(declare-fun tp!35789 () Bool)

(assert (=> mapNonEmpty!18480 (= mapRes!18480 (and tp!35789 e!254576))))

(declare-fun mapRest!18480 () (Array (_ BitVec 32) ValueCell!5276))

(declare-fun mapKey!18480 () (_ BitVec 32))

(declare-fun mapValue!18480 () ValueCell!5276)

(assert (=> mapNonEmpty!18480 (= (arr!12607 _values!549) (store mapRest!18480 mapKey!18480 mapValue!18480))))

(declare-fun b!429911 () Bool)

(declare-fun res!252545 () Bool)

(assert (=> b!429911 (=> (not res!252545) (not e!254574))))

(assert (=> b!429911 (= res!252545 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12958 _keys!709))))))

(declare-fun b!429912 () Bool)

(assert (=> b!429912 (= e!254574 e!254569)))

(declare-fun res!252542 () Bool)

(assert (=> b!429912 (=> (not res!252542) (not e!254569))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26313 (_ BitVec 32)) Bool)

(assert (=> b!429912 (= res!252542 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!196496 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!429912 (= lt!196496 (array!26314 (store (arr!12606 _keys!709) i!563 k!794) (size!12958 _keys!709)))))

(declare-fun b!429913 () Bool)

(declare-fun e!254571 () Bool)

(assert (=> b!429913 (= e!254572 (not e!254571))))

(declare-fun res!252535 () Bool)

(assert (=> b!429913 (=> res!252535 e!254571)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!429913 (= res!252535 (not (validKeyInArray!0 (select (arr!12606 _keys!709) from!863))))))

(declare-fun lt!196499 () ListLongMap!6371)

(declare-fun lt!196497 () ListLongMap!6371)

(assert (=> b!429913 (= lt!196499 lt!196497)))

(declare-fun lt!196501 () ListLongMap!6371)

(declare-fun +!1350 (ListLongMap!6371 tuple2!7458) ListLongMap!6371)

(assert (=> b!429913 (= lt!196497 (+!1350 lt!196501 (tuple2!7459 k!794 v!412)))))

(assert (=> b!429913 (= lt!196499 (getCurrentListMapNoExtraKeys!1403 lt!196496 lt!196503 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!429913 (= lt!196501 (getCurrentListMapNoExtraKeys!1403 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12640 0))(
  ( (Unit!12641) )
))
(declare-fun lt!196504 () Unit!12640)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!539 (array!26313 array!26315 (_ BitVec 32) (_ BitVec 32) V!16091 V!16091 (_ BitVec 32) (_ BitVec 64) V!16091 (_ BitVec 32) Int) Unit!12640)

(assert (=> b!429913 (= lt!196504 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!539 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!429914 () Bool)

(declare-fun e!254570 () Unit!12640)

(declare-fun Unit!12642 () Unit!12640)

(assert (=> b!429914 (= e!254570 Unit!12642)))

(declare-fun b!429915 () Bool)

(declare-fun res!252540 () Bool)

(assert (=> b!429915 (=> (not res!252540) (not e!254574))))

(declare-fun arrayContainsKey!0 (array!26313 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!429915 (= res!252540 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!429916 () Bool)

(declare-fun res!252546 () Bool)

(assert (=> b!429916 (=> (not res!252546) (not e!254574))))

(assert (=> b!429916 (= res!252546 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!429917 () Bool)

(assert (=> b!429917 (= e!254571 true)))

(assert (=> b!429917 (not (= (select (arr!12606 _keys!709) from!863) k!794))))

(declare-fun lt!196498 () Unit!12640)

(assert (=> b!429917 (= lt!196498 e!254570)))

(declare-fun c!55466 () Bool)

(assert (=> b!429917 (= c!55466 (= (select (arr!12606 _keys!709) from!863) k!794))))

(declare-fun get!6254 (ValueCell!5276 V!16091) V!16091)

(declare-fun dynLambda!777 (Int (_ BitVec 64)) V!16091)

(assert (=> b!429917 (= lt!196502 (+!1350 lt!196497 (tuple2!7459 (select (arr!12606 _keys!709) from!863) (get!6254 (select (arr!12607 _values!549) from!863) (dynLambda!777 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapIsEmpty!18480 () Bool)

(assert (=> mapIsEmpty!18480 mapRes!18480))

(declare-fun b!429918 () Bool)

(declare-fun Unit!12643 () Unit!12640)

(assert (=> b!429918 (= e!254570 Unit!12643)))

(declare-fun lt!196500 () Unit!12640)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26313 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12640)

(assert (=> b!429918 (= lt!196500 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!429918 false))

(declare-fun b!429919 () Bool)

(declare-fun res!252533 () Bool)

(assert (=> b!429919 (=> (not res!252533) (not e!254574))))

(assert (=> b!429919 (= res!252533 (validKeyInArray!0 k!794))))

(declare-fun b!429920 () Bool)

(declare-fun res!252543 () Bool)

(assert (=> b!429920 (=> (not res!252543) (not e!254569))))

(assert (=> b!429920 (= res!252543 (bvsle from!863 i!563))))

(declare-fun b!429921 () Bool)

(declare-fun res!252534 () Bool)

(assert (=> b!429921 (=> (not res!252534) (not e!254569))))

(assert (=> b!429921 (= res!252534 (arrayNoDuplicates!0 lt!196496 #b00000000000000000000000000000000 Nil!7472))))

(declare-fun b!429922 () Bool)

(declare-fun e!254577 () Bool)

(assert (=> b!429922 (= e!254575 (and e!254577 mapRes!18480))))

(declare-fun condMapEmpty!18480 () Bool)

(declare-fun mapDefault!18480 () ValueCell!5276)

