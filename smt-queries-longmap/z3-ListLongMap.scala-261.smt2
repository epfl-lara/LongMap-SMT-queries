; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4290 () Bool)

(assert start!4290)

(declare-fun b_free!1155 () Bool)

(declare-fun b_next!1155 () Bool)

(assert (=> start!4290 (= b_free!1155 (not b_next!1155))))

(declare-fun tp!4890 () Bool)

(declare-fun b_and!1969 () Bool)

(assert (=> start!4290 (= tp!4890 b_and!1969)))

(declare-fun b!32948 () Bool)

(declare-fun res!20031 () Bool)

(declare-fun e!20932 () Bool)

(assert (=> b!32948 (=> (not res!20031) (not e!20932))))

(declare-datatypes ((array!2231 0))(
  ( (array!2232 (arr!1067 (Array (_ BitVec 32) (_ BitVec 64))) (size!1168 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2231)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!2231 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!32948 (= res!20031 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!1798 () Bool)

(declare-fun mapRes!1798 () Bool)

(assert (=> mapIsEmpty!1798 mapRes!1798))

(declare-fun b!32949 () Bool)

(declare-fun res!20030 () Bool)

(declare-fun e!20930 () Bool)

(assert (=> b!32949 (=> (not res!20030) (not e!20930))))

(declare-datatypes ((List!864 0))(
  ( (Nil!861) (Cons!860 (h!1427 (_ BitVec 64)) (t!3561 List!864)) )
))
(declare-fun arrayNoDuplicates!0 (array!2231 (_ BitVec 32) List!864) Bool)

(assert (=> b!32949 (= res!20030 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!861))))

(declare-fun b!32950 () Bool)

(assert (=> b!32950 (= e!20930 e!20932)))

(declare-fun res!20032 () Bool)

(assert (=> b!32950 (=> (not res!20032) (not e!20932))))

(declare-datatypes ((V!1837 0))(
  ( (V!1838 (val!781 Int)) )
))
(declare-datatypes ((tuple2!1272 0))(
  ( (tuple2!1273 (_1!647 (_ BitVec 64)) (_2!647 V!1837)) )
))
(declare-datatypes ((List!865 0))(
  ( (Nil!862) (Cons!861 (h!1428 tuple2!1272) (t!3562 List!865)) )
))
(declare-datatypes ((ListLongMap!849 0))(
  ( (ListLongMap!850 (toList!440 List!865)) )
))
(declare-fun lt!11939 () ListLongMap!849)

(declare-fun contains!382 (ListLongMap!849 (_ BitVec 64)) Bool)

(assert (=> b!32950 (= res!20032 (not (contains!382 lt!11939 k0!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((ValueCell!555 0))(
  ( (ValueCellFull!555 (v!1872 V!1837)) (EmptyCell!555) )
))
(declare-datatypes ((array!2233 0))(
  ( (array!2234 (arr!1068 (Array (_ BitVec 32) ValueCell!555)) (size!1169 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2233)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1837)

(declare-fun minValue!1443 () V!1837)

(declare-fun getCurrentListMap!268 (array!2231 array!2233 (_ BitVec 32) (_ BitVec 32) V!1837 V!1837 (_ BitVec 32) Int) ListLongMap!849)

(assert (=> b!32950 (= lt!11939 (getCurrentListMap!268 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!32951 () Bool)

(declare-fun res!20033 () Bool)

(assert (=> b!32951 (=> (not res!20033) (not e!20930))))

(assert (=> b!32951 (= res!20033 (and (= (size!1169 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1168 _keys!1833) (size!1169 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!32952 () Bool)

(declare-fun res!20034 () Bool)

(assert (=> b!32952 (=> (not res!20034) (not e!20930))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2231 (_ BitVec 32)) Bool)

(assert (=> b!32952 (= res!20034 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!32953 () Bool)

(declare-fun e!20928 () Bool)

(declare-fun tp_is_empty!1509 () Bool)

(assert (=> b!32953 (= e!20928 tp_is_empty!1509)))

(declare-fun res!20028 () Bool)

(assert (=> start!4290 (=> (not res!20028) (not e!20930))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4290 (= res!20028 (validMask!0 mask!2294))))

(assert (=> start!4290 e!20930))

(assert (=> start!4290 true))

(assert (=> start!4290 tp!4890))

(declare-fun e!20931 () Bool)

(declare-fun array_inv!749 (array!2233) Bool)

(assert (=> start!4290 (and (array_inv!749 _values!1501) e!20931)))

(declare-fun array_inv!750 (array!2231) Bool)

(assert (=> start!4290 (array_inv!750 _keys!1833)))

(assert (=> start!4290 tp_is_empty!1509))

(declare-fun b!32954 () Bool)

(declare-fun e!20929 () Bool)

(assert (=> b!32954 (= e!20929 tp_is_empty!1509)))

(declare-fun mapNonEmpty!1798 () Bool)

(declare-fun tp!4891 () Bool)

(assert (=> mapNonEmpty!1798 (= mapRes!1798 (and tp!4891 e!20929))))

(declare-fun mapRest!1798 () (Array (_ BitVec 32) ValueCell!555))

(declare-fun mapValue!1798 () ValueCell!555)

(declare-fun mapKey!1798 () (_ BitVec 32))

(assert (=> mapNonEmpty!1798 (= (arr!1068 _values!1501) (store mapRest!1798 mapKey!1798 mapValue!1798))))

(declare-fun b!32955 () Bool)

(assert (=> b!32955 (= e!20931 (and e!20928 mapRes!1798))))

(declare-fun condMapEmpty!1798 () Bool)

(declare-fun mapDefault!1798 () ValueCell!555)

(assert (=> b!32955 (= condMapEmpty!1798 (= (arr!1068 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!555)) mapDefault!1798)))))

(declare-fun b!32956 () Bool)

(assert (=> b!32956 (= e!20932 (not true))))

(declare-fun lt!11938 () (_ BitVec 32))

(assert (=> b!32956 (contains!382 lt!11939 (select (arr!1067 _keys!1833) lt!11938))))

(declare-datatypes ((Unit!727 0))(
  ( (Unit!728) )
))
(declare-fun lt!11937 () Unit!727)

(declare-fun lemmaValidKeyInArrayIsInListMap!53 (array!2231 array!2233 (_ BitVec 32) (_ BitVec 32) V!1837 V!1837 (_ BitVec 32) Int) Unit!727)

(assert (=> b!32956 (= lt!11937 (lemmaValidKeyInArrayIsInListMap!53 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11938 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!2231 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!32956 (= lt!11938 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!32957 () Bool)

(declare-fun res!20029 () Bool)

(assert (=> b!32957 (=> (not res!20029) (not e!20930))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!32957 (= res!20029 (validKeyInArray!0 k0!1304))))

(assert (= (and start!4290 res!20028) b!32951))

(assert (= (and b!32951 res!20033) b!32952))

(assert (= (and b!32952 res!20034) b!32949))

(assert (= (and b!32949 res!20030) b!32957))

(assert (= (and b!32957 res!20029) b!32950))

(assert (= (and b!32950 res!20032) b!32948))

(assert (= (and b!32948 res!20031) b!32956))

(assert (= (and b!32955 condMapEmpty!1798) mapIsEmpty!1798))

(assert (= (and b!32955 (not condMapEmpty!1798)) mapNonEmpty!1798))

(get-info :version)

(assert (= (and mapNonEmpty!1798 ((_ is ValueCellFull!555) mapValue!1798)) b!32954))

(assert (= (and b!32955 ((_ is ValueCellFull!555) mapDefault!1798)) b!32953))

(assert (= start!4290 b!32955))

(declare-fun m!26385 () Bool)

(assert (=> b!32956 m!26385))

(assert (=> b!32956 m!26385))

(declare-fun m!26387 () Bool)

(assert (=> b!32956 m!26387))

(declare-fun m!26389 () Bool)

(assert (=> b!32956 m!26389))

(declare-fun m!26391 () Bool)

(assert (=> b!32956 m!26391))

(declare-fun m!26393 () Bool)

(assert (=> b!32952 m!26393))

(declare-fun m!26395 () Bool)

(assert (=> b!32948 m!26395))

(declare-fun m!26397 () Bool)

(assert (=> start!4290 m!26397))

(declare-fun m!26399 () Bool)

(assert (=> start!4290 m!26399))

(declare-fun m!26401 () Bool)

(assert (=> start!4290 m!26401))

(declare-fun m!26403 () Bool)

(assert (=> mapNonEmpty!1798 m!26403))

(declare-fun m!26405 () Bool)

(assert (=> b!32949 m!26405))

(declare-fun m!26407 () Bool)

(assert (=> b!32957 m!26407))

(declare-fun m!26409 () Bool)

(assert (=> b!32950 m!26409))

(declare-fun m!26411 () Bool)

(assert (=> b!32950 m!26411))

(check-sat tp_is_empty!1509 (not b!32952) (not mapNonEmpty!1798) (not b!32956) (not b!32957) (not b_next!1155) (not b!32950) (not b!32949) (not b!32948) (not start!4290) b_and!1969)
(check-sat b_and!1969 (not b_next!1155))
