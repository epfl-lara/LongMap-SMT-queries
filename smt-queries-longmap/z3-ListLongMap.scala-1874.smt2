; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33664 () Bool)

(assert start!33664)

(declare-fun b_free!6913 () Bool)

(declare-fun b_next!6913 () Bool)

(assert (=> start!33664 (= b_free!6913 (not b_next!6913))))

(declare-fun tp!24243 () Bool)

(declare-fun b_and!14067 () Bool)

(assert (=> start!33664 (= tp!24243 b_and!14067)))

(declare-fun b!334294 () Bool)

(declare-fun res!184341 () Bool)

(declare-fun e!205195 () Bool)

(assert (=> b!334294 (=> (not res!184341) (not e!205195))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!10131 0))(
  ( (V!10132 (val!3477 Int)) )
))
(declare-fun zeroValue!1467 () V!10131)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3089 0))(
  ( (ValueCellFull!3089 (v!5633 V!10131)) (EmptyCell!3089) )
))
(declare-datatypes ((array!17303 0))(
  ( (array!17304 (arr!8182 (Array (_ BitVec 32) ValueCell!3089)) (size!8535 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17303)

(declare-datatypes ((array!17305 0))(
  ( (array!17306 (arr!8183 (Array (_ BitVec 32) (_ BitVec 64))) (size!8536 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17305)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10131)

(declare-datatypes ((tuple2!4992 0))(
  ( (tuple2!4993 (_1!2507 (_ BitVec 64)) (_2!2507 V!10131)) )
))
(declare-datatypes ((List!4631 0))(
  ( (Nil!4628) (Cons!4627 (h!5483 tuple2!4992) (t!9710 List!4631)) )
))
(declare-datatypes ((ListLongMap!3895 0))(
  ( (ListLongMap!3896 (toList!1963 List!4631)) )
))
(declare-fun contains!2018 (ListLongMap!3895 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1472 (array!17305 array!17303 (_ BitVec 32) (_ BitVec 32) V!10131 V!10131 (_ BitVec 32) Int) ListLongMap!3895)

(assert (=> b!334294 (= res!184341 (not (contains!2018 (getCurrentListMap!1472 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun res!184340 () Bool)

(assert (=> start!33664 (=> (not res!184340) (not e!205195))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33664 (= res!184340 (validMask!0 mask!2385))))

(assert (=> start!33664 e!205195))

(assert (=> start!33664 true))

(declare-fun tp_is_empty!6865 () Bool)

(assert (=> start!33664 tp_is_empty!6865))

(assert (=> start!33664 tp!24243))

(declare-fun e!205192 () Bool)

(declare-fun array_inv!6100 (array!17303) Bool)

(assert (=> start!33664 (and (array_inv!6100 _values!1525) e!205192)))

(declare-fun array_inv!6101 (array!17305) Bool)

(assert (=> start!33664 (array_inv!6101 _keys!1895)))

(declare-fun b!334295 () Bool)

(declare-fun e!205194 () Bool)

(assert (=> b!334295 (= e!205194 tp_is_empty!6865)))

(declare-fun b!334296 () Bool)

(declare-fun res!184339 () Bool)

(assert (=> b!334296 (=> (not res!184339) (not e!205195))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17305 (_ BitVec 32)) Bool)

(assert (=> b!334296 (= res!184339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!334297 () Bool)

(declare-fun e!205193 () Bool)

(assert (=> b!334297 (= e!205193 (not true))))

(declare-fun arrayContainsKey!0 (array!17305 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!334297 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((SeekEntryResult!3162 0))(
  ( (MissingZero!3162 (index!14827 (_ BitVec 32))) (Found!3162 (index!14828 (_ BitVec 32))) (Intermediate!3162 (undefined!3974 Bool) (index!14829 (_ BitVec 32)) (x!33331 (_ BitVec 32))) (Undefined!3162) (MissingVacant!3162 (index!14830 (_ BitVec 32))) )
))
(declare-fun lt!159312 () SeekEntryResult!3162)

(declare-datatypes ((Unit!10384 0))(
  ( (Unit!10385) )
))
(declare-fun lt!159311 () Unit!10384)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17305 (_ BitVec 64) (_ BitVec 32)) Unit!10384)

(assert (=> b!334297 (= lt!159311 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14828 lt!159312)))))

(declare-fun mapNonEmpty!11694 () Bool)

(declare-fun mapRes!11694 () Bool)

(declare-fun tp!24242 () Bool)

(declare-fun e!205190 () Bool)

(assert (=> mapNonEmpty!11694 (= mapRes!11694 (and tp!24242 e!205190))))

(declare-fun mapKey!11694 () (_ BitVec 32))

(declare-fun mapRest!11694 () (Array (_ BitVec 32) ValueCell!3089))

(declare-fun mapValue!11694 () ValueCell!3089)

(assert (=> mapNonEmpty!11694 (= (arr!8182 _values!1525) (store mapRest!11694 mapKey!11694 mapValue!11694))))

(declare-fun b!334298 () Bool)

(declare-fun res!184343 () Bool)

(assert (=> b!334298 (=> (not res!184343) (not e!205195))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!334298 (= res!184343 (validKeyInArray!0 k0!1348))))

(declare-fun mapIsEmpty!11694 () Bool)

(assert (=> mapIsEmpty!11694 mapRes!11694))

(declare-fun b!334299 () Bool)

(declare-fun res!184346 () Bool)

(assert (=> b!334299 (=> (not res!184346) (not e!205195))))

(assert (=> b!334299 (= res!184346 (and (= (size!8535 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8536 _keys!1895) (size!8535 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!334300 () Bool)

(declare-fun res!184345 () Bool)

(assert (=> b!334300 (=> (not res!184345) (not e!205193))))

(assert (=> b!334300 (= res!184345 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14828 lt!159312)))))

(declare-fun b!334301 () Bool)

(assert (=> b!334301 (= e!205195 e!205193)))

(declare-fun res!184342 () Bool)

(assert (=> b!334301 (=> (not res!184342) (not e!205193))))

(get-info :version)

(assert (=> b!334301 (= res!184342 (and ((_ is Found!3162) lt!159312) (= (select (arr!8183 _keys!1895) (index!14828 lt!159312)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17305 (_ BitVec 32)) SeekEntryResult!3162)

(assert (=> b!334301 (= lt!159312 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!334302 () Bool)

(assert (=> b!334302 (= e!205192 (and e!205194 mapRes!11694))))

(declare-fun condMapEmpty!11694 () Bool)

(declare-fun mapDefault!11694 () ValueCell!3089)

(assert (=> b!334302 (= condMapEmpty!11694 (= (arr!8182 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3089)) mapDefault!11694)))))

(declare-fun b!334303 () Bool)

(declare-fun res!184344 () Bool)

(assert (=> b!334303 (=> (not res!184344) (not e!205195))))

(declare-datatypes ((List!4632 0))(
  ( (Nil!4629) (Cons!4628 (h!5484 (_ BitVec 64)) (t!9711 List!4632)) )
))
(declare-fun arrayNoDuplicates!0 (array!17305 (_ BitVec 32) List!4632) Bool)

(assert (=> b!334303 (= res!184344 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4629))))

(declare-fun b!334304 () Bool)

(assert (=> b!334304 (= e!205190 tp_is_empty!6865)))

(assert (= (and start!33664 res!184340) b!334299))

(assert (= (and b!334299 res!184346) b!334296))

(assert (= (and b!334296 res!184339) b!334303))

(assert (= (and b!334303 res!184344) b!334298))

(assert (= (and b!334298 res!184343) b!334294))

(assert (= (and b!334294 res!184341) b!334301))

(assert (= (and b!334301 res!184342) b!334300))

(assert (= (and b!334300 res!184345) b!334297))

(assert (= (and b!334302 condMapEmpty!11694) mapIsEmpty!11694))

(assert (= (and b!334302 (not condMapEmpty!11694)) mapNonEmpty!11694))

(assert (= (and mapNonEmpty!11694 ((_ is ValueCellFull!3089) mapValue!11694)) b!334304))

(assert (= (and b!334302 ((_ is ValueCellFull!3089) mapDefault!11694)) b!334295))

(assert (= start!33664 b!334302))

(declare-fun m!337883 () Bool)

(assert (=> start!33664 m!337883))

(declare-fun m!337885 () Bool)

(assert (=> start!33664 m!337885))

(declare-fun m!337887 () Bool)

(assert (=> start!33664 m!337887))

(declare-fun m!337889 () Bool)

(assert (=> b!334303 m!337889))

(declare-fun m!337891 () Bool)

(assert (=> b!334297 m!337891))

(declare-fun m!337893 () Bool)

(assert (=> b!334297 m!337893))

(declare-fun m!337895 () Bool)

(assert (=> b!334301 m!337895))

(declare-fun m!337897 () Bool)

(assert (=> b!334301 m!337897))

(declare-fun m!337899 () Bool)

(assert (=> b!334300 m!337899))

(declare-fun m!337901 () Bool)

(assert (=> b!334296 m!337901))

(declare-fun m!337903 () Bool)

(assert (=> b!334298 m!337903))

(declare-fun m!337905 () Bool)

(assert (=> mapNonEmpty!11694 m!337905))

(declare-fun m!337907 () Bool)

(assert (=> b!334294 m!337907))

(assert (=> b!334294 m!337907))

(declare-fun m!337909 () Bool)

(assert (=> b!334294 m!337909))

(check-sat (not start!33664) tp_is_empty!6865 (not mapNonEmpty!11694) (not b!334301) (not b_next!6913) (not b!334298) b_and!14067 (not b!334303) (not b!334296) (not b!334297) (not b!334300) (not b!334294))
(check-sat b_and!14067 (not b_next!6913))
