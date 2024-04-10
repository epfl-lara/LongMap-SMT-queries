; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81748 () Bool)

(assert start!81748)

(declare-fun res!638710 () Bool)

(declare-fun e!537244 () Bool)

(assert (=> start!81748 (=> (not res!638710) (not e!537244))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81748 (= res!638710 (validMask!0 mask!1823))))

(assert (=> start!81748 e!537244))

(assert (=> start!81748 true))

(declare-datatypes ((V!32757 0))(
  ( (V!32758 (val!10466 Int)) )
))
(declare-datatypes ((ValueCell!9934 0))(
  ( (ValueCellFull!9934 (v!13020 V!32757)) (EmptyCell!9934) )
))
(declare-datatypes ((array!57765 0))(
  ( (array!57766 (arr!27767 (Array (_ BitVec 32) ValueCell!9934)) (size!28246 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57765)

(declare-fun e!537248 () Bool)

(declare-fun array_inv!21557 (array!57765) Bool)

(assert (=> start!81748 (and (array_inv!21557 _values!1197) e!537248)))

(declare-datatypes ((array!57767 0))(
  ( (array!57768 (arr!27768 (Array (_ BitVec 32) (_ BitVec 64))) (size!28247 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57767)

(declare-fun array_inv!21558 (array!57767) Bool)

(assert (=> start!81748 (array_inv!21558 _keys!1441)))

(declare-fun b!953721 () Bool)

(declare-fun e!537245 () Bool)

(declare-fun tp_is_empty!20831 () Bool)

(assert (=> b!953721 (= e!537245 tp_is_empty!20831)))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-fun b!953722 () Bool)

(assert (=> b!953722 (= e!537244 (and (= (size!28246 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28247 _keys!1441) (size!28246 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011) (= (size!28247 _keys!1441) (bvadd #b00000000000000000000000000000001 mask!1823)) (bvsgt #b00000000000000000000000000000000 (size!28247 _keys!1441))))))

(declare-fun b!953723 () Bool)

(declare-fun e!537247 () Bool)

(assert (=> b!953723 (= e!537247 tp_is_empty!20831)))

(declare-fun b!953724 () Bool)

(declare-fun mapRes!33193 () Bool)

(assert (=> b!953724 (= e!537248 (and e!537245 mapRes!33193))))

(declare-fun condMapEmpty!33193 () Bool)

(declare-fun mapDefault!33193 () ValueCell!9934)

