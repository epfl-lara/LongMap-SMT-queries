; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133750 () Bool)

(assert start!133750)

(declare-fun b_free!32113 () Bool)

(declare-fun b_next!32113 () Bool)

(assert (=> start!133750 (= b_free!32113 (not b_next!32113))))

(declare-fun tp!113543 () Bool)

(declare-fun b_and!51683 () Bool)

(assert (=> start!133750 (= tp!113543 b_and!51683)))

(declare-fun b!1563967 () Bool)

(declare-fun res!1069214 () Bool)

(declare-fun e!871668 () Bool)

(assert (=> b!1563967 (=> (not res!1069214) (not e!871668))))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!104358 0))(
  ( (array!104359 (arr!50371 (Array (_ BitVec 32) (_ BitVec 64))) (size!50921 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104358)

(assert (=> b!1563967 (= res!1069214 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50921 _keys!637)) (bvslt from!782 (size!50921 _keys!637))))))

(declare-fun mapNonEmpty!59625 () Bool)

(declare-fun mapRes!59625 () Bool)

(declare-fun tp!113544 () Bool)

(declare-fun e!871669 () Bool)

(assert (=> mapNonEmpty!59625 (= mapRes!59625 (and tp!113544 e!871669))))

(declare-datatypes ((V!59985 0))(
  ( (V!59986 (val!19500 Int)) )
))
(declare-datatypes ((ValueCell!18386 0))(
  ( (ValueCellFull!18386 (v!22252 V!59985)) (EmptyCell!18386) )
))
(declare-fun mapValue!59625 () ValueCell!18386)

(declare-fun mapRest!59625 () (Array (_ BitVec 32) ValueCell!18386))

(declare-fun mapKey!59625 () (_ BitVec 32))

(declare-datatypes ((array!104360 0))(
  ( (array!104361 (arr!50372 (Array (_ BitVec 32) ValueCell!18386)) (size!50922 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104360)

(assert (=> mapNonEmpty!59625 (= (arr!50372 _values!487) (store mapRest!59625 mapKey!59625 mapValue!59625))))

(declare-fun b!1563968 () Bool)

(declare-fun e!871671 () Bool)

(assert (=> b!1563968 (= e!871671 (bvslt (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000))))

(declare-fun b!1563969 () Bool)

(declare-fun e!871672 () Bool)

(declare-fun tp_is_empty!38833 () Bool)

(assert (=> b!1563969 (= e!871672 tp_is_empty!38833)))

(declare-fun mapIsEmpty!59625 () Bool)

(assert (=> mapIsEmpty!59625 mapRes!59625))

(declare-fun b!1563970 () Bool)

(declare-fun res!1069220 () Bool)

(assert (=> b!1563970 (=> (not res!1069220) (not e!871668))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104358 (_ BitVec 32)) Bool)

(assert (=> b!1563970 (= res!1069220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun res!1069217 () Bool)

(assert (=> start!133750 (=> (not res!1069217) (not e!871668))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133750 (= res!1069217 (validMask!0 mask!947))))

(assert (=> start!133750 e!871668))

(assert (=> start!133750 tp!113543))

(assert (=> start!133750 tp_is_empty!38833))

(assert (=> start!133750 true))

(declare-fun array_inv!39145 (array!104358) Bool)

(assert (=> start!133750 (array_inv!39145 _keys!637)))

(declare-fun e!871667 () Bool)

(declare-fun array_inv!39146 (array!104360) Bool)

(assert (=> start!133750 (and (array_inv!39146 _values!487) e!871667)))

(declare-fun b!1563971 () Bool)

(assert (=> b!1563971 (= e!871668 e!871671)))

(declare-fun res!1069218 () Bool)

(assert (=> b!1563971 (=> (not res!1069218) (not e!871671))))

(declare-datatypes ((tuple2!25160 0))(
  ( (tuple2!25161 (_1!12591 (_ BitVec 64)) (_2!12591 V!59985)) )
))
(declare-datatypes ((List!36546 0))(
  ( (Nil!36543) (Cons!36542 (h!37988 tuple2!25160) (t!51393 List!36546)) )
))
(declare-datatypes ((ListLongMap!22595 0))(
  ( (ListLongMap!22596 (toList!11313 List!36546)) )
))
(declare-fun lt!671991 () ListLongMap!22595)

(declare-fun contains!10303 (ListLongMap!22595 (_ BitVec 64)) Bool)

(assert (=> b!1563971 (= res!1069218 (not (contains!10303 lt!671991 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!59985)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59985)

(declare-fun getCurrentListMapNoExtraKeys!6694 (array!104358 array!104360 (_ BitVec 32) (_ BitVec 32) V!59985 V!59985 (_ BitVec 32) Int) ListLongMap!22595)

(assert (=> b!1563971 (= lt!671991 (getCurrentListMapNoExtraKeys!6694 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1563972 () Bool)

(declare-fun res!1069221 () Bool)

(assert (=> b!1563972 (=> (not res!1069221) (not e!871668))))

(declare-datatypes ((List!36547 0))(
  ( (Nil!36544) (Cons!36543 (h!37989 (_ BitVec 64)) (t!51394 List!36547)) )
))
(declare-fun arrayNoDuplicates!0 (array!104358 (_ BitVec 32) List!36547) Bool)

(assert (=> b!1563972 (= res!1069221 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36544))))

(declare-fun b!1563973 () Bool)

(assert (=> b!1563973 (= e!871667 (and e!871672 mapRes!59625))))

(declare-fun condMapEmpty!59625 () Bool)

(declare-fun mapDefault!59625 () ValueCell!18386)

