; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133938 () Bool)

(assert start!133938)

(declare-fun b_free!32161 () Bool)

(declare-fun b_next!32161 () Bool)

(assert (=> start!133938 (= b_free!32161 (not b_next!32161))))

(declare-fun tp!113784 () Bool)

(declare-fun b_and!51763 () Bool)

(assert (=> start!133938 (= tp!113784 b_and!51763)))

(declare-fun b!1565695 () Bool)

(declare-fun res!1070259 () Bool)

(declare-fun e!872701 () Bool)

(assert (=> b!1565695 (=> (not res!1070259) (not e!872701))))

(declare-datatypes ((array!104560 0))(
  ( (array!104561 (arr!50467 (Array (_ BitVec 32) (_ BitVec 64))) (size!51017 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104560)

(declare-datatypes ((List!36612 0))(
  ( (Nil!36609) (Cons!36608 (h!38054 (_ BitVec 64)) (t!51487 List!36612)) )
))
(declare-fun arrayNoDuplicates!0 (array!104560 (_ BitVec 32) List!36612) Bool)

(assert (=> b!1565695 (= res!1070259 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36609))))

(declare-fun b!1565696 () Bool)

(declare-fun res!1070262 () Bool)

(assert (=> b!1565696 (=> (not res!1070262) (not e!872701))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1565696 (= res!1070262 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51017 _keys!637)) (bvslt from!782 (size!51017 _keys!637))))))

(declare-fun b!1565697 () Bool)

(declare-fun e!872700 () Bool)

(declare-fun tp_is_empty!38935 () Bool)

(assert (=> b!1565697 (= e!872700 tp_is_empty!38935)))

(declare-fun b!1565698 () Bool)

(assert (=> b!1565698 (= e!872701 (not true))))

(declare-fun lt!672371 () Bool)

(declare-datatypes ((V!60121 0))(
  ( (V!60122 (val!19551 Int)) )
))
(declare-datatypes ((tuple2!25224 0))(
  ( (tuple2!25225 (_1!12623 (_ BitVec 64)) (_2!12623 V!60121)) )
))
(declare-datatypes ((List!36613 0))(
  ( (Nil!36610) (Cons!36609 (h!38055 tuple2!25224) (t!51488 List!36613)) )
))
(declare-datatypes ((ListLongMap!22659 0))(
  ( (ListLongMap!22660 (toList!11345 List!36613)) )
))
(declare-fun lt!672374 () ListLongMap!22659)

(declare-fun contains!10336 (ListLongMap!22659 (_ BitVec 64)) Bool)

(assert (=> b!1565698 (= lt!672371 (contains!10336 lt!672374 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1565698 (not (contains!10336 lt!672374 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!672372 () ListLongMap!22659)

(declare-fun lt!672370 () V!60121)

(declare-fun +!5075 (ListLongMap!22659 tuple2!25224) ListLongMap!22659)

(assert (=> b!1565698 (= lt!672374 (+!5075 lt!672372 (tuple2!25225 (select (arr!50467 _keys!637) from!782) lt!672370)))))

(declare-datatypes ((Unit!52014 0))(
  ( (Unit!52015) )
))
(declare-fun lt!672373 () Unit!52014)

(declare-fun addStillNotContains!565 (ListLongMap!22659 (_ BitVec 64) V!60121 (_ BitVec 64)) Unit!52014)

(assert (=> b!1565698 (= lt!672373 (addStillNotContains!565 lt!672372 (select (arr!50467 _keys!637) from!782) lt!672370 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-datatypes ((ValueCell!18437 0))(
  ( (ValueCellFull!18437 (v!22307 V!60121)) (EmptyCell!18437) )
))
(declare-datatypes ((array!104562 0))(
  ( (array!104563 (arr!50468 (Array (_ BitVec 32) ValueCell!18437)) (size!51018 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104562)

(declare-fun get!26344 (ValueCell!18437 V!60121) V!60121)

(declare-fun dynLambda!3859 (Int (_ BitVec 64)) V!60121)

(assert (=> b!1565698 (= lt!672370 (get!26344 (select (arr!50468 _values!487) from!782) (dynLambda!3859 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!60121)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!60121)

(declare-fun getCurrentListMapNoExtraKeys!6710 (array!104560 array!104562 (_ BitVec 32) (_ BitVec 32) V!60121 V!60121 (_ BitVec 32) Int) ListLongMap!22659)

(assert (=> b!1565698 (= lt!672372 (getCurrentListMapNoExtraKeys!6710 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun res!1070258 () Bool)

(assert (=> start!133938 (=> (not res!1070258) (not e!872701))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133938 (= res!1070258 (validMask!0 mask!947))))

(assert (=> start!133938 e!872701))

(assert (=> start!133938 tp!113784))

(assert (=> start!133938 tp_is_empty!38935))

(assert (=> start!133938 true))

(declare-fun array_inv!39215 (array!104560) Bool)

(assert (=> start!133938 (array_inv!39215 _keys!637)))

(declare-fun e!872698 () Bool)

(declare-fun array_inv!39216 (array!104562) Bool)

(assert (=> start!133938 (and (array_inv!39216 _values!487) e!872698)))

(declare-fun b!1565699 () Bool)

(declare-fun res!1070263 () Bool)

(assert (=> b!1565699 (=> (not res!1070263) (not e!872701))))

(assert (=> b!1565699 (= res!1070263 (and (= (size!51018 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51017 _keys!637) (size!51018 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1565700 () Bool)

(declare-fun res!1070260 () Bool)

(assert (=> b!1565700 (=> (not res!1070260) (not e!872701))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104560 (_ BitVec 32)) Bool)

(assert (=> b!1565700 (= res!1070260 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1565701 () Bool)

(declare-fun e!872697 () Bool)

(declare-fun mapRes!59794 () Bool)

(assert (=> b!1565701 (= e!872698 (and e!872697 mapRes!59794))))

(declare-fun condMapEmpty!59794 () Bool)

(declare-fun mapDefault!59794 () ValueCell!18437)

