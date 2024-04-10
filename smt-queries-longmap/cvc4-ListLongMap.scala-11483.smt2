; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133700 () Bool)

(assert start!133700)

(declare-fun b_free!32063 () Bool)

(declare-fun b_next!32063 () Bool)

(assert (=> start!133700 (= b_free!32063 (not b_next!32063))))

(declare-fun tp!113394 () Bool)

(declare-fun b_and!51633 () Bool)

(assert (=> start!133700 (= tp!113394 b_and!51633)))

(declare-fun b!1563215 () Bool)

(declare-fun res!1068690 () Bool)

(declare-fun e!871218 () Bool)

(assert (=> b!1563215 (=> (not res!1068690) (not e!871218))))

(declare-datatypes ((array!104264 0))(
  ( (array!104265 (arr!50324 (Array (_ BitVec 32) (_ BitVec 64))) (size!50874 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104264)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104264 (_ BitVec 32)) Bool)

(assert (=> b!1563215 (= res!1068690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1563216 () Bool)

(declare-fun e!871219 () Bool)

(declare-fun tp_is_empty!38783 () Bool)

(assert (=> b!1563216 (= e!871219 tp_is_empty!38783)))

(declare-fun b!1563217 () Bool)

(declare-fun e!871221 () Bool)

(assert (=> b!1563217 (= e!871221 false)))

(declare-fun lt!671844 () Bool)

(declare-datatypes ((V!59917 0))(
  ( (V!59918 (val!19475 Int)) )
))
(declare-datatypes ((tuple2!25128 0))(
  ( (tuple2!25129 (_1!12575 (_ BitVec 64)) (_2!12575 V!59917)) )
))
(declare-datatypes ((List!36513 0))(
  ( (Nil!36510) (Cons!36509 (h!37955 tuple2!25128) (t!51360 List!36513)) )
))
(declare-datatypes ((ListLongMap!22563 0))(
  ( (ListLongMap!22564 (toList!11297 List!36513)) )
))
(declare-fun lt!671843 () ListLongMap!22563)

(declare-fun contains!10287 (ListLongMap!22563 (_ BitVec 64)) Bool)

(assert (=> b!1563217 (= lt!671844 (contains!10287 lt!671843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1563218 () Bool)

(declare-fun res!1068692 () Bool)

(assert (=> b!1563218 (=> (not res!1068692) (not e!871218))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18361 0))(
  ( (ValueCellFull!18361 (v!22227 V!59917)) (EmptyCell!18361) )
))
(declare-datatypes ((array!104266 0))(
  ( (array!104267 (arr!50325 (Array (_ BitVec 32) ValueCell!18361)) (size!50875 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104266)

(assert (=> b!1563218 (= res!1068692 (and (= (size!50875 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50874 _keys!637) (size!50875 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!59550 () Bool)

(declare-fun mapRes!59550 () Bool)

(declare-fun tp!113393 () Bool)

(assert (=> mapNonEmpty!59550 (= mapRes!59550 (and tp!113393 e!871219))))

(declare-fun mapValue!59550 () ValueCell!18361)

(declare-fun mapKey!59550 () (_ BitVec 32))

(declare-fun mapRest!59550 () (Array (_ BitVec 32) ValueCell!18361))

(assert (=> mapNonEmpty!59550 (= (arr!50325 _values!487) (store mapRest!59550 mapKey!59550 mapValue!59550))))

(declare-fun b!1563219 () Bool)

(declare-fun e!871220 () Bool)

(assert (=> b!1563219 (= e!871220 tp_is_empty!38783)))

(declare-fun b!1563220 () Bool)

(assert (=> b!1563220 (= e!871218 e!871221)))

(declare-fun res!1068688 () Bool)

(assert (=> b!1563220 (=> (not res!1068688) (not e!871221))))

(assert (=> b!1563220 (= res!1068688 (not (contains!10287 lt!671843 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!59917)

(declare-fun minValue!453 () V!59917)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6680 (array!104264 array!104266 (_ BitVec 32) (_ BitVec 32) V!59917 V!59917 (_ BitVec 32) Int) ListLongMap!22563)

(assert (=> b!1563220 (= lt!671843 (getCurrentListMapNoExtraKeys!6680 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1563221 () Bool)

(declare-fun e!871222 () Bool)

(assert (=> b!1563221 (= e!871222 (and e!871220 mapRes!59550))))

(declare-fun condMapEmpty!59550 () Bool)

(declare-fun mapDefault!59550 () ValueCell!18361)

