; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81760 () Bool)

(assert start!81760)

(declare-fun res!638735 () Bool)

(declare-fun e!537297 () Bool)

(assert (=> start!81760 (=> (not res!638735) (not e!537297))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81760 (= res!638735 (validMask!0 mask!1823))))

(assert (=> start!81760 e!537297))

(assert (=> start!81760 true))

(declare-datatypes ((V!32765 0))(
  ( (V!32766 (val!10469 Int)) )
))
(declare-datatypes ((ValueCell!9937 0))(
  ( (ValueCellFull!9937 (v!13023 V!32765)) (EmptyCell!9937) )
))
(declare-datatypes ((array!57779 0))(
  ( (array!57780 (arr!27773 (Array (_ BitVec 32) ValueCell!9937)) (size!28252 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57779)

(declare-fun e!537296 () Bool)

(declare-fun array_inv!21561 (array!57779) Bool)

(assert (=> start!81760 (and (array_inv!21561 _values!1197) e!537296)))

(declare-datatypes ((array!57781 0))(
  ( (array!57782 (arr!27774 (Array (_ BitVec 32) (_ BitVec 64))) (size!28253 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57781)

(declare-fun array_inv!21562 (array!57781) Bool)

(assert (=> start!81760 (array_inv!21562 _keys!1441)))

(declare-fun mapNonEmpty!33205 () Bool)

(declare-fun mapRes!33205 () Bool)

(declare-fun tp!63594 () Bool)

(declare-fun e!537295 () Bool)

(assert (=> mapNonEmpty!33205 (= mapRes!33205 (and tp!63594 e!537295))))

(declare-fun mapKey!33205 () (_ BitVec 32))

(declare-fun mapRest!33205 () (Array (_ BitVec 32) ValueCell!9937))

(declare-fun mapValue!33205 () ValueCell!9937)

(assert (=> mapNonEmpty!33205 (= (arr!27773 _values!1197) (store mapRest!33205 mapKey!33205 mapValue!33205))))

(declare-fun b!953781 () Bool)

(declare-fun e!537298 () Bool)

(assert (=> b!953781 (= e!537296 (and e!537298 mapRes!33205))))

(declare-fun condMapEmpty!33205 () Bool)

(declare-fun mapDefault!33205 () ValueCell!9937)

