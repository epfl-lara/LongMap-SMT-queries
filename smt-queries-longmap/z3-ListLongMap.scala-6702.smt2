; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84166 () Bool)

(assert start!84166)

(declare-fun b_free!19885 () Bool)

(declare-fun b_next!19885 () Bool)

(assert (=> start!84166 (= b_free!19885 (not b_next!19885))))

(declare-fun tp!69259 () Bool)

(declare-fun b_and!31821 () Bool)

(assert (=> start!84166 (= tp!69259 b_and!31821)))

(declare-fun b!984288 () Bool)

(declare-fun e!554859 () Bool)

(declare-fun e!554864 () Bool)

(assert (=> b!984288 (= e!554859 e!554864)))

(declare-fun res!658683 () Bool)

(assert (=> b!984288 (=> (not res!658683) (not e!554864))))

(declare-datatypes ((array!61882 0))(
  ( (array!61883 (arr!29799 (Array (_ BitVec 32) (_ BitVec 64))) (size!30280 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61882)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!984288 (= res!658683 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29799 _keys!1544) from!1932))))))

(declare-datatypes ((V!35633 0))(
  ( (V!35634 (val!11544 Int)) )
))
(declare-datatypes ((ValueCell!11012 0))(
  ( (ValueCellFull!11012 (v!14105 V!35633)) (EmptyCell!11012) )
))
(declare-datatypes ((array!61884 0))(
  ( (array!61885 (arr!29800 (Array (_ BitVec 32) ValueCell!11012)) (size!30281 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61884)

(declare-fun lt!436617 () V!35633)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15475 (ValueCell!11012 V!35633) V!35633)

(declare-fun dynLambda!1813 (Int (_ BitVec 64)) V!35633)

(assert (=> b!984288 (= lt!436617 (get!15475 (select (arr!29800 _values!1278) from!1932) (dynLambda!1813 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!35633)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35633)

(declare-datatypes ((tuple2!14840 0))(
  ( (tuple2!14841 (_1!7431 (_ BitVec 64)) (_2!7431 V!35633)) )
))
(declare-datatypes ((List!20692 0))(
  ( (Nil!20689) (Cons!20688 (h!21850 tuple2!14840) (t!29512 List!20692)) )
))
(declare-datatypes ((ListLongMap!13527 0))(
  ( (ListLongMap!13528 (toList!6779 List!20692)) )
))
(declare-fun lt!436618 () ListLongMap!13527)

(declare-fun getCurrentListMapNoExtraKeys!3485 (array!61882 array!61884 (_ BitVec 32) (_ BitVec 32) V!35633 V!35633 (_ BitVec 32) Int) ListLongMap!13527)

(assert (=> b!984288 (= lt!436618 (getCurrentListMapNoExtraKeys!3485 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!984289 () Bool)

(declare-fun e!554863 () Bool)

(declare-fun tp_is_empty!22987 () Bool)

(assert (=> b!984289 (= e!554863 tp_is_empty!22987)))

(declare-fun b!984290 () Bool)

(declare-fun e!554860 () Bool)

(declare-fun mapRes!36509 () Bool)

(assert (=> b!984290 (= e!554860 (and e!554863 mapRes!36509))))

(declare-fun condMapEmpty!36509 () Bool)

(declare-fun mapDefault!36509 () ValueCell!11012)

(assert (=> b!984290 (= condMapEmpty!36509 (= (arr!29800 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11012)) mapDefault!36509)))))

(declare-fun b!984291 () Bool)

(assert (=> b!984291 (= e!554864 (not true))))

(declare-fun lt!436620 () tuple2!14840)

(declare-fun lt!436616 () tuple2!14840)

(declare-fun +!3061 (ListLongMap!13527 tuple2!14840) ListLongMap!13527)

(assert (=> b!984291 (= (+!3061 (+!3061 lt!436618 lt!436620) lt!436616) (+!3061 (+!3061 lt!436618 lt!436616) lt!436620))))

(assert (=> b!984291 (= lt!436616 (tuple2!14841 (select (arr!29799 _keys!1544) from!1932) lt!436617))))

(assert (=> b!984291 (= lt!436620 (tuple2!14841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32588 0))(
  ( (Unit!32589) )
))
(declare-fun lt!436619 () Unit!32588)

(declare-fun addCommutativeForDiffKeys!665 (ListLongMap!13527 (_ BitVec 64) V!35633 (_ BitVec 64) V!35633) Unit!32588)

(assert (=> b!984291 (= lt!436619 (addCommutativeForDiffKeys!665 lt!436618 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29799 _keys!1544) from!1932) lt!436617))))

(declare-fun b!984292 () Bool)

(declare-fun res!658685 () Bool)

(assert (=> b!984292 (=> (not res!658685) (not e!554859))))

(assert (=> b!984292 (= res!658685 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30280 _keys!1544))))))

(declare-fun b!984293 () Bool)

(declare-fun res!658686 () Bool)

(assert (=> b!984293 (=> (not res!658686) (not e!554859))))

(assert (=> b!984293 (= res!658686 (and (= (size!30281 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30280 _keys!1544) (size!30281 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!984294 () Bool)

(declare-fun res!658689 () Bool)

(assert (=> b!984294 (=> (not res!658689) (not e!554859))))

(assert (=> b!984294 (= res!658689 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!36509 () Bool)

(declare-fun tp!69260 () Bool)

(declare-fun e!554861 () Bool)

(assert (=> mapNonEmpty!36509 (= mapRes!36509 (and tp!69260 e!554861))))

(declare-fun mapRest!36509 () (Array (_ BitVec 32) ValueCell!11012))

(declare-fun mapKey!36509 () (_ BitVec 32))

(declare-fun mapValue!36509 () ValueCell!11012)

(assert (=> mapNonEmpty!36509 (= (arr!29800 _values!1278) (store mapRest!36509 mapKey!36509 mapValue!36509))))

(declare-fun res!658688 () Bool)

(assert (=> start!84166 (=> (not res!658688) (not e!554859))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84166 (= res!658688 (validMask!0 mask!1948))))

(assert (=> start!84166 e!554859))

(assert (=> start!84166 true))

(assert (=> start!84166 tp_is_empty!22987))

(declare-fun array_inv!23041 (array!61884) Bool)

(assert (=> start!84166 (and (array_inv!23041 _values!1278) e!554860)))

(assert (=> start!84166 tp!69259))

(declare-fun array_inv!23042 (array!61882) Bool)

(assert (=> start!84166 (array_inv!23042 _keys!1544)))

(declare-fun mapIsEmpty!36509 () Bool)

(assert (=> mapIsEmpty!36509 mapRes!36509))

(declare-fun b!984295 () Bool)

(declare-fun res!658682 () Bool)

(assert (=> b!984295 (=> (not res!658682) (not e!554859))))

(declare-datatypes ((List!20693 0))(
  ( (Nil!20690) (Cons!20689 (h!21851 (_ BitVec 64)) (t!29513 List!20693)) )
))
(declare-fun arrayNoDuplicates!0 (array!61882 (_ BitVec 32) List!20693) Bool)

(assert (=> b!984295 (= res!658682 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20690))))

(declare-fun b!984296 () Bool)

(declare-fun res!658687 () Bool)

(assert (=> b!984296 (=> (not res!658687) (not e!554859))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!984296 (= res!658687 (validKeyInArray!0 (select (arr!29799 _keys!1544) from!1932)))))

(declare-fun b!984297 () Bool)

(declare-fun res!658684 () Bool)

(assert (=> b!984297 (=> (not res!658684) (not e!554859))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61882 (_ BitVec 32)) Bool)

(assert (=> b!984297 (= res!658684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!984298 () Bool)

(assert (=> b!984298 (= e!554861 tp_is_empty!22987)))

(assert (= (and start!84166 res!658688) b!984293))

(assert (= (and b!984293 res!658686) b!984297))

(assert (= (and b!984297 res!658684) b!984295))

(assert (= (and b!984295 res!658682) b!984292))

(assert (= (and b!984292 res!658685) b!984296))

(assert (= (and b!984296 res!658687) b!984294))

(assert (= (and b!984294 res!658689) b!984288))

(assert (= (and b!984288 res!658683) b!984291))

(assert (= (and b!984290 condMapEmpty!36509) mapIsEmpty!36509))

(assert (= (and b!984290 (not condMapEmpty!36509)) mapNonEmpty!36509))

(get-info :version)

(assert (= (and mapNonEmpty!36509 ((_ is ValueCellFull!11012) mapValue!36509)) b!984298))

(assert (= (and b!984290 ((_ is ValueCellFull!11012) mapDefault!36509)) b!984289))

(assert (= start!84166 b!984290))

(declare-fun b_lambda!14899 () Bool)

(assert (=> (not b_lambda!14899) (not b!984288)))

(declare-fun t!29511 () Bool)

(declare-fun tb!6671 () Bool)

(assert (=> (and start!84166 (= defaultEntry!1281 defaultEntry!1281) t!29511) tb!6671))

(declare-fun result!13339 () Bool)

(assert (=> tb!6671 (= result!13339 tp_is_empty!22987)))

(assert (=> b!984288 t!29511))

(declare-fun b_and!31823 () Bool)

(assert (= b_and!31821 (and (=> t!29511 result!13339) b_and!31823)))

(declare-fun m!910853 () Bool)

(assert (=> b!984295 m!910853))

(declare-fun m!910855 () Bool)

(assert (=> b!984297 m!910855))

(declare-fun m!910857 () Bool)

(assert (=> b!984291 m!910857))

(declare-fun m!910859 () Bool)

(assert (=> b!984291 m!910859))

(declare-fun m!910861 () Bool)

(assert (=> b!984291 m!910861))

(assert (=> b!984291 m!910857))

(declare-fun m!910863 () Bool)

(assert (=> b!984291 m!910863))

(assert (=> b!984291 m!910861))

(declare-fun m!910865 () Bool)

(assert (=> b!984291 m!910865))

(assert (=> b!984291 m!910859))

(declare-fun m!910867 () Bool)

(assert (=> b!984291 m!910867))

(declare-fun m!910869 () Bool)

(assert (=> start!84166 m!910869))

(declare-fun m!910871 () Bool)

(assert (=> start!84166 m!910871))

(declare-fun m!910873 () Bool)

(assert (=> start!84166 m!910873))

(declare-fun m!910875 () Bool)

(assert (=> mapNonEmpty!36509 m!910875))

(assert (=> b!984288 m!910861))

(declare-fun m!910877 () Bool)

(assert (=> b!984288 m!910877))

(declare-fun m!910879 () Bool)

(assert (=> b!984288 m!910879))

(declare-fun m!910881 () Bool)

(assert (=> b!984288 m!910881))

(assert (=> b!984288 m!910877))

(assert (=> b!984288 m!910881))

(declare-fun m!910883 () Bool)

(assert (=> b!984288 m!910883))

(assert (=> b!984296 m!910861))

(assert (=> b!984296 m!910861))

(declare-fun m!910885 () Bool)

(assert (=> b!984296 m!910885))

(check-sat (not b!984295) (not b!984288) (not b_lambda!14899) (not b!984296) (not b!984291) (not mapNonEmpty!36509) b_and!31823 (not b_next!19885) tp_is_empty!22987 (not start!84166) (not b!984297))
(check-sat b_and!31823 (not b_next!19885))
