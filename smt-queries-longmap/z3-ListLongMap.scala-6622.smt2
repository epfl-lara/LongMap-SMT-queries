; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83872 () Bool)

(assert start!83872)

(declare-fun b!978349 () Bool)

(declare-fun res!654527 () Bool)

(declare-fun e!551613 () Bool)

(assert (=> b!978349 (=> (not res!654527) (not e!551613))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!34993 0))(
  ( (V!34994 (val!11304 Int)) )
))
(declare-datatypes ((ValueCell!10772 0))(
  ( (ValueCellFull!10772 (v!13863 V!34993)) (EmptyCell!10772) )
))
(declare-datatypes ((array!61078 0))(
  ( (array!61079 (arr!29392 (Array (_ BitVec 32) ValueCell!10772)) (size!29872 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61078)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61080 0))(
  ( (array!61081 (arr!29393 (Array (_ BitVec 32) (_ BitVec 64))) (size!29873 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61080)

(assert (=> b!978349 (= res!654527 (and (= (size!29872 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29873 _keys!1544) (size!29872 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!978350 () Bool)

(declare-fun res!654529 () Bool)

(assert (=> b!978350 (=> (not res!654529) (not e!551613))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61080 (_ BitVec 32)) Bool)

(assert (=> b!978350 (= res!654529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!35789 () Bool)

(declare-fun mapRes!35789 () Bool)

(declare-fun tp!68042 () Bool)

(declare-fun e!551609 () Bool)

(assert (=> mapNonEmpty!35789 (= mapRes!35789 (and tp!68042 e!551609))))

(declare-fun mapRest!35789 () (Array (_ BitVec 32) ValueCell!10772))

(declare-fun mapKey!35789 () (_ BitVec 32))

(declare-fun mapValue!35789 () ValueCell!10772)

(assert (=> mapNonEmpty!35789 (= (arr!29392 _values!1278) (store mapRest!35789 mapKey!35789 mapValue!35789))))

(declare-fun mapIsEmpty!35789 () Bool)

(assert (=> mapIsEmpty!35789 mapRes!35789))

(declare-fun b!978351 () Bool)

(declare-fun tp_is_empty!22507 () Bool)

(assert (=> b!978351 (= e!551609 tp_is_empty!22507)))

(declare-fun res!654528 () Bool)

(assert (=> start!83872 (=> (not res!654528) (not e!551613))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83872 (= res!654528 (validMask!0 mask!1948))))

(assert (=> start!83872 e!551613))

(assert (=> start!83872 true))

(declare-fun e!551610 () Bool)

(declare-fun array_inv!22773 (array!61078) Bool)

(assert (=> start!83872 (and (array_inv!22773 _values!1278) e!551610)))

(declare-fun array_inv!22774 (array!61080) Bool)

(assert (=> start!83872 (array_inv!22774 _keys!1544)))

(declare-fun b!978352 () Bool)

(declare-fun e!551611 () Bool)

(assert (=> b!978352 (= e!551610 (and e!551611 mapRes!35789))))

(declare-fun condMapEmpty!35789 () Bool)

(declare-fun mapDefault!35789 () ValueCell!10772)

(assert (=> b!978352 (= condMapEmpty!35789 (= (arr!29392 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10772)) mapDefault!35789)))))

(declare-fun b!978353 () Bool)

(assert (=> b!978353 (= e!551613 false)))

(declare-fun lt!433830 () Bool)

(declare-datatypes ((List!20372 0))(
  ( (Nil!20369) (Cons!20368 (h!21536 (_ BitVec 64)) (t!28879 List!20372)) )
))
(declare-fun arrayNoDuplicates!0 (array!61080 (_ BitVec 32) List!20372) Bool)

(assert (=> b!978353 (= lt!433830 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20369))))

(declare-fun b!978354 () Bool)

(assert (=> b!978354 (= e!551611 tp_is_empty!22507)))

(assert (= (and start!83872 res!654528) b!978349))

(assert (= (and b!978349 res!654527) b!978350))

(assert (= (and b!978350 res!654529) b!978353))

(assert (= (and b!978352 condMapEmpty!35789) mapIsEmpty!35789))

(assert (= (and b!978352 (not condMapEmpty!35789)) mapNonEmpty!35789))

(get-info :version)

(assert (= (and mapNonEmpty!35789 ((_ is ValueCellFull!10772) mapValue!35789)) b!978351))

(assert (= (and b!978352 ((_ is ValueCellFull!10772) mapDefault!35789)) b!978354))

(assert (= start!83872 b!978352))

(declare-fun m!906005 () Bool)

(assert (=> b!978350 m!906005))

(declare-fun m!906007 () Bool)

(assert (=> mapNonEmpty!35789 m!906007))

(declare-fun m!906009 () Bool)

(assert (=> start!83872 m!906009))

(declare-fun m!906011 () Bool)

(assert (=> start!83872 m!906011))

(declare-fun m!906013 () Bool)

(assert (=> start!83872 m!906013))

(declare-fun m!906015 () Bool)

(assert (=> b!978353 m!906015))

(check-sat (not b!978353) tp_is_empty!22507 (not mapNonEmpty!35789) (not b!978350) (not start!83872))
(check-sat)
