; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82972 () Bool)

(assert start!82972)

(declare-fun res!648367 () Bool)

(declare-fun e!545770 () Bool)

(assert (=> start!82972 (=> (not res!648367) (not e!545770))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82972 (= res!648367 (validMask!0 mask!2147))))

(assert (=> start!82972 e!545770))

(assert (=> start!82972 true))

(declare-datatypes ((V!34193 0))(
  ( (V!34194 (val!11004 Int)) )
))
(declare-datatypes ((ValueCell!10472 0))(
  ( (ValueCellFull!10472 (v!13562 V!34193)) (EmptyCell!10472) )
))
(declare-datatypes ((array!59883 0))(
  ( (array!59884 (arr!28810 (Array (_ BitVec 32) ValueCell!10472)) (size!29289 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59883)

(declare-fun e!545773 () Bool)

(declare-fun array_inv!22301 (array!59883) Bool)

(assert (=> start!82972 (and (array_inv!22301 _values!1425) e!545773)))

(declare-datatypes ((array!59885 0))(
  ( (array!59886 (arr!28811 (Array (_ BitVec 32) (_ BitVec 64))) (size!29290 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59885)

(declare-fun array_inv!22302 (array!59885) Bool)

(assert (=> start!82972 (array_inv!22302 _keys!1717)))

(declare-fun b!968476 () Bool)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!968476 (= e!545770 (and (= (size!29289 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29290 _keys!1717) (size!29289 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011) (not (= (size!29290 _keys!1717) (bvadd #b00000000000000000000000000000001 mask!2147)))))))

(declare-fun b!968477 () Bool)

(declare-fun e!545771 () Bool)

(declare-fun mapRes!34855 () Bool)

(assert (=> b!968477 (= e!545773 (and e!545771 mapRes!34855))))

(declare-fun condMapEmpty!34855 () Bool)

(declare-fun mapDefault!34855 () ValueCell!10472)

