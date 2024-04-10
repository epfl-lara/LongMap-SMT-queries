; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110982 () Bool)

(assert start!110982)

(declare-fun b_free!29817 () Bool)

(declare-fun b_next!29817 () Bool)

(assert (=> start!110982 (= b_free!29817 (not b_next!29817))))

(declare-fun tp!104773 () Bool)

(declare-fun b_and!48025 () Bool)

(assert (=> start!110982 (= tp!104773 b_and!48025)))

(declare-fun b!1313942 () Bool)

(declare-fun res!872312 () Bool)

(declare-fun e!749489 () Bool)

(assert (=> b!1313942 (=> (not res!872312) (not e!749489))))

(declare-datatypes ((array!88066 0))(
  ( (array!88067 (arr!42513 (Array (_ BitVec 32) (_ BitVec 64))) (size!43063 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88066)

(declare-datatypes ((List!30150 0))(
  ( (Nil!30147) (Cons!30146 (h!31355 (_ BitVec 64)) (t!43756 List!30150)) )
))
(declare-fun arrayNoDuplicates!0 (array!88066 (_ BitVec 32) List!30150) Bool)

(assert (=> b!1313942 (= res!872312 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30147))))

(declare-fun mapIsEmpty!54949 () Bool)

(declare-fun mapRes!54949 () Bool)

(assert (=> mapIsEmpty!54949 mapRes!54949))

(declare-fun b!1313943 () Bool)

(declare-fun e!749492 () Bool)

(declare-fun e!749488 () Bool)

(assert (=> b!1313943 (= e!749492 (and e!749488 mapRes!54949))))

(declare-fun condMapEmpty!54949 () Bool)

(declare-datatypes ((V!52499 0))(
  ( (V!52500 (val!17848 Int)) )
))
(declare-datatypes ((ValueCell!16875 0))(
  ( (ValueCellFull!16875 (v!20475 V!52499)) (EmptyCell!16875) )
))
(declare-datatypes ((array!88068 0))(
  ( (array!88069 (arr!42514 (Array (_ BitVec 32) ValueCell!16875)) (size!43064 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88068)

(declare-fun mapDefault!54949 () ValueCell!16875)

(assert (=> b!1313943 (= condMapEmpty!54949 (= (arr!42514 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16875)) mapDefault!54949)))))

(declare-fun b!1313944 () Bool)

(declare-fun e!749490 () Bool)

(declare-fun tp_is_empty!35547 () Bool)

(assert (=> b!1313944 (= e!749490 tp_is_empty!35547)))

(declare-fun res!872309 () Bool)

(assert (=> start!110982 (=> (not res!872309) (not e!749489))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110982 (= res!872309 (validMask!0 mask!2040))))

(assert (=> start!110982 e!749489))

(assert (=> start!110982 tp!104773))

(declare-fun array_inv!32115 (array!88066) Bool)

(assert (=> start!110982 (array_inv!32115 _keys!1628)))

(assert (=> start!110982 true))

(assert (=> start!110982 tp_is_empty!35547))

(declare-fun array_inv!32116 (array!88068) Bool)

(assert (=> start!110982 (and (array_inv!32116 _values!1354) e!749492)))

(declare-fun b!1313945 () Bool)

(assert (=> b!1313945 (= e!749489 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585735 () Bool)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52499)

(declare-fun zeroValue!1296 () V!52499)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!23014 0))(
  ( (tuple2!23015 (_1!11518 (_ BitVec 64)) (_2!11518 V!52499)) )
))
(declare-datatypes ((List!30151 0))(
  ( (Nil!30148) (Cons!30147 (h!31356 tuple2!23014) (t!43757 List!30151)) )
))
(declare-datatypes ((ListLongMap!20671 0))(
  ( (ListLongMap!20672 (toList!10351 List!30151)) )
))
(declare-fun contains!8501 (ListLongMap!20671 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5364 (array!88066 array!88068 (_ BitVec 32) (_ BitVec 32) V!52499 V!52499 (_ BitVec 32) Int) ListLongMap!20671)

(assert (=> b!1313945 (= lt!585735 (contains!8501 (getCurrentListMap!5364 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1313946 () Bool)

(declare-fun res!872311 () Bool)

(assert (=> b!1313946 (=> (not res!872311) (not e!749489))))

(assert (=> b!1313946 (= res!872311 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43063 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1313947 () Bool)

(declare-fun res!872313 () Bool)

(assert (=> b!1313947 (=> (not res!872313) (not e!749489))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88066 (_ BitVec 32)) Bool)

(assert (=> b!1313947 (= res!872313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapNonEmpty!54949 () Bool)

(declare-fun tp!104772 () Bool)

(assert (=> mapNonEmpty!54949 (= mapRes!54949 (and tp!104772 e!749490))))

(declare-fun mapValue!54949 () ValueCell!16875)

(declare-fun mapKey!54949 () (_ BitVec 32))

(declare-fun mapRest!54949 () (Array (_ BitVec 32) ValueCell!16875))

(assert (=> mapNonEmpty!54949 (= (arr!42514 _values!1354) (store mapRest!54949 mapKey!54949 mapValue!54949))))

(declare-fun b!1313948 () Bool)

(assert (=> b!1313948 (= e!749488 tp_is_empty!35547)))

(declare-fun b!1313949 () Bool)

(declare-fun res!872310 () Bool)

(assert (=> b!1313949 (=> (not res!872310) (not e!749489))))

(assert (=> b!1313949 (= res!872310 (and (= (size!43064 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43063 _keys!1628) (size!43064 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(assert (= (and start!110982 res!872309) b!1313949))

(assert (= (and b!1313949 res!872310) b!1313947))

(assert (= (and b!1313947 res!872313) b!1313942))

(assert (= (and b!1313942 res!872312) b!1313946))

(assert (= (and b!1313946 res!872311) b!1313945))

(assert (= (and b!1313943 condMapEmpty!54949) mapIsEmpty!54949))

(assert (= (and b!1313943 (not condMapEmpty!54949)) mapNonEmpty!54949))

(get-info :version)

(assert (= (and mapNonEmpty!54949 ((_ is ValueCellFull!16875) mapValue!54949)) b!1313944))

(assert (= (and b!1313943 ((_ is ValueCellFull!16875) mapDefault!54949)) b!1313948))

(assert (= start!110982 b!1313943))

(declare-fun m!1202623 () Bool)

(assert (=> mapNonEmpty!54949 m!1202623))

(declare-fun m!1202625 () Bool)

(assert (=> b!1313942 m!1202625))

(declare-fun m!1202627 () Bool)

(assert (=> b!1313945 m!1202627))

(assert (=> b!1313945 m!1202627))

(declare-fun m!1202629 () Bool)

(assert (=> b!1313945 m!1202629))

(declare-fun m!1202631 () Bool)

(assert (=> start!110982 m!1202631))

(declare-fun m!1202633 () Bool)

(assert (=> start!110982 m!1202633))

(declare-fun m!1202635 () Bool)

(assert (=> start!110982 m!1202635))

(declare-fun m!1202637 () Bool)

(assert (=> b!1313947 m!1202637))

(check-sat b_and!48025 (not start!110982) (not b!1313945) tp_is_empty!35547 (not b!1313947) (not mapNonEmpty!54949) (not b!1313942) (not b_next!29817))
(check-sat b_and!48025 (not b_next!29817))
