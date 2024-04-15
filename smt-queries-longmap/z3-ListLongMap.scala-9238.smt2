; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110776 () Bool)

(assert start!110776)

(declare-fun b_free!29611 () Bool)

(declare-fun b_next!29611 () Bool)

(assert (=> start!110776 (= b_free!29611 (not b_next!29611))))

(declare-fun tp!104155 () Bool)

(declare-fun b_and!47801 () Bool)

(assert (=> start!110776 (= tp!104155 b_and!47801)))

(declare-fun b!1311049 () Bool)

(declare-fun res!870386 () Bool)

(declare-fun e!747914 () Bool)

(assert (=> b!1311049 (=> (not res!870386) (not e!747914))))

(declare-datatypes ((array!87581 0))(
  ( (array!87582 (arr!42271 (Array (_ BitVec 32) (_ BitVec 64))) (size!42823 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87581)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52225 0))(
  ( (V!52226 (val!17745 Int)) )
))
(declare-datatypes ((ValueCell!16772 0))(
  ( (ValueCellFull!16772 (v!20371 V!52225)) (EmptyCell!16772) )
))
(declare-datatypes ((array!87583 0))(
  ( (array!87584 (arr!42272 (Array (_ BitVec 32) ValueCell!16772)) (size!42824 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87583)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1311049 (= res!870386 (and (= (size!42824 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42823 _keys!1628) (size!42824 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1311050 () Bool)

(declare-fun res!870388 () Bool)

(assert (=> b!1311050 (=> (not res!870388) (not e!747914))))

(declare-datatypes ((List!30073 0))(
  ( (Nil!30070) (Cons!30069 (h!31278 (_ BitVec 64)) (t!43671 List!30073)) )
))
(declare-fun arrayNoDuplicates!0 (array!87581 (_ BitVec 32) List!30073) Bool)

(assert (=> b!1311050 (= res!870388 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30070))))

(declare-fun b!1311051 () Bool)

(declare-fun res!870387 () Bool)

(assert (=> b!1311051 (=> (not res!870387) (not e!747914))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87581 (_ BitVec 32)) Bool)

(assert (=> b!1311051 (= res!870387 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun res!870385 () Bool)

(assert (=> start!110776 (=> (not res!870385) (not e!747914))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110776 (= res!870385 (validMask!0 mask!2040))))

(assert (=> start!110776 e!747914))

(assert (=> start!110776 tp!104155))

(declare-fun array_inv!32123 (array!87581) Bool)

(assert (=> start!110776 (array_inv!32123 _keys!1628)))

(assert (=> start!110776 true))

(declare-fun tp_is_empty!35341 () Bool)

(assert (=> start!110776 tp_is_empty!35341))

(declare-fun e!747910 () Bool)

(declare-fun array_inv!32124 (array!87583) Bool)

(assert (=> start!110776 (and (array_inv!32124 _values!1354) e!747910)))

(declare-fun b!1311052 () Bool)

(declare-fun e!747913 () Bool)

(assert (=> b!1311052 (= e!747913 tp_is_empty!35341)))

(declare-fun b!1311053 () Bool)

(declare-fun res!870384 () Bool)

(assert (=> b!1311053 (=> (not res!870384) (not e!747914))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1311053 (= res!870384 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42823 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1311054 () Bool)

(assert (=> b!1311054 (= e!747914 false)))

(declare-fun lt!585249 () Bool)

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52225)

(declare-fun zeroValue!1296 () V!52225)

(declare-datatypes ((tuple2!22950 0))(
  ( (tuple2!22951 (_1!11486 (_ BitVec 64)) (_2!11486 V!52225)) )
))
(declare-datatypes ((List!30074 0))(
  ( (Nil!30071) (Cons!30070 (h!31279 tuple2!22950) (t!43672 List!30074)) )
))
(declare-datatypes ((ListLongMap!20607 0))(
  ( (ListLongMap!20608 (toList!10319 List!30074)) )
))
(declare-fun contains!8396 (ListLongMap!20607 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5214 (array!87581 array!87583 (_ BitVec 32) (_ BitVec 32) V!52225 V!52225 (_ BitVec 32) Int) ListLongMap!20607)

(assert (=> b!1311054 (= lt!585249 (contains!8396 (getCurrentListMap!5214 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1311055 () Bool)

(declare-fun e!747911 () Bool)

(assert (=> b!1311055 (= e!747911 tp_is_empty!35341)))

(declare-fun mapIsEmpty!54640 () Bool)

(declare-fun mapRes!54640 () Bool)

(assert (=> mapIsEmpty!54640 mapRes!54640))

(declare-fun mapNonEmpty!54640 () Bool)

(declare-fun tp!104156 () Bool)

(assert (=> mapNonEmpty!54640 (= mapRes!54640 (and tp!104156 e!747911))))

(declare-fun mapValue!54640 () ValueCell!16772)

(declare-fun mapRest!54640 () (Array (_ BitVec 32) ValueCell!16772))

(declare-fun mapKey!54640 () (_ BitVec 32))

(assert (=> mapNonEmpty!54640 (= (arr!42272 _values!1354) (store mapRest!54640 mapKey!54640 mapValue!54640))))

(declare-fun b!1311056 () Bool)

(assert (=> b!1311056 (= e!747910 (and e!747913 mapRes!54640))))

(declare-fun condMapEmpty!54640 () Bool)

(declare-fun mapDefault!54640 () ValueCell!16772)

(assert (=> b!1311056 (= condMapEmpty!54640 (= (arr!42272 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16772)) mapDefault!54640)))))

(assert (= (and start!110776 res!870385) b!1311049))

(assert (= (and b!1311049 res!870386) b!1311051))

(assert (= (and b!1311051 res!870387) b!1311050))

(assert (= (and b!1311050 res!870388) b!1311053))

(assert (= (and b!1311053 res!870384) b!1311054))

(assert (= (and b!1311056 condMapEmpty!54640) mapIsEmpty!54640))

(assert (= (and b!1311056 (not condMapEmpty!54640)) mapNonEmpty!54640))

(get-info :version)

(assert (= (and mapNonEmpty!54640 ((_ is ValueCellFull!16772) mapValue!54640)) b!1311055))

(assert (= (and b!1311056 ((_ is ValueCellFull!16772) mapDefault!54640)) b!1311052))

(assert (= start!110776 b!1311056))

(declare-fun m!1200177 () Bool)

(assert (=> mapNonEmpty!54640 m!1200177))

(declare-fun m!1200179 () Bool)

(assert (=> b!1311054 m!1200179))

(assert (=> b!1311054 m!1200179))

(declare-fun m!1200181 () Bool)

(assert (=> b!1311054 m!1200181))

(declare-fun m!1200183 () Bool)

(assert (=> b!1311051 m!1200183))

(declare-fun m!1200185 () Bool)

(assert (=> start!110776 m!1200185))

(declare-fun m!1200187 () Bool)

(assert (=> start!110776 m!1200187))

(declare-fun m!1200189 () Bool)

(assert (=> start!110776 m!1200189))

(declare-fun m!1200191 () Bool)

(assert (=> b!1311050 m!1200191))

(check-sat b_and!47801 (not b!1311051) (not mapNonEmpty!54640) tp_is_empty!35341 (not b!1311054) (not b!1311050) (not start!110776) (not b_next!29611))
(check-sat b_and!47801 (not b_next!29611))
