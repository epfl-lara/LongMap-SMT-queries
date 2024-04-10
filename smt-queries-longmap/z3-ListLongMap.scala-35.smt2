; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!644 () Bool)

(assert start!644)

(declare-fun b_free!117 () Bool)

(declare-fun b_next!117 () Bool)

(assert (=> start!644 (= b_free!117 (not b_next!117))))

(declare-fun tp!568 () Bool)

(declare-fun b_and!255 () Bool)

(assert (=> start!644 (= tp!568 b_and!255)))

(declare-fun mapIsEmpty!251 () Bool)

(declare-fun mapRes!251 () Bool)

(assert (=> mapIsEmpty!251 mapRes!251))

(declare-fun mapNonEmpty!251 () Bool)

(declare-fun tp!569 () Bool)

(declare-fun e!2180 () Bool)

(assert (=> mapNonEmpty!251 (= mapRes!251 (and tp!569 e!2180))))

(declare-datatypes ((V!437 0))(
  ( (V!438 (val!103 Int)) )
))
(declare-datatypes ((ValueCell!81 0))(
  ( (ValueCellFull!81 (v!1190 V!437)) (EmptyCell!81) )
))
(declare-fun mapRest!251 () (Array (_ BitVec 32) ValueCell!81))

(declare-fun mapKey!251 () (_ BitVec 32))

(declare-datatypes ((array!321 0))(
  ( (array!322 (arr!153 (Array (_ BitVec 32) ValueCell!81)) (size!215 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!321)

(declare-fun mapValue!251 () ValueCell!81)

(assert (=> mapNonEmpty!251 (= (arr!153 _values!1492) (store mapRest!251 mapKey!251 mapValue!251))))

(declare-fun b!4162 () Bool)

(declare-fun e!2176 () Bool)

(declare-fun e!2177 () Bool)

(assert (=> b!4162 (= e!2176 (and e!2177 mapRes!251))))

(declare-fun condMapEmpty!251 () Bool)

(declare-fun mapDefault!251 () ValueCell!81)

(assert (=> b!4162 (= condMapEmpty!251 (= (arr!153 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!81)) mapDefault!251)))))

(declare-fun b!4164 () Bool)

(declare-fun res!5584 () Bool)

(declare-fun e!2178 () Bool)

(assert (=> b!4164 (=> (not res!5584) (not e!2178))))

(declare-datatypes ((array!323 0))(
  ( (array!324 (arr!154 (Array (_ BitVec 32) (_ BitVec 64))) (size!216 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!323)

(declare-datatypes ((List!94 0))(
  ( (Nil!91) (Cons!90 (h!656 (_ BitVec 64)) (t!2221 List!94)) )
))
(declare-fun arrayNoDuplicates!0 (array!323 (_ BitVec 32) List!94) Bool)

(assert (=> b!4164 (= res!5584 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!91))))

(declare-fun b!4165 () Bool)

(assert (=> b!4165 (= e!2178 false)))

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun minValue!1434 () V!437)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun lt!576 () Bool)

(declare-fun zeroValue!1434 () V!437)

(declare-datatypes ((tuple2!84 0))(
  ( (tuple2!85 (_1!42 (_ BitVec 64)) (_2!42 V!437)) )
))
(declare-datatypes ((List!95 0))(
  ( (Nil!92) (Cons!91 (h!657 tuple2!84) (t!2222 List!95)) )
))
(declare-datatypes ((ListLongMap!89 0))(
  ( (ListLongMap!90 (toList!60 List!95)) )
))
(declare-fun contains!30 (ListLongMap!89 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!19 (array!323 array!321 (_ BitVec 32) (_ BitVec 32) V!437 V!437 (_ BitVec 32) Int) ListLongMap!89)

(assert (=> b!4165 (= lt!576 (contains!30 (getCurrentListMap!19 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!4166 () Bool)

(declare-fun tp_is_empty!195 () Bool)

(assert (=> b!4166 (= e!2180 tp_is_empty!195)))

(declare-fun res!5583 () Bool)

(assert (=> start!644 (=> (not res!5583) (not e!2178))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!644 (= res!5583 (validMask!0 mask!2250))))

(assert (=> start!644 e!2178))

(assert (=> start!644 tp!568))

(assert (=> start!644 true))

(declare-fun array_inv!109 (array!321) Bool)

(assert (=> start!644 (and (array_inv!109 _values!1492) e!2176)))

(assert (=> start!644 tp_is_empty!195))

(declare-fun array_inv!110 (array!323) Bool)

(assert (=> start!644 (array_inv!110 _keys!1806)))

(declare-fun b!4163 () Bool)

(declare-fun res!5581 () Bool)

(assert (=> b!4163 (=> (not res!5581) (not e!2178))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!323 (_ BitVec 32)) Bool)

(assert (=> b!4163 (= res!5581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!4167 () Bool)

(assert (=> b!4167 (= e!2177 tp_is_empty!195)))

(declare-fun b!4168 () Bool)

(declare-fun res!5582 () Bool)

(assert (=> b!4168 (=> (not res!5582) (not e!2178))))

(assert (=> b!4168 (= res!5582 (and (= (size!215 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!216 _keys!1806) (size!215 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(assert (= (and start!644 res!5583) b!4168))

(assert (= (and b!4168 res!5582) b!4163))

(assert (= (and b!4163 res!5581) b!4164))

(assert (= (and b!4164 res!5584) b!4165))

(assert (= (and b!4162 condMapEmpty!251) mapIsEmpty!251))

(assert (= (and b!4162 (not condMapEmpty!251)) mapNonEmpty!251))

(get-info :version)

(assert (= (and mapNonEmpty!251 ((_ is ValueCellFull!81) mapValue!251)) b!4166))

(assert (= (and b!4162 ((_ is ValueCellFull!81) mapDefault!251)) b!4167))

(assert (= start!644 b!4162))

(declare-fun m!2175 () Bool)

(assert (=> start!644 m!2175))

(declare-fun m!2177 () Bool)

(assert (=> start!644 m!2177))

(declare-fun m!2179 () Bool)

(assert (=> start!644 m!2179))

(declare-fun m!2181 () Bool)

(assert (=> b!4163 m!2181))

(declare-fun m!2183 () Bool)

(assert (=> b!4165 m!2183))

(assert (=> b!4165 m!2183))

(declare-fun m!2185 () Bool)

(assert (=> b!4165 m!2185))

(declare-fun m!2187 () Bool)

(assert (=> b!4164 m!2187))

(declare-fun m!2189 () Bool)

(assert (=> mapNonEmpty!251 m!2189))

(check-sat (not b!4163) (not start!644) (not b!4164) b_and!255 tp_is_empty!195 (not b!4165) (not mapNonEmpty!251) (not b_next!117))
(check-sat b_and!255 (not b_next!117))
