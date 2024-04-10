; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83522 () Bool)

(assert start!83522)

(declare-fun b_free!19509 () Bool)

(declare-fun b_next!19509 () Bool)

(assert (=> start!83522 (= b_free!19509 (not b_next!19509))))

(declare-fun tp!67814 () Bool)

(declare-fun b_and!31113 () Bool)

(assert (=> start!83522 (= tp!67814 b_and!31113)))

(declare-fun b!975804 () Bool)

(declare-fun e!549939 () Bool)

(declare-fun from!2118 () (_ BitVec 32))

(declare-datatypes ((array!60855 0))(
  ( (array!60856 (arr!29291 (Array (_ BitVec 32) (_ BitVec 64))) (size!29770 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60855)

(assert (=> b!975804 (= e!549939 (not (bvslt (bvsub from!2118 #b00000000000000000000000000000001) (size!29770 _keys!1717))))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34867 0))(
  ( (V!34868 (val!11257 Int)) )
))
(declare-datatypes ((ValueCell!10725 0))(
  ( (ValueCellFull!10725 (v!13816 V!34867)) (EmptyCell!10725) )
))
(declare-datatypes ((array!60857 0))(
  ( (array!60858 (arr!29292 (Array (_ BitVec 32) ValueCell!10725)) (size!29771 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60857)

(declare-fun lt!432910 () (_ BitVec 64))

(declare-fun zeroValue!1367 () V!34867)

(declare-datatypes ((tuple2!14478 0))(
  ( (tuple2!14479 (_1!7250 (_ BitVec 64)) (_2!7250 V!34867)) )
))
(declare-datatypes ((List!20330 0))(
  ( (Nil!20327) (Cons!20326 (h!21488 tuple2!14478) (t!28811 List!20330)) )
))
(declare-datatypes ((ListLongMap!13175 0))(
  ( (ListLongMap!13176 (toList!6603 List!20330)) )
))
(declare-fun lt!432911 () ListLongMap!13175)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34867)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun +!2914 (ListLongMap!13175 tuple2!14478) ListLongMap!13175)

(declare-fun getCurrentListMap!3836 (array!60855 array!60857 (_ BitVec 32) (_ BitVec 32) V!34867 V!34867 (_ BitVec 32) Int) ListLongMap!13175)

(declare-fun get!15165 (ValueCell!10725 V!34867) V!34867)

(declare-fun dynLambda!1703 (Int (_ BitVec 64)) V!34867)

(assert (=> b!975804 (= lt!432911 (+!2914 (getCurrentListMap!3836 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14479 lt!432910 (get!15165 (select (arr!29292 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1703 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32449 0))(
  ( (Unit!32450) )
))
(declare-fun lt!432909 () Unit!32449)

(declare-fun lemmaListMapRecursiveValidKeyArray!280 (array!60855 array!60857 (_ BitVec 32) (_ BitVec 32) V!34867 V!34867 (_ BitVec 32) Int) Unit!32449)

(assert (=> b!975804 (= lt!432909 (lemmaListMapRecursiveValidKeyArray!280 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!975805 () Bool)

(declare-fun res!653238 () Bool)

(declare-fun e!549935 () Bool)

(assert (=> b!975805 (=> (not res!653238) (not e!549935))))

(assert (=> b!975805 (= res!653238 (and (= (size!29771 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29770 _keys!1717) (size!29771 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!975806 () Bool)

(declare-fun e!549937 () Bool)

(declare-fun tp_is_empty!22413 () Bool)

(assert (=> b!975806 (= e!549937 tp_is_empty!22413)))

(declare-fun b!975807 () Bool)

(declare-fun e!549936 () Bool)

(assert (=> b!975807 (= e!549936 tp_is_empty!22413)))

(declare-fun b!975808 () Bool)

(declare-fun e!549940 () Bool)

(declare-fun mapRes!35629 () Bool)

(assert (=> b!975808 (= e!549940 (and e!549937 mapRes!35629))))

(declare-fun condMapEmpty!35629 () Bool)

(declare-fun mapDefault!35629 () ValueCell!10725)

(assert (=> b!975808 (= condMapEmpty!35629 (= (arr!29292 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10725)) mapDefault!35629)))))

(declare-fun b!975809 () Bool)

(declare-fun res!653244 () Bool)

(assert (=> b!975809 (=> (not res!653244) (not e!549935))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60855 (_ BitVec 32)) Bool)

(assert (=> b!975809 (= res!653244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!975803 () Bool)

(assert (=> b!975803 (= e!549935 e!549939)))

(declare-fun res!653241 () Bool)

(assert (=> b!975803 (=> (not res!653241) (not e!549939))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!975803 (= res!653241 (validKeyInArray!0 lt!432910))))

(assert (=> b!975803 (= lt!432910 (select (arr!29291 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!975803 (= lt!432911 (getCurrentListMap!3836 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun res!653239 () Bool)

(assert (=> start!83522 (=> (not res!653239) (not e!549935))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83522 (= res!653239 (validMask!0 mask!2147))))

(assert (=> start!83522 e!549935))

(assert (=> start!83522 true))

(declare-fun array_inv!22651 (array!60857) Bool)

(assert (=> start!83522 (and (array_inv!22651 _values!1425) e!549940)))

(assert (=> start!83522 tp_is_empty!22413))

(assert (=> start!83522 tp!67814))

(declare-fun array_inv!22652 (array!60855) Bool)

(assert (=> start!83522 (array_inv!22652 _keys!1717)))

(declare-fun b!975810 () Bool)

(declare-fun res!653237 () Bool)

(assert (=> b!975810 (=> (not res!653237) (not e!549935))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun contains!5684 (ListLongMap!13175 (_ BitVec 64)) Bool)

(assert (=> b!975810 (= res!653237 (contains!5684 (getCurrentListMap!3836 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29291 _keys!1717) i!822)))))

(declare-fun b!975811 () Bool)

(declare-fun res!653243 () Bool)

(assert (=> b!975811 (=> (not res!653243) (not e!549935))))

(declare-datatypes ((List!20331 0))(
  ( (Nil!20328) (Cons!20327 (h!21489 (_ BitVec 64)) (t!28812 List!20331)) )
))
(declare-fun arrayNoDuplicates!0 (array!60855 (_ BitVec 32) List!20331) Bool)

(assert (=> b!975811 (= res!653243 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20328))))

(declare-fun b!975812 () Bool)

(declare-fun res!653240 () Bool)

(assert (=> b!975812 (=> (not res!653240) (not e!549935))))

(assert (=> b!975812 (= res!653240 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29770 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29770 _keys!1717))))))

(declare-fun mapNonEmpty!35629 () Bool)

(declare-fun tp!67815 () Bool)

(assert (=> mapNonEmpty!35629 (= mapRes!35629 (and tp!67815 e!549936))))

(declare-fun mapRest!35629 () (Array (_ BitVec 32) ValueCell!10725))

(declare-fun mapKey!35629 () (_ BitVec 32))

(declare-fun mapValue!35629 () ValueCell!10725)

(assert (=> mapNonEmpty!35629 (= (arr!29292 _values!1425) (store mapRest!35629 mapKey!35629 mapValue!35629))))

(declare-fun mapIsEmpty!35629 () Bool)

(assert (=> mapIsEmpty!35629 mapRes!35629))

(declare-fun b!975813 () Bool)

(declare-fun res!653242 () Bool)

(assert (=> b!975813 (=> (not res!653242) (not e!549935))))

(assert (=> b!975813 (= res!653242 (validKeyInArray!0 (select (arr!29291 _keys!1717) i!822)))))

(assert (= (and start!83522 res!653239) b!975805))

(assert (= (and b!975805 res!653238) b!975809))

(assert (= (and b!975809 res!653244) b!975811))

(assert (= (and b!975811 res!653243) b!975812))

(assert (= (and b!975812 res!653240) b!975813))

(assert (= (and b!975813 res!653242) b!975810))

(assert (= (and b!975810 res!653237) b!975803))

(assert (= (and b!975803 res!653241) b!975804))

(assert (= (and b!975808 condMapEmpty!35629) mapIsEmpty!35629))

(assert (= (and b!975808 (not condMapEmpty!35629)) mapNonEmpty!35629))

(get-info :version)

(assert (= (and mapNonEmpty!35629 ((_ is ValueCellFull!10725) mapValue!35629)) b!975807))

(assert (= (and b!975808 ((_ is ValueCellFull!10725) mapDefault!35629)) b!975806))

(assert (= start!83522 b!975808))

(declare-fun b_lambda!14547 () Bool)

(assert (=> (not b_lambda!14547) (not b!975804)))

(declare-fun t!28810 () Bool)

(declare-fun tb!6331 () Bool)

(assert (=> (and start!83522 (= defaultEntry!1428 defaultEntry!1428) t!28810) tb!6331))

(declare-fun result!12639 () Bool)

(assert (=> tb!6331 (= result!12639 tp_is_empty!22413)))

(assert (=> b!975804 t!28810))

(declare-fun b_and!31115 () Bool)

(assert (= b_and!31113 (and (=> t!28810 result!12639) b_and!31115)))

(declare-fun m!902967 () Bool)

(assert (=> mapNonEmpty!35629 m!902967))

(declare-fun m!902969 () Bool)

(assert (=> b!975810 m!902969))

(declare-fun m!902971 () Bool)

(assert (=> b!975810 m!902971))

(assert (=> b!975810 m!902969))

(assert (=> b!975810 m!902971))

(declare-fun m!902973 () Bool)

(assert (=> b!975810 m!902973))

(declare-fun m!902975 () Bool)

(assert (=> b!975809 m!902975))

(declare-fun m!902977 () Bool)

(assert (=> b!975811 m!902977))

(declare-fun m!902979 () Bool)

(assert (=> start!83522 m!902979))

(declare-fun m!902981 () Bool)

(assert (=> start!83522 m!902981))

(declare-fun m!902983 () Bool)

(assert (=> start!83522 m!902983))

(assert (=> b!975813 m!902971))

(assert (=> b!975813 m!902971))

(declare-fun m!902985 () Bool)

(assert (=> b!975813 m!902985))

(declare-fun m!902987 () Bool)

(assert (=> b!975804 m!902987))

(declare-fun m!902989 () Bool)

(assert (=> b!975804 m!902989))

(assert (=> b!975804 m!902987))

(declare-fun m!902991 () Bool)

(assert (=> b!975804 m!902991))

(declare-fun m!902993 () Bool)

(assert (=> b!975804 m!902993))

(declare-fun m!902995 () Bool)

(assert (=> b!975804 m!902995))

(assert (=> b!975804 m!902989))

(declare-fun m!902997 () Bool)

(assert (=> b!975804 m!902997))

(assert (=> b!975804 m!902991))

(declare-fun m!902999 () Bool)

(assert (=> b!975803 m!902999))

(declare-fun m!903001 () Bool)

(assert (=> b!975803 m!903001))

(declare-fun m!903003 () Bool)

(assert (=> b!975803 m!903003))

(check-sat (not b!975804) (not mapNonEmpty!35629) (not b!975810) b_and!31115 (not b_next!19509) (not start!83522) (not b!975809) (not b!975813) (not b!975803) tp_is_empty!22413 (not b!975811) (not b_lambda!14547))
(check-sat b_and!31115 (not b_next!19509))
