; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133524 () Bool)

(assert start!133524)

(declare-fun b_free!31941 () Bool)

(declare-fun b_next!31941 () Bool)

(assert (=> start!133524 (= b_free!31941 (not b_next!31941))))

(declare-fun tp!112947 () Bool)

(declare-fun b_and!51397 () Bool)

(assert (=> start!133524 (= tp!112947 b_and!51397)))

(declare-fun b!1560925 () Bool)

(declare-fun res!1067306 () Bool)

(declare-fun e!869884 () Bool)

(assert (=> b!1560925 (=> (not res!1067306) (not e!869884))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-datatypes ((array!103932 0))(
  ( (array!103933 (arr!50158 (Array (_ BitVec 32) (_ BitVec 64))) (size!50708 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103932)

(declare-datatypes ((V!59683 0))(
  ( (V!59684 (val!19387 Int)) )
))
(declare-datatypes ((ValueCell!18273 0))(
  ( (ValueCellFull!18273 (v!22139 V!59683)) (EmptyCell!18273) )
))
(declare-datatypes ((array!103934 0))(
  ( (array!103935 (arr!50159 (Array (_ BitVec 32) ValueCell!18273)) (size!50709 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103934)

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1560925 (= res!1067306 (and (= (size!50709 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50708 _keys!637) (size!50709 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1560926 () Bool)

(declare-fun res!1067307 () Bool)

(assert (=> b!1560926 (=> (not res!1067307) (not e!869884))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1560926 (= res!1067307 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50708 _keys!637)) (bvslt from!782 (size!50708 _keys!637))))))

(declare-fun b!1560927 () Bool)

(declare-fun res!1067305 () Bool)

(assert (=> b!1560927 (=> (not res!1067305) (not e!869884))))

(declare-datatypes ((List!36413 0))(
  ( (Nil!36410) (Cons!36409 (h!37855 (_ BitVec 64)) (t!51146 List!36413)) )
))
(declare-fun arrayNoDuplicates!0 (array!103932 (_ BitVec 32) List!36413) Bool)

(assert (=> b!1560927 (= res!1067305 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36410))))

(declare-fun b!1560928 () Bool)

(declare-fun e!869881 () Bool)

(declare-fun e!869882 () Bool)

(declare-fun mapRes!59286 () Bool)

(assert (=> b!1560928 (= e!869881 (and e!869882 mapRes!59286))))

(declare-fun condMapEmpty!59286 () Bool)

(declare-fun mapDefault!59286 () ValueCell!18273)

(assert (=> b!1560928 (= condMapEmpty!59286 (= (arr!50159 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18273)) mapDefault!59286)))))

(declare-fun mapIsEmpty!59286 () Bool)

(assert (=> mapIsEmpty!59286 mapRes!59286))

(declare-fun mapNonEmpty!59286 () Bool)

(declare-fun tp!112946 () Bool)

(declare-fun e!869880 () Bool)

(assert (=> mapNonEmpty!59286 (= mapRes!59286 (and tp!112946 e!869880))))

(declare-fun mapValue!59286 () ValueCell!18273)

(declare-fun mapRest!59286 () (Array (_ BitVec 32) ValueCell!18273))

(declare-fun mapKey!59286 () (_ BitVec 32))

(assert (=> mapNonEmpty!59286 (= (arr!50159 _values!487) (store mapRest!59286 mapKey!59286 mapValue!59286))))

(declare-fun b!1560929 () Bool)

(declare-fun res!1067303 () Bool)

(assert (=> b!1560929 (=> (not res!1067303) (not e!869884))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103932 (_ BitVec 32)) Bool)

(assert (=> b!1560929 (= res!1067303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1560930 () Bool)

(declare-fun tp_is_empty!38607 () Bool)

(assert (=> b!1560930 (= e!869880 tp_is_empty!38607)))

(declare-fun b!1560924 () Bool)

(declare-fun res!1067304 () Bool)

(assert (=> b!1560924 (=> (not res!1067304) (not e!869884))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1560924 (= res!1067304 (validKeyInArray!0 (select (arr!50158 _keys!637) from!782)))))

(declare-fun res!1067302 () Bool)

(assert (=> start!133524 (=> (not res!1067302) (not e!869884))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133524 (= res!1067302 (validMask!0 mask!947))))

(assert (=> start!133524 e!869884))

(assert (=> start!133524 tp!112947))

(assert (=> start!133524 tp_is_empty!38607))

(assert (=> start!133524 true))

(declare-fun array_inv!38989 (array!103932) Bool)

(assert (=> start!133524 (array_inv!38989 _keys!637)))

(declare-fun array_inv!38990 (array!103934) Bool)

(assert (=> start!133524 (and (array_inv!38990 _values!487) e!869881)))

(declare-fun b!1560931 () Bool)

(assert (=> b!1560931 (= e!869882 tp_is_empty!38607)))

(declare-fun b!1560932 () Bool)

(assert (=> b!1560932 (= e!869884 false)))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!59683)

(declare-fun lt!671058 () Bool)

(declare-fun minValue!453 () V!59683)

(declare-datatypes ((tuple2!25040 0))(
  ( (tuple2!25041 (_1!12531 (_ BitVec 64)) (_2!12531 V!59683)) )
))
(declare-datatypes ((List!36414 0))(
  ( (Nil!36411) (Cons!36410 (h!37856 tuple2!25040) (t!51147 List!36414)) )
))
(declare-datatypes ((ListLongMap!22475 0))(
  ( (ListLongMap!22476 (toList!11253 List!36414)) )
))
(declare-fun contains!10243 (ListLongMap!22475 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!6637 (array!103932 array!103934 (_ BitVec 32) (_ BitVec 32) V!59683 V!59683 (_ BitVec 32) Int) ListLongMap!22475)

(assert (=> b!1560932 (= lt!671058 (contains!10243 (getCurrentListMapNoExtraKeys!6637 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!133524 res!1067302) b!1560925))

(assert (= (and b!1560925 res!1067306) b!1560929))

(assert (= (and b!1560929 res!1067303) b!1560927))

(assert (= (and b!1560927 res!1067305) b!1560926))

(assert (= (and b!1560926 res!1067307) b!1560924))

(assert (= (and b!1560924 res!1067304) b!1560932))

(assert (= (and b!1560928 condMapEmpty!59286) mapIsEmpty!59286))

(assert (= (and b!1560928 (not condMapEmpty!59286)) mapNonEmpty!59286))

(get-info :version)

(assert (= (and mapNonEmpty!59286 ((_ is ValueCellFull!18273) mapValue!59286)) b!1560930))

(assert (= (and b!1560928 ((_ is ValueCellFull!18273) mapDefault!59286)) b!1560931))

(assert (= start!133524 b!1560928))

(declare-fun m!1436601 () Bool)

(assert (=> b!1560932 m!1436601))

(assert (=> b!1560932 m!1436601))

(declare-fun m!1436603 () Bool)

(assert (=> b!1560932 m!1436603))

(declare-fun m!1436605 () Bool)

(assert (=> b!1560927 m!1436605))

(declare-fun m!1436607 () Bool)

(assert (=> b!1560924 m!1436607))

(assert (=> b!1560924 m!1436607))

(declare-fun m!1436609 () Bool)

(assert (=> b!1560924 m!1436609))

(declare-fun m!1436611 () Bool)

(assert (=> b!1560929 m!1436611))

(declare-fun m!1436613 () Bool)

(assert (=> start!133524 m!1436613))

(declare-fun m!1436615 () Bool)

(assert (=> start!133524 m!1436615))

(declare-fun m!1436617 () Bool)

(assert (=> start!133524 m!1436617))

(declare-fun m!1436619 () Bool)

(assert (=> mapNonEmpty!59286 m!1436619))

(check-sat (not b!1560927) (not b!1560929) (not b_next!31941) b_and!51397 (not start!133524) tp_is_empty!38607 (not b!1560932) (not mapNonEmpty!59286) (not b!1560924))
(check-sat b_and!51397 (not b_next!31941))
