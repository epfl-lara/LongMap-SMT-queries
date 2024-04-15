; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108408 () Bool)

(assert start!108408)

(declare-fun b_free!27955 () Bool)

(declare-fun b_next!27955 () Bool)

(assert (=> start!108408 (= b_free!27955 (not b_next!27955))))

(declare-fun tp!98976 () Bool)

(declare-fun b_and!45997 () Bool)

(assert (=> start!108408 (= tp!98976 b_and!45997)))

(declare-fun b!1279400 () Bool)

(declare-fun res!849899 () Bool)

(declare-fun e!730998 () Bool)

(assert (=> b!1279400 (=> (not res!849899) (not e!730998))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!49897 0))(
  ( (V!49898 (val!16872 Int)) )
))
(declare-datatypes ((ValueCell!15899 0))(
  ( (ValueCellFull!15899 (v!19471 V!49897)) (EmptyCell!15899) )
))
(declare-datatypes ((array!84167 0))(
  ( (array!84168 (arr!40588 (Array (_ BitVec 32) ValueCell!15899)) (size!41140 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84167)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84169 0))(
  ( (array!84170 (arr!40589 (Array (_ BitVec 32) (_ BitVec 64))) (size!41141 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84169)

(assert (=> b!1279400 (= res!849899 (and (= (size!41140 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41141 _keys!1741) (size!41140 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1279401 () Bool)

(assert (=> b!1279401 (= e!730998 false)))

(declare-fun minValue!1387 () V!49897)

(declare-fun zeroValue!1387 () V!49897)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!575836 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21666 0))(
  ( (tuple2!21667 (_1!10844 (_ BitVec 64)) (_2!10844 V!49897)) )
))
(declare-datatypes ((List!28856 0))(
  ( (Nil!28853) (Cons!28852 (h!30061 tuple2!21666) (t!42388 List!28856)) )
))
(declare-datatypes ((ListLongMap!19323 0))(
  ( (ListLongMap!19324 (toList!9677 List!28856)) )
))
(declare-fun contains!7722 (ListLongMap!19323 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4651 (array!84169 array!84167 (_ BitVec 32) (_ BitVec 32) V!49897 V!49897 (_ BitVec 32) Int) ListLongMap!19323)

(assert (=> b!1279401 (= lt!575836 (contains!7722 (getCurrentListMap!4651 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!849897 () Bool)

(assert (=> start!108408 (=> (not res!849897) (not e!730998))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108408 (= res!849897 (validMask!0 mask!2175))))

(assert (=> start!108408 e!730998))

(declare-fun tp_is_empty!33595 () Bool)

(assert (=> start!108408 tp_is_empty!33595))

(assert (=> start!108408 true))

(declare-fun e!731000 () Bool)

(declare-fun array_inv!30977 (array!84167) Bool)

(assert (=> start!108408 (and (array_inv!30977 _values!1445) e!731000)))

(declare-fun array_inv!30978 (array!84169) Bool)

(assert (=> start!108408 (array_inv!30978 _keys!1741)))

(assert (=> start!108408 tp!98976))

(declare-fun mapIsEmpty!51944 () Bool)

(declare-fun mapRes!51944 () Bool)

(assert (=> mapIsEmpty!51944 mapRes!51944))

(declare-fun b!1279402 () Bool)

(declare-fun e!730997 () Bool)

(assert (=> b!1279402 (= e!731000 (and e!730997 mapRes!51944))))

(declare-fun condMapEmpty!51944 () Bool)

(declare-fun mapDefault!51944 () ValueCell!15899)

(assert (=> b!1279402 (= condMapEmpty!51944 (= (arr!40588 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15899)) mapDefault!51944)))))

(declare-fun b!1279403 () Bool)

(assert (=> b!1279403 (= e!730997 tp_is_empty!33595)))

(declare-fun b!1279404 () Bool)

(declare-fun res!849895 () Bool)

(assert (=> b!1279404 (=> (not res!849895) (not e!730998))))

(assert (=> b!1279404 (= res!849895 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41141 _keys!1741))))))

(declare-fun mapNonEmpty!51944 () Bool)

(declare-fun tp!98975 () Bool)

(declare-fun e!730999 () Bool)

(assert (=> mapNonEmpty!51944 (= mapRes!51944 (and tp!98975 e!730999))))

(declare-fun mapKey!51944 () (_ BitVec 32))

(declare-fun mapRest!51944 () (Array (_ BitVec 32) ValueCell!15899))

(declare-fun mapValue!51944 () ValueCell!15899)

(assert (=> mapNonEmpty!51944 (= (arr!40588 _values!1445) (store mapRest!51944 mapKey!51944 mapValue!51944))))

(declare-fun b!1279405 () Bool)

(declare-fun res!849896 () Bool)

(assert (=> b!1279405 (=> (not res!849896) (not e!730998))))

(declare-datatypes ((List!28857 0))(
  ( (Nil!28854) (Cons!28853 (h!30062 (_ BitVec 64)) (t!42389 List!28857)) )
))
(declare-fun arrayNoDuplicates!0 (array!84169 (_ BitVec 32) List!28857) Bool)

(assert (=> b!1279405 (= res!849896 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28854))))

(declare-fun b!1279406 () Bool)

(declare-fun res!849898 () Bool)

(assert (=> b!1279406 (=> (not res!849898) (not e!730998))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84169 (_ BitVec 32)) Bool)

(assert (=> b!1279406 (= res!849898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1279407 () Bool)

(assert (=> b!1279407 (= e!730999 tp_is_empty!33595)))

(assert (= (and start!108408 res!849897) b!1279400))

(assert (= (and b!1279400 res!849899) b!1279406))

(assert (= (and b!1279406 res!849898) b!1279405))

(assert (= (and b!1279405 res!849896) b!1279404))

(assert (= (and b!1279404 res!849895) b!1279401))

(assert (= (and b!1279402 condMapEmpty!51944) mapIsEmpty!51944))

(assert (= (and b!1279402 (not condMapEmpty!51944)) mapNonEmpty!51944))

(get-info :version)

(assert (= (and mapNonEmpty!51944 ((_ is ValueCellFull!15899) mapValue!51944)) b!1279407))

(assert (= (and b!1279402 ((_ is ValueCellFull!15899) mapDefault!51944)) b!1279403))

(assert (= start!108408 b!1279402))

(declare-fun m!1173921 () Bool)

(assert (=> mapNonEmpty!51944 m!1173921))

(declare-fun m!1173923 () Bool)

(assert (=> b!1279405 m!1173923))

(declare-fun m!1173925 () Bool)

(assert (=> b!1279401 m!1173925))

(assert (=> b!1279401 m!1173925))

(declare-fun m!1173927 () Bool)

(assert (=> b!1279401 m!1173927))

(declare-fun m!1173929 () Bool)

(assert (=> start!108408 m!1173929))

(declare-fun m!1173931 () Bool)

(assert (=> start!108408 m!1173931))

(declare-fun m!1173933 () Bool)

(assert (=> start!108408 m!1173933))

(declare-fun m!1173935 () Bool)

(assert (=> b!1279406 m!1173935))

(check-sat (not mapNonEmpty!51944) b_and!45997 (not b!1279406) (not b!1279405) (not b!1279401) (not b_next!27955) (not start!108408) tp_is_empty!33595)
(check-sat b_and!45997 (not b_next!27955))
