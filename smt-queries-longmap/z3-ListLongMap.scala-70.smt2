; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!954 () Bool)

(assert start!954)

(declare-fun b_free!327 () Bool)

(declare-fun b_next!327 () Bool)

(assert (=> start!954 (= b_free!327 (not b_next!327))))

(declare-fun tp!1214 () Bool)

(declare-fun b_and!475 () Bool)

(assert (=> start!954 (= tp!1214 b_and!475)))

(declare-fun b!8149 () Bool)

(declare-fun e!4618 () Bool)

(declare-fun e!4617 () Bool)

(assert (=> b!8149 (= e!4618 (not e!4617))))

(declare-fun res!7818 () Bool)

(assert (=> b!8149 (=> res!7818 e!4617)))

(declare-datatypes ((array!741 0))(
  ( (array!742 (arr!358 (Array (_ BitVec 32) (_ BitVec 64))) (size!420 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!741)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!741 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!8149 (= res!7818 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(declare-fun e!4619 () Bool)

(assert (=> b!8149 e!4619))

(declare-fun c!572 () Bool)

(assert (=> b!8149 (= c!572 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((Unit!155 0))(
  ( (Unit!156) )
))
(declare-fun lt!1643 () Unit!155)

(declare-datatypes ((V!717 0))(
  ( (V!718 (val!208 Int)) )
))
(declare-datatypes ((ValueCell!186 0))(
  ( (ValueCellFull!186 (v!1300 V!717)) (EmptyCell!186) )
))
(declare-datatypes ((array!743 0))(
  ( (array!744 (arr!359 (Array (_ BitVec 32) ValueCell!186)) (size!421 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!743)

(declare-fun minValue!1434 () V!717)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!717)

(declare-fun lemmaKeyInListMapIsInArray!58 (array!741 array!743 (_ BitVec 32) (_ BitVec 32) V!717 V!717 (_ BitVec 64) Int) Unit!155)

(assert (=> b!8149 (= lt!1643 (lemmaKeyInListMapIsInArray!58 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun b!8150 () Bool)

(declare-fun e!4621 () Bool)

(declare-fun tp_is_empty!405 () Bool)

(assert (=> b!8150 (= e!4621 tp_is_empty!405)))

(declare-fun b!8151 () Bool)

(declare-fun res!7814 () Bool)

(assert (=> b!8151 (=> (not res!7814) (not e!4618))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!741 (_ BitVec 32)) Bool)

(assert (=> b!8151 (= res!7814 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!8152 () Bool)

(declare-fun res!7813 () Bool)

(assert (=> b!8152 (=> (not res!7813) (not e!4618))))

(declare-datatypes ((tuple2!234 0))(
  ( (tuple2!235 (_1!117 (_ BitVec 64)) (_2!117 V!717)) )
))
(declare-datatypes ((List!245 0))(
  ( (Nil!242) (Cons!241 (h!807 tuple2!234) (t!2382 List!245)) )
))
(declare-datatypes ((ListLongMap!239 0))(
  ( (ListLongMap!240 (toList!135 List!245)) )
))
(declare-fun contains!110 (ListLongMap!239 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!94 (array!741 array!743 (_ BitVec 32) (_ BitVec 32) V!717 V!717 (_ BitVec 32) Int) ListLongMap!239)

(assert (=> b!8152 (= res!7813 (contains!110 (getCurrentListMap!94 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!8153 () Bool)

(assert (=> b!8153 (= e!4619 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun res!7819 () Bool)

(assert (=> start!954 (=> (not res!7819) (not e!4618))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!954 (= res!7819 (validMask!0 mask!2250))))

(assert (=> start!954 e!4618))

(assert (=> start!954 tp!1214))

(assert (=> start!954 true))

(declare-fun e!4620 () Bool)

(declare-fun array_inv!265 (array!743) Bool)

(assert (=> start!954 (and (array_inv!265 _values!1492) e!4620)))

(assert (=> start!954 tp_is_empty!405))

(declare-fun array_inv!266 (array!741) Bool)

(assert (=> start!954 (array_inv!266 _keys!1806)))

(declare-fun b!8154 () Bool)

(assert (=> b!8154 (= e!4617 (= (size!420 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250)))))

(declare-fun lt!1644 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!741 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!8154 (= lt!1644 (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!8155 () Bool)

(declare-fun mapRes!581 () Bool)

(assert (=> b!8155 (= e!4620 (and e!4621 mapRes!581))))

(declare-fun condMapEmpty!581 () Bool)

(declare-fun mapDefault!581 () ValueCell!186)

(assert (=> b!8155 (= condMapEmpty!581 (= (arr!359 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!186)) mapDefault!581)))))

(declare-fun mapIsEmpty!581 () Bool)

(assert (=> mapIsEmpty!581 mapRes!581))

(declare-fun b!8156 () Bool)

(declare-fun res!7817 () Bool)

(assert (=> b!8156 (=> (not res!7817) (not e!4618))))

(declare-datatypes ((List!246 0))(
  ( (Nil!243) (Cons!242 (h!808 (_ BitVec 64)) (t!2383 List!246)) )
))
(declare-fun arrayNoDuplicates!0 (array!741 (_ BitVec 32) List!246) Bool)

(assert (=> b!8156 (= res!7817 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!243))))

(declare-fun b!8157 () Bool)

(assert (=> b!8157 (= e!4619 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!8158 () Bool)

(declare-fun res!7815 () Bool)

(assert (=> b!8158 (=> (not res!7815) (not e!4618))))

(assert (=> b!8158 (= res!7815 (and (= (size!421 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!420 _keys!1806) (size!421 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!8159 () Bool)

(declare-fun e!4616 () Bool)

(assert (=> b!8159 (= e!4616 tp_is_empty!405)))

(declare-fun mapNonEmpty!581 () Bool)

(declare-fun tp!1213 () Bool)

(assert (=> mapNonEmpty!581 (= mapRes!581 (and tp!1213 e!4616))))

(declare-fun mapKey!581 () (_ BitVec 32))

(declare-fun mapValue!581 () ValueCell!186)

(declare-fun mapRest!581 () (Array (_ BitVec 32) ValueCell!186))

(assert (=> mapNonEmpty!581 (= (arr!359 _values!1492) (store mapRest!581 mapKey!581 mapValue!581))))

(declare-fun b!8160 () Bool)

(declare-fun res!7816 () Bool)

(assert (=> b!8160 (=> (not res!7816) (not e!4618))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!8160 (= res!7816 (validKeyInArray!0 k0!1278))))

(assert (= (and start!954 res!7819) b!8158))

(assert (= (and b!8158 res!7815) b!8151))

(assert (= (and b!8151 res!7814) b!8156))

(assert (= (and b!8156 res!7817) b!8152))

(assert (= (and b!8152 res!7813) b!8160))

(assert (= (and b!8160 res!7816) b!8149))

(assert (= (and b!8149 c!572) b!8153))

(assert (= (and b!8149 (not c!572)) b!8157))

(assert (= (and b!8149 (not res!7818)) b!8154))

(assert (= (and b!8155 condMapEmpty!581) mapIsEmpty!581))

(assert (= (and b!8155 (not condMapEmpty!581)) mapNonEmpty!581))

(get-info :version)

(assert (= (and mapNonEmpty!581 ((_ is ValueCellFull!186) mapValue!581)) b!8159))

(assert (= (and b!8155 ((_ is ValueCellFull!186) mapDefault!581)) b!8150))

(assert (= start!954 b!8155))

(declare-fun m!4997 () Bool)

(assert (=> mapNonEmpty!581 m!4997))

(declare-fun m!4999 () Bool)

(assert (=> b!8156 m!4999))

(declare-fun m!5001 () Bool)

(assert (=> b!8151 m!5001))

(declare-fun m!5003 () Bool)

(assert (=> b!8153 m!5003))

(declare-fun m!5005 () Bool)

(assert (=> b!8160 m!5005))

(assert (=> b!8149 m!5003))

(declare-fun m!5007 () Bool)

(assert (=> b!8149 m!5007))

(declare-fun m!5009 () Bool)

(assert (=> b!8152 m!5009))

(assert (=> b!8152 m!5009))

(declare-fun m!5011 () Bool)

(assert (=> b!8152 m!5011))

(declare-fun m!5013 () Bool)

(assert (=> start!954 m!5013))

(declare-fun m!5015 () Bool)

(assert (=> start!954 m!5015))

(declare-fun m!5017 () Bool)

(assert (=> start!954 m!5017))

(declare-fun m!5019 () Bool)

(assert (=> b!8154 m!5019))

(check-sat (not b!8160) tp_is_empty!405 (not b!8156) (not b_next!327) (not b!8149) (not b!8153) (not b!8151) b_and!475 (not mapNonEmpty!581) (not b!8152) (not b!8154) (not start!954))
(check-sat b_and!475 (not b_next!327))
