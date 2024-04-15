; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112536 () Bool)

(assert start!112536)

(declare-fun b_free!30931 () Bool)

(declare-fun b_next!30931 () Bool)

(assert (=> start!112536 (= b_free!30931 (not b_next!30931))))

(declare-fun tp!108431 () Bool)

(declare-fun b_and!49821 () Bool)

(assert (=> start!112536 (= tp!108431 b_and!49821)))

(declare-fun b!1334816 () Bool)

(declare-fun res!885913 () Bool)

(declare-fun e!760234 () Bool)

(assert (=> b!1334816 (=> (not res!885913) (not e!760234))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90491 0))(
  ( (array!90492 (arr!43712 (Array (_ BitVec 32) (_ BitVec 64))) (size!44264 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90491)

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1334816 (= res!885913 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44264 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!56935 () Bool)

(declare-fun mapRes!56935 () Bool)

(declare-fun tp!108430 () Bool)

(declare-fun e!760230 () Bool)

(assert (=> mapNonEmpty!56935 (= mapRes!56935 (and tp!108430 e!760230))))

(declare-datatypes ((V!54225 0))(
  ( (V!54226 (val!18495 Int)) )
))
(declare-datatypes ((ValueCell!17522 0))(
  ( (ValueCellFull!17522 (v!21131 V!54225)) (EmptyCell!17522) )
))
(declare-datatypes ((array!90493 0))(
  ( (array!90494 (arr!43713 (Array (_ BitVec 32) ValueCell!17522)) (size!44265 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90493)

(declare-fun mapKey!56935 () (_ BitVec 32))

(declare-fun mapRest!56935 () (Array (_ BitVec 32) ValueCell!17522))

(declare-fun mapValue!56935 () ValueCell!17522)

(assert (=> mapNonEmpty!56935 (= (arr!43713 _values!1320) (store mapRest!56935 mapKey!56935 mapValue!56935))))

(declare-fun b!1334817 () Bool)

(declare-fun res!885910 () Bool)

(assert (=> b!1334817 (=> (not res!885910) (not e!760234))))

(declare-fun mask!1998 () (_ BitVec 32))

(assert (=> b!1334817 (= res!885910 (and (= (size!44265 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44264 _keys!1590) (size!44265 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1334818 () Bool)

(declare-fun e!760233 () Bool)

(declare-fun e!760231 () Bool)

(assert (=> b!1334818 (= e!760233 (and e!760231 mapRes!56935))))

(declare-fun condMapEmpty!56935 () Bool)

(declare-fun mapDefault!56935 () ValueCell!17522)

(assert (=> b!1334818 (= condMapEmpty!56935 (= (arr!43713 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17522)) mapDefault!56935)))))

(declare-fun res!885912 () Bool)

(assert (=> start!112536 (=> (not res!885912) (not e!760234))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112536 (= res!885912 (validMask!0 mask!1998))))

(assert (=> start!112536 e!760234))

(declare-fun array_inv!33165 (array!90493) Bool)

(assert (=> start!112536 (and (array_inv!33165 _values!1320) e!760233)))

(assert (=> start!112536 true))

(declare-fun array_inv!33166 (array!90491) Bool)

(assert (=> start!112536 (array_inv!33166 _keys!1590)))

(assert (=> start!112536 tp!108431))

(declare-fun tp_is_empty!36841 () Bool)

(assert (=> start!112536 tp_is_empty!36841))

(declare-fun b!1334819 () Bool)

(declare-fun res!885909 () Bool)

(assert (=> b!1334819 (=> (not res!885909) (not e!760234))))

(declare-datatypes ((List!31048 0))(
  ( (Nil!31045) (Cons!31044 (h!32253 (_ BitVec 64)) (t!45304 List!31048)) )
))
(declare-fun arrayNoDuplicates!0 (array!90491 (_ BitVec 32) List!31048) Bool)

(assert (=> b!1334819 (= res!885909 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31045))))

(declare-fun b!1334820 () Bool)

(assert (=> b!1334820 (= e!760231 tp_is_empty!36841)))

(declare-fun b!1334821 () Bool)

(assert (=> b!1334821 (= e!760234 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun lt!592216 () Bool)

(declare-fun minValue!1262 () V!54225)

(declare-fun zeroValue!1262 () V!54225)

(declare-datatypes ((tuple2!23910 0))(
  ( (tuple2!23911 (_1!11966 (_ BitVec 64)) (_2!11966 V!54225)) )
))
(declare-datatypes ((List!31049 0))(
  ( (Nil!31046) (Cons!31045 (h!32254 tuple2!23910) (t!45305 List!31049)) )
))
(declare-datatypes ((ListLongMap!21567 0))(
  ( (ListLongMap!21568 (toList!10799 List!31049)) )
))
(declare-fun contains!8891 (ListLongMap!21567 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5653 (array!90491 array!90493 (_ BitVec 32) (_ BitVec 32) V!54225 V!54225 (_ BitVec 32) Int) ListLongMap!21567)

(assert (=> b!1334821 (= lt!592216 (contains!8891 (getCurrentListMap!5653 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun mapIsEmpty!56935 () Bool)

(assert (=> mapIsEmpty!56935 mapRes!56935))

(declare-fun b!1334822 () Bool)

(declare-fun res!885911 () Bool)

(assert (=> b!1334822 (=> (not res!885911) (not e!760234))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90491 (_ BitVec 32)) Bool)

(assert (=> b!1334822 (= res!885911 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1334823 () Bool)

(assert (=> b!1334823 (= e!760230 tp_is_empty!36841)))

(assert (= (and start!112536 res!885912) b!1334817))

(assert (= (and b!1334817 res!885910) b!1334822))

(assert (= (and b!1334822 res!885911) b!1334819))

(assert (= (and b!1334819 res!885909) b!1334816))

(assert (= (and b!1334816 res!885913) b!1334821))

(assert (= (and b!1334818 condMapEmpty!56935) mapIsEmpty!56935))

(assert (= (and b!1334818 (not condMapEmpty!56935)) mapNonEmpty!56935))

(get-info :version)

(assert (= (and mapNonEmpty!56935 ((_ is ValueCellFull!17522) mapValue!56935)) b!1334823))

(assert (= (and b!1334818 ((_ is ValueCellFull!17522) mapDefault!56935)) b!1334820))

(assert (= start!112536 b!1334818))

(declare-fun m!1222623 () Bool)

(assert (=> start!112536 m!1222623))

(declare-fun m!1222625 () Bool)

(assert (=> start!112536 m!1222625))

(declare-fun m!1222627 () Bool)

(assert (=> start!112536 m!1222627))

(declare-fun m!1222629 () Bool)

(assert (=> b!1334821 m!1222629))

(assert (=> b!1334821 m!1222629))

(declare-fun m!1222631 () Bool)

(assert (=> b!1334821 m!1222631))

(declare-fun m!1222633 () Bool)

(assert (=> b!1334819 m!1222633))

(declare-fun m!1222635 () Bool)

(assert (=> mapNonEmpty!56935 m!1222635))

(declare-fun m!1222637 () Bool)

(assert (=> b!1334822 m!1222637))

(check-sat (not b!1334821) (not b_next!30931) (not mapNonEmpty!56935) (not b!1334819) tp_is_empty!36841 (not b!1334822) (not start!112536) b_and!49821)
(check-sat b_and!49821 (not b_next!30931))
