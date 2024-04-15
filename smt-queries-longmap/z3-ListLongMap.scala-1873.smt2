; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33658 () Bool)

(assert start!33658)

(declare-fun b_free!6907 () Bool)

(declare-fun b_next!6907 () Bool)

(assert (=> start!33658 (= b_free!6907 (not b_next!6907))))

(declare-fun tp!24225 () Bool)

(declare-fun b_and!14061 () Bool)

(assert (=> start!33658 (= tp!24225 b_and!14061)))

(declare-fun mapIsEmpty!11685 () Bool)

(declare-fun mapRes!11685 () Bool)

(assert (=> mapIsEmpty!11685 mapRes!11685))

(declare-fun b!334195 () Bool)

(declare-fun e!205138 () Bool)

(declare-fun e!205139 () Bool)

(assert (=> b!334195 (= e!205138 e!205139)))

(declare-fun res!184269 () Bool)

(assert (=> b!334195 (=> (not res!184269) (not e!205139))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!17291 0))(
  ( (array!17292 (arr!8176 (Array (_ BitVec 32) (_ BitVec 64))) (size!8529 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17291)

(declare-datatypes ((SeekEntryResult!3160 0))(
  ( (MissingZero!3160 (index!14819 (_ BitVec 32))) (Found!3160 (index!14820 (_ BitVec 32))) (Intermediate!3160 (undefined!3972 Bool) (index!14821 (_ BitVec 32)) (x!33321 (_ BitVec 32))) (Undefined!3160) (MissingVacant!3160 (index!14822 (_ BitVec 32))) )
))
(declare-fun lt!159294 () SeekEntryResult!3160)

(get-info :version)

(assert (=> b!334195 (= res!184269 (and ((_ is Found!3160) lt!159294) (= (select (arr!8176 _keys!1895) (index!14820 lt!159294)) k0!1348)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17291 (_ BitVec 32)) SeekEntryResult!3160)

(assert (=> b!334195 (= lt!159294 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!334196 () Bool)

(declare-fun res!184274 () Bool)

(assert (=> b!334196 (=> (not res!184274) (not e!205138))))

(declare-datatypes ((V!10123 0))(
  ( (V!10124 (val!3474 Int)) )
))
(declare-datatypes ((ValueCell!3086 0))(
  ( (ValueCellFull!3086 (v!5630 V!10123)) (EmptyCell!3086) )
))
(declare-datatypes ((array!17293 0))(
  ( (array!17294 (arr!8177 (Array (_ BitVec 32) ValueCell!3086)) (size!8530 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17293)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!334196 (= res!184274 (and (= (size!8530 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8529 _keys!1895) (size!8530 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!334197 () Bool)

(declare-fun res!184272 () Bool)

(assert (=> b!334197 (=> (not res!184272) (not e!205139))))

(declare-fun arrayContainsKey!0 (array!17291 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!334197 (= res!184272 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14820 lt!159294)))))

(declare-fun b!334198 () Bool)

(declare-fun e!205137 () Bool)

(declare-fun tp_is_empty!6859 () Bool)

(assert (=> b!334198 (= e!205137 tp_is_empty!6859)))

(declare-fun res!184273 () Bool)

(assert (=> start!33658 (=> (not res!184273) (not e!205138))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33658 (= res!184273 (validMask!0 mask!2385))))

(assert (=> start!33658 e!205138))

(assert (=> start!33658 true))

(assert (=> start!33658 tp_is_empty!6859))

(assert (=> start!33658 tp!24225))

(declare-fun e!205136 () Bool)

(declare-fun array_inv!6098 (array!17293) Bool)

(assert (=> start!33658 (and (array_inv!6098 _values!1525) e!205136)))

(declare-fun array_inv!6099 (array!17291) Bool)

(assert (=> start!33658 (array_inv!6099 _keys!1895)))

(declare-fun b!334199 () Bool)

(declare-fun e!205140 () Bool)

(assert (=> b!334199 (= e!205136 (and e!205140 mapRes!11685))))

(declare-fun condMapEmpty!11685 () Bool)

(declare-fun mapDefault!11685 () ValueCell!3086)

(assert (=> b!334199 (= condMapEmpty!11685 (= (arr!8177 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3086)) mapDefault!11685)))))

(declare-fun b!334200 () Bool)

(assert (=> b!334200 (= e!205140 tp_is_empty!6859)))

(declare-fun b!334201 () Bool)

(declare-fun res!184267 () Bool)

(assert (=> b!334201 (=> (not res!184267) (not e!205138))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!334201 (= res!184267 (validKeyInArray!0 k0!1348))))

(declare-fun b!334202 () Bool)

(declare-fun res!184268 () Bool)

(assert (=> b!334202 (=> (not res!184268) (not e!205138))))

(declare-fun zeroValue!1467 () V!10123)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10123)

(declare-datatypes ((tuple2!4990 0))(
  ( (tuple2!4991 (_1!2506 (_ BitVec 64)) (_2!2506 V!10123)) )
))
(declare-datatypes ((List!4629 0))(
  ( (Nil!4626) (Cons!4625 (h!5481 tuple2!4990) (t!9708 List!4629)) )
))
(declare-datatypes ((ListLongMap!3893 0))(
  ( (ListLongMap!3894 (toList!1962 List!4629)) )
))
(declare-fun contains!2017 (ListLongMap!3893 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1471 (array!17291 array!17293 (_ BitVec 32) (_ BitVec 32) V!10123 V!10123 (_ BitVec 32) Int) ListLongMap!3893)

(assert (=> b!334202 (= res!184268 (not (contains!2017 (getCurrentListMap!1471 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!334203 () Bool)

(declare-fun res!184271 () Bool)

(assert (=> b!334203 (=> (not res!184271) (not e!205138))))

(declare-datatypes ((List!4630 0))(
  ( (Nil!4627) (Cons!4626 (h!5482 (_ BitVec 64)) (t!9709 List!4630)) )
))
(declare-fun arrayNoDuplicates!0 (array!17291 (_ BitVec 32) List!4630) Bool)

(assert (=> b!334203 (= res!184271 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4627))))

(declare-fun mapNonEmpty!11685 () Bool)

(declare-fun tp!24224 () Bool)

(assert (=> mapNonEmpty!11685 (= mapRes!11685 (and tp!24224 e!205137))))

(declare-fun mapKey!11685 () (_ BitVec 32))

(declare-fun mapRest!11685 () (Array (_ BitVec 32) ValueCell!3086))

(declare-fun mapValue!11685 () ValueCell!3086)

(assert (=> mapNonEmpty!11685 (= (arr!8177 _values!1525) (store mapRest!11685 mapKey!11685 mapValue!11685))))

(declare-fun b!334204 () Bool)

(assert (=> b!334204 (= e!205139 (not true))))

(assert (=> b!334204 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10380 0))(
  ( (Unit!10381) )
))
(declare-fun lt!159293 () Unit!10380)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17291 (_ BitVec 64) (_ BitVec 32)) Unit!10380)

(assert (=> b!334204 (= lt!159293 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14820 lt!159294)))))

(declare-fun b!334205 () Bool)

(declare-fun res!184270 () Bool)

(assert (=> b!334205 (=> (not res!184270) (not e!205138))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17291 (_ BitVec 32)) Bool)

(assert (=> b!334205 (= res!184270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(assert (= (and start!33658 res!184273) b!334196))

(assert (= (and b!334196 res!184274) b!334205))

(assert (= (and b!334205 res!184270) b!334203))

(assert (= (and b!334203 res!184271) b!334201))

(assert (= (and b!334201 res!184267) b!334202))

(assert (= (and b!334202 res!184268) b!334195))

(assert (= (and b!334195 res!184269) b!334197))

(assert (= (and b!334197 res!184272) b!334204))

(assert (= (and b!334199 condMapEmpty!11685) mapIsEmpty!11685))

(assert (= (and b!334199 (not condMapEmpty!11685)) mapNonEmpty!11685))

(assert (= (and mapNonEmpty!11685 ((_ is ValueCellFull!3086) mapValue!11685)) b!334198))

(assert (= (and b!334199 ((_ is ValueCellFull!3086) mapDefault!11685)) b!334200))

(assert (= start!33658 b!334199))

(declare-fun m!337799 () Bool)

(assert (=> mapNonEmpty!11685 m!337799))

(declare-fun m!337801 () Bool)

(assert (=> b!334197 m!337801))

(declare-fun m!337803 () Bool)

(assert (=> b!334203 m!337803))

(declare-fun m!337805 () Bool)

(assert (=> b!334202 m!337805))

(assert (=> b!334202 m!337805))

(declare-fun m!337807 () Bool)

(assert (=> b!334202 m!337807))

(declare-fun m!337809 () Bool)

(assert (=> b!334205 m!337809))

(declare-fun m!337811 () Bool)

(assert (=> b!334204 m!337811))

(declare-fun m!337813 () Bool)

(assert (=> b!334204 m!337813))

(declare-fun m!337815 () Bool)

(assert (=> b!334201 m!337815))

(declare-fun m!337817 () Bool)

(assert (=> start!33658 m!337817))

(declare-fun m!337819 () Bool)

(assert (=> start!33658 m!337819))

(declare-fun m!337821 () Bool)

(assert (=> start!33658 m!337821))

(declare-fun m!337823 () Bool)

(assert (=> b!334195 m!337823))

(declare-fun m!337825 () Bool)

(assert (=> b!334195 m!337825))

(check-sat b_and!14061 (not b!334197) (not b!334202) (not b!334203) (not start!33658) (not b!334195) (not b!334201) (not b_next!6907) tp_is_empty!6859 (not b!334205) (not mapNonEmpty!11685) (not b!334204))
(check-sat b_and!14061 (not b_next!6907))
