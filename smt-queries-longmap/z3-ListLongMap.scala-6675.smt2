; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84004 () Bool)

(assert start!84004)

(declare-fun b_free!19777 () Bool)

(declare-fun b_next!19777 () Bool)

(assert (=> start!84004 (= b_free!19777 (not b_next!19777))))

(declare-fun tp!68855 () Bool)

(declare-fun b_and!31611 () Bool)

(assert (=> start!84004 (= tp!68855 b_and!31611)))

(declare-fun b!981900 () Bool)

(declare-fun e!553491 () Bool)

(declare-fun e!553496 () Bool)

(declare-fun mapRes!36266 () Bool)

(assert (=> b!981900 (= e!553491 (and e!553496 mapRes!36266))))

(declare-fun condMapEmpty!36266 () Bool)

(declare-datatypes ((V!35417 0))(
  ( (V!35418 (val!11463 Int)) )
))
(declare-datatypes ((ValueCell!10931 0))(
  ( (ValueCellFull!10931 (v!14024 V!35417)) (EmptyCell!10931) )
))
(declare-datatypes ((array!61578 0))(
  ( (array!61579 (arr!29647 (Array (_ BitVec 32) ValueCell!10931)) (size!30128 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61578)

(declare-fun mapDefault!36266 () ValueCell!10931)

(assert (=> b!981900 (= condMapEmpty!36266 (= (arr!29647 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10931)) mapDefault!36266)))))

(declare-fun b!981901 () Bool)

(declare-fun res!657126 () Bool)

(declare-fun e!553493 () Bool)

(assert (=> b!981901 (=> (not res!657126) (not e!553493))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61580 0))(
  ( (array!61581 (arr!29648 (Array (_ BitVec 32) (_ BitVec 64))) (size!30129 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61580)

(assert (=> b!981901 (= res!657126 (and (= (size!30128 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30129 _keys!1544) (size!30128 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!981902 () Bool)

(declare-fun res!657129 () Bool)

(assert (=> b!981902 (=> (not res!657129) (not e!553493))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!981902 (= res!657129 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30129 _keys!1544))))))

(declare-fun res!657127 () Bool)

(assert (=> start!84004 (=> (not res!657127) (not e!553493))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84004 (= res!657127 (validMask!0 mask!1948))))

(assert (=> start!84004 e!553493))

(assert (=> start!84004 true))

(declare-fun tp_is_empty!22825 () Bool)

(assert (=> start!84004 tp_is_empty!22825))

(declare-fun array_inv!22939 (array!61578) Bool)

(assert (=> start!84004 (and (array_inv!22939 _values!1278) e!553491)))

(assert (=> start!84004 tp!68855))

(declare-fun array_inv!22940 (array!61580) Bool)

(assert (=> start!84004 (array_inv!22940 _keys!1544)))

(declare-fun b!981903 () Bool)

(declare-fun e!553494 () Bool)

(assert (=> b!981903 (= e!553493 e!553494)))

(declare-fun res!657132 () Bool)

(assert (=> b!981903 (=> (not res!657132) (not e!553494))))

(assert (=> b!981903 (= res!657132 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29648 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun lt!435771 () V!35417)

(declare-fun get!15385 (ValueCell!10931 V!35417) V!35417)

(declare-fun dynLambda!1777 (Int (_ BitVec 64)) V!35417)

(assert (=> b!981903 (= lt!435771 (get!15385 (select (arr!29647 _values!1278) from!1932) (dynLambda!1777 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35417)

(declare-fun zeroValue!1220 () V!35417)

(declare-datatypes ((tuple2!14752 0))(
  ( (tuple2!14753 (_1!7387 (_ BitVec 64)) (_2!7387 V!35417)) )
))
(declare-datatypes ((List!20594 0))(
  ( (Nil!20591) (Cons!20590 (h!21752 tuple2!14752) (t!29312 List!20594)) )
))
(declare-datatypes ((ListLongMap!13439 0))(
  ( (ListLongMap!13440 (toList!6735 List!20594)) )
))
(declare-fun lt!435772 () ListLongMap!13439)

(declare-fun getCurrentListMapNoExtraKeys!3447 (array!61580 array!61578 (_ BitVec 32) (_ BitVec 32) V!35417 V!35417 (_ BitVec 32) Int) ListLongMap!13439)

(assert (=> b!981903 (= lt!435772 (getCurrentListMapNoExtraKeys!3447 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!981904 () Bool)

(declare-fun res!657131 () Bool)

(assert (=> b!981904 (=> (not res!657131) (not e!553493))))

(declare-datatypes ((List!20595 0))(
  ( (Nil!20592) (Cons!20591 (h!21753 (_ BitVec 64)) (t!29313 List!20595)) )
))
(declare-fun arrayNoDuplicates!0 (array!61580 (_ BitVec 32) List!20595) Bool)

(assert (=> b!981904 (= res!657131 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20592))))

(declare-fun mapIsEmpty!36266 () Bool)

(assert (=> mapIsEmpty!36266 mapRes!36266))

(declare-fun b!981905 () Bool)

(declare-fun res!657128 () Bool)

(assert (=> b!981905 (=> (not res!657128) (not e!553493))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!981905 (= res!657128 (validKeyInArray!0 (select (arr!29648 _keys!1544) from!1932)))))

(declare-fun b!981906 () Bool)

(assert (=> b!981906 (= e!553496 tp_is_empty!22825)))

(declare-fun b!981907 () Bool)

(declare-fun res!657130 () Bool)

(assert (=> b!981907 (=> (not res!657130) (not e!553493))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61580 (_ BitVec 32)) Bool)

(assert (=> b!981907 (= res!657130 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!36266 () Bool)

(declare-fun tp!68854 () Bool)

(declare-fun e!553495 () Bool)

(assert (=> mapNonEmpty!36266 (= mapRes!36266 (and tp!68854 e!553495))))

(declare-fun mapValue!36266 () ValueCell!10931)

(declare-fun mapKey!36266 () (_ BitVec 32))

(declare-fun mapRest!36266 () (Array (_ BitVec 32) ValueCell!10931))

(assert (=> mapNonEmpty!36266 (= (arr!29647 _values!1278) (store mapRest!36266 mapKey!36266 mapValue!36266))))

(declare-fun b!981908 () Bool)

(assert (=> b!981908 (= e!553495 tp_is_empty!22825)))

(declare-fun b!981909 () Bool)

(declare-fun res!657125 () Bool)

(assert (=> b!981909 (=> (not res!657125) (not e!553493))))

(assert (=> b!981909 (= res!657125 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!981910 () Bool)

(assert (=> b!981910 (= e!553494 (not true))))

(declare-fun lt!435770 () tuple2!14752)

(declare-fun lt!435774 () tuple2!14752)

(declare-fun +!3030 (ListLongMap!13439 tuple2!14752) ListLongMap!13439)

(assert (=> b!981910 (= (+!3030 (+!3030 lt!435772 lt!435770) lt!435774) (+!3030 (+!3030 lt!435772 lt!435774) lt!435770))))

(assert (=> b!981910 (= lt!435774 (tuple2!14753 (select (arr!29648 _keys!1544) from!1932) lt!435771))))

(assert (=> b!981910 (= lt!435770 (tuple2!14753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32526 0))(
  ( (Unit!32527) )
))
(declare-fun lt!435773 () Unit!32526)

(declare-fun addCommutativeForDiffKeys!634 (ListLongMap!13439 (_ BitVec 64) V!35417 (_ BitVec 64) V!35417) Unit!32526)

(assert (=> b!981910 (= lt!435773 (addCommutativeForDiffKeys!634 lt!435772 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29648 _keys!1544) from!1932) lt!435771))))

(assert (= (and start!84004 res!657127) b!981901))

(assert (= (and b!981901 res!657126) b!981907))

(assert (= (and b!981907 res!657130) b!981904))

(assert (= (and b!981904 res!657131) b!981902))

(assert (= (and b!981902 res!657129) b!981905))

(assert (= (and b!981905 res!657128) b!981909))

(assert (= (and b!981909 res!657125) b!981903))

(assert (= (and b!981903 res!657132) b!981910))

(assert (= (and b!981900 condMapEmpty!36266) mapIsEmpty!36266))

(assert (= (and b!981900 (not condMapEmpty!36266)) mapNonEmpty!36266))

(get-info :version)

(assert (= (and mapNonEmpty!36266 ((_ is ValueCellFull!10931) mapValue!36266)) b!981908))

(assert (= (and b!981900 ((_ is ValueCellFull!10931) mapDefault!36266)) b!981906))

(assert (= start!84004 b!981900))

(declare-fun b_lambda!14797 () Bool)

(assert (=> (not b_lambda!14797) (not b!981903)))

(declare-fun t!29311 () Bool)

(declare-fun tb!6569 () Bool)

(assert (=> (and start!84004 (= defaultEntry!1281 defaultEntry!1281) t!29311) tb!6569))

(declare-fun result!13135 () Bool)

(assert (=> tb!6569 (= result!13135 tp_is_empty!22825)))

(assert (=> b!981903 t!29311))

(declare-fun b_and!31613 () Bool)

(assert (= b_and!31611 (and (=> t!29311 result!13135) b_and!31613)))

(declare-fun m!908729 () Bool)

(assert (=> b!981903 m!908729))

(declare-fun m!908731 () Bool)

(assert (=> b!981903 m!908731))

(declare-fun m!908733 () Bool)

(assert (=> b!981903 m!908733))

(declare-fun m!908735 () Bool)

(assert (=> b!981903 m!908735))

(assert (=> b!981903 m!908731))

(assert (=> b!981903 m!908735))

(declare-fun m!908737 () Bool)

(assert (=> b!981903 m!908737))

(assert (=> b!981910 m!908729))

(declare-fun m!908739 () Bool)

(assert (=> b!981910 m!908739))

(assert (=> b!981910 m!908729))

(declare-fun m!908741 () Bool)

(assert (=> b!981910 m!908741))

(assert (=> b!981910 m!908741))

(declare-fun m!908743 () Bool)

(assert (=> b!981910 m!908743))

(declare-fun m!908745 () Bool)

(assert (=> b!981910 m!908745))

(declare-fun m!908747 () Bool)

(assert (=> b!981910 m!908747))

(assert (=> b!981910 m!908745))

(assert (=> b!981905 m!908729))

(assert (=> b!981905 m!908729))

(declare-fun m!908749 () Bool)

(assert (=> b!981905 m!908749))

(declare-fun m!908751 () Bool)

(assert (=> b!981904 m!908751))

(declare-fun m!908753 () Bool)

(assert (=> start!84004 m!908753))

(declare-fun m!908755 () Bool)

(assert (=> start!84004 m!908755))

(declare-fun m!908757 () Bool)

(assert (=> start!84004 m!908757))

(declare-fun m!908759 () Bool)

(assert (=> mapNonEmpty!36266 m!908759))

(declare-fun m!908761 () Bool)

(assert (=> b!981907 m!908761))

(check-sat b_and!31613 (not b!981907) (not b!981904) (not b_next!19777) (not b!981903) (not mapNonEmpty!36266) (not b_lambda!14797) (not b!981905) tp_is_empty!22825 (not b!981910) (not start!84004))
(check-sat b_and!31613 (not b_next!19777))
