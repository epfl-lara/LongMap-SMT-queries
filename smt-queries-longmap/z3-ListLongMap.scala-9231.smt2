; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110958 () Bool)

(assert start!110958)

(declare-fun b_free!29569 () Bool)

(declare-fun b_next!29569 () Bool)

(assert (=> start!110958 (= b_free!29569 (not b_next!29569))))

(declare-fun tp!104029 () Bool)

(declare-fun b_and!47779 () Bool)

(assert (=> start!110958 (= tp!104029 b_and!47779)))

(declare-fun b!1311886 () Bool)

(declare-fun res!870595 () Bool)

(declare-fun e!748475 () Bool)

(assert (=> b!1311886 (=> (not res!870595) (not e!748475))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52169 0))(
  ( (V!52170 (val!17724 Int)) )
))
(declare-datatypes ((ValueCell!16751 0))(
  ( (ValueCellFull!16751 (v!20346 V!52169)) (EmptyCell!16751) )
))
(declare-datatypes ((array!87647 0))(
  ( (array!87648 (arr!42299 (Array (_ BitVec 32) ValueCell!16751)) (size!42850 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87647)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((array!87649 0))(
  ( (array!87650 (arr!42300 (Array (_ BitVec 32) (_ BitVec 64))) (size!42851 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87649)

(assert (=> b!1311886 (= res!870595 (and (= (size!42850 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42851 _keys!1628) (size!42850 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1311887 () Bool)

(declare-fun res!870588 () Bool)

(assert (=> b!1311887 (=> (not res!870588) (not e!748475))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87649 (_ BitVec 32)) Bool)

(assert (=> b!1311887 (= res!870588 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1311888 () Bool)

(declare-fun res!870596 () Bool)

(assert (=> b!1311888 (=> (not res!870596) (not e!748475))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1311888 (= res!870596 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42851 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1311889 () Bool)

(declare-fun res!870590 () Bool)

(assert (=> b!1311889 (=> (not res!870590) (not e!748475))))

(assert (=> b!1311889 (= res!870590 (not (= (select (arr!42300 _keys!1628) from!2020) k0!1175)))))

(declare-fun res!870594 () Bool)

(assert (=> start!110958 (=> (not res!870594) (not e!748475))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110958 (= res!870594 (validMask!0 mask!2040))))

(assert (=> start!110958 e!748475))

(assert (=> start!110958 tp!104029))

(declare-fun array_inv!32235 (array!87649) Bool)

(assert (=> start!110958 (array_inv!32235 _keys!1628)))

(assert (=> start!110958 true))

(declare-fun tp_is_empty!35299 () Bool)

(assert (=> start!110958 tp_is_empty!35299))

(declare-fun e!748472 () Bool)

(declare-fun array_inv!32236 (array!87647) Bool)

(assert (=> start!110958 (and (array_inv!32236 _values!1354) e!748472)))

(declare-fun b!1311890 () Bool)

(declare-fun e!748473 () Bool)

(assert (=> b!1311890 (= e!748473 tp_is_empty!35299)))

(declare-fun b!1311891 () Bool)

(declare-fun res!870589 () Bool)

(assert (=> b!1311891 (=> (not res!870589) (not e!748475))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1311891 (= res!870589 (validKeyInArray!0 (select (arr!42300 _keys!1628) from!2020)))))

(declare-fun b!1311892 () Bool)

(assert (=> b!1311892 (= e!748475 (not (bvsge (bvadd #b00000000000000000000000000000001 from!2020) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52169)

(declare-fun zeroValue!1296 () V!52169)

(declare-datatypes ((tuple2!22880 0))(
  ( (tuple2!22881 (_1!11451 (_ BitVec 64)) (_2!11451 V!52169)) )
))
(declare-datatypes ((List!30031 0))(
  ( (Nil!30028) (Cons!30027 (h!31245 tuple2!22880) (t!43629 List!30031)) )
))
(declare-datatypes ((ListLongMap!20545 0))(
  ( (ListLongMap!20546 (toList!10288 List!30031)) )
))
(declare-fun contains!8450 (ListLongMap!20545 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5292 (array!87649 array!87647 (_ BitVec 32) (_ BitVec 32) V!52169 V!52169 (_ BitVec 32) Int) ListLongMap!20545)

(assert (=> b!1311892 (contains!8450 (getCurrentListMap!5292 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43317 0))(
  ( (Unit!43318) )
))
(declare-fun lt!585848 () Unit!43317)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!20 (array!87649 array!87647 (_ BitVec 32) (_ BitVec 32) V!52169 V!52169 (_ BitVec 64) (_ BitVec 32) Int) Unit!43317)

(assert (=> b!1311892 (= lt!585848 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!20 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1311893 () Bool)

(declare-fun e!748474 () Bool)

(assert (=> b!1311893 (= e!748474 tp_is_empty!35299)))

(declare-fun b!1311894 () Bool)

(declare-fun res!870593 () Bool)

(assert (=> b!1311894 (=> (not res!870593) (not e!748475))))

(assert (=> b!1311894 (= res!870593 (contains!8450 (getCurrentListMap!5292 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapNonEmpty!54577 () Bool)

(declare-fun mapRes!54577 () Bool)

(declare-fun tp!104028 () Bool)

(assert (=> mapNonEmpty!54577 (= mapRes!54577 (and tp!104028 e!748473))))

(declare-fun mapKey!54577 () (_ BitVec 32))

(declare-fun mapRest!54577 () (Array (_ BitVec 32) ValueCell!16751))

(declare-fun mapValue!54577 () ValueCell!16751)

(assert (=> mapNonEmpty!54577 (= (arr!42299 _values!1354) (store mapRest!54577 mapKey!54577 mapValue!54577))))

(declare-fun mapIsEmpty!54577 () Bool)

(assert (=> mapIsEmpty!54577 mapRes!54577))

(declare-fun b!1311895 () Bool)

(declare-fun res!870591 () Bool)

(assert (=> b!1311895 (=> (not res!870591) (not e!748475))))

(assert (=> b!1311895 (= res!870591 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1311896 () Bool)

(declare-fun res!870592 () Bool)

(assert (=> b!1311896 (=> (not res!870592) (not e!748475))))

(declare-datatypes ((List!30032 0))(
  ( (Nil!30029) (Cons!30028 (h!31246 (_ BitVec 64)) (t!43630 List!30032)) )
))
(declare-fun arrayNoDuplicates!0 (array!87649 (_ BitVec 32) List!30032) Bool)

(assert (=> b!1311896 (= res!870592 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30029))))

(declare-fun b!1311897 () Bool)

(assert (=> b!1311897 (= e!748472 (and e!748474 mapRes!54577))))

(declare-fun condMapEmpty!54577 () Bool)

(declare-fun mapDefault!54577 () ValueCell!16751)

(assert (=> b!1311897 (= condMapEmpty!54577 (= (arr!42299 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16751)) mapDefault!54577)))))

(assert (= (and start!110958 res!870594) b!1311886))

(assert (= (and b!1311886 res!870595) b!1311887))

(assert (= (and b!1311887 res!870588) b!1311896))

(assert (= (and b!1311896 res!870592) b!1311888))

(assert (= (and b!1311888 res!870596) b!1311894))

(assert (= (and b!1311894 res!870593) b!1311889))

(assert (= (and b!1311889 res!870590) b!1311891))

(assert (= (and b!1311891 res!870589) b!1311895))

(assert (= (and b!1311895 res!870591) b!1311892))

(assert (= (and b!1311897 condMapEmpty!54577) mapIsEmpty!54577))

(assert (= (and b!1311897 (not condMapEmpty!54577)) mapNonEmpty!54577))

(get-info :version)

(assert (= (and mapNonEmpty!54577 ((_ is ValueCellFull!16751) mapValue!54577)) b!1311890))

(assert (= (and b!1311897 ((_ is ValueCellFull!16751) mapDefault!54577)) b!1311893))

(assert (= start!110958 b!1311897))

(declare-fun m!1201925 () Bool)

(assert (=> b!1311891 m!1201925))

(assert (=> b!1311891 m!1201925))

(declare-fun m!1201927 () Bool)

(assert (=> b!1311891 m!1201927))

(declare-fun m!1201929 () Bool)

(assert (=> start!110958 m!1201929))

(declare-fun m!1201931 () Bool)

(assert (=> start!110958 m!1201931))

(declare-fun m!1201933 () Bool)

(assert (=> start!110958 m!1201933))

(declare-fun m!1201935 () Bool)

(assert (=> b!1311894 m!1201935))

(assert (=> b!1311894 m!1201935))

(declare-fun m!1201937 () Bool)

(assert (=> b!1311894 m!1201937))

(declare-fun m!1201939 () Bool)

(assert (=> b!1311892 m!1201939))

(assert (=> b!1311892 m!1201939))

(declare-fun m!1201941 () Bool)

(assert (=> b!1311892 m!1201941))

(declare-fun m!1201943 () Bool)

(assert (=> b!1311892 m!1201943))

(declare-fun m!1201945 () Bool)

(assert (=> b!1311887 m!1201945))

(declare-fun m!1201947 () Bool)

(assert (=> mapNonEmpty!54577 m!1201947))

(declare-fun m!1201949 () Bool)

(assert (=> b!1311896 m!1201949))

(assert (=> b!1311889 m!1201925))

(check-sat (not b!1311891) (not b_next!29569) (not b!1311887) (not start!110958) b_and!47779 (not mapNonEmpty!54577) tp_is_empty!35299 (not b!1311896) (not b!1311892) (not b!1311894))
(check-sat b_and!47779 (not b_next!29569))
