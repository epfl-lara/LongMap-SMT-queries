; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83496 () Bool)

(assert start!83496)

(declare-fun b_free!19501 () Bool)

(declare-fun b_next!19501 () Bool)

(assert (=> start!83496 (= b_free!19501 (not b_next!19501))))

(declare-fun tp!67792 () Bool)

(declare-fun b_and!31077 () Bool)

(assert (=> start!83496 (= tp!67792 b_and!31077)))

(declare-fun b!975437 () Bool)

(declare-fun res!653044 () Bool)

(declare-fun e!549725 () Bool)

(assert (=> b!975437 (=> (not res!653044) (not e!549725))))

(declare-datatypes ((array!60770 0))(
  ( (array!60771 (arr!29249 (Array (_ BitVec 32) (_ BitVec 64))) (size!29730 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60770)

(declare-datatypes ((List!20342 0))(
  ( (Nil!20339) (Cons!20338 (h!21500 (_ BitVec 64)) (t!28810 List!20342)) )
))
(declare-fun arrayNoDuplicates!0 (array!60770 (_ BitVec 32) List!20342) Bool)

(assert (=> b!975437 (= res!653044 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20339))))

(declare-fun res!653042 () Bool)

(assert (=> start!83496 (=> (not res!653042) (not e!549725))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83496 (= res!653042 (validMask!0 mask!2147))))

(assert (=> start!83496 e!549725))

(assert (=> start!83496 true))

(declare-datatypes ((V!34857 0))(
  ( (V!34858 (val!11253 Int)) )
))
(declare-datatypes ((ValueCell!10721 0))(
  ( (ValueCellFull!10721 (v!13811 V!34857)) (EmptyCell!10721) )
))
(declare-datatypes ((array!60772 0))(
  ( (array!60773 (arr!29250 (Array (_ BitVec 32) ValueCell!10721)) (size!29731 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60772)

(declare-fun e!549726 () Bool)

(declare-fun array_inv!22667 (array!60772) Bool)

(assert (=> start!83496 (and (array_inv!22667 _values!1425) e!549726)))

(declare-fun tp_is_empty!22405 () Bool)

(assert (=> start!83496 tp_is_empty!22405))

(assert (=> start!83496 tp!67792))

(declare-fun array_inv!22668 (array!60770) Bool)

(assert (=> start!83496 (array_inv!22668 _keys!1717)))

(declare-fun b!975438 () Bool)

(declare-fun e!549724 () Bool)

(assert (=> b!975438 (= e!549724 tp_is_empty!22405)))

(declare-fun mapIsEmpty!35617 () Bool)

(declare-fun mapRes!35617 () Bool)

(assert (=> mapIsEmpty!35617 mapRes!35617))

(declare-fun b!975439 () Bool)

(declare-fun res!653043 () Bool)

(assert (=> b!975439 (=> (not res!653043) (not e!549725))))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!975439 (= res!653043 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29730 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29730 _keys!1717))))))

(declare-fun b!975440 () Bool)

(declare-fun res!653040 () Bool)

(assert (=> b!975440 (=> (not res!653040) (not e!549725))))

(declare-fun zeroValue!1367 () V!34857)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34857)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14534 0))(
  ( (tuple2!14535 (_1!7278 (_ BitVec 64)) (_2!7278 V!34857)) )
))
(declare-datatypes ((List!20343 0))(
  ( (Nil!20340) (Cons!20339 (h!21501 tuple2!14534) (t!28811 List!20343)) )
))
(declare-datatypes ((ListLongMap!13221 0))(
  ( (ListLongMap!13222 (toList!6626 List!20343)) )
))
(declare-fun contains!5657 (ListLongMap!13221 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3788 (array!60770 array!60772 (_ BitVec 32) (_ BitVec 32) V!34857 V!34857 (_ BitVec 32) Int) ListLongMap!13221)

(assert (=> b!975440 (= res!653040 (contains!5657 (getCurrentListMap!3788 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29249 _keys!1717) i!822)))))

(declare-fun b!975441 () Bool)

(declare-fun res!653038 () Bool)

(assert (=> b!975441 (=> (not res!653038) (not e!549725))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60770 (_ BitVec 32)) Bool)

