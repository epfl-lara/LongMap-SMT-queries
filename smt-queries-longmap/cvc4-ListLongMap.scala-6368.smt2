; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81948 () Bool)

(assert start!81948)

(declare-fun mapNonEmpty!33442 () Bool)

(declare-fun mapRes!33442 () Bool)

(declare-fun tp!64020 () Bool)

(declare-fun e!538510 () Bool)

(assert (=> mapNonEmpty!33442 (= mapRes!33442 (and tp!64020 e!538510))))

(declare-fun mapKey!33442 () (_ BitVec 32))

(declare-datatypes ((V!32965 0))(
  ( (V!32966 (val!10544 Int)) )
))
(declare-datatypes ((ValueCell!10012 0))(
  ( (ValueCellFull!10012 (v!13099 V!32965)) (EmptyCell!10012) )
))
(declare-fun mapRest!33442 () (Array (_ BitVec 32) ValueCell!10012))

(declare-fun mapValue!33442 () ValueCell!10012)

(declare-datatypes ((array!58075 0))(
  ( (array!58076 (arr!27917 (Array (_ BitVec 32) ValueCell!10012)) (size!28396 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58075)

(assert (=> mapNonEmpty!33442 (= (arr!27917 _values!1197) (store mapRest!33442 mapKey!33442 mapValue!33442))))

(declare-fun res!640138 () Bool)

(declare-fun e!538513 () Bool)

(assert (=> start!81948 (=> (not res!640138) (not e!538513))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81948 (= res!640138 (validMask!0 mask!1823))))

(assert (=> start!81948 e!538513))

(assert (=> start!81948 true))

(declare-fun e!538512 () Bool)

(declare-fun array_inv!21663 (array!58075) Bool)

(assert (=> start!81948 (and (array_inv!21663 _values!1197) e!538512)))

(declare-datatypes ((array!58077 0))(
  ( (array!58078 (arr!27918 (Array (_ BitVec 32) (_ BitVec 64))) (size!28397 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58077)

(declare-fun array_inv!21664 (array!58077) Bool)

(assert (=> start!81948 (array_inv!21664 _keys!1441)))

(declare-fun b!955915 () Bool)

(declare-fun e!538511 () Bool)

(assert (=> b!955915 (= e!538512 (and e!538511 mapRes!33442))))

(declare-fun condMapEmpty!33442 () Bool)

(declare-fun mapDefault!33442 () ValueCell!10012)

