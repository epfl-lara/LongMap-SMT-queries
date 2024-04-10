; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110682 () Bool)

(assert start!110682)

(declare-fun b_free!29517 () Bool)

(declare-fun b_next!29517 () Bool)

(assert (=> start!110682 (= b_free!29517 (not b_next!29517))))

(declare-fun tp!103872 () Bool)

(declare-fun b_and!47725 () Bool)

(assert (=> start!110682 (= tp!103872 b_and!47725)))

(declare-fun b!1309667 () Bool)

(declare-fun res!869385 () Bool)

(declare-fun e!747239 () Bool)

(assert (=> b!1309667 (=> (not res!869385) (not e!747239))))

(declare-datatypes ((array!87484 0))(
  ( (array!87485 (arr!42222 (Array (_ BitVec 32) (_ BitVec 64))) (size!42772 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87484)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52099 0))(
  ( (V!52100 (val!17698 Int)) )
))
(declare-datatypes ((ValueCell!16725 0))(
  ( (ValueCellFull!16725 (v!20325 V!52099)) (EmptyCell!16725) )
))
(declare-datatypes ((array!87486 0))(
  ( (array!87487 (arr!42223 (Array (_ BitVec 32) ValueCell!16725)) (size!42773 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87486)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1309667 (= res!869385 (and (= (size!42773 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42772 _keys!1628) (size!42773 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1309668 () Bool)

(declare-fun res!869388 () Bool)

(assert (=> b!1309668 (=> (not res!869388) (not e!747239))))

(declare-datatypes ((List!29935 0))(
  ( (Nil!29932) (Cons!29931 (h!31140 (_ BitVec 64)) (t!43541 List!29935)) )
))
(declare-fun arrayNoDuplicates!0 (array!87484 (_ BitVec 32) List!29935) Bool)

(assert (=> b!1309668 (= res!869388 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29932))))

(declare-fun b!1309670 () Bool)

(declare-fun res!869386 () Bool)

(assert (=> b!1309670 (=> (not res!869386) (not e!747239))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1309670 (= res!869386 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42772 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1309671 () Bool)

(declare-fun e!747241 () Bool)

(declare-fun tp_is_empty!35247 () Bool)

(assert (=> b!1309671 (= e!747241 tp_is_empty!35247)))

(declare-fun b!1309672 () Bool)

(declare-fun e!747242 () Bool)

(assert (=> b!1309672 (= e!747242 tp_is_empty!35247)))

(declare-fun b!1309673 () Bool)

(assert (=> b!1309673 (= e!747239 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun zeroValue!1296 () V!52099)

(declare-fun minValue!1296 () V!52099)

(declare-fun lt!585294 () Bool)

(declare-datatypes ((tuple2!22794 0))(
  ( (tuple2!22795 (_1!11408 (_ BitVec 64)) (_2!11408 V!52099)) )
))
(declare-datatypes ((List!29936 0))(
  ( (Nil!29933) (Cons!29932 (h!31141 tuple2!22794) (t!43542 List!29936)) )
))
(declare-datatypes ((ListLongMap!20451 0))(
  ( (ListLongMap!20452 (toList!10241 List!29936)) )
))
(declare-fun contains!8391 (ListLongMap!20451 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5254 (array!87484 array!87486 (_ BitVec 32) (_ BitVec 32) V!52099 V!52099 (_ BitVec 32) Int) ListLongMap!20451)

(assert (=> b!1309673 (= lt!585294 (contains!8391 (getCurrentListMap!5254 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapIsEmpty!54499 () Bool)

(declare-fun mapRes!54499 () Bool)

(assert (=> mapIsEmpty!54499 mapRes!54499))

(declare-fun res!869387 () Bool)

(assert (=> start!110682 (=> (not res!869387) (not e!747239))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110682 (= res!869387 (validMask!0 mask!2040))))

(assert (=> start!110682 e!747239))

(assert (=> start!110682 tp!103872))

(declare-fun array_inv!31907 (array!87484) Bool)

(assert (=> start!110682 (array_inv!31907 _keys!1628)))

(assert (=> start!110682 true))

(assert (=> start!110682 tp_is_empty!35247))

(declare-fun e!747238 () Bool)

(declare-fun array_inv!31908 (array!87486) Bool)

(assert (=> start!110682 (and (array_inv!31908 _values!1354) e!747238)))

(declare-fun b!1309669 () Bool)

(declare-fun res!869384 () Bool)

(assert (=> b!1309669 (=> (not res!869384) (not e!747239))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87484 (_ BitVec 32)) Bool)

(assert (=> b!1309669 (= res!869384 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1309674 () Bool)

(assert (=> b!1309674 (= e!747238 (and e!747241 mapRes!54499))))

(declare-fun condMapEmpty!54499 () Bool)

(declare-fun mapDefault!54499 () ValueCell!16725)

(assert (=> b!1309674 (= condMapEmpty!54499 (= (arr!42223 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16725)) mapDefault!54499)))))

(declare-fun mapNonEmpty!54499 () Bool)

(declare-fun tp!103873 () Bool)

(assert (=> mapNonEmpty!54499 (= mapRes!54499 (and tp!103873 e!747242))))

(declare-fun mapRest!54499 () (Array (_ BitVec 32) ValueCell!16725))

(declare-fun mapValue!54499 () ValueCell!16725)

(declare-fun mapKey!54499 () (_ BitVec 32))

(assert (=> mapNonEmpty!54499 (= (arr!42223 _values!1354) (store mapRest!54499 mapKey!54499 mapValue!54499))))

(assert (= (and start!110682 res!869387) b!1309667))

(assert (= (and b!1309667 res!869385) b!1309669))

(assert (= (and b!1309669 res!869384) b!1309668))

(assert (= (and b!1309668 res!869388) b!1309670))

(assert (= (and b!1309670 res!869386) b!1309673))

(assert (= (and b!1309674 condMapEmpty!54499) mapIsEmpty!54499))

(assert (= (and b!1309674 (not condMapEmpty!54499)) mapNonEmpty!54499))

(get-info :version)

(assert (= (and mapNonEmpty!54499 ((_ is ValueCellFull!16725) mapValue!54499)) b!1309672))

(assert (= (and b!1309674 ((_ is ValueCellFull!16725) mapDefault!54499)) b!1309671))

(assert (= start!110682 b!1309674))

(declare-fun m!1199671 () Bool)

(assert (=> mapNonEmpty!54499 m!1199671))

(declare-fun m!1199673 () Bool)

(assert (=> b!1309673 m!1199673))

(assert (=> b!1309673 m!1199673))

(declare-fun m!1199675 () Bool)

(assert (=> b!1309673 m!1199675))

(declare-fun m!1199677 () Bool)

(assert (=> b!1309669 m!1199677))

(declare-fun m!1199679 () Bool)

(assert (=> start!110682 m!1199679))

(declare-fun m!1199681 () Bool)

(assert (=> start!110682 m!1199681))

(declare-fun m!1199683 () Bool)

(assert (=> start!110682 m!1199683))

(declare-fun m!1199685 () Bool)

(assert (=> b!1309668 m!1199685))

(check-sat (not b!1309669) (not b!1309668) (not b_next!29517) tp_is_empty!35247 (not mapNonEmpty!54499) b_and!47725 (not start!110682) (not b!1309673))
(check-sat b_and!47725 (not b_next!29517))
