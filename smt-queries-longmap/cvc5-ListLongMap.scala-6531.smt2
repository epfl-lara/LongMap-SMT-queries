; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83070 () Bool)

(assert start!83070)

(declare-fun mapNonEmpty!34951 () Bool)

(declare-fun mapRes!34951 () Bool)

(declare-fun tp!66519 () Bool)

(declare-fun e!546273 () Bool)

(assert (=> mapNonEmpty!34951 (= mapRes!34951 (and tp!66519 e!546273))))

(declare-fun mapKey!34951 () (_ BitVec 32))

(declare-datatypes ((V!34265 0))(
  ( (V!34266 (val!11031 Int)) )
))
(declare-datatypes ((ValueCell!10499 0))(
  ( (ValueCellFull!10499 (v!13590 V!34265)) (EmptyCell!10499) )
))
(declare-fun mapValue!34951 () ValueCell!10499)

(declare-datatypes ((array!59995 0))(
  ( (array!59996 (arr!28861 (Array (_ BitVec 32) ValueCell!10499)) (size!29340 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59995)

(declare-fun mapRest!34951 () (Array (_ BitVec 32) ValueCell!10499))

(assert (=> mapNonEmpty!34951 (= (arr!28861 _values!1425) (store mapRest!34951 mapKey!34951 mapValue!34951))))

(declare-fun b!969074 () Bool)

(declare-fun tp_is_empty!21961 () Bool)

(assert (=> b!969074 (= e!546273 tp_is_empty!21961)))

(declare-fun mapIsEmpty!34951 () Bool)

(assert (=> mapIsEmpty!34951 mapRes!34951))

(declare-fun res!648659 () Bool)

(declare-fun e!546271 () Bool)

(assert (=> start!83070 (=> (not res!648659) (not e!546271))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83070 (= res!648659 (validMask!0 mask!2147))))

(assert (=> start!83070 e!546271))

(assert (=> start!83070 true))

(declare-fun e!546272 () Bool)

(declare-fun array_inv!22343 (array!59995) Bool)

(assert (=> start!83070 (and (array_inv!22343 _values!1425) e!546272)))

(declare-datatypes ((array!59997 0))(
  ( (array!59998 (arr!28862 (Array (_ BitVec 32) (_ BitVec 64))) (size!29341 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59997)

(declare-fun array_inv!22344 (array!59997) Bool)

(assert (=> start!83070 (array_inv!22344 _keys!1717)))

(declare-fun b!969075 () Bool)

(declare-fun e!546274 () Bool)

(assert (=> b!969075 (= e!546274 tp_is_empty!21961)))

(declare-fun b!969076 () Bool)

(declare-fun res!648660 () Bool)

(assert (=> b!969076 (=> (not res!648660) (not e!546271))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59997 (_ BitVec 32)) Bool)

(assert (=> b!969076 (= res!648660 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!969077 () Bool)

(assert (=> b!969077 (= e!546271 false)))

(declare-fun lt!431591 () Bool)

(declare-datatypes ((List!20014 0))(
  ( (Nil!20011) (Cons!20010 (h!21172 (_ BitVec 64)) (t!28377 List!20014)) )
))
(declare-fun arrayNoDuplicates!0 (array!59997 (_ BitVec 32) List!20014) Bool)

(assert (=> b!969077 (= lt!431591 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20011))))

(declare-fun b!969078 () Bool)

(declare-fun res!648658 () Bool)

(assert (=> b!969078 (=> (not res!648658) (not e!546271))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!969078 (= res!648658 (and (= (size!29340 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29341 _keys!1717) (size!29340 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!969079 () Bool)

(assert (=> b!969079 (= e!546272 (and e!546274 mapRes!34951))))

(declare-fun condMapEmpty!34951 () Bool)

(declare-fun mapDefault!34951 () ValueCell!10499)

