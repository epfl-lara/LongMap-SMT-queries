; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4166 () Bool)

(assert start!4166)

(declare-fun b_free!1075 () Bool)

(declare-fun b_next!1075 () Bool)

(assert (=> start!4166 (= b_free!1075 (not b_next!1075))))

(declare-fun tp!4645 () Bool)

(declare-fun b_and!1875 () Bool)

(assert (=> start!4166 (= tp!4645 b_and!1875)))

(declare-fun b!31425 () Bool)

(declare-fun res!19039 () Bool)

(declare-fun e!20075 () Bool)

(assert (=> b!31425 (=> (not res!19039) (not e!20075))))

(declare-datatypes ((array!2059 0))(
  ( (array!2060 (arr!983 (Array (_ BitVec 32) (_ BitVec 64))) (size!1084 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2059)

(declare-datatypes ((List!800 0))(
  ( (Nil!797) (Cons!796 (h!1363 (_ BitVec 64)) (t!3487 List!800)) )
))
(declare-fun arrayNoDuplicates!0 (array!2059 (_ BitVec 32) List!800) Bool)

(assert (=> b!31425 (= res!19039 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!797))))

(declare-fun b!31426 () Bool)

(assert (=> b!31426 (= e!20075 false)))

(declare-fun lt!11529 () (_ BitVec 32))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!2059 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!31426 (= lt!11529 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!1672 () Bool)

(declare-fun mapRes!1672 () Bool)

(assert (=> mapIsEmpty!1672 mapRes!1672))

(declare-fun b!31427 () Bool)

(declare-fun res!19043 () Bool)

(assert (=> b!31427 (=> (not res!19043) (not e!20075))))

(declare-datatypes ((V!1731 0))(
  ( (V!1732 (val!741 Int)) )
))
(declare-datatypes ((ValueCell!515 0))(
  ( (ValueCellFull!515 (v!1830 V!1731)) (EmptyCell!515) )
))
(declare-datatypes ((array!2061 0))(
  ( (array!2062 (arr!984 (Array (_ BitVec 32) ValueCell!515)) (size!1085 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2061)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!31427 (= res!19043 (and (= (size!1085 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1084 _keys!1833) (size!1085 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!1672 () Bool)

(declare-fun tp!4644 () Bool)

(declare-fun e!20077 () Bool)

(assert (=> mapNonEmpty!1672 (= mapRes!1672 (and tp!4644 e!20077))))

(declare-fun mapRest!1672 () (Array (_ BitVec 32) ValueCell!515))

(declare-fun mapKey!1672 () (_ BitVec 32))

(declare-fun mapValue!1672 () ValueCell!515)

(assert (=> mapNonEmpty!1672 (= (arr!984 _values!1501) (store mapRest!1672 mapKey!1672 mapValue!1672))))

(declare-fun b!31428 () Bool)

(declare-fun res!19037 () Bool)

(assert (=> b!31428 (=> (not res!19037) (not e!20075))))

(declare-fun arrayContainsKey!0 (array!2059 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!31428 (= res!19037 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun res!19041 () Bool)

(assert (=> start!4166 (=> (not res!19041) (not e!20075))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4166 (= res!19041 (validMask!0 mask!2294))))

(assert (=> start!4166 e!20075))

(assert (=> start!4166 true))

(assert (=> start!4166 tp!4645))

(declare-fun e!20076 () Bool)

(declare-fun array_inv!673 (array!2061) Bool)

(assert (=> start!4166 (and (array_inv!673 _values!1501) e!20076)))

(declare-fun array_inv!674 (array!2059) Bool)

(assert (=> start!4166 (array_inv!674 _keys!1833)))

(declare-fun tp_is_empty!1429 () Bool)

(assert (=> start!4166 tp_is_empty!1429))

(declare-fun b!31429 () Bool)

(assert (=> b!31429 (= e!20077 tp_is_empty!1429)))

(declare-fun b!31430 () Bool)

(declare-fun res!19040 () Bool)

(assert (=> b!31430 (=> (not res!19040) (not e!20075))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1731)

(declare-fun minValue!1443 () V!1731)

(declare-datatypes ((tuple2!1206 0))(
  ( (tuple2!1207 (_1!614 (_ BitVec 64)) (_2!614 V!1731)) )
))
(declare-datatypes ((List!801 0))(
  ( (Nil!798) (Cons!797 (h!1364 tuple2!1206) (t!3488 List!801)) )
))
(declare-datatypes ((ListLongMap!777 0))(
  ( (ListLongMap!778 (toList!404 List!801)) )
))
(declare-fun contains!346 (ListLongMap!777 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!229 (array!2059 array!2061 (_ BitVec 32) (_ BitVec 32) V!1731 V!1731 (_ BitVec 32) Int) ListLongMap!777)

(assert (=> b!31430 (= res!19040 (not (contains!346 (getCurrentListMap!229 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!31431 () Bool)

(declare-fun res!19038 () Bool)

(assert (=> b!31431 (=> (not res!19038) (not e!20075))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2059 (_ BitVec 32)) Bool)

(assert (=> b!31431 (= res!19038 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!31432 () Bool)

(declare-fun e!20074 () Bool)

(assert (=> b!31432 (= e!20076 (and e!20074 mapRes!1672))))

(declare-fun condMapEmpty!1672 () Bool)

(declare-fun mapDefault!1672 () ValueCell!515)

(assert (=> b!31432 (= condMapEmpty!1672 (= (arr!984 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!515)) mapDefault!1672)))))

(declare-fun b!31433 () Bool)

(assert (=> b!31433 (= e!20074 tp_is_empty!1429)))

(declare-fun b!31434 () Bool)

(declare-fun res!19042 () Bool)

(assert (=> b!31434 (=> (not res!19042) (not e!20075))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!31434 (= res!19042 (validKeyInArray!0 k0!1304))))

(assert (= (and start!4166 res!19041) b!31427))

(assert (= (and b!31427 res!19043) b!31431))

(assert (= (and b!31431 res!19038) b!31425))

(assert (= (and b!31425 res!19039) b!31434))

(assert (= (and b!31434 res!19042) b!31430))

(assert (= (and b!31430 res!19040) b!31428))

(assert (= (and b!31428 res!19037) b!31426))

(assert (= (and b!31432 condMapEmpty!1672) mapIsEmpty!1672))

(assert (= (and b!31432 (not condMapEmpty!1672)) mapNonEmpty!1672))

(get-info :version)

(assert (= (and mapNonEmpty!1672 ((_ is ValueCellFull!515) mapValue!1672)) b!31429))

(assert (= (and b!31432 ((_ is ValueCellFull!515) mapDefault!1672)) b!31433))

(assert (= start!4166 b!31432))

(declare-fun m!25109 () Bool)

(assert (=> b!31430 m!25109))

(assert (=> b!31430 m!25109))

(declare-fun m!25111 () Bool)

(assert (=> b!31430 m!25111))

(declare-fun m!25113 () Bool)

(assert (=> b!31425 m!25113))

(declare-fun m!25115 () Bool)

(assert (=> start!4166 m!25115))

(declare-fun m!25117 () Bool)

(assert (=> start!4166 m!25117))

(declare-fun m!25119 () Bool)

(assert (=> start!4166 m!25119))

(declare-fun m!25121 () Bool)

(assert (=> b!31428 m!25121))

(declare-fun m!25123 () Bool)

(assert (=> mapNonEmpty!1672 m!25123))

(declare-fun m!25125 () Bool)

(assert (=> b!31426 m!25125))

(declare-fun m!25127 () Bool)

(assert (=> b!31431 m!25127))

(declare-fun m!25129 () Bool)

(assert (=> b!31434 m!25129))

(check-sat tp_is_empty!1429 (not b_next!1075) (not b!31428) (not b!31431) (not b!31434) (not start!4166) (not mapNonEmpty!1672) (not b!31426) b_and!1875 (not b!31430) (not b!31425))
(check-sat b_and!1875 (not b_next!1075))
