; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33656 () Bool)

(assert start!33656)

(declare-fun b_free!6891 () Bool)

(declare-fun b_next!6891 () Bool)

(assert (=> start!33656 (= b_free!6891 (not b_next!6891))))

(declare-fun tp!24177 () Bool)

(declare-fun b_and!14071 () Bool)

(assert (=> start!33656 (= tp!24177 b_and!14071)))

(declare-fun b!334206 () Bool)

(declare-fun e!205171 () Bool)

(declare-fun e!205172 () Bool)

(declare-fun mapRes!11661 () Bool)

(assert (=> b!334206 (= e!205171 (and e!205172 mapRes!11661))))

(declare-fun condMapEmpty!11661 () Bool)

(declare-datatypes ((V!10101 0))(
  ( (V!10102 (val!3466 Int)) )
))
(declare-datatypes ((ValueCell!3078 0))(
  ( (ValueCellFull!3078 (v!5628 V!10101)) (EmptyCell!3078) )
))
(declare-datatypes ((array!17279 0))(
  ( (array!17280 (arr!8170 (Array (_ BitVec 32) ValueCell!3078)) (size!8522 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17279)

(declare-fun mapDefault!11661 () ValueCell!3078)

(assert (=> b!334206 (= condMapEmpty!11661 (= (arr!8170 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3078)) mapDefault!11661)))))

(declare-fun b!334207 () Bool)

(declare-fun res!184205 () Bool)

(declare-fun e!205170 () Bool)

(assert (=> b!334207 (=> (not res!184205) (not e!205170))))

(declare-datatypes ((array!17281 0))(
  ( (array!17282 (arr!8171 (Array (_ BitVec 32) (_ BitVec 64))) (size!8523 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17281)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17281 (_ BitVec 32)) Bool)

(assert (=> b!334207 (= res!184205 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!334208 () Bool)

(declare-fun e!205169 () Bool)

(assert (=> b!334208 (= e!205169 (not true))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17281 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!334208 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((SeekEntryResult!3157 0))(
  ( (MissingZero!3157 (index!14807 (_ BitVec 32))) (Found!3157 (index!14808 (_ BitVec 32))) (Intermediate!3157 (undefined!3969 Bool) (index!14809 (_ BitVec 32)) (x!33299 (_ BitVec 32))) (Undefined!3157) (MissingVacant!3157 (index!14810 (_ BitVec 32))) )
))
(declare-fun lt!159480 () SeekEntryResult!3157)

(declare-datatypes ((Unit!10393 0))(
  ( (Unit!10394) )
))
(declare-fun lt!159481 () Unit!10393)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17281 (_ BitVec 64) (_ BitVec 32)) Unit!10393)

(assert (=> b!334208 (= lt!159481 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14808 lt!159480)))))

(declare-fun mapIsEmpty!11661 () Bool)

(assert (=> mapIsEmpty!11661 mapRes!11661))

(declare-fun b!334210 () Bool)

(declare-fun res!184208 () Bool)

(assert (=> b!334210 (=> (not res!184208) (not e!205170))))

(declare-fun zeroValue!1467 () V!10101)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10101)

(declare-datatypes ((tuple2!5036 0))(
  ( (tuple2!5037 (_1!2529 (_ BitVec 64)) (_2!2529 V!10101)) )
))
(declare-datatypes ((List!4656 0))(
  ( (Nil!4653) (Cons!4652 (h!5508 tuple2!5036) (t!9744 List!4656)) )
))
(declare-datatypes ((ListLongMap!3949 0))(
  ( (ListLongMap!3950 (toList!1990 List!4656)) )
))
(declare-fun contains!2034 (ListLongMap!3949 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1518 (array!17281 array!17279 (_ BitVec 32) (_ BitVec 32) V!10101 V!10101 (_ BitVec 32) Int) ListLongMap!3949)

(assert (=> b!334210 (= res!184208 (not (contains!2034 (getCurrentListMap!1518 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!334211 () Bool)

(assert (=> b!334211 (= e!205170 e!205169)))

(declare-fun res!184209 () Bool)

(assert (=> b!334211 (=> (not res!184209) (not e!205169))))

(get-info :version)

(assert (=> b!334211 (= res!184209 (and ((_ is Found!3157) lt!159480) (= (select (arr!8171 _keys!1895) (index!14808 lt!159480)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17281 (_ BitVec 32)) SeekEntryResult!3157)

(assert (=> b!334211 (= lt!159480 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!11661 () Bool)

(declare-fun tp!24176 () Bool)

(declare-fun e!205168 () Bool)

(assert (=> mapNonEmpty!11661 (= mapRes!11661 (and tp!24176 e!205168))))

(declare-fun mapKey!11661 () (_ BitVec 32))

(declare-fun mapRest!11661 () (Array (_ BitVec 32) ValueCell!3078))

(declare-fun mapValue!11661 () ValueCell!3078)

(assert (=> mapNonEmpty!11661 (= (arr!8170 _values!1525) (store mapRest!11661 mapKey!11661 mapValue!11661))))

(declare-fun b!334212 () Bool)

(declare-fun res!184206 () Bool)

(assert (=> b!334212 (=> (not res!184206) (not e!205169))))

(assert (=> b!334212 (= res!184206 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14808 lt!159480)))))

(declare-fun b!334213 () Bool)

(declare-fun res!184207 () Bool)

(assert (=> b!334213 (=> (not res!184207) (not e!205170))))

(declare-datatypes ((List!4657 0))(
  ( (Nil!4654) (Cons!4653 (h!5509 (_ BitVec 64)) (t!9745 List!4657)) )
))
(declare-fun arrayNoDuplicates!0 (array!17281 (_ BitVec 32) List!4657) Bool)

(assert (=> b!334213 (= res!184207 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4654))))

(declare-fun b!334214 () Bool)

(declare-fun tp_is_empty!6843 () Bool)

(assert (=> b!334214 (= e!205168 tp_is_empty!6843)))

(declare-fun b!334215 () Bool)

(assert (=> b!334215 (= e!205172 tp_is_empty!6843)))

(declare-fun b!334216 () Bool)

(declare-fun res!184210 () Bool)

(assert (=> b!334216 (=> (not res!184210) (not e!205170))))

(assert (=> b!334216 (= res!184210 (and (= (size!8522 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8523 _keys!1895) (size!8522 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!334209 () Bool)

(declare-fun res!184211 () Bool)

(assert (=> b!334209 (=> (not res!184211) (not e!205170))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!334209 (= res!184211 (validKeyInArray!0 k0!1348))))

(declare-fun res!184204 () Bool)

(assert (=> start!33656 (=> (not res!184204) (not e!205170))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33656 (= res!184204 (validMask!0 mask!2385))))

(assert (=> start!33656 e!205170))

(assert (=> start!33656 true))

(assert (=> start!33656 tp_is_empty!6843))

(assert (=> start!33656 tp!24177))

(declare-fun array_inv!6076 (array!17279) Bool)

(assert (=> start!33656 (and (array_inv!6076 _values!1525) e!205171)))

(declare-fun array_inv!6077 (array!17281) Bool)

(assert (=> start!33656 (array_inv!6077 _keys!1895)))

(assert (= (and start!33656 res!184204) b!334216))

(assert (= (and b!334216 res!184210) b!334207))

(assert (= (and b!334207 res!184205) b!334213))

(assert (= (and b!334213 res!184207) b!334209))

(assert (= (and b!334209 res!184211) b!334210))

(assert (= (and b!334210 res!184208) b!334211))

(assert (= (and b!334211 res!184209) b!334212))

(assert (= (and b!334212 res!184206) b!334208))

(assert (= (and b!334206 condMapEmpty!11661) mapIsEmpty!11661))

(assert (= (and b!334206 (not condMapEmpty!11661)) mapNonEmpty!11661))

(assert (= (and mapNonEmpty!11661 ((_ is ValueCellFull!3078) mapValue!11661)) b!334214))

(assert (= (and b!334206 ((_ is ValueCellFull!3078) mapDefault!11661)) b!334215))

(assert (= start!33656 b!334206))

(declare-fun m!338305 () Bool)

(assert (=> mapNonEmpty!11661 m!338305))

(declare-fun m!338307 () Bool)

(assert (=> b!334208 m!338307))

(declare-fun m!338309 () Bool)

(assert (=> b!334208 m!338309))

(declare-fun m!338311 () Bool)

(assert (=> b!334212 m!338311))

(declare-fun m!338313 () Bool)

(assert (=> start!33656 m!338313))

(declare-fun m!338315 () Bool)

(assert (=> start!33656 m!338315))

(declare-fun m!338317 () Bool)

(assert (=> start!33656 m!338317))

(declare-fun m!338319 () Bool)

(assert (=> b!334207 m!338319))

(declare-fun m!338321 () Bool)

(assert (=> b!334213 m!338321))

(declare-fun m!338323 () Bool)

(assert (=> b!334209 m!338323))

(declare-fun m!338325 () Bool)

(assert (=> b!334210 m!338325))

(assert (=> b!334210 m!338325))

(declare-fun m!338327 () Bool)

(assert (=> b!334210 m!338327))

(declare-fun m!338329 () Bool)

(assert (=> b!334211 m!338329))

(declare-fun m!338331 () Bool)

(assert (=> b!334211 m!338331))

(check-sat (not start!33656) (not b!334211) (not b!334213) tp_is_empty!6843 (not b!334209) (not b!334208) (not b!334210) (not mapNonEmpty!11661) b_and!14071 (not b!334207) (not b_next!6891) (not b!334212))
(check-sat b_and!14071 (not b_next!6891))
