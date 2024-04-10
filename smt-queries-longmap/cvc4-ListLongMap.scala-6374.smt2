; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81984 () Bool)

(assert start!81984)

(declare-fun b!956239 () Bool)

(declare-fun e!538779 () Bool)

(declare-fun tp_is_empty!21023 () Bool)

(assert (=> b!956239 (= e!538779 tp_is_empty!21023)))

(declare-fun res!640300 () Bool)

(declare-fun e!538780 () Bool)

(assert (=> start!81984 (=> (not res!640300) (not e!538780))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81984 (= res!640300 (validMask!0 mask!1823))))

(assert (=> start!81984 e!538780))

(assert (=> start!81984 true))

(declare-datatypes ((V!33013 0))(
  ( (V!33014 (val!10562 Int)) )
))
(declare-datatypes ((ValueCell!10030 0))(
  ( (ValueCellFull!10030 (v!13117 V!33013)) (EmptyCell!10030) )
))
(declare-datatypes ((array!58145 0))(
  ( (array!58146 (arr!27952 (Array (_ BitVec 32) ValueCell!10030)) (size!28431 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58145)

(declare-fun e!538783 () Bool)

(declare-fun array_inv!21689 (array!58145) Bool)

(assert (=> start!81984 (and (array_inv!21689 _values!1197) e!538783)))

(declare-datatypes ((array!58147 0))(
  ( (array!58148 (arr!27953 (Array (_ BitVec 32) (_ BitVec 64))) (size!28432 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58147)

(declare-fun array_inv!21690 (array!58147) Bool)

(assert (=> start!81984 (array_inv!21690 _keys!1441)))

(declare-fun b!956240 () Bool)

(assert (=> b!956240 (= e!538780 false)))

(declare-fun lt!430112 () Bool)

(declare-datatypes ((List!19473 0))(
  ( (Nil!19470) (Cons!19469 (h!20631 (_ BitVec 64)) (t!27834 List!19473)) )
))
(declare-fun arrayNoDuplicates!0 (array!58147 (_ BitVec 32) List!19473) Bool)

(assert (=> b!956240 (= lt!430112 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19470))))

(declare-fun mapNonEmpty!33496 () Bool)

(declare-fun mapRes!33496 () Bool)

(declare-fun tp!64074 () Bool)

(assert (=> mapNonEmpty!33496 (= mapRes!33496 (and tp!64074 e!538779))))

(declare-fun mapRest!33496 () (Array (_ BitVec 32) ValueCell!10030))

(declare-fun mapKey!33496 () (_ BitVec 32))

(declare-fun mapValue!33496 () ValueCell!10030)

(assert (=> mapNonEmpty!33496 (= (arr!27952 _values!1197) (store mapRest!33496 mapKey!33496 mapValue!33496))))

(declare-fun b!956241 () Bool)

(declare-fun res!640301 () Bool)

(assert (=> b!956241 (=> (not res!640301) (not e!538780))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58147 (_ BitVec 32)) Bool)

(assert (=> b!956241 (= res!640301 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun mapIsEmpty!33496 () Bool)

(assert (=> mapIsEmpty!33496 mapRes!33496))

(declare-fun b!956242 () Bool)

(declare-fun e!538781 () Bool)

(assert (=> b!956242 (= e!538781 tp_is_empty!21023)))

(declare-fun b!956243 () Bool)

(assert (=> b!956243 (= e!538783 (and e!538781 mapRes!33496))))

(declare-fun condMapEmpty!33496 () Bool)

(declare-fun mapDefault!33496 () ValueCell!10030)

