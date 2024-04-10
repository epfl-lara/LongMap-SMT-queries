; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81880 () Bool)

(assert start!81880)

(declare-fun b_free!18375 () Bool)

(declare-fun b_next!18375 () Bool)

(assert (=> start!81880 (= b_free!18375 (not b_next!18375))))

(declare-fun tp!63824 () Bool)

(declare-fun b_and!29861 () Bool)

(assert (=> start!81880 (= tp!63824 b_and!29861)))

(declare-fun b!954940 () Bool)

(declare-fun e!538001 () Bool)

(declare-fun tp_is_empty!20919 () Bool)

(assert (=> b!954940 (= e!538001 tp_is_empty!20919)))

(declare-fun mapNonEmpty!33340 () Bool)

(declare-fun mapRes!33340 () Bool)

(declare-fun tp!63825 () Bool)

(assert (=> mapNonEmpty!33340 (= mapRes!33340 (and tp!63825 e!538001))))

(declare-datatypes ((V!32875 0))(
  ( (V!32876 (val!10510 Int)) )
))
(declare-datatypes ((ValueCell!9978 0))(
  ( (ValueCellFull!9978 (v!13065 V!32875)) (EmptyCell!9978) )
))
(declare-fun mapValue!33340 () ValueCell!9978)

(declare-datatypes ((array!57945 0))(
  ( (array!57946 (arr!27852 (Array (_ BitVec 32) ValueCell!9978)) (size!28331 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57945)

(declare-fun mapKey!33340 () (_ BitVec 32))

(declare-fun mapRest!33340 () (Array (_ BitVec 32) ValueCell!9978))

(assert (=> mapNonEmpty!33340 (= (arr!27852 _values!1197) (store mapRest!33340 mapKey!33340 mapValue!33340))))

(declare-fun b!954941 () Bool)

(declare-fun res!639470 () Bool)

(declare-fun e!538003 () Bool)

(assert (=> b!954941 (=> (not res!639470) (not e!538003))))

(declare-datatypes ((array!57947 0))(
  ( (array!57948 (arr!27853 (Array (_ BitVec 32) (_ BitVec 64))) (size!28332 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57947)

(declare-datatypes ((List!19412 0))(
  ( (Nil!19409) (Cons!19408 (h!20570 (_ BitVec 64)) (t!27773 List!19412)) )
))
(declare-fun arrayNoDuplicates!0 (array!57947 (_ BitVec 32) List!19412) Bool)

(assert (=> b!954941 (= res!639470 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19409))))

(declare-fun res!639469 () Bool)

(assert (=> start!81880 (=> (not res!639469) (not e!538003))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81880 (= res!639469 (validMask!0 mask!1823))))

(assert (=> start!81880 e!538003))

(assert (=> start!81880 true))

(assert (=> start!81880 tp_is_empty!20919))

(declare-fun array_inv!21619 (array!57947) Bool)

(assert (=> start!81880 (array_inv!21619 _keys!1441)))

(declare-fun e!538002 () Bool)

(declare-fun array_inv!21620 (array!57945) Bool)

(assert (=> start!81880 (and (array_inv!21620 _values!1197) e!538002)))

(assert (=> start!81880 tp!63824))

(declare-fun b!954942 () Bool)

(declare-fun e!537999 () Bool)

(assert (=> b!954942 (= e!537999 tp_is_empty!20919)))

(declare-fun b!954943 () Bool)

(declare-fun res!639471 () Bool)

(assert (=> b!954943 (=> (not res!639471) (not e!538003))))

(declare-fun i!735 () (_ BitVec 32))

(assert (=> b!954943 (= res!639471 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28332 _keys!1441))))))

(declare-fun b!954944 () Bool)

(assert (=> b!954944 (= e!538003 false)))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-fun lt!429956 () Bool)

(declare-fun zeroValue!1139 () V!32875)

(declare-fun minValue!1139 () V!32875)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13636 0))(
  ( (tuple2!13637 (_1!6829 (_ BitVec 64)) (_2!6829 V!32875)) )
))
(declare-datatypes ((List!19413 0))(
  ( (Nil!19410) (Cons!19409 (h!20571 tuple2!13636) (t!27774 List!19413)) )
))
(declare-datatypes ((ListLongMap!12333 0))(
  ( (ListLongMap!12334 (toList!6182 List!19413)) )
))
(declare-fun contains!5280 (ListLongMap!12333 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3415 (array!57947 array!57945 (_ BitVec 32) (_ BitVec 32) V!32875 V!32875 (_ BitVec 32) Int) ListLongMap!12333)

(assert (=> b!954944 (= lt!429956 (contains!5280 (getCurrentListMap!3415 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27853 _keys!1441) i!735)))))

