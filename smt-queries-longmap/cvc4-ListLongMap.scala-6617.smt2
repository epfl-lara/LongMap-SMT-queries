; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83648 () Bool)

(assert start!83648)

(declare-fun res!653994 () Bool)

(declare-fun e!550760 () Bool)

(assert (=> start!83648 (=> (not res!653994) (not e!550760))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83648 (= res!653994 (validMask!0 mask!1948))))

(assert (=> start!83648 e!550760))

(assert (=> start!83648 true))

(declare-datatypes ((V!34957 0))(
  ( (V!34958 (val!11291 Int)) )
))
(declare-datatypes ((ValueCell!10759 0))(
  ( (ValueCellFull!10759 (v!13852 V!34957)) (EmptyCell!10759) )
))
(declare-datatypes ((array!60991 0))(
  ( (array!60992 (arr!29356 (Array (_ BitVec 32) ValueCell!10759)) (size!29835 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!60991)

(declare-fun e!550761 () Bool)

(declare-fun array_inv!22695 (array!60991) Bool)

(assert (=> start!83648 (and (array_inv!22695 _values!1278) e!550761)))

(declare-datatypes ((array!60993 0))(
  ( (array!60994 (arr!29357 (Array (_ BitVec 32) (_ BitVec 64))) (size!29836 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!60993)

(declare-fun array_inv!22696 (array!60993) Bool)

(assert (=> start!83648 (array_inv!22696 _keys!1544)))

(declare-fun b!977096 () Bool)

(declare-fun e!550759 () Bool)

(declare-fun tp_is_empty!22481 () Bool)

(assert (=> b!977096 (= e!550759 tp_is_empty!22481)))

(declare-fun b!977097 () Bool)

(declare-fun e!550758 () Bool)

(declare-fun mapRes!35741 () Bool)

(assert (=> b!977097 (= e!550761 (and e!550758 mapRes!35741))))

(declare-fun condMapEmpty!35741 () Bool)

(declare-fun mapDefault!35741 () ValueCell!10759)

