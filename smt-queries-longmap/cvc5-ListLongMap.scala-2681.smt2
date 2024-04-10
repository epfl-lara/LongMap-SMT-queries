; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39904 () Bool)

(assert start!39904)

(declare-fun b_free!10171 () Bool)

(declare-fun b_next!10171 () Bool)

(assert (=> start!39904 (= b_free!10171 (not b_next!10171))))

(declare-fun tp!36042 () Bool)

(declare-fun b_and!18001 () Bool)

(assert (=> start!39904 (= tp!36042 b_and!18001)))

(declare-fun b!432502 () Bool)

(declare-fun e!255825 () Bool)

(declare-fun e!255828 () Bool)

(assert (=> b!432502 (= e!255825 e!255828)))

(declare-fun res!254429 () Bool)

(assert (=> b!432502 (=> (not res!254429) (not e!255828))))

(declare-datatypes ((array!26479 0))(
  ( (array!26480 (arr!12689 (Array (_ BitVec 32) (_ BitVec 64))) (size!13041 (_ BitVec 32))) )
))
(declare-fun lt!198351 () array!26479)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26479 (_ BitVec 32)) Bool)

(assert (=> b!432502 (= res!254429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!198351 mask!1025))))

(declare-fun _keys!709 () array!26479)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!432502 (= lt!198351 (array!26480 (store (arr!12689 _keys!709) i!563 k!794) (size!13041 _keys!709)))))

(declare-fun b!432503 () Bool)

(declare-fun res!254430 () Bool)

(assert (=> b!432503 (=> (not res!254430) (not e!255825))))

(declare-datatypes ((List!7545 0))(
  ( (Nil!7542) (Cons!7541 (h!8397 (_ BitVec 64)) (t!13165 List!7545)) )
))
(declare-fun arrayNoDuplicates!0 (array!26479 (_ BitVec 32) List!7545) Bool)

(assert (=> b!432503 (= res!254430 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7542))))

(declare-fun b!432504 () Bool)

(declare-fun e!255823 () Bool)

(declare-fun e!255824 () Bool)

(assert (=> b!432504 (= e!255823 (not e!255824))))

(declare-fun res!254417 () Bool)

(assert (=> b!432504 (=> res!254417 e!255824)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!432504 (= res!254417 (not (validKeyInArray!0 (select (arr!12689 _keys!709) from!863))))))

(declare-datatypes ((V!16203 0))(
  ( (V!16204 (val!5706 Int)) )
))
(declare-datatypes ((tuple2!7530 0))(
  ( (tuple2!7531 (_1!3776 (_ BitVec 64)) (_2!3776 V!16203)) )
))
(declare-datatypes ((List!7546 0))(
  ( (Nil!7543) (Cons!7542 (h!8398 tuple2!7530) (t!13166 List!7546)) )
))
(declare-datatypes ((ListLongMap!6443 0))(
  ( (ListLongMap!6444 (toList!3237 List!7546)) )
))
(declare-fun lt!198353 () ListLongMap!6443)

(declare-fun lt!198358 () ListLongMap!6443)

(assert (=> b!432504 (= lt!198353 lt!198358)))

(declare-fun lt!198364 () ListLongMap!6443)

(declare-fun lt!198359 () tuple2!7530)

(declare-fun +!1385 (ListLongMap!6443 tuple2!7530) ListLongMap!6443)

(assert (=> b!432504 (= lt!198358 (+!1385 lt!198364 lt!198359))))

(declare-fun minValue!515 () V!16203)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16203)

(declare-datatypes ((ValueCell!5318 0))(
  ( (ValueCellFull!5318 (v!7953 V!16203)) (EmptyCell!5318) )
))
(declare-datatypes ((array!26481 0))(
  ( (array!26482 (arr!12690 (Array (_ BitVec 32) ValueCell!5318)) (size!13042 (_ BitVec 32))) )
))
(declare-fun lt!198356 () array!26481)

(declare-fun getCurrentListMapNoExtraKeys!1435 (array!26479 array!26481 (_ BitVec 32) (_ BitVec 32) V!16203 V!16203 (_ BitVec 32) Int) ListLongMap!6443)

