; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110940 () Bool)

(assert start!110940)

(declare-fun b_free!29775 () Bool)

(declare-fun b_next!29775 () Bool)

(assert (=> start!110940 (= b_free!29775 (not b_next!29775))))

(declare-fun tp!104646 () Bool)

(declare-fun b_and!47983 () Bool)

(assert (=> start!110940 (= tp!104646 b_and!47983)))

(declare-fun b!1313438 () Bool)

(declare-fun res!871994 () Bool)

(declare-fun e!749175 () Bool)

(assert (=> b!1313438 (=> (not res!871994) (not e!749175))))

(declare-datatypes ((array!87988 0))(
  ( (array!87989 (arr!42474 (Array (_ BitVec 32) (_ BitVec 64))) (size!43024 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87988)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52443 0))(
  ( (V!52444 (val!17827 Int)) )
))
(declare-datatypes ((ValueCell!16854 0))(
  ( (ValueCellFull!16854 (v!20454 V!52443)) (EmptyCell!16854) )
))
(declare-datatypes ((array!87990 0))(
  ( (array!87991 (arr!42475 (Array (_ BitVec 32) ValueCell!16854)) (size!43025 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87990)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1313438 (= res!871994 (and (= (size!43025 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43024 _keys!1628) (size!43025 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1313439 () Bool)

(assert (=> b!1313439 (= e!749175 false)))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52443)

(declare-fun zeroValue!1296 () V!52443)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun lt!585672 () Bool)

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((tuple2!22984 0))(
  ( (tuple2!22985 (_1!11503 (_ BitVec 64)) (_2!11503 V!52443)) )
))
(declare-datatypes ((List!30120 0))(
  ( (Nil!30117) (Cons!30116 (h!31325 tuple2!22984) (t!43726 List!30120)) )
))
(declare-datatypes ((ListLongMap!20641 0))(
  ( (ListLongMap!20642 (toList!10336 List!30120)) )
))
(declare-fun contains!8486 (ListLongMap!20641 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5349 (array!87988 array!87990 (_ BitVec 32) (_ BitVec 32) V!52443 V!52443 (_ BitVec 32) Int) ListLongMap!20641)

(assert (=> b!1313439 (= lt!585672 (contains!8486 (getCurrentListMap!5349 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapIsEmpty!54886 () Bool)

(declare-fun mapRes!54886 () Bool)

(assert (=> mapIsEmpty!54886 mapRes!54886))

(declare-fun mapNonEmpty!54886 () Bool)

(declare-fun tp!104647 () Bool)

(declare-fun e!749177 () Bool)

(assert (=> mapNonEmpty!54886 (= mapRes!54886 (and tp!104647 e!749177))))

(declare-fun mapRest!54886 () (Array (_ BitVec 32) ValueCell!16854))

(declare-fun mapValue!54886 () ValueCell!16854)

(declare-fun mapKey!54886 () (_ BitVec 32))

(assert (=> mapNonEmpty!54886 (= (arr!42475 _values!1354) (store mapRest!54886 mapKey!54886 mapValue!54886))))

(declare-fun b!1313440 () Bool)

(declare-fun res!871998 () Bool)

(assert (=> b!1313440 (=> (not res!871998) (not e!749175))))

(assert (=> b!1313440 (= res!871998 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43024 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!871997 () Bool)

(assert (=> start!110940 (=> (not res!871997) (not e!749175))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110940 (= res!871997 (validMask!0 mask!2040))))

(assert (=> start!110940 e!749175))

(assert (=> start!110940 tp!104646))

(declare-fun array_inv!32083 (array!87988) Bool)

(assert (=> start!110940 (array_inv!32083 _keys!1628)))

(assert (=> start!110940 true))

(declare-fun tp_is_empty!35505 () Bool)

(assert (=> start!110940 tp_is_empty!35505))

(declare-fun e!749174 () Bool)

(declare-fun array_inv!32084 (array!87990) Bool)

(assert (=> start!110940 (and (array_inv!32084 _values!1354) e!749174)))

(declare-fun b!1313441 () Bool)

(declare-fun e!749173 () Bool)

(assert (=> b!1313441 (= e!749174 (and e!749173 mapRes!54886))))

(declare-fun condMapEmpty!54886 () Bool)

(declare-fun mapDefault!54886 () ValueCell!16854)

(assert (=> b!1313441 (= condMapEmpty!54886 (= (arr!42475 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16854)) mapDefault!54886)))))

(declare-fun b!1313442 () Bool)

(declare-fun res!871995 () Bool)

(assert (=> b!1313442 (=> (not res!871995) (not e!749175))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87988 (_ BitVec 32)) Bool)

(assert (=> b!1313442 (= res!871995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1313443 () Bool)

(assert (=> b!1313443 (= e!749173 tp_is_empty!35505)))

(declare-fun b!1313444 () Bool)

(assert (=> b!1313444 (= e!749177 tp_is_empty!35505)))

(declare-fun b!1313445 () Bool)

(declare-fun res!871996 () Bool)

(assert (=> b!1313445 (=> (not res!871996) (not e!749175))))

(declare-datatypes ((List!30121 0))(
  ( (Nil!30118) (Cons!30117 (h!31326 (_ BitVec 64)) (t!43727 List!30121)) )
))
(declare-fun arrayNoDuplicates!0 (array!87988 (_ BitVec 32) List!30121) Bool)

(assert (=> b!1313445 (= res!871996 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30118))))

(assert (= (and start!110940 res!871997) b!1313438))

(assert (= (and b!1313438 res!871994) b!1313442))

(assert (= (and b!1313442 res!871995) b!1313445))

(assert (= (and b!1313445 res!871996) b!1313440))

(assert (= (and b!1313440 res!871998) b!1313439))

(assert (= (and b!1313441 condMapEmpty!54886) mapIsEmpty!54886))

(assert (= (and b!1313441 (not condMapEmpty!54886)) mapNonEmpty!54886))

(get-info :version)

(assert (= (and mapNonEmpty!54886 ((_ is ValueCellFull!16854) mapValue!54886)) b!1313444))

(assert (= (and b!1313441 ((_ is ValueCellFull!16854) mapDefault!54886)) b!1313443))

(assert (= start!110940 b!1313441))

(declare-fun m!1202287 () Bool)

(assert (=> start!110940 m!1202287))

(declare-fun m!1202289 () Bool)

(assert (=> start!110940 m!1202289))

(declare-fun m!1202291 () Bool)

(assert (=> start!110940 m!1202291))

(declare-fun m!1202293 () Bool)

(assert (=> mapNonEmpty!54886 m!1202293))

(declare-fun m!1202295 () Bool)

(assert (=> b!1313442 m!1202295))

(declare-fun m!1202297 () Bool)

(assert (=> b!1313439 m!1202297))

(assert (=> b!1313439 m!1202297))

(declare-fun m!1202299 () Bool)

(assert (=> b!1313439 m!1202299))

(declare-fun m!1202301 () Bool)

(assert (=> b!1313445 m!1202301))

(check-sat (not b!1313445) tp_is_empty!35505 (not b_next!29775) b_and!47983 (not start!110940) (not mapNonEmpty!54886) (not b!1313439) (not b!1313442))
(check-sat b_and!47983 (not b_next!29775))
