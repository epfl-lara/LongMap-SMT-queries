; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97398 () Bool)

(assert start!97398)

(declare-fun b_free!23369 () Bool)

(declare-fun b_next!23369 () Bool)

(assert (=> start!97398 (= b_free!23369 (not b_next!23369))))

(declare-fun tp!82406 () Bool)

(declare-fun b_and!37573 () Bool)

(assert (=> start!97398 (= tp!82406 b_and!37573)))

(declare-fun b!1110619 () Bool)

(declare-fun res!741157 () Bool)

(declare-fun e!633377 () Bool)

(assert (=> b!1110619 (=> (not res!741157) (not e!633377))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1110619 (= res!741157 (validKeyInArray!0 k!934))))

(declare-fun b!1110620 () Bool)

(declare-fun e!633381 () Bool)

(declare-fun tp_is_empty!27629 () Bool)

(assert (=> b!1110620 (= e!633381 tp_is_empty!27629)))

(declare-fun b!1110621 () Bool)

(declare-datatypes ((V!41965 0))(
  ( (V!41966 (val!13871 Int)) )
))
(declare-datatypes ((tuple2!17544 0))(
  ( (tuple2!17545 (_1!8783 (_ BitVec 64)) (_2!8783 V!41965)) )
))
(declare-datatypes ((List!24228 0))(
  ( (Nil!24225) (Cons!24224 (h!25433 tuple2!17544) (t!34643 List!24228)) )
))
(declare-datatypes ((ListLongMap!15513 0))(
  ( (ListLongMap!15514 (toList!7772 List!24228)) )
))
(declare-fun call!46804 () ListLongMap!15513)

(declare-fun call!46803 () ListLongMap!15513)

(declare-fun e!633380 () Bool)

(declare-fun -!1043 (ListLongMap!15513 (_ BitVec 64)) ListLongMap!15513)

(assert (=> b!1110621 (= e!633380 (= call!46804 (-!1043 call!46803 k!934)))))

(declare-fun b!1110622 () Bool)

(assert (=> b!1110622 (= e!633380 (= call!46804 call!46803))))

(declare-fun b!1110623 () Bool)

(declare-fun res!741156 () Bool)

(assert (=> b!1110623 (=> (not res!741156) (not e!633377))))

(declare-datatypes ((array!72175 0))(
  ( (array!72176 (arr!34740 (Array (_ BitVec 32) (_ BitVec 64))) (size!35276 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72175)

(declare-datatypes ((List!24229 0))(
  ( (Nil!24226) (Cons!24225 (h!25434 (_ BitVec 64)) (t!34644 List!24229)) )
))
(declare-fun arrayNoDuplicates!0 (array!72175 (_ BitVec 32) List!24229) Bool)

(assert (=> b!1110623 (= res!741156 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24226))))

(declare-fun b!1110624 () Bool)

(declare-fun res!741159 () Bool)

(assert (=> b!1110624 (=> (not res!741159) (not e!633377))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1110624 (= res!741159 (= (select (arr!34740 _keys!1208) i!673) k!934))))

(declare-fun b!1110625 () Bool)

(declare-fun e!633379 () Bool)

(assert (=> b!1110625 (= e!633377 e!633379)))

(declare-fun res!741162 () Bool)

(assert (=> b!1110625 (=> (not res!741162) (not e!633379))))

(declare-fun lt!496197 () array!72175)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72175 (_ BitVec 32)) Bool)

(assert (=> b!1110625 (= res!741162 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496197 mask!1564))))

(assert (=> b!1110625 (= lt!496197 (array!72176 (store (arr!34740 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35276 _keys!1208)))))

(declare-fun b!1110626 () Bool)

(declare-fun res!741158 () Bool)

(assert (=> b!1110626 (=> (not res!741158) (not e!633377))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13105 0))(
  ( (ValueCellFull!13105 (v!16504 V!41965)) (EmptyCell!13105) )
))
(declare-datatypes ((array!72177 0))(
  ( (array!72178 (arr!34741 (Array (_ BitVec 32) ValueCell!13105)) (size!35277 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72177)

(assert (=> b!1110626 (= res!741158 (and (= (size!35277 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35276 _keys!1208) (size!35277 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1110627 () Bool)

(declare-fun res!741154 () Bool)

(assert (=> b!1110627 (=> (not res!741154) (not e!633377))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1110627 (= res!741154 (validMask!0 mask!1564))))

(declare-fun b!1110628 () Bool)

(declare-fun e!633376 () Bool)

(declare-fun mapRes!43261 () Bool)

(assert (=> b!1110628 (= e!633376 (and e!633381 mapRes!43261))))

(declare-fun condMapEmpty!43261 () Bool)

(declare-fun mapDefault!43261 () ValueCell!13105)

