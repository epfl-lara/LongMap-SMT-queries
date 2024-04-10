; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134088 () Bool)

(assert start!134088)

(declare-fun b_free!32215 () Bool)

(declare-fun b_next!32215 () Bool)

(assert (=> start!134088 (= b_free!32215 (not b_next!32215))))

(declare-fun tp!113964 () Bool)

(declare-fun b_and!51859 () Bool)

(assert (=> start!134088 (= tp!113964 b_and!51859)))

(declare-fun b!1567185 () Bool)

(declare-fun res!1071109 () Bool)

(declare-fun e!873585 () Bool)

(assert (=> b!1567185 (=> (not res!1071109) (not e!873585))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!104678 0))(
  ( (array!104679 (arr!50524 (Array (_ BitVec 32) (_ BitVec 64))) (size!51074 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104678)

(declare-datatypes ((V!60201 0))(
  ( (V!60202 (val!19581 Int)) )
))
(declare-datatypes ((ValueCell!18467 0))(
  ( (ValueCellFull!18467 (v!22340 V!60201)) (EmptyCell!18467) )
))
(declare-datatypes ((array!104680 0))(
  ( (array!104681 (arr!50525 (Array (_ BitVec 32) ValueCell!18467)) (size!51075 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104680)

(assert (=> b!1567185 (= res!1071109 (and (= (size!51075 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51074 _keys!637) (size!51075 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1567186 () Bool)

(declare-fun e!873586 () Bool)

(assert (=> b!1567186 (= e!873585 e!873586)))

(declare-fun res!1071112 () Bool)

(assert (=> b!1567186 (=> (not res!1071112) (not e!873586))))

(declare-datatypes ((tuple2!25264 0))(
  ( (tuple2!25265 (_1!12643 (_ BitVec 64)) (_2!12643 V!60201)) )
))
(declare-datatypes ((List!36650 0))(
  ( (Nil!36647) (Cons!36646 (h!38093 tuple2!25264) (t!51554 List!36650)) )
))
(declare-datatypes ((ListLongMap!22699 0))(
  ( (ListLongMap!22700 (toList!11365 List!36650)) )
))
(declare-fun lt!672878 () ListLongMap!22699)

(declare-fun contains!10359 (ListLongMap!22699 (_ BitVec 64)) Bool)

(assert (=> b!1567186 (= res!1071112 (not (contains!10359 lt!672878 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!60201)

(declare-fun minValue!453 () V!60201)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6730 (array!104678 array!104680 (_ BitVec 32) (_ BitVec 32) V!60201 V!60201 (_ BitVec 32) Int) ListLongMap!22699)

(assert (=> b!1567186 (= lt!672878 (getCurrentListMapNoExtraKeys!6730 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1567187 () Bool)

(assert (=> b!1567187 (= e!873586 (bvsge (bvsub (size!51074 _keys!637) from!782) (bvsub (bvadd #b00000000000000000000000000000001 (size!51074 _keys!637)) from!782)))))

(declare-fun b!1567188 () Bool)

(declare-fun res!1071105 () Bool)

(assert (=> b!1567188 (=> (not res!1071105) (not e!873586))))

(assert (=> b!1567188 (= res!1071105 (not (contains!10359 lt!672878 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1567189 () Bool)

(declare-fun res!1071110 () Bool)

(assert (=> b!1567189 (=> (not res!1071110) (not e!873585))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1567189 (= res!1071110 (not (validKeyInArray!0 (select (arr!50524 _keys!637) from!782))))))

(declare-fun b!1567191 () Bool)

(declare-fun res!1071108 () Bool)

(assert (=> b!1567191 (=> (not res!1071108) (not e!873585))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104678 (_ BitVec 32)) Bool)

(assert (=> b!1567191 (= res!1071108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapIsEmpty!59892 () Bool)

(declare-fun mapRes!59892 () Bool)

(assert (=> mapIsEmpty!59892 mapRes!59892))

(declare-fun mapNonEmpty!59892 () Bool)

(declare-fun tp!113963 () Bool)

(declare-fun e!873589 () Bool)

(assert (=> mapNonEmpty!59892 (= mapRes!59892 (and tp!113963 e!873589))))

(declare-fun mapRest!59892 () (Array (_ BitVec 32) ValueCell!18467))

(declare-fun mapValue!59892 () ValueCell!18467)

(declare-fun mapKey!59892 () (_ BitVec 32))

(assert (=> mapNonEmpty!59892 (= (arr!50525 _values!487) (store mapRest!59892 mapKey!59892 mapValue!59892))))

(declare-fun b!1567192 () Bool)

(declare-fun e!873587 () Bool)

(declare-fun tp_is_empty!38995 () Bool)

(assert (=> b!1567192 (= e!873587 tp_is_empty!38995)))

(declare-fun b!1567190 () Bool)

(declare-fun res!1071107 () Bool)

(assert (=> b!1567190 (=> (not res!1071107) (not e!873585))))

(declare-datatypes ((List!36651 0))(
  ( (Nil!36648) (Cons!36647 (h!38094 (_ BitVec 64)) (t!51555 List!36651)) )
))
(declare-fun arrayNoDuplicates!0 (array!104678 (_ BitVec 32) List!36651) Bool)

(assert (=> b!1567190 (= res!1071107 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36648))))

(declare-fun res!1071111 () Bool)

(assert (=> start!134088 (=> (not res!1071111) (not e!873585))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134088 (= res!1071111 (validMask!0 mask!947))))

(assert (=> start!134088 e!873585))

(assert (=> start!134088 tp!113964))

(assert (=> start!134088 tp_is_empty!38995))

(assert (=> start!134088 true))

(declare-fun array_inv!39255 (array!104678) Bool)

(assert (=> start!134088 (array_inv!39255 _keys!637)))

(declare-fun e!873588 () Bool)

(declare-fun array_inv!39256 (array!104680) Bool)

(assert (=> start!134088 (and (array_inv!39256 _values!487) e!873588)))

(declare-fun b!1567193 () Bool)

(declare-fun res!1071106 () Bool)

(assert (=> b!1567193 (=> (not res!1071106) (not e!873585))))

(assert (=> b!1567193 (= res!1071106 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51074 _keys!637)) (bvslt from!782 (size!51074 _keys!637))))))

(declare-fun b!1567194 () Bool)

(assert (=> b!1567194 (= e!873588 (and e!873587 mapRes!59892))))

(declare-fun condMapEmpty!59892 () Bool)

(declare-fun mapDefault!59892 () ValueCell!18467)

