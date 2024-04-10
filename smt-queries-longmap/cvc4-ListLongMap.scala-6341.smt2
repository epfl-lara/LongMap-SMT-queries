; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81742 () Bool)

(assert start!81742)

(declare-fun mapIsEmpty!33184 () Bool)

(declare-fun mapRes!33184 () Bool)

(assert (=> mapIsEmpty!33184 mapRes!33184))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-fun e!537200 () Bool)

(declare-datatypes ((array!57753 0))(
  ( (array!57754 (arr!27761 (Array (_ BitVec 32) (_ BitVec 64))) (size!28240 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57753)

(declare-datatypes ((V!32749 0))(
  ( (V!32750 (val!10463 Int)) )
))
(declare-datatypes ((ValueCell!9931 0))(
  ( (ValueCellFull!9931 (v!13017 V!32749)) (EmptyCell!9931) )
))
(declare-datatypes ((array!57755 0))(
  ( (array!57756 (arr!27762 (Array (_ BitVec 32) ValueCell!9931)) (size!28241 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57755)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun b!953685 () Bool)

(assert (=> b!953685 (= e!537200 (and (= (size!28241 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28240 _keys!1441) (size!28241 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011) (not (= (size!28240 _keys!1441) (bvadd #b00000000000000000000000000000001 mask!1823)))))))

(declare-fun res!638701 () Bool)

(assert (=> start!81742 (=> (not res!638701) (not e!537200))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81742 (= res!638701 (validMask!0 mask!1823))))

(assert (=> start!81742 e!537200))

(assert (=> start!81742 true))

(declare-fun e!537203 () Bool)

(declare-fun array_inv!21551 (array!57755) Bool)

(assert (=> start!81742 (and (array_inv!21551 _values!1197) e!537203)))

(declare-fun array_inv!21552 (array!57753) Bool)

(assert (=> start!81742 (array_inv!21552 _keys!1441)))

(declare-fun b!953686 () Bool)

(declare-fun e!537202 () Bool)

(assert (=> b!953686 (= e!537203 (and e!537202 mapRes!33184))))

(declare-fun condMapEmpty!33184 () Bool)

(declare-fun mapDefault!33184 () ValueCell!9931)

