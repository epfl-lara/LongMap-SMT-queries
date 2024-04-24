; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83688 () Bool)

(assert start!83688)

(declare-fun b_free!19507 () Bool)

(declare-fun b_next!19507 () Bool)

(assert (=> start!83688 (= b_free!19507 (not b_next!19507))))

(declare-fun tp!67810 () Bool)

(declare-fun b_and!31119 () Bool)

(assert (=> start!83688 (= tp!67810 b_and!31119)))

(declare-fun mapNonEmpty!35626 () Bool)

(declare-fun mapRes!35626 () Bool)

(declare-fun tp!67809 () Bool)

(declare-fun e!550504 () Bool)

(assert (=> mapNonEmpty!35626 (= mapRes!35626 (and tp!67809 e!550504))))

(declare-datatypes ((V!34865 0))(
  ( (V!34866 (val!11256 Int)) )
))
(declare-datatypes ((ValueCell!10724 0))(
  ( (ValueCellFull!10724 (v!13812 V!34865)) (EmptyCell!10724) )
))
(declare-fun mapValue!35626 () ValueCell!10724)

(declare-datatypes ((array!60890 0))(
  ( (array!60891 (arr!29304 (Array (_ BitVec 32) ValueCell!10724)) (size!29784 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60890)

(declare-fun mapRest!35626 () (Array (_ BitVec 32) ValueCell!10724))

(declare-fun mapKey!35626 () (_ BitVec 32))

(assert (=> mapNonEmpty!35626 (= (arr!29304 _values!1425) (store mapRest!35626 mapKey!35626 mapValue!35626))))

(declare-fun b!976671 () Bool)

(declare-fun res!653563 () Bool)

(declare-fun e!550503 () Bool)

(assert (=> b!976671 (=> (not res!653563) (not e!550503))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34865)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60892 0))(
  ( (array!60893 (arr!29305 (Array (_ BitVec 32) (_ BitVec 64))) (size!29785 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60892)

(declare-fun zeroValue!1367 () V!34865)

(declare-fun i!822 () (_ BitVec 32))

(declare-datatypes ((tuple2!14480 0))(
  ( (tuple2!14481 (_1!7251 (_ BitVec 64)) (_2!7251 V!34865)) )
))
(declare-datatypes ((List!20326 0))(
  ( (Nil!20323) (Cons!20322 (h!21490 tuple2!14480) (t!28797 List!20326)) )
))
(declare-datatypes ((ListLongMap!13179 0))(
  ( (ListLongMap!13180 (toList!6605 List!20326)) )
))
(declare-fun contains!5704 (ListLongMap!13179 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3838 (array!60892 array!60890 (_ BitVec 32) (_ BitVec 32) V!34865 V!34865 (_ BitVec 32) Int) ListLongMap!13179)

(assert (=> b!976671 (= res!653563 (contains!5704 (getCurrentListMap!3838 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29305 _keys!1717) i!822)))))

(declare-fun b!976672 () Bool)

(declare-fun e!550502 () Bool)

(declare-fun e!550499 () Bool)

(assert (=> b!976672 (= e!550502 (and e!550499 mapRes!35626))))

(declare-fun condMapEmpty!35626 () Bool)

(declare-fun mapDefault!35626 () ValueCell!10724)

(assert (=> b!976672 (= condMapEmpty!35626 (= (arr!29304 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10724)) mapDefault!35626)))))

(declare-fun b!976673 () Bool)

(declare-fun res!653561 () Bool)

(assert (=> b!976673 (=> (not res!653561) (not e!550503))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!976673 (= res!653561 (validKeyInArray!0 (select (arr!29305 _keys!1717) i!822)))))

(declare-fun mapIsEmpty!35626 () Bool)

(assert (=> mapIsEmpty!35626 mapRes!35626))

(declare-fun res!653564 () Bool)

(assert (=> start!83688 (=> (not res!653564) (not e!550503))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83688 (= res!653564 (validMask!0 mask!2147))))

(assert (=> start!83688 e!550503))

(assert (=> start!83688 true))

(declare-fun array_inv!22719 (array!60890) Bool)

(assert (=> start!83688 (and (array_inv!22719 _values!1425) e!550502)))

(declare-fun tp_is_empty!22411 () Bool)

(assert (=> start!83688 tp_is_empty!22411))

(assert (=> start!83688 tp!67810))

(declare-fun array_inv!22720 (array!60892) Bool)

(assert (=> start!83688 (array_inv!22720 _keys!1717)))

(declare-fun b!976674 () Bool)

(declare-fun e!550501 () Bool)

(assert (=> b!976674 (= e!550503 e!550501)))

(declare-fun res!653557 () Bool)

(assert (=> b!976674 (=> (not res!653557) (not e!550501))))

(declare-fun lt!433263 () (_ BitVec 64))

(assert (=> b!976674 (= res!653557 (validKeyInArray!0 lt!433263))))

(assert (=> b!976674 (= lt!433263 (select (arr!29305 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun lt!433261 () ListLongMap!13179)

(assert (=> b!976674 (= lt!433261 (getCurrentListMap!3838 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!976675 () Bool)

(declare-fun res!653560 () Bool)

(assert (=> b!976675 (=> (not res!653560) (not e!550503))))

(assert (=> b!976675 (= res!653560 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29785 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29785 _keys!1717))))))

(declare-fun b!976676 () Bool)

(assert (=> b!976676 (= e!550504 tp_is_empty!22411)))

(declare-fun b!976677 () Bool)

(declare-fun res!653562 () Bool)

(assert (=> b!976677 (=> (not res!653562) (not e!550503))))

(declare-datatypes ((List!20327 0))(
  ( (Nil!20324) (Cons!20323 (h!21491 (_ BitVec 64)) (t!28798 List!20327)) )
))
(declare-fun arrayNoDuplicates!0 (array!60892 (_ BitVec 32) List!20327) Bool)

(assert (=> b!976677 (= res!653562 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20324))))

(declare-fun b!976678 () Bool)

(declare-fun res!653558 () Bool)

(assert (=> b!976678 (=> (not res!653558) (not e!550503))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60892 (_ BitVec 32)) Bool)

(assert (=> b!976678 (= res!653558 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!976679 () Bool)

(assert (=> b!976679 (= e!550499 tp_is_empty!22411)))

(declare-fun b!976680 () Bool)

(assert (=> b!976680 (= e!550501 (not (bvslt (bvsub from!2118 #b00000000000000000000000000000001) (size!29785 _keys!1717))))))

(declare-fun +!2925 (ListLongMap!13179 tuple2!14480) ListLongMap!13179)

(declare-fun get!15188 (ValueCell!10724 V!34865) V!34865)

(declare-fun dynLambda!1722 (Int (_ BitVec 64)) V!34865)

(assert (=> b!976680 (= lt!433261 (+!2925 (getCurrentListMap!3838 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14481 lt!433263 (get!15188 (select (arr!29304 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1722 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32414 0))(
  ( (Unit!32415) )
))
(declare-fun lt!433262 () Unit!32414)

(declare-fun lemmaListMapRecursiveValidKeyArray!281 (array!60892 array!60890 (_ BitVec 32) (_ BitVec 32) V!34865 V!34865 (_ BitVec 32) Int) Unit!32414)

(assert (=> b!976680 (= lt!433262 (lemmaListMapRecursiveValidKeyArray!281 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!976681 () Bool)

(declare-fun res!653559 () Bool)

(assert (=> b!976681 (=> (not res!653559) (not e!550503))))

(assert (=> b!976681 (= res!653559 (and (= (size!29784 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29785 _keys!1717) (size!29784 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(assert (= (and start!83688 res!653564) b!976681))

(assert (= (and b!976681 res!653559) b!976678))

(assert (= (and b!976678 res!653558) b!976677))

(assert (= (and b!976677 res!653562) b!976675))

(assert (= (and b!976675 res!653560) b!976673))

(assert (= (and b!976673 res!653561) b!976671))

(assert (= (and b!976671 res!653563) b!976674))

(assert (= (and b!976674 res!653557) b!976680))

(assert (= (and b!976672 condMapEmpty!35626) mapIsEmpty!35626))

(assert (= (and b!976672 (not condMapEmpty!35626)) mapNonEmpty!35626))

(get-info :version)

(assert (= (and mapNonEmpty!35626 ((_ is ValueCellFull!10724) mapValue!35626)) b!976676))

(assert (= (and b!976672 ((_ is ValueCellFull!10724) mapDefault!35626)) b!976679))

(assert (= start!83688 b!976672))

(declare-fun b_lambda!14559 () Bool)

(assert (=> (not b_lambda!14559) (not b!976680)))

(declare-fun t!28796 () Bool)

(declare-fun tb!6321 () Bool)

(assert (=> (and start!83688 (= defaultEntry!1428 defaultEntry!1428) t!28796) tb!6321))

(declare-fun result!12627 () Bool)

(assert (=> tb!6321 (= result!12627 tp_is_empty!22411)))

(assert (=> b!976680 t!28796))

(declare-fun b_and!31121 () Bool)

(assert (= b_and!31119 (and (=> t!28796 result!12627) b_and!31121)))

(declare-fun m!904223 () Bool)

(assert (=> b!976671 m!904223))

(declare-fun m!904225 () Bool)

(assert (=> b!976671 m!904225))

(assert (=> b!976671 m!904223))

(assert (=> b!976671 m!904225))

(declare-fun m!904227 () Bool)

(assert (=> b!976671 m!904227))

(declare-fun m!904229 () Bool)

(assert (=> b!976678 m!904229))

(declare-fun m!904231 () Bool)

(assert (=> start!83688 m!904231))

(declare-fun m!904233 () Bool)

(assert (=> start!83688 m!904233))

(declare-fun m!904235 () Bool)

(assert (=> start!83688 m!904235))

(assert (=> b!976673 m!904225))

(assert (=> b!976673 m!904225))

(declare-fun m!904237 () Bool)

(assert (=> b!976673 m!904237))

(declare-fun m!904239 () Bool)

(assert (=> mapNonEmpty!35626 m!904239))

(declare-fun m!904241 () Bool)

(assert (=> b!976677 m!904241))

(declare-fun m!904243 () Bool)

(assert (=> b!976674 m!904243))

(declare-fun m!904245 () Bool)

(assert (=> b!976674 m!904245))

(declare-fun m!904247 () Bool)

(assert (=> b!976674 m!904247))

(declare-fun m!904249 () Bool)

(assert (=> b!976680 m!904249))

(declare-fun m!904251 () Bool)

(assert (=> b!976680 m!904251))

(declare-fun m!904253 () Bool)

(assert (=> b!976680 m!904253))

(declare-fun m!904255 () Bool)

(assert (=> b!976680 m!904255))

(assert (=> b!976680 m!904251))

(declare-fun m!904257 () Bool)

(assert (=> b!976680 m!904257))

(assert (=> b!976680 m!904249))

(assert (=> b!976680 m!904253))

(declare-fun m!904259 () Bool)

(assert (=> b!976680 m!904259))

(check-sat (not b_lambda!14559) tp_is_empty!22411 (not b!976674) (not b!976671) (not b_next!19507) b_and!31121 (not b!976678) (not b!976673) (not b!976677) (not start!83688) (not mapNonEmpty!35626) (not b!976680))
(check-sat b_and!31121 (not b_next!19507))
