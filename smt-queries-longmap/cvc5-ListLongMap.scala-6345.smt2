; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81784 () Bool)

(assert start!81784)

(declare-fun res!638787 () Bool)

(declare-fun e!537385 () Bool)

(assert (=> start!81784 (=> (not res!638787) (not e!537385))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81784 (= res!638787 (validMask!0 mask!1823))))

(assert (=> start!81784 e!537385))

(assert (=> start!81784 true))

(declare-datatypes ((V!32777 0))(
  ( (V!32778 (val!10473 Int)) )
))
(declare-datatypes ((ValueCell!9941 0))(
  ( (ValueCellFull!9941 (v!13027 V!32777)) (EmptyCell!9941) )
))
(declare-datatypes ((array!57799 0))(
  ( (array!57800 (arr!27781 (Array (_ BitVec 32) ValueCell!9941)) (size!28260 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57799)

(declare-fun e!537387 () Bool)

(declare-fun array_inv!21567 (array!57799) Bool)

(assert (=> start!81784 (and (array_inv!21567 _values!1197) e!537387)))

(declare-datatypes ((array!57801 0))(
  ( (array!57802 (arr!27782 (Array (_ BitVec 32) (_ BitVec 64))) (size!28261 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57801)

(declare-fun array_inv!21568 (array!57801) Bool)

(assert (=> start!81784 (array_inv!21568 _keys!1441)))

(declare-fun b!953895 () Bool)

(declare-fun res!638786 () Bool)

(assert (=> b!953895 (=> (not res!638786) (not e!537385))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57801 (_ BitVec 32)) Bool)

(assert (=> b!953895 (= res!638786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun mapIsEmpty!33223 () Bool)

(declare-fun mapRes!33223 () Bool)

(assert (=> mapIsEmpty!33223 mapRes!33223))

(declare-fun b!953896 () Bool)

(declare-fun res!638788 () Bool)

(assert (=> b!953896 (=> (not res!638788) (not e!537385))))

(assert (=> b!953896 (= res!638788 (and (bvsle #b00000000000000000000000000000000 (size!28261 _keys!1441)) (bvslt (size!28261 _keys!1441) #b01111111111111111111111111111111)))))

(declare-fun b!953897 () Bool)

(declare-fun e!537388 () Bool)

(declare-fun tp_is_empty!20845 () Bool)

(assert (=> b!953897 (= e!537388 tp_is_empty!20845)))

(declare-fun mapNonEmpty!33223 () Bool)

(declare-fun tp!63612 () Bool)

(declare-fun e!537386 () Bool)

(assert (=> mapNonEmpty!33223 (= mapRes!33223 (and tp!63612 e!537386))))

(declare-fun mapKey!33223 () (_ BitVec 32))

(declare-fun mapValue!33223 () ValueCell!9941)

(declare-fun mapRest!33223 () (Array (_ BitVec 32) ValueCell!9941))

(assert (=> mapNonEmpty!33223 (= (arr!27781 _values!1197) (store mapRest!33223 mapKey!33223 mapValue!33223))))

(declare-fun b!953898 () Bool)

(assert (=> b!953898 (= e!537386 tp_is_empty!20845)))

(declare-fun b!953899 () Bool)

(declare-fun res!638785 () Bool)

(assert (=> b!953899 (=> (not res!638785) (not e!537385))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!953899 (= res!638785 (and (= (size!28260 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28261 _keys!1441) (size!28260 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!953900 () Bool)

(assert (=> b!953900 (= e!537387 (and e!537388 mapRes!33223))))

(declare-fun condMapEmpty!33223 () Bool)

(declare-fun mapDefault!33223 () ValueCell!9941)