(assert (=> b!975441 (= res!653038 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapNonEmpty!35617 () Bool)

(declare-fun tp!67791 () Bool)

(assert (=> mapNonEmpty!35617 (= mapRes!35617 (and tp!67791 e!549724))))

(declare-fun mapRest!35617 () (Array (_ BitVec 32) ValueCell!10721))

(declare-fun mapKey!35617 () (_ BitVec 32))

(declare-fun mapValue!35617 () ValueCell!10721)

(assert (=> mapNonEmpty!35617 (= (arr!29250 _values!1425) (store mapRest!35617 mapKey!35617 mapValue!35617))))

(declare-fun b!975442 () Bool)

(assert (=> b!975442 (= e!549725 false)))

(declare-fun lt!432651 () ListLongMap!13221)

(assert (=> b!975442 (= lt!432651 (getCurrentListMap!3788 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!975443 () Bool)

(declare-fun res!653039 () Bool)

(assert (=> b!975443 (=> (not res!653039) (not e!549725))))

(assert (=> b!975443 (= res!653039 (and (= (size!29731 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29730 _keys!1717) (size!29731 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!975444 () Bool)

(declare-fun e!549722 () Bool)

(assert (=> b!975444 (= e!549722 tp_is_empty!22405)))

(declare-fun b!975445 () Bool)

(declare-fun res!653041 () Bool)

(assert (=> b!975445 (=> (not res!653041) (not e!549725))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!975445 (= res!653041 (validKeyInArray!0 (select (arr!29249 _keys!1717) i!822)))))

(declare-fun b!975446 () Bool)

(assert (=> b!975446 (= e!549726 (and e!549722 mapRes!35617))))

(declare-fun condMapEmpty!35617 () Bool)

(declare-fun mapDefault!35617 () ValueCell!10721)

(assert (=> b!975446 (= condMapEmpty!35617 (= (arr!29250 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10721)) mapDefault!35617)))))

(assert (= (and start!83496 res!653042) b!975443))

(assert (= (and b!975443 res!653039) b!975441))

(assert (= (and b!975441 res!653038) b!975437))

(assert (= (and b!975437 res!653044) b!975439))

(assert (= (and b!975439 res!653043) b!975445))

(assert (= (and b!975445 res!653041) b!975440))

(assert (= (and b!975440 res!653040) b!975442))

(assert (= (and b!975446 condMapEmpty!35617) mapIsEmpty!35617))

(assert (= (and b!975446 (not condMapEmpty!35617)) mapNonEmpty!35617))

(get-info :version)

(assert (= (and mapNonEmpty!35617 ((_ is ValueCellFull!10721) mapValue!35617)) b!975438))

(assert (= (and b!975446 ((_ is ValueCellFull!10721) mapDefault!35617)) b!975444))

(assert (= start!83496 b!975446))

(declare-fun m!902105 () Bool)

(assert (=> b!975440 m!902105))

(declare-fun m!902107 () Bool)

(assert (=> b!975440 m!902107))

(assert (=> b!975440 m!902105))

(assert (=> b!975440 m!902107))

(declare-fun m!902109 () Bool)

(assert (=> b!975440 m!902109))

(declare-fun m!902111 () Bool)

(assert (=> start!83496 m!902111))

(declare-fun m!902113 () Bool)

(assert (=> start!83496 m!902113))

(declare-fun m!902115 () Bool)

(assert (=> start!83496 m!902115))

(declare-fun m!902117 () Bool)

(assert (=> mapNonEmpty!35617 m!902117))

(assert (=> b!975445 m!902107))

(assert (=> b!975445 m!902107))

(declare-fun m!902119 () Bool)

(assert (=> b!975445 m!902119))

(declare-fun m!902121 () Bool)

(assert (=> b!975441 m!902121))

(declare-fun m!902123 () Bool)

(assert (=> b!975442 m!902123))

(declare-fun m!902125 () Bool)

(assert (=> b!975437 m!902125))

(check-sat (not b!975445) b_and!31077 (not b_next!19501) (not mapNonEmpty!35617) tp_is_empty!22405 (not b!975437) (not b!975441) (not start!83496) (not b!975442) (not b!975440))
(check-sat b_and!31077 (not b_next!19501))
