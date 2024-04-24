; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111018 () Bool)

(assert start!111018)

(declare-fun b_free!29629 () Bool)

(declare-fun b_next!29629 () Bool)

(assert (=> start!111018 (= b_free!29629 (not b_next!29629))))

(declare-fun tp!104208 () Bool)

(declare-fun b_and!47839 () Bool)

(assert (=> start!111018 (= tp!104208 b_and!47839)))

(declare-fun b!1312634 () Bool)

(declare-fun res!871069 () Bool)

(declare-fun e!748921 () Bool)

(assert (=> b!1312634 (=> (not res!871069) (not e!748921))))

(declare-datatypes ((array!87759 0))(
  ( (array!87760 (arr!42355 (Array (_ BitVec 32) (_ BitVec 64))) (size!42906 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87759)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1312634 (= res!871069 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42906 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!871066 () Bool)

(assert (=> start!111018 (=> (not res!871066) (not e!748921))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111018 (= res!871066 (validMask!0 mask!2040))))

(assert (=> start!111018 e!748921))

(assert (=> start!111018 tp!104208))

(declare-fun array_inv!32271 (array!87759) Bool)

(assert (=> start!111018 (array_inv!32271 _keys!1628)))

(assert (=> start!111018 true))

(declare-fun tp_is_empty!35359 () Bool)

(assert (=> start!111018 tp_is_empty!35359))

(declare-datatypes ((V!52249 0))(
  ( (V!52250 (val!17754 Int)) )
))
(declare-datatypes ((ValueCell!16781 0))(
  ( (ValueCellFull!16781 (v!20376 V!52249)) (EmptyCell!16781) )
))
(declare-datatypes ((array!87761 0))(
  ( (array!87762 (arr!42356 (Array (_ BitVec 32) ValueCell!16781)) (size!42907 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87761)

(declare-fun e!748925 () Bool)

(declare-fun array_inv!32272 (array!87761) Bool)

(assert (=> start!111018 (and (array_inv!32272 _values!1354) e!748925)))

(declare-fun b!1312635 () Bool)

(declare-fun e!748922 () Bool)

(declare-fun mapRes!54667 () Bool)

(assert (=> b!1312635 (= e!748925 (and e!748922 mapRes!54667))))

(declare-fun condMapEmpty!54667 () Bool)

(declare-fun mapDefault!54667 () ValueCell!16781)

(assert (=> b!1312635 (= condMapEmpty!54667 (= (arr!42356 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16781)) mapDefault!54667)))))

(declare-fun b!1312636 () Bool)

(declare-fun e!748923 () Bool)

(assert (=> b!1312636 (= e!748923 tp_is_empty!35359)))

(declare-fun b!1312637 () Bool)

(declare-fun res!871068 () Bool)

(assert (=> b!1312637 (=> (not res!871068) (not e!748921))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87759 (_ BitVec 32)) Bool)

(assert (=> b!1312637 (= res!871068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1312638 () Bool)

(assert (=> b!1312638 (= e!748922 tp_is_empty!35359)))

(declare-fun b!1312639 () Bool)

(assert (=> b!1312639 (= e!748921 false)))

(declare-fun minValue!1296 () V!52249)

(declare-fun zeroValue!1296 () V!52249)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun lt!585938 () Bool)

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((tuple2!22916 0))(
  ( (tuple2!22917 (_1!11469 (_ BitVec 64)) (_2!11469 V!52249)) )
))
(declare-datatypes ((List!30071 0))(
  ( (Nil!30068) (Cons!30067 (h!31285 tuple2!22916) (t!43669 List!30071)) )
))
(declare-datatypes ((ListLongMap!20581 0))(
  ( (ListLongMap!20582 (toList!10306 List!30071)) )
))
(declare-fun contains!8468 (ListLongMap!20581 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5310 (array!87759 array!87761 (_ BitVec 32) (_ BitVec 32) V!52249 V!52249 (_ BitVec 32) Int) ListLongMap!20581)

(assert (=> b!1312639 (= lt!585938 (contains!8468 (getCurrentListMap!5310 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1312640 () Bool)

(declare-fun res!871070 () Bool)

(assert (=> b!1312640 (=> (not res!871070) (not e!748921))))

(declare-datatypes ((List!30072 0))(
  ( (Nil!30069) (Cons!30068 (h!31286 (_ BitVec 64)) (t!43670 List!30072)) )
))
(declare-fun arrayNoDuplicates!0 (array!87759 (_ BitVec 32) List!30072) Bool)

(assert (=> b!1312640 (= res!871070 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30069))))

(declare-fun mapIsEmpty!54667 () Bool)

(assert (=> mapIsEmpty!54667 mapRes!54667))

(declare-fun b!1312641 () Bool)

(declare-fun res!871067 () Bool)

(assert (=> b!1312641 (=> (not res!871067) (not e!748921))))

(assert (=> b!1312641 (= res!871067 (and (= (size!42907 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42906 _keys!1628) (size!42907 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!54667 () Bool)

(declare-fun tp!104209 () Bool)

(assert (=> mapNonEmpty!54667 (= mapRes!54667 (and tp!104209 e!748923))))

(declare-fun mapKey!54667 () (_ BitVec 32))

(declare-fun mapValue!54667 () ValueCell!16781)

(declare-fun mapRest!54667 () (Array (_ BitVec 32) ValueCell!16781))

(assert (=> mapNonEmpty!54667 (= (arr!42356 _values!1354) (store mapRest!54667 mapKey!54667 mapValue!54667))))

(assert (= (and start!111018 res!871066) b!1312641))

(assert (= (and b!1312641 res!871067) b!1312637))

(assert (= (and b!1312637 res!871068) b!1312640))

(assert (= (and b!1312640 res!871070) b!1312634))

(assert (= (and b!1312634 res!871069) b!1312639))

(assert (= (and b!1312635 condMapEmpty!54667) mapIsEmpty!54667))

(assert (= (and b!1312635 (not condMapEmpty!54667)) mapNonEmpty!54667))

(get-info :version)

(assert (= (and mapNonEmpty!54667 ((_ is ValueCellFull!16781) mapValue!54667)) b!1312636))

(assert (= (and b!1312635 ((_ is ValueCellFull!16781) mapDefault!54667)) b!1312638))

(assert (= start!111018 b!1312635))

(declare-fun m!1202435 () Bool)

(assert (=> b!1312639 m!1202435))

(assert (=> b!1312639 m!1202435))

(declare-fun m!1202437 () Bool)

(assert (=> b!1312639 m!1202437))

(declare-fun m!1202439 () Bool)

(assert (=> b!1312640 m!1202439))

(declare-fun m!1202441 () Bool)

(assert (=> mapNonEmpty!54667 m!1202441))

(declare-fun m!1202443 () Bool)

(assert (=> b!1312637 m!1202443))

(declare-fun m!1202445 () Bool)

(assert (=> start!111018 m!1202445))

(declare-fun m!1202447 () Bool)

(assert (=> start!111018 m!1202447))

(declare-fun m!1202449 () Bool)

(assert (=> start!111018 m!1202449))

(check-sat (not mapNonEmpty!54667) tp_is_empty!35359 (not b_next!29629) b_and!47839 (not b!1312639) (not b!1312637) (not start!111018) (not b!1312640))
(check-sat b_and!47839 (not b_next!29629))
