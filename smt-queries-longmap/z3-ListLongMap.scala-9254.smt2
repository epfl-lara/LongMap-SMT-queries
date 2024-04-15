; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110872 () Bool)

(assert start!110872)

(declare-fun b_free!29707 () Bool)

(declare-fun b_next!29707 () Bool)

(assert (=> start!110872 (= b_free!29707 (not b_next!29707))))

(declare-fun tp!104444 () Bool)

(declare-fun b_and!47897 () Bool)

(assert (=> start!110872 (= tp!104444 b_and!47897)))

(declare-fun b!1312525 () Bool)

(declare-fun res!871428 () Bool)

(declare-fun e!748631 () Bool)

(assert (=> b!1312525 (=> (not res!871428) (not e!748631))))

(declare-datatypes ((array!87763 0))(
  ( (array!87764 (arr!42362 (Array (_ BitVec 32) (_ BitVec 64))) (size!42914 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87763)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87763 (_ BitVec 32)) Bool)

(assert (=> b!1312525 (= res!871428 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1312526 () Bool)

(assert (=> b!1312526 (= e!748631 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!52353 0))(
  ( (V!52354 (val!17793 Int)) )
))
(declare-fun minValue!1296 () V!52353)

(declare-datatypes ((ValueCell!16820 0))(
  ( (ValueCellFull!16820 (v!20419 V!52353)) (EmptyCell!16820) )
))
(declare-datatypes ((array!87765 0))(
  ( (array!87766 (arr!42363 (Array (_ BitVec 32) ValueCell!16820)) (size!42915 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87765)

(declare-fun zeroValue!1296 () V!52353)

(declare-fun lt!585393 () Bool)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!23026 0))(
  ( (tuple2!23027 (_1!11524 (_ BitVec 64)) (_2!11524 V!52353)) )
))
(declare-datatypes ((List!30142 0))(
  ( (Nil!30139) (Cons!30138 (h!31347 tuple2!23026) (t!43740 List!30142)) )
))
(declare-datatypes ((ListLongMap!20683 0))(
  ( (ListLongMap!20684 (toList!10357 List!30142)) )
))
(declare-fun contains!8434 (ListLongMap!20683 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5252 (array!87763 array!87765 (_ BitVec 32) (_ BitVec 32) V!52353 V!52353 (_ BitVec 32) Int) ListLongMap!20683)

(assert (=> b!1312526 (= lt!585393 (contains!8434 (getCurrentListMap!5252 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1312527 () Bool)

(declare-fun e!748634 () Bool)

(declare-fun tp_is_empty!35437 () Bool)

(assert (=> b!1312527 (= e!748634 tp_is_empty!35437)))

(declare-fun mapNonEmpty!54784 () Bool)

(declare-fun mapRes!54784 () Bool)

(declare-fun tp!104443 () Bool)

(declare-fun e!748633 () Bool)

(assert (=> mapNonEmpty!54784 (= mapRes!54784 (and tp!104443 e!748633))))

(declare-fun mapRest!54784 () (Array (_ BitVec 32) ValueCell!16820))

(declare-fun mapValue!54784 () ValueCell!16820)

(declare-fun mapKey!54784 () (_ BitVec 32))

(assert (=> mapNonEmpty!54784 (= (arr!42363 _values!1354) (store mapRest!54784 mapKey!54784 mapValue!54784))))

(declare-fun mapIsEmpty!54784 () Bool)

(assert (=> mapIsEmpty!54784 mapRes!54784))

(declare-fun b!1312528 () Bool)

(declare-fun res!871430 () Bool)

(assert (=> b!1312528 (=> (not res!871430) (not e!748631))))

(assert (=> b!1312528 (= res!871430 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42914 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1312529 () Bool)

(assert (=> b!1312529 (= e!748633 tp_is_empty!35437)))

(declare-fun b!1312530 () Bool)

(declare-fun res!871431 () Bool)

(assert (=> b!1312530 (=> (not res!871431) (not e!748631))))

(declare-datatypes ((List!30143 0))(
  ( (Nil!30140) (Cons!30139 (h!31348 (_ BitVec 64)) (t!43741 List!30143)) )
))
(declare-fun arrayNoDuplicates!0 (array!87763 (_ BitVec 32) List!30143) Bool)

(assert (=> b!1312530 (= res!871431 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30140))))

(declare-fun res!871432 () Bool)

(assert (=> start!110872 (=> (not res!871432) (not e!748631))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110872 (= res!871432 (validMask!0 mask!2040))))

(assert (=> start!110872 e!748631))

(assert (=> start!110872 tp!104444))

(declare-fun array_inv!32195 (array!87763) Bool)

(assert (=> start!110872 (array_inv!32195 _keys!1628)))

(assert (=> start!110872 true))

(assert (=> start!110872 tp_is_empty!35437))

(declare-fun e!748632 () Bool)

(declare-fun array_inv!32196 (array!87765) Bool)

(assert (=> start!110872 (and (array_inv!32196 _values!1354) e!748632)))

(declare-fun b!1312531 () Bool)

(declare-fun res!871429 () Bool)

(assert (=> b!1312531 (=> (not res!871429) (not e!748631))))

(assert (=> b!1312531 (= res!871429 (and (= (size!42915 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42914 _keys!1628) (size!42915 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1312532 () Bool)

(assert (=> b!1312532 (= e!748632 (and e!748634 mapRes!54784))))

(declare-fun condMapEmpty!54784 () Bool)

(declare-fun mapDefault!54784 () ValueCell!16820)

(assert (=> b!1312532 (= condMapEmpty!54784 (= (arr!42363 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16820)) mapDefault!54784)))))

(assert (= (and start!110872 res!871432) b!1312531))

(assert (= (and b!1312531 res!871429) b!1312525))

(assert (= (and b!1312525 res!871428) b!1312530))

(assert (= (and b!1312530 res!871431) b!1312528))

(assert (= (and b!1312528 res!871430) b!1312526))

(assert (= (and b!1312532 condMapEmpty!54784) mapIsEmpty!54784))

(assert (= (and b!1312532 (not condMapEmpty!54784)) mapNonEmpty!54784))

(get-info :version)

(assert (= (and mapNonEmpty!54784 ((_ is ValueCellFull!16820) mapValue!54784)) b!1312529))

(assert (= (and b!1312532 ((_ is ValueCellFull!16820) mapDefault!54784)) b!1312527))

(assert (= start!110872 b!1312532))

(declare-fun m!1201215 () Bool)

(assert (=> b!1312530 m!1201215))

(declare-fun m!1201217 () Bool)

(assert (=> b!1312526 m!1201217))

(assert (=> b!1312526 m!1201217))

(declare-fun m!1201219 () Bool)

(assert (=> b!1312526 m!1201219))

(declare-fun m!1201221 () Bool)

(assert (=> b!1312525 m!1201221))

(declare-fun m!1201223 () Bool)

(assert (=> mapNonEmpty!54784 m!1201223))

(declare-fun m!1201225 () Bool)

(assert (=> start!110872 m!1201225))

(declare-fun m!1201227 () Bool)

(assert (=> start!110872 m!1201227))

(declare-fun m!1201229 () Bool)

(assert (=> start!110872 m!1201229))

(check-sat (not b!1312526) (not start!110872) (not mapNonEmpty!54784) tp_is_empty!35437 (not b_next!29707) (not b!1312530) (not b!1312525) b_and!47897)
(check-sat b_and!47897 (not b_next!29707))
