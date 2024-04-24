; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83694 () Bool)

(assert start!83694)

(declare-fun b_free!19513 () Bool)

(declare-fun b_next!19513 () Bool)

(assert (=> start!83694 (= b_free!19513 (not b_next!19513))))

(declare-fun tp!67827 () Bool)

(declare-fun b_and!31131 () Bool)

(assert (=> start!83694 (= tp!67827 b_and!31131)))

(declare-fun b!976776 () Bool)

(declare-fun res!653632 () Bool)

(declare-fun e!550554 () Bool)

(assert (=> b!976776 (=> (not res!653632) (not e!550554))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34873 0))(
  ( (V!34874 (val!11259 Int)) )
))
(declare-datatypes ((ValueCell!10727 0))(
  ( (ValueCellFull!10727 (v!13815 V!34873)) (EmptyCell!10727) )
))
(declare-datatypes ((array!60902 0))(
  ( (array!60903 (arr!29310 (Array (_ BitVec 32) ValueCell!10727)) (size!29790 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60902)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60904 0))(
  ( (array!60905 (arr!29311 (Array (_ BitVec 32) (_ BitVec 64))) (size!29791 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60904)

(assert (=> b!976776 (= res!653632 (and (= (size!29790 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29791 _keys!1717) (size!29790 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!976777 () Bool)

(declare-fun res!653634 () Bool)

(assert (=> b!976777 (=> (not res!653634) (not e!550554))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60904 (_ BitVec 32)) Bool)

(assert (=> b!976777 (= res!653634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!976778 () Bool)

(declare-fun e!550553 () Bool)

(declare-fun e!550556 () Bool)

(declare-fun mapRes!35635 () Bool)

(assert (=> b!976778 (= e!550553 (and e!550556 mapRes!35635))))

(declare-fun condMapEmpty!35635 () Bool)

(declare-fun mapDefault!35635 () ValueCell!10727)

(assert (=> b!976778 (= condMapEmpty!35635 (= (arr!29310 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10727)) mapDefault!35635)))))

(declare-fun res!653629 () Bool)

(assert (=> start!83694 (=> (not res!653629) (not e!550554))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83694 (= res!653629 (validMask!0 mask!2147))))

(assert (=> start!83694 e!550554))

(assert (=> start!83694 true))

(declare-fun array_inv!22723 (array!60902) Bool)

(assert (=> start!83694 (and (array_inv!22723 _values!1425) e!550553)))

(declare-fun tp_is_empty!22417 () Bool)

(assert (=> start!83694 tp_is_empty!22417))

(assert (=> start!83694 tp!67827))

(declare-fun array_inv!22724 (array!60904) Bool)

(assert (=> start!83694 (array_inv!22724 _keys!1717)))

(declare-fun b!976779 () Bool)

(declare-fun e!550557 () Bool)

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!976779 (= e!550557 (not (bvslt (bvsub from!2118 #b00000000000000000000000000000001) (size!29790 _values!1425))))))

(declare-fun lt!433289 () (_ BitVec 64))

(declare-fun zeroValue!1367 () V!34873)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34873)

(declare-datatypes ((tuple2!14486 0))(
  ( (tuple2!14487 (_1!7254 (_ BitVec 64)) (_2!7254 V!34873)) )
))
(declare-datatypes ((List!20330 0))(
  ( (Nil!20327) (Cons!20326 (h!21494 tuple2!14486) (t!28807 List!20330)) )
))
(declare-datatypes ((ListLongMap!13185 0))(
  ( (ListLongMap!13186 (toList!6608 List!20330)) )
))
(declare-fun lt!433288 () ListLongMap!13185)

(declare-fun +!2928 (ListLongMap!13185 tuple2!14486) ListLongMap!13185)

(declare-fun getCurrentListMap!3841 (array!60904 array!60902 (_ BitVec 32) (_ BitVec 32) V!34873 V!34873 (_ BitVec 32) Int) ListLongMap!13185)

(declare-fun get!15193 (ValueCell!10727 V!34873) V!34873)

(declare-fun dynLambda!1725 (Int (_ BitVec 64)) V!34873)

(assert (=> b!976779 (= lt!433288 (+!2928 (getCurrentListMap!3841 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14487 lt!433289 (get!15193 (select (arr!29310 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1725 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32420 0))(
  ( (Unit!32421) )
))
(declare-fun lt!433290 () Unit!32420)

(declare-fun lemmaListMapRecursiveValidKeyArray!284 (array!60904 array!60902 (_ BitVec 32) (_ BitVec 32) V!34873 V!34873 (_ BitVec 32) Int) Unit!32420)

(assert (=> b!976779 (= lt!433290 (lemmaListMapRecursiveValidKeyArray!284 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!976780 () Bool)

(declare-fun res!653631 () Bool)

(assert (=> b!976780 (=> (not res!653631) (not e!550554))))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!976780 (= res!653631 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29791 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29791 _keys!1717))))))

(declare-fun b!976781 () Bool)

(declare-fun res!653633 () Bool)

(assert (=> b!976781 (=> (not res!653633) (not e!550554))))

(declare-datatypes ((List!20331 0))(
  ( (Nil!20328) (Cons!20327 (h!21495 (_ BitVec 64)) (t!28808 List!20331)) )
))
(declare-fun arrayNoDuplicates!0 (array!60904 (_ BitVec 32) List!20331) Bool)

(assert (=> b!976781 (= res!653633 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20328))))

(declare-fun b!976782 () Bool)

(declare-fun res!653635 () Bool)

(assert (=> b!976782 (=> (not res!653635) (not e!550554))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!976782 (= res!653635 (validKeyInArray!0 (select (arr!29311 _keys!1717) i!822)))))

(declare-fun b!976783 () Bool)

(assert (=> b!976783 (= e!550554 e!550557)))

(declare-fun res!653636 () Bool)

(assert (=> b!976783 (=> (not res!653636) (not e!550557))))

(assert (=> b!976783 (= res!653636 (validKeyInArray!0 lt!433289))))

(assert (=> b!976783 (= lt!433289 (select (arr!29311 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!976783 (= lt!433288 (getCurrentListMap!3841 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun mapNonEmpty!35635 () Bool)

(declare-fun tp!67828 () Bool)

(declare-fun e!550558 () Bool)

(assert (=> mapNonEmpty!35635 (= mapRes!35635 (and tp!67828 e!550558))))

(declare-fun mapValue!35635 () ValueCell!10727)

(declare-fun mapKey!35635 () (_ BitVec 32))

(declare-fun mapRest!35635 () (Array (_ BitVec 32) ValueCell!10727))

(assert (=> mapNonEmpty!35635 (= (arr!29310 _values!1425) (store mapRest!35635 mapKey!35635 mapValue!35635))))

(declare-fun b!976784 () Bool)

(assert (=> b!976784 (= e!550556 tp_is_empty!22417)))

(declare-fun b!976785 () Bool)

(assert (=> b!976785 (= e!550558 tp_is_empty!22417)))

(declare-fun b!976786 () Bool)

(declare-fun res!653630 () Bool)

(assert (=> b!976786 (=> (not res!653630) (not e!550554))))

(declare-fun contains!5707 (ListLongMap!13185 (_ BitVec 64)) Bool)

(assert (=> b!976786 (= res!653630 (contains!5707 (getCurrentListMap!3841 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29311 _keys!1717) i!822)))))

(declare-fun mapIsEmpty!35635 () Bool)

(assert (=> mapIsEmpty!35635 mapRes!35635))

(assert (= (and start!83694 res!653629) b!976776))

(assert (= (and b!976776 res!653632) b!976777))

(assert (= (and b!976777 res!653634) b!976781))

(assert (= (and b!976781 res!653633) b!976780))

(assert (= (and b!976780 res!653631) b!976782))

(assert (= (and b!976782 res!653635) b!976786))

(assert (= (and b!976786 res!653630) b!976783))

(assert (= (and b!976783 res!653636) b!976779))

(assert (= (and b!976778 condMapEmpty!35635) mapIsEmpty!35635))

(assert (= (and b!976778 (not condMapEmpty!35635)) mapNonEmpty!35635))

(get-info :version)

(assert (= (and mapNonEmpty!35635 ((_ is ValueCellFull!10727) mapValue!35635)) b!976785))

(assert (= (and b!976778 ((_ is ValueCellFull!10727) mapDefault!35635)) b!976784))

(assert (= start!83694 b!976778))

(declare-fun b_lambda!14565 () Bool)

(assert (=> (not b_lambda!14565) (not b!976779)))

(declare-fun t!28806 () Bool)

(declare-fun tb!6327 () Bool)

(assert (=> (and start!83694 (= defaultEntry!1428 defaultEntry!1428) t!28806) tb!6327))

(declare-fun result!12639 () Bool)

(assert (=> tb!6327 (= result!12639 tp_is_empty!22417)))

(assert (=> b!976779 t!28806))

(declare-fun b_and!31133 () Bool)

(assert (= b_and!31131 (and (=> t!28806 result!12639) b_and!31133)))

(declare-fun m!904337 () Bool)

(assert (=> b!976777 m!904337))

(declare-fun m!904339 () Bool)

(assert (=> start!83694 m!904339))

(declare-fun m!904341 () Bool)

(assert (=> start!83694 m!904341))

(declare-fun m!904343 () Bool)

(assert (=> start!83694 m!904343))

(declare-fun m!904345 () Bool)

(assert (=> b!976786 m!904345))

(declare-fun m!904347 () Bool)

(assert (=> b!976786 m!904347))

(assert (=> b!976786 m!904345))

(assert (=> b!976786 m!904347))

(declare-fun m!904349 () Bool)

(assert (=> b!976786 m!904349))

(declare-fun m!904351 () Bool)

(assert (=> b!976779 m!904351))

(declare-fun m!904353 () Bool)

(assert (=> b!976779 m!904353))

(declare-fun m!904355 () Bool)

(assert (=> b!976779 m!904355))

(assert (=> b!976779 m!904353))

(declare-fun m!904357 () Bool)

(assert (=> b!976779 m!904357))

(assert (=> b!976779 m!904351))

(assert (=> b!976779 m!904355))

(declare-fun m!904359 () Bool)

(assert (=> b!976779 m!904359))

(declare-fun m!904361 () Bool)

(assert (=> b!976779 m!904361))

(assert (=> b!976782 m!904347))

(assert (=> b!976782 m!904347))

(declare-fun m!904363 () Bool)

(assert (=> b!976782 m!904363))

(declare-fun m!904365 () Bool)

(assert (=> b!976781 m!904365))

(declare-fun m!904367 () Bool)

(assert (=> b!976783 m!904367))

(declare-fun m!904369 () Bool)

(assert (=> b!976783 m!904369))

(declare-fun m!904371 () Bool)

(assert (=> b!976783 m!904371))

(declare-fun m!904373 () Bool)

(assert (=> mapNonEmpty!35635 m!904373))

(check-sat b_and!31133 (not b_next!19513) (not b!976779) (not b_lambda!14565) (not b!976782) tp_is_empty!22417 (not mapNonEmpty!35635) (not start!83694) (not b!976777) (not b!976786) (not b!976781) (not b!976783))
(check-sat b_and!31133 (not b_next!19513))
