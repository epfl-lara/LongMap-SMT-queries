; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84010 () Bool)

(assert start!84010)

(declare-fun b_free!19651 () Bool)

(declare-fun b_next!19651 () Bool)

(assert (=> start!84010 (= b_free!19651 (not b_next!19651))))

(declare-fun tp!68395 () Bool)

(declare-fun b_and!31401 () Bool)

(assert (=> start!84010 (= tp!68395 b_and!31401)))

(declare-fun b!980339 () Bool)

(declare-fun e!552691 () Bool)

(declare-fun tp_is_empty!22645 () Bool)

(assert (=> b!980339 (= e!552691 tp_is_empty!22645)))

(declare-fun b!980340 () Bool)

(declare-fun e!552692 () Bool)

(declare-fun e!552693 () Bool)

(assert (=> b!980340 (= e!552692 (not e!552693))))

(declare-fun res!655810 () Bool)

(assert (=> b!980340 (=> res!655810 e!552693)))

(declare-datatypes ((array!61336 0))(
  ( (array!61337 (arr!29521 (Array (_ BitVec 32) (_ BitVec 64))) (size!30001 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61336)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!980340 (= res!655810 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29521 _keys!1544) from!1932)))))

(declare-datatypes ((V!35177 0))(
  ( (V!35178 (val!11373 Int)) )
))
(declare-datatypes ((tuple2!14598 0))(
  ( (tuple2!14599 (_1!7310 (_ BitVec 64)) (_2!7310 V!35177)) )
))
(declare-fun lt!434812 () tuple2!14598)

(declare-datatypes ((List!20457 0))(
  ( (Nil!20454) (Cons!20453 (h!21621 tuple2!14598) (t!29056 List!20457)) )
))
(declare-datatypes ((ListLongMap!13297 0))(
  ( (ListLongMap!13298 (toList!6664 List!20457)) )
))
(declare-fun lt!434818 () ListLongMap!13297)

(declare-fun lt!434811 () tuple2!14598)

(declare-fun lt!434820 () ListLongMap!13297)

(declare-fun +!2979 (ListLongMap!13297 tuple2!14598) ListLongMap!13297)

(assert (=> b!980340 (= (+!2979 lt!434820 lt!434812) (+!2979 lt!434818 lt!434811))))

(declare-fun lt!434813 () ListLongMap!13297)

(assert (=> b!980340 (= lt!434818 (+!2979 lt!434813 lt!434812))))

(declare-fun lt!434816 () V!35177)

(assert (=> b!980340 (= lt!434812 (tuple2!14599 (select (arr!29521 _keys!1544) from!1932) lt!434816))))

(assert (=> b!980340 (= lt!434820 (+!2979 lt!434813 lt!434811))))

(declare-fun minValue!1220 () V!35177)

(assert (=> b!980340 (= lt!434811 (tuple2!14599 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32538 0))(
  ( (Unit!32539) )
))
(declare-fun lt!434815 () Unit!32538)

(declare-fun addCommutativeForDiffKeys!586 (ListLongMap!13297 (_ BitVec 64) V!35177 (_ BitVec 64) V!35177) Unit!32538)

(assert (=> b!980340 (= lt!434815 (addCommutativeForDiffKeys!586 lt!434813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29521 _keys!1544) from!1932) lt!434816))))

