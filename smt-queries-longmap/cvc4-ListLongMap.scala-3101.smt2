; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43550 () Bool)

(assert start!43550)

(declare-fun b_free!12329 () Bool)

(declare-fun b_next!12329 () Bool)

(assert (=> start!43550 (= b_free!12329 (not b_next!12329))))

(declare-fun tp!43270 () Bool)

(declare-fun b_and!21089 () Bool)

(assert (=> start!43550 (= tp!43270 b_and!21089)))

(declare-fun b!482578 () Bool)

(declare-fun e!283988 () Bool)

(declare-datatypes ((array!31339 0))(
  ( (array!31340 (arr!15072 (Array (_ BitVec 32) (_ BitVec 64))) (size!15430 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31339)

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31339 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!482578 (= e!283988 (arrayContainsKey!0 _keys!1874 k!1332 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!22471 () Bool)

(declare-fun mapRes!22471 () Bool)

(declare-fun tp!43269 () Bool)

(declare-fun e!283992 () Bool)

(assert (=> mapNonEmpty!22471 (= mapRes!22471 (and tp!43269 e!283992))))

(declare-datatypes ((V!19525 0))(
  ( (V!19526 (val!6968 Int)) )
))
(declare-datatypes ((ValueCell!6559 0))(
  ( (ValueCellFull!6559 (v!9261 V!19525)) (EmptyCell!6559) )
))
(declare-fun mapValue!22471 () ValueCell!6559)

(declare-fun mapKey!22471 () (_ BitVec 32))

(declare-datatypes ((array!31341 0))(
  ( (array!31342 (arr!15073 (Array (_ BitVec 32) ValueCell!6559)) (size!15431 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31341)

(declare-fun mapRest!22471 () (Array (_ BitVec 32) ValueCell!6559))

(assert (=> mapNonEmpty!22471 (= (arr!15073 _values!1516) (store mapRest!22471 mapKey!22471 mapValue!22471))))

(declare-fun b!482579 () Bool)

(declare-fun e!283991 () Bool)

(declare-fun mask!2352 () (_ BitVec 32))

(assert (=> b!482579 (= e!283991 (not (= (size!15430 _keys!1874) (bvadd #b00000000000000000000000000000001 mask!2352))))))

(declare-fun lt!218748 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!31339 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!482579 (= lt!218748 (arrayScanForKey!0 _keys!1874 k!1332 #b00000000000000000000000000000000))))

(assert (=> b!482579 e!283988))

(declare-fun c!57966 () Bool)

(assert (=> b!482579 (= c!57966 (and (not (= k!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun minValue!1458 () V!19525)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19525)

(declare-datatypes ((Unit!14148 0))(
  ( (Unit!14149) )
))
(declare-fun lt!218749 () Unit!14148)

(declare-fun defaultEntry!1519 () Int)

(declare-fun lemmaKeyInListMapIsInArray!145 (array!31339 array!31341 (_ BitVec 32) (_ BitVec 32) V!19525 V!19525 (_ BitVec 64) Int) Unit!14148)

(assert (=> b!482579 (= lt!218749 (lemmaKeyInListMapIsInArray!145 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k!1332 defaultEntry!1519))))

(declare-fun b!482580 () Bool)

(declare-fun res!287660 () Bool)

(assert (=> b!482580 (=> (not res!287660) (not e!283991))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31339 (_ BitVec 32)) Bool)

(assert (=> b!482580 (= res!287660 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!482581 () Bool)

(declare-fun res!287661 () Bool)

(assert (=> b!482581 (=> (not res!287661) (not e!283991))))

(declare-datatypes ((List!9227 0))(
  ( (Nil!9224) (Cons!9223 (h!10079 (_ BitVec 64)) (t!15441 List!9227)) )
))
(declare-fun arrayNoDuplicates!0 (array!31339 (_ BitVec 32) List!9227) Bool)

(assert (=> b!482581 (= res!287661 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9224))))

(declare-fun b!482582 () Bool)

(declare-fun tp_is_empty!13841 () Bool)

(assert (=> b!482582 (= e!283992 tp_is_empty!13841)))

(declare-fun b!482583 () Bool)

(declare-fun res!287663 () Bool)

(assert (=> b!482583 (=> (not res!287663) (not e!283991))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!482583 (= res!287663 (validKeyInArray!0 k!1332))))

(declare-fun b!482584 () Bool)

(declare-fun e!283987 () Bool)

(declare-fun e!283990 () Bool)

(assert (=> b!482584 (= e!283987 (and e!283990 mapRes!22471))))

(declare-fun condMapEmpty!22471 () Bool)

(declare-fun mapDefault!22471 () ValueCell!6559)

