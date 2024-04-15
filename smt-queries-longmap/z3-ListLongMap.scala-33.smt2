; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!630 () Bool)

(assert start!630)

(declare-fun b_free!103 () Bool)

(declare-fun b_next!103 () Bool)

(assert (=> start!630 (= b_free!103 (not b_next!103))))

(declare-fun tp!526 () Bool)

(declare-fun b_and!241 () Bool)

(assert (=> start!630 (= tp!526 b_and!241)))

(declare-fun b!4015 () Bool)

(declare-fun e!2072 () Bool)

(declare-fun e!2075 () Bool)

(declare-fun mapRes!230 () Bool)

(assert (=> b!4015 (= e!2072 (and e!2075 mapRes!230))))

(declare-fun condMapEmpty!230 () Bool)

(declare-datatypes ((V!419 0))(
  ( (V!420 (val!96 Int)) )
))
(declare-datatypes ((ValueCell!74 0))(
  ( (ValueCellFull!74 (v!1183 V!419)) (EmptyCell!74) )
))
(declare-datatypes ((array!289 0))(
  ( (array!290 (arr!137 (Array (_ BitVec 32) ValueCell!74)) (size!199 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!289)

(declare-fun mapDefault!230 () ValueCell!74)

(assert (=> b!4015 (= condMapEmpty!230 (= (arr!137 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!74)) mapDefault!230)))))

(declare-fun b!4016 () Bool)

(declare-fun tp_is_empty!181 () Bool)

(assert (=> b!4016 (= e!2075 tp_is_empty!181)))

(declare-fun b!4017 () Bool)

(declare-fun res!5497 () Bool)

(declare-fun e!2073 () Bool)

(assert (=> b!4017 (=> (not res!5497) (not e!2073))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((array!291 0))(
  ( (array!292 (arr!138 (Array (_ BitVec 32) (_ BitVec 64))) (size!200 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!291)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!4017 (= res!5497 (and (= (size!199 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!200 _keys!1806) (size!199 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!4018 () Bool)

(declare-fun res!5498 () Bool)

(assert (=> b!4018 (=> (not res!5498) (not e!2073))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!291 (_ BitVec 32)) Bool)

(assert (=> b!4018 (= res!5498 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!4019 () Bool)

(assert (=> b!4019 (= e!2073 false)))

(declare-fun defaultEntry!1495 () Int)

(declare-fun lt!555 () Bool)

(declare-fun minValue!1434 () V!419)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun zeroValue!1434 () V!419)

(declare-datatypes ((tuple2!80 0))(
  ( (tuple2!81 (_1!40 (_ BitVec 64)) (_2!40 V!419)) )
))
(declare-datatypes ((List!85 0))(
  ( (Nil!82) (Cons!81 (h!647 tuple2!80) (t!2212 List!85)) )
))
(declare-datatypes ((ListLongMap!85 0))(
  ( (ListLongMap!86 (toList!58 List!85)) )
))
(declare-fun contains!28 (ListLongMap!85 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!17 (array!291 array!289 (_ BitVec 32) (_ BitVec 32) V!419 V!419 (_ BitVec 32) Int) ListLongMap!85)

(assert (=> b!4019 (= lt!555 (contains!28 (getCurrentListMap!17 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!4020 () Bool)

(declare-fun res!5499 () Bool)

(assert (=> b!4020 (=> (not res!5499) (not e!2073))))

(declare-datatypes ((List!86 0))(
  ( (Nil!83) (Cons!82 (h!648 (_ BitVec 64)) (t!2213 List!86)) )
))
(declare-fun arrayNoDuplicates!0 (array!291 (_ BitVec 32) List!86) Bool)

(assert (=> b!4020 (= res!5499 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!83))))

(declare-fun mapIsEmpty!230 () Bool)

(assert (=> mapIsEmpty!230 mapRes!230))

(declare-fun mapNonEmpty!230 () Bool)

(declare-fun tp!527 () Bool)

(declare-fun e!2074 () Bool)

(assert (=> mapNonEmpty!230 (= mapRes!230 (and tp!527 e!2074))))

(declare-fun mapRest!230 () (Array (_ BitVec 32) ValueCell!74))

(declare-fun mapValue!230 () ValueCell!74)

(declare-fun mapKey!230 () (_ BitVec 32))

(assert (=> mapNonEmpty!230 (= (arr!137 _values!1492) (store mapRest!230 mapKey!230 mapValue!230))))

(declare-fun b!4021 () Bool)

(assert (=> b!4021 (= e!2074 tp_is_empty!181)))

(declare-fun res!5500 () Bool)

(assert (=> start!630 (=> (not res!5500) (not e!2073))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!630 (= res!5500 (validMask!0 mask!2250))))

(assert (=> start!630 e!2073))

(assert (=> start!630 tp!526))

(assert (=> start!630 true))

(declare-fun array_inv!95 (array!289) Bool)

(assert (=> start!630 (and (array_inv!95 _values!1492) e!2072)))

(assert (=> start!630 tp_is_empty!181))

(declare-fun array_inv!96 (array!291) Bool)

(assert (=> start!630 (array_inv!96 _keys!1806)))

(assert (= (and start!630 res!5500) b!4017))

(assert (= (and b!4017 res!5497) b!4018))

(assert (= (and b!4018 res!5498) b!4020))

(assert (= (and b!4020 res!5499) b!4019))

(assert (= (and b!4015 condMapEmpty!230) mapIsEmpty!230))

(assert (= (and b!4015 (not condMapEmpty!230)) mapNonEmpty!230))

(get-info :version)

(assert (= (and mapNonEmpty!230 ((_ is ValueCellFull!74) mapValue!230)) b!4021))

(assert (= (and b!4015 ((_ is ValueCellFull!74) mapDefault!230)) b!4016))

(assert (= start!630 b!4015))

(declare-fun m!2063 () Bool)

(assert (=> mapNonEmpty!230 m!2063))

(declare-fun m!2065 () Bool)

(assert (=> b!4020 m!2065))

(declare-fun m!2067 () Bool)

(assert (=> start!630 m!2067))

(declare-fun m!2069 () Bool)

(assert (=> start!630 m!2069))

(declare-fun m!2071 () Bool)

(assert (=> start!630 m!2071))

(declare-fun m!2073 () Bool)

(assert (=> b!4019 m!2073))

(assert (=> b!4019 m!2073))

(declare-fun m!2075 () Bool)

(assert (=> b!4019 m!2075))

(declare-fun m!2077 () Bool)

(assert (=> b!4018 m!2077))

(check-sat (not b!4020) (not b!4018) (not start!630) b_and!241 (not mapNonEmpty!230) (not b_next!103) (not b!4019) tp_is_empty!181)
(check-sat b_and!241 (not b_next!103))
