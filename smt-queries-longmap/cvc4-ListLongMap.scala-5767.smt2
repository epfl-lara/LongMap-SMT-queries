; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74508 () Bool)

(assert start!74508)

(declare-fun b_free!15197 () Bool)

(declare-fun b_next!15197 () Bool)

(assert (=> start!74508 (= b_free!15197 (not b_next!15197))))

(declare-fun tp!53272 () Bool)

(declare-fun b_and!25073 () Bool)

(assert (=> start!74508 (= tp!53272 b_and!25073)))

(declare-fun res!596167 () Bool)

(declare-fun e!488515 () Bool)

(assert (=> start!74508 (=> (not res!596167) (not e!488515))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!51010 0))(
  ( (array!51011 (arr!24531 (Array (_ BitVec 32) (_ BitVec 64))) (size!24971 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51010)

(assert (=> start!74508 (= res!596167 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24971 _keys!868))))))

(assert (=> start!74508 e!488515))

(declare-fun tp_is_empty!17441 () Bool)

(assert (=> start!74508 tp_is_empty!17441))

(assert (=> start!74508 true))

(assert (=> start!74508 tp!53272))

(declare-fun array_inv!19338 (array!51010) Bool)

(assert (=> start!74508 (array_inv!19338 _keys!868)))

(declare-datatypes ((V!28301 0))(
  ( (V!28302 (val!8768 Int)) )
))
(declare-datatypes ((ValueCell!8281 0))(
  ( (ValueCellFull!8281 (v!11208 V!28301)) (EmptyCell!8281) )
))
(declare-datatypes ((array!51012 0))(
  ( (array!51013 (arr!24532 (Array (_ BitVec 32) ValueCell!8281)) (size!24972 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51012)

(declare-fun e!488514 () Bool)

(declare-fun array_inv!19339 (array!51012) Bool)

(assert (=> start!74508 (and (array_inv!19339 _values!688) e!488514)))

(declare-fun b!877586 () Bool)

(declare-fun res!596163 () Bool)

(assert (=> b!877586 (=> (not res!596163) (not e!488515))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!877586 (= res!596163 (and (= (select (arr!24531 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!27777 () Bool)

(declare-fun mapRes!27777 () Bool)

(declare-fun tp!53273 () Bool)

(declare-fun e!488512 () Bool)

(assert (=> mapNonEmpty!27777 (= mapRes!27777 (and tp!53273 e!488512))))

(declare-fun mapValue!27777 () ValueCell!8281)

(declare-fun mapRest!27777 () (Array (_ BitVec 32) ValueCell!8281))

(declare-fun mapKey!27777 () (_ BitVec 32))

(assert (=> mapNonEmpty!27777 (= (arr!24532 _values!688) (store mapRest!27777 mapKey!27777 mapValue!27777))))

(declare-fun mapIsEmpty!27777 () Bool)

(assert (=> mapIsEmpty!27777 mapRes!27777))

(declare-fun b!877587 () Bool)

(assert (=> b!877587 (= e!488515 false)))

(declare-fun v!557 () V!28301)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!11594 0))(
  ( (tuple2!11595 (_1!5808 (_ BitVec 64)) (_2!5808 V!28301)) )
))
(declare-datatypes ((List!17410 0))(
  ( (Nil!17407) (Cons!17406 (h!18537 tuple2!11594) (t!24499 List!17410)) )
))
(declare-datatypes ((ListLongMap!10363 0))(
  ( (ListLongMap!10364 (toList!5197 List!17410)) )
))
(declare-fun lt!397100 () ListLongMap!10363)

(declare-fun minValue!654 () V!28301)

(declare-fun zeroValue!654 () V!28301)

(declare-fun getCurrentListMapNoExtraKeys!3164 (array!51010 array!51012 (_ BitVec 32) (_ BitVec 32) V!28301 V!28301 (_ BitVec 32) Int) ListLongMap!10363)

(assert (=> b!877587 (= lt!397100 (getCurrentListMapNoExtraKeys!3164 _keys!868 (array!51013 (store (arr!24532 _values!688) i!612 (ValueCellFull!8281 v!557)) (size!24972 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!397101 () ListLongMap!10363)

(assert (=> b!877587 (= lt!397101 (getCurrentListMapNoExtraKeys!3164 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!877588 () Bool)

(declare-fun res!596166 () Bool)

(assert (=> b!877588 (=> (not res!596166) (not e!488515))))

(assert (=> b!877588 (= res!596166 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24971 _keys!868))))))

(declare-fun b!877589 () Bool)

(declare-fun res!596162 () Bool)

(assert (=> b!877589 (=> (not res!596162) (not e!488515))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51010 (_ BitVec 32)) Bool)

(assert (=> b!877589 (= res!596162 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!877590 () Bool)

(declare-fun res!596168 () Bool)

(assert (=> b!877590 (=> (not res!596168) (not e!488515))))

(assert (=> b!877590 (= res!596168 (and (= (size!24972 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24971 _keys!868) (size!24972 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!877591 () Bool)

(declare-fun e!488513 () Bool)

(assert (=> b!877591 (= e!488513 tp_is_empty!17441)))

(declare-fun b!877592 () Bool)

(assert (=> b!877592 (= e!488514 (and e!488513 mapRes!27777))))

(declare-fun condMapEmpty!27777 () Bool)

(declare-fun mapDefault!27777 () ValueCell!8281)

