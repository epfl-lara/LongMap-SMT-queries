; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84544 () Bool)

(assert start!84544)

(declare-fun b_free!19963 () Bool)

(declare-fun b_next!19963 () Bool)

(assert (=> start!84544 (= b_free!19963 (not b_next!19963))))

(declare-fun tp!69664 () Bool)

(declare-fun b_and!32007 () Bool)

(assert (=> start!84544 (= tp!69664 b_and!32007)))

(declare-fun mapNonEmpty!36797 () Bool)

(declare-fun mapRes!36797 () Bool)

(declare-fun tp!69665 () Bool)

(declare-fun e!557138 () Bool)

(assert (=> mapNonEmpty!36797 (= mapRes!36797 (and tp!69665 e!557138))))

(declare-datatypes ((V!35889 0))(
  ( (V!35890 (val!11640 Int)) )
))
(declare-datatypes ((ValueCell!11108 0))(
  ( (ValueCellFull!11108 (v!14199 V!35889)) (EmptyCell!11108) )
))
(declare-fun mapValue!36797 () ValueCell!11108)

(declare-datatypes ((array!62360 0))(
  ( (array!62361 (arr!30033 (Array (_ BitVec 32) ValueCell!11108)) (size!30513 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62360)

(declare-fun mapKey!36797 () (_ BitVec 32))

(declare-fun mapRest!36797 () (Array (_ BitVec 32) ValueCell!11108))

(assert (=> mapNonEmpty!36797 (= (arr!30033 _values!1278) (store mapRest!36797 mapKey!36797 mapValue!36797))))

(declare-fun b!987858 () Bool)

(declare-fun e!557139 () Bool)

(declare-fun tp_is_empty!23179 () Bool)

(assert (=> b!987858 (= e!557139 tp_is_empty!23179)))

(declare-fun b!987859 () Bool)

(declare-fun res!660631 () Bool)

(declare-fun e!557136 () Bool)

(assert (=> b!987859 (=> (not res!660631) (not e!557136))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!62362 0))(
  ( (array!62363 (arr!30034 (Array (_ BitVec 32) (_ BitVec 64))) (size!30514 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62362)

(assert (=> b!987859 (= res!660631 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30514 _keys!1544))))))

(declare-fun b!987860 () Bool)

(declare-fun res!660634 () Bool)

(assert (=> b!987860 (=> (not res!660634) (not e!557136))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62362 (_ BitVec 32)) Bool)

(assert (=> b!987860 (= res!660634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!987861 () Bool)

(declare-fun res!660628 () Bool)

(assert (=> b!987861 (=> (not res!660628) (not e!557136))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!987861 (= res!660628 (validKeyInArray!0 (select (arr!30034 _keys!1544) from!1932)))))

(declare-fun res!660629 () Bool)

(assert (=> start!84544 (=> (not res!660629) (not e!557136))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84544 (= res!660629 (validMask!0 mask!1948))))

(assert (=> start!84544 e!557136))

(assert (=> start!84544 true))

(assert (=> start!84544 tp_is_empty!23179))

(declare-fun e!557137 () Bool)

(declare-fun array_inv!23225 (array!62360) Bool)

(assert (=> start!84544 (and (array_inv!23225 _values!1278) e!557137)))

(assert (=> start!84544 tp!69664))

(declare-fun array_inv!23226 (array!62362) Bool)

(assert (=> start!84544 (array_inv!23226 _keys!1544)))

(declare-fun b!987862 () Bool)

(declare-fun res!660632 () Bool)

(assert (=> b!987862 (=> (not res!660632) (not e!557136))))

(declare-datatypes ((List!20755 0))(
  ( (Nil!20752) (Cons!20751 (h!21919 (_ BitVec 64)) (t!29646 List!20755)) )
))
(declare-fun arrayNoDuplicates!0 (array!62362 (_ BitVec 32) List!20755) Bool)

(assert (=> b!987862 (= res!660632 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20752))))

(declare-fun b!987863 () Bool)

(declare-fun res!660630 () Bool)

(assert (=> b!987863 (=> (not res!660630) (not e!557136))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!987863 (= res!660630 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!987864 () Bool)

(assert (=> b!987864 (= e!557138 tp_is_empty!23179)))

(declare-fun b!987865 () Bool)

(declare-fun res!660633 () Bool)

(assert (=> b!987865 (=> (not res!660633) (not e!557136))))

(assert (=> b!987865 (= res!660633 (and (= (size!30513 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30514 _keys!1544) (size!30513 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!987866 () Bool)

(assert (=> b!987866 (= e!557137 (and e!557139 mapRes!36797))))

(declare-fun condMapEmpty!36797 () Bool)

(declare-fun mapDefault!36797 () ValueCell!11108)

(assert (=> b!987866 (= condMapEmpty!36797 (= (arr!30033 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11108)) mapDefault!36797)))))

(declare-fun b!987867 () Bool)

(assert (=> b!987867 (= e!557136 (bvsge from!1932 (size!30513 _values!1278)))))

(declare-fun minValue!1220 () V!35889)

(declare-fun zeroValue!1220 () V!35889)

(declare-fun defaultEntry!1281 () Int)

(declare-datatypes ((tuple2!14848 0))(
  ( (tuple2!14849 (_1!7435 (_ BitVec 64)) (_2!7435 V!35889)) )
))
(declare-datatypes ((List!20756 0))(
  ( (Nil!20753) (Cons!20752 (h!21920 tuple2!14848) (t!29647 List!20756)) )
))
(declare-datatypes ((ListLongMap!13547 0))(
  ( (ListLongMap!13548 (toList!6789 List!20756)) )
))
(declare-fun lt!437925 () ListLongMap!13547)

(declare-fun +!3088 (ListLongMap!13547 tuple2!14848) ListLongMap!13547)

(declare-fun getCurrentListMapNoExtraKeys!3518 (array!62362 array!62360 (_ BitVec 32) (_ BitVec 32) V!35889 V!35889 (_ BitVec 32) Int) ListLongMap!13547)

(assert (=> b!987867 (= lt!437925 (+!3088 (getCurrentListMapNoExtraKeys!3518 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14849 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun mapIsEmpty!36797 () Bool)

(assert (=> mapIsEmpty!36797 mapRes!36797))

(assert (= (and start!84544 res!660629) b!987865))

(assert (= (and b!987865 res!660633) b!987860))

(assert (= (and b!987860 res!660634) b!987862))

(assert (= (and b!987862 res!660632) b!987859))

(assert (= (and b!987859 res!660631) b!987861))

(assert (= (and b!987861 res!660628) b!987863))

(assert (= (and b!987863 res!660630) b!987867))

(assert (= (and b!987866 condMapEmpty!36797) mapIsEmpty!36797))

(assert (= (and b!987866 (not condMapEmpty!36797)) mapNonEmpty!36797))

(get-info :version)

(assert (= (and mapNonEmpty!36797 ((_ is ValueCellFull!11108) mapValue!36797)) b!987864))

(assert (= (and b!987866 ((_ is ValueCellFull!11108) mapDefault!36797)) b!987858))

(assert (= start!84544 b!987866))

(declare-fun m!914897 () Bool)

(assert (=> b!987862 m!914897))

(declare-fun m!914899 () Bool)

(assert (=> mapNonEmpty!36797 m!914899))

(declare-fun m!914901 () Bool)

(assert (=> b!987861 m!914901))

(assert (=> b!987861 m!914901))

(declare-fun m!914903 () Bool)

(assert (=> b!987861 m!914903))

(declare-fun m!914905 () Bool)

(assert (=> b!987867 m!914905))

(assert (=> b!987867 m!914905))

(declare-fun m!914907 () Bool)

(assert (=> b!987867 m!914907))

(declare-fun m!914909 () Bool)

(assert (=> b!987860 m!914909))

(declare-fun m!914911 () Bool)

(assert (=> start!84544 m!914911))

(declare-fun m!914913 () Bool)

(assert (=> start!84544 m!914913))

(declare-fun m!914915 () Bool)

(assert (=> start!84544 m!914915))

(check-sat (not b!987861) (not mapNonEmpty!36797) tp_is_empty!23179 (not b_next!19963) (not b!987860) (not b!987867) (not b!987862) b_and!32007 (not start!84544))
(check-sat b_and!32007 (not b_next!19963))
