; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81756 () Bool)

(assert start!81756)

(declare-fun b!953745 () Bool)

(declare-fun res!638717 () Bool)

(declare-fun e!537266 () Bool)

(assert (=> b!953745 (=> (not res!638717) (not e!537266))))

(declare-datatypes ((array!57771 0))(
  ( (array!57772 (arr!27769 (Array (_ BitVec 32) (_ BitVec 64))) (size!28248 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57771)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57771 (_ BitVec 32)) Bool)

(assert (=> b!953745 (= res!638717 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!953746 () Bool)

(declare-fun res!638719 () Bool)

(assert (=> b!953746 (=> (not res!638719) (not e!537266))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((V!32761 0))(
  ( (V!32762 (val!10467 Int)) )
))
(declare-datatypes ((ValueCell!9935 0))(
  ( (ValueCellFull!9935 (v!13021 V!32761)) (EmptyCell!9935) )
))
(declare-datatypes ((array!57773 0))(
  ( (array!57774 (arr!27770 (Array (_ BitVec 32) ValueCell!9935)) (size!28249 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57773)

(assert (=> b!953746 (= res!638719 (and (= (size!28249 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28248 _keys!1441) (size!28249 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!953747 () Bool)

(declare-fun e!537265 () Bool)

(declare-fun e!537268 () Bool)

(declare-fun mapRes!33199 () Bool)

(assert (=> b!953747 (= e!537265 (and e!537268 mapRes!33199))))

(declare-fun condMapEmpty!33199 () Bool)

(declare-fun mapDefault!33199 () ValueCell!9935)

