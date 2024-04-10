; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108834 () Bool)

(assert start!108834)

(declare-fun b_free!28347 () Bool)

(declare-fun b_next!28347 () Bool)

(assert (=> start!108834 (= b_free!28347 (not b_next!28347))))

(declare-fun tp!100156 () Bool)

(declare-fun b_and!46413 () Bool)

(assert (=> start!108834 (= tp!100156 b_and!46413)))

(declare-fun mapIsEmpty!52538 () Bool)

(declare-fun mapRes!52538 () Bool)

(assert (=> mapIsEmpty!52538 mapRes!52538))

(declare-fun mapNonEmpty!52538 () Bool)

(declare-fun tp!100157 () Bool)

(declare-fun e!734165 () Bool)

(assert (=> mapNonEmpty!52538 (= mapRes!52538 (and tp!100157 e!734165))))

(declare-fun mapKey!52538 () (_ BitVec 32))

(declare-datatypes ((V!50419 0))(
  ( (V!50420 (val!17068 Int)) )
))
(declare-datatypes ((ValueCell!16095 0))(
  ( (ValueCellFull!16095 (v!19670 V!50419)) (EmptyCell!16095) )
))
(declare-datatypes ((array!85032 0))(
  ( (array!85033 (arr!41018 (Array (_ BitVec 32) ValueCell!16095)) (size!41568 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85032)

(declare-fun mapValue!52538 () ValueCell!16095)

(declare-fun mapRest!52538 () (Array (_ BitVec 32) ValueCell!16095))

(assert (=> mapNonEmpty!52538 (= (arr!41018 _values!1445) (store mapRest!52538 mapKey!52538 mapValue!52538))))

(declare-fun res!853842 () Bool)

(declare-fun e!734164 () Bool)

(assert (=> start!108834 (=> (not res!853842) (not e!734164))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108834 (= res!853842 (validMask!0 mask!2175))))

(assert (=> start!108834 e!734164))

(declare-fun tp_is_empty!33987 () Bool)

(assert (=> start!108834 tp_is_empty!33987))

(assert (=> start!108834 true))

(declare-fun e!734162 () Bool)

(declare-fun array_inv!31111 (array!85032) Bool)

(assert (=> start!108834 (and (array_inv!31111 _values!1445) e!734162)))

(declare-datatypes ((array!85034 0))(
  ( (array!85035 (arr!41019 (Array (_ BitVec 32) (_ BitVec 64))) (size!41569 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85034)

(declare-fun array_inv!31112 (array!85034) Bool)

(assert (=> start!108834 (array_inv!31112 _keys!1741)))

(assert (=> start!108834 tp!100156))

(declare-fun b!1285295 () Bool)

(assert (=> b!1285295 (= e!734164 false)))

(declare-fun minValue!1387 () V!50419)

(declare-fun zeroValue!1387 () V!50419)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!576898 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21878 0))(
  ( (tuple2!21879 (_1!10950 (_ BitVec 64)) (_2!10950 V!50419)) )
))
(declare-datatypes ((List!29069 0))(
  ( (Nil!29066) (Cons!29065 (h!30274 tuple2!21878) (t!42613 List!29069)) )
))
(declare-datatypes ((ListLongMap!19535 0))(
  ( (ListLongMap!19536 (toList!9783 List!29069)) )
))
(declare-fun contains!7900 (ListLongMap!19535 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4861 (array!85034 array!85032 (_ BitVec 32) (_ BitVec 32) V!50419 V!50419 (_ BitVec 32) Int) ListLongMap!19535)

(assert (=> b!1285295 (= lt!576898 (contains!7900 (getCurrentListMap!4861 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1285296 () Bool)

(declare-fun res!853841 () Bool)

(assert (=> b!1285296 (=> (not res!853841) (not e!734164))))

(declare-datatypes ((List!29070 0))(
  ( (Nil!29067) (Cons!29066 (h!30275 (_ BitVec 64)) (t!42614 List!29070)) )
))
(declare-fun arrayNoDuplicates!0 (array!85034 (_ BitVec 32) List!29070) Bool)

(assert (=> b!1285296 (= res!853841 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29067))))

(declare-fun b!1285297 () Bool)

(declare-fun res!853844 () Bool)

(assert (=> b!1285297 (=> (not res!853844) (not e!734164))))

(assert (=> b!1285297 (= res!853844 (and (= (size!41568 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41569 _keys!1741) (size!41568 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1285298 () Bool)

(declare-fun e!734161 () Bool)

(assert (=> b!1285298 (= e!734161 tp_is_empty!33987)))

(declare-fun b!1285299 () Bool)

(declare-fun res!853845 () Bool)

(assert (=> b!1285299 (=> (not res!853845) (not e!734164))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85034 (_ BitVec 32)) Bool)

(assert (=> b!1285299 (= res!853845 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1285300 () Bool)

(assert (=> b!1285300 (= e!734162 (and e!734161 mapRes!52538))))

(declare-fun condMapEmpty!52538 () Bool)

(declare-fun mapDefault!52538 () ValueCell!16095)

(assert (=> b!1285300 (= condMapEmpty!52538 (= (arr!41018 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16095)) mapDefault!52538)))))

(declare-fun b!1285301 () Bool)

(assert (=> b!1285301 (= e!734165 tp_is_empty!33987)))

(declare-fun b!1285302 () Bool)

(declare-fun res!853843 () Bool)

(assert (=> b!1285302 (=> (not res!853843) (not e!734164))))

(assert (=> b!1285302 (= res!853843 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41569 _keys!1741))))))

(assert (= (and start!108834 res!853842) b!1285297))

(assert (= (and b!1285297 res!853844) b!1285299))

(assert (= (and b!1285299 res!853845) b!1285296))

(assert (= (and b!1285296 res!853841) b!1285302))

(assert (= (and b!1285302 res!853843) b!1285295))

(assert (= (and b!1285300 condMapEmpty!52538) mapIsEmpty!52538))

(assert (= (and b!1285300 (not condMapEmpty!52538)) mapNonEmpty!52538))

(get-info :version)

(assert (= (and mapNonEmpty!52538 ((_ is ValueCellFull!16095) mapValue!52538)) b!1285301))

(assert (= (and b!1285300 ((_ is ValueCellFull!16095) mapDefault!52538)) b!1285298))

(assert (= start!108834 b!1285300))

(declare-fun m!1178701 () Bool)

(assert (=> mapNonEmpty!52538 m!1178701))

(declare-fun m!1178703 () Bool)

(assert (=> b!1285296 m!1178703))

(declare-fun m!1178705 () Bool)

(assert (=> start!108834 m!1178705))

(declare-fun m!1178707 () Bool)

(assert (=> start!108834 m!1178707))

(declare-fun m!1178709 () Bool)

(assert (=> start!108834 m!1178709))

(declare-fun m!1178711 () Bool)

(assert (=> b!1285299 m!1178711))

(declare-fun m!1178713 () Bool)

(assert (=> b!1285295 m!1178713))

(assert (=> b!1285295 m!1178713))

(declare-fun m!1178715 () Bool)

(assert (=> b!1285295 m!1178715))

(check-sat (not b_next!28347) (not b!1285295) (not b!1285296) (not mapNonEmpty!52538) b_and!46413 (not b!1285299) tp_is_empty!33987 (not start!108834))
(check-sat b_and!46413 (not b_next!28347))
