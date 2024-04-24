; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110970 () Bool)

(assert start!110970)

(declare-fun b_free!29581 () Bool)

(declare-fun b_next!29581 () Bool)

(assert (=> start!110970 (= b_free!29581 (not b_next!29581))))

(declare-fun tp!104065 () Bool)

(declare-fun b_and!47791 () Bool)

(assert (=> start!110970 (= tp!104065 b_and!47791)))

(declare-fun mapNonEmpty!54595 () Bool)

(declare-fun mapRes!54595 () Bool)

(declare-fun tp!104064 () Bool)

(declare-fun e!748561 () Bool)

(assert (=> mapNonEmpty!54595 (= mapRes!54595 (and tp!104064 e!748561))))

(declare-datatypes ((V!52185 0))(
  ( (V!52186 (val!17730 Int)) )
))
(declare-datatypes ((ValueCell!16757 0))(
  ( (ValueCellFull!16757 (v!20352 V!52185)) (EmptyCell!16757) )
))
(declare-datatypes ((array!87671 0))(
  ( (array!87672 (arr!42311 (Array (_ BitVec 32) ValueCell!16757)) (size!42862 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87671)

(declare-fun mapRest!54595 () (Array (_ BitVec 32) ValueCell!16757))

(declare-fun mapKey!54595 () (_ BitVec 32))

(declare-fun mapValue!54595 () ValueCell!16757)

(assert (=> mapNonEmpty!54595 (= (arr!42311 _values!1354) (store mapRest!54595 mapKey!54595 mapValue!54595))))

(declare-fun b!1312058 () Bool)

(declare-fun res!870707 () Bool)

(declare-fun e!748565 () Bool)

(assert (=> b!1312058 (=> (not res!870707) (not e!748565))))

(declare-datatypes ((array!87673 0))(
  ( (array!87674 (arr!42312 (Array (_ BitVec 32) (_ BitVec 64))) (size!42863 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87673)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1312058 (= res!870707 (and (= (size!42862 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42863 _keys!1628) (size!42862 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun res!870706 () Bool)

(assert (=> start!110970 (=> (not res!870706) (not e!748565))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110970 (= res!870706 (validMask!0 mask!2040))))

(assert (=> start!110970 e!748565))

(assert (=> start!110970 tp!104065))

(declare-fun array_inv!32243 (array!87673) Bool)

(assert (=> start!110970 (array_inv!32243 _keys!1628)))

(assert (=> start!110970 true))

(declare-fun tp_is_empty!35311 () Bool)

(assert (=> start!110970 tp_is_empty!35311))

(declare-fun e!748563 () Bool)

(declare-fun array_inv!32244 (array!87671) Bool)

(assert (=> start!110970 (and (array_inv!32244 _values!1354) e!748563)))

(declare-fun mapIsEmpty!54595 () Bool)

(assert (=> mapIsEmpty!54595 mapRes!54595))

(declare-fun b!1312059 () Bool)

(declare-fun res!870710 () Bool)

(assert (=> b!1312059 (=> (not res!870710) (not e!748565))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1312059 (= res!870710 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42863 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1312060 () Bool)

(assert (=> b!1312060 (= e!748561 tp_is_empty!35311)))

(declare-fun b!1312061 () Bool)

(declare-fun e!748564 () Bool)

(assert (=> b!1312061 (= e!748564 tp_is_empty!35311)))

(declare-fun b!1312062 () Bool)

(assert (=> b!1312062 (= e!748565 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585866 () Bool)

(declare-fun minValue!1296 () V!52185)

(declare-fun zeroValue!1296 () V!52185)

(declare-datatypes ((tuple2!22886 0))(
  ( (tuple2!22887 (_1!11454 (_ BitVec 64)) (_2!11454 V!52185)) )
))
(declare-datatypes ((List!30039 0))(
  ( (Nil!30036) (Cons!30035 (h!31253 tuple2!22886) (t!43637 List!30039)) )
))
(declare-datatypes ((ListLongMap!20551 0))(
  ( (ListLongMap!20552 (toList!10291 List!30039)) )
))
(declare-fun contains!8453 (ListLongMap!20551 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5295 (array!87673 array!87671 (_ BitVec 32) (_ BitVec 32) V!52185 V!52185 (_ BitVec 32) Int) ListLongMap!20551)

(assert (=> b!1312062 (= lt!585866 (contains!8453 (getCurrentListMap!5295 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1312063 () Bool)

(assert (=> b!1312063 (= e!748563 (and e!748564 mapRes!54595))))

(declare-fun condMapEmpty!54595 () Bool)

(declare-fun mapDefault!54595 () ValueCell!16757)

(assert (=> b!1312063 (= condMapEmpty!54595 (= (arr!42311 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16757)) mapDefault!54595)))))

(declare-fun b!1312064 () Bool)

(declare-fun res!870709 () Bool)

(assert (=> b!1312064 (=> (not res!870709) (not e!748565))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87673 (_ BitVec 32)) Bool)

(assert (=> b!1312064 (= res!870709 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1312065 () Bool)

(declare-fun res!870708 () Bool)

(assert (=> b!1312065 (=> (not res!870708) (not e!748565))))

(declare-datatypes ((List!30040 0))(
  ( (Nil!30037) (Cons!30036 (h!31254 (_ BitVec 64)) (t!43638 List!30040)) )
))
(declare-fun arrayNoDuplicates!0 (array!87673 (_ BitVec 32) List!30040) Bool)

(assert (=> b!1312065 (= res!870708 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30037))))

(assert (= (and start!110970 res!870706) b!1312058))

(assert (= (and b!1312058 res!870707) b!1312064))

(assert (= (and b!1312064 res!870709) b!1312065))

(assert (= (and b!1312065 res!870708) b!1312059))

(assert (= (and b!1312059 res!870710) b!1312062))

(assert (= (and b!1312063 condMapEmpty!54595) mapIsEmpty!54595))

(assert (= (and b!1312063 (not condMapEmpty!54595)) mapNonEmpty!54595))

(get-info :version)

(assert (= (and mapNonEmpty!54595 ((_ is ValueCellFull!16757) mapValue!54595)) b!1312060))

(assert (= (and b!1312063 ((_ is ValueCellFull!16757) mapDefault!54595)) b!1312061))

(assert (= start!110970 b!1312063))

(declare-fun m!1202051 () Bool)

(assert (=> b!1312062 m!1202051))

(assert (=> b!1312062 m!1202051))

(declare-fun m!1202053 () Bool)

(assert (=> b!1312062 m!1202053))

(declare-fun m!1202055 () Bool)

(assert (=> start!110970 m!1202055))

(declare-fun m!1202057 () Bool)

(assert (=> start!110970 m!1202057))

(declare-fun m!1202059 () Bool)

(assert (=> start!110970 m!1202059))

(declare-fun m!1202061 () Bool)

(assert (=> mapNonEmpty!54595 m!1202061))

(declare-fun m!1202063 () Bool)

(assert (=> b!1312065 m!1202063))

(declare-fun m!1202065 () Bool)

(assert (=> b!1312064 m!1202065))

(check-sat (not start!110970) (not mapNonEmpty!54595) (not b!1312062) (not b!1312064) (not b_next!29581) (not b!1312065) tp_is_empty!35311 b_and!47791)
(check-sat b_and!47791 (not b_next!29581))
