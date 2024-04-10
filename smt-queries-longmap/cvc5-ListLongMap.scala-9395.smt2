; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111864 () Bool)

(assert start!111864)

(declare-fun b_free!30463 () Bool)

(declare-fun b_next!30463 () Bool)

(assert (=> start!111864 (= b_free!30463 (not b_next!30463))))

(declare-fun tp!106868 () Bool)

(declare-fun b_and!49021 () Bool)

(assert (=> start!111864 (= tp!106868 b_and!49021)))

(declare-fun b!1325383 () Bool)

(declare-fun res!879634 () Bool)

(declare-fun e!755572 () Bool)

(assert (=> b!1325383 (=> (not res!879634) (not e!755572))))

(declare-datatypes ((array!89474 0))(
  ( (array!89475 (arr!43210 (Array (_ BitVec 32) (_ BitVec 64))) (size!43760 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89474)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!53481 0))(
  ( (V!53482 (val!18216 Int)) )
))
(declare-fun zeroValue!1279 () V!53481)

(declare-datatypes ((ValueCell!17243 0))(
  ( (ValueCellFull!17243 (v!20849 V!53481)) (EmptyCell!17243) )
))
(declare-datatypes ((array!89476 0))(
  ( (array!89477 (arr!43211 (Array (_ BitVec 32) ValueCell!17243)) (size!43761 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89476)

(declare-fun minValue!1279 () V!53481)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23490 0))(
  ( (tuple2!23491 (_1!11756 (_ BitVec 64)) (_2!11756 V!53481)) )
))
(declare-datatypes ((List!30630 0))(
  ( (Nil!30627) (Cons!30626 (h!31835 tuple2!23490) (t!44564 List!30630)) )
))
(declare-datatypes ((ListLongMap!21147 0))(
  ( (ListLongMap!21148 (toList!10589 List!30630)) )
))
(declare-fun contains!8746 (ListLongMap!21147 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5585 (array!89474 array!89476 (_ BitVec 32) (_ BitVec 32) V!53481 V!53481 (_ BitVec 32) Int) ListLongMap!21147)

(assert (=> b!1325383 (= res!879634 (contains!8746 (getCurrentListMap!5585 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1325384 () Bool)

(declare-fun res!879635 () Bool)

(assert (=> b!1325384 (=> (not res!879635) (not e!755572))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89474 (_ BitVec 32)) Bool)

(assert (=> b!1325384 (= res!879635 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun res!879638 () Bool)

(assert (=> start!111864 (=> (not res!879638) (not e!755572))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111864 (= res!879638 (validMask!0 mask!2019))))

(assert (=> start!111864 e!755572))

(declare-fun array_inv!32615 (array!89474) Bool)

(assert (=> start!111864 (array_inv!32615 _keys!1609)))

(assert (=> start!111864 true))

(declare-fun tp_is_empty!36283 () Bool)

(assert (=> start!111864 tp_is_empty!36283))

(declare-fun e!755570 () Bool)

(declare-fun array_inv!32616 (array!89476) Bool)

(assert (=> start!111864 (and (array_inv!32616 _values!1337) e!755570)))

(assert (=> start!111864 tp!106868))

(declare-fun b!1325385 () Bool)

(assert (=> b!1325385 (= e!755572 false)))

(declare-fun lt!589779 () Bool)

(declare-fun +!4612 (ListLongMap!21147 tuple2!23490) ListLongMap!21147)

(declare-fun getCurrentListMapNoExtraKeys!6250 (array!89474 array!89476 (_ BitVec 32) (_ BitVec 32) V!53481 V!53481 (_ BitVec 32) Int) ListLongMap!21147)

(declare-fun get!21761 (ValueCell!17243 V!53481) V!53481)

(declare-fun dynLambda!3551 (Int (_ BitVec 64)) V!53481)

(assert (=> b!1325385 (= lt!589779 (contains!8746 (+!4612 (+!4612 (+!4612 (getCurrentListMapNoExtraKeys!6250 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23491 (select (arr!43210 _keys!1609) from!2000) (get!21761 (select (arr!43211 _values!1337) from!2000) (dynLambda!3551 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23491 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23491 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k!1164))))

(declare-fun b!1325386 () Bool)

(declare-fun e!755569 () Bool)

(assert (=> b!1325386 (= e!755569 tp_is_empty!36283)))

(declare-fun mapIsEmpty!56076 () Bool)

(declare-fun mapRes!56076 () Bool)

(assert (=> mapIsEmpty!56076 mapRes!56076))

(declare-fun b!1325387 () Bool)

(declare-fun res!879640 () Bool)

(assert (=> b!1325387 (=> (not res!879640) (not e!755572))))

(declare-datatypes ((List!30631 0))(
  ( (Nil!30628) (Cons!30627 (h!31836 (_ BitVec 64)) (t!44565 List!30631)) )
))
(declare-fun arrayNoDuplicates!0 (array!89474 (_ BitVec 32) List!30631) Bool)

(assert (=> b!1325387 (= res!879640 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30628))))

(declare-fun b!1325388 () Bool)

(declare-fun res!879636 () Bool)

(assert (=> b!1325388 (=> (not res!879636) (not e!755572))))

(assert (=> b!1325388 (= res!879636 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43760 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1325389 () Bool)

(declare-fun res!879637 () Bool)

(assert (=> b!1325389 (=> (not res!879637) (not e!755572))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1325389 (= res!879637 (validKeyInArray!0 (select (arr!43210 _keys!1609) from!2000)))))

(declare-fun b!1325390 () Bool)

(declare-fun res!879639 () Bool)

(assert (=> b!1325390 (=> (not res!879639) (not e!755572))))

(assert (=> b!1325390 (= res!879639 (not (= (select (arr!43210 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1325391 () Bool)

(declare-fun res!879633 () Bool)

(assert (=> b!1325391 (=> (not res!879633) (not e!755572))))

(assert (=> b!1325391 (= res!879633 (and (= (size!43761 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43760 _keys!1609) (size!43761 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56076 () Bool)

(declare-fun tp!106869 () Bool)

(declare-fun e!755571 () Bool)

(assert (=> mapNonEmpty!56076 (= mapRes!56076 (and tp!106869 e!755571))))

(declare-fun mapRest!56076 () (Array (_ BitVec 32) ValueCell!17243))

(declare-fun mapKey!56076 () (_ BitVec 32))

(declare-fun mapValue!56076 () ValueCell!17243)

(assert (=> mapNonEmpty!56076 (= (arr!43211 _values!1337) (store mapRest!56076 mapKey!56076 mapValue!56076))))

(declare-fun b!1325392 () Bool)

(assert (=> b!1325392 (= e!755570 (and e!755569 mapRes!56076))))

(declare-fun condMapEmpty!56076 () Bool)

(declare-fun mapDefault!56076 () ValueCell!17243)

