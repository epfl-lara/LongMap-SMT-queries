; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111084 () Bool)

(assert start!111084)

(declare-fun b_free!29695 () Bool)

(declare-fun b_next!29695 () Bool)

(assert (=> start!111084 (= b_free!29695 (not b_next!29695))))

(declare-fun tp!104407 () Bool)

(declare-fun b_and!47905 () Bool)

(assert (=> start!111084 (= tp!104407 b_and!47905)))

(declare-fun b!1313722 () Bool)

(declare-fun res!871857 () Bool)

(declare-fun e!749416 () Bool)

(assert (=> b!1313722 (=> (not res!871857) (not e!749416))))

(declare-datatypes ((array!87887 0))(
  ( (array!87888 (arr!42419 (Array (_ BitVec 32) (_ BitVec 64))) (size!42970 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87887)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52337 0))(
  ( (V!52338 (val!17787 Int)) )
))
(declare-datatypes ((ValueCell!16814 0))(
  ( (ValueCellFull!16814 (v!20409 V!52337)) (EmptyCell!16814) )
))
(declare-datatypes ((array!87889 0))(
  ( (array!87890 (arr!42420 (Array (_ BitVec 32) ValueCell!16814)) (size!42971 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87889)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1313722 (= res!871857 (and (= (size!42971 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42970 _keys!1628) (size!42971 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!54766 () Bool)

(declare-fun mapRes!54766 () Bool)

(assert (=> mapIsEmpty!54766 mapRes!54766))

(declare-fun b!1313723 () Bool)

(declare-fun res!871861 () Bool)

(assert (=> b!1313723 (=> (not res!871861) (not e!749416))))

(declare-datatypes ((List!30111 0))(
  ( (Nil!30108) (Cons!30107 (h!31325 (_ BitVec 64)) (t!43709 List!30111)) )
))
(declare-fun arrayNoDuplicates!0 (array!87887 (_ BitVec 32) List!30111) Bool)

(assert (=> b!1313723 (= res!871861 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30108))))

(declare-fun b!1313724 () Bool)

(declare-fun e!749419 () Bool)

(declare-fun tp_is_empty!35425 () Bool)

(assert (=> b!1313724 (= e!749419 tp_is_empty!35425)))

(declare-fun b!1313725 () Bool)

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1313725 (= e!749416 (not (bvsge (bvadd #b00000000000000000000000000000001 from!2020) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52337)

(declare-fun zeroValue!1296 () V!52337)

(declare-datatypes ((tuple2!22960 0))(
  ( (tuple2!22961 (_1!11491 (_ BitVec 64)) (_2!11491 V!52337)) )
))
(declare-datatypes ((List!30112 0))(
  ( (Nil!30109) (Cons!30108 (h!31326 tuple2!22960) (t!43710 List!30112)) )
))
(declare-datatypes ((ListLongMap!20625 0))(
  ( (ListLongMap!20626 (toList!10328 List!30112)) )
))
(declare-fun contains!8490 (ListLongMap!20625 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5332 (array!87887 array!87889 (_ BitVec 32) (_ BitVec 32) V!52337 V!52337 (_ BitVec 32) Int) ListLongMap!20625)

(assert (=> b!1313725 (contains!8490 (getCurrentListMap!5332 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43347 0))(
  ( (Unit!43348) )
))
(declare-fun lt!586037 () Unit!43347)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!14 (array!87887 array!87889 (_ BitVec 32) (_ BitVec 32) V!52337 V!52337 (_ BitVec 64) (_ BitVec 32) Int) Unit!43347)

(assert (=> b!1313725 (= lt!586037 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!14 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1313726 () Bool)

(declare-fun res!871863 () Bool)

(assert (=> b!1313726 (=> (not res!871863) (not e!749416))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1313726 (= res!871863 (validKeyInArray!0 (select (arr!42419 _keys!1628) from!2020)))))

(declare-fun b!1313727 () Bool)

(declare-fun res!871859 () Bool)

(assert (=> b!1313727 (=> (not res!871859) (not e!749416))))

(assert (=> b!1313727 (= res!871859 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1313728 () Bool)

(declare-fun res!871860 () Bool)

(assert (=> b!1313728 (=> (not res!871860) (not e!749416))))

(assert (=> b!1313728 (= res!871860 (contains!8490 (getCurrentListMap!5332 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1313729 () Bool)

(declare-fun e!749418 () Bool)

(declare-fun e!749417 () Bool)

(assert (=> b!1313729 (= e!749418 (and e!749417 mapRes!54766))))

(declare-fun condMapEmpty!54766 () Bool)

(declare-fun mapDefault!54766 () ValueCell!16814)

(assert (=> b!1313729 (= condMapEmpty!54766 (= (arr!42420 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16814)) mapDefault!54766)))))

(declare-fun b!1313730 () Bool)

(assert (=> b!1313730 (= e!749417 tp_is_empty!35425)))

(declare-fun res!871862 () Bool)

(assert (=> start!111084 (=> (not res!871862) (not e!749416))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111084 (= res!871862 (validMask!0 mask!2040))))

(assert (=> start!111084 e!749416))

(assert (=> start!111084 tp!104407))

(declare-fun array_inv!32307 (array!87887) Bool)

(assert (=> start!111084 (array_inv!32307 _keys!1628)))

(assert (=> start!111084 true))

(assert (=> start!111084 tp_is_empty!35425))

(declare-fun array_inv!32308 (array!87889) Bool)

(assert (=> start!111084 (and (array_inv!32308 _values!1354) e!749418)))

(declare-fun mapNonEmpty!54766 () Bool)

(declare-fun tp!104406 () Bool)

(assert (=> mapNonEmpty!54766 (= mapRes!54766 (and tp!104406 e!749419))))

(declare-fun mapKey!54766 () (_ BitVec 32))

(declare-fun mapValue!54766 () ValueCell!16814)

(declare-fun mapRest!54766 () (Array (_ BitVec 32) ValueCell!16814))

(assert (=> mapNonEmpty!54766 (= (arr!42420 _values!1354) (store mapRest!54766 mapKey!54766 mapValue!54766))))

(declare-fun b!1313731 () Bool)

(declare-fun res!871864 () Bool)

(assert (=> b!1313731 (=> (not res!871864) (not e!749416))))

(assert (=> b!1313731 (= res!871864 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42970 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1313732 () Bool)

(declare-fun res!871858 () Bool)

(assert (=> b!1313732 (=> (not res!871858) (not e!749416))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87887 (_ BitVec 32)) Bool)

(assert (=> b!1313732 (= res!871858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1313733 () Bool)

(declare-fun res!871865 () Bool)

(assert (=> b!1313733 (=> (not res!871865) (not e!749416))))

(assert (=> b!1313733 (= res!871865 (not (= (select (arr!42419 _keys!1628) from!2020) k0!1175)))))

(assert (= (and start!111084 res!871862) b!1313722))

(assert (= (and b!1313722 res!871857) b!1313732))

(assert (= (and b!1313732 res!871858) b!1313723))

(assert (= (and b!1313723 res!871861) b!1313731))

(assert (= (and b!1313731 res!871864) b!1313728))

(assert (= (and b!1313728 res!871860) b!1313733))

(assert (= (and b!1313733 res!871865) b!1313726))

(assert (= (and b!1313726 res!871863) b!1313727))

(assert (= (and b!1313727 res!871859) b!1313725))

(assert (= (and b!1313729 condMapEmpty!54766) mapIsEmpty!54766))

(assert (= (and b!1313729 (not condMapEmpty!54766)) mapNonEmpty!54766))

(get-info :version)

(assert (= (and mapNonEmpty!54766 ((_ is ValueCellFull!16814) mapValue!54766)) b!1313724))

(assert (= (and b!1313729 ((_ is ValueCellFull!16814) mapDefault!54766)) b!1313730))

(assert (= start!111084 b!1313729))

(declare-fun m!1203203 () Bool)

(assert (=> b!1313725 m!1203203))

(assert (=> b!1313725 m!1203203))

(declare-fun m!1203205 () Bool)

(assert (=> b!1313725 m!1203205))

(declare-fun m!1203207 () Bool)

(assert (=> b!1313725 m!1203207))

(declare-fun m!1203209 () Bool)

(assert (=> start!111084 m!1203209))

(declare-fun m!1203211 () Bool)

(assert (=> start!111084 m!1203211))

(declare-fun m!1203213 () Bool)

(assert (=> start!111084 m!1203213))

(declare-fun m!1203215 () Bool)

(assert (=> b!1313732 m!1203215))

(declare-fun m!1203217 () Bool)

(assert (=> b!1313726 m!1203217))

(assert (=> b!1313726 m!1203217))

(declare-fun m!1203219 () Bool)

(assert (=> b!1313726 m!1203219))

(declare-fun m!1203221 () Bool)

(assert (=> mapNonEmpty!54766 m!1203221))

(assert (=> b!1313733 m!1203217))

(declare-fun m!1203223 () Bool)

(assert (=> b!1313728 m!1203223))

(assert (=> b!1313728 m!1203223))

(declare-fun m!1203225 () Bool)

(assert (=> b!1313728 m!1203225))

(declare-fun m!1203227 () Bool)

(assert (=> b!1313723 m!1203227))

(check-sat tp_is_empty!35425 (not b!1313723) (not b_next!29695) (not b!1313725) (not start!111084) (not b!1313732) (not b!1313728) (not mapNonEmpty!54766) b_and!47905 (not b!1313726))
(check-sat b_and!47905 (not b_next!29695))
