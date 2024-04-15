; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84010 () Bool)

(assert start!84010)

(declare-fun b_free!19783 () Bool)

(declare-fun b_next!19783 () Bool)

(assert (=> start!84010 (= b_free!19783 (not b_next!19783))))

(declare-fun tp!68873 () Bool)

(declare-fun b_and!31623 () Bool)

(assert (=> start!84010 (= tp!68873 b_and!31623)))

(declare-fun b!982005 () Bool)

(declare-fun res!657204 () Bool)

(declare-fun e!553549 () Bool)

(assert (=> b!982005 (=> (not res!657204) (not e!553549))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35425 0))(
  ( (V!35426 (val!11466 Int)) )
))
(declare-datatypes ((ValueCell!10934 0))(
  ( (ValueCellFull!10934 (v!14027 V!35425)) (EmptyCell!10934) )
))
(declare-datatypes ((array!61590 0))(
  ( (array!61591 (arr!29653 (Array (_ BitVec 32) ValueCell!10934)) (size!30134 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61590)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61592 0))(
  ( (array!61593 (arr!29654 (Array (_ BitVec 32) (_ BitVec 64))) (size!30135 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61592)

(assert (=> b!982005 (= res!657204 (and (= (size!30134 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30135 _keys!1544) (size!30134 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!982006 () Bool)

(declare-fun res!657202 () Bool)

(assert (=> b!982006 (=> (not res!657202) (not e!553549))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61592 (_ BitVec 32)) Bool)

(assert (=> b!982006 (= res!657202 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!982007 () Bool)

(declare-fun e!553550 () Bool)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!982007 (= e!553550 (not (bvsle from!1932 (size!30135 _keys!1544))))))

(declare-datatypes ((tuple2!14758 0))(
  ( (tuple2!14759 (_1!7390 (_ BitVec 64)) (_2!7390 V!35425)) )
))
(declare-datatypes ((List!20599 0))(
  ( (Nil!20596) (Cons!20595 (h!21757 tuple2!14758) (t!29323 List!20599)) )
))
(declare-datatypes ((ListLongMap!13445 0))(
  ( (ListLongMap!13446 (toList!6738 List!20599)) )
))
(declare-fun lt!435817 () ListLongMap!13445)

(declare-fun lt!435819 () tuple2!14758)

(declare-fun lt!435815 () tuple2!14758)

(declare-fun +!3032 (ListLongMap!13445 tuple2!14758) ListLongMap!13445)

(assert (=> b!982007 (= (+!3032 (+!3032 lt!435817 lt!435819) lt!435815) (+!3032 (+!3032 lt!435817 lt!435815) lt!435819))))

(declare-fun lt!435818 () V!35425)

(assert (=> b!982007 (= lt!435815 (tuple2!14759 (select (arr!29654 _keys!1544) from!1932) lt!435818))))

(declare-fun zeroValue!1220 () V!35425)

(assert (=> b!982007 (= lt!435819 (tuple2!14759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32530 0))(
  ( (Unit!32531) )
))
(declare-fun lt!435816 () Unit!32530)

(declare-fun addCommutativeForDiffKeys!636 (ListLongMap!13445 (_ BitVec 64) V!35425 (_ BitVec 64) V!35425) Unit!32530)

(assert (=> b!982007 (= lt!435816 (addCommutativeForDiffKeys!636 lt!435817 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29654 _keys!1544) from!1932) lt!435818))))

(declare-fun res!657200 () Bool)

(assert (=> start!84010 (=> (not res!657200) (not e!553549))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84010 (= res!657200 (validMask!0 mask!1948))))

(assert (=> start!84010 e!553549))

(assert (=> start!84010 true))

(declare-fun tp_is_empty!22831 () Bool)

(assert (=> start!84010 tp_is_empty!22831))

(declare-fun e!553547 () Bool)

(declare-fun array_inv!22943 (array!61590) Bool)

(assert (=> start!84010 (and (array_inv!22943 _values!1278) e!553547)))

(assert (=> start!84010 tp!68873))

(declare-fun array_inv!22944 (array!61592) Bool)

(assert (=> start!84010 (array_inv!22944 _keys!1544)))

(declare-fun mapIsEmpty!36275 () Bool)

(declare-fun mapRes!36275 () Bool)

(assert (=> mapIsEmpty!36275 mapRes!36275))

(declare-fun b!982008 () Bool)

(declare-fun res!657198 () Bool)

(assert (=> b!982008 (=> (not res!657198) (not e!553549))))

(assert (=> b!982008 (= res!657198 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!982009 () Bool)

(assert (=> b!982009 (= e!553549 e!553550)))

(declare-fun res!657201 () Bool)

(assert (=> b!982009 (=> (not res!657201) (not e!553550))))

(assert (=> b!982009 (= res!657201 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29654 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15389 (ValueCell!10934 V!35425) V!35425)

(declare-fun dynLambda!1779 (Int (_ BitVec 64)) V!35425)

(assert (=> b!982009 (= lt!435818 (get!15389 (select (arr!29653 _values!1278) from!1932) (dynLambda!1779 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35425)

(declare-fun getCurrentListMapNoExtraKeys!3449 (array!61592 array!61590 (_ BitVec 32) (_ BitVec 32) V!35425 V!35425 (_ BitVec 32) Int) ListLongMap!13445)

(assert (=> b!982009 (= lt!435817 (getCurrentListMapNoExtraKeys!3449 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!982010 () Bool)

(declare-fun e!553545 () Bool)

(assert (=> b!982010 (= e!553545 tp_is_empty!22831)))

(declare-fun b!982011 () Bool)

(declare-fun res!657199 () Bool)

(assert (=> b!982011 (=> (not res!657199) (not e!553549))))

(declare-datatypes ((List!20600 0))(
  ( (Nil!20597) (Cons!20596 (h!21758 (_ BitVec 64)) (t!29324 List!20600)) )
))
(declare-fun arrayNoDuplicates!0 (array!61592 (_ BitVec 32) List!20600) Bool)

(assert (=> b!982011 (= res!657199 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20597))))

(declare-fun b!982012 () Bool)

(declare-fun res!657203 () Bool)

(assert (=> b!982012 (=> (not res!657203) (not e!553549))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!982012 (= res!657203 (validKeyInArray!0 (select (arr!29654 _keys!1544) from!1932)))))

(declare-fun b!982013 () Bool)

(declare-fun e!553548 () Bool)

(assert (=> b!982013 (= e!553548 tp_is_empty!22831)))

(declare-fun mapNonEmpty!36275 () Bool)

(declare-fun tp!68872 () Bool)

(assert (=> mapNonEmpty!36275 (= mapRes!36275 (and tp!68872 e!553545))))

(declare-fun mapKey!36275 () (_ BitVec 32))

(declare-fun mapRest!36275 () (Array (_ BitVec 32) ValueCell!10934))

(declare-fun mapValue!36275 () ValueCell!10934)

(assert (=> mapNonEmpty!36275 (= (arr!29653 _values!1278) (store mapRest!36275 mapKey!36275 mapValue!36275))))

(declare-fun b!982014 () Bool)

(declare-fun res!657197 () Bool)

(assert (=> b!982014 (=> (not res!657197) (not e!553549))))

(assert (=> b!982014 (= res!657197 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30135 _keys!1544))))))

(declare-fun b!982015 () Bool)

(assert (=> b!982015 (= e!553547 (and e!553548 mapRes!36275))))

(declare-fun condMapEmpty!36275 () Bool)

(declare-fun mapDefault!36275 () ValueCell!10934)

(assert (=> b!982015 (= condMapEmpty!36275 (= (arr!29653 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10934)) mapDefault!36275)))))

(assert (= (and start!84010 res!657200) b!982005))

(assert (= (and b!982005 res!657204) b!982006))

(assert (= (and b!982006 res!657202) b!982011))

(assert (= (and b!982011 res!657199) b!982014))

(assert (= (and b!982014 res!657197) b!982012))

(assert (= (and b!982012 res!657203) b!982008))

(assert (= (and b!982008 res!657198) b!982009))

(assert (= (and b!982009 res!657201) b!982007))

(assert (= (and b!982015 condMapEmpty!36275) mapIsEmpty!36275))

(assert (= (and b!982015 (not condMapEmpty!36275)) mapNonEmpty!36275))

(get-info :version)

(assert (= (and mapNonEmpty!36275 ((_ is ValueCellFull!10934) mapValue!36275)) b!982010))

(assert (= (and b!982015 ((_ is ValueCellFull!10934) mapDefault!36275)) b!982013))

(assert (= start!84010 b!982015))

(declare-fun b_lambda!14803 () Bool)

(assert (=> (not b_lambda!14803) (not b!982009)))

(declare-fun t!29322 () Bool)

(declare-fun tb!6575 () Bool)

(assert (=> (and start!84010 (= defaultEntry!1281 defaultEntry!1281) t!29322) tb!6575))

(declare-fun result!13147 () Bool)

(assert (=> tb!6575 (= result!13147 tp_is_empty!22831)))

(assert (=> b!982009 t!29322))

(declare-fun b_and!31625 () Bool)

(assert (= b_and!31623 (and (=> t!29322 result!13147) b_and!31625)))

(declare-fun m!908831 () Bool)

(assert (=> b!982012 m!908831))

(assert (=> b!982012 m!908831))

(declare-fun m!908833 () Bool)

(assert (=> b!982012 m!908833))

(declare-fun m!908835 () Bool)

(assert (=> b!982006 m!908835))

(declare-fun m!908837 () Bool)

(assert (=> b!982011 m!908837))

(assert (=> b!982009 m!908831))

(declare-fun m!908839 () Bool)

(assert (=> b!982009 m!908839))

(declare-fun m!908841 () Bool)

(assert (=> b!982009 m!908841))

(declare-fun m!908843 () Bool)

(assert (=> b!982009 m!908843))

(assert (=> b!982009 m!908839))

(assert (=> b!982009 m!908843))

(declare-fun m!908845 () Bool)

(assert (=> b!982009 m!908845))

(assert (=> b!982007 m!908831))

(declare-fun m!908847 () Bool)

(assert (=> b!982007 m!908847))

(declare-fun m!908849 () Bool)

(assert (=> b!982007 m!908849))

(declare-fun m!908851 () Bool)

(assert (=> b!982007 m!908851))

(declare-fun m!908853 () Bool)

(assert (=> b!982007 m!908853))

(assert (=> b!982007 m!908847))

(assert (=> b!982007 m!908831))

(declare-fun m!908855 () Bool)

(assert (=> b!982007 m!908855))

(assert (=> b!982007 m!908851))

(declare-fun m!908857 () Bool)

(assert (=> start!84010 m!908857))

(declare-fun m!908859 () Bool)

(assert (=> start!84010 m!908859))

(declare-fun m!908861 () Bool)

(assert (=> start!84010 m!908861))

(declare-fun m!908863 () Bool)

(assert (=> mapNonEmpty!36275 m!908863))

(check-sat (not b_lambda!14803) (not b!982012) tp_is_empty!22831 (not b!982006) (not mapNonEmpty!36275) (not b!982007) b_and!31625 (not start!84010) (not b!982009) (not b_next!19783) (not b!982011))
(check-sat b_and!31625 (not b_next!19783))
