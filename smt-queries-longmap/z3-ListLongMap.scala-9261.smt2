; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110914 () Bool)

(assert start!110914)

(declare-fun b_free!29749 () Bool)

(declare-fun b_next!29749 () Bool)

(assert (=> start!110914 (= b_free!29749 (not b_next!29749))))

(declare-fun tp!104569 () Bool)

(declare-fun b_and!47939 () Bool)

(assert (=> start!110914 (= tp!104569 b_and!47939)))

(declare-fun b!1313035 () Bool)

(declare-fun res!871756 () Bool)

(declare-fun e!748949 () Bool)

(assert (=> b!1313035 (=> (not res!871756) (not e!748949))))

(declare-datatypes ((array!87841 0))(
  ( (array!87842 (arr!42401 (Array (_ BitVec 32) (_ BitVec 64))) (size!42953 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87841)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1313035 (= res!871756 (not (validKeyInArray!0 (select (arr!42401 _keys!1628) from!2020))))))

(declare-fun res!871750 () Bool)

(assert (=> start!110914 (=> (not res!871750) (not e!748949))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110914 (= res!871750 (validMask!0 mask!2040))))

(assert (=> start!110914 e!748949))

(assert (=> start!110914 tp!104569))

(declare-fun array_inv!32221 (array!87841) Bool)

(assert (=> start!110914 (array_inv!32221 _keys!1628)))

(assert (=> start!110914 true))

(declare-fun tp_is_empty!35479 () Bool)

(assert (=> start!110914 tp_is_empty!35479))

(declare-datatypes ((V!52409 0))(
  ( (V!52410 (val!17814 Int)) )
))
(declare-datatypes ((ValueCell!16841 0))(
  ( (ValueCellFull!16841 (v!20440 V!52409)) (EmptyCell!16841) )
))
(declare-datatypes ((array!87843 0))(
  ( (array!87844 (arr!42402 (Array (_ BitVec 32) ValueCell!16841)) (size!42954 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87843)

(declare-fun e!748947 () Bool)

(declare-fun array_inv!32222 (array!87843) Bool)

(assert (=> start!110914 (and (array_inv!32222 _values!1354) e!748947)))

(declare-fun b!1313036 () Bool)

(declare-fun e!748946 () Bool)

(declare-fun mapRes!54847 () Bool)

(assert (=> b!1313036 (= e!748947 (and e!748946 mapRes!54847))))

(declare-fun condMapEmpty!54847 () Bool)

(declare-fun mapDefault!54847 () ValueCell!16841)

(assert (=> b!1313036 (= condMapEmpty!54847 (= (arr!42402 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16841)) mapDefault!54847)))))

(declare-fun b!1313037 () Bool)

(declare-fun res!871755 () Bool)

(assert (=> b!1313037 (=> (not res!871755) (not e!748949))))

(declare-fun k0!1175 () (_ BitVec 64))

(assert (=> b!1313037 (= res!871755 (not (= (select (arr!42401 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1313038 () Bool)

(declare-fun res!871753 () Bool)

(assert (=> b!1313038 (=> (not res!871753) (not e!748949))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87841 (_ BitVec 32)) Bool)

(assert (=> b!1313038 (= res!871753 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapNonEmpty!54847 () Bool)

(declare-fun tp!104570 () Bool)

(declare-fun e!748948 () Bool)

(assert (=> mapNonEmpty!54847 (= mapRes!54847 (and tp!104570 e!748948))))

(declare-fun mapKey!54847 () (_ BitVec 32))

(declare-fun mapValue!54847 () ValueCell!16841)

(declare-fun mapRest!54847 () (Array (_ BitVec 32) ValueCell!16841))

(assert (=> mapNonEmpty!54847 (= (arr!42402 _values!1354) (store mapRest!54847 mapKey!54847 mapValue!54847))))

(declare-fun b!1313039 () Bool)

(declare-fun res!871749 () Bool)

(assert (=> b!1313039 (=> (not res!871749) (not e!748949))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1313039 (= res!871749 (and (= (size!42954 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42953 _keys!1628) (size!42954 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!54847 () Bool)

(assert (=> mapIsEmpty!54847 mapRes!54847))

(declare-fun b!1313040 () Bool)

(declare-fun res!871751 () Bool)

(assert (=> b!1313040 (=> (not res!871751) (not e!748949))))

(assert (=> b!1313040 (= res!871751 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42953 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1313041 () Bool)

(assert (=> b!1313041 (= e!748949 (bvslt (bvadd #b00000000000000000000000000000001 from!2020) #b00000000000000000000000000000000))))

(declare-fun b!1313042 () Bool)

(assert (=> b!1313042 (= e!748946 tp_is_empty!35479)))

(declare-fun b!1313043 () Bool)

(declare-fun res!871754 () Bool)

(assert (=> b!1313043 (=> (not res!871754) (not e!748949))))

(declare-datatypes ((List!30171 0))(
  ( (Nil!30168) (Cons!30167 (h!31376 (_ BitVec 64)) (t!43769 List!30171)) )
))
(declare-fun arrayNoDuplicates!0 (array!87841 (_ BitVec 32) List!30171) Bool)

(assert (=> b!1313043 (= res!871754 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30168))))

(declare-fun b!1313044 () Bool)

(assert (=> b!1313044 (= e!748948 tp_is_empty!35479)))

(declare-fun b!1313045 () Bool)

(declare-fun res!871752 () Bool)

(assert (=> b!1313045 (=> (not res!871752) (not e!748949))))

(declare-fun minValue!1296 () V!52409)

(declare-fun zeroValue!1296 () V!52409)

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((tuple2!23052 0))(
  ( (tuple2!23053 (_1!11537 (_ BitVec 64)) (_2!11537 V!52409)) )
))
(declare-datatypes ((List!30172 0))(
  ( (Nil!30169) (Cons!30168 (h!31377 tuple2!23052) (t!43770 List!30172)) )
))
(declare-datatypes ((ListLongMap!20709 0))(
  ( (ListLongMap!20710 (toList!10370 List!30172)) )
))
(declare-fun contains!8447 (ListLongMap!20709 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5265 (array!87841 array!87843 (_ BitVec 32) (_ BitVec 32) V!52409 V!52409 (_ BitVec 32) Int) ListLongMap!20709)

(assert (=> b!1313045 (= res!871752 (contains!8447 (getCurrentListMap!5265 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(assert (= (and start!110914 res!871750) b!1313039))

(assert (= (and b!1313039 res!871749) b!1313038))

(assert (= (and b!1313038 res!871753) b!1313043))

(assert (= (and b!1313043 res!871754) b!1313040))

(assert (= (and b!1313040 res!871751) b!1313045))

(assert (= (and b!1313045 res!871752) b!1313037))

(assert (= (and b!1313037 res!871755) b!1313035))

(assert (= (and b!1313035 res!871756) b!1313041))

(assert (= (and b!1313036 condMapEmpty!54847) mapIsEmpty!54847))

(assert (= (and b!1313036 (not condMapEmpty!54847)) mapNonEmpty!54847))

(get-info :version)

(assert (= (and mapNonEmpty!54847 ((_ is ValueCellFull!16841) mapValue!54847)) b!1313044))

(assert (= (and b!1313036 ((_ is ValueCellFull!16841) mapDefault!54847)) b!1313042))

(assert (= start!110914 b!1313036))

(declare-fun m!1201551 () Bool)

(assert (=> start!110914 m!1201551))

(declare-fun m!1201553 () Bool)

(assert (=> start!110914 m!1201553))

(declare-fun m!1201555 () Bool)

(assert (=> start!110914 m!1201555))

(declare-fun m!1201557 () Bool)

(assert (=> mapNonEmpty!54847 m!1201557))

(declare-fun m!1201559 () Bool)

(assert (=> b!1313035 m!1201559))

(assert (=> b!1313035 m!1201559))

(declare-fun m!1201561 () Bool)

(assert (=> b!1313035 m!1201561))

(declare-fun m!1201563 () Bool)

(assert (=> b!1313038 m!1201563))

(declare-fun m!1201565 () Bool)

(assert (=> b!1313043 m!1201565))

(assert (=> b!1313037 m!1201559))

(declare-fun m!1201567 () Bool)

(assert (=> b!1313045 m!1201567))

(assert (=> b!1313045 m!1201567))

(declare-fun m!1201569 () Bool)

(assert (=> b!1313045 m!1201569))

(check-sat (not b_next!29749) (not mapNonEmpty!54847) (not b!1313043) (not b!1313045) (not b!1313038) tp_is_empty!35479 b_and!47939 (not b!1313035) (not start!110914))
(check-sat b_and!47939 (not b_next!29749))
