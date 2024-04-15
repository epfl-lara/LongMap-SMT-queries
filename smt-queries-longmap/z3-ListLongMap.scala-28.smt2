; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!600 () Bool)

(assert start!600)

(declare-fun b_free!73 () Bool)

(declare-fun b_next!73 () Bool)

(assert (=> start!600 (= b_free!73 (not b_next!73))))

(declare-fun tp!436 () Bool)

(declare-fun b_and!211 () Bool)

(assert (=> start!600 (= tp!436 b_and!211)))

(declare-fun b!3700 () Bool)

(declare-fun res!5319 () Bool)

(declare-fun e!1847 () Bool)

(assert (=> b!3700 (=> (not res!5319) (not e!1847))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!379 0))(
  ( (V!380 (val!81 Int)) )
))
(declare-datatypes ((ValueCell!59 0))(
  ( (ValueCellFull!59 (v!1168 V!379)) (EmptyCell!59) )
))
(declare-datatypes ((array!231 0))(
  ( (array!232 (arr!108 (Array (_ BitVec 32) ValueCell!59)) (size!170 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!231)

(declare-datatypes ((array!233 0))(
  ( (array!234 (arr!109 (Array (_ BitVec 32) (_ BitVec 64))) (size!171 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!233)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!3700 (= res!5319 (and (= (size!170 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!171 _keys!1806) (size!170 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun res!5317 () Bool)

(assert (=> start!600 (=> (not res!5317) (not e!1847))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!600 (= res!5317 (validMask!0 mask!2250))))

(assert (=> start!600 e!1847))

(assert (=> start!600 tp!436))

(assert (=> start!600 true))

(declare-fun e!1848 () Bool)

(declare-fun array_inv!71 (array!231) Bool)

(assert (=> start!600 (and (array_inv!71 _values!1492) e!1848)))

(declare-fun tp_is_empty!151 () Bool)

(assert (=> start!600 tp_is_empty!151))

(declare-fun array_inv!72 (array!233) Bool)

(assert (=> start!600 (array_inv!72 _keys!1806)))

(declare-fun b!3701 () Bool)

(declare-fun res!5318 () Bool)

(assert (=> b!3701 (=> (not res!5318) (not e!1847))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!233 (_ BitVec 32)) Bool)

(assert (=> b!3701 (= res!5318 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!3702 () Bool)

(declare-fun res!5320 () Bool)

(assert (=> b!3702 (=> (not res!5320) (not e!1847))))

(declare-datatypes ((List!66 0))(
  ( (Nil!63) (Cons!62 (h!628 (_ BitVec 64)) (t!2193 List!66)) )
))
(declare-fun arrayNoDuplicates!0 (array!233 (_ BitVec 32) List!66) Bool)

(assert (=> b!3702 (= res!5320 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!63))))

(declare-fun b!3703 () Bool)

(declare-fun e!1846 () Bool)

(assert (=> b!3703 (= e!1846 tp_is_empty!151)))

(declare-fun b!3704 () Bool)

(assert (=> b!3704 (= e!1847 false)))

(declare-fun minValue!1434 () V!379)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun zeroValue!1434 () V!379)

(declare-fun lt!510 () Bool)

(declare-fun defaultEntry!1495 () Int)

(declare-datatypes ((tuple2!58 0))(
  ( (tuple2!59 (_1!29 (_ BitVec 64)) (_2!29 V!379)) )
))
(declare-datatypes ((List!67 0))(
  ( (Nil!64) (Cons!63 (h!629 tuple2!58) (t!2194 List!67)) )
))
(declare-datatypes ((ListLongMap!63 0))(
  ( (ListLongMap!64 (toList!47 List!67)) )
))
(declare-fun contains!17 (ListLongMap!63 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!6 (array!233 array!231 (_ BitVec 32) (_ BitVec 32) V!379 V!379 (_ BitVec 32) Int) ListLongMap!63)

(assert (=> b!3704 (= lt!510 (contains!17 (getCurrentListMap!6 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!3705 () Bool)

(declare-fun e!1849 () Bool)

(assert (=> b!3705 (= e!1849 tp_is_empty!151)))

(declare-fun mapIsEmpty!185 () Bool)

(declare-fun mapRes!185 () Bool)

(assert (=> mapIsEmpty!185 mapRes!185))

(declare-fun mapNonEmpty!185 () Bool)

(declare-fun tp!437 () Bool)

(assert (=> mapNonEmpty!185 (= mapRes!185 (and tp!437 e!1846))))

(declare-fun mapValue!185 () ValueCell!59)

(declare-fun mapKey!185 () (_ BitVec 32))

(declare-fun mapRest!185 () (Array (_ BitVec 32) ValueCell!59))

(assert (=> mapNonEmpty!185 (= (arr!108 _values!1492) (store mapRest!185 mapKey!185 mapValue!185))))

(declare-fun b!3706 () Bool)

(assert (=> b!3706 (= e!1848 (and e!1849 mapRes!185))))

(declare-fun condMapEmpty!185 () Bool)

(declare-fun mapDefault!185 () ValueCell!59)

(assert (=> b!3706 (= condMapEmpty!185 (= (arr!108 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!59)) mapDefault!185)))))

(assert (= (and start!600 res!5317) b!3700))

(assert (= (and b!3700 res!5319) b!3701))

(assert (= (and b!3701 res!5318) b!3702))

(assert (= (and b!3702 res!5320) b!3704))

(assert (= (and b!3706 condMapEmpty!185) mapIsEmpty!185))

(assert (= (and b!3706 (not condMapEmpty!185)) mapNonEmpty!185))

(get-info :version)

(assert (= (and mapNonEmpty!185 ((_ is ValueCellFull!59) mapValue!185)) b!3703))

(assert (= (and b!3706 ((_ is ValueCellFull!59) mapDefault!185)) b!3705))

(assert (= start!600 b!3706))

(declare-fun m!1823 () Bool)

(assert (=> mapNonEmpty!185 m!1823))

(declare-fun m!1825 () Bool)

(assert (=> start!600 m!1825))

(declare-fun m!1827 () Bool)

(assert (=> start!600 m!1827))

(declare-fun m!1829 () Bool)

(assert (=> start!600 m!1829))

(declare-fun m!1831 () Bool)

(assert (=> b!3702 m!1831))

(declare-fun m!1833 () Bool)

(assert (=> b!3704 m!1833))

(assert (=> b!3704 m!1833))

(declare-fun m!1835 () Bool)

(assert (=> b!3704 m!1835))

(declare-fun m!1837 () Bool)

(assert (=> b!3701 m!1837))

(check-sat (not b!3701) (not b!3704) (not b_next!73) tp_is_empty!151 (not b!3702) b_and!211 (not mapNonEmpty!185) (not start!600))
(check-sat b_and!211 (not b_next!73))
