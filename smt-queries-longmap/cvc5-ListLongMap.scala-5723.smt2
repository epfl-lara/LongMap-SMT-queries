; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74134 () Bool)

(assert start!74134)

(declare-fun mapNonEmpty!27362 () Bool)

(declare-fun mapRes!27362 () Bool)

(declare-fun tp!52561 () Bool)

(declare-fun e!485605 () Bool)

(assert (=> mapNonEmpty!27362 (= mapRes!27362 (and tp!52561 e!485605))))

(declare-fun mapKey!27362 () (_ BitVec 32))

(declare-datatypes ((V!27945 0))(
  ( (V!27946 (val!8634 Int)) )
))
(declare-datatypes ((ValueCell!8147 0))(
  ( (ValueCellFull!8147 (v!11059 V!27945)) (EmptyCell!8147) )
))
(declare-fun mapValue!27362 () ValueCell!8147)

(declare-datatypes ((array!50480 0))(
  ( (array!50481 (arr!24270 (Array (_ BitVec 32) ValueCell!8147)) (size!24710 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50480)

(declare-fun mapRest!27362 () (Array (_ BitVec 32) ValueCell!8147))

(assert (=> mapNonEmpty!27362 (= (arr!24270 _values!688) (store mapRest!27362 mapKey!27362 mapValue!27362))))

(declare-fun b!872110 () Bool)

(declare-fun res!592769 () Bool)

(declare-fun e!485602 () Bool)

(assert (=> b!872110 (=> (not res!592769) (not e!485602))))

(declare-datatypes ((array!50482 0))(
  ( (array!50483 (arr!24271 (Array (_ BitVec 32) (_ BitVec 64))) (size!24711 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50482)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50482 (_ BitVec 32)) Bool)

(assert (=> b!872110 (= res!592769 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!872111 () Bool)

(declare-fun res!592766 () Bool)

(assert (=> b!872111 (=> (not res!592766) (not e!485602))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!872111 (= res!592766 (and (= (size!24710 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24711 _keys!868) (size!24710 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!872112 () Bool)

(declare-fun tp_is_empty!17173 () Bool)

(assert (=> b!872112 (= e!485605 tp_is_empty!17173)))

(declare-fun b!872113 () Bool)

(declare-fun e!485604 () Bool)

(assert (=> b!872113 (= e!485604 tp_is_empty!17173)))

(declare-fun b!872114 () Bool)

(declare-fun res!592767 () Bool)

(assert (=> b!872114 (=> (not res!592767) (not e!485602))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!872114 (= res!592767 (validMask!0 mask!1196))))

(declare-fun b!872115 () Bool)

(assert (=> b!872115 (= e!485602 false)))

(declare-fun lt!395575 () Bool)

(declare-datatypes ((List!17252 0))(
  ( (Nil!17249) (Cons!17248 (h!18379 (_ BitVec 64)) (t!24289 List!17252)) )
))
(declare-fun arrayNoDuplicates!0 (array!50482 (_ BitVec 32) List!17252) Bool)

(assert (=> b!872115 (= lt!395575 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17249))))

(declare-fun res!592768 () Bool)

(assert (=> start!74134 (=> (not res!592768) (not e!485602))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74134 (= res!592768 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24711 _keys!868))))))

(assert (=> start!74134 e!485602))

(assert (=> start!74134 true))

(declare-fun array_inv!19162 (array!50482) Bool)

(assert (=> start!74134 (array_inv!19162 _keys!868)))

(declare-fun e!485601 () Bool)

(declare-fun array_inv!19163 (array!50480) Bool)

(assert (=> start!74134 (and (array_inv!19163 _values!688) e!485601)))

(declare-fun mapIsEmpty!27362 () Bool)

(assert (=> mapIsEmpty!27362 mapRes!27362))

(declare-fun b!872116 () Bool)

(assert (=> b!872116 (= e!485601 (and e!485604 mapRes!27362))))

(declare-fun condMapEmpty!27362 () Bool)

(declare-fun mapDefault!27362 () ValueCell!8147)

