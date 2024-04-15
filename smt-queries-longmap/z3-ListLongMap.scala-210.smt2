; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3932 () Bool)

(assert start!3932)

(declare-fun b_free!847 () Bool)

(declare-fun b_next!847 () Bool)

(assert (=> start!3932 (= b_free!847 (not b_next!847))))

(declare-fun tp!3960 () Bool)

(declare-fun b_and!1651 () Bool)

(assert (=> start!3932 (= tp!3960 b_and!1651)))

(declare-fun b!28032 () Bool)

(declare-fun e!18157 () Bool)

(declare-fun tp_is_empty!1201 () Bool)

(assert (=> b!28032 (= e!18157 tp_is_empty!1201)))

(declare-fun b!28033 () Bool)

(declare-fun res!16661 () Bool)

(declare-fun e!18156 () Bool)

(assert (=> b!28033 (=> (not res!16661) (not e!18156))))

(declare-datatypes ((array!1615 0))(
  ( (array!1616 (arr!761 (Array (_ BitVec 32) (_ BitVec 64))) (size!862 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1615)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1615 (_ BitVec 32)) Bool)

(assert (=> b!28033 (= res!16661 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!28034 () Bool)

(declare-fun res!16664 () Bool)

(assert (=> b!28034 (=> (not res!16664) (not e!18156))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!28034 (= res!16664 (validKeyInArray!0 k0!1304))))

(declare-fun b!28035 () Bool)

(declare-fun e!18159 () Bool)

(declare-fun mapRes!1330 () Bool)

(assert (=> b!28035 (= e!18159 (and e!18157 mapRes!1330))))

(declare-fun condMapEmpty!1330 () Bool)

(declare-datatypes ((V!1427 0))(
  ( (V!1428 (val!627 Int)) )
))
(declare-datatypes ((ValueCell!401 0))(
  ( (ValueCellFull!401 (v!1715 V!1427)) (EmptyCell!401) )
))
(declare-datatypes ((array!1617 0))(
  ( (array!1618 (arr!762 (Array (_ BitVec 32) ValueCell!401)) (size!863 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1617)

(declare-fun mapDefault!1330 () ValueCell!401)

(assert (=> b!28035 (= condMapEmpty!1330 (= (arr!762 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!401)) mapDefault!1330)))))

(declare-fun mapIsEmpty!1330 () Bool)

(assert (=> mapIsEmpty!1330 mapRes!1330))

(declare-fun b!28036 () Bool)

(declare-fun res!16660 () Bool)

(assert (=> b!28036 (=> (not res!16660) (not e!18156))))

(declare-datatypes ((List!644 0))(
  ( (Nil!641) (Cons!640 (h!1207 (_ BitVec 64)) (t!3330 List!644)) )
))
(declare-fun arrayNoDuplicates!0 (array!1615 (_ BitVec 32) List!644) Bool)

(assert (=> b!28036 (= res!16660 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!641))))

(declare-fun mapNonEmpty!1330 () Bool)

(declare-fun tp!3961 () Bool)

(declare-fun e!18158 () Bool)

(assert (=> mapNonEmpty!1330 (= mapRes!1330 (and tp!3961 e!18158))))

(declare-fun mapValue!1330 () ValueCell!401)

(declare-fun mapKey!1330 () (_ BitVec 32))

(declare-fun mapRest!1330 () (Array (_ BitVec 32) ValueCell!401))

(assert (=> mapNonEmpty!1330 (= (arr!762 _values!1501) (store mapRest!1330 mapKey!1330 mapValue!1330))))

(declare-fun b!28037 () Bool)

(declare-fun res!16665 () Bool)

(assert (=> b!28037 (=> (not res!16665) (not e!18156))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1427)

(declare-fun minValue!1443 () V!1427)

(declare-datatypes ((tuple2!1056 0))(
  ( (tuple2!1057 (_1!539 (_ BitVec 64)) (_2!539 V!1427)) )
))
(declare-datatypes ((List!645 0))(
  ( (Nil!642) (Cons!641 (h!1208 tuple2!1056) (t!3331 List!645)) )
))
(declare-datatypes ((ListLongMap!621 0))(
  ( (ListLongMap!622 (toList!326 List!645)) )
))
(declare-fun contains!267 (ListLongMap!621 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!156 (array!1615 array!1617 (_ BitVec 32) (_ BitVec 32) V!1427 V!1427 (_ BitVec 32) Int) ListLongMap!621)

(assert (=> b!28037 (= res!16665 (not (contains!267 (getCurrentListMap!156 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun res!16662 () Bool)

(assert (=> start!3932 (=> (not res!16662) (not e!18156))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3932 (= res!16662 (validMask!0 mask!2294))))

(assert (=> start!3932 e!18156))

(assert (=> start!3932 true))

(assert (=> start!3932 tp!3960))

(declare-fun array_inv!537 (array!1617) Bool)

(assert (=> start!3932 (and (array_inv!537 _values!1501) e!18159)))

(declare-fun array_inv!538 (array!1615) Bool)

(assert (=> start!3932 (array_inv!538 _keys!1833)))

(assert (=> start!3932 tp_is_empty!1201))

(declare-fun b!28038 () Bool)

(assert (=> b!28038 (= e!18158 tp_is_empty!1201)))

(declare-fun b!28039 () Bool)

(declare-fun res!16663 () Bool)

(assert (=> b!28039 (=> (not res!16663) (not e!18156))))

(declare-fun arrayContainsKey!0 (array!1615 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!28039 (= res!16663 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!28040 () Bool)

(assert (=> b!28040 (= e!18156 false)))

(declare-fun lt!10741 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1615 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!28040 (= lt!10741 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!28041 () Bool)

(declare-fun res!16666 () Bool)

(assert (=> b!28041 (=> (not res!16666) (not e!18156))))

(assert (=> b!28041 (= res!16666 (and (= (size!863 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!862 _keys!1833) (size!863 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(assert (= (and start!3932 res!16662) b!28041))

(assert (= (and b!28041 res!16666) b!28033))

(assert (= (and b!28033 res!16661) b!28036))

(assert (= (and b!28036 res!16660) b!28034))

(assert (= (and b!28034 res!16664) b!28037))

(assert (= (and b!28037 res!16665) b!28039))

(assert (= (and b!28039 res!16663) b!28040))

(assert (= (and b!28035 condMapEmpty!1330) mapIsEmpty!1330))

(assert (= (and b!28035 (not condMapEmpty!1330)) mapNonEmpty!1330))

(get-info :version)

(assert (= (and mapNonEmpty!1330 ((_ is ValueCellFull!401) mapValue!1330)) b!28038))

(assert (= (and b!28035 ((_ is ValueCellFull!401) mapDefault!1330)) b!28032))

(assert (= start!3932 b!28035))

(declare-fun m!22299 () Bool)

(assert (=> b!28034 m!22299))

(declare-fun m!22301 () Bool)

(assert (=> b!28040 m!22301))

(declare-fun m!22303 () Bool)

(assert (=> mapNonEmpty!1330 m!22303))

(declare-fun m!22305 () Bool)

(assert (=> b!28033 m!22305))

(declare-fun m!22307 () Bool)

(assert (=> b!28036 m!22307))

(declare-fun m!22309 () Bool)

(assert (=> b!28039 m!22309))

(declare-fun m!22311 () Bool)

(assert (=> b!28037 m!22311))

(assert (=> b!28037 m!22311))

(declare-fun m!22313 () Bool)

(assert (=> b!28037 m!22313))

(declare-fun m!22315 () Bool)

(assert (=> start!3932 m!22315))

(declare-fun m!22317 () Bool)

(assert (=> start!3932 m!22317))

(declare-fun m!22319 () Bool)

(assert (=> start!3932 m!22319))

(check-sat (not b!28033) (not b!28040) (not b!28037) (not mapNonEmpty!1330) (not b!28039) (not b!28036) (not b_next!847) (not start!3932) tp_is_empty!1201 b_and!1651 (not b!28034))
(check-sat b_and!1651 (not b_next!847))
