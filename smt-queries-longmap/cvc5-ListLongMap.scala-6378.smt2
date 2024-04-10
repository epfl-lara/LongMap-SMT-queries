; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82004 () Bool)

(assert start!82004)

(declare-fun res!640391 () Bool)

(declare-fun e!538933 () Bool)

(assert (=> start!82004 (=> (not res!640391) (not e!538933))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82004 (= res!640391 (validMask!0 mask!1823))))

(assert (=> start!82004 e!538933))

(assert (=> start!82004 true))

(declare-datatypes ((V!33041 0))(
  ( (V!33042 (val!10572 Int)) )
))
(declare-datatypes ((ValueCell!10040 0))(
  ( (ValueCellFull!10040 (v!13127 V!33041)) (EmptyCell!10040) )
))
(declare-datatypes ((array!58183 0))(
  ( (array!58184 (arr!27971 (Array (_ BitVec 32) ValueCell!10040)) (size!28450 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58183)

(declare-fun e!538929 () Bool)

(declare-fun array_inv!21701 (array!58183) Bool)

(assert (=> start!82004 (and (array_inv!21701 _values!1197) e!538929)))

(declare-datatypes ((array!58185 0))(
  ( (array!58186 (arr!27972 (Array (_ BitVec 32) (_ BitVec 64))) (size!28451 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58185)

(declare-fun array_inv!21702 (array!58185) Bool)

(assert (=> start!82004 (array_inv!21702 _keys!1441)))

(declare-fun mapNonEmpty!33526 () Bool)

(declare-fun mapRes!33526 () Bool)

(declare-fun tp!64104 () Bool)

(declare-fun e!538930 () Bool)

(assert (=> mapNonEmpty!33526 (= mapRes!33526 (and tp!64104 e!538930))))

(declare-fun mapValue!33526 () ValueCell!10040)

(declare-fun mapRest!33526 () (Array (_ BitVec 32) ValueCell!10040))

(declare-fun mapKey!33526 () (_ BitVec 32))

(assert (=> mapNonEmpty!33526 (= (arr!27971 _values!1197) (store mapRest!33526 mapKey!33526 mapValue!33526))))

(declare-fun b!956419 () Bool)

(declare-fun e!538931 () Bool)

(assert (=> b!956419 (= e!538929 (and e!538931 mapRes!33526))))

(declare-fun condMapEmpty!33526 () Bool)

(declare-fun mapDefault!33526 () ValueCell!10040)

