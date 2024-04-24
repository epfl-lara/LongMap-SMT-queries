; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83724 () Bool)

(assert start!83724)

(declare-fun b_free!19543 () Bool)

(declare-fun b_next!19543 () Bool)

(assert (=> start!83724 (= b_free!19543 (not b_next!19543))))

(declare-fun tp!67918 () Bool)

(declare-fun b_and!31191 () Bool)

(assert (=> start!83724 (= tp!67918 b_and!31191)))

(declare-fun res!653990 () Bool)

(declare-fun e!550845 () Bool)

(assert (=> start!83724 (=> (not res!653990) (not e!550845))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83724 (= res!653990 (validMask!0 mask!2147))))

(assert (=> start!83724 e!550845))

(assert (=> start!83724 true))

(declare-datatypes ((V!34913 0))(
  ( (V!34914 (val!11274 Int)) )
))
(declare-datatypes ((ValueCell!10742 0))(
  ( (ValueCellFull!10742 (v!13830 V!34913)) (EmptyCell!10742) )
))
(declare-datatypes ((array!60960 0))(
  ( (array!60961 (arr!29339 (Array (_ BitVec 32) ValueCell!10742)) (size!29819 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60960)

(declare-fun e!550843 () Bool)

(declare-fun array_inv!22741 (array!60960) Bool)

(assert (=> start!83724 (and (array_inv!22741 _values!1425) e!550843)))

(declare-fun tp_is_empty!22447 () Bool)

(assert (=> start!83724 tp_is_empty!22447))

(assert (=> start!83724 tp!67918))

(declare-datatypes ((array!60962 0))(
  ( (array!60963 (arr!29340 (Array (_ BitVec 32) (_ BitVec 64))) (size!29820 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60962)

(declare-fun array_inv!22742 (array!60962) Bool)

(assert (=> start!83724 (array_inv!22742 _keys!1717)))

(declare-fun b!977301 () Bool)

(declare-fun e!550846 () Bool)

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!977301 (= e!550846 (bvslt i!822 #b00000000000000000000000000000000))))

(declare-fun b!977302 () Bool)

(declare-fun res!653991 () Bool)

(assert (=> b!977302 (=> (not res!653991) (not e!550845))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!977302 (= res!653991 (and (= (size!29819 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29820 _keys!1717) (size!29819 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!977303 () Bool)

(declare-fun res!653994 () Bool)

(assert (=> b!977303 (=> (not res!653994) (not e!550845))))

(declare-datatypes ((List!20356 0))(
  ( (Nil!20353) (Cons!20352 (h!21520 (_ BitVec 64)) (t!28861 List!20356)) )
))
(declare-fun arrayNoDuplicates!0 (array!60962 (_ BitVec 32) List!20356) Bool)

(assert (=> b!977303 (= res!653994 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20353))))

(declare-fun b!977304 () Bool)

(declare-fun res!653993 () Bool)

(assert (=> b!977304 (=> (not res!653993) (not e!550845))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!977304 (= res!653993 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29820 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29820 _keys!1717))))))

(declare-fun b!977305 () Bool)

(declare-fun res!653989 () Bool)

(assert (=> b!977305 (=> (not res!653989) (not e!550845))))

(declare-fun zeroValue!1367 () V!34913)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34913)

(declare-datatypes ((tuple2!14514 0))(
  ( (tuple2!14515 (_1!7268 (_ BitVec 64)) (_2!7268 V!34913)) )
))
(declare-datatypes ((List!20357 0))(
  ( (Nil!20354) (Cons!20353 (h!21521 tuple2!14514) (t!28862 List!20357)) )
))
(declare-datatypes ((ListLongMap!13213 0))(
  ( (ListLongMap!13214 (toList!6622 List!20357)) )
))
(declare-fun contains!5720 (ListLongMap!13213 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3855 (array!60962 array!60960 (_ BitVec 32) (_ BitVec 32) V!34913 V!34913 (_ BitVec 32) Int) ListLongMap!13213)

(assert (=> b!977305 (= res!653989 (contains!5720 (getCurrentListMap!3855 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29340 _keys!1717) i!822)))))

(declare-fun mapIsEmpty!35680 () Bool)

(declare-fun mapRes!35680 () Bool)

(assert (=> mapIsEmpty!35680 mapRes!35680))

(declare-fun b!977306 () Bool)

(declare-fun e!550844 () Bool)

(assert (=> b!977306 (= e!550844 tp_is_empty!22447)))

(declare-fun b!977307 () Bool)

(assert (=> b!977307 (= e!550845 e!550846)))

(declare-fun res!653992 () Bool)

(assert (=> b!977307 (=> (not res!653992) (not e!550846))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!977307 (= res!653992 (not (validKeyInArray!0 (select (arr!29340 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))))

(declare-fun lt!433491 () ListLongMap!13213)

(assert (=> b!977307 (= lt!433491 (getCurrentListMap!3855 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!977308 () Bool)

(declare-fun e!550842 () Bool)

(assert (=> b!977308 (= e!550843 (and e!550842 mapRes!35680))))

(declare-fun condMapEmpty!35680 () Bool)

(declare-fun mapDefault!35680 () ValueCell!10742)

(assert (=> b!977308 (= condMapEmpty!35680 (= (arr!29339 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10742)) mapDefault!35680)))))

(declare-fun b!977309 () Bool)

(assert (=> b!977309 (= e!550842 tp_is_empty!22447)))

(declare-fun b!977310 () Bool)

(declare-fun res!653996 () Bool)

(assert (=> b!977310 (=> (not res!653996) (not e!550845))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60962 (_ BitVec 32)) Bool)

(assert (=> b!977310 (= res!653996 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapNonEmpty!35680 () Bool)

(declare-fun tp!67917 () Bool)

(assert (=> mapNonEmpty!35680 (= mapRes!35680 (and tp!67917 e!550844))))

(declare-fun mapRest!35680 () (Array (_ BitVec 32) ValueCell!10742))

(declare-fun mapKey!35680 () (_ BitVec 32))

(declare-fun mapValue!35680 () ValueCell!10742)

(assert (=> mapNonEmpty!35680 (= (arr!29339 _values!1425) (store mapRest!35680 mapKey!35680 mapValue!35680))))

(declare-fun b!977311 () Bool)

(declare-fun res!653995 () Bool)

(assert (=> b!977311 (=> (not res!653995) (not e!550845))))

(assert (=> b!977311 (= res!653995 (validKeyInArray!0 (select (arr!29340 _keys!1717) i!822)))))

(assert (= (and start!83724 res!653990) b!977302))

(assert (= (and b!977302 res!653991) b!977310))

(assert (= (and b!977310 res!653996) b!977303))

(assert (= (and b!977303 res!653994) b!977304))

(assert (= (and b!977304 res!653993) b!977311))

(assert (= (and b!977311 res!653995) b!977305))

(assert (= (and b!977305 res!653989) b!977307))

(assert (= (and b!977307 res!653992) b!977301))

(assert (= (and b!977308 condMapEmpty!35680) mapIsEmpty!35680))

(assert (= (and b!977308 (not condMapEmpty!35680)) mapNonEmpty!35680))

(get-info :version)

(assert (= (and mapNonEmpty!35680 ((_ is ValueCellFull!10742) mapValue!35680)) b!977306))

(assert (= (and b!977308 ((_ is ValueCellFull!10742) mapDefault!35680)) b!977309))

(assert (= start!83724 b!977308))

(declare-fun m!904949 () Bool)

(assert (=> b!977303 m!904949))

(declare-fun m!904951 () Bool)

(assert (=> b!977307 m!904951))

(assert (=> b!977307 m!904951))

(declare-fun m!904953 () Bool)

(assert (=> b!977307 m!904953))

(declare-fun m!904955 () Bool)

(assert (=> b!977307 m!904955))

(declare-fun m!904957 () Bool)

(assert (=> b!977310 m!904957))

(declare-fun m!904959 () Bool)

(assert (=> start!83724 m!904959))

(declare-fun m!904961 () Bool)

(assert (=> start!83724 m!904961))

(declare-fun m!904963 () Bool)

(assert (=> start!83724 m!904963))

(declare-fun m!904965 () Bool)

(assert (=> mapNonEmpty!35680 m!904965))

(declare-fun m!904967 () Bool)

(assert (=> b!977305 m!904967))

(declare-fun m!904969 () Bool)

(assert (=> b!977305 m!904969))

(assert (=> b!977305 m!904967))

(assert (=> b!977305 m!904969))

(declare-fun m!904971 () Bool)

(assert (=> b!977305 m!904971))

(assert (=> b!977311 m!904969))

(assert (=> b!977311 m!904969))

(declare-fun m!904973 () Bool)

(assert (=> b!977311 m!904973))

(check-sat (not b!977303) tp_is_empty!22447 (not start!83724) b_and!31191 (not b!977310) (not b_next!19543) (not mapNonEmpty!35680) (not b!977307) (not b!977305) (not b!977311))
(check-sat b_and!31191 (not b_next!19543))
