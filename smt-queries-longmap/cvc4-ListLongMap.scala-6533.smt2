; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83086 () Bool)

(assert start!83086)

(declare-fun mapNonEmpty!34975 () Bool)

(declare-fun mapRes!34975 () Bool)

(declare-fun tp!66543 () Bool)

(declare-fun e!546394 () Bool)

(assert (=> mapNonEmpty!34975 (= mapRes!34975 (and tp!66543 e!546394))))

(declare-datatypes ((V!34285 0))(
  ( (V!34286 (val!11039 Int)) )
))
(declare-datatypes ((ValueCell!10507 0))(
  ( (ValueCellFull!10507 (v!13598 V!34285)) (EmptyCell!10507) )
))
(declare-datatypes ((array!60023 0))(
  ( (array!60024 (arr!28875 (Array (_ BitVec 32) ValueCell!10507)) (size!29354 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60023)

(declare-fun mapRest!34975 () (Array (_ BitVec 32) ValueCell!10507))

(declare-fun mapKey!34975 () (_ BitVec 32))

(declare-fun mapValue!34975 () ValueCell!10507)

(assert (=> mapNonEmpty!34975 (= (arr!28875 _values!1425) (store mapRest!34975 mapKey!34975 mapValue!34975))))

(declare-fun b!969218 () Bool)

(declare-fun e!546391 () Bool)

(assert (=> b!969218 (= e!546391 false)))

(declare-fun lt!431615 () Bool)

(declare-datatypes ((array!60025 0))(
  ( (array!60026 (arr!28876 (Array (_ BitVec 32) (_ BitVec 64))) (size!29355 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60025)

(declare-datatypes ((List!20019 0))(
  ( (Nil!20016) (Cons!20015 (h!21177 (_ BitVec 64)) (t!28382 List!20019)) )
))
(declare-fun arrayNoDuplicates!0 (array!60025 (_ BitVec 32) List!20019) Bool)

(assert (=> b!969218 (= lt!431615 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20016))))

(declare-fun res!648730 () Bool)

(assert (=> start!83086 (=> (not res!648730) (not e!546391))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83086 (= res!648730 (validMask!0 mask!2147))))

(assert (=> start!83086 e!546391))

(assert (=> start!83086 true))

(declare-fun e!546393 () Bool)

(declare-fun array_inv!22353 (array!60023) Bool)

(assert (=> start!83086 (and (array_inv!22353 _values!1425) e!546393)))

(declare-fun array_inv!22354 (array!60025) Bool)

(assert (=> start!83086 (array_inv!22354 _keys!1717)))

(declare-fun b!969219 () Bool)

(declare-fun res!648732 () Bool)

(assert (=> b!969219 (=> (not res!648732) (not e!546391))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!969219 (= res!648732 (and (= (size!29354 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29355 _keys!1717) (size!29354 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!34975 () Bool)

(assert (=> mapIsEmpty!34975 mapRes!34975))

(declare-fun b!969220 () Bool)

(declare-fun tp_is_empty!21977 () Bool)

(assert (=> b!969220 (= e!546394 tp_is_empty!21977)))

(declare-fun b!969221 () Bool)

(declare-fun e!546390 () Bool)

(assert (=> b!969221 (= e!546393 (and e!546390 mapRes!34975))))

(declare-fun condMapEmpty!34975 () Bool)

(declare-fun mapDefault!34975 () ValueCell!10507)

