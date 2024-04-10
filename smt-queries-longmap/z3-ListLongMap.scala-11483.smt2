; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133698 () Bool)

(assert start!133698)

(declare-fun b_free!32061 () Bool)

(declare-fun b_next!32061 () Bool)

(assert (=> start!133698 (= b_free!32061 (not b_next!32061))))

(declare-fun tp!113388 () Bool)

(declare-fun b_and!51631 () Bool)

(assert (=> start!133698 (= tp!113388 b_and!51631)))

(declare-fun b!1563186 () Bool)

(declare-fun res!1068670 () Bool)

(declare-fun e!871200 () Bool)

(assert (=> b!1563186 (=> (not res!1068670) (not e!871200))))

(declare-datatypes ((array!104260 0))(
  ( (array!104261 (arr!50322 (Array (_ BitVec 32) (_ BitVec 64))) (size!50872 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104260)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1563186 (= res!1068670 (not (validKeyInArray!0 (select (arr!50322 _keys!637) from!782))))))

(declare-fun b!1563187 () Bool)

(declare-fun res!1068668 () Bool)

(assert (=> b!1563187 (=> (not res!1068668) (not e!871200))))

(assert (=> b!1563187 (= res!1068668 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50872 _keys!637)) (bvslt from!782 (size!50872 _keys!637))))))

(declare-fun b!1563188 () Bool)

(declare-fun res!1068669 () Bool)

(assert (=> b!1563188 (=> (not res!1068669) (not e!871200))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104260 (_ BitVec 32)) Bool)

