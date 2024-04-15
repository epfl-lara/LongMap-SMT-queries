; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!624 () Bool)

(assert start!624)

(declare-fun b_free!97 () Bool)

(declare-fun b_next!97 () Bool)

(assert (=> start!624 (= b_free!97 (not b_next!97))))

(declare-fun tp!509 () Bool)

(declare-fun b_and!235 () Bool)

(assert (=> start!624 (= tp!509 b_and!235)))

(declare-fun b!3952 () Bool)

(declare-fun e!2028 () Bool)

(declare-fun tp_is_empty!175 () Bool)

(assert (=> b!3952 (= e!2028 tp_is_empty!175)))

(declare-fun res!5463 () Bool)

(declare-fun e!2027 () Bool)

(assert (=> start!624 (=> (not res!5463) (not e!2027))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!624 (= res!5463 (validMask!0 mask!2250))))

(assert (=> start!624 e!2027))

(assert (=> start!624 tp!509))

(assert (=> start!624 true))

(declare-datatypes ((V!411 0))(
  ( (V!412 (val!93 Int)) )
))
(declare-datatypes ((ValueCell!71 0))(
  ( (ValueCellFull!71 (v!1180 V!411)) (EmptyCell!71) )
))
(declare-datatypes ((array!277 0))(
  ( (array!278 (arr!131 (Array (_ BitVec 32) ValueCell!71)) (size!193 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!277)

(declare-fun e!2030 () Bool)

(declare-fun array_inv!91 (array!277) Bool)

(assert (=> start!624 (and (array_inv!91 _values!1492) e!2030)))

(assert (=> start!624 tp_is_empty!175))

(declare-datatypes ((array!279 0))(
  ( (array!280 (arr!132 (Array (_ BitVec 32) (_ BitVec 64))) (size!194 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!279)

(declare-fun array_inv!92 (array!279) Bool)

(assert (=> start!624 (array_inv!92 _keys!1806)))

(declare-fun b!3953 () Bool)

(declare-fun e!2029 () Bool)

(assert (=> b!3953 (= e!2029 tp_is_empty!175)))

(declare-fun mapNonEmpty!221 () Bool)

(declare-fun mapRes!221 () Bool)

(declare-fun tp!508 () Bool)

(assert (=> mapNonEmpty!221 (= mapRes!221 (and tp!508 e!2028))))

(declare-fun mapValue!221 () ValueCell!71)

(declare-fun mapRest!221 () (Array (_ BitVec 32) ValueCell!71))

(declare-fun mapKey!221 () (_ BitVec 32))

(assert (=> mapNonEmpty!221 (= (arr!131 _values!1492) (store mapRest!221 mapKey!221 mapValue!221))))

(declare-fun b!3954 () Bool)

(declare-fun res!5461 () Bool)

(assert (=> b!3954 (=> (not res!5461) (not e!2027))))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!3954 (= res!5461 (and (= (size!193 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!194 _keys!1806) (size!193 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!3955 () Bool)

(assert (=> b!3955 (= e!2027 false)))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!411)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun lt!546 () Bool)

(declare-fun zeroValue!1434 () V!411)

(declare-datatypes ((tuple2!76 0))(
  ( (tuple2!77 (_1!38 (_ BitVec 64)) (_2!38 V!411)) )
))
(declare-datatypes ((List!81 0))(
  ( (Nil!78) (Cons!77 (h!643 tuple2!76) (t!2208 List!81)) )
))
(declare-datatypes ((ListLongMap!81 0))(
  ( (ListLongMap!82 (toList!56 List!81)) )
))
(declare-fun contains!26 (ListLongMap!81 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!15 (array!279 array!277 (_ BitVec 32) (_ BitVec 32) V!411 V!411 (_ BitVec 32) Int) ListLongMap!81)

(assert (=> b!3955 (= lt!546 (contains!26 (getCurrentListMap!15 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!3956 () Bool)

(declare-fun res!5464 () Bool)

(assert (=> b!3956 (=> (not res!5464) (not e!2027))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!279 (_ BitVec 32)) Bool)

(assert (=> b!3956 (= res!5464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun mapIsEmpty!221 () Bool)

(assert (=> mapIsEmpty!221 mapRes!221))

(declare-fun b!3957 () Bool)

(declare-fun res!5462 () Bool)

(assert (=> b!3957 (=> (not res!5462) (not e!2027))))

(declare-datatypes ((List!82 0))(
  ( (Nil!79) (Cons!78 (h!644 (_ BitVec 64)) (t!2209 List!82)) )
))
(declare-fun arrayNoDuplicates!0 (array!279 (_ BitVec 32) List!82) Bool)

(assert (=> b!3957 (= res!5462 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!79))))

(declare-fun b!3958 () Bool)

(assert (=> b!3958 (= e!2030 (and e!2029 mapRes!221))))

(declare-fun condMapEmpty!221 () Bool)

(declare-fun mapDefault!221 () ValueCell!71)

(assert (=> b!3958 (= condMapEmpty!221 (= (arr!131 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!71)) mapDefault!221)))))

(assert (= (and start!624 res!5463) b!3954))

(assert (= (and b!3954 res!5461) b!3956))

(assert (= (and b!3956 res!5464) b!3957))

(assert (= (and b!3957 res!5462) b!3955))

(assert (= (and b!3958 condMapEmpty!221) mapIsEmpty!221))

(assert (= (and b!3958 (not condMapEmpty!221)) mapNonEmpty!221))

(get-info :version)

(assert (= (and mapNonEmpty!221 ((_ is ValueCellFull!71) mapValue!221)) b!3952))

(assert (= (and b!3958 ((_ is ValueCellFull!71) mapDefault!221)) b!3953))

(assert (= start!624 b!3958))

(declare-fun m!2015 () Bool)

(assert (=> mapNonEmpty!221 m!2015))

(declare-fun m!2017 () Bool)

(assert (=> b!3956 m!2017))

(declare-fun m!2019 () Bool)

(assert (=> start!624 m!2019))

(declare-fun m!2021 () Bool)

(assert (=> start!624 m!2021))

(declare-fun m!2023 () Bool)

(assert (=> start!624 m!2023))

(declare-fun m!2025 () Bool)

(assert (=> b!3957 m!2025))

(declare-fun m!2027 () Bool)

(assert (=> b!3955 m!2027))

(assert (=> b!3955 m!2027))

(declare-fun m!2029 () Bool)

(assert (=> b!3955 m!2029))

(check-sat b_and!235 tp_is_empty!175 (not b!3957) (not b_next!97) (not b!3955) (not mapNonEmpty!221) (not b!3956) (not start!624))
(check-sat b_and!235 (not b_next!97))
