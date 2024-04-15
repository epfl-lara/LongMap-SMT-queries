; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83532 () Bool)

(assert start!83532)

(declare-fun b_free!19537 () Bool)

(declare-fun b_next!19537 () Bool)

(assert (=> start!83532 (= b_free!19537 (not b_next!19537))))

(declare-fun tp!67900 () Bool)

(declare-fun b_and!31143 () Bool)

(assert (=> start!83532 (= tp!67900 b_and!31143)))

(declare-fun b!976054 () Bool)

(declare-fun e!550055 () Bool)

(declare-fun e!550054 () Bool)

(assert (=> b!976054 (= e!550055 e!550054)))

(declare-fun res!653467 () Bool)

(assert (=> b!976054 (=> (not res!653467) (not e!550054))))

(declare-fun lt!432845 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!976054 (= res!653467 (validKeyInArray!0 lt!432845))))

(declare-datatypes ((array!60842 0))(
  ( (array!60843 (arr!29285 (Array (_ BitVec 32) (_ BitVec 64))) (size!29766 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60842)

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!976054 (= lt!432845 (select (arr!29285 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34905 0))(
  ( (V!34906 (val!11271 Int)) )
))
(declare-datatypes ((tuple2!14562 0))(
  ( (tuple2!14563 (_1!7292 (_ BitVec 64)) (_2!7292 V!34905)) )
))
(declare-datatypes ((List!20368 0))(
  ( (Nil!20365) (Cons!20364 (h!21526 tuple2!14562) (t!28868 List!20368)) )
))
(declare-datatypes ((ListLongMap!13249 0))(
  ( (ListLongMap!13250 (toList!6640 List!20368)) )
))
(declare-fun lt!432848 () ListLongMap!13249)

(declare-datatypes ((ValueCell!10739 0))(
  ( (ValueCellFull!10739 (v!13829 V!34905)) (EmptyCell!10739) )
))
(declare-datatypes ((array!60844 0))(
  ( (array!60845 (arr!29286 (Array (_ BitVec 32) ValueCell!10739)) (size!29767 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60844)

(declare-fun zeroValue!1367 () V!34905)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34905)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3802 (array!60842 array!60844 (_ BitVec 32) (_ BitVec 32) V!34905 V!34905 (_ BitVec 32) Int) ListLongMap!13249)

(assert (=> b!976054 (= lt!432848 (getCurrentListMap!3802 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!976055 () Bool)

(declare-fun e!550050 () Bool)

(assert (=> b!976055 (= e!550050 e!550055)))

(declare-fun res!653469 () Bool)

(assert (=> b!976055 (=> (not res!653469) (not e!550055))))

(declare-fun lt!432849 () ListLongMap!13249)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun contains!5667 (ListLongMap!13249 (_ BitVec 64)) Bool)

(assert (=> b!976055 (= res!653469 (contains!5667 lt!432849 (select (arr!29285 _keys!1717) i!822)))))

(assert (=> b!976055 (= lt!432849 (getCurrentListMap!3802 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun b!976056 () Bool)

(declare-fun res!653463 () Bool)

(assert (=> b!976056 (=> (not res!653463) (not e!550050))))

(declare-datatypes ((List!20369 0))(
  ( (Nil!20366) (Cons!20365 (h!21527 (_ BitVec 64)) (t!28869 List!20369)) )
))
(declare-fun arrayNoDuplicates!0 (array!60842 (_ BitVec 32) List!20369) Bool)

(assert (=> b!976056 (= res!653463 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20366))))

(declare-fun mapIsEmpty!35671 () Bool)

(declare-fun mapRes!35671 () Bool)

(assert (=> mapIsEmpty!35671 mapRes!35671))

(declare-fun b!976057 () Bool)

(declare-fun res!653464 () Bool)

(assert (=> b!976057 (=> (not res!653464) (not e!550050))))

(assert (=> b!976057 (= res!653464 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29766 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29766 _keys!1717))))))

(declare-fun b!976058 () Bool)

(declare-fun res!653466 () Bool)

(assert (=> b!976058 (=> (not res!653466) (not e!550050))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60842 (_ BitVec 32)) Bool)

(assert (=> b!976058 (= res!653466 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapNonEmpty!35671 () Bool)

(declare-fun tp!67899 () Bool)

(declare-fun e!550051 () Bool)

(assert (=> mapNonEmpty!35671 (= mapRes!35671 (and tp!67899 e!550051))))

(declare-fun mapKey!35671 () (_ BitVec 32))

(declare-fun mapRest!35671 () (Array (_ BitVec 32) ValueCell!10739))

(declare-fun mapValue!35671 () ValueCell!10739)

(assert (=> mapNonEmpty!35671 (= (arr!29286 _values!1425) (store mapRest!35671 mapKey!35671 mapValue!35671))))

(declare-fun b!976059 () Bool)

(declare-fun e!550056 () Bool)

(declare-fun tp_is_empty!22441 () Bool)

(assert (=> b!976059 (= e!550056 tp_is_empty!22441)))

(declare-fun b!976060 () Bool)

(assert (=> b!976060 (= e!550054 (not (contains!5667 lt!432848 (select (arr!29285 _keys!1717) i!822))))))

(declare-fun lt!432844 () tuple2!14562)

(declare-fun +!2943 (ListLongMap!13249 tuple2!14562) ListLongMap!13249)

(assert (=> b!976060 (contains!5667 (+!2943 lt!432849 lt!432844) (select (arr!29285 _keys!1717) i!822))))

(declare-datatypes ((Unit!32338 0))(
  ( (Unit!32339) )
))
(declare-fun lt!432847 () Unit!32338)

(declare-fun lt!432843 () V!34905)

(declare-fun addStillContains!604 (ListLongMap!13249 (_ BitVec 64) V!34905 (_ BitVec 64)) Unit!32338)

(assert (=> b!976060 (= lt!432847 (addStillContains!604 lt!432849 lt!432845 lt!432843 (select (arr!29285 _keys!1717) i!822)))))

(assert (=> b!976060 (= lt!432848 (+!2943 (getCurrentListMap!3802 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) lt!432844))))

(assert (=> b!976060 (= lt!432844 (tuple2!14563 lt!432845 lt!432843))))

(declare-fun get!15176 (ValueCell!10739 V!34905) V!34905)

(declare-fun dynLambda!1699 (Int (_ BitVec 64)) V!34905)

(assert (=> b!976060 (= lt!432843 (get!15176 (select (arr!29286 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1699 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!432846 () Unit!32338)

(declare-fun lemmaListMapRecursiveValidKeyArray!283 (array!60842 array!60844 (_ BitVec 32) (_ BitVec 32) V!34905 V!34905 (_ BitVec 32) Int) Unit!32338)

(assert (=> b!976060 (= lt!432846 (lemmaListMapRecursiveValidKeyArray!283 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!976061 () Bool)

(declare-fun res!653470 () Bool)

(assert (=> b!976061 (=> (not res!653470) (not e!550050))))

(assert (=> b!976061 (= res!653470 (validKeyInArray!0 (select (arr!29285 _keys!1717) i!822)))))

(declare-fun b!976062 () Bool)

(declare-fun e!550053 () Bool)

(assert (=> b!976062 (= e!550053 (and e!550056 mapRes!35671))))

(declare-fun condMapEmpty!35671 () Bool)

(declare-fun mapDefault!35671 () ValueCell!10739)

(assert (=> b!976062 (= condMapEmpty!35671 (= (arr!29286 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10739)) mapDefault!35671)))))

(declare-fun b!976063 () Bool)

(declare-fun res!653468 () Bool)

(assert (=> b!976063 (=> (not res!653468) (not e!550050))))

(assert (=> b!976063 (= res!653468 (and (= (size!29767 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29766 _keys!1717) (size!29767 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!976064 () Bool)

(assert (=> b!976064 (= e!550051 tp_is_empty!22441)))

(declare-fun res!653465 () Bool)

(assert (=> start!83532 (=> (not res!653465) (not e!550050))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83532 (= res!653465 (validMask!0 mask!2147))))

(assert (=> start!83532 e!550050))

(assert (=> start!83532 true))

(declare-fun array_inv!22687 (array!60844) Bool)

(assert (=> start!83532 (and (array_inv!22687 _values!1425) e!550053)))

(assert (=> start!83532 tp_is_empty!22441))

(assert (=> start!83532 tp!67900))

(declare-fun array_inv!22688 (array!60842) Bool)

(assert (=> start!83532 (array_inv!22688 _keys!1717)))

(assert (= (and start!83532 res!653465) b!976063))

(assert (= (and b!976063 res!653468) b!976058))

(assert (= (and b!976058 res!653466) b!976056))

(assert (= (and b!976056 res!653463) b!976057))

(assert (= (and b!976057 res!653464) b!976061))

(assert (= (and b!976061 res!653470) b!976055))

(assert (= (and b!976055 res!653469) b!976054))

(assert (= (and b!976054 res!653467) b!976060))

(assert (= (and b!976062 condMapEmpty!35671) mapIsEmpty!35671))

(assert (= (and b!976062 (not condMapEmpty!35671)) mapNonEmpty!35671))

(get-info :version)

(assert (= (and mapNonEmpty!35671 ((_ is ValueCellFull!10739) mapValue!35671)) b!976064))

(assert (= (and b!976062 ((_ is ValueCellFull!10739) mapDefault!35671)) b!976059))

(assert (= start!83532 b!976062))

(declare-fun b_lambda!14557 () Bool)

(assert (=> (not b_lambda!14557) (not b!976060)))

(declare-fun t!28867 () Bool)

(declare-fun tb!6351 () Bool)

(assert (=> (and start!83532 (= defaultEntry!1428 defaultEntry!1428) t!28867) tb!6351))

(declare-fun result!12687 () Bool)

(assert (=> tb!6351 (= result!12687 tp_is_empty!22441)))

(assert (=> b!976060 t!28867))

(declare-fun b_and!31145 () Bool)

(assert (= b_and!31143 (and (=> t!28867 result!12687) b_and!31145)))

(declare-fun m!902759 () Bool)

(assert (=> b!976060 m!902759))

(declare-fun m!902761 () Bool)

(assert (=> b!976060 m!902761))

(declare-fun m!902763 () Bool)

(assert (=> b!976060 m!902763))

(assert (=> b!976060 m!902761))

(declare-fun m!902765 () Bool)

(assert (=> b!976060 m!902765))

(declare-fun m!902767 () Bool)

(assert (=> b!976060 m!902767))

(declare-fun m!902769 () Bool)

(assert (=> b!976060 m!902769))

(declare-fun m!902771 () Bool)

(assert (=> b!976060 m!902771))

(assert (=> b!976060 m!902767))

(assert (=> b!976060 m!902769))

(assert (=> b!976060 m!902759))

(assert (=> b!976060 m!902763))

(declare-fun m!902773 () Bool)

(assert (=> b!976060 m!902773))

(assert (=> b!976060 m!902769))

(declare-fun m!902775 () Bool)

(assert (=> b!976060 m!902775))

(assert (=> b!976060 m!902769))

(declare-fun m!902777 () Bool)

(assert (=> b!976060 m!902777))

(declare-fun m!902779 () Bool)

(assert (=> b!976060 m!902779))

(declare-fun m!902781 () Bool)

(assert (=> mapNonEmpty!35671 m!902781))

(declare-fun m!902783 () Bool)

(assert (=> b!976054 m!902783))

(declare-fun m!902785 () Bool)

(assert (=> b!976054 m!902785))

(declare-fun m!902787 () Bool)

(assert (=> b!976054 m!902787))

(declare-fun m!902789 () Bool)

(assert (=> start!83532 m!902789))

(declare-fun m!902791 () Bool)

(assert (=> start!83532 m!902791))

(declare-fun m!902793 () Bool)

(assert (=> start!83532 m!902793))

(declare-fun m!902795 () Bool)

(assert (=> b!976056 m!902795))

(assert (=> b!976055 m!902769))

(assert (=> b!976055 m!902769))

(declare-fun m!902797 () Bool)

(assert (=> b!976055 m!902797))

(declare-fun m!902799 () Bool)

(assert (=> b!976055 m!902799))

(assert (=> b!976061 m!902769))

(assert (=> b!976061 m!902769))

(declare-fun m!902801 () Bool)

(assert (=> b!976061 m!902801))

(declare-fun m!902803 () Bool)

(assert (=> b!976058 m!902803))

(check-sat (not b!976058) (not b_lambda!14557) (not b!976061) (not start!83532) (not b!976056) tp_is_empty!22441 (not b!976054) (not mapNonEmpty!35671) (not b!976055) (not b!976060) (not b_next!19537) b_and!31145)
(check-sat b_and!31145 (not b_next!19537))
