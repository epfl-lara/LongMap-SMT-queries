; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112622 () Bool)

(assert start!112622)

(declare-fun b_free!30793 () Bool)

(declare-fun b_next!30793 () Bool)

(assert (=> start!112622 (= b_free!30793 (not b_next!30793))))

(declare-fun tp!108016 () Bool)

(declare-fun b_and!49637 () Bool)

(assert (=> start!112622 (= tp!108016 b_and!49637)))

(declare-fun b!1333878 () Bool)

(declare-fun res!884839 () Bool)

(declare-fun e!759993 () Bool)

(assert (=> b!1333878 (=> (not res!884839) (not e!759993))))

(declare-datatypes ((V!54041 0))(
  ( (V!54042 (val!18426 Int)) )
))
(declare-datatypes ((ValueCell!17453 0))(
  ( (ValueCellFull!17453 (v!21058 V!54041)) (EmptyCell!17453) )
))
(declare-datatypes ((array!90387 0))(
  ( (array!90388 (arr!43655 (Array (_ BitVec 32) ValueCell!17453)) (size!44206 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90387)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90389 0))(
  ( (array!90390 (arr!43656 (Array (_ BitVec 32) (_ BitVec 64))) (size!44207 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90389)

(assert (=> b!1333878 (= res!884839 (and (= (size!44206 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44207 _keys!1590) (size!44206 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1333879 () Bool)

(declare-fun res!884838 () Bool)

(assert (=> b!1333879 (=> (not res!884838) (not e!759993))))

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun from!1980 () (_ BitVec 32))

(assert (=> b!1333879 (= res!884838 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44207 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1333880 () Bool)

(declare-fun res!884840 () Bool)

(assert (=> b!1333880 (=> (not res!884840) (not e!759993))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90389 (_ BitVec 32)) Bool)

(assert (=> b!1333880 (= res!884840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1333881 () Bool)

(declare-fun res!884837 () Bool)

(assert (=> b!1333881 (=> (not res!884837) (not e!759993))))

(declare-datatypes ((List!30936 0))(
  ( (Nil!30933) (Cons!30932 (h!32150 (_ BitVec 64)) (t!45126 List!30936)) )
))
(declare-fun arrayNoDuplicates!0 (array!90389 (_ BitVec 32) List!30936) Bool)

(assert (=> b!1333881 (= res!884837 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30933))))

(declare-fun mapNonEmpty!56728 () Bool)

(declare-fun mapRes!56728 () Bool)

(declare-fun tp!108015 () Bool)

(declare-fun e!759994 () Bool)

(assert (=> mapNonEmpty!56728 (= mapRes!56728 (and tp!108015 e!759994))))

(declare-fun mapRest!56728 () (Array (_ BitVec 32) ValueCell!17453))

(declare-fun mapValue!56728 () ValueCell!17453)

(declare-fun mapKey!56728 () (_ BitVec 32))

(assert (=> mapNonEmpty!56728 (= (arr!43655 _values!1320) (store mapRest!56728 mapKey!56728 mapValue!56728))))

(declare-fun b!1333883 () Bool)

(assert (=> b!1333883 (= e!759993 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun lt!592518 () Bool)

(declare-fun minValue!1262 () V!54041)

(declare-fun zeroValue!1262 () V!54041)

(declare-datatypes ((tuple2!23780 0))(
  ( (tuple2!23781 (_1!11901 (_ BitVec 64)) (_2!11901 V!54041)) )
))
(declare-datatypes ((List!30937 0))(
  ( (Nil!30934) (Cons!30933 (h!32151 tuple2!23780) (t!45127 List!30937)) )
))
(declare-datatypes ((ListLongMap!21445 0))(
  ( (ListLongMap!21446 (toList!10738 List!30937)) )
))
(declare-fun contains!8914 (ListLongMap!21445 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5702 (array!90389 array!90387 (_ BitVec 32) (_ BitVec 32) V!54041 V!54041 (_ BitVec 32) Int) ListLongMap!21445)

(assert (=> b!1333883 (= lt!592518 (contains!8914 (getCurrentListMap!5702 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun mapIsEmpty!56728 () Bool)

(assert (=> mapIsEmpty!56728 mapRes!56728))

(declare-fun b!1333884 () Bool)

(declare-fun e!759991 () Bool)

(declare-fun tp_is_empty!36703 () Bool)

(assert (=> b!1333884 (= e!759991 tp_is_empty!36703)))

(declare-fun b!1333885 () Bool)

(assert (=> b!1333885 (= e!759994 tp_is_empty!36703)))

(declare-fun b!1333882 () Bool)

(declare-fun e!759992 () Bool)

(assert (=> b!1333882 (= e!759992 (and e!759991 mapRes!56728))))

(declare-fun condMapEmpty!56728 () Bool)

(declare-fun mapDefault!56728 () ValueCell!17453)

(assert (=> b!1333882 (= condMapEmpty!56728 (= (arr!43655 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17453)) mapDefault!56728)))))

(declare-fun res!884836 () Bool)

(assert (=> start!112622 (=> (not res!884836) (not e!759993))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112622 (= res!884836 (validMask!0 mask!1998))))

(assert (=> start!112622 e!759993))

(declare-fun array_inv!33201 (array!90387) Bool)

(assert (=> start!112622 (and (array_inv!33201 _values!1320) e!759992)))

(assert (=> start!112622 true))

(declare-fun array_inv!33202 (array!90389) Bool)

(assert (=> start!112622 (array_inv!33202 _keys!1590)))

(assert (=> start!112622 tp!108016))

(assert (=> start!112622 tp_is_empty!36703))

(assert (= (and start!112622 res!884836) b!1333878))

(assert (= (and b!1333878 res!884839) b!1333880))

(assert (= (and b!1333880 res!884840) b!1333881))

(assert (= (and b!1333881 res!884837) b!1333879))

(assert (= (and b!1333879 res!884838) b!1333883))

(assert (= (and b!1333882 condMapEmpty!56728) mapIsEmpty!56728))

(assert (= (and b!1333882 (not condMapEmpty!56728)) mapNonEmpty!56728))

(get-info :version)

(assert (= (and mapNonEmpty!56728 ((_ is ValueCellFull!17453) mapValue!56728)) b!1333885))

(assert (= (and b!1333882 ((_ is ValueCellFull!17453) mapDefault!56728)) b!1333884))

(assert (= start!112622 b!1333882))

(declare-fun m!1222985 () Bool)

(assert (=> b!1333883 m!1222985))

(assert (=> b!1333883 m!1222985))

(declare-fun m!1222987 () Bool)

(assert (=> b!1333883 m!1222987))

(declare-fun m!1222989 () Bool)

(assert (=> b!1333881 m!1222989))

(declare-fun m!1222991 () Bool)

(assert (=> start!112622 m!1222991))

(declare-fun m!1222993 () Bool)

(assert (=> start!112622 m!1222993))

(declare-fun m!1222995 () Bool)

(assert (=> start!112622 m!1222995))

(declare-fun m!1222997 () Bool)

(assert (=> b!1333880 m!1222997))

(declare-fun m!1222999 () Bool)

(assert (=> mapNonEmpty!56728 m!1222999))

(check-sat (not b!1333880) (not start!112622) (not b_next!30793) tp_is_empty!36703 (not mapNonEmpty!56728) (not b!1333883) (not b!1333881) b_and!49637)
(check-sat b_and!49637 (not b_next!30793))
