; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112952 () Bool)

(assert start!112952)

(declare-fun b_free!31039 () Bool)

(declare-fun b_next!31039 () Bool)

(assert (=> start!112952 (= b_free!31039 (not b_next!31039))))

(declare-fun tp!108761 () Bool)

(declare-fun b_and!50019 () Bool)

(assert (=> start!112952 (= tp!108761 b_and!50019)))

(declare-fun b!1338497 () Bool)

(declare-fun res!887901 () Bool)

(declare-fun e!762282 () Bool)

(assert (=> b!1338497 (=> (not res!887901) (not e!762282))))

(declare-datatypes ((array!90873 0))(
  ( (array!90874 (arr!43896 (Array (_ BitVec 32) (_ BitVec 64))) (size!44447 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90873)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun from!1980 () (_ BitVec 32))

(assert (=> b!1338497 (= res!887901 (not (= (select (arr!43896 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1338498 () Bool)

(declare-fun res!887903 () Bool)

(assert (=> b!1338498 (=> (not res!887903) (not e!762282))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90873 (_ BitVec 32)) Bool)

(assert (=> b!1338498 (= res!887903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1338499 () Bool)

(declare-fun e!762283 () Bool)

(declare-fun e!762280 () Bool)

(declare-fun mapRes!57104 () Bool)

(assert (=> b!1338499 (= e!762283 (and e!762280 mapRes!57104))))

(declare-fun condMapEmpty!57104 () Bool)

(declare-datatypes ((V!54369 0))(
  ( (V!54370 (val!18549 Int)) )
))
(declare-datatypes ((ValueCell!17576 0))(
  ( (ValueCellFull!17576 (v!21185 V!54369)) (EmptyCell!17576) )
))
(declare-datatypes ((array!90875 0))(
  ( (array!90876 (arr!43897 (Array (_ BitVec 32) ValueCell!17576)) (size!44448 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90875)

(declare-fun mapDefault!57104 () ValueCell!17576)

(assert (=> b!1338499 (= condMapEmpty!57104 (= (arr!43897 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17576)) mapDefault!57104)))))

(declare-fun b!1338500 () Bool)

(declare-fun tp_is_empty!36949 () Bool)

(assert (=> b!1338500 (= e!762280 tp_is_empty!36949)))

(declare-fun b!1338501 () Bool)

(declare-fun e!762281 () Bool)

(assert (=> b!1338501 (= e!762281 tp_is_empty!36949)))

(declare-fun b!1338502 () Bool)

(declare-fun res!887900 () Bool)

(assert (=> b!1338502 (=> (not res!887900) (not e!762282))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54369)

(declare-fun zeroValue!1262 () V!54369)

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((tuple2!23972 0))(
  ( (tuple2!23973 (_1!11997 (_ BitVec 64)) (_2!11997 V!54369)) )
))
(declare-datatypes ((List!31113 0))(
  ( (Nil!31110) (Cons!31109 (h!32327 tuple2!23972) (t!45417 List!31113)) )
))
(declare-datatypes ((ListLongMap!21637 0))(
  ( (ListLongMap!21638 (toList!10834 List!31113)) )
))
(declare-fun contains!9013 (ListLongMap!21637 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5788 (array!90873 array!90875 (_ BitVec 32) (_ BitVec 32) V!54369 V!54369 (_ BitVec 32) Int) ListLongMap!21637)

(assert (=> b!1338502 (= res!887900 (contains!9013 (getCurrentListMap!5788 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1338503 () Bool)

(declare-fun res!887904 () Bool)

(assert (=> b!1338503 (=> (not res!887904) (not e!762282))))

(assert (=> b!1338503 (= res!887904 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44447 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!57104 () Bool)

(declare-fun tp!108760 () Bool)

(assert (=> mapNonEmpty!57104 (= mapRes!57104 (and tp!108760 e!762281))))

(declare-fun mapKey!57104 () (_ BitVec 32))

(declare-fun mapValue!57104 () ValueCell!17576)

(declare-fun mapRest!57104 () (Array (_ BitVec 32) ValueCell!17576))

(assert (=> mapNonEmpty!57104 (= (arr!43897 _values!1320) (store mapRest!57104 mapKey!57104 mapValue!57104))))

(declare-fun b!1338504 () Bool)

(declare-fun res!887899 () Bool)

(assert (=> b!1338504 (=> (not res!887899) (not e!762282))))

(assert (=> b!1338504 (= res!887899 (and (= (size!44448 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44447 _keys!1590) (size!44448 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun res!887902 () Bool)

(assert (=> start!112952 (=> (not res!887902) (not e!762282))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112952 (= res!887902 (validMask!0 mask!1998))))

(assert (=> start!112952 e!762282))

(declare-fun array_inv!33367 (array!90875) Bool)

(assert (=> start!112952 (and (array_inv!33367 _values!1320) e!762283)))

(assert (=> start!112952 true))

(declare-fun array_inv!33368 (array!90873) Bool)

(assert (=> start!112952 (array_inv!33368 _keys!1590)))

(assert (=> start!112952 tp!108761))

(assert (=> start!112952 tp_is_empty!36949))

(declare-fun b!1338505 () Bool)

(declare-fun res!887898 () Bool)

(assert (=> b!1338505 (=> (not res!887898) (not e!762282))))

(declare-datatypes ((List!31114 0))(
  ( (Nil!31111) (Cons!31110 (h!32328 (_ BitVec 64)) (t!45418 List!31114)) )
))
(declare-fun arrayNoDuplicates!0 (array!90873 (_ BitVec 32) List!31114) Bool)

(assert (=> b!1338505 (= res!887898 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31111))))

(declare-fun b!1338506 () Bool)

(assert (=> b!1338506 (= e!762282 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1980 (size!44448 _values!1320))))))

(declare-fun mapIsEmpty!57104 () Bool)

(assert (=> mapIsEmpty!57104 mapRes!57104))

(declare-fun b!1338507 () Bool)

(declare-fun res!887905 () Bool)

(assert (=> b!1338507 (=> (not res!887905) (not e!762282))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1338507 (= res!887905 (validKeyInArray!0 (select (arr!43896 _keys!1590) from!1980)))))

(assert (= (and start!112952 res!887902) b!1338504))

(assert (= (and b!1338504 res!887899) b!1338498))

(assert (= (and b!1338498 res!887903) b!1338505))

(assert (= (and b!1338505 res!887898) b!1338503))

(assert (= (and b!1338503 res!887904) b!1338502))

(assert (= (and b!1338502 res!887900) b!1338497))

(assert (= (and b!1338497 res!887901) b!1338507))

(assert (= (and b!1338507 res!887905) b!1338506))

(assert (= (and b!1338499 condMapEmpty!57104) mapIsEmpty!57104))

(assert (= (and b!1338499 (not condMapEmpty!57104)) mapNonEmpty!57104))

(get-info :version)

(assert (= (and mapNonEmpty!57104 ((_ is ValueCellFull!17576) mapValue!57104)) b!1338501))

(assert (= (and b!1338499 ((_ is ValueCellFull!17576) mapDefault!57104)) b!1338500))

(assert (= start!112952 b!1338499))

(declare-fun m!1226893 () Bool)

(assert (=> b!1338498 m!1226893))

(declare-fun m!1226895 () Bool)

(assert (=> b!1338507 m!1226895))

(assert (=> b!1338507 m!1226895))

(declare-fun m!1226897 () Bool)

(assert (=> b!1338507 m!1226897))

(declare-fun m!1226899 () Bool)

(assert (=> b!1338505 m!1226899))

(assert (=> b!1338497 m!1226895))

(declare-fun m!1226901 () Bool)

(assert (=> mapNonEmpty!57104 m!1226901))

(declare-fun m!1226903 () Bool)

(assert (=> b!1338502 m!1226903))

(assert (=> b!1338502 m!1226903))

(declare-fun m!1226905 () Bool)

(assert (=> b!1338502 m!1226905))

(declare-fun m!1226907 () Bool)

(assert (=> start!112952 m!1226907))

(declare-fun m!1226909 () Bool)

(assert (=> start!112952 m!1226909))

(declare-fun m!1226911 () Bool)

(assert (=> start!112952 m!1226911))

(check-sat (not mapNonEmpty!57104) (not b!1338507) (not b_next!31039) (not start!112952) (not b!1338498) tp_is_empty!36949 b_and!50019 (not b!1338502) (not b!1338505))
(check-sat b_and!50019 (not b_next!31039))
