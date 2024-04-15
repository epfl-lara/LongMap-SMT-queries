; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133728 () Bool)

(assert start!133728)

(declare-fun b!1563928 () Bool)

(declare-fun e!871640 () Bool)

(declare-fun tp_is_empty!38851 () Bool)

(assert (=> b!1563928 (= e!871640 tp_is_empty!38851)))

(declare-fun b!1563929 () Bool)

(declare-fun res!1069260 () Bool)

(declare-fun e!871641 () Bool)

(assert (=> b!1563929 (=> (not res!1069260) (not e!871641))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!104320 0))(
  ( (array!104321 (arr!50352 (Array (_ BitVec 32) (_ BitVec 64))) (size!50904 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104320)

(declare-datatypes ((V!60009 0))(
  ( (V!60010 (val!19509 Int)) )
))
(declare-datatypes ((ValueCell!18395 0))(
  ( (ValueCellFull!18395 (v!22257 V!60009)) (EmptyCell!18395) )
))
(declare-datatypes ((array!104322 0))(
  ( (array!104323 (arr!50353 (Array (_ BitVec 32) ValueCell!18395)) (size!50905 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104322)

(assert (=> b!1563929 (= res!1069260 (and (= (size!50905 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50904 _keys!637) (size!50905 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1563930 () Bool)

(declare-fun e!871642 () Bool)

(assert (=> b!1563930 (= e!871642 tp_is_empty!38851)))

(declare-fun b!1563931 () Bool)

(assert (=> b!1563931 (= e!871641 false)))

(declare-fun lt!671732 () Bool)

(declare-datatypes ((tuple2!25250 0))(
  ( (tuple2!25251 (_1!12636 (_ BitVec 64)) (_2!12636 V!60009)) )
))
(declare-datatypes ((List!36605 0))(
  ( (Nil!36602) (Cons!36601 (h!38048 tuple2!25250) (t!51444 List!36605)) )
))
(declare-datatypes ((ListLongMap!22685 0))(
  ( (ListLongMap!22686 (toList!11358 List!36605)) )
))
(declare-fun contains!10269 (ListLongMap!22685 (_ BitVec 64)) Bool)

(assert (=> b!1563931 (= lt!671732 (contains!10269 (ListLongMap!22686 Nil!36602) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1563932 () Bool)

(declare-fun res!1069259 () Bool)

(assert (=> b!1563932 (=> (not res!1069259) (not e!871641))))

(assert (=> b!1563932 (= res!1069259 (not (contains!10269 (ListLongMap!22686 Nil!36602) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1563933 () Bool)

(declare-fun res!1069262 () Bool)

(assert (=> b!1563933 (=> (not res!1069262) (not e!871641))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104320 (_ BitVec 32)) Bool)

(assert (=> b!1563933 (= res!1069262 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun res!1069258 () Bool)

(assert (=> start!133728 (=> (not res!1069258) (not e!871641))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133728 (= res!1069258 (validMask!0 mask!947))))

(assert (=> start!133728 e!871641))

(assert (=> start!133728 true))

(declare-fun array_inv!39327 (array!104320) Bool)

(assert (=> start!133728 (array_inv!39327 _keys!637)))

(declare-fun e!871638 () Bool)

(declare-fun array_inv!39328 (array!104322) Bool)

(assert (=> start!133728 (and (array_inv!39328 _values!487) e!871638)))

(declare-fun b!1563934 () Bool)

(declare-fun res!1069261 () Bool)

(assert (=> b!1563934 (=> (not res!1069261) (not e!871641))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1563934 (= res!1069261 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50904 _keys!637)) (bvsge from!782 (size!50904 _keys!637))))))

(declare-fun b!1563935 () Bool)

(declare-fun res!1069263 () Bool)

(assert (=> b!1563935 (=> (not res!1069263) (not e!871641))))

(declare-datatypes ((List!36606 0))(
  ( (Nil!36603) (Cons!36602 (h!38049 (_ BitVec 64)) (t!51445 List!36606)) )
))
(declare-fun arrayNoDuplicates!0 (array!104320 (_ BitVec 32) List!36606) Bool)

(assert (=> b!1563935 (= res!1069263 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36603))))

(declare-fun mapIsEmpty!59655 () Bool)

(declare-fun mapRes!59655 () Bool)

(assert (=> mapIsEmpty!59655 mapRes!59655))

(declare-fun b!1563936 () Bool)

(assert (=> b!1563936 (= e!871638 (and e!871640 mapRes!59655))))

(declare-fun condMapEmpty!59655 () Bool)

(declare-fun mapDefault!59655 () ValueCell!18395)

(assert (=> b!1563936 (= condMapEmpty!59655 (= (arr!50353 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18395)) mapDefault!59655)))))

(declare-fun mapNonEmpty!59655 () Bool)

(declare-fun tp!113581 () Bool)

(assert (=> mapNonEmpty!59655 (= mapRes!59655 (and tp!113581 e!871642))))

(declare-fun mapRest!59655 () (Array (_ BitVec 32) ValueCell!18395))

(declare-fun mapKey!59655 () (_ BitVec 32))

(declare-fun mapValue!59655 () ValueCell!18395)

(assert (=> mapNonEmpty!59655 (= (arr!50353 _values!487) (store mapRest!59655 mapKey!59655 mapValue!59655))))

(assert (= (and start!133728 res!1069258) b!1563929))

(assert (= (and b!1563929 res!1069260) b!1563933))

(assert (= (and b!1563933 res!1069262) b!1563935))

(assert (= (and b!1563935 res!1069263) b!1563934))

(assert (= (and b!1563934 res!1069261) b!1563932))

(assert (= (and b!1563932 res!1069259) b!1563931))

(assert (= (and b!1563936 condMapEmpty!59655) mapIsEmpty!59655))

(assert (= (and b!1563936 (not condMapEmpty!59655)) mapNonEmpty!59655))

(get-info :version)

(assert (= (and mapNonEmpty!59655 ((_ is ValueCellFull!18395) mapValue!59655)) b!1563930))

(assert (= (and b!1563936 ((_ is ValueCellFull!18395) mapDefault!59655)) b!1563928))

(assert (= start!133728 b!1563936))

(declare-fun m!1438623 () Bool)

(assert (=> b!1563933 m!1438623))

(declare-fun m!1438625 () Bool)

(assert (=> b!1563932 m!1438625))

(declare-fun m!1438627 () Bool)

(assert (=> start!133728 m!1438627))

(declare-fun m!1438629 () Bool)

(assert (=> start!133728 m!1438629))

(declare-fun m!1438631 () Bool)

(assert (=> start!133728 m!1438631))

(declare-fun m!1438633 () Bool)

(assert (=> b!1563931 m!1438633))

(declare-fun m!1438635 () Bool)

(assert (=> b!1563935 m!1438635))

(declare-fun m!1438637 () Bool)

(assert (=> mapNonEmpty!59655 m!1438637))

(check-sat (not b!1563932) (not b!1563935) (not b!1563931) (not start!133728) tp_is_empty!38851 (not b!1563933) (not mapNonEmpty!59655))
(check-sat)
