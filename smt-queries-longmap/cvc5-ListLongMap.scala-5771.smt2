; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74528 () Bool)

(assert start!74528)

(declare-fun b_free!15217 () Bool)

(declare-fun b_next!15217 () Bool)

(assert (=> start!74528 (= b_free!15217 (not b_next!15217))))

(declare-fun tp!53332 () Bool)

(declare-fun b_and!25093 () Bool)

(assert (=> start!74528 (= tp!53332 b_and!25093)))

(declare-fun b!877916 () Bool)

(declare-fun res!596404 () Bool)

(declare-fun e!488662 () Bool)

(assert (=> b!877916 (=> (not res!596404) (not e!488662))))

(declare-datatypes ((array!51050 0))(
  ( (array!51051 (arr!24551 (Array (_ BitVec 32) (_ BitVec 64))) (size!24991 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51050)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51050 (_ BitVec 32)) Bool)

(assert (=> b!877916 (= res!596404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!27807 () Bool)

(declare-fun mapRes!27807 () Bool)

(declare-fun tp!53333 () Bool)

(declare-fun e!488661 () Bool)

(assert (=> mapNonEmpty!27807 (= mapRes!27807 (and tp!53333 e!488661))))

(declare-datatypes ((V!28329 0))(
  ( (V!28330 (val!8778 Int)) )
))
(declare-datatypes ((ValueCell!8291 0))(
  ( (ValueCellFull!8291 (v!11218 V!28329)) (EmptyCell!8291) )
))
(declare-fun mapRest!27807 () (Array (_ BitVec 32) ValueCell!8291))

(declare-fun mapKey!27807 () (_ BitVec 32))

(declare-fun mapValue!27807 () ValueCell!8291)

(declare-datatypes ((array!51052 0))(
  ( (array!51053 (arr!24552 (Array (_ BitVec 32) ValueCell!8291)) (size!24992 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51052)

(assert (=> mapNonEmpty!27807 (= (arr!24552 _values!688) (store mapRest!27807 mapKey!27807 mapValue!27807))))

(declare-fun b!877917 () Bool)

(declare-fun res!596403 () Bool)

(assert (=> b!877917 (=> (not res!596403) (not e!488662))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!877917 (= res!596403 (and (= (select (arr!24551 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!877918 () Bool)

(declare-fun e!488665 () Bool)

(declare-fun tp_is_empty!17461 () Bool)

(assert (=> b!877918 (= e!488665 tp_is_empty!17461)))

(declare-fun mapIsEmpty!27807 () Bool)

(assert (=> mapIsEmpty!27807 mapRes!27807))

(declare-fun b!877919 () Bool)

(declare-fun res!596408 () Bool)

(assert (=> b!877919 (=> (not res!596408) (not e!488662))))

(declare-datatypes ((List!17423 0))(
  ( (Nil!17420) (Cons!17419 (h!18550 (_ BitVec 64)) (t!24512 List!17423)) )
))
(declare-fun arrayNoDuplicates!0 (array!51050 (_ BitVec 32) List!17423) Bool)

(assert (=> b!877919 (= res!596408 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17420))))

(declare-fun b!877921 () Bool)

(declare-fun e!488664 () Bool)

(assert (=> b!877921 (= e!488664 (and e!488665 mapRes!27807))))

(declare-fun condMapEmpty!27807 () Bool)

(declare-fun mapDefault!27807 () ValueCell!8291)

