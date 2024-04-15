; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110902 () Bool)

(assert start!110902)

(declare-fun b_free!29737 () Bool)

(declare-fun b_next!29737 () Bool)

(assert (=> start!110902 (= b_free!29737 (not b_next!29737))))

(declare-fun tp!104533 () Bool)

(declare-fun b_and!47927 () Bool)

(assert (=> start!110902 (= tp!104533 b_and!47927)))

(declare-fun b!1312885 () Bool)

(declare-fun res!871656 () Bool)

(declare-fun e!748856 () Bool)

(assert (=> b!1312885 (=> (not res!871656) (not e!748856))))

(declare-datatypes ((array!87817 0))(
  ( (array!87818 (arr!42389 (Array (_ BitVec 32) (_ BitVec 64))) (size!42941 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87817)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52393 0))(
  ( (V!52394 (val!17808 Int)) )
))
(declare-datatypes ((ValueCell!16835 0))(
  ( (ValueCellFull!16835 (v!20434 V!52393)) (EmptyCell!16835) )
))
(declare-datatypes ((array!87819 0))(
  ( (array!87820 (arr!42390 (Array (_ BitVec 32) ValueCell!16835)) (size!42942 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87819)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1312885 (= res!871656 (and (= (size!42942 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42941 _keys!1628) (size!42942 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1312886 () Bool)

(declare-fun res!871654 () Bool)

(assert (=> b!1312886 (=> (not res!871654) (not e!748856))))

(declare-datatypes ((List!30163 0))(
  ( (Nil!30160) (Cons!30159 (h!31368 (_ BitVec 64)) (t!43761 List!30163)) )
))
(declare-fun arrayNoDuplicates!0 (array!87817 (_ BitVec 32) List!30163) Bool)

(assert (=> b!1312886 (= res!871654 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30160))))

(declare-fun b!1312887 () Bool)

(declare-fun res!871653 () Bool)

(assert (=> b!1312887 (=> (not res!871653) (not e!748856))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87817 (_ BitVec 32)) Bool)

(assert (=> b!1312887 (= res!871653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!54829 () Bool)

(declare-fun mapRes!54829 () Bool)

(assert (=> mapIsEmpty!54829 mapRes!54829))

(declare-fun b!1312888 () Bool)

(declare-fun e!748857 () Bool)

(declare-fun tp_is_empty!35467 () Bool)

(assert (=> b!1312888 (= e!748857 tp_is_empty!35467)))

(declare-fun res!871655 () Bool)

(assert (=> start!110902 (=> (not res!871655) (not e!748856))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110902 (= res!871655 (validMask!0 mask!2040))))

(assert (=> start!110902 e!748856))

(assert (=> start!110902 tp!104533))

(declare-fun array_inv!32213 (array!87817) Bool)

(assert (=> start!110902 (array_inv!32213 _keys!1628)))

(assert (=> start!110902 true))

(assert (=> start!110902 tp_is_empty!35467))

(declare-fun e!748858 () Bool)

(declare-fun array_inv!32214 (array!87819) Bool)

(assert (=> start!110902 (and (array_inv!32214 _values!1354) e!748858)))

(declare-fun b!1312889 () Bool)

(declare-fun e!748855 () Bool)

(assert (=> b!1312889 (= e!748858 (and e!748855 mapRes!54829))))

(declare-fun condMapEmpty!54829 () Bool)

(declare-fun mapDefault!54829 () ValueCell!16835)

(assert (=> b!1312889 (= condMapEmpty!54829 (= (arr!42390 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16835)) mapDefault!54829)))))

(declare-fun b!1312890 () Bool)

(declare-fun res!871657 () Bool)

(assert (=> b!1312890 (=> (not res!871657) (not e!748856))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1312890 (= res!871657 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42941 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1312891 () Bool)

(assert (=> b!1312891 (= e!748855 tp_is_empty!35467)))

(declare-fun b!1312892 () Bool)

(assert (=> b!1312892 (= e!748856 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585438 () Bool)

(declare-fun minValue!1296 () V!52393)

(declare-fun zeroValue!1296 () V!52393)

(declare-datatypes ((tuple2!23046 0))(
  ( (tuple2!23047 (_1!11534 (_ BitVec 64)) (_2!11534 V!52393)) )
))
(declare-datatypes ((List!30164 0))(
  ( (Nil!30161) (Cons!30160 (h!31369 tuple2!23046) (t!43762 List!30164)) )
))
(declare-datatypes ((ListLongMap!20703 0))(
  ( (ListLongMap!20704 (toList!10367 List!30164)) )
))
(declare-fun contains!8444 (ListLongMap!20703 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5262 (array!87817 array!87819 (_ BitVec 32) (_ BitVec 32) V!52393 V!52393 (_ BitVec 32) Int) ListLongMap!20703)

(assert (=> b!1312892 (= lt!585438 (contains!8444 (getCurrentListMap!5262 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapNonEmpty!54829 () Bool)

(declare-fun tp!104534 () Bool)

(assert (=> mapNonEmpty!54829 (= mapRes!54829 (and tp!104534 e!748857))))

(declare-fun mapRest!54829 () (Array (_ BitVec 32) ValueCell!16835))

(declare-fun mapKey!54829 () (_ BitVec 32))

(declare-fun mapValue!54829 () ValueCell!16835)

(assert (=> mapNonEmpty!54829 (= (arr!42390 _values!1354) (store mapRest!54829 mapKey!54829 mapValue!54829))))

(assert (= (and start!110902 res!871655) b!1312885))

(assert (= (and b!1312885 res!871656) b!1312887))

(assert (= (and b!1312887 res!871653) b!1312886))

(assert (= (and b!1312886 res!871654) b!1312890))

(assert (= (and b!1312890 res!871657) b!1312892))

(assert (= (and b!1312889 condMapEmpty!54829) mapIsEmpty!54829))

(assert (= (and b!1312889 (not condMapEmpty!54829)) mapNonEmpty!54829))

(get-info :version)

(assert (= (and mapNonEmpty!54829 ((_ is ValueCellFull!16835) mapValue!54829)) b!1312888))

(assert (= (and b!1312889 ((_ is ValueCellFull!16835) mapDefault!54829)) b!1312891))

(assert (= start!110902 b!1312889))

(declare-fun m!1201455 () Bool)

(assert (=> mapNonEmpty!54829 m!1201455))

(declare-fun m!1201457 () Bool)

(assert (=> b!1312886 m!1201457))

(declare-fun m!1201459 () Bool)

(assert (=> b!1312887 m!1201459))

(declare-fun m!1201461 () Bool)

(assert (=> start!110902 m!1201461))

(declare-fun m!1201463 () Bool)

(assert (=> start!110902 m!1201463))

(declare-fun m!1201465 () Bool)

(assert (=> start!110902 m!1201465))

(declare-fun m!1201467 () Bool)

(assert (=> b!1312892 m!1201467))

(assert (=> b!1312892 m!1201467))

(declare-fun m!1201469 () Bool)

(assert (=> b!1312892 m!1201469))

(check-sat b_and!47927 (not mapNonEmpty!54829) (not start!110902) (not b!1312887) (not b!1312886) tp_is_empty!35467 (not b!1312892) (not b_next!29737))
(check-sat b_and!47927 (not b_next!29737))
