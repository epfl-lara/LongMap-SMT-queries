; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82990 () Bool)

(assert start!82990)

(declare-fun b!968560 () Bool)

(declare-fun e!545869 () Bool)

(declare-datatypes ((array!59909 0))(
  ( (array!59910 (arr!28822 (Array (_ BitVec 32) (_ BitVec 64))) (size!29301 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59909)

(assert (=> b!968560 (= e!545869 (bvsgt #b00000000000000000000000000000000 (size!29301 _keys!1717)))))

(declare-fun res!648390 () Bool)

(assert (=> start!82990 (=> (not res!648390) (not e!545869))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82990 (= res!648390 (validMask!0 mask!2147))))

(assert (=> start!82990 e!545869))

(assert (=> start!82990 true))

(declare-datatypes ((V!34209 0))(
  ( (V!34210 (val!11010 Int)) )
))
(declare-datatypes ((ValueCell!10478 0))(
  ( (ValueCellFull!10478 (v!13568 V!34209)) (EmptyCell!10478) )
))
(declare-datatypes ((array!59911 0))(
  ( (array!59912 (arr!28823 (Array (_ BitVec 32) ValueCell!10478)) (size!29302 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59911)

(declare-fun e!545867 () Bool)

(declare-fun array_inv!22313 (array!59911) Bool)

(assert (=> start!82990 (and (array_inv!22313 _values!1425) e!545867)))

(declare-fun array_inv!22314 (array!59909) Bool)

(assert (=> start!82990 (array_inv!22314 _keys!1717)))

(declare-fun b!968561 () Bool)

(declare-fun e!545866 () Bool)

(declare-fun mapRes!34876 () Bool)

(assert (=> b!968561 (= e!545867 (and e!545866 mapRes!34876))))

(declare-fun condMapEmpty!34876 () Bool)

(declare-fun mapDefault!34876 () ValueCell!10478)

