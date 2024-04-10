; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74150 () Bool)

(assert start!74150)

(declare-fun b!872278 () Bool)

(declare-fun e!485725 () Bool)

(declare-fun tp_is_empty!17189 () Bool)

(assert (=> b!872278 (= e!485725 tp_is_empty!17189)))

(declare-fun b!872279 () Bool)

(declare-fun res!592864 () Bool)

(declare-fun e!485724 () Bool)

(assert (=> b!872279 (=> (not res!592864) (not e!485724))))

(declare-datatypes ((array!50512 0))(
  ( (array!50513 (arr!24286 (Array (_ BitVec 32) (_ BitVec 64))) (size!24726 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50512)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50512 (_ BitVec 32)) Bool)

(assert (=> b!872279 (= res!592864 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!592865 () Bool)

(assert (=> start!74150 (=> (not res!592865) (not e!485724))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74150 (= res!592865 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24726 _keys!868))))))

(assert (=> start!74150 e!485724))

(assert (=> start!74150 true))

(declare-fun array_inv!19176 (array!50512) Bool)

(assert (=> start!74150 (array_inv!19176 _keys!868)))

(declare-datatypes ((V!27965 0))(
  ( (V!27966 (val!8642 Int)) )
))
(declare-datatypes ((ValueCell!8155 0))(
  ( (ValueCellFull!8155 (v!11067 V!27965)) (EmptyCell!8155) )
))
(declare-datatypes ((array!50514 0))(
  ( (array!50515 (arr!24287 (Array (_ BitVec 32) ValueCell!8155)) (size!24727 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50514)

(declare-fun e!485722 () Bool)

(declare-fun array_inv!19177 (array!50514) Bool)

(assert (=> start!74150 (and (array_inv!19177 _values!688) e!485722)))

(declare-fun b!872280 () Bool)

(declare-fun e!485721 () Bool)

(assert (=> b!872280 (= e!485721 tp_is_empty!17189)))

(declare-fun mapNonEmpty!27386 () Bool)

(declare-fun mapRes!27386 () Bool)

(declare-fun tp!52585 () Bool)

(assert (=> mapNonEmpty!27386 (= mapRes!27386 (and tp!52585 e!485725))))

(declare-fun mapKey!27386 () (_ BitVec 32))

(declare-fun mapValue!27386 () ValueCell!8155)

(declare-fun mapRest!27386 () (Array (_ BitVec 32) ValueCell!8155))

(assert (=> mapNonEmpty!27386 (= (arr!24287 _values!688) (store mapRest!27386 mapKey!27386 mapValue!27386))))

(declare-fun b!872281 () Bool)

(declare-fun res!592862 () Bool)

(assert (=> b!872281 (=> (not res!592862) (not e!485724))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!872281 (= res!592862 (validMask!0 mask!1196))))

(declare-fun b!872282 () Bool)

(assert (=> b!872282 (= e!485722 (and e!485721 mapRes!27386))))

(declare-fun condMapEmpty!27386 () Bool)

(declare-fun mapDefault!27386 () ValueCell!8155)

