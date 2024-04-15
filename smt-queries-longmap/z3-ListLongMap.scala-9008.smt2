; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108808 () Bool)

(assert start!108808)

(declare-fun b_free!28321 () Bool)

(declare-fun b_next!28321 () Bool)

(assert (=> start!108808 (= b_free!28321 (not b_next!28321))))

(declare-fun tp!100080 () Bool)

(declare-fun b_and!46369 () Bool)

(assert (=> start!108808 (= tp!100080 b_and!46369)))

(declare-fun b!1284855 () Bool)

(declare-fun e!733941 () Bool)

(declare-fun e!733939 () Bool)

(declare-fun mapRes!52499 () Bool)

(assert (=> b!1284855 (= e!733941 (and e!733939 mapRes!52499))))

(declare-fun condMapEmpty!52499 () Bool)

(declare-datatypes ((V!50385 0))(
  ( (V!50386 (val!17055 Int)) )
))
(declare-datatypes ((ValueCell!16082 0))(
  ( (ValueCellFull!16082 (v!19656 V!50385)) (EmptyCell!16082) )
))
(declare-datatypes ((array!84871 0))(
  ( (array!84872 (arr!40938 (Array (_ BitVec 32) ValueCell!16082)) (size!41490 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84871)

(declare-fun mapDefault!52499 () ValueCell!16082)

(assert (=> b!1284855 (= condMapEmpty!52499 (= (arr!40938 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16082)) mapDefault!52499)))))

(declare-fun b!1284857 () Bool)

(declare-fun res!853556 () Bool)

(declare-fun e!733940 () Bool)

(assert (=> b!1284857 (=> (not res!853556) (not e!733940))))

(declare-datatypes ((array!84873 0))(
  ( (array!84874 (arr!40939 (Array (_ BitVec 32) (_ BitVec 64))) (size!41491 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84873)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1284857 (= res!853556 (validKeyInArray!0 (select (arr!40939 _keys!1741) from!2144)))))

(declare-fun mapNonEmpty!52499 () Bool)

(declare-fun tp!100079 () Bool)

(declare-fun e!733937 () Bool)

(assert (=> mapNonEmpty!52499 (= mapRes!52499 (and tp!100079 e!733937))))

(declare-fun mapValue!52499 () ValueCell!16082)

(declare-fun mapRest!52499 () (Array (_ BitVec 32) ValueCell!16082))

(declare-fun mapKey!52499 () (_ BitVec 32))

(assert (=> mapNonEmpty!52499 (= (arr!40938 _values!1445) (store mapRest!52499 mapKey!52499 mapValue!52499))))

(declare-fun mapIsEmpty!52499 () Bool)

(assert (=> mapIsEmpty!52499 mapRes!52499))

(declare-fun b!1284858 () Bool)

(declare-fun res!853563 () Bool)

(assert (=> b!1284858 (=> (not res!853563) (not e!733940))))

(declare-datatypes ((List!29107 0))(
  ( (Nil!29104) (Cons!29103 (h!30312 (_ BitVec 64)) (t!42643 List!29107)) )
))
(declare-fun arrayNoDuplicates!0 (array!84873 (_ BitVec 32) List!29107) Bool)

(assert (=> b!1284858 (= res!853563 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29104))))

(declare-fun b!1284859 () Bool)

(declare-fun res!853560 () Bool)

(assert (=> b!1284859 (=> (not res!853560) (not e!733940))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1284859 (= res!853560 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41491 _keys!1741))))))

(declare-fun b!1284860 () Bool)

(assert (=> b!1284860 (= e!733940 false)))

(declare-fun minValue!1387 () V!50385)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun zeroValue!1387 () V!50385)

(declare-fun lt!576681 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21928 0))(
  ( (tuple2!21929 (_1!10975 (_ BitVec 64)) (_2!10975 V!50385)) )
))
(declare-datatypes ((List!29108 0))(
  ( (Nil!29105) (Cons!29104 (h!30313 tuple2!21928) (t!42644 List!29108)) )
))
(declare-datatypes ((ListLongMap!19585 0))(
  ( (ListLongMap!19586 (toList!9808 List!29108)) )
))
(declare-fun contains!7855 (ListLongMap!19585 (_ BitVec 64)) Bool)

(declare-fun +!4342 (ListLongMap!19585 tuple2!21928) ListLongMap!19585)

(declare-fun getCurrentListMapNoExtraKeys!5973 (array!84873 array!84871 (_ BitVec 32) (_ BitVec 32) V!50385 V!50385 (_ BitVec 32) Int) ListLongMap!19585)

