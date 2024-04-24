; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111180 () Bool)

(assert start!111180)

(declare-fun b_free!29791 () Bool)

(declare-fun b_next!29791 () Bool)

(assert (=> start!111180 (= b_free!29791 (not b_next!29791))))

(declare-fun tp!104695 () Bool)

(declare-fun b_and!48001 () Bool)

(assert (=> start!111180 (= tp!104695 b_and!48001)))

(declare-fun b!1314929 () Bool)

(declare-fun res!872635 () Bool)

(declare-fun e!750140 () Bool)

(assert (=> b!1314929 (=> (not res!872635) (not e!750140))))

(declare-datatypes ((array!88071 0))(
  ( (array!88072 (arr!42511 (Array (_ BitVec 32) (_ BitVec 64))) (size!43062 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88071)

(declare-datatypes ((V!52465 0))(
  ( (V!52466 (val!17835 Int)) )
))
(declare-datatypes ((ValueCell!16862 0))(
  ( (ValueCellFull!16862 (v!20457 V!52465)) (EmptyCell!16862) )
))
(declare-datatypes ((array!88073 0))(
  ( (array!88074 (arr!42512 (Array (_ BitVec 32) ValueCell!16862)) (size!43063 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88073)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun mask!2040 () (_ BitVec 32))

(assert (=> b!1314929 (= res!872635 (and (= (size!43063 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43062 _keys!1628) (size!43063 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1314930 () Bool)

(declare-fun res!872633 () Bool)

(assert (=> b!1314930 (=> (not res!872633) (not e!750140))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1314930 (= res!872633 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43062 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1314931 () Bool)

(assert (=> b!1314931 (= e!750140 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52465)

(declare-fun zeroValue!1296 () V!52465)

(declare-fun lt!586172 () Bool)

(declare-datatypes ((tuple2!23026 0))(
  ( (tuple2!23027 (_1!11524 (_ BitVec 64)) (_2!11524 V!52465)) )
))
(declare-datatypes ((List!30175 0))(
  ( (Nil!30172) (Cons!30171 (h!31389 tuple2!23026) (t!43773 List!30175)) )
))
(declare-datatypes ((ListLongMap!20691 0))(
  ( (ListLongMap!20692 (toList!10361 List!30175)) )
))
(declare-fun contains!8523 (ListLongMap!20691 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5365 (array!88071 array!88073 (_ BitVec 32) (_ BitVec 32) V!52465 V!52465 (_ BitVec 32) Int) ListLongMap!20691)

(assert (=> b!1314931 (= lt!586172 (contains!8523 (getCurrentListMap!5365 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapIsEmpty!54910 () Bool)

(declare-fun mapRes!54910 () Bool)

(assert (=> mapIsEmpty!54910 mapRes!54910))

(declare-fun res!872632 () Bool)

(assert (=> start!111180 (=> (not res!872632) (not e!750140))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111180 (= res!872632 (validMask!0 mask!2040))))

(assert (=> start!111180 e!750140))

(assert (=> start!111180 tp!104695))

(declare-fun array_inv!32375 (array!88071) Bool)

(assert (=> start!111180 (array_inv!32375 _keys!1628)))

(assert (=> start!111180 true))

(declare-fun tp_is_empty!35521 () Bool)

(assert (=> start!111180 tp_is_empty!35521))

(declare-fun e!750136 () Bool)

(declare-fun array_inv!32376 (array!88073) Bool)

(assert (=> start!111180 (and (array_inv!32376 _values!1354) e!750136)))

(declare-fun b!1314932 () Bool)

(declare-fun e!750138 () Bool)

(assert (=> b!1314932 (= e!750138 tp_is_empty!35521)))

(declare-fun b!1314933 () Bool)

(declare-fun e!750139 () Bool)

(assert (=> b!1314933 (= e!750139 tp_is_empty!35521)))

(declare-fun b!1314934 () Bool)

(declare-fun res!872636 () Bool)

(assert (=> b!1314934 (=> (not res!872636) (not e!750140))))

(declare-datatypes ((List!30176 0))(
  ( (Nil!30173) (Cons!30172 (h!31390 (_ BitVec 64)) (t!43774 List!30176)) )
))
(declare-fun arrayNoDuplicates!0 (array!88071 (_ BitVec 32) List!30176) Bool)

(assert (=> b!1314934 (= res!872636 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30173))))

(declare-fun b!1314935 () Bool)

(declare-fun res!872634 () Bool)

(assert (=> b!1314935 (=> (not res!872634) (not e!750140))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88071 (_ BitVec 32)) Bool)

(assert (=> b!1314935 (= res!872634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapNonEmpty!54910 () Bool)

(declare-fun tp!104694 () Bool)

(assert (=> mapNonEmpty!54910 (= mapRes!54910 (and tp!104694 e!750138))))

(declare-fun mapKey!54910 () (_ BitVec 32))

(declare-fun mapValue!54910 () ValueCell!16862)

(declare-fun mapRest!54910 () (Array (_ BitVec 32) ValueCell!16862))

(assert (=> mapNonEmpty!54910 (= (arr!42512 _values!1354) (store mapRest!54910 mapKey!54910 mapValue!54910))))

(declare-fun b!1314936 () Bool)

(assert (=> b!1314936 (= e!750136 (and e!750139 mapRes!54910))))

(declare-fun condMapEmpty!54910 () Bool)

(declare-fun mapDefault!54910 () ValueCell!16862)

(assert (=> b!1314936 (= condMapEmpty!54910 (= (arr!42512 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16862)) mapDefault!54910)))))

(assert (= (and start!111180 res!872632) b!1314929))

(assert (= (and b!1314929 res!872635) b!1314935))

(assert (= (and b!1314935 res!872634) b!1314934))

(assert (= (and b!1314934 res!872636) b!1314930))

(assert (= (and b!1314930 res!872633) b!1314931))

(assert (= (and b!1314936 condMapEmpty!54910) mapIsEmpty!54910))

(assert (= (and b!1314936 (not condMapEmpty!54910)) mapNonEmpty!54910))

(get-info :version)

(assert (= (and mapNonEmpty!54910 ((_ is ValueCellFull!16862) mapValue!54910)) b!1314932))

(assert (= (and b!1314936 ((_ is ValueCellFull!16862) mapDefault!54910)) b!1314933))

(assert (= start!111180 b!1314936))

(declare-fun m!1204013 () Bool)

(assert (=> b!1314934 m!1204013))

(declare-fun m!1204015 () Bool)

(assert (=> b!1314931 m!1204015))

(assert (=> b!1314931 m!1204015))

(declare-fun m!1204017 () Bool)

(assert (=> b!1314931 m!1204017))

(declare-fun m!1204019 () Bool)

(assert (=> b!1314935 m!1204019))

(declare-fun m!1204021 () Bool)

(assert (=> start!111180 m!1204021))

(declare-fun m!1204023 () Bool)

(assert (=> start!111180 m!1204023))

(declare-fun m!1204025 () Bool)

(assert (=> start!111180 m!1204025))

(declare-fun m!1204027 () Bool)

(assert (=> mapNonEmpty!54910 m!1204027))

(check-sat tp_is_empty!35521 (not mapNonEmpty!54910) (not b!1314934) (not b_next!29791) b_and!48001 (not b!1314931) (not start!111180) (not b!1314935))
(check-sat b_and!48001 (not b_next!29791))
