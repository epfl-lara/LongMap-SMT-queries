; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!628 () Bool)

(assert start!628)

(declare-fun b_free!101 () Bool)

(declare-fun b_next!101 () Bool)

(assert (=> start!628 (= b_free!101 (not b_next!101))))

(declare-fun tp!521 () Bool)

(declare-fun b_and!239 () Bool)

(assert (=> start!628 (= tp!521 b_and!239)))

(declare-fun b!3994 () Bool)

(declare-fun e!2060 () Bool)

(assert (=> b!3994 (= e!2060 false)))

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun lt!552 () Bool)

(declare-datatypes ((V!415 0))(
  ( (V!416 (val!95 Int)) )
))
(declare-datatypes ((ValueCell!73 0))(
  ( (ValueCellFull!73 (v!1182 V!415)) (EmptyCell!73) )
))
(declare-datatypes ((array!293 0))(
  ( (array!294 (arr!139 (Array (_ BitVec 32) ValueCell!73)) (size!201 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!293)

(declare-fun minValue!1434 () V!415)

(declare-datatypes ((array!295 0))(
  ( (array!296 (arr!140 (Array (_ BitVec 32) (_ BitVec 64))) (size!202 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!295)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!415)

(declare-datatypes ((tuple2!74 0))(
  ( (tuple2!75 (_1!37 (_ BitVec 64)) (_2!37 V!415)) )
))
(declare-datatypes ((List!84 0))(
  ( (Nil!81) (Cons!80 (h!646 tuple2!74) (t!2211 List!84)) )
))
(declare-datatypes ((ListLongMap!79 0))(
  ( (ListLongMap!80 (toList!55 List!84)) )
))
(declare-fun contains!25 (ListLongMap!79 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!14 (array!295 array!293 (_ BitVec 32) (_ BitVec 32) V!415 V!415 (_ BitVec 32) Int) ListLongMap!79)

(assert (=> b!3994 (= lt!552 (contains!25 (getCurrentListMap!14 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun b!3995 () Bool)

(declare-fun res!5485 () Bool)

(assert (=> b!3995 (=> (not res!5485) (not e!2060))))

(assert (=> b!3995 (= res!5485 (and (= (size!201 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!202 _keys!1806) (size!201 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!227 () Bool)

(declare-fun mapRes!227 () Bool)

(declare-fun tp!520 () Bool)

(declare-fun e!2059 () Bool)

(assert (=> mapNonEmpty!227 (= mapRes!227 (and tp!520 e!2059))))

(declare-fun mapRest!227 () (Array (_ BitVec 32) ValueCell!73))

(declare-fun mapValue!227 () ValueCell!73)

(declare-fun mapKey!227 () (_ BitVec 32))

(assert (=> mapNonEmpty!227 (= (arr!139 _values!1492) (store mapRest!227 mapKey!227 mapValue!227))))

(declare-fun res!5487 () Bool)

(assert (=> start!628 (=> (not res!5487) (not e!2060))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!628 (= res!5487 (validMask!0 mask!2250))))

(assert (=> start!628 e!2060))

(assert (=> start!628 tp!521))

(assert (=> start!628 true))

(declare-fun e!2058 () Bool)

(declare-fun array_inv!101 (array!293) Bool)

(assert (=> start!628 (and (array_inv!101 _values!1492) e!2058)))

(declare-fun tp_is_empty!179 () Bool)

(assert (=> start!628 tp_is_empty!179))

(declare-fun array_inv!102 (array!295) Bool)

(assert (=> start!628 (array_inv!102 _keys!1806)))

(declare-fun b!3996 () Bool)

(declare-fun e!2056 () Bool)

(assert (=> b!3996 (= e!2056 tp_is_empty!179)))

(declare-fun mapIsEmpty!227 () Bool)

(assert (=> mapIsEmpty!227 mapRes!227))

(declare-fun b!3997 () Bool)

(declare-fun res!5486 () Bool)

(assert (=> b!3997 (=> (not res!5486) (not e!2060))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!295 (_ BitVec 32)) Bool)

(assert (=> b!3997 (= res!5486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!3998 () Bool)

(declare-fun res!5488 () Bool)

(assert (=> b!3998 (=> (not res!5488) (not e!2060))))

(declare-datatypes ((List!85 0))(
  ( (Nil!82) (Cons!81 (h!647 (_ BitVec 64)) (t!2212 List!85)) )
))
(declare-fun arrayNoDuplicates!0 (array!295 (_ BitVec 32) List!85) Bool)

(assert (=> b!3998 (= res!5488 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!82))))

(declare-fun b!3999 () Bool)

(assert (=> b!3999 (= e!2058 (and e!2056 mapRes!227))))

(declare-fun condMapEmpty!227 () Bool)

(declare-fun mapDefault!227 () ValueCell!73)

