; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81738 () Bool)

(assert start!81738)

(declare-fun b!953661 () Bool)

(declare-fun e!537172 () Bool)

(declare-fun tp_is_empty!20821 () Bool)

(assert (=> b!953661 (= e!537172 tp_is_empty!20821)))

(declare-fun b!953662 () Bool)

(declare-fun e!537171 () Bool)

(assert (=> b!953662 (= e!537171 tp_is_empty!20821)))

(declare-fun b!953663 () Bool)

(declare-datatypes ((array!57745 0))(
  ( (array!57746 (arr!27757 (Array (_ BitVec 32) (_ BitVec 64))) (size!28236 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57745)

(declare-datatypes ((V!32745 0))(
  ( (V!32746 (val!10461 Int)) )
))
(declare-datatypes ((ValueCell!9929 0))(
  ( (ValueCellFull!9929 (v!13015 V!32745)) (EmptyCell!9929) )
))
(declare-datatypes ((array!57747 0))(
  ( (array!57748 (arr!27758 (Array (_ BitVec 32) ValueCell!9929)) (size!28237 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57747)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-fun e!537170 () Bool)

(assert (=> b!953663 (= e!537170 (and (= (size!28237 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28236 _keys!1441) (size!28237 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011) (not (= (size!28236 _keys!1441) (bvadd #b00000000000000000000000000000001 mask!1823)))))))

(declare-fun res!638695 () Bool)

(assert (=> start!81738 (=> (not res!638695) (not e!537170))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81738 (= res!638695 (validMask!0 mask!1823))))

(assert (=> start!81738 e!537170))

(assert (=> start!81738 true))

(declare-fun e!537169 () Bool)

(declare-fun array_inv!21547 (array!57747) Bool)

(assert (=> start!81738 (and (array_inv!21547 _values!1197) e!537169)))

(declare-fun array_inv!21548 (array!57745) Bool)

(assert (=> start!81738 (array_inv!21548 _keys!1441)))

(declare-fun b!953664 () Bool)

(declare-fun mapRes!33178 () Bool)

(assert (=> b!953664 (= e!537169 (and e!537172 mapRes!33178))))

(declare-fun condMapEmpty!33178 () Bool)

(declare-fun mapDefault!33178 () ValueCell!9929)