(assert (=> b!1563188 (= res!1068669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1563189 () Bool)

(declare-fun res!1068672 () Bool)

(assert (=> b!1563189 (=> (not res!1068672) (not e!871200))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!59915 0))(
  ( (V!59916 (val!19474 Int)) )
))
(declare-datatypes ((ValueCell!18360 0))(
  ( (ValueCellFull!18360 (v!22226 V!59915)) (EmptyCell!18360) )
))
(declare-datatypes ((array!104262 0))(
  ( (array!104263 (arr!50323 (Array (_ BitVec 32) ValueCell!18360)) (size!50873 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104262)

(assert (=> b!1563189 (= res!1068672 (and (= (size!50873 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50872 _keys!637) (size!50873 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1563190 () Bool)

(declare-fun e!871204 () Bool)

(assert (=> b!1563190 (= e!871200 e!871204)))

(declare-fun res!1068667 () Bool)

(assert (=> b!1563190 (=> (not res!1068667) (not e!871204))))

(declare-datatypes ((tuple2!25126 0))(
  ( (tuple2!25127 (_1!12574 (_ BitVec 64)) (_2!12574 V!59915)) )
))
(declare-datatypes ((List!36511 0))(
  ( (Nil!36508) (Cons!36507 (h!37953 tuple2!25126) (t!51358 List!36511)) )
))
(declare-datatypes ((ListLongMap!22561 0))(
  ( (ListLongMap!22562 (toList!11296 List!36511)) )
))
(declare-fun lt!671838 () ListLongMap!22561)

(declare-fun contains!10286 (ListLongMap!22561 (_ BitVec 64)) Bool)

(assert (=> b!1563190 (= res!1068667 (not (contains!10286 lt!671838 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!59915)

(declare-fun minValue!453 () V!59915)

(declare-fun getCurrentListMapNoExtraKeys!6679 (array!104260 array!104262 (_ BitVec 32) (_ BitVec 32) V!59915 V!59915 (_ BitVec 32) Int) ListLongMap!22561)

(assert (=> b!1563190 (= lt!671838 (getCurrentListMapNoExtraKeys!6679 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun mapIsEmpty!59547 () Bool)

(declare-fun mapRes!59547 () Bool)

(assert (=> mapIsEmpty!59547 mapRes!59547))

(declare-fun res!1068666 () Bool)

(assert (=> start!133698 (=> (not res!1068666) (not e!871200))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133698 (= res!1068666 (validMask!0 mask!947))))

(assert (=> start!133698 e!871200))

(assert (=> start!133698 tp!113388))

(declare-fun tp_is_empty!38781 () Bool)

(assert (=> start!133698 tp_is_empty!38781))

(assert (=> start!133698 true))

(declare-fun array_inv!39111 (array!104260) Bool)

(assert (=> start!133698 (array_inv!39111 _keys!637)))

(declare-fun e!871203 () Bool)

(declare-fun array_inv!39112 (array!104262) Bool)

(assert (=> start!133698 (and (array_inv!39112 _values!487) e!871203)))

(declare-fun b!1563185 () Bool)

(declare-fun e!871202 () Bool)

(assert (=> b!1563185 (= e!871202 tp_is_empty!38781)))

(declare-fun b!1563191 () Bool)

(declare-fun res!1068671 () Bool)

(assert (=> b!1563191 (=> (not res!1068671) (not e!871200))))

(declare-datatypes ((List!36512 0))(
  ( (Nil!36509) (Cons!36508 (h!37954 (_ BitVec 64)) (t!51359 List!36512)) )
))
(declare-fun arrayNoDuplicates!0 (array!104260 (_ BitVec 32) List!36512) Bool)

(assert (=> b!1563191 (= res!1068671 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36509))))

(declare-fun b!1563192 () Bool)

(assert (=> b!1563192 (= e!871204 false)))

(declare-fun lt!671837 () Bool)

(assert (=> b!1563192 (= lt!671837 (contains!10286 lt!671838 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1563193 () Bool)

(declare-fun e!871199 () Bool)

(assert (=> b!1563193 (= e!871199 tp_is_empty!38781)))

(declare-fun mapNonEmpty!59547 () Bool)

(declare-fun tp!113387 () Bool)

(assert (=> mapNonEmpty!59547 (= mapRes!59547 (and tp!113387 e!871202))))

(declare-fun mapRest!59547 () (Array (_ BitVec 32) ValueCell!18360))

(declare-fun mapKey!59547 () (_ BitVec 32))

(declare-fun mapValue!59547 () ValueCell!18360)

(assert (=> mapNonEmpty!59547 (= (arr!50323 _values!487) (store mapRest!59547 mapKey!59547 mapValue!59547))))

(declare-fun b!1563194 () Bool)

(assert (=> b!1563194 (= e!871203 (and e!871199 mapRes!59547))))

(declare-fun condMapEmpty!59547 () Bool)

(declare-fun mapDefault!59547 () ValueCell!18360)

(assert (=> b!1563194 (= condMapEmpty!59547 (= (arr!50323 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18360)) mapDefault!59547)))))

(assert (= (and start!133698 res!1068666) b!1563189))

(assert (= (and b!1563189 res!1068672) b!1563188))

(assert (= (and b!1563188 res!1068669) b!1563191))

(assert (= (and b!1563191 res!1068671) b!1563187))

(assert (= (and b!1563187 res!1068668) b!1563186))

(assert (= (and b!1563186 res!1068670) b!1563190))

(assert (= (and b!1563190 res!1068667) b!1563192))

(assert (= (and b!1563194 condMapEmpty!59547) mapIsEmpty!59547))

(assert (= (and b!1563194 (not condMapEmpty!59547)) mapNonEmpty!59547))

(get-info :version)

(assert (= (and mapNonEmpty!59547 ((_ is ValueCellFull!18360) mapValue!59547)) b!1563185))

(assert (= (and b!1563194 ((_ is ValueCellFull!18360) mapDefault!59547)) b!1563193))

(assert (= start!133698 b!1563194))

(declare-fun m!1438775 () Bool)

(assert (=> mapNonEmpty!59547 m!1438775))

(declare-fun m!1438777 () Bool)

(assert (=> b!1563186 m!1438777))

(assert (=> b!1563186 m!1438777))

(declare-fun m!1438779 () Bool)

(assert (=> b!1563186 m!1438779))

(declare-fun m!1438781 () Bool)

(assert (=> b!1563192 m!1438781))

(declare-fun m!1438783 () Bool)

(assert (=> start!133698 m!1438783))

(declare-fun m!1438785 () Bool)

(assert (=> start!133698 m!1438785))

(declare-fun m!1438787 () Bool)

(assert (=> start!133698 m!1438787))

(declare-fun m!1438789 () Bool)

(assert (=> b!1563190 m!1438789))

(declare-fun m!1438791 () Bool)

(assert (=> b!1563190 m!1438791))

(declare-fun m!1438793 () Bool)

(assert (=> b!1563191 m!1438793))

(declare-fun m!1438795 () Bool)

(assert (=> b!1563188 m!1438795))

(check-sat (not b!1563188) (not b!1563190) (not mapNonEmpty!59547) (not b!1563191) (not start!133698) (not b!1563192) tp_is_empty!38781 (not b!1563186) b_and!51631 (not b_next!32061))
(check-sat b_and!51631 (not b_next!32061))
