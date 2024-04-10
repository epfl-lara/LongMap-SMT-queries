; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110898 () Bool)

(assert start!110898)

(declare-fun b_free!29733 () Bool)

(declare-fun b_next!29733 () Bool)

(assert (=> start!110898 (= b_free!29733 (not b_next!29733))))

(declare-fun tp!104521 () Bool)

(declare-fun b_and!47941 () Bool)

(assert (=> start!110898 (= tp!104521 b_and!47941)))

(declare-fun b!1312907 () Bool)

(declare-fun res!871653 () Bool)

(declare-fun e!748860 () Bool)

(assert (=> b!1312907 (=> (not res!871653) (not e!748860))))

(declare-datatypes ((array!87908 0))(
  ( (array!87909 (arr!42434 (Array (_ BitVec 32) (_ BitVec 64))) (size!42984 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87908)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87908 (_ BitVec 32)) Bool)

(assert (=> b!1312907 (= res!871653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1312908 () Bool)

(declare-fun res!871654 () Bool)

(assert (=> b!1312908 (=> (not res!871654) (not e!748860))))

(declare-datatypes ((List!30089 0))(
  ( (Nil!30086) (Cons!30085 (h!31294 (_ BitVec 64)) (t!43695 List!30089)) )
))
(declare-fun arrayNoDuplicates!0 (array!87908 (_ BitVec 32) List!30089) Bool)

(assert (=> b!1312908 (= res!871654 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30086))))

(declare-fun b!1312909 () Bool)

(declare-fun res!871656 () Bool)

(assert (=> b!1312909 (=> (not res!871656) (not e!748860))))

(declare-datatypes ((V!52387 0))(
  ( (V!52388 (val!17806 Int)) )
))
(declare-datatypes ((ValueCell!16833 0))(
  ( (ValueCellFull!16833 (v!20433 V!52387)) (EmptyCell!16833) )
))
(declare-datatypes ((array!87910 0))(
  ( (array!87911 (arr!42435 (Array (_ BitVec 32) ValueCell!16833)) (size!42985 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87910)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1312909 (= res!871656 (and (= (size!42985 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42984 _keys!1628) (size!42985 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!54823 () Bool)

(declare-fun mapRes!54823 () Bool)

(declare-fun tp!104520 () Bool)

(declare-fun e!748862 () Bool)

(assert (=> mapNonEmpty!54823 (= mapRes!54823 (and tp!104520 e!748862))))

(declare-fun mapValue!54823 () ValueCell!16833)

(declare-fun mapKey!54823 () (_ BitVec 32))

(declare-fun mapRest!54823 () (Array (_ BitVec 32) ValueCell!16833))

(assert (=> mapNonEmpty!54823 (= (arr!42435 _values!1354) (store mapRest!54823 mapKey!54823 mapValue!54823))))

(declare-fun b!1312910 () Bool)

(declare-fun res!871655 () Bool)

(assert (=> b!1312910 (=> (not res!871655) (not e!748860))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1312910 (= res!871655 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42984 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1312911 () Bool)

(declare-fun tp_is_empty!35463 () Bool)

(assert (=> b!1312911 (= e!748862 tp_is_empty!35463)))

(declare-fun mapIsEmpty!54823 () Bool)

(assert (=> mapIsEmpty!54823 mapRes!54823))

(declare-fun res!871652 () Bool)

(assert (=> start!110898 (=> (not res!871652) (not e!748860))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110898 (= res!871652 (validMask!0 mask!2040))))

(assert (=> start!110898 e!748860))

(assert (=> start!110898 tp!104521))

(declare-fun array_inv!32055 (array!87908) Bool)

(assert (=> start!110898 (array_inv!32055 _keys!1628)))

(assert (=> start!110898 true))

(assert (=> start!110898 tp_is_empty!35463))

(declare-fun e!748858 () Bool)

(declare-fun array_inv!32056 (array!87910) Bool)

(assert (=> start!110898 (and (array_inv!32056 _values!1354) e!748858)))

(declare-fun b!1312912 () Bool)

(assert (=> b!1312912 (= e!748860 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585618 () Bool)

(declare-fun minValue!1296 () V!52387)

(declare-fun zeroValue!1296 () V!52387)

(declare-datatypes ((tuple2!22952 0))(
  ( (tuple2!22953 (_1!11487 (_ BitVec 64)) (_2!11487 V!52387)) )
))
(declare-datatypes ((List!30090 0))(
  ( (Nil!30087) (Cons!30086 (h!31295 tuple2!22952) (t!43696 List!30090)) )
))
(declare-datatypes ((ListLongMap!20609 0))(
  ( (ListLongMap!20610 (toList!10320 List!30090)) )
))
(declare-fun contains!8470 (ListLongMap!20609 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5333 (array!87908 array!87910 (_ BitVec 32) (_ BitVec 32) V!52387 V!52387 (_ BitVec 32) Int) ListLongMap!20609)

(assert (=> b!1312912 (= lt!585618 (contains!8470 (getCurrentListMap!5333 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1312913 () Bool)

(declare-fun e!748861 () Bool)

(assert (=> b!1312913 (= e!748858 (and e!748861 mapRes!54823))))

(declare-fun condMapEmpty!54823 () Bool)

(declare-fun mapDefault!54823 () ValueCell!16833)

(assert (=> b!1312913 (= condMapEmpty!54823 (= (arr!42435 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16833)) mapDefault!54823)))))

(declare-fun b!1312914 () Bool)

(assert (=> b!1312914 (= e!748861 tp_is_empty!35463)))

(assert (= (and start!110898 res!871652) b!1312909))

(assert (= (and b!1312909 res!871656) b!1312907))

(assert (= (and b!1312907 res!871653) b!1312908))

(assert (= (and b!1312908 res!871654) b!1312910))

(assert (= (and b!1312910 res!871655) b!1312912))

(assert (= (and b!1312913 condMapEmpty!54823) mapIsEmpty!54823))

(assert (= (and b!1312913 (not condMapEmpty!54823)) mapNonEmpty!54823))

(get-info :version)

(assert (= (and mapNonEmpty!54823 ((_ is ValueCellFull!16833) mapValue!54823)) b!1312911))

(assert (= (and b!1312913 ((_ is ValueCellFull!16833) mapDefault!54823)) b!1312914))

(assert (= start!110898 b!1312913))

(declare-fun m!1201939 () Bool)

(assert (=> b!1312912 m!1201939))

(assert (=> b!1312912 m!1201939))

(declare-fun m!1201941 () Bool)

(assert (=> b!1312912 m!1201941))

(declare-fun m!1201943 () Bool)

(assert (=> b!1312907 m!1201943))

(declare-fun m!1201945 () Bool)

(assert (=> start!110898 m!1201945))

(declare-fun m!1201947 () Bool)

(assert (=> start!110898 m!1201947))

(declare-fun m!1201949 () Bool)

(assert (=> start!110898 m!1201949))

(declare-fun m!1201951 () Bool)

(assert (=> mapNonEmpty!54823 m!1201951))

(declare-fun m!1201953 () Bool)

(assert (=> b!1312908 m!1201953))

(check-sat tp_is_empty!35463 (not b!1312907) (not b!1312908) b_and!47941 (not b!1312912) (not start!110898) (not mapNonEmpty!54823) (not b_next!29733))
(check-sat b_and!47941 (not b_next!29733))
