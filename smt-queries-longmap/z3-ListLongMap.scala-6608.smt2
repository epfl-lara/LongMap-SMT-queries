; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83514 () Bool)

(assert start!83514)

(declare-fun b_free!19519 () Bool)

(declare-fun b_next!19519 () Bool)

(assert (=> start!83514 (= b_free!19519 (not b_next!19519))))

(declare-fun tp!67846 () Bool)

(declare-fun b_and!31107 () Bool)

(assert (=> start!83514 (= tp!67846 b_and!31107)))

(declare-fun b!975739 () Bool)

(declare-fun res!653253 () Bool)

(declare-fun e!549877 () Bool)

(assert (=> b!975739 (=> (not res!653253) (not e!549877))))

(declare-datatypes ((V!34881 0))(
  ( (V!34882 (val!11262 Int)) )
))
(declare-datatypes ((ValueCell!10730 0))(
  ( (ValueCellFull!10730 (v!13820 V!34881)) (EmptyCell!10730) )
))
(declare-datatypes ((array!60806 0))(
  ( (array!60807 (arr!29267 (Array (_ BitVec 32) ValueCell!10730)) (size!29748 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60806)

(declare-fun zeroValue!1367 () V!34881)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34881)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60808 0))(
  ( (array!60809 (arr!29268 (Array (_ BitVec 32) (_ BitVec 64))) (size!29749 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60808)

(declare-datatypes ((tuple2!14550 0))(
  ( (tuple2!14551 (_1!7286 (_ BitVec 64)) (_2!7286 V!34881)) )
))
(declare-datatypes ((List!20357 0))(
  ( (Nil!20354) (Cons!20353 (h!21515 tuple2!14550) (t!28839 List!20357)) )
))
(declare-datatypes ((ListLongMap!13237 0))(
  ( (ListLongMap!13238 (toList!6634 List!20357)) )
))
(declare-fun contains!5662 (ListLongMap!13237 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3796 (array!60808 array!60806 (_ BitVec 32) (_ BitVec 32) V!34881 V!34881 (_ BitVec 32) Int) ListLongMap!13237)

(assert (=> b!975739 (= res!653253 (contains!5662 (getCurrentListMap!3796 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29268 _keys!1717) i!822)))))

(declare-fun b!975740 () Bool)

(declare-fun e!549880 () Bool)

(declare-fun tp_is_empty!22423 () Bool)

(assert (=> b!975740 (= e!549880 tp_is_empty!22423)))

(declare-fun b!975741 () Bool)

(declare-fun res!653249 () Bool)

(assert (=> b!975741 (=> (not res!653249) (not e!549877))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!975741 (= res!653249 (validKeyInArray!0 (select (arr!29268 _keys!1717) i!822)))))

(declare-fun b!975742 () Bool)

(declare-fun res!653254 () Bool)

(assert (=> b!975742 (=> (not res!653254) (not e!549877))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60808 (_ BitVec 32)) Bool)

(assert (=> b!975742 (= res!653254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!975743 () Bool)

(declare-fun e!549881 () Bool)

(assert (=> b!975743 (= e!549881 (not (bvsge i!822 #b00000000000000000000000000000000)))))

(declare-fun lt!432719 () (_ BitVec 64))

(declare-fun lt!432720 () ListLongMap!13237)

(declare-fun +!2938 (ListLongMap!13237 tuple2!14550) ListLongMap!13237)

(declare-fun get!15165 (ValueCell!10730 V!34881) V!34881)

(declare-fun dynLambda!1694 (Int (_ BitVec 64)) V!34881)

(assert (=> b!975743 (= lt!432720 (+!2938 (getCurrentListMap!3796 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14551 lt!432719 (get!15165 (select (arr!29267 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1694 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32328 0))(
  ( (Unit!32329) )
))
(declare-fun lt!432718 () Unit!32328)

(declare-fun lemmaListMapRecursiveValidKeyArray!278 (array!60808 array!60806 (_ BitVec 32) (_ BitVec 32) V!34881 V!34881 (_ BitVec 32) Int) Unit!32328)

(assert (=> b!975743 (= lt!432718 (lemmaListMapRecursiveValidKeyArray!278 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun mapIsEmpty!35644 () Bool)

(declare-fun mapRes!35644 () Bool)

(assert (=> mapIsEmpty!35644 mapRes!35644))

(declare-fun mapNonEmpty!35644 () Bool)

(declare-fun tp!67845 () Bool)

(assert (=> mapNonEmpty!35644 (= mapRes!35644 (and tp!67845 e!549880))))

(declare-fun mapKey!35644 () (_ BitVec 32))

(declare-fun mapRest!35644 () (Array (_ BitVec 32) ValueCell!10730))

(declare-fun mapValue!35644 () ValueCell!10730)

(assert (=> mapNonEmpty!35644 (= (arr!29267 _values!1425) (store mapRest!35644 mapKey!35644 mapValue!35644))))

(declare-fun b!975745 () Bool)

(declare-fun res!653250 () Bool)

(assert (=> b!975745 (=> (not res!653250) (not e!549877))))

(assert (=> b!975745 (= res!653250 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29749 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29749 _keys!1717))))))

(declare-fun b!975746 () Bool)

(declare-fun res!653248 () Bool)

(assert (=> b!975746 (=> (not res!653248) (not e!549877))))

(declare-datatypes ((List!20358 0))(
  ( (Nil!20355) (Cons!20354 (h!21516 (_ BitVec 64)) (t!28840 List!20358)) )
))
(declare-fun arrayNoDuplicates!0 (array!60808 (_ BitVec 32) List!20358) Bool)

(assert (=> b!975746 (= res!653248 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20355))))

(declare-fun b!975747 () Bool)

(declare-fun e!549878 () Bool)

(assert (=> b!975747 (= e!549878 tp_is_empty!22423)))

(declare-fun res!653251 () Bool)

(assert (=> start!83514 (=> (not res!653251) (not e!549877))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83514 (= res!653251 (validMask!0 mask!2147))))

(assert (=> start!83514 e!549877))

(assert (=> start!83514 true))

(declare-fun e!549879 () Bool)

(declare-fun array_inv!22677 (array!60806) Bool)

(assert (=> start!83514 (and (array_inv!22677 _values!1425) e!549879)))

(assert (=> start!83514 tp_is_empty!22423))

(assert (=> start!83514 tp!67846))

(declare-fun array_inv!22678 (array!60808) Bool)

(assert (=> start!83514 (array_inv!22678 _keys!1717)))

(declare-fun b!975744 () Bool)

(assert (=> b!975744 (= e!549879 (and e!549878 mapRes!35644))))

(declare-fun condMapEmpty!35644 () Bool)

(declare-fun mapDefault!35644 () ValueCell!10730)

(assert (=> b!975744 (= condMapEmpty!35644 (= (arr!29267 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10730)) mapDefault!35644)))))

(declare-fun b!975748 () Bool)

(assert (=> b!975748 (= e!549877 e!549881)))

(declare-fun res!653247 () Bool)

(assert (=> b!975748 (=> (not res!653247) (not e!549881))))

(assert (=> b!975748 (= res!653247 (validKeyInArray!0 lt!432719))))

(assert (=> b!975748 (= lt!432719 (select (arr!29268 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!975748 (= lt!432720 (getCurrentListMap!3796 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!975749 () Bool)

(declare-fun res!653252 () Bool)

(assert (=> b!975749 (=> (not res!653252) (not e!549877))))

(assert (=> b!975749 (= res!653252 (and (= (size!29748 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29749 _keys!1717) (size!29748 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(assert (= (and start!83514 res!653251) b!975749))

(assert (= (and b!975749 res!653252) b!975742))

(assert (= (and b!975742 res!653254) b!975746))

(assert (= (and b!975746 res!653248) b!975745))

(assert (= (and b!975745 res!653250) b!975741))

(assert (= (and b!975741 res!653249) b!975739))

(assert (= (and b!975739 res!653253) b!975748))

(assert (= (and b!975748 res!653247) b!975743))

(assert (= (and b!975744 condMapEmpty!35644) mapIsEmpty!35644))

(assert (= (and b!975744 (not condMapEmpty!35644)) mapNonEmpty!35644))

(get-info :version)

(assert (= (and mapNonEmpty!35644 ((_ is ValueCellFull!10730) mapValue!35644)) b!975740))

(assert (= (and b!975744 ((_ is ValueCellFull!10730) mapDefault!35644)) b!975747))

(assert (= start!83514 b!975744))

(declare-fun b_lambda!14539 () Bool)

(assert (=> (not b_lambda!14539) (not b!975743)))

(declare-fun t!28838 () Bool)

(declare-fun tb!6333 () Bool)

(assert (=> (and start!83514 (= defaultEntry!1428 defaultEntry!1428) t!28838) tb!6333))

(declare-fun result!12651 () Bool)

(assert (=> tb!6333 (= result!12651 tp_is_empty!22423)))

(assert (=> b!975743 t!28838))

(declare-fun b_and!31109 () Bool)

(assert (= b_and!31107 (and (=> t!28838 result!12651) b_and!31109)))

(declare-fun m!902399 () Bool)

(assert (=> b!975746 m!902399))

(declare-fun m!902401 () Bool)

(assert (=> b!975739 m!902401))

(declare-fun m!902403 () Bool)

(assert (=> b!975739 m!902403))

(assert (=> b!975739 m!902401))

(assert (=> b!975739 m!902403))

(declare-fun m!902405 () Bool)

(assert (=> b!975739 m!902405))

(assert (=> b!975741 m!902403))

(assert (=> b!975741 m!902403))

(declare-fun m!902407 () Bool)

(assert (=> b!975741 m!902407))

(declare-fun m!902409 () Bool)

(assert (=> b!975742 m!902409))

(declare-fun m!902411 () Bool)

(assert (=> start!83514 m!902411))

(declare-fun m!902413 () Bool)

(assert (=> start!83514 m!902413))

(declare-fun m!902415 () Bool)

(assert (=> start!83514 m!902415))

(declare-fun m!902417 () Bool)

(assert (=> mapNonEmpty!35644 m!902417))

(declare-fun m!902419 () Bool)

(assert (=> b!975748 m!902419))

(declare-fun m!902421 () Bool)

(assert (=> b!975748 m!902421))

(declare-fun m!902423 () Bool)

(assert (=> b!975748 m!902423))

(declare-fun m!902425 () Bool)

(assert (=> b!975743 m!902425))

(declare-fun m!902427 () Bool)

(assert (=> b!975743 m!902427))

(declare-fun m!902429 () Bool)

(assert (=> b!975743 m!902429))

(assert (=> b!975743 m!902425))

(declare-fun m!902431 () Bool)

(assert (=> b!975743 m!902431))

(assert (=> b!975743 m!902429))

(assert (=> b!975743 m!902431))

(declare-fun m!902433 () Bool)

(assert (=> b!975743 m!902433))

(declare-fun m!902435 () Bool)

(assert (=> b!975743 m!902435))

(check-sat (not b!975743) (not b!975739) (not b!975741) (not b_lambda!14539) (not b!975748) b_and!31109 (not b_next!19519) (not b!975746) (not start!83514) (not mapNonEmpty!35644) tp_is_empty!22423 (not b!975742))
(check-sat b_and!31109 (not b_next!19519))
