; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43254 () Bool)

(assert start!43254)

(declare-fun b_free!12121 () Bool)

(declare-fun b_next!12121 () Bool)

(assert (=> start!43254 (= b_free!12121 (not b_next!12121))))

(declare-fun tp!42634 () Bool)

(declare-fun b_and!20873 () Bool)

(assert (=> start!43254 (= tp!42634 b_and!20873)))

(declare-fun b!479237 () Bool)

(declare-fun res!285874 () Bool)

(declare-fun e!281922 () Bool)

(assert (=> b!479237 (=> (not res!285874) (not e!281922))))

(declare-datatypes ((array!30939 0))(
  ( (array!30940 (arr!14876 (Array (_ BitVec 32) (_ BitVec 64))) (size!15234 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30939)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30939 (_ BitVec 32)) Bool)

(assert (=> b!479237 (= res!285874 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!479238 () Bool)

(assert (=> b!479238 (= e!281922 false)))

(declare-fun k!1332 () (_ BitVec 64))

(declare-datatypes ((V!19249 0))(
  ( (V!19250 (val!6864 Int)) )
))
(declare-fun minValue!1458 () V!19249)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun lt!217834 () Bool)

(declare-datatypes ((ValueCell!6455 0))(
  ( (ValueCellFull!6455 (v!9153 V!19249)) (EmptyCell!6455) )
))
(declare-datatypes ((array!30941 0))(
  ( (array!30942 (arr!14877 (Array (_ BitVec 32) ValueCell!6455)) (size!15235 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30941)

(declare-fun defaultEntry!1519 () Int)

(declare-fun zeroValue!1458 () V!19249)

(declare-datatypes ((tuple2!9008 0))(
  ( (tuple2!9009 (_1!4515 (_ BitVec 64)) (_2!4515 V!19249)) )
))
(declare-datatypes ((List!9087 0))(
  ( (Nil!9084) (Cons!9083 (h!9939 tuple2!9008) (t!15293 List!9087)) )
))
(declare-datatypes ((ListLongMap!7921 0))(
  ( (ListLongMap!7922 (toList!3976 List!9087)) )
))
(declare-fun contains!2586 (ListLongMap!7921 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2295 (array!30939 array!30941 (_ BitVec 32) (_ BitVec 32) V!19249 V!19249 (_ BitVec 32) Int) ListLongMap!7921)

(assert (=> b!479238 (= lt!217834 (contains!2586 (getCurrentListMap!2295 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k!1332))))

(declare-fun b!479239 () Bool)

(declare-fun res!285876 () Bool)

(assert (=> b!479239 (=> (not res!285876) (not e!281922))))

(declare-datatypes ((List!9088 0))(
  ( (Nil!9085) (Cons!9084 (h!9940 (_ BitVec 64)) (t!15294 List!9088)) )
))
(declare-fun arrayNoDuplicates!0 (array!30939 (_ BitVec 32) List!9088) Bool)

(assert (=> b!479239 (= res!285876 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9085))))

(declare-fun b!479240 () Bool)

(declare-fun e!281921 () Bool)

(declare-fun tp_is_empty!13633 () Bool)

(assert (=> b!479240 (= e!281921 tp_is_empty!13633)))

(declare-fun b!479241 () Bool)

(declare-fun e!281925 () Bool)

(declare-fun e!281923 () Bool)

(declare-fun mapRes!22147 () Bool)

(assert (=> b!479241 (= e!281925 (and e!281923 mapRes!22147))))

(declare-fun condMapEmpty!22147 () Bool)

(declare-fun mapDefault!22147 () ValueCell!6455)

