; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82976 () Bool)

(assert start!82976)

(declare-fun mapIsEmpty!34861 () Bool)

(declare-fun mapRes!34861 () Bool)

(assert (=> mapIsEmpty!34861 mapRes!34861))

(declare-fun res!648373 () Bool)

(declare-fun e!545804 () Bool)

(assert (=> start!82976 (=> (not res!648373) (not e!545804))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82976 (= res!648373 (validMask!0 mask!2147))))

(assert (=> start!82976 e!545804))

(assert (=> start!82976 true))

(declare-datatypes ((V!34197 0))(
  ( (V!34198 (val!11006 Int)) )
))
(declare-datatypes ((ValueCell!10474 0))(
  ( (ValueCellFull!10474 (v!13564 V!34197)) (EmptyCell!10474) )
))
(declare-datatypes ((array!59891 0))(
  ( (array!59892 (arr!28814 (Array (_ BitVec 32) ValueCell!10474)) (size!29293 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59891)

(declare-fun e!545800 () Bool)

(declare-fun array_inv!22305 (array!59891) Bool)

(assert (=> start!82976 (and (array_inv!22305 _values!1425) e!545800)))

(declare-datatypes ((array!59893 0))(
  ( (array!59894 (arr!28815 (Array (_ BitVec 32) (_ BitVec 64))) (size!29294 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59893)

(declare-fun array_inv!22306 (array!59893) Bool)

(assert (=> start!82976 (array_inv!22306 _keys!1717)))

(declare-fun b!968500 () Bool)

(declare-fun e!545802 () Bool)

(declare-fun tp_is_empty!21911 () Bool)

(assert (=> b!968500 (= e!545802 tp_is_empty!21911)))

(declare-fun b!968501 () Bool)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!968501 (= e!545804 (and (= (size!29293 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29294 _keys!1717) (size!29293 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011) (not (= (size!29294 _keys!1717) (bvadd #b00000000000000000000000000000001 mask!2147)))))))

(declare-fun mapNonEmpty!34861 () Bool)

(declare-fun tp!66429 () Bool)

(declare-fun e!545803 () Bool)

(assert (=> mapNonEmpty!34861 (= mapRes!34861 (and tp!66429 e!545803))))

(declare-fun mapValue!34861 () ValueCell!10474)

(declare-fun mapRest!34861 () (Array (_ BitVec 32) ValueCell!10474))

(declare-fun mapKey!34861 () (_ BitVec 32))

(assert (=> mapNonEmpty!34861 (= (arr!28814 _values!1425) (store mapRest!34861 mapKey!34861 mapValue!34861))))

(declare-fun b!968502 () Bool)

(assert (=> b!968502 (= e!545803 tp_is_empty!21911)))

(declare-fun b!968503 () Bool)

(assert (=> b!968503 (= e!545800 (and e!545802 mapRes!34861))))

(declare-fun condMapEmpty!34861 () Bool)

(declare-fun mapDefault!34861 () ValueCell!10474)

