; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74498 () Bool)

(assert start!74498)

(declare-fun b_free!15187 () Bool)

(declare-fun b_next!15187 () Bool)

(assert (=> start!74498 (= b_free!15187 (not b_next!15187))))

(declare-fun tp!53243 () Bool)

(declare-fun b_and!25063 () Bool)

(assert (=> start!74498 (= tp!53243 b_and!25063)))

(declare-fun b!877421 () Bool)

(declare-fun res!596047 () Bool)

(declare-fun e!488437 () Bool)

(assert (=> b!877421 (=> (not res!596047) (not e!488437))))

(declare-datatypes ((array!50990 0))(
  ( (array!50991 (arr!24521 (Array (_ BitVec 32) (_ BitVec 64))) (size!24961 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50990)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50990 (_ BitVec 32)) Bool)

(assert (=> b!877421 (= res!596047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!877422 () Bool)

(declare-fun res!596042 () Bool)

(assert (=> b!877422 (=> (not res!596042) (not e!488437))))

(declare-datatypes ((List!17402 0))(
  ( (Nil!17399) (Cons!17398 (h!18529 (_ BitVec 64)) (t!24491 List!17402)) )
))
(declare-fun arrayNoDuplicates!0 (array!50990 (_ BitVec 32) List!17402) Bool)

(assert (=> b!877422 (= res!596042 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17399))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun b!877423 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!877423 (= e!488437 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612) (or (bvslt (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 from!1053) (size!24961 _keys!868)))))))

(declare-datatypes ((V!28289 0))(
  ( (V!28290 (val!8763 Int)) )
))
(declare-fun v!557 () V!28289)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11586 0))(
  ( (tuple2!11587 (_1!5804 (_ BitVec 64)) (_2!5804 V!28289)) )
))
(declare-datatypes ((List!17403 0))(
  ( (Nil!17400) (Cons!17399 (h!18530 tuple2!11586) (t!24492 List!17403)) )
))
(declare-datatypes ((ListLongMap!10355 0))(
  ( (ListLongMap!10356 (toList!5193 List!17403)) )
))
(declare-fun lt!397071 () ListLongMap!10355)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!8276 0))(
  ( (ValueCellFull!8276 (v!11203 V!28289)) (EmptyCell!8276) )
))
(declare-datatypes ((array!50992 0))(
  ( (array!50993 (arr!24522 (Array (_ BitVec 32) ValueCell!8276)) (size!24962 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50992)

(declare-fun minValue!654 () V!28289)

(declare-fun zeroValue!654 () V!28289)

(declare-fun getCurrentListMapNoExtraKeys!3160 (array!50990 array!50992 (_ BitVec 32) (_ BitVec 32) V!28289 V!28289 (_ BitVec 32) Int) ListLongMap!10355)

(assert (=> b!877423 (= lt!397071 (getCurrentListMapNoExtraKeys!3160 _keys!868 (array!50993 (store (arr!24522 _values!688) i!612 (ValueCellFull!8276 v!557)) (size!24962 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!397070 () ListLongMap!10355)

(assert (=> b!877423 (= lt!397070 (getCurrentListMapNoExtraKeys!3160 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!27762 () Bool)

(declare-fun mapRes!27762 () Bool)

(declare-fun tp!53242 () Bool)

(declare-fun e!488438 () Bool)

(assert (=> mapNonEmpty!27762 (= mapRes!27762 (and tp!53242 e!488438))))

(declare-fun mapRest!27762 () (Array (_ BitVec 32) ValueCell!8276))

(declare-fun mapKey!27762 () (_ BitVec 32))

(declare-fun mapValue!27762 () ValueCell!8276)

(assert (=> mapNonEmpty!27762 (= (arr!24522 _values!688) (store mapRest!27762 mapKey!27762 mapValue!27762))))

(declare-fun b!877424 () Bool)

(declare-fun res!596043 () Bool)

(assert (=> b!877424 (=> (not res!596043) (not e!488437))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!877424 (= res!596043 (validMask!0 mask!1196))))

(declare-fun b!877425 () Bool)

(declare-fun res!596044 () Bool)

(assert (=> b!877425 (=> (not res!596044) (not e!488437))))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!877425 (= res!596044 (and (= (select (arr!24521 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun res!596041 () Bool)

(assert (=> start!74498 (=> (not res!596041) (not e!488437))))

(assert (=> start!74498 (= res!596041 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24961 _keys!868))))))

(assert (=> start!74498 e!488437))

(declare-fun tp_is_empty!17431 () Bool)

(assert (=> start!74498 tp_is_empty!17431))

(assert (=> start!74498 true))

(assert (=> start!74498 tp!53243))

(declare-fun array_inv!19328 (array!50990) Bool)

(assert (=> start!74498 (array_inv!19328 _keys!868)))

(declare-fun e!488440 () Bool)

(declare-fun array_inv!19329 (array!50992) Bool)

(assert (=> start!74498 (and (array_inv!19329 _values!688) e!488440)))

(declare-fun b!877426 () Bool)

(declare-fun res!596048 () Bool)

(assert (=> b!877426 (=> (not res!596048) (not e!488437))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!877426 (= res!596048 (validKeyInArray!0 k!854))))

(declare-fun b!877427 () Bool)

(declare-fun res!596045 () Bool)

(assert (=> b!877427 (=> (not res!596045) (not e!488437))))

(assert (=> b!877427 (= res!596045 (and (= (size!24962 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24961 _keys!868) (size!24962 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!877428 () Bool)

(assert (=> b!877428 (= e!488438 tp_is_empty!17431)))

(declare-fun b!877429 () Bool)

(declare-fun res!596046 () Bool)

(assert (=> b!877429 (=> (not res!596046) (not e!488437))))

(assert (=> b!877429 (= res!596046 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24961 _keys!868))))))

(declare-fun mapIsEmpty!27762 () Bool)

(assert (=> mapIsEmpty!27762 mapRes!27762))

(declare-fun b!877430 () Bool)

(declare-fun e!488436 () Bool)

(assert (=> b!877430 (= e!488436 tp_is_empty!17431)))

(declare-fun b!877431 () Bool)

(assert (=> b!877431 (= e!488440 (and e!488436 mapRes!27762))))

(declare-fun condMapEmpty!27762 () Bool)

(declare-fun mapDefault!27762 () ValueCell!8276)

