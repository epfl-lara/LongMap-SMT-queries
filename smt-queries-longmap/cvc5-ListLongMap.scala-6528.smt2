; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83052 () Bool)

(assert start!83052)

(declare-fun mapIsEmpty!34924 () Bool)

(declare-fun mapRes!34924 () Bool)

(assert (=> mapIsEmpty!34924 mapRes!34924))

(declare-fun b!968912 () Bool)

(declare-fun res!648578 () Bool)

(declare-fun e!546135 () Bool)

(assert (=> b!968912 (=> (not res!648578) (not e!546135))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34241 0))(
  ( (V!34242 (val!11022 Int)) )
))
(declare-datatypes ((ValueCell!10490 0))(
  ( (ValueCellFull!10490 (v!13581 V!34241)) (EmptyCell!10490) )
))
(declare-datatypes ((array!59959 0))(
  ( (array!59960 (arr!28843 (Array (_ BitVec 32) ValueCell!10490)) (size!29322 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59959)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!59961 0))(
  ( (array!59962 (arr!28844 (Array (_ BitVec 32) (_ BitVec 64))) (size!29323 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59961)

(assert (=> b!968912 (= res!648578 (and (= (size!29322 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29323 _keys!1717) (size!29322 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun res!648579 () Bool)

(assert (=> start!83052 (=> (not res!648579) (not e!546135))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83052 (= res!648579 (validMask!0 mask!2147))))

(assert (=> start!83052 e!546135))

(assert (=> start!83052 true))

(declare-fun e!546138 () Bool)

(declare-fun array_inv!22327 (array!59959) Bool)

(assert (=> start!83052 (and (array_inv!22327 _values!1425) e!546138)))

(declare-fun array_inv!22328 (array!59961) Bool)

(assert (=> start!83052 (array_inv!22328 _keys!1717)))

(declare-fun b!968913 () Bool)

(declare-fun res!648577 () Bool)

(assert (=> b!968913 (=> (not res!648577) (not e!546135))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59961 (_ BitVec 32)) Bool)

(assert (=> b!968913 (= res!648577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!968914 () Bool)

(declare-fun e!546139 () Bool)

(assert (=> b!968914 (= e!546138 (and e!546139 mapRes!34924))))

(declare-fun condMapEmpty!34924 () Bool)

(declare-fun mapDefault!34924 () ValueCell!10490)

