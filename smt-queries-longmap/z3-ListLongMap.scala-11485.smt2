; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133658 () Bool)

(assert start!133658)

(declare-fun b_free!32071 () Bool)

(declare-fun b_next!32071 () Bool)

(assert (=> start!133658 (= b_free!32071 (not b_next!32071))))

(declare-fun tp!113419 () Bool)

(declare-fun b_and!51623 () Bool)

(assert (=> start!133658 (= tp!113419 b_and!51623)))

(declare-fun b!1563022 () Bool)

(declare-fun e!871096 () Bool)

(assert (=> b!1563022 (= e!871096 false)))

(declare-fun lt!671582 () Bool)

(declare-datatypes ((V!59929 0))(
  ( (V!59930 (val!19479 Int)) )
))
(declare-datatypes ((tuple2!25206 0))(
  ( (tuple2!25207 (_1!12614 (_ BitVec 64)) (_2!12614 V!59929)) )
))
(declare-datatypes ((List!36564 0))(
  ( (Nil!36561) (Cons!36560 (h!38007 tuple2!25206) (t!51403 List!36564)) )
))
(declare-datatypes ((ListLongMap!22641 0))(
  ( (ListLongMap!22642 (toList!11336 List!36564)) )
))
(declare-fun lt!671581 () ListLongMap!22641)

(declare-fun contains!10246 (ListLongMap!22641 (_ BitVec 64)) Bool)