(declare-datatypes ((ValueCell!10841 0))(
  ( (ValueCellFull!10841 (v!13932 V!35177)) (EmptyCell!10841) )
))
(declare-datatypes ((array!61338 0))(
  ( (array!61339 (arr!29522 (Array (_ BitVec 32) ValueCell!10841)) (size!30002 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61338)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15321 (ValueCell!10841 V!35177) V!35177)

(declare-fun dynLambda!1774 (Int (_ BitVec 64)) V!35177)

(assert (=> b!980340 (= lt!434816 (get!15321 (select (arr!29522 _values!1278) from!1932) (dynLambda!1774 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!434814 () ListLongMap!13297)

(declare-fun lt!434819 () tuple2!14598)

(assert (=> b!980340 (= lt!434813 (+!2979 lt!434814 lt!434819))))

(declare-fun zeroValue!1220 () V!35177)

(assert (=> b!980340 (= lt!434819 (tuple2!14599 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3412 (array!61336 array!61338 (_ BitVec 32) (_ BitVec 32) V!35177 V!35177 (_ BitVec 32) Int) ListLongMap!13297)

(assert (=> b!980340 (= lt!434814 (getCurrentListMapNoExtraKeys!3412 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!980341 () Bool)

(declare-fun res!655807 () Bool)

(assert (=> b!980341 (=> (not res!655807) (not e!552692))))

(assert (=> b!980341 (= res!655807 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30001 _keys!1544))))))

(declare-fun b!980342 () Bool)

(declare-fun res!655809 () Bool)

(assert (=> b!980342 (=> (not res!655809) (not e!552692))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61336 (_ BitVec 32)) Bool)

(assert (=> b!980342 (= res!655809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!980343 () Bool)

(assert (=> b!980343 (= e!552693 true)))

(assert (=> b!980343 (= lt!434818 (+!2979 (+!2979 lt!434814 lt!434812) lt!434819))))

(declare-fun lt!434817 () Unit!32538)

(assert (=> b!980343 (= lt!434817 (addCommutativeForDiffKeys!586 lt!434814 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29521 _keys!1544) from!1932) lt!434816))))

(declare-fun b!980344 () Bool)

(declare-fun res!655808 () Bool)

(assert (=> b!980344 (=> (not res!655808) (not e!552692))))

(assert (=> b!980344 (= res!655808 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!35996 () Bool)

(declare-fun mapRes!35996 () Bool)

(declare-fun tp!68396 () Bool)

(declare-fun e!552696 () Bool)

(assert (=> mapNonEmpty!35996 (= mapRes!35996 (and tp!68396 e!552696))))

(declare-fun mapRest!35996 () (Array (_ BitVec 32) ValueCell!10841))

(declare-fun mapKey!35996 () (_ BitVec 32))

(declare-fun mapValue!35996 () ValueCell!10841)

(assert (=> mapNonEmpty!35996 (= (arr!29522 _values!1278) (store mapRest!35996 mapKey!35996 mapValue!35996))))

(declare-fun mapIsEmpty!35996 () Bool)

(assert (=> mapIsEmpty!35996 mapRes!35996))

(declare-fun res!655812 () Bool)

(assert (=> start!84010 (=> (not res!655812) (not e!552692))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84010 (= res!655812 (validMask!0 mask!1948))))

(assert (=> start!84010 e!552692))

(assert (=> start!84010 true))

(assert (=> start!84010 tp_is_empty!22645))

(declare-fun e!552694 () Bool)

(declare-fun array_inv!22859 (array!61338) Bool)

(assert (=> start!84010 (and (array_inv!22859 _values!1278) e!552694)))

(assert (=> start!84010 tp!68395))

(declare-fun array_inv!22860 (array!61336) Bool)

(assert (=> start!84010 (array_inv!22860 _keys!1544)))

(declare-fun b!980345 () Bool)

(declare-fun res!655806 () Bool)

(assert (=> b!980345 (=> (not res!655806) (not e!552692))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!980345 (= res!655806 (validKeyInArray!0 (select (arr!29521 _keys!1544) from!1932)))))

(declare-fun b!980346 () Bool)

(declare-fun res!655811 () Bool)

(assert (=> b!980346 (=> (not res!655811) (not e!552692))))

(declare-datatypes ((List!20458 0))(
  ( (Nil!20455) (Cons!20454 (h!21622 (_ BitVec 64)) (t!29057 List!20458)) )
))
(declare-fun arrayNoDuplicates!0 (array!61336 (_ BitVec 32) List!20458) Bool)

(assert (=> b!980346 (= res!655811 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20455))))

(declare-fun b!980347 () Bool)

(assert (=> b!980347 (= e!552696 tp_is_empty!22645)))

(declare-fun b!980348 () Bool)

(declare-fun res!655813 () Bool)

(assert (=> b!980348 (=> (not res!655813) (not e!552692))))

(assert (=> b!980348 (= res!655813 (and (= (size!30002 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30001 _keys!1544) (size!30002 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!980349 () Bool)

(assert (=> b!980349 (= e!552694 (and e!552691 mapRes!35996))))

(declare-fun condMapEmpty!35996 () Bool)

(declare-fun mapDefault!35996 () ValueCell!10841)

(assert (=> b!980349 (= condMapEmpty!35996 (= (arr!29522 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10841)) mapDefault!35996)))))

(assert (= (and start!84010 res!655812) b!980348))

(assert (= (and b!980348 res!655813) b!980342))

(assert (= (and b!980342 res!655809) b!980346))

(assert (= (and b!980346 res!655811) b!980341))

(assert (= (and b!980341 res!655807) b!980345))

(assert (= (and b!980345 res!655806) b!980344))

(assert (= (and b!980344 res!655808) b!980340))

(assert (= (and b!980340 (not res!655810)) b!980343))

(assert (= (and b!980349 condMapEmpty!35996) mapIsEmpty!35996))

(assert (= (and b!980349 (not condMapEmpty!35996)) mapNonEmpty!35996))

(get-info :version)

(assert (= (and mapNonEmpty!35996 ((_ is ValueCellFull!10841) mapValue!35996)) b!980347))

(assert (= (and b!980349 ((_ is ValueCellFull!10841) mapDefault!35996)) b!980339))

(assert (= start!84010 b!980349))

(declare-fun b_lambda!14709 () Bool)

(assert (=> (not b_lambda!14709) (not b!980340)))

(declare-fun t!29055 () Bool)

(declare-fun tb!6449 () Bool)

(assert (=> (and start!84010 (= defaultEntry!1281 defaultEntry!1281) t!29055) tb!6449))

(declare-fun result!12895 () Bool)

(assert (=> tb!6449 (= result!12895 tp_is_empty!22645)))

(assert (=> b!980340 t!29055))

(declare-fun b_and!31403 () Bool)

(assert (= b_and!31401 (and (=> t!29055 result!12895) b_and!31403)))

(declare-fun m!908039 () Bool)

(assert (=> b!980343 m!908039))

(assert (=> b!980343 m!908039))

(declare-fun m!908041 () Bool)

(assert (=> b!980343 m!908041))

(declare-fun m!908043 () Bool)

(assert (=> b!980343 m!908043))

(assert (=> b!980343 m!908043))

(declare-fun m!908045 () Bool)

(assert (=> b!980343 m!908045))

(assert (=> b!980345 m!908043))

(assert (=> b!980345 m!908043))

(declare-fun m!908047 () Bool)

(assert (=> b!980345 m!908047))

(declare-fun m!908049 () Bool)

(assert (=> b!980340 m!908049))

(assert (=> b!980340 m!908043))

(assert (=> b!980340 m!908043))

(declare-fun m!908051 () Bool)

(assert (=> b!980340 m!908051))

(declare-fun m!908053 () Bool)

(assert (=> b!980340 m!908053))

(declare-fun m!908055 () Bool)

(assert (=> b!980340 m!908055))

(declare-fun m!908057 () Bool)

(assert (=> b!980340 m!908057))

(declare-fun m!908059 () Bool)

(assert (=> b!980340 m!908059))

(declare-fun m!908061 () Bool)

(assert (=> b!980340 m!908061))

(declare-fun m!908063 () Bool)

(assert (=> b!980340 m!908063))

(declare-fun m!908065 () Bool)

(assert (=> b!980340 m!908065))

(assert (=> b!980340 m!908059))

(assert (=> b!980340 m!908065))

(declare-fun m!908067 () Bool)

(assert (=> b!980340 m!908067))

(declare-fun m!908069 () Bool)

(assert (=> mapNonEmpty!35996 m!908069))

(declare-fun m!908071 () Bool)

(assert (=> b!980342 m!908071))

(declare-fun m!908073 () Bool)

(assert (=> start!84010 m!908073))

(declare-fun m!908075 () Bool)

(assert (=> start!84010 m!908075))

(declare-fun m!908077 () Bool)

(assert (=> start!84010 m!908077))

(declare-fun m!908079 () Bool)

(assert (=> b!980346 m!908079))

(check-sat tp_is_empty!22645 (not b!980345) (not b_lambda!14709) (not b!980343) (not mapNonEmpty!35996) b_and!31403 (not b!980340) (not b_next!19651) (not b!980346) (not start!84010) (not b!980342))
(check-sat b_and!31403 (not b_next!19651))
