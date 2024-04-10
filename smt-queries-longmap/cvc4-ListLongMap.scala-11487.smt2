; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133724 () Bool)

(assert start!133724)

(declare-fun b_free!32087 () Bool)

(declare-fun b_next!32087 () Bool)

(assert (=> start!133724 (= b_free!32087 (not b_next!32087))))

(declare-fun tp!113465 () Bool)

(declare-fun b_and!51657 () Bool)

(assert (=> start!133724 (= tp!113465 b_and!51657)))

(declare-fun mapIsEmpty!59586 () Bool)

(declare-fun mapRes!59586 () Bool)

(assert (=> mapIsEmpty!59586 mapRes!59586))

(declare-fun b!1563575 () Bool)

(declare-fun e!871437 () Bool)

(declare-fun tp_is_empty!38807 () Bool)

(assert (=> b!1563575 (= e!871437 tp_is_empty!38807)))

(declare-fun b!1563576 () Bool)

(declare-fun res!1068943 () Bool)

(declare-fun e!871438 () Bool)

(assert (=> b!1563576 (=> (not res!1068943) (not e!871438))))

(declare-datatypes ((array!104310 0))(
  ( (array!104311 (arr!50347 (Array (_ BitVec 32) (_ BitVec 64))) (size!50897 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104310)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1563576 (= res!1068943 (not (validKeyInArray!0 (select (arr!50347 _keys!637) from!782))))))

(declare-fun res!1068940 () Bool)

(assert (=> start!133724 (=> (not res!1068940) (not e!871438))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133724 (= res!1068940 (validMask!0 mask!947))))

(assert (=> start!133724 e!871438))

(assert (=> start!133724 tp!113465))

(assert (=> start!133724 tp_is_empty!38807))

(assert (=> start!133724 true))

(declare-fun array_inv!39125 (array!104310) Bool)

(assert (=> start!133724 (array_inv!39125 _keys!637)))

(declare-datatypes ((V!59949 0))(
  ( (V!59950 (val!19487 Int)) )
))
(declare-datatypes ((ValueCell!18373 0))(
  ( (ValueCellFull!18373 (v!22239 V!59949)) (EmptyCell!18373) )
))
(declare-datatypes ((array!104312 0))(
  ( (array!104313 (arr!50348 (Array (_ BitVec 32) ValueCell!18373)) (size!50898 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104312)

(declare-fun e!871436 () Bool)

(declare-fun array_inv!39126 (array!104312) Bool)

(assert (=> start!133724 (and (array_inv!39126 _values!487) e!871436)))

(declare-fun b!1563577 () Bool)

(declare-fun e!871433 () Bool)

(assert (=> b!1563577 (= e!871433 tp_is_empty!38807)))

(declare-fun b!1563578 () Bool)

(declare-fun res!1068941 () Bool)

(assert (=> b!1563578 (=> (not res!1068941) (not e!871438))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104310 (_ BitVec 32)) Bool)

(assert (=> b!1563578 (= res!1068941 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1563579 () Bool)

(declare-fun res!1068944 () Bool)

(assert (=> b!1563579 (=> (not res!1068944) (not e!871438))))

(assert (=> b!1563579 (= res!1068944 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50897 _keys!637)) (bvslt from!782 (size!50897 _keys!637))))))

(declare-fun b!1563580 () Bool)

(declare-fun e!871435 () Bool)

(assert (=> b!1563580 (= e!871435 false)))

(declare-fun lt!671915 () Bool)

(declare-datatypes ((tuple2!25142 0))(
  ( (tuple2!25143 (_1!12582 (_ BitVec 64)) (_2!12582 V!59949)) )
))
(declare-datatypes ((List!36526 0))(
  ( (Nil!36523) (Cons!36522 (h!37968 tuple2!25142) (t!51373 List!36526)) )
))
(declare-datatypes ((ListLongMap!22577 0))(
  ( (ListLongMap!22578 (toList!11304 List!36526)) )
))
(declare-fun lt!671916 () ListLongMap!22577)

(declare-fun contains!10294 (ListLongMap!22577 (_ BitVec 64)) Bool)

(assert (=> b!1563580 (= lt!671915 (contains!10294 lt!671916 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1563581 () Bool)

(declare-fun res!1068939 () Bool)

(assert (=> b!1563581 (=> (not res!1068939) (not e!871438))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1563581 (= res!1068939 (and (= (size!50898 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50897 _keys!637) (size!50898 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1563582 () Bool)

(declare-fun res!1068942 () Bool)

(assert (=> b!1563582 (=> (not res!1068942) (not e!871438))))

(declare-datatypes ((List!36527 0))(
  ( (Nil!36524) (Cons!36523 (h!37969 (_ BitVec 64)) (t!51374 List!36527)) )
))
(declare-fun arrayNoDuplicates!0 (array!104310 (_ BitVec 32) List!36527) Bool)

(assert (=> b!1563582 (= res!1068942 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36524))))

(declare-fun b!1563583 () Bool)

(assert (=> b!1563583 (= e!871438 e!871435)))

(declare-fun res!1068945 () Bool)

(assert (=> b!1563583 (=> (not res!1068945) (not e!871435))))

(assert (=> b!1563583 (= res!1068945 (not (contains!10294 lt!671916 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!59949)

(declare-fun minValue!453 () V!59949)

(declare-fun getCurrentListMapNoExtraKeys!6687 (array!104310 array!104312 (_ BitVec 32) (_ BitVec 32) V!59949 V!59949 (_ BitVec 32) Int) ListLongMap!22577)

(assert (=> b!1563583 (= lt!671916 (getCurrentListMapNoExtraKeys!6687 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun mapNonEmpty!59586 () Bool)

(declare-fun tp!113466 () Bool)

(assert (=> mapNonEmpty!59586 (= mapRes!59586 (and tp!113466 e!871433))))

(declare-fun mapValue!59586 () ValueCell!18373)

(declare-fun mapRest!59586 () (Array (_ BitVec 32) ValueCell!18373))

(declare-fun mapKey!59586 () (_ BitVec 32))

(assert (=> mapNonEmpty!59586 (= (arr!50348 _values!487) (store mapRest!59586 mapKey!59586 mapValue!59586))))

(declare-fun b!1563584 () Bool)

(assert (=> b!1563584 (= e!871436 (and e!871437 mapRes!59586))))

(declare-fun condMapEmpty!59586 () Bool)

(declare-fun mapDefault!59586 () ValueCell!18373)

