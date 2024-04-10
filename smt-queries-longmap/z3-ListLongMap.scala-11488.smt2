; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133728 () Bool)

(assert start!133728)

(declare-fun b_free!32091 () Bool)

(declare-fun b_next!32091 () Bool)

(assert (=> start!133728 (= b_free!32091 (not b_next!32091))))

(declare-fun tp!113477 () Bool)

(declare-fun b_and!51661 () Bool)

(assert (=> start!133728 (= tp!113477 b_and!51661)))

(declare-fun b!1563635 () Bool)

(declare-fun e!871469 () Bool)

(declare-fun tp_is_empty!38811 () Bool)

(assert (=> b!1563635 (= e!871469 tp_is_empty!38811)))

(declare-fun b!1563636 () Bool)

(declare-fun res!1068986 () Bool)

(declare-fun e!871471 () Bool)

(assert (=> b!1563636 (=> (not res!1068986) (not e!871471))))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!104316 0))(
  ( (array!104317 (arr!50350 (Array (_ BitVec 32) (_ BitVec 64))) (size!50900 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104316)

(assert (=> b!1563636 (= res!1068986 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50900 _keys!637)) (bvslt from!782 (size!50900 _keys!637))))))

(declare-fun b!1563637 () Bool)

(declare-fun e!871472 () Bool)

(declare-fun e!871473 () Bool)

(declare-fun mapRes!59592 () Bool)

(assert (=> b!1563637 (= e!871472 (and e!871473 mapRes!59592))))

(declare-fun condMapEmpty!59592 () Bool)

