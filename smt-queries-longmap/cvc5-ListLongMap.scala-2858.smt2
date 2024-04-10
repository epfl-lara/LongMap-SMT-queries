; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41178 () Bool)

(assert start!41178)

(declare-fun b_free!11047 () Bool)

(declare-fun b_next!11047 () Bool)

(assert (=> start!41178 (= b_free!11047 (not b_next!11047))))

(declare-fun tp!38977 () Bool)

(declare-fun b_and!19333 () Bool)

(assert (=> start!41178 (= tp!38977 b_and!19333)))

(declare-fun b!460247 () Bool)

(declare-fun res!275158 () Bool)

(declare-fun e!268531 () Bool)

(assert (=> b!460247 (=> (not res!275158) (not e!268531))))

(declare-datatypes ((array!28571 0))(
  ( (array!28572 (arr!13726 (Array (_ BitVec 32) (_ BitVec 64))) (size!14078 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28571)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!460247 (= res!275158 (or (= (select (arr!13726 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13726 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!460248 () Bool)

(declare-fun e!268534 () Bool)

(assert (=> b!460248 (= e!268534 true)))

(declare-datatypes ((V!17619 0))(
  ( (V!17620 (val!6237 Int)) )
))
(declare-datatypes ((tuple2!8226 0))(
  ( (tuple2!8227 (_1!4124 (_ BitVec 64)) (_2!4124 V!17619)) )
))
(declare-fun lt!208367 () tuple2!8226)

(declare-fun lt!208366 () tuple2!8226)

(declare-datatypes ((List!8297 0))(
  ( (Nil!8294) (Cons!8293 (h!9149 tuple2!8226) (t!14223 List!8297)) )
))
(declare-datatypes ((ListLongMap!7139 0))(
  ( (ListLongMap!7140 (toList!3585 List!8297)) )
))
(declare-fun lt!208369 () ListLongMap!7139)

(declare-fun lt!208374 () ListLongMap!7139)

(declare-fun +!1621 (ListLongMap!7139 tuple2!8226) ListLongMap!7139)

(assert (=> b!460248 (= lt!208369 (+!1621 (+!1621 lt!208374 lt!208366) lt!208367))))

(declare-fun k!794 () (_ BitVec 64))

(declare-datatypes ((Unit!13393 0))(
  ( (Unit!13394) )
))
(declare-fun lt!208372 () Unit!13393)

(declare-fun v!412 () V!17619)

(declare-fun lt!208362 () V!17619)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun addCommutativeForDiffKeys!430 (ListLongMap!7139 (_ BitVec 64) V!17619 (_ BitVec 64) V!17619) Unit!13393)

(assert (=> b!460248 (= lt!208372 (addCommutativeForDiffKeys!430 lt!208374 k!794 v!412 (select (arr!13726 _keys!709) from!863) lt!208362))))

(declare-fun b!460249 () Bool)

(declare-fun e!268535 () Bool)

(declare-fun e!268536 () Bool)

(assert (=> b!460249 (= e!268535 (not e!268536))))

(declare-fun res!275156 () Bool)

(assert (=> b!460249 (=> res!275156 e!268536)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!460249 (= res!275156 (not (validKeyInArray!0 (select (arr!13726 _keys!709) from!863))))))

(declare-fun lt!208375 () ListLongMap!7139)

(declare-fun lt!208376 () ListLongMap!7139)

(assert (=> b!460249 (= lt!208375 lt!208376)))

(assert (=> b!460249 (= lt!208376 (+!1621 lt!208374 lt!208367))))

(declare-fun minValue!515 () V!17619)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!208370 () array!28571)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5849 0))(
  ( (ValueCellFull!5849 (v!8515 V!17619)) (EmptyCell!5849) )
))
(declare-datatypes ((array!28573 0))(
  ( (array!28574 (arr!13727 (Array (_ BitVec 32) ValueCell!5849)) (size!14079 (_ BitVec 32))) )
))
(declare-fun lt!208371 () array!28573)

(declare-fun zeroValue!515 () V!17619)

(declare-fun getCurrentListMapNoExtraKeys!1765 (array!28571 array!28573 (_ BitVec 32) (_ BitVec 32) V!17619 V!17619 (_ BitVec 32) Int) ListLongMap!7139)

(assert (=> b!460249 (= lt!208375 (getCurrentListMapNoExtraKeys!1765 lt!208370 lt!208371 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!460249 (= lt!208367 (tuple2!8227 k!794 v!412))))

(declare-fun _values!549 () array!28573)

(assert (=> b!460249 (= lt!208374 (getCurrentListMapNoExtraKeys!1765 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!208373 () Unit!13393)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!777 (array!28571 array!28573 (_ BitVec 32) (_ BitVec 32) V!17619 V!17619 (_ BitVec 32) (_ BitVec 64) V!17619 (_ BitVec 32) Int) Unit!13393)

(assert (=> b!460249 (= lt!208373 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!777 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!460250 () Bool)

(declare-fun res!275153 () Bool)

(assert (=> b!460250 (=> (not res!275153) (not e!268531))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!460250 (= res!275153 (validMask!0 mask!1025))))

(declare-fun b!460251 () Bool)

(declare-fun e!268533 () Bool)

(assert (=> b!460251 (= e!268533 e!268535)))

(declare-fun res!275151 () Bool)

(assert (=> b!460251 (=> (not res!275151) (not e!268535))))

(assert (=> b!460251 (= res!275151 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!208363 () ListLongMap!7139)

(assert (=> b!460251 (= lt!208363 (getCurrentListMapNoExtraKeys!1765 lt!208370 lt!208371 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!460251 (= lt!208371 (array!28574 (store (arr!13727 _values!549) i!563 (ValueCellFull!5849 v!412)) (size!14079 _values!549)))))

(declare-fun lt!208364 () ListLongMap!7139)

(assert (=> b!460251 (= lt!208364 (getCurrentListMapNoExtraKeys!1765 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!275150 () Bool)

(assert (=> start!41178 (=> (not res!275150) (not e!268531))))

(assert (=> start!41178 (= res!275150 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14078 _keys!709))))))

(assert (=> start!41178 e!268531))

(declare-fun tp_is_empty!12385 () Bool)

(assert (=> start!41178 tp_is_empty!12385))

(assert (=> start!41178 tp!38977))

(assert (=> start!41178 true))

(declare-fun e!268538 () Bool)

(declare-fun array_inv!9926 (array!28573) Bool)

(assert (=> start!41178 (and (array_inv!9926 _values!549) e!268538)))

(declare-fun array_inv!9927 (array!28571) Bool)

(assert (=> start!41178 (array_inv!9927 _keys!709)))

(declare-fun b!460252 () Bool)

(assert (=> b!460252 (= e!268531 e!268533)))

(declare-fun res!275152 () Bool)

(assert (=> b!460252 (=> (not res!275152) (not e!268533))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28571 (_ BitVec 32)) Bool)

(assert (=> b!460252 (= res!275152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!208370 mask!1025))))

(assert (=> b!460252 (= lt!208370 (array!28572 (store (arr!13726 _keys!709) i!563 k!794) (size!14078 _keys!709)))))

(declare-fun b!460253 () Bool)

(declare-fun e!268537 () Bool)

(assert (=> b!460253 (= e!268537 tp_is_empty!12385)))

(declare-fun b!460254 () Bool)

(declare-fun res!275154 () Bool)

(assert (=> b!460254 (=> (not res!275154) (not e!268531))))

(assert (=> b!460254 (= res!275154 (and (= (size!14079 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14078 _keys!709) (size!14079 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!460255 () Bool)

(declare-fun e!268530 () Unit!13393)

(declare-fun Unit!13395 () Unit!13393)

(assert (=> b!460255 (= e!268530 Unit!13395)))

(declare-fun mapNonEmpty!20227 () Bool)

(declare-fun mapRes!20227 () Bool)

(declare-fun tp!38976 () Bool)

(assert (=> mapNonEmpty!20227 (= mapRes!20227 (and tp!38976 e!268537))))

(declare-fun mapValue!20227 () ValueCell!5849)

(declare-fun mapRest!20227 () (Array (_ BitVec 32) ValueCell!5849))

(declare-fun mapKey!20227 () (_ BitVec 32))

(assert (=> mapNonEmpty!20227 (= (arr!13727 _values!549) (store mapRest!20227 mapKey!20227 mapValue!20227))))

(declare-fun b!460256 () Bool)

(declare-fun res!275149 () Bool)

(assert (=> b!460256 (=> (not res!275149) (not e!268531))))

(declare-datatypes ((List!8298 0))(
  ( (Nil!8295) (Cons!8294 (h!9150 (_ BitVec 64)) (t!14224 List!8298)) )
))
(declare-fun arrayNoDuplicates!0 (array!28571 (_ BitVec 32) List!8298) Bool)

(assert (=> b!460256 (= res!275149 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8295))))

(declare-fun b!460257 () Bool)

(declare-fun res!275161 () Bool)

(assert (=> b!460257 (=> (not res!275161) (not e!268533))))

(assert (=> b!460257 (= res!275161 (bvsle from!863 i!563))))

(declare-fun b!460258 () Bool)

(declare-fun res!275155 () Bool)

(assert (=> b!460258 (=> (not res!275155) (not e!268533))))

(assert (=> b!460258 (= res!275155 (arrayNoDuplicates!0 lt!208370 #b00000000000000000000000000000000 Nil!8295))))

(declare-fun mapIsEmpty!20227 () Bool)

(assert (=> mapIsEmpty!20227 mapRes!20227))

(declare-fun b!460259 () Bool)

(declare-fun res!275160 () Bool)

(assert (=> b!460259 (=> (not res!275160) (not e!268531))))

(assert (=> b!460259 (= res!275160 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14078 _keys!709))))))

(declare-fun b!460260 () Bool)

(declare-fun e!268532 () Bool)

(assert (=> b!460260 (= e!268538 (and e!268532 mapRes!20227))))

(declare-fun condMapEmpty!20227 () Bool)

(declare-fun mapDefault!20227 () ValueCell!5849)

