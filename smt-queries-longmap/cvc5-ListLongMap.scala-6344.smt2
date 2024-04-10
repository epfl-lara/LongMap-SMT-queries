; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81770 () Bool)

(assert start!81770)

(declare-fun b!953820 () Bool)

(declare-fun res!638750 () Bool)

(declare-fun e!537326 () Bool)

(assert (=> b!953820 (=> (not res!638750) (not e!537326))))

(declare-datatypes ((array!57785 0))(
  ( (array!57786 (arr!27775 (Array (_ BitVec 32) (_ BitVec 64))) (size!28254 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57785)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57785 (_ BitVec 32)) Bool)

(assert (=> b!953820 (= res!638750 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun mapNonEmpty!33211 () Bool)

(declare-fun mapRes!33211 () Bool)

(declare-fun tp!63600 () Bool)

(declare-fun e!537327 () Bool)

(assert (=> mapNonEmpty!33211 (= mapRes!33211 (and tp!63600 e!537327))))

(declare-datatypes ((V!32769 0))(
  ( (V!32770 (val!10470 Int)) )
))
(declare-datatypes ((ValueCell!9938 0))(
  ( (ValueCellFull!9938 (v!13024 V!32769)) (EmptyCell!9938) )
))
(declare-fun mapRest!33211 () (Array (_ BitVec 32) ValueCell!9938))

(declare-fun mapValue!33211 () ValueCell!9938)

(declare-fun mapKey!33211 () (_ BitVec 32))

(declare-datatypes ((array!57787 0))(
  ( (array!57788 (arr!27776 (Array (_ BitVec 32) ValueCell!9938)) (size!28255 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57787)

(assert (=> mapNonEmpty!33211 (= (arr!27776 _values!1197) (store mapRest!33211 mapKey!33211 mapValue!33211))))

(declare-fun b!953821 () Bool)

(declare-fun tp_is_empty!20839 () Bool)

(assert (=> b!953821 (= e!537327 tp_is_empty!20839)))

(declare-fun b!953822 () Bool)

(declare-fun res!638752 () Bool)

(assert (=> b!953822 (=> (not res!638752) (not e!537326))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!953822 (= res!638752 (and (= (size!28255 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28254 _keys!1441) (size!28255 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!33211 () Bool)

(assert (=> mapIsEmpty!33211 mapRes!33211))

(declare-fun res!638751 () Bool)

(assert (=> start!81770 (=> (not res!638751) (not e!537326))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81770 (= res!638751 (validMask!0 mask!1823))))

(assert (=> start!81770 e!537326))

(assert (=> start!81770 true))

(declare-fun e!537328 () Bool)

(declare-fun array_inv!21563 (array!57787) Bool)

(assert (=> start!81770 (and (array_inv!21563 _values!1197) e!537328)))

(declare-fun array_inv!21564 (array!57785) Bool)

(assert (=> start!81770 (array_inv!21564 _keys!1441)))

(declare-fun b!953819 () Bool)

(declare-fun e!537325 () Bool)

(assert (=> b!953819 (= e!537328 (and e!537325 mapRes!33211))))

(declare-fun condMapEmpty!33211 () Bool)

(declare-fun mapDefault!33211 () ValueCell!9938)