(declare-datatypes ((V!59955 0))(
  ( (V!59956 (val!19489 Int)) )
))
(declare-datatypes ((ValueCell!18375 0))(
  ( (ValueCellFull!18375 (v!22241 V!59955)) (EmptyCell!18375) )
))
(declare-datatypes ((array!104318 0))(
  ( (array!104319 (arr!50351 (Array (_ BitVec 32) ValueCell!18375)) (size!50901 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104318)

(declare-fun mapDefault!59592 () ValueCell!18375)

(assert (=> b!1563637 (= condMapEmpty!59592 (= (arr!50351 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18375)) mapDefault!59592)))))

(declare-fun res!1068985 () Bool)

(assert (=> start!133728 (=> (not res!1068985) (not e!871471))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133728 (= res!1068985 (validMask!0 mask!947))))

(assert (=> start!133728 e!871471))

(assert (=> start!133728 tp!113477))

(assert (=> start!133728 tp_is_empty!38811))

(assert (=> start!133728 true))

(declare-fun array_inv!39127 (array!104316) Bool)

(assert (=> start!133728 (array_inv!39127 _keys!637)))

(declare-fun array_inv!39128 (array!104318) Bool)

(assert (=> start!133728 (and (array_inv!39128 _values!487) e!871472)))

(declare-fun b!1563638 () Bool)

(declare-fun res!1068983 () Bool)

(assert (=> b!1563638 (=> (not res!1068983) (not e!871471))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1563638 (= res!1068983 (not (validKeyInArray!0 (select (arr!50350 _keys!637) from!782))))))

(declare-fun b!1563639 () Bool)

(declare-fun res!1068984 () Bool)

(assert (=> b!1563639 (=> (not res!1068984) (not e!871471))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104316 (_ BitVec 32)) Bool)

(assert (=> b!1563639 (= res!1068984 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1563640 () Bool)

(declare-fun res!1068987 () Bool)

(assert (=> b!1563640 (=> (not res!1068987) (not e!871471))))

(declare-datatypes ((List!36528 0))(
  ( (Nil!36525) (Cons!36524 (h!37970 (_ BitVec 64)) (t!51375 List!36528)) )
))
(declare-fun arrayNoDuplicates!0 (array!104316 (_ BitVec 32) List!36528) Bool)

(assert (=> b!1563640 (= res!1068987 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36525))))

(declare-fun b!1563641 () Bool)

(assert (=> b!1563641 (= e!871473 tp_is_empty!38811)))

(declare-fun b!1563642 () Bool)

(declare-fun e!871470 () Bool)

(assert (=> b!1563642 (= e!871471 e!871470)))

(declare-fun res!1068981 () Bool)

(assert (=> b!1563642 (=> (not res!1068981) (not e!871470))))

(declare-datatypes ((tuple2!25144 0))(
  ( (tuple2!25145 (_1!12583 (_ BitVec 64)) (_2!12583 V!59955)) )
))
(declare-datatypes ((List!36529 0))(
  ( (Nil!36526) (Cons!36525 (h!37971 tuple2!25144) (t!51376 List!36529)) )
))
(declare-datatypes ((ListLongMap!22579 0))(
  ( (ListLongMap!22580 (toList!11305 List!36529)) )
))
(declare-fun lt!671928 () ListLongMap!22579)

(declare-fun contains!10295 (ListLongMap!22579 (_ BitVec 64)) Bool)

(assert (=> b!1563642 (= res!1068981 (not (contains!10295 lt!671928 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!59955)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59955)

(declare-fun getCurrentListMapNoExtraKeys!6688 (array!104316 array!104318 (_ BitVec 32) (_ BitVec 32) V!59955 V!59955 (_ BitVec 32) Int) ListLongMap!22579)

(assert (=> b!1563642 (= lt!671928 (getCurrentListMapNoExtraKeys!6688 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1563643 () Bool)

(assert (=> b!1563643 (= e!871470 false)))

(declare-fun lt!671927 () Bool)

(assert (=> b!1563643 (= lt!671927 (contains!10295 lt!671928 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!59592 () Bool)

(declare-fun tp!113478 () Bool)

(assert (=> mapNonEmpty!59592 (= mapRes!59592 (and tp!113478 e!871469))))

(declare-fun mapValue!59592 () ValueCell!18375)

(declare-fun mapKey!59592 () (_ BitVec 32))

(declare-fun mapRest!59592 () (Array (_ BitVec 32) ValueCell!18375))

(assert (=> mapNonEmpty!59592 (= (arr!50351 _values!487) (store mapRest!59592 mapKey!59592 mapValue!59592))))

(declare-fun mapIsEmpty!59592 () Bool)

(assert (=> mapIsEmpty!59592 mapRes!59592))

(declare-fun b!1563644 () Bool)

(declare-fun res!1068982 () Bool)

(assert (=> b!1563644 (=> (not res!1068982) (not e!871471))))

(assert (=> b!1563644 (= res!1068982 (and (= (size!50901 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50900 _keys!637) (size!50901 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(assert (= (and start!133728 res!1068985) b!1563644))

(assert (= (and b!1563644 res!1068982) b!1563639))

(assert (= (and b!1563639 res!1068984) b!1563640))

(assert (= (and b!1563640 res!1068987) b!1563636))

(assert (= (and b!1563636 res!1068986) b!1563638))

(assert (= (and b!1563638 res!1068983) b!1563642))

(assert (= (and b!1563642 res!1068981) b!1563643))

(assert (= (and b!1563637 condMapEmpty!59592) mapIsEmpty!59592))

(assert (= (and b!1563637 (not condMapEmpty!59592)) mapNonEmpty!59592))

(get-info :version)

(assert (= (and mapNonEmpty!59592 ((_ is ValueCellFull!18375) mapValue!59592)) b!1563635))

(assert (= (and b!1563637 ((_ is ValueCellFull!18375) mapDefault!59592)) b!1563641))

(assert (= start!133728 b!1563637))

(declare-fun m!1439105 () Bool)

(assert (=> b!1563642 m!1439105))

(declare-fun m!1439107 () Bool)

(assert (=> b!1563642 m!1439107))

(declare-fun m!1439109 () Bool)

(assert (=> b!1563638 m!1439109))

(assert (=> b!1563638 m!1439109))

(declare-fun m!1439111 () Bool)

(assert (=> b!1563638 m!1439111))

(declare-fun m!1439113 () Bool)

(assert (=> b!1563643 m!1439113))

(declare-fun m!1439115 () Bool)

(assert (=> b!1563639 m!1439115))

(declare-fun m!1439117 () Bool)

(assert (=> start!133728 m!1439117))

(declare-fun m!1439119 () Bool)

(assert (=> start!133728 m!1439119))

(declare-fun m!1439121 () Bool)

(assert (=> start!133728 m!1439121))

(declare-fun m!1439123 () Bool)

(assert (=> b!1563640 m!1439123))

(declare-fun m!1439125 () Bool)

(assert (=> mapNonEmpty!59592 m!1439125))

(check-sat (not start!133728) (not b!1563638) (not mapNonEmpty!59592) b_and!51661 (not b!1563643) (not b!1563639) (not b_next!32091) tp_is_empty!38811 (not b!1563642) (not b!1563640))
(check-sat b_and!51661 (not b_next!32091))
