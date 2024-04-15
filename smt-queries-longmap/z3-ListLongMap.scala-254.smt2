; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4196 () Bool)

(assert start!4196)

(declare-fun b_free!1111 () Bool)

(declare-fun b_next!1111 () Bool)

(assert (=> start!4196 (= b_free!1111 (not b_next!1111))))

(declare-fun tp!4753 () Bool)

(declare-fun b_and!1915 () Bool)

(assert (=> start!4196 (= tp!4753 b_and!1915)))

(declare-fun b!31983 () Bool)

(declare-fun e!20356 () Bool)

(assert (=> b!31983 (= e!20356 false)))

(declare-fun lt!11623 () (_ BitVec 32))

(declare-datatypes ((array!2117 0))(
  ( (array!2118 (arr!1012 (Array (_ BitVec 32) (_ BitVec 64))) (size!1113 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2117)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!2117 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!31983 (= lt!11623 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!31984 () Bool)

(declare-fun res!19427 () Bool)

(assert (=> b!31984 (=> (not res!19427) (not e!20356))))

(declare-datatypes ((V!1779 0))(
  ( (V!1780 (val!759 Int)) )
))
(declare-datatypes ((ValueCell!533 0))(
  ( (ValueCellFull!533 (v!1847 V!1779)) (EmptyCell!533) )
))
(declare-datatypes ((array!2119 0))(
  ( (array!2120 (arr!1013 (Array (_ BitVec 32) ValueCell!533)) (size!1114 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2119)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!31984 (= res!19427 (and (= (size!1114 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1113 _keys!1833) (size!1114 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!31985 () Bool)

(declare-fun res!19429 () Bool)

(assert (=> b!31985 (=> (not res!19429) (not e!20356))))

(declare-datatypes ((List!821 0))(
  ( (Nil!818) (Cons!817 (h!1384 (_ BitVec 64)) (t!3507 List!821)) )
))
(declare-fun arrayNoDuplicates!0 (array!2117 (_ BitVec 32) List!821) Bool)

(assert (=> b!31985 (= res!19429 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!818))))

(declare-fun b!31986 () Bool)

(declare-fun res!19423 () Bool)

(assert (=> b!31986 (=> (not res!19423) (not e!20356))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!31986 (= res!19423 (validKeyInArray!0 k0!1304))))

(declare-fun b!31987 () Bool)

(declare-fun e!20352 () Bool)

(declare-fun e!20354 () Bool)

(declare-fun mapRes!1726 () Bool)

(assert (=> b!31987 (= e!20352 (and e!20354 mapRes!1726))))

(declare-fun condMapEmpty!1726 () Bool)

(declare-fun mapDefault!1726 () ValueCell!533)

(assert (=> b!31987 (= condMapEmpty!1726 (= (arr!1013 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!533)) mapDefault!1726)))))

(declare-fun b!31988 () Bool)

(declare-fun res!19426 () Bool)

(assert (=> b!31988 (=> (not res!19426) (not e!20356))))

(declare-fun arrayContainsKey!0 (array!2117 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!31988 (= res!19426 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!31989 () Bool)

(declare-fun res!19424 () Bool)

(assert (=> b!31989 (=> (not res!19424) (not e!20356))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1779)

(declare-fun minValue!1443 () V!1779)

(declare-datatypes ((tuple2!1238 0))(
  ( (tuple2!1239 (_1!630 (_ BitVec 64)) (_2!630 V!1779)) )
))
(declare-datatypes ((List!822 0))(
  ( (Nil!819) (Cons!818 (h!1385 tuple2!1238) (t!3508 List!822)) )
))
(declare-datatypes ((ListLongMap!803 0))(
  ( (ListLongMap!804 (toList!417 List!822)) )
))
(declare-fun contains!358 (ListLongMap!803 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!240 (array!2117 array!2119 (_ BitVec 32) (_ BitVec 32) V!1779 V!1779 (_ BitVec 32) Int) ListLongMap!803)

(assert (=> b!31989 (= res!19424 (not (contains!358 (getCurrentListMap!240 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!31990 () Bool)

(declare-fun tp_is_empty!1465 () Bool)

(assert (=> b!31990 (= e!20354 tp_is_empty!1465)))

(declare-fun res!19428 () Bool)

(assert (=> start!4196 (=> (not res!19428) (not e!20356))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4196 (= res!19428 (validMask!0 mask!2294))))

(assert (=> start!4196 e!20356))

(assert (=> start!4196 true))

(assert (=> start!4196 tp!4753))

(declare-fun array_inv!715 (array!2119) Bool)

(assert (=> start!4196 (and (array_inv!715 _values!1501) e!20352)))

(declare-fun array_inv!716 (array!2117) Bool)

(assert (=> start!4196 (array_inv!716 _keys!1833)))

(assert (=> start!4196 tp_is_empty!1465))

(declare-fun b!31991 () Bool)

(declare-fun res!19425 () Bool)

(assert (=> b!31991 (=> (not res!19425) (not e!20356))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2117 (_ BitVec 32)) Bool)

(assert (=> b!31991 (= res!19425 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapIsEmpty!1726 () Bool)

(assert (=> mapIsEmpty!1726 mapRes!1726))

(declare-fun mapNonEmpty!1726 () Bool)

(declare-fun tp!4752 () Bool)

(declare-fun e!20355 () Bool)

(assert (=> mapNonEmpty!1726 (= mapRes!1726 (and tp!4752 e!20355))))

(declare-fun mapValue!1726 () ValueCell!533)

(declare-fun mapKey!1726 () (_ BitVec 32))

(declare-fun mapRest!1726 () (Array (_ BitVec 32) ValueCell!533))

(assert (=> mapNonEmpty!1726 (= (arr!1013 _values!1501) (store mapRest!1726 mapKey!1726 mapValue!1726))))

(declare-fun b!31992 () Bool)

(assert (=> b!31992 (= e!20355 tp_is_empty!1465)))

(assert (= (and start!4196 res!19428) b!31984))

(assert (= (and b!31984 res!19427) b!31991))

(assert (= (and b!31991 res!19425) b!31985))

(assert (= (and b!31985 res!19429) b!31986))

(assert (= (and b!31986 res!19423) b!31989))

(assert (= (and b!31989 res!19424) b!31988))

(assert (= (and b!31988 res!19426) b!31983))

(assert (= (and b!31987 condMapEmpty!1726) mapIsEmpty!1726))

(assert (= (and b!31987 (not condMapEmpty!1726)) mapNonEmpty!1726))

(get-info :version)

(assert (= (and mapNonEmpty!1726 ((_ is ValueCellFull!533) mapValue!1726)) b!31992))

(assert (= (and b!31987 ((_ is ValueCellFull!533) mapDefault!1726)) b!31990))

(assert (= start!4196 b!31987))

(declare-fun m!25587 () Bool)

(assert (=> start!4196 m!25587))

(declare-fun m!25589 () Bool)

(assert (=> start!4196 m!25589))

(declare-fun m!25591 () Bool)

(assert (=> start!4196 m!25591))

(declare-fun m!25593 () Bool)

(assert (=> b!31991 m!25593))

(declare-fun m!25595 () Bool)

(assert (=> b!31985 m!25595))

(declare-fun m!25597 () Bool)

(assert (=> b!31988 m!25597))

(declare-fun m!25599 () Bool)

(assert (=> b!31983 m!25599))

(declare-fun m!25601 () Bool)

(assert (=> mapNonEmpty!1726 m!25601))

(declare-fun m!25603 () Bool)

(assert (=> b!31989 m!25603))

(assert (=> b!31989 m!25603))

(declare-fun m!25605 () Bool)

(assert (=> b!31989 m!25605))

(declare-fun m!25607 () Bool)

(assert (=> b!31986 m!25607))

(check-sat (not b!31985) (not mapNonEmpty!1726) (not start!4196) (not b!31986) (not b!31988) (not b!31989) tp_is_empty!1465 (not b!31983) b_and!1915 (not b_next!1111) (not b!31991))
(check-sat b_and!1915 (not b_next!1111))