(assert (=> b!432504 (= lt!198353 (getCurrentListMapNoExtraKeys!1435 lt!198351 lt!198356 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun v!412 () V!16203)

(assert (=> b!432504 (= lt!198359 (tuple2!7531 k!794 v!412))))

(declare-fun _values!549 () array!26481)

(assert (=> b!432504 (= lt!198364 (getCurrentListMapNoExtraKeys!1435 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12775 0))(
  ( (Unit!12776) )
))
(declare-fun lt!198354 () Unit!12775)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!569 (array!26479 array!26481 (_ BitVec 32) (_ BitVec 32) V!16203 V!16203 (_ BitVec 32) (_ BitVec 64) V!16203 (_ BitVec 32) Int) Unit!12775)

(assert (=> b!432504 (= lt!198354 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!569 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!432505 () Bool)

(assert (=> b!432505 (= e!255828 e!255823)))

(declare-fun res!254427 () Bool)

(assert (=> b!432505 (=> (not res!254427) (not e!255823))))

(assert (=> b!432505 (= res!254427 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!198365 () ListLongMap!6443)

(assert (=> b!432505 (= lt!198365 (getCurrentListMapNoExtraKeys!1435 lt!198351 lt!198356 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!432505 (= lt!198356 (array!26482 (store (arr!12690 _values!549) i!563 (ValueCellFull!5318 v!412)) (size!13042 _values!549)))))

(declare-fun lt!198352 () ListLongMap!6443)

(assert (=> b!432505 (= lt!198352 (getCurrentListMapNoExtraKeys!1435 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!432506 () Bool)

(declare-fun res!254420 () Bool)

(assert (=> b!432506 (=> (not res!254420) (not e!255825))))

(assert (=> b!432506 (= res!254420 (and (= (size!13042 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13041 _keys!709) (size!13042 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!432507 () Bool)

(declare-fun res!254419 () Bool)

(assert (=> b!432507 (=> (not res!254419) (not e!255825))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!432507 (= res!254419 (validMask!0 mask!1025))))

(declare-fun b!432508 () Bool)

(declare-fun e!255827 () Bool)

(assert (=> b!432508 (= e!255827 true)))

(declare-fun lt!198355 () tuple2!7530)

(declare-fun lt!198357 () ListLongMap!6443)

(assert (=> b!432508 (= lt!198357 (+!1385 (+!1385 lt!198364 lt!198355) lt!198359))))

(declare-fun lt!198362 () Unit!12775)

(declare-fun lt!198363 () V!16203)

(declare-fun addCommutativeForDiffKeys!375 (ListLongMap!6443 (_ BitVec 64) V!16203 (_ BitVec 64) V!16203) Unit!12775)

(assert (=> b!432508 (= lt!198362 (addCommutativeForDiffKeys!375 lt!198364 k!794 v!412 (select (arr!12689 _keys!709) from!863) lt!198363))))

(declare-fun b!432509 () Bool)

(declare-fun e!255830 () Unit!12775)

(declare-fun Unit!12777 () Unit!12775)

(assert (=> b!432509 (= e!255830 Unit!12777)))

(declare-fun lt!198361 () Unit!12775)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26479 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12775)

(assert (=> b!432509 (= lt!198361 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!432509 false))

(declare-fun b!432510 () Bool)

(declare-fun res!254416 () Bool)

(assert (=> b!432510 (=> (not res!254416) (not e!255828))))

(assert (=> b!432510 (= res!254416 (arrayNoDuplicates!0 lt!198351 #b00000000000000000000000000000000 Nil!7542))))

(declare-fun b!432511 () Bool)

(declare-fun res!254425 () Bool)

(assert (=> b!432511 (=> (not res!254425) (not e!255825))))

(assert (=> b!432511 (= res!254425 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!432512 () Bool)

(declare-fun res!254428 () Bool)

(assert (=> b!432512 (=> (not res!254428) (not e!255828))))

(assert (=> b!432512 (= res!254428 (bvsle from!863 i!563))))

(declare-fun b!432513 () Bool)

(declare-fun res!254418 () Bool)

(assert (=> b!432513 (=> (not res!254418) (not e!255825))))

(declare-fun arrayContainsKey!0 (array!26479 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!432513 (= res!254418 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!432514 () Bool)

(declare-fun Unit!12778 () Unit!12775)

(assert (=> b!432514 (= e!255830 Unit!12778)))

(declare-fun b!432515 () Bool)

(declare-fun res!254421 () Bool)

(assert (=> b!432515 (=> (not res!254421) (not e!255825))))

(assert (=> b!432515 (= res!254421 (or (= (select (arr!12689 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12689 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!254424 () Bool)

(assert (=> start!39904 (=> (not res!254424) (not e!255825))))

(assert (=> start!39904 (= res!254424 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13041 _keys!709))))))

(assert (=> start!39904 e!255825))

(declare-fun tp_is_empty!11323 () Bool)

(assert (=> start!39904 tp_is_empty!11323))

(assert (=> start!39904 tp!36042))

(assert (=> start!39904 true))

(declare-fun e!255831 () Bool)

(declare-fun array_inv!9230 (array!26481) Bool)

(assert (=> start!39904 (and (array_inv!9230 _values!549) e!255831)))

(declare-fun array_inv!9231 (array!26479) Bool)

(assert (=> start!39904 (array_inv!9231 _keys!709)))

(declare-fun b!432516 () Bool)

(declare-fun e!255829 () Bool)

(assert (=> b!432516 (= e!255829 tp_is_empty!11323)))

(declare-fun mapNonEmpty!18606 () Bool)

(declare-fun mapRes!18606 () Bool)

(declare-fun tp!36041 () Bool)

(assert (=> mapNonEmpty!18606 (= mapRes!18606 (and tp!36041 e!255829))))

(declare-fun mapValue!18606 () ValueCell!5318)

(declare-fun mapKey!18606 () (_ BitVec 32))

(declare-fun mapRest!18606 () (Array (_ BitVec 32) ValueCell!5318))

(assert (=> mapNonEmpty!18606 (= (arr!12690 _values!549) (store mapRest!18606 mapKey!18606 mapValue!18606))))

(declare-fun b!432517 () Bool)

(declare-fun e!255822 () Bool)

(assert (=> b!432517 (= e!255822 tp_is_empty!11323)))

(declare-fun b!432518 () Bool)

(assert (=> b!432518 (= e!255831 (and e!255822 mapRes!18606))))

(declare-fun condMapEmpty!18606 () Bool)

(declare-fun mapDefault!18606 () ValueCell!5318)

