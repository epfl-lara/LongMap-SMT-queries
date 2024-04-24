; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83460 () Bool)

(assert start!83460)

(declare-fun b_free!19285 () Bool)

(declare-fun b_next!19285 () Bool)

(assert (=> start!83460 (= b_free!19285 (not b_next!19285))))

(declare-fun tp!67135 () Bool)

(declare-fun b_and!30801 () Bool)

(assert (=> start!83460 (= tp!67135 b_and!30801)))

(declare-fun b!973029 () Bool)

(declare-fun res!651042 () Bool)

(declare-fun e!548548 () Bool)

(assert (=> b!973029 (=> (not res!651042) (not e!548548))))

(declare-datatypes ((array!60438 0))(
  ( (array!60439 (arr!29078 (Array (_ BitVec 32) (_ BitVec 64))) (size!29558 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60438)

(declare-datatypes ((List!20144 0))(
  ( (Nil!20141) (Cons!20140 (h!21308 (_ BitVec 64)) (t!28519 List!20144)) )
))
(declare-fun arrayNoDuplicates!0 (array!60438 (_ BitVec 32) List!20144) Bool)

(assert (=> b!973029 (= res!651042 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20141))))

(declare-fun mapNonEmpty!35284 () Bool)

(declare-fun mapRes!35284 () Bool)

(declare-fun tp!67134 () Bool)

(declare-fun e!548550 () Bool)

(assert (=> mapNonEmpty!35284 (= mapRes!35284 (and tp!67134 e!548550))))

(declare-fun mapKey!35284 () (_ BitVec 32))

(declare-datatypes ((V!34561 0))(
  ( (V!34562 (val!11142 Int)) )
))
(declare-datatypes ((ValueCell!10610 0))(
  ( (ValueCellFull!10610 (v!13698 V!34561)) (EmptyCell!10610) )
))
(declare-fun mapRest!35284 () (Array (_ BitVec 32) ValueCell!10610))

(declare-datatypes ((array!60440 0))(
  ( (array!60441 (arr!29079 (Array (_ BitVec 32) ValueCell!10610)) (size!29559 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60440)

(declare-fun mapValue!35284 () ValueCell!10610)

(assert (=> mapNonEmpty!35284 (= (arr!29079 _values!1425) (store mapRest!35284 mapKey!35284 mapValue!35284))))

(declare-fun b!973031 () Bool)

(declare-fun tp_is_empty!22183 () Bool)

(assert (=> b!973031 (= e!548550 tp_is_empty!22183)))

(declare-fun b!973032 () Bool)

(declare-fun e!548551 () Bool)

(assert (=> b!973032 (= e!548551 (not true))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((tuple2!14294 0))(
  ( (tuple2!14295 (_1!7158 (_ BitVec 64)) (_2!7158 V!34561)) )
))
(declare-datatypes ((List!20145 0))(
  ( (Nil!20142) (Cons!20141 (h!21309 tuple2!14294) (t!28520 List!20145)) )
))
(declare-datatypes ((ListLongMap!12993 0))(
  ( (ListLongMap!12994 (toList!6512 List!20145)) )
))
(declare-fun lt!432317 () ListLongMap!12993)

(declare-fun zeroValue!1367 () V!34561)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34561)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun lt!432318 () (_ BitVec 64))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun +!2891 (ListLongMap!12993 tuple2!14294) ListLongMap!12993)

(declare-fun getCurrentListMap!3745 (array!60438 array!60440 (_ BitVec 32) (_ BitVec 32) V!34561 V!34561 (_ BitVec 32) Int) ListLongMap!12993)

(declare-fun get!15078 (ValueCell!10610 V!34561) V!34561)

(declare-fun dynLambda!1688 (Int (_ BitVec 64)) V!34561)

(assert (=> b!973032 (= lt!432317 (+!2891 (getCurrentListMap!3745 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14295 lt!432318 (get!15078 (select (arr!29079 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1688 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32346 0))(
  ( (Unit!32347) )
))
(declare-fun lt!432316 () Unit!32346)

(declare-fun lemmaListMapRecursiveValidKeyArray!247 (array!60438 array!60440 (_ BitVec 32) (_ BitVec 32) V!34561 V!34561 (_ BitVec 32) Int) Unit!32346)

(assert (=> b!973032 (= lt!432316 (lemmaListMapRecursiveValidKeyArray!247 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973033 () Bool)

(declare-fun e!548546 () Bool)

(assert (=> b!973033 (= e!548546 tp_is_empty!22183)))

(declare-fun b!973034 () Bool)

(declare-fun res!651037 () Bool)

(assert (=> b!973034 (=> (not res!651037) (not e!548548))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60438 (_ BitVec 32)) Bool)

(assert (=> b!973034 (= res!651037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!973035 () Bool)

(declare-fun res!651039 () Bool)

(assert (=> b!973035 (=> (not res!651039) (not e!548548))))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!973035 (= res!651039 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29558 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29558 _keys!1717))))))

(declare-fun b!973036 () Bool)

(assert (=> b!973036 (= e!548548 e!548551)))

(declare-fun res!651043 () Bool)

(assert (=> b!973036 (=> (not res!651043) (not e!548551))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!973036 (= res!651043 (validKeyInArray!0 lt!432318))))

(assert (=> b!973036 (= lt!432318 (select (arr!29078 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!973036 (= lt!432317 (getCurrentListMap!3745 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973037 () Bool)

(declare-fun res!651038 () Bool)

(assert (=> b!973037 (=> (not res!651038) (not e!548548))))

(assert (=> b!973037 (= res!651038 (and (= (size!29559 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29558 _keys!1717) (size!29559 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!973038 () Bool)

(declare-fun res!651044 () Bool)

(assert (=> b!973038 (=> (not res!651044) (not e!548548))))

(declare-fun contains!5624 (ListLongMap!12993 (_ BitVec 64)) Bool)

(assert (=> b!973038 (= res!651044 (contains!5624 (getCurrentListMap!3745 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29078 _keys!1717) i!822)))))

(declare-fun b!973039 () Bool)

(declare-fun res!651041 () Bool)

(assert (=> b!973039 (=> (not res!651041) (not e!548548))))

(assert (=> b!973039 (= res!651041 (validKeyInArray!0 (select (arr!29078 _keys!1717) i!822)))))

(declare-fun mapIsEmpty!35284 () Bool)

(assert (=> mapIsEmpty!35284 mapRes!35284))

(declare-fun res!651040 () Bool)

(assert (=> start!83460 (=> (not res!651040) (not e!548548))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83460 (= res!651040 (validMask!0 mask!2147))))

(assert (=> start!83460 e!548548))

(assert (=> start!83460 true))

(declare-fun e!548547 () Bool)

(declare-fun array_inv!22551 (array!60440) Bool)

(assert (=> start!83460 (and (array_inv!22551 _values!1425) e!548547)))

(assert (=> start!83460 tp_is_empty!22183))

(assert (=> start!83460 tp!67135))

(declare-fun array_inv!22552 (array!60438) Bool)

(assert (=> start!83460 (array_inv!22552 _keys!1717)))

(declare-fun b!973030 () Bool)

(assert (=> b!973030 (= e!548547 (and e!548546 mapRes!35284))))

(declare-fun condMapEmpty!35284 () Bool)

(declare-fun mapDefault!35284 () ValueCell!10610)

(assert (=> b!973030 (= condMapEmpty!35284 (= (arr!29079 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10610)) mapDefault!35284)))))

(assert (= (and start!83460 res!651040) b!973037))

(assert (= (and b!973037 res!651038) b!973034))

(assert (= (and b!973034 res!651037) b!973029))

(assert (= (and b!973029 res!651042) b!973035))

(assert (= (and b!973035 res!651039) b!973039))

(assert (= (and b!973039 res!651041) b!973038))

(assert (= (and b!973038 res!651044) b!973036))

(assert (= (and b!973036 res!651043) b!973032))

(assert (= (and b!973030 condMapEmpty!35284) mapIsEmpty!35284))

(assert (= (and b!973030 (not condMapEmpty!35284)) mapNonEmpty!35284))

(get-info :version)

(assert (= (and mapNonEmpty!35284 ((_ is ValueCellFull!10610) mapValue!35284)) b!973031))

(assert (= (and b!973030 ((_ is ValueCellFull!10610) mapDefault!35284)) b!973033))

(assert (= start!83460 b!973030))

(declare-fun b_lambda!14463 () Bool)

(assert (=> (not b_lambda!14463) (not b!973032)))

(declare-fun t!28518 () Bool)

(declare-fun tb!6225 () Bool)

(assert (=> (and start!83460 (= defaultEntry!1428 defaultEntry!1428) t!28518) tb!6225))

(declare-fun result!12435 () Bool)

(assert (=> tb!6225 (= result!12435 tp_is_empty!22183)))

(assert (=> b!973032 t!28518))

(declare-fun b_and!30803 () Bool)

(assert (= b_and!30801 (and (=> t!28518 result!12435) b_and!30803)))

(declare-fun m!900803 () Bool)

(assert (=> b!973029 m!900803))

(declare-fun m!900805 () Bool)

(assert (=> mapNonEmpty!35284 m!900805))

(declare-fun m!900807 () Bool)

(assert (=> b!973038 m!900807))

(declare-fun m!900809 () Bool)

(assert (=> b!973038 m!900809))

(assert (=> b!973038 m!900807))

(assert (=> b!973038 m!900809))

(declare-fun m!900811 () Bool)

(assert (=> b!973038 m!900811))

(declare-fun m!900813 () Bool)

(assert (=> b!973036 m!900813))

(declare-fun m!900815 () Bool)

(assert (=> b!973036 m!900815))

(declare-fun m!900817 () Bool)

(assert (=> b!973036 m!900817))

(declare-fun m!900819 () Bool)

(assert (=> start!83460 m!900819))

(declare-fun m!900821 () Bool)

(assert (=> start!83460 m!900821))

(declare-fun m!900823 () Bool)

(assert (=> start!83460 m!900823))

(assert (=> b!973039 m!900809))

(assert (=> b!973039 m!900809))

(declare-fun m!900825 () Bool)

(assert (=> b!973039 m!900825))

(declare-fun m!900827 () Bool)

(assert (=> b!973032 m!900827))

(declare-fun m!900829 () Bool)

(assert (=> b!973032 m!900829))

(declare-fun m!900831 () Bool)

(assert (=> b!973032 m!900831))

(assert (=> b!973032 m!900829))

(declare-fun m!900833 () Bool)

(assert (=> b!973032 m!900833))

(assert (=> b!973032 m!900827))

(assert (=> b!973032 m!900831))

(declare-fun m!900835 () Bool)

(assert (=> b!973032 m!900835))

(declare-fun m!900837 () Bool)

(assert (=> b!973032 m!900837))

(declare-fun m!900839 () Bool)

(assert (=> b!973034 m!900839))

(check-sat (not start!83460) b_and!30803 (not b_next!19285) (not b!973039) (not b!973036) (not b_lambda!14463) tp_is_empty!22183 (not b!973038) (not mapNonEmpty!35284) (not b!973034) (not b!973029) (not b!973032))
(check-sat b_and!30803 (not b_next!19285))