(assert (=> b!1284860 (= lt!576681 (contains!7855 (+!4342 (getCurrentListMapNoExtraKeys!5973 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21929 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun b!1284861 () Bool)

(declare-fun res!853558 () Bool)

(assert (=> b!1284861 (=> (not res!853558) (not e!733940))))

(declare-fun getCurrentListMap!4778 (array!84873 array!84871 (_ BitVec 32) (_ BitVec 32) V!50385 V!50385 (_ BitVec 32) Int) ListLongMap!19585)

(assert (=> b!1284861 (= res!853558 (contains!7855 (getCurrentListMap!4778 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1284862 () Bool)

(declare-fun res!853559 () Bool)

(assert (=> b!1284862 (=> (not res!853559) (not e!733940))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84873 (_ BitVec 32)) Bool)

(assert (=> b!1284862 (= res!853559 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1284863 () Bool)

(declare-fun res!853562 () Bool)

(assert (=> b!1284863 (=> (not res!853562) (not e!733940))))

(assert (=> b!1284863 (= res!853562 (and (= (size!41490 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41491 _keys!1741) (size!41490 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1284864 () Bool)

(declare-fun res!853555 () Bool)

(assert (=> b!1284864 (=> (not res!853555) (not e!733940))))

(assert (=> b!1284864 (= res!853555 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41491 _keys!1741))))))

(declare-fun b!1284856 () Bool)

(declare-fun tp_is_empty!33961 () Bool)

(assert (=> b!1284856 (= e!733937 tp_is_empty!33961)))

(declare-fun res!853561 () Bool)

(assert (=> start!108808 (=> (not res!853561) (not e!733940))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108808 (= res!853561 (validMask!0 mask!2175))))

(assert (=> start!108808 e!733940))

(assert (=> start!108808 tp_is_empty!33961))

(assert (=> start!108808 true))

(declare-fun array_inv!31213 (array!84871) Bool)

(assert (=> start!108808 (and (array_inv!31213 _values!1445) e!733941)))

(declare-fun array_inv!31214 (array!84873) Bool)

(assert (=> start!108808 (array_inv!31214 _keys!1741)))

(assert (=> start!108808 tp!100080))

(declare-fun b!1284865 () Bool)

(declare-fun res!853557 () Bool)

(assert (=> b!1284865 (=> (not res!853557) (not e!733940))))

(assert (=> b!1284865 (= res!853557 (and (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!1284866 () Bool)

(assert (=> b!1284866 (= e!733939 tp_is_empty!33961)))

(assert (= (and start!108808 res!853561) b!1284863))

(assert (= (and b!1284863 res!853562) b!1284862))

(assert (= (and b!1284862 res!853559) b!1284858))

(assert (= (and b!1284858 res!853563) b!1284864))

(assert (= (and b!1284864 res!853555) b!1284861))

(assert (= (and b!1284861 res!853558) b!1284859))

(assert (= (and b!1284859 res!853560) b!1284857))

(assert (= (and b!1284857 res!853556) b!1284865))

(assert (= (and b!1284865 res!853557) b!1284860))

(assert (= (and b!1284855 condMapEmpty!52499) mapIsEmpty!52499))

(assert (= (and b!1284855 (not condMapEmpty!52499)) mapNonEmpty!52499))

(get-info :version)

(assert (= (and mapNonEmpty!52499 ((_ is ValueCellFull!16082) mapValue!52499)) b!1284856))

(assert (= (and b!1284855 ((_ is ValueCellFull!16082) mapDefault!52499)) b!1284866))

(assert (= start!108808 b!1284855))

(declare-fun m!1177933 () Bool)

(assert (=> start!108808 m!1177933))

(declare-fun m!1177935 () Bool)

(assert (=> start!108808 m!1177935))

(declare-fun m!1177937 () Bool)

(assert (=> start!108808 m!1177937))

(declare-fun m!1177939 () Bool)

(assert (=> b!1284862 m!1177939))

(declare-fun m!1177941 () Bool)

(assert (=> b!1284857 m!1177941))

(assert (=> b!1284857 m!1177941))

(declare-fun m!1177943 () Bool)

(assert (=> b!1284857 m!1177943))

(declare-fun m!1177945 () Bool)

(assert (=> mapNonEmpty!52499 m!1177945))

(declare-fun m!1177947 () Bool)

(assert (=> b!1284860 m!1177947))

(assert (=> b!1284860 m!1177947))

(declare-fun m!1177949 () Bool)

(assert (=> b!1284860 m!1177949))

(assert (=> b!1284860 m!1177949))

(declare-fun m!1177951 () Bool)

(assert (=> b!1284860 m!1177951))

(declare-fun m!1177953 () Bool)

(assert (=> b!1284861 m!1177953))

(assert (=> b!1284861 m!1177953))

(declare-fun m!1177955 () Bool)

(assert (=> b!1284861 m!1177955))

(declare-fun m!1177957 () Bool)

(assert (=> b!1284858 m!1177957))

(check-sat (not b_next!28321) (not start!108808) (not b!1284862) b_and!46369 (not b!1284857) (not b!1284860) (not mapNonEmpty!52499) (not b!1284861) tp_is_empty!33961 (not b!1284858))
(check-sat b_and!46369 (not b_next!28321))
