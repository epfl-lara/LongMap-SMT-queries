; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110598 () Bool)

(assert start!110598)

(declare-fun b_free!29433 () Bool)

(declare-fun b_next!29433 () Bool)

(assert (=> start!110598 (= b_free!29433 (not b_next!29433))))

(declare-fun tp!103620 () Bool)

(declare-fun b_and!47641 () Bool)

(assert (=> start!110598 (= tp!103620 b_and!47641)))

(declare-fun b!1308571 () Bool)

(declare-fun res!868672 () Bool)

(declare-fun e!746610 () Bool)

(assert (=> b!1308571 (=> (not res!868672) (not e!746610))))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87324 0))(
  ( (array!87325 (arr!42142 (Array (_ BitVec 32) (_ BitVec 64))) (size!42692 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87324)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!51987 0))(
  ( (V!51988 (val!17656 Int)) )
))
(declare-fun minValue!1296 () V!51987)

(declare-datatypes ((ValueCell!16683 0))(
  ( (ValueCellFull!16683 (v!20283 V!51987)) (EmptyCell!16683) )
))
(declare-datatypes ((array!87326 0))(
  ( (array!87327 (arr!42143 (Array (_ BitVec 32) ValueCell!16683)) (size!42693 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87326)

(declare-fun zeroValue!1296 () V!51987)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22734 0))(
  ( (tuple2!22735 (_1!11378 (_ BitVec 64)) (_2!11378 V!51987)) )
))
(declare-datatypes ((List!29875 0))(
  ( (Nil!29872) (Cons!29871 (h!31080 tuple2!22734) (t!43481 List!29875)) )
))
(declare-datatypes ((ListLongMap!20391 0))(
  ( (ListLongMap!20392 (toList!10211 List!29875)) )
))
(declare-fun contains!8361 (ListLongMap!20391 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5224 (array!87324 array!87326 (_ BitVec 32) (_ BitVec 32) V!51987 V!51987 (_ BitVec 32) Int) ListLongMap!20391)

(assert (=> b!1308571 (= res!868672 (contains!8361 (getCurrentListMap!5224 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1308572 () Bool)

(assert (=> b!1308572 (= e!746610 (not true))))

(assert (=> b!1308572 (contains!8361 (getCurrentListMap!5224 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43300 0))(
  ( (Unit!43301) )
))
(declare-fun lt!585168 () Unit!43300)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!14 (array!87324 array!87326 (_ BitVec 32) (_ BitVec 32) V!51987 V!51987 (_ BitVec 64) (_ BitVec 32) Int) Unit!43300)

(assert (=> b!1308572 (= lt!585168 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!14 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1308573 () Bool)

(declare-fun res!868669 () Bool)

(assert (=> b!1308573 (=> (not res!868669) (not e!746610))))

(declare-datatypes ((List!29876 0))(
  ( (Nil!29873) (Cons!29872 (h!31081 (_ BitVec 64)) (t!43482 List!29876)) )
))
(declare-fun arrayNoDuplicates!0 (array!87324 (_ BitVec 32) List!29876) Bool)

(assert (=> b!1308573 (= res!868669 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29873))))

(declare-fun b!1308574 () Bool)

(declare-fun res!868666 () Bool)

(assert (=> b!1308574 (=> (not res!868666) (not e!746610))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87324 (_ BitVec 32)) Bool)

(assert (=> b!1308574 (= res!868666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!54373 () Bool)

(declare-fun mapRes!54373 () Bool)

(assert (=> mapIsEmpty!54373 mapRes!54373))

(declare-fun b!1308575 () Bool)

(declare-fun e!746612 () Bool)

(declare-fun e!746609 () Bool)

(assert (=> b!1308575 (= e!746612 (and e!746609 mapRes!54373))))

(declare-fun condMapEmpty!54373 () Bool)

(declare-fun mapDefault!54373 () ValueCell!16683)

(assert (=> b!1308575 (= condMapEmpty!54373 (= (arr!42143 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16683)) mapDefault!54373)))))

(declare-fun b!1308576 () Bool)

(declare-fun tp_is_empty!35163 () Bool)

(assert (=> b!1308576 (= e!746609 tp_is_empty!35163)))

(declare-fun b!1308577 () Bool)

(declare-fun res!868673 () Bool)

(assert (=> b!1308577 (=> (not res!868673) (not e!746610))))

(assert (=> b!1308577 (= res!868673 (and (= (size!42693 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42692 _keys!1628) (size!42693 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1308579 () Bool)

(declare-fun res!868674 () Bool)

(assert (=> b!1308579 (=> (not res!868674) (not e!746610))))

(assert (=> b!1308579 (= res!868674 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42692 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1308580 () Bool)

(declare-fun e!746611 () Bool)

(assert (=> b!1308580 (= e!746611 tp_is_empty!35163)))

(declare-fun b!1308581 () Bool)

(declare-fun res!868670 () Bool)

(assert (=> b!1308581 (=> (not res!868670) (not e!746610))))

(assert (=> b!1308581 (= res!868670 (not (= (select (arr!42142 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1308578 () Bool)

(declare-fun res!868668 () Bool)

(assert (=> b!1308578 (=> (not res!868668) (not e!746610))))

(assert (=> b!1308578 (= res!868668 (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun res!868667 () Bool)

(assert (=> start!110598 (=> (not res!868667) (not e!746610))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110598 (= res!868667 (validMask!0 mask!2040))))

(assert (=> start!110598 e!746610))

(assert (=> start!110598 tp!103620))

(declare-fun array_inv!31853 (array!87324) Bool)

(assert (=> start!110598 (array_inv!31853 _keys!1628)))

(assert (=> start!110598 true))

(assert (=> start!110598 tp_is_empty!35163))

(declare-fun array_inv!31854 (array!87326) Bool)

(assert (=> start!110598 (and (array_inv!31854 _values!1354) e!746612)))

(declare-fun mapNonEmpty!54373 () Bool)

(declare-fun tp!103621 () Bool)

(assert (=> mapNonEmpty!54373 (= mapRes!54373 (and tp!103621 e!746611))))

(declare-fun mapKey!54373 () (_ BitVec 32))

(declare-fun mapValue!54373 () ValueCell!16683)

(declare-fun mapRest!54373 () (Array (_ BitVec 32) ValueCell!16683))

(assert (=> mapNonEmpty!54373 (= (arr!42143 _values!1354) (store mapRest!54373 mapKey!54373 mapValue!54373))))

(declare-fun b!1308582 () Bool)

(declare-fun res!868671 () Bool)

(assert (=> b!1308582 (=> (not res!868671) (not e!746610))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1308582 (= res!868671 (validKeyInArray!0 (select (arr!42142 _keys!1628) from!2020)))))

(assert (= (and start!110598 res!868667) b!1308577))

(assert (= (and b!1308577 res!868673) b!1308574))

(assert (= (and b!1308574 res!868666) b!1308573))

(assert (= (and b!1308573 res!868669) b!1308579))

(assert (= (and b!1308579 res!868674) b!1308571))

(assert (= (and b!1308571 res!868672) b!1308581))

(assert (= (and b!1308581 res!868670) b!1308582))

(assert (= (and b!1308582 res!868671) b!1308578))

(assert (= (and b!1308578 res!868668) b!1308572))

(assert (= (and b!1308575 condMapEmpty!54373) mapIsEmpty!54373))

(assert (= (and b!1308575 (not condMapEmpty!54373)) mapNonEmpty!54373))

(get-info :version)

(assert (= (and mapNonEmpty!54373 ((_ is ValueCellFull!16683) mapValue!54373)) b!1308580))

(assert (= (and b!1308575 ((_ is ValueCellFull!16683) mapDefault!54373)) b!1308576))

(assert (= start!110598 b!1308575))

(declare-fun m!1198919 () Bool)

(assert (=> b!1308574 m!1198919))

(declare-fun m!1198921 () Bool)

(assert (=> b!1308571 m!1198921))

(assert (=> b!1308571 m!1198921))

(declare-fun m!1198923 () Bool)

(assert (=> b!1308571 m!1198923))

(declare-fun m!1198925 () Bool)

(assert (=> mapNonEmpty!54373 m!1198925))

(declare-fun m!1198927 () Bool)

(assert (=> start!110598 m!1198927))

(declare-fun m!1198929 () Bool)

(assert (=> start!110598 m!1198929))

(declare-fun m!1198931 () Bool)

(assert (=> start!110598 m!1198931))

(declare-fun m!1198933 () Bool)

(assert (=> b!1308581 m!1198933))

(assert (=> b!1308582 m!1198933))

(assert (=> b!1308582 m!1198933))

(declare-fun m!1198935 () Bool)

(assert (=> b!1308582 m!1198935))

(declare-fun m!1198937 () Bool)

(assert (=> b!1308573 m!1198937))

(declare-fun m!1198939 () Bool)

(assert (=> b!1308572 m!1198939))

(assert (=> b!1308572 m!1198939))

(declare-fun m!1198941 () Bool)

(assert (=> b!1308572 m!1198941))

(declare-fun m!1198943 () Bool)

(assert (=> b!1308572 m!1198943))

(check-sat tp_is_empty!35163 (not b!1308572) (not start!110598) b_and!47641 (not mapNonEmpty!54373) (not b!1308571) (not b!1308573) (not b!1308582) (not b!1308574) (not b_next!29433))
(check-sat b_and!47641 (not b_next!29433))
