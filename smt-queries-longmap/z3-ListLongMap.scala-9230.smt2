; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110952 () Bool)

(assert start!110952)

(declare-fun b_free!29563 () Bool)

(declare-fun b_next!29563 () Bool)

(assert (=> start!110952 (= b_free!29563 (not b_next!29563))))

(declare-fun tp!104010 () Bool)

(declare-fun b_and!47773 () Bool)

(assert (=> start!110952 (= tp!104010 b_and!47773)))

(declare-fun b!1311778 () Bool)

(declare-fun res!870514 () Bool)

(declare-fun e!748428 () Bool)

(assert (=> b!1311778 (=> (not res!870514) (not e!748428))))

(declare-datatypes ((array!87637 0))(
  ( (array!87638 (arr!42294 (Array (_ BitVec 32) (_ BitVec 64))) (size!42845 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87637)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1311778 (= res!870514 (validKeyInArray!0 (select (arr!42294 _keys!1628) from!2020)))))

(declare-fun mapIsEmpty!54568 () Bool)

(declare-fun mapRes!54568 () Bool)

(assert (=> mapIsEmpty!54568 mapRes!54568))

(declare-fun mapNonEmpty!54568 () Bool)

(declare-fun tp!104011 () Bool)

(declare-fun e!748426 () Bool)

(assert (=> mapNonEmpty!54568 (= mapRes!54568 (and tp!104011 e!748426))))

(declare-datatypes ((V!52161 0))(
  ( (V!52162 (val!17721 Int)) )
))
(declare-datatypes ((ValueCell!16748 0))(
  ( (ValueCellFull!16748 (v!20343 V!52161)) (EmptyCell!16748) )
))
(declare-fun mapValue!54568 () ValueCell!16748)

(declare-fun mapRest!54568 () (Array (_ BitVec 32) ValueCell!16748))

(declare-datatypes ((array!87639 0))(
  ( (array!87640 (arr!42295 (Array (_ BitVec 32) ValueCell!16748)) (size!42846 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87639)

(declare-fun mapKey!54568 () (_ BitVec 32))

(assert (=> mapNonEmpty!54568 (= (arr!42295 _values!1354) (store mapRest!54568 mapKey!54568 mapValue!54568))))

(declare-fun b!1311779 () Bool)

(declare-fun res!870511 () Bool)

(assert (=> b!1311779 (=> (not res!870511) (not e!748428))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87637 (_ BitVec 32)) Bool)

(assert (=> b!1311779 (= res!870511 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1311780 () Bool)

(declare-fun tp_is_empty!35293 () Bool)

(assert (=> b!1311780 (= e!748426 tp_is_empty!35293)))

(declare-fun b!1311781 () Bool)

(declare-fun res!870512 () Bool)

(assert (=> b!1311781 (=> (not res!870512) (not e!748428))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1311781 (= res!870512 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!870513 () Bool)

(assert (=> start!110952 (=> (not res!870513) (not e!748428))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110952 (= res!870513 (validMask!0 mask!2040))))

(assert (=> start!110952 e!748428))

(assert (=> start!110952 tp!104010))

(declare-fun array_inv!32231 (array!87637) Bool)

(assert (=> start!110952 (array_inv!32231 _keys!1628)))

(assert (=> start!110952 true))

(assert (=> start!110952 tp_is_empty!35293))

(declare-fun e!748427 () Bool)

(declare-fun array_inv!32232 (array!87639) Bool)

(assert (=> start!110952 (and (array_inv!32232 _values!1354) e!748427)))

(declare-fun b!1311782 () Bool)

(declare-fun res!870515 () Bool)

(assert (=> b!1311782 (=> (not res!870515) (not e!748428))))

(declare-fun k0!1175 () (_ BitVec 64))

(assert (=> b!1311782 (= res!870515 (not (= (select (arr!42294 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1311783 () Bool)

(assert (=> b!1311783 (= e!748428 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52161)

(declare-fun zeroValue!1296 () V!52161)

(declare-datatypes ((tuple2!22876 0))(
  ( (tuple2!22877 (_1!11449 (_ BitVec 64)) (_2!11449 V!52161)) )
))
(declare-datatypes ((List!30027 0))(
  ( (Nil!30024) (Cons!30023 (h!31241 tuple2!22876) (t!43625 List!30027)) )
))
(declare-datatypes ((ListLongMap!20541 0))(
  ( (ListLongMap!20542 (toList!10286 List!30027)) )
))
(declare-fun contains!8448 (ListLongMap!20541 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5290 (array!87637 array!87639 (_ BitVec 32) (_ BitVec 32) V!52161 V!52161 (_ BitVec 32) Int) ListLongMap!20541)

(assert (=> b!1311783 (contains!8448 (getCurrentListMap!5290 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43313 0))(
  ( (Unit!43314) )
))
(declare-fun lt!585839 () Unit!43313)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!18 (array!87637 array!87639 (_ BitVec 32) (_ BitVec 32) V!52161 V!52161 (_ BitVec 64) (_ BitVec 32) Int) Unit!43313)

(assert (=> b!1311783 (= lt!585839 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!18 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1311784 () Bool)

(declare-fun res!870507 () Bool)

(assert (=> b!1311784 (=> (not res!870507) (not e!748428))))

(assert (=> b!1311784 (= res!870507 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42845 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1311785 () Bool)

(declare-fun e!748429 () Bool)

(assert (=> b!1311785 (= e!748429 tp_is_empty!35293)))

(declare-fun b!1311786 () Bool)

(declare-fun res!870510 () Bool)

(assert (=> b!1311786 (=> (not res!870510) (not e!748428))))

(assert (=> b!1311786 (= res!870510 (and (= (size!42846 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42845 _keys!1628) (size!42846 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1311787 () Bool)

(assert (=> b!1311787 (= e!748427 (and e!748429 mapRes!54568))))

(declare-fun condMapEmpty!54568 () Bool)

(declare-fun mapDefault!54568 () ValueCell!16748)

(assert (=> b!1311787 (= condMapEmpty!54568 (= (arr!42295 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16748)) mapDefault!54568)))))

(declare-fun b!1311788 () Bool)

(declare-fun res!870508 () Bool)

(assert (=> b!1311788 (=> (not res!870508) (not e!748428))))

(assert (=> b!1311788 (= res!870508 (contains!8448 (getCurrentListMap!5290 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1311789 () Bool)

(declare-fun res!870509 () Bool)

(assert (=> b!1311789 (=> (not res!870509) (not e!748428))))

(declare-datatypes ((List!30028 0))(
  ( (Nil!30025) (Cons!30024 (h!31242 (_ BitVec 64)) (t!43626 List!30028)) )
))
(declare-fun arrayNoDuplicates!0 (array!87637 (_ BitVec 32) List!30028) Bool)

(assert (=> b!1311789 (= res!870509 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30025))))

(assert (= (and start!110952 res!870513) b!1311786))

(assert (= (and b!1311786 res!870510) b!1311779))

(assert (= (and b!1311779 res!870511) b!1311789))

(assert (= (and b!1311789 res!870509) b!1311784))

(assert (= (and b!1311784 res!870507) b!1311788))

(assert (= (and b!1311788 res!870508) b!1311782))

(assert (= (and b!1311782 res!870515) b!1311778))

(assert (= (and b!1311778 res!870514) b!1311781))

(assert (= (and b!1311781 res!870512) b!1311783))

(assert (= (and b!1311787 condMapEmpty!54568) mapIsEmpty!54568))

(assert (= (and b!1311787 (not condMapEmpty!54568)) mapNonEmpty!54568))

(get-info :version)

(assert (= (and mapNonEmpty!54568 ((_ is ValueCellFull!16748) mapValue!54568)) b!1311780))

(assert (= (and b!1311787 ((_ is ValueCellFull!16748) mapDefault!54568)) b!1311785))

(assert (= start!110952 b!1311787))

(declare-fun m!1201847 () Bool)

(assert (=> b!1311789 m!1201847))

(declare-fun m!1201849 () Bool)

(assert (=> b!1311778 m!1201849))

(assert (=> b!1311778 m!1201849))

(declare-fun m!1201851 () Bool)

(assert (=> b!1311778 m!1201851))

(declare-fun m!1201853 () Bool)

(assert (=> start!110952 m!1201853))

(declare-fun m!1201855 () Bool)

(assert (=> start!110952 m!1201855))

(declare-fun m!1201857 () Bool)

(assert (=> start!110952 m!1201857))

(declare-fun m!1201859 () Bool)

(assert (=> b!1311788 m!1201859))

(assert (=> b!1311788 m!1201859))

(declare-fun m!1201861 () Bool)

(assert (=> b!1311788 m!1201861))

(declare-fun m!1201863 () Bool)

(assert (=> mapNonEmpty!54568 m!1201863))

(assert (=> b!1311782 m!1201849))

(declare-fun m!1201865 () Bool)

(assert (=> b!1311779 m!1201865))

(declare-fun m!1201867 () Bool)

(assert (=> b!1311783 m!1201867))

(assert (=> b!1311783 m!1201867))

(declare-fun m!1201869 () Bool)

(assert (=> b!1311783 m!1201869))

(declare-fun m!1201871 () Bool)

(assert (=> b!1311783 m!1201871))

(check-sat (not b!1311779) (not b!1311789) b_and!47773 (not b_next!29563) (not b!1311778) (not b!1311788) (not mapNonEmpty!54568) (not b!1311783) tp_is_empty!35293 (not start!110952))
(check-sat b_and!47773 (not b_next!29563))