(declare-fun b!954945 () Bool)

(declare-fun res!639472 () Bool)

(assert (=> b!954945 (=> (not res!639472) (not e!538003))))

(assert (=> b!954945 (= res!639472 (and (= (size!28331 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28332 _keys!1441) (size!28331 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!33340 () Bool)

(assert (=> mapIsEmpty!33340 mapRes!33340))

(declare-fun b!954946 () Bool)

(declare-fun res!639473 () Bool)

(assert (=> b!954946 (=> (not res!639473) (not e!538003))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57947 (_ BitVec 32)) Bool)

(assert (=> b!954946 (= res!639473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!954947 () Bool)

(assert (=> b!954947 (= e!538002 (and e!537999 mapRes!33340))))

(declare-fun condMapEmpty!33340 () Bool)

(declare-fun mapDefault!33340 () ValueCell!9978)

(assert (=> b!954947 (= condMapEmpty!33340 (= (arr!27852 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9978)) mapDefault!33340)))))

(declare-fun b!954948 () Bool)

(declare-fun res!639474 () Bool)

(assert (=> b!954948 (=> (not res!639474) (not e!538003))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!954948 (= res!639474 (validKeyInArray!0 (select (arr!27853 _keys!1441) i!735)))))

(assert (= (and start!81880 res!639469) b!954945))

(assert (= (and b!954945 res!639472) b!954946))

(assert (= (and b!954946 res!639473) b!954941))

(assert (= (and b!954941 res!639470) b!954943))

(assert (= (and b!954943 res!639471) b!954948))

(assert (= (and b!954948 res!639474) b!954944))

(assert (= (and b!954947 condMapEmpty!33340) mapIsEmpty!33340))

(assert (= (and b!954947 (not condMapEmpty!33340)) mapNonEmpty!33340))

(get-info :version)

(assert (= (and mapNonEmpty!33340 ((_ is ValueCellFull!9978) mapValue!33340)) b!954940))

(assert (= (and b!954947 ((_ is ValueCellFull!9978) mapDefault!33340)) b!954942))

(assert (= start!81880 b!954947))

(declare-fun m!886543 () Bool)

(assert (=> mapNonEmpty!33340 m!886543))

(declare-fun m!886545 () Bool)

(assert (=> b!954946 m!886545))

(declare-fun m!886547 () Bool)

(assert (=> b!954941 m!886547))

(declare-fun m!886549 () Bool)

(assert (=> start!81880 m!886549))

(declare-fun m!886551 () Bool)

(assert (=> start!81880 m!886551))

(declare-fun m!886553 () Bool)

(assert (=> start!81880 m!886553))

(declare-fun m!886555 () Bool)

(assert (=> b!954948 m!886555))

(assert (=> b!954948 m!886555))

(declare-fun m!886557 () Bool)

(assert (=> b!954948 m!886557))

(declare-fun m!886559 () Bool)

(assert (=> b!954944 m!886559))

(assert (=> b!954944 m!886555))

(assert (=> b!954944 m!886559))

(assert (=> b!954944 m!886555))

(declare-fun m!886561 () Bool)

(assert (=> b!954944 m!886561))

(check-sat (not b!954948) (not b!954944) tp_is_empty!20919 (not b_next!18375) b_and!29861 (not b!954941) (not start!81880) (not mapNonEmpty!33340) (not b!954946))
(check-sat b_and!29861 (not b_next!18375))
