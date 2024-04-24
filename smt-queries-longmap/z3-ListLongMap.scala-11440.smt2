; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133850 () Bool)

(assert start!133850)

(declare-fun b!1562415 () Bool)

(declare-fun e!870748 () Bool)

(assert (=> b!1562415 (= e!870748 false)))

(declare-fun lt!671846 () Bool)

(declare-datatypes ((V!59569 0))(
  ( (V!59570 (val!19344 Int)) )
))
(declare-datatypes ((tuple2!25072 0))(
  ( (tuple2!25073 (_1!12547 (_ BitVec 64)) (_2!12547 V!59569)) )
))
(declare-datatypes ((List!36397 0))(
  ( (Nil!36394) (Cons!36393 (h!37857 tuple2!25072) (t!51122 List!36397)) )
))
(declare-datatypes ((ListLongMap!22515 0))(
  ( (ListLongMap!22516 (toList!11273 List!36397)) )
))
(declare-fun contains!10274 (ListLongMap!22515 (_ BitVec 64)) Bool)

(assert (=> b!1562415 (= lt!671846 (contains!10274 (ListLongMap!22516 Nil!36394) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1562416 () Bool)

(declare-fun e!870745 () Bool)

(declare-fun tp_is_empty!38521 () Bool)

(assert (=> b!1562416 (= e!870745 tp_is_empty!38521)))

(declare-fun b!1562417 () Bool)

(declare-fun res!1067606 () Bool)

(assert (=> b!1562417 (=> (not res!1067606) (not e!870748))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!103892 0))(
  ( (array!103893 (arr!50131 (Array (_ BitVec 32) (_ BitVec 64))) (size!50682 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103892)

(declare-datatypes ((ValueCell!18230 0))(
  ( (ValueCellFull!18230 (v!22088 V!59569)) (EmptyCell!18230) )
))
(declare-datatypes ((array!103894 0))(
  ( (array!103895 (arr!50132 (Array (_ BitVec 32) ValueCell!18230)) (size!50683 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103894)

(assert (=> b!1562417 (= res!1067606 (and (= (size!50683 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50682 _keys!637) (size!50683 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1562418 () Bool)

(declare-fun res!1067608 () Bool)

(assert (=> b!1562418 (=> (not res!1067608) (not e!870748))))

(assert (=> b!1562418 (= res!1067608 (not (contains!10274 (ListLongMap!22516 Nil!36394) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1562419 () Bool)

(declare-fun res!1067607 () Bool)

(assert (=> b!1562419 (=> (not res!1067607) (not e!870748))))

(declare-datatypes ((List!36398 0))(
  ( (Nil!36395) (Cons!36394 (h!37858 (_ BitVec 64)) (t!51123 List!36398)) )
))
(declare-fun arrayNoDuplicates!0 (array!103892 (_ BitVec 32) List!36398) Bool)

(assert (=> b!1562419 (= res!1067607 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36395))))

(declare-fun b!1562420 () Bool)

(declare-fun e!870744 () Bool)

(declare-fun mapRes!59157 () Bool)

(assert (=> b!1562420 (= e!870744 (and e!870745 mapRes!59157))))

(declare-fun condMapEmpty!59157 () Bool)

(declare-fun mapDefault!59157 () ValueCell!18230)

(assert (=> b!1562420 (= condMapEmpty!59157 (= (arr!50132 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18230)) mapDefault!59157)))))

(declare-fun mapNonEmpty!59157 () Bool)

(declare-fun tp!112812 () Bool)

(declare-fun e!870746 () Bool)

(assert (=> mapNonEmpty!59157 (= mapRes!59157 (and tp!112812 e!870746))))

(declare-fun mapValue!59157 () ValueCell!18230)

(declare-fun mapKey!59157 () (_ BitVec 32))

(declare-fun mapRest!59157 () (Array (_ BitVec 32) ValueCell!18230))

(assert (=> mapNonEmpty!59157 (= (arr!50132 _values!487) (store mapRest!59157 mapKey!59157 mapValue!59157))))

(declare-fun mapIsEmpty!59157 () Bool)

(assert (=> mapIsEmpty!59157 mapRes!59157))

(declare-fun b!1562421 () Bool)

(declare-fun res!1067605 () Bool)

(assert (=> b!1562421 (=> (not res!1067605) (not e!870748))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1562421 (= res!1067605 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50682 _keys!637)) (bvsge from!782 (size!50682 _keys!637))))))

(declare-fun b!1562422 () Bool)

(declare-fun res!1067604 () Bool)

(assert (=> b!1562422 (=> (not res!1067604) (not e!870748))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103892 (_ BitVec 32)) Bool)

(assert (=> b!1562422 (= res!1067604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1562423 () Bool)

(assert (=> b!1562423 (= e!870746 tp_is_empty!38521)))

(declare-fun res!1067609 () Bool)

(assert (=> start!133850 (=> (not res!1067609) (not e!870748))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133850 (= res!1067609 (validMask!0 mask!947))))

(assert (=> start!133850 e!870748))

(assert (=> start!133850 true))

(declare-fun array_inv!39223 (array!103892) Bool)

(assert (=> start!133850 (array_inv!39223 _keys!637)))

(declare-fun array_inv!39224 (array!103894) Bool)

(assert (=> start!133850 (and (array_inv!39224 _values!487) e!870744)))

(assert (= (and start!133850 res!1067609) b!1562417))

(assert (= (and b!1562417 res!1067606) b!1562422))

(assert (= (and b!1562422 res!1067604) b!1562419))

(assert (= (and b!1562419 res!1067607) b!1562421))

(assert (= (and b!1562421 res!1067605) b!1562418))

(assert (= (and b!1562418 res!1067608) b!1562415))

(assert (= (and b!1562420 condMapEmpty!59157) mapIsEmpty!59157))

(assert (= (and b!1562420 (not condMapEmpty!59157)) mapNonEmpty!59157))

(get-info :version)

(assert (= (and mapNonEmpty!59157 ((_ is ValueCellFull!18230) mapValue!59157)) b!1562423))

(assert (= (and b!1562420 ((_ is ValueCellFull!18230) mapDefault!59157)) b!1562416))

(assert (= start!133850 b!1562420))

(declare-fun m!1438263 () Bool)

(assert (=> mapNonEmpty!59157 m!1438263))

(declare-fun m!1438265 () Bool)

(assert (=> b!1562418 m!1438265))

(declare-fun m!1438267 () Bool)

(assert (=> b!1562419 m!1438267))

(declare-fun m!1438269 () Bool)

(assert (=> start!133850 m!1438269))

(declare-fun m!1438271 () Bool)

(assert (=> start!133850 m!1438271))

(declare-fun m!1438273 () Bool)

(assert (=> start!133850 m!1438273))

(declare-fun m!1438275 () Bool)

(assert (=> b!1562422 m!1438275))

(declare-fun m!1438277 () Bool)

(assert (=> b!1562415 m!1438277))

(check-sat (not b!1562422) (not mapNonEmpty!59157) (not b!1562419) (not start!133850) tp_is_empty!38521 (not b!1562418) (not b!1562415))
(check-sat)