(assert (=> b!1563022 (= lt!671582 (contains!10246 lt!671581 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1563023 () Bool)

(declare-fun e!871095 () Bool)

(declare-fun tp_is_empty!38791 () Bool)

(assert (=> b!1563023 (= e!871095 tp_is_empty!38791)))

(declare-fun b!1563024 () Bool)

(declare-fun e!871093 () Bool)

(declare-fun e!871092 () Bool)

(declare-fun mapRes!59562 () Bool)

(assert (=> b!1563024 (= e!871093 (and e!871092 mapRes!59562))))

(declare-fun condMapEmpty!59562 () Bool)

(declare-datatypes ((ValueCell!18365 0))(
  ( (ValueCellFull!18365 (v!22227 V!59929)) (EmptyCell!18365) )
))
(declare-datatypes ((array!104200 0))(
  ( (array!104201 (arr!50293 (Array (_ BitVec 32) ValueCell!18365)) (size!50845 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104200)

(declare-fun mapDefault!59562 () ValueCell!18365)

(assert (=> b!1563024 (= condMapEmpty!59562 (= (arr!50293 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18365)) mapDefault!59562)))))

(declare-fun b!1563025 () Bool)

(declare-fun res!1068645 () Bool)

(declare-fun e!871091 () Bool)

(assert (=> b!1563025 (=> (not res!1068645) (not e!871091))))

(declare-datatypes ((array!104202 0))(
  ( (array!104203 (arr!50294 (Array (_ BitVec 32) (_ BitVec 64))) (size!50846 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104202)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1563025 (= res!1068645 (not (validKeyInArray!0 (select (arr!50294 _keys!637) from!782))))))

(declare-fun b!1563026 () Bool)

(declare-fun res!1068643 () Bool)

(assert (=> b!1563026 (=> (not res!1068643) (not e!871091))))

(declare-datatypes ((List!36565 0))(
  ( (Nil!36562) (Cons!36561 (h!38008 (_ BitVec 64)) (t!51404 List!36565)) )
))
(declare-fun arrayNoDuplicates!0 (array!104202 (_ BitVec 32) List!36565) Bool)

(assert (=> b!1563026 (= res!1068643 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36562))))

(declare-fun mapIsEmpty!59562 () Bool)

(assert (=> mapIsEmpty!59562 mapRes!59562))

(declare-fun b!1563027 () Bool)

(declare-fun res!1068646 () Bool)

(assert (=> b!1563027 (=> (not res!1068646) (not e!871091))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun mask!947 () (_ BitVec 32))

(assert (=> b!1563027 (= res!1068646 (and (= (size!50845 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50846 _keys!637) (size!50845 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1563028 () Bool)

(declare-fun res!1068642 () Bool)

(assert (=> b!1563028 (=> (not res!1068642) (not e!871091))))

(assert (=> b!1563028 (= res!1068642 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50846 _keys!637)) (bvslt from!782 (size!50846 _keys!637))))))

(declare-fun res!1068647 () Bool)

(assert (=> start!133658 (=> (not res!1068647) (not e!871091))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133658 (= res!1068647 (validMask!0 mask!947))))

(assert (=> start!133658 e!871091))

(assert (=> start!133658 tp!113419))

(assert (=> start!133658 tp_is_empty!38791))

(assert (=> start!133658 true))

(declare-fun array_inv!39277 (array!104202) Bool)

(assert (=> start!133658 (array_inv!39277 _keys!637)))

(declare-fun array_inv!39278 (array!104200) Bool)

(assert (=> start!133658 (and (array_inv!39278 _values!487) e!871093)))

(declare-fun b!1563029 () Bool)

(assert (=> b!1563029 (= e!871092 tp_is_empty!38791)))

(declare-fun b!1563030 () Bool)

(declare-fun res!1068644 () Bool)

(assert (=> b!1563030 (=> (not res!1068644) (not e!871091))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104202 (_ BitVec 32)) Bool)

(assert (=> b!1563030 (= res!1068644 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapNonEmpty!59562 () Bool)

(declare-fun tp!113418 () Bool)

(assert (=> mapNonEmpty!59562 (= mapRes!59562 (and tp!113418 e!871095))))

(declare-fun mapValue!59562 () ValueCell!18365)

(declare-fun mapRest!59562 () (Array (_ BitVec 32) ValueCell!18365))

(declare-fun mapKey!59562 () (_ BitVec 32))

(assert (=> mapNonEmpty!59562 (= (arr!50293 _values!487) (store mapRest!59562 mapKey!59562 mapValue!59562))))

(declare-fun b!1563031 () Bool)

(assert (=> b!1563031 (= e!871091 e!871096)))

(declare-fun res!1068648 () Bool)

(assert (=> b!1563031 (=> (not res!1068648) (not e!871096))))

(assert (=> b!1563031 (= res!1068648 (not (contains!10246 lt!671581 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!59929)

(declare-fun minValue!453 () V!59929)

(declare-fun getCurrentListMapNoExtraKeys!6709 (array!104202 array!104200 (_ BitVec 32) (_ BitVec 32) V!59929 V!59929 (_ BitVec 32) Int) ListLongMap!22641)

(assert (=> b!1563031 (= lt!671581 (getCurrentListMapNoExtraKeys!6709 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(assert (= (and start!133658 res!1068647) b!1563027))

(assert (= (and b!1563027 res!1068646) b!1563030))

(assert (= (and b!1563030 res!1068644) b!1563026))

(assert (= (and b!1563026 res!1068643) b!1563028))

(assert (= (and b!1563028 res!1068642) b!1563025))

(assert (= (and b!1563025 res!1068645) b!1563031))

(assert (= (and b!1563031 res!1068648) b!1563022))

(assert (= (and b!1563024 condMapEmpty!59562) mapIsEmpty!59562))

(assert (= (and b!1563024 (not condMapEmpty!59562)) mapNonEmpty!59562))

(get-info :version)

(assert (= (and mapNonEmpty!59562 ((_ is ValueCellFull!18365) mapValue!59562)) b!1563023))

(assert (= (and b!1563024 ((_ is ValueCellFull!18365) mapDefault!59562)) b!1563029))

(assert (= start!133658 b!1563024))

(declare-fun m!1437993 () Bool)

(assert (=> b!1563022 m!1437993))

(declare-fun m!1437995 () Bool)

(assert (=> b!1563025 m!1437995))

(assert (=> b!1563025 m!1437995))

(declare-fun m!1437997 () Bool)

(assert (=> b!1563025 m!1437997))

(declare-fun m!1437999 () Bool)

(assert (=> b!1563031 m!1437999))

(declare-fun m!1438001 () Bool)

(assert (=> b!1563031 m!1438001))

(declare-fun m!1438003 () Bool)

(assert (=> b!1563026 m!1438003))

(declare-fun m!1438005 () Bool)

(assert (=> mapNonEmpty!59562 m!1438005))

(declare-fun m!1438007 () Bool)

(assert (=> b!1563030 m!1438007))

(declare-fun m!1438009 () Bool)

(assert (=> start!133658 m!1438009))

(declare-fun m!1438011 () Bool)

(assert (=> start!133658 m!1438011))

(declare-fun m!1438013 () Bool)

(assert (=> start!133658 m!1438013))

(check-sat (not b_next!32071) (not b!1563031) (not start!133658) tp_is_empty!38791 (not b!1563026) (not mapNonEmpty!59562) b_and!51623 (not b!1563025) (not b!1563022) (not b!1563030))
(check-sat b_and!51623 (not b_next!32071))
