; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111034 () Bool)

(assert start!111034)

(declare-fun b_free!29869 () Bool)

(declare-fun b_next!29869 () Bool)

(assert (=> start!111034 (= b_free!29869 (not b_next!29869))))

(declare-fun tp!104929 () Bool)

(declare-fun b_and!48059 () Bool)

(assert (=> start!111034 (= tp!104929 b_and!48059)))

(declare-fun b!1314532 () Bool)

(declare-fun e!749848 () Bool)

(assert (=> b!1314532 (= e!749848 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585627 () Bool)

(declare-datatypes ((array!88075 0))(
  ( (array!88076 (arr!42518 (Array (_ BitVec 32) (_ BitVec 64))) (size!43070 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88075)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!52569 0))(
  ( (V!52570 (val!17874 Int)) )
))
(declare-fun minValue!1296 () V!52569)

(declare-datatypes ((ValueCell!16901 0))(
  ( (ValueCellFull!16901 (v!20500 V!52569)) (EmptyCell!16901) )
))
(declare-datatypes ((array!88077 0))(
  ( (array!88078 (arr!42519 (Array (_ BitVec 32) ValueCell!16901)) (size!43071 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88077)

(declare-fun zeroValue!1296 () V!52569)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!23142 0))(
  ( (tuple2!23143 (_1!11582 (_ BitVec 64)) (_2!11582 V!52569)) )
))
(declare-datatypes ((List!30257 0))(
  ( (Nil!30254) (Cons!30253 (h!31462 tuple2!23142) (t!43855 List!30257)) )
))
(declare-datatypes ((ListLongMap!20799 0))(
  ( (ListLongMap!20800 (toList!10415 List!30257)) )
))
(declare-fun contains!8492 (ListLongMap!20799 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5310 (array!88075 array!88077 (_ BitVec 32) (_ BitVec 32) V!52569 V!52569 (_ BitVec 32) Int) ListLongMap!20799)

(assert (=> b!1314532 (= lt!585627 (contains!8492 (getCurrentListMap!5310 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1314533 () Bool)

(declare-fun res!872707 () Bool)

(assert (=> b!1314533 (=> (not res!872707) (not e!749848))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88075 (_ BitVec 32)) Bool)

(assert (=> b!1314533 (= res!872707 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1314534 () Bool)

(declare-fun e!749846 () Bool)

(declare-fun e!749849 () Bool)

(declare-fun mapRes!55027 () Bool)

(assert (=> b!1314534 (= e!749846 (and e!749849 mapRes!55027))))

(declare-fun condMapEmpty!55027 () Bool)

(declare-fun mapDefault!55027 () ValueCell!16901)

(assert (=> b!1314534 (= condMapEmpty!55027 (= (arr!42519 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16901)) mapDefault!55027)))))

(declare-fun b!1314535 () Bool)

(declare-fun e!749845 () Bool)

(declare-fun tp_is_empty!35599 () Bool)

(assert (=> b!1314535 (= e!749845 tp_is_empty!35599)))

(declare-fun b!1314536 () Bool)

(declare-fun res!872709 () Bool)

(assert (=> b!1314536 (=> (not res!872709) (not e!749848))))

(assert (=> b!1314536 (= res!872709 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43070 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1314537 () Bool)

(assert (=> b!1314537 (= e!749849 tp_is_empty!35599)))

(declare-fun mapIsEmpty!55027 () Bool)

(assert (=> mapIsEmpty!55027 mapRes!55027))

(declare-fun b!1314539 () Bool)

(declare-fun res!872706 () Bool)

(assert (=> b!1314539 (=> (not res!872706) (not e!749848))))

(declare-datatypes ((List!30258 0))(
  ( (Nil!30255) (Cons!30254 (h!31463 (_ BitVec 64)) (t!43856 List!30258)) )
))
(declare-fun arrayNoDuplicates!0 (array!88075 (_ BitVec 32) List!30258) Bool)

(assert (=> b!1314539 (= res!872706 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30255))))

(declare-fun mapNonEmpty!55027 () Bool)

(declare-fun tp!104930 () Bool)

(assert (=> mapNonEmpty!55027 (= mapRes!55027 (and tp!104930 e!749845))))

(declare-fun mapRest!55027 () (Array (_ BitVec 32) ValueCell!16901))

(declare-fun mapKey!55027 () (_ BitVec 32))

(declare-fun mapValue!55027 () ValueCell!16901)

(assert (=> mapNonEmpty!55027 (= (arr!42519 _values!1354) (store mapRest!55027 mapKey!55027 mapValue!55027))))

(declare-fun res!872710 () Bool)

(assert (=> start!111034 (=> (not res!872710) (not e!749848))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111034 (= res!872710 (validMask!0 mask!2040))))

(assert (=> start!111034 e!749848))

(assert (=> start!111034 tp!104929))

(declare-fun array_inv!32303 (array!88075) Bool)

(assert (=> start!111034 (array_inv!32303 _keys!1628)))

(assert (=> start!111034 true))

(assert (=> start!111034 tp_is_empty!35599))

(declare-fun array_inv!32304 (array!88077) Bool)

(assert (=> start!111034 (and (array_inv!32304 _values!1354) e!749846)))

(declare-fun b!1314538 () Bool)

(declare-fun res!872708 () Bool)

(assert (=> b!1314538 (=> (not res!872708) (not e!749848))))

(assert (=> b!1314538 (= res!872708 (and (= (size!43071 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43070 _keys!1628) (size!43071 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(assert (= (and start!111034 res!872710) b!1314538))

(assert (= (and b!1314538 res!872708) b!1314533))

(assert (= (and b!1314533 res!872707) b!1314539))

(assert (= (and b!1314539 res!872706) b!1314536))

(assert (= (and b!1314536 res!872709) b!1314532))

(assert (= (and b!1314534 condMapEmpty!55027) mapIsEmpty!55027))

(assert (= (and b!1314534 (not condMapEmpty!55027)) mapNonEmpty!55027))

(get-info :version)

(assert (= (and mapNonEmpty!55027 ((_ is ValueCellFull!16901) mapValue!55027)) b!1314535))

(assert (= (and b!1314534 ((_ is ValueCellFull!16901) mapDefault!55027)) b!1314537))

(assert (= start!111034 b!1314534))

(declare-fun m!1202553 () Bool)

(assert (=> b!1314533 m!1202553))

(declare-fun m!1202555 () Bool)

(assert (=> b!1314532 m!1202555))

(assert (=> b!1314532 m!1202555))

(declare-fun m!1202557 () Bool)

(assert (=> b!1314532 m!1202557))

(declare-fun m!1202559 () Bool)

(assert (=> mapNonEmpty!55027 m!1202559))

(declare-fun m!1202561 () Bool)

(assert (=> start!111034 m!1202561))

(declare-fun m!1202563 () Bool)

(assert (=> start!111034 m!1202563))

(declare-fun m!1202565 () Bool)

(assert (=> start!111034 m!1202565))

(declare-fun m!1202567 () Bool)

(assert (=> b!1314539 m!1202567))

(check-sat (not b!1314539) (not b!1314533) (not mapNonEmpty!55027) (not start!111034) (not b_next!29869) tp_is_empty!35599 (not b!1314532) b_and!48059)
(check-sat b_and!48059 (not b_next!29869))
