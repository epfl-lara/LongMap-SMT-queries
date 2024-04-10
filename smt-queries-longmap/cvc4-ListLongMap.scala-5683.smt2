; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73886 () Bool)

(assert start!73886)

(declare-fun b_free!14801 () Bool)

(declare-fun b_next!14801 () Bool)

(assert (=> start!73886 (= b_free!14801 (not b_next!14801))))

(declare-fun tp!51906 () Bool)

(declare-fun b_and!24553 () Bool)

(assert (=> start!73886 (= tp!51906 b_and!24553)))

(declare-fun b!868071 () Bool)

(declare-fun e!483510 () Bool)

(assert (=> b!868071 (= e!483510 (not true))))

(declare-datatypes ((V!27629 0))(
  ( (V!27630 (val!8516 Int)) )
))
(declare-fun v!557 () V!27629)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!50032 0))(
  ( (array!50033 (arr!24047 (Array (_ BitVec 32) (_ BitVec 64))) (size!24487 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50032)

(declare-datatypes ((ValueCell!8029 0))(
  ( (ValueCellFull!8029 (v!10941 V!27629)) (EmptyCell!8029) )
))
(declare-datatypes ((array!50034 0))(
  ( (array!50035 (arr!24048 (Array (_ BitVec 32) ValueCell!8029)) (size!24488 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50034)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!27629)

(declare-fun zeroValue!654 () V!27629)

(declare-fun lt!394348 () array!50034)

(declare-datatypes ((tuple2!11302 0))(
  ( (tuple2!11303 (_1!5662 (_ BitVec 64)) (_2!5662 V!27629)) )
))
(declare-datatypes ((List!17100 0))(
  ( (Nil!17097) (Cons!17096 (h!18227 tuple2!11302) (t!24137 List!17100)) )
))
(declare-datatypes ((ListLongMap!10071 0))(
  ( (ListLongMap!10072 (toList!5051 List!17100)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3020 (array!50032 array!50034 (_ BitVec 32) (_ BitVec 32) V!27629 V!27629 (_ BitVec 32) Int) ListLongMap!10071)

(declare-fun +!2395 (ListLongMap!10071 tuple2!11302) ListLongMap!10071)

(assert (=> b!868071 (= (getCurrentListMapNoExtraKeys!3020 _keys!868 lt!394348 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2395 (getCurrentListMapNoExtraKeys!3020 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11303 k!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29788 0))(
  ( (Unit!29789) )
))
(declare-fun lt!394346 () Unit!29788)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!589 (array!50032 array!50034 (_ BitVec 32) (_ BitVec 32) V!27629 V!27629 (_ BitVec 32) (_ BitVec 64) V!27629 (_ BitVec 32) Int) Unit!29788)

(assert (=> b!868071 (= lt!394346 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!589 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!589834 () Bool)

(declare-fun e!483506 () Bool)

(assert (=> start!73886 (=> (not res!589834) (not e!483506))))

(assert (=> start!73886 (= res!589834 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24487 _keys!868))))))

(assert (=> start!73886 e!483506))

(declare-fun tp_is_empty!16937 () Bool)

(assert (=> start!73886 tp_is_empty!16937))

(assert (=> start!73886 true))

(assert (=> start!73886 tp!51906))

(declare-fun array_inv!19002 (array!50032) Bool)

(assert (=> start!73886 (array_inv!19002 _keys!868)))

(declare-fun e!483508 () Bool)

(declare-fun array_inv!19003 (array!50034) Bool)

(assert (=> start!73886 (and (array_inv!19003 _values!688) e!483508)))

(declare-fun b!868072 () Bool)

(declare-fun e!483509 () Bool)

(declare-fun mapRes!27005 () Bool)

(assert (=> b!868072 (= e!483508 (and e!483509 mapRes!27005))))

(declare-fun condMapEmpty!27005 () Bool)

(declare-fun mapDefault!27005 () ValueCell!8029)

