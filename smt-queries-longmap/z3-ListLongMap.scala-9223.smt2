; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110688 () Bool)

(assert start!110688)

(declare-fun b_free!29523 () Bool)

(declare-fun b_next!29523 () Bool)

(assert (=> start!110688 (= b_free!29523 (not b_next!29523))))

(declare-fun tp!103890 () Bool)

(declare-fun b_and!47731 () Bool)

(assert (=> start!110688 (= tp!103890 b_and!47731)))

(declare-fun b!1309760 () Bool)

(declare-fun e!747285 () Bool)

(declare-fun tp_is_empty!35253 () Bool)

(assert (=> b!1309760 (= e!747285 tp_is_empty!35253)))

(declare-fun b!1309761 () Bool)

(declare-fun res!869450 () Bool)

(declare-fun e!747286 () Bool)

(assert (=> b!1309761 (=> (not res!869450) (not e!747286))))

(declare-datatypes ((array!87496 0))(
  ( (array!87497 (arr!42228 (Array (_ BitVec 32) (_ BitVec 64))) (size!42778 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87496)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52107 0))(
  ( (V!52108 (val!17701 Int)) )
))
(declare-datatypes ((ValueCell!16728 0))(
  ( (ValueCellFull!16728 (v!20328 V!52107)) (EmptyCell!16728) )
))
(declare-datatypes ((array!87498 0))(
  ( (array!87499 (arr!42229 (Array (_ BitVec 32) ValueCell!16728)) (size!42779 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87498)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1309761 (= res!869450 (and (= (size!42779 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42778 _keys!1628) (size!42779 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!54508 () Bool)

(declare-fun mapRes!54508 () Bool)

(declare-fun tp!103891 () Bool)

(assert (=> mapNonEmpty!54508 (= mapRes!54508 (and tp!103891 e!747285))))

(declare-fun mapValue!54508 () ValueCell!16728)

(declare-fun mapRest!54508 () (Array (_ BitVec 32) ValueCell!16728))

(declare-fun mapKey!54508 () (_ BitVec 32))

(assert (=> mapNonEmpty!54508 (= (arr!42229 _values!1354) (store mapRest!54508 mapKey!54508 mapValue!54508))))

(declare-fun b!1309762 () Bool)

(declare-fun res!869449 () Bool)

(assert (=> b!1309762 (=> (not res!869449) (not e!747286))))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1309762 (= res!869449 (validKeyInArray!0 (select (arr!42228 _keys!1628) from!2020)))))

(declare-fun b!1309763 () Bool)

(declare-fun res!869456 () Bool)

(assert (=> b!1309763 (=> (not res!869456) (not e!747286))))

(assert (=> b!1309763 (= res!869456 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1309764 () Bool)

(declare-fun e!747283 () Bool)

(declare-fun e!747284 () Bool)

(assert (=> b!1309764 (= e!747283 (and e!747284 mapRes!54508))))

(declare-fun condMapEmpty!54508 () Bool)

(declare-fun mapDefault!54508 () ValueCell!16728)

(assert (=> b!1309764 (= condMapEmpty!54508 (= (arr!42229 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16728)) mapDefault!54508)))))

(declare-fun b!1309765 () Bool)

(declare-fun res!869454 () Bool)

(assert (=> b!1309765 (=> (not res!869454) (not e!747286))))

(declare-fun k0!1175 () (_ BitVec 64))

(assert (=> b!1309765 (= res!869454 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42778 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!54508 () Bool)

(assert (=> mapIsEmpty!54508 mapRes!54508))

(declare-fun b!1309766 () Bool)

(declare-fun res!869457 () Bool)

(assert (=> b!1309766 (=> (not res!869457) (not e!747286))))

(assert (=> b!1309766 (= res!869457 (not (= (select (arr!42228 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1309759 () Bool)

(declare-fun res!869451 () Bool)

(assert (=> b!1309759 (=> (not res!869451) (not e!747286))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87496 (_ BitVec 32)) Bool)

(assert (=> b!1309759 (= res!869451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun res!869452 () Bool)

(assert (=> start!110688 (=> (not res!869452) (not e!747286))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110688 (= res!869452 (validMask!0 mask!2040))))

(assert (=> start!110688 e!747286))

(assert (=> start!110688 tp!103890))

(declare-fun array_inv!31911 (array!87496) Bool)

(assert (=> start!110688 (array_inv!31911 _keys!1628)))

(assert (=> start!110688 true))

(assert (=> start!110688 tp_is_empty!35253))

(declare-fun array_inv!31912 (array!87498) Bool)

(assert (=> start!110688 (and (array_inv!31912 _values!1354) e!747283)))

(declare-fun b!1309767 () Bool)

(declare-fun res!869455 () Bool)

(assert (=> b!1309767 (=> (not res!869455) (not e!747286))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52107)

(declare-fun zeroValue!1296 () V!52107)

(declare-datatypes ((tuple2!22798 0))(
  ( (tuple2!22799 (_1!11410 (_ BitVec 64)) (_2!11410 V!52107)) )
))
(declare-datatypes ((List!29939 0))(
  ( (Nil!29936) (Cons!29935 (h!31144 tuple2!22798) (t!43545 List!29939)) )
))
(declare-datatypes ((ListLongMap!20455 0))(
  ( (ListLongMap!20456 (toList!10243 List!29939)) )
))
(declare-fun contains!8393 (ListLongMap!20455 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5256 (array!87496 array!87498 (_ BitVec 32) (_ BitVec 32) V!52107 V!52107 (_ BitVec 32) Int) ListLongMap!20455)

(assert (=> b!1309767 (= res!869455 (contains!8393 (getCurrentListMap!5256 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1309768 () Bool)

(assert (=> b!1309768 (= e!747286 (not true))))

(assert (=> b!1309768 (contains!8393 (getCurrentListMap!5256 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43312 0))(
  ( (Unit!43313) )
))
(declare-fun lt!585303 () Unit!43312)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!2 (array!87496 array!87498 (_ BitVec 32) (_ BitVec 32) V!52107 V!52107 (_ BitVec 64) (_ BitVec 32) Int) Unit!43312)

(assert (=> b!1309768 (= lt!585303 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!2 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1309769 () Bool)

(declare-fun res!869453 () Bool)

(assert (=> b!1309769 (=> (not res!869453) (not e!747286))))

(declare-datatypes ((List!29940 0))(
  ( (Nil!29937) (Cons!29936 (h!31145 (_ BitVec 64)) (t!43546 List!29940)) )
))
(declare-fun arrayNoDuplicates!0 (array!87496 (_ BitVec 32) List!29940) Bool)

(assert (=> b!1309769 (= res!869453 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29937))))

(declare-fun b!1309770 () Bool)

(assert (=> b!1309770 (= e!747284 tp_is_empty!35253)))

(assert (= (and start!110688 res!869452) b!1309761))

(assert (= (and b!1309761 res!869450) b!1309759))

(assert (= (and b!1309759 res!869451) b!1309769))

(assert (= (and b!1309769 res!869453) b!1309765))

(assert (= (and b!1309765 res!869454) b!1309767))

(assert (= (and b!1309767 res!869455) b!1309766))

(assert (= (and b!1309766 res!869457) b!1309762))

(assert (= (and b!1309762 res!869449) b!1309763))

(assert (= (and b!1309763 res!869456) b!1309768))

(assert (= (and b!1309764 condMapEmpty!54508) mapIsEmpty!54508))

(assert (= (and b!1309764 (not condMapEmpty!54508)) mapNonEmpty!54508))

(get-info :version)

(assert (= (and mapNonEmpty!54508 ((_ is ValueCellFull!16728) mapValue!54508)) b!1309760))

(assert (= (and b!1309764 ((_ is ValueCellFull!16728) mapDefault!54508)) b!1309770))

(assert (= start!110688 b!1309764))

(declare-fun m!1199729 () Bool)

(assert (=> b!1309768 m!1199729))

(assert (=> b!1309768 m!1199729))

(declare-fun m!1199731 () Bool)

(assert (=> b!1309768 m!1199731))

(declare-fun m!1199733 () Bool)

(assert (=> b!1309768 m!1199733))

(declare-fun m!1199735 () Bool)

(assert (=> mapNonEmpty!54508 m!1199735))

(declare-fun m!1199737 () Bool)

(assert (=> b!1309767 m!1199737))

(assert (=> b!1309767 m!1199737))

(declare-fun m!1199739 () Bool)

(assert (=> b!1309767 m!1199739))

(declare-fun m!1199741 () Bool)

(assert (=> b!1309759 m!1199741))

(declare-fun m!1199743 () Bool)

(assert (=> b!1309769 m!1199743))

(declare-fun m!1199745 () Bool)

(assert (=> b!1309766 m!1199745))

(declare-fun m!1199747 () Bool)

(assert (=> start!110688 m!1199747))

(declare-fun m!1199749 () Bool)

(assert (=> start!110688 m!1199749))

(declare-fun m!1199751 () Bool)

(assert (=> start!110688 m!1199751))

(assert (=> b!1309762 m!1199745))

(assert (=> b!1309762 m!1199745))

(declare-fun m!1199753 () Bool)

(assert (=> b!1309762 m!1199753))

(check-sat (not mapNonEmpty!54508) (not b!1309767) b_and!47731 (not start!110688) (not b!1309762) (not b_next!29523) (not b!1309769) (not b!1309759) (not b!1309768) tp_is_empty!35253)
(check-sat b_and!47731 (not b_next!29523))
