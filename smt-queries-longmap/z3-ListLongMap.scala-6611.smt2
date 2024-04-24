; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83718 () Bool)

(assert start!83718)

(declare-fun b_free!19537 () Bool)

(declare-fun b_next!19537 () Bool)

(assert (=> start!83718 (= b_free!19537 (not b_next!19537))))

(declare-fun tp!67900 () Bool)

(declare-fun b_and!31179 () Bool)

(assert (=> start!83718 (= tp!67900 b_and!31179)))

(declare-fun b!977196 () Bool)

(declare-fun res!653918 () Bool)

(declare-fun e!550783 () Bool)

(assert (=> b!977196 (=> (not res!653918) (not e!550783))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34905 0))(
  ( (V!34906 (val!11271 Int)) )
))
(declare-datatypes ((ValueCell!10739 0))(
  ( (ValueCellFull!10739 (v!13827 V!34905)) (EmptyCell!10739) )
))
(declare-datatypes ((array!60948 0))(
  ( (array!60949 (arr!29333 (Array (_ BitVec 32) ValueCell!10739)) (size!29813 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60948)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60950 0))(
  ( (array!60951 (arr!29334 (Array (_ BitVec 32) (_ BitVec 64))) (size!29814 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60950)

(assert (=> b!977196 (= res!653918 (and (= (size!29813 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29814 _keys!1717) (size!29813 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!977197 () Bool)

(declare-fun e!550780 () Bool)

(assert (=> b!977197 (= e!550783 e!550780)))

(declare-fun res!653924 () Bool)

(assert (=> b!977197 (=> (not res!653924) (not e!550780))))

(declare-fun i!822 () (_ BitVec 32))

(declare-datatypes ((tuple2!14508 0))(
  ( (tuple2!14509 (_1!7265 (_ BitVec 64)) (_2!7265 V!34905)) )
))
(declare-datatypes ((List!20350 0))(
  ( (Nil!20347) (Cons!20346 (h!21514 tuple2!14508) (t!28851 List!20350)) )
))
(declare-datatypes ((ListLongMap!13207 0))(
  ( (ListLongMap!13208 (toList!6619 List!20350)) )
))
(declare-fun lt!433444 () ListLongMap!13207)

(declare-fun contains!5717 (ListLongMap!13207 (_ BitVec 64)) Bool)

(assert (=> b!977197 (= res!653924 (contains!5717 lt!433444 (select (arr!29334 _keys!1717) i!822)))))

(declare-fun zeroValue!1367 () V!34905)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34905)

(declare-fun getCurrentListMap!3852 (array!60950 array!60948 (_ BitVec 32) (_ BitVec 32) V!34905 V!34905 (_ BitVec 32) Int) ListLongMap!13207)

(assert (=> b!977197 (= lt!433444 (getCurrentListMap!3852 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun mapIsEmpty!35671 () Bool)

(declare-fun mapRes!35671 () Bool)

(assert (=> mapIsEmpty!35671 mapRes!35671))

(declare-fun b!977199 () Bool)

(declare-fun e!550785 () Bool)

(assert (=> b!977199 (= e!550780 e!550785)))

(declare-fun res!653917 () Bool)

(assert (=> b!977199 (=> (not res!653917) (not e!550785))))

(declare-fun lt!433446 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!977199 (= res!653917 (validKeyInArray!0 lt!433446))))

(assert (=> b!977199 (= lt!433446 (select (arr!29334 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun lt!433443 () ListLongMap!13207)

(assert (=> b!977199 (= lt!433443 (getCurrentListMap!3852 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!977200 () Bool)

(declare-fun e!550786 () Bool)

(declare-fun tp_is_empty!22441 () Bool)

(assert (=> b!977200 (= e!550786 tp_is_empty!22441)))

(declare-fun b!977201 () Bool)

(declare-fun res!653921 () Bool)

(assert (=> b!977201 (=> (not res!653921) (not e!550783))))

(assert (=> b!977201 (= res!653921 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29814 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29814 _keys!1717))))))

(declare-fun b!977202 () Bool)

(declare-fun e!550784 () Bool)

(assert (=> b!977202 (= e!550784 tp_is_empty!22441)))

(declare-fun b!977203 () Bool)

(assert (=> b!977203 (= e!550785 (not (contains!5717 lt!433443 (select (arr!29334 _keys!1717) i!822))))))

(declare-fun lt!433441 () tuple2!14508)

(declare-fun +!2937 (ListLongMap!13207 tuple2!14508) ListLongMap!13207)

(assert (=> b!977203 (contains!5717 (+!2937 lt!433444 lt!433441) (select (arr!29334 _keys!1717) i!822))))

(declare-datatypes ((Unit!32438 0))(
  ( (Unit!32439) )
))
(declare-fun lt!433440 () Unit!32438)

(declare-fun lt!433445 () V!34905)

(declare-fun addStillContains!610 (ListLongMap!13207 (_ BitVec 64) V!34905 (_ BitVec 64)) Unit!32438)

(assert (=> b!977203 (= lt!433440 (addStillContains!610 lt!433444 lt!433446 lt!433445 (select (arr!29334 _keys!1717) i!822)))))

(assert (=> b!977203 (= lt!433443 (+!2937 (getCurrentListMap!3852 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) lt!433441))))

(assert (=> b!977203 (= lt!433441 (tuple2!14509 lt!433446 lt!433445))))

(declare-fun get!15210 (ValueCell!10739 V!34905) V!34905)

(declare-fun dynLambda!1734 (Int (_ BitVec 64)) V!34905)

(assert (=> b!977203 (= lt!433445 (get!15210 (select (arr!29333 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1734 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!433442 () Unit!32438)

(declare-fun lemmaListMapRecursiveValidKeyArray!293 (array!60950 array!60948 (_ BitVec 32) (_ BitVec 32) V!34905 V!34905 (_ BitVec 32) Int) Unit!32438)

(assert (=> b!977203 (= lt!433442 (lemmaListMapRecursiveValidKeyArray!293 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!977204 () Bool)

(declare-fun res!653919 () Bool)

(assert (=> b!977204 (=> (not res!653919) (not e!550783))))

(declare-datatypes ((List!20351 0))(
  ( (Nil!20348) (Cons!20347 (h!21515 (_ BitVec 64)) (t!28852 List!20351)) )
))
(declare-fun arrayNoDuplicates!0 (array!60950 (_ BitVec 32) List!20351) Bool)

(assert (=> b!977204 (= res!653919 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20348))))

(declare-fun b!977205 () Bool)

(declare-fun res!653922 () Bool)

(assert (=> b!977205 (=> (not res!653922) (not e!550783))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60950 (_ BitVec 32)) Bool)

(assert (=> b!977205 (= res!653922 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun res!653923 () Bool)

(assert (=> start!83718 (=> (not res!653923) (not e!550783))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83718 (= res!653923 (validMask!0 mask!2147))))

(assert (=> start!83718 e!550783))

(assert (=> start!83718 true))

(declare-fun e!550782 () Bool)

(declare-fun array_inv!22737 (array!60948) Bool)

(assert (=> start!83718 (and (array_inv!22737 _values!1425) e!550782)))

(assert (=> start!83718 tp_is_empty!22441))

(assert (=> start!83718 tp!67900))

(declare-fun array_inv!22738 (array!60950) Bool)

(assert (=> start!83718 (array_inv!22738 _keys!1717)))

(declare-fun b!977198 () Bool)

(declare-fun res!653920 () Bool)

(assert (=> b!977198 (=> (not res!653920) (not e!550783))))

(assert (=> b!977198 (= res!653920 (validKeyInArray!0 (select (arr!29334 _keys!1717) i!822)))))

(declare-fun mapNonEmpty!35671 () Bool)

(declare-fun tp!67899 () Bool)

(assert (=> mapNonEmpty!35671 (= mapRes!35671 (and tp!67899 e!550786))))

(declare-fun mapKey!35671 () (_ BitVec 32))

(declare-fun mapValue!35671 () ValueCell!10739)

(declare-fun mapRest!35671 () (Array (_ BitVec 32) ValueCell!10739))

(assert (=> mapNonEmpty!35671 (= (arr!29333 _values!1425) (store mapRest!35671 mapKey!35671 mapValue!35671))))

(declare-fun b!977206 () Bool)

(assert (=> b!977206 (= e!550782 (and e!550784 mapRes!35671))))

(declare-fun condMapEmpty!35671 () Bool)

(declare-fun mapDefault!35671 () ValueCell!10739)

(assert (=> b!977206 (= condMapEmpty!35671 (= (arr!29333 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10739)) mapDefault!35671)))))

(assert (= (and start!83718 res!653923) b!977196))

(assert (= (and b!977196 res!653918) b!977205))

(assert (= (and b!977205 res!653922) b!977204))

(assert (= (and b!977204 res!653919) b!977201))

(assert (= (and b!977201 res!653921) b!977198))

(assert (= (and b!977198 res!653920) b!977197))

(assert (= (and b!977197 res!653924) b!977199))

(assert (= (and b!977199 res!653917) b!977203))

(assert (= (and b!977206 condMapEmpty!35671) mapIsEmpty!35671))

(assert (= (and b!977206 (not condMapEmpty!35671)) mapNonEmpty!35671))

(get-info :version)

(assert (= (and mapNonEmpty!35671 ((_ is ValueCellFull!10739) mapValue!35671)) b!977200))

(assert (= (and b!977206 ((_ is ValueCellFull!10739) mapDefault!35671)) b!977202))

(assert (= start!83718 b!977206))

(declare-fun b_lambda!14589 () Bool)

(assert (=> (not b_lambda!14589) (not b!977203)))

(declare-fun t!28850 () Bool)

(declare-fun tb!6351 () Bool)

(assert (=> (and start!83718 (= defaultEntry!1428 defaultEntry!1428) t!28850) tb!6351))

(declare-fun result!12687 () Bool)

(assert (=> tb!6351 (= result!12687 tp_is_empty!22441)))

(assert (=> b!977203 t!28850))

(declare-fun b_and!31181 () Bool)

(assert (= b_and!31179 (and (=> t!28850 result!12687) b_and!31181)))

(declare-fun m!904811 () Bool)

(assert (=> b!977205 m!904811))

(declare-fun m!904813 () Bool)

(assert (=> b!977203 m!904813))

(declare-fun m!904815 () Bool)

(assert (=> b!977203 m!904815))

(declare-fun m!904817 () Bool)

(assert (=> b!977203 m!904817))

(declare-fun m!904819 () Bool)

(assert (=> b!977203 m!904819))

(declare-fun m!904821 () Bool)

(assert (=> b!977203 m!904821))

(assert (=> b!977203 m!904815))

(assert (=> b!977203 m!904821))

(declare-fun m!904823 () Bool)

(assert (=> b!977203 m!904823))

(assert (=> b!977203 m!904813))

(assert (=> b!977203 m!904819))

(declare-fun m!904825 () Bool)

(assert (=> b!977203 m!904825))

(assert (=> b!977203 m!904821))

(declare-fun m!904827 () Bool)

(assert (=> b!977203 m!904827))

(declare-fun m!904829 () Bool)

(assert (=> b!977203 m!904829))

(assert (=> b!977203 m!904817))

(declare-fun m!904831 () Bool)

(assert (=> b!977203 m!904831))

(assert (=> b!977203 m!904821))

(declare-fun m!904833 () Bool)

(assert (=> b!977203 m!904833))

(assert (=> b!977198 m!904821))

(assert (=> b!977198 m!904821))

(declare-fun m!904835 () Bool)

(assert (=> b!977198 m!904835))

(declare-fun m!904837 () Bool)

(assert (=> b!977204 m!904837))

(declare-fun m!904839 () Bool)

(assert (=> b!977199 m!904839))

(declare-fun m!904841 () Bool)

(assert (=> b!977199 m!904841))

(declare-fun m!904843 () Bool)

(assert (=> b!977199 m!904843))

(declare-fun m!904845 () Bool)

(assert (=> mapNonEmpty!35671 m!904845))

(declare-fun m!904847 () Bool)

(assert (=> start!83718 m!904847))

(declare-fun m!904849 () Bool)

(assert (=> start!83718 m!904849))

(declare-fun m!904851 () Bool)

(assert (=> start!83718 m!904851))

(assert (=> b!977197 m!904821))

(assert (=> b!977197 m!904821))

(declare-fun m!904853 () Bool)

(assert (=> b!977197 m!904853))

(declare-fun m!904855 () Bool)

(assert (=> b!977197 m!904855))

(check-sat (not b!977198) (not start!83718) (not b_lambda!14589) (not b!977199) (not b!977203) (not b!977205) (not b_next!19537) (not b!977197) (not mapNonEmpty!35671) b_and!31181 (not b!977204) tp_is_empty!22441)
(check-sat b_and!31181 (not b_next!19537))
