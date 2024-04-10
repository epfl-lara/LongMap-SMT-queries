; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81744 () Bool)

(assert start!81744)

(declare-fun b!953697 () Bool)

(declare-fun e!537218 () Bool)

(declare-fun tp_is_empty!20827 () Bool)

(assert (=> b!953697 (= e!537218 tp_is_empty!20827)))

(declare-fun b!953698 () Bool)

(declare-fun e!537216 () Bool)

(assert (=> b!953698 (= e!537216 tp_is_empty!20827)))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-fun b!953699 () Bool)

(declare-fun e!537214 () Bool)

(declare-datatypes ((array!57757 0))(
  ( (array!57758 (arr!27763 (Array (_ BitVec 32) (_ BitVec 64))) (size!28242 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57757)

(declare-datatypes ((V!32753 0))(
  ( (V!32754 (val!10464 Int)) )
))
(declare-datatypes ((ValueCell!9932 0))(
  ( (ValueCellFull!9932 (v!13018 V!32753)) (EmptyCell!9932) )
))
(declare-datatypes ((array!57759 0))(
  ( (array!57760 (arr!27764 (Array (_ BitVec 32) ValueCell!9932)) (size!28243 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57759)

(declare-fun mask!1823 () (_ BitVec 32))

(assert (=> b!953699 (= e!537214 (and (= (size!28243 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28242 _keys!1441) (size!28243 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011) (= (size!28242 _keys!1441) (bvadd #b00000000000000000000000000000001 mask!1823)) (bvsgt #b00000000000000000000000000000000 (size!28242 _keys!1441))))))

(declare-fun res!638704 () Bool)

(assert (=> start!81744 (=> (not res!638704) (not e!537214))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81744 (= res!638704 (validMask!0 mask!1823))))

(assert (=> start!81744 e!537214))

(assert (=> start!81744 true))

(declare-fun e!537215 () Bool)

(declare-fun array_inv!21553 (array!57759) Bool)

(assert (=> start!81744 (and (array_inv!21553 _values!1197) e!537215)))

(declare-fun array_inv!21554 (array!57757) Bool)

(assert (=> start!81744 (array_inv!21554 _keys!1441)))

(declare-fun mapIsEmpty!33187 () Bool)

(declare-fun mapRes!33187 () Bool)

(assert (=> mapIsEmpty!33187 mapRes!33187))

(declare-fun mapNonEmpty!33187 () Bool)

(declare-fun tp!63576 () Bool)

(assert (=> mapNonEmpty!33187 (= mapRes!33187 (and tp!63576 e!537216))))

(declare-fun mapRest!33187 () (Array (_ BitVec 32) ValueCell!9932))

(declare-fun mapKey!33187 () (_ BitVec 32))

(declare-fun mapValue!33187 () ValueCell!9932)

(assert (=> mapNonEmpty!33187 (= (arr!27764 _values!1197) (store mapRest!33187 mapKey!33187 mapValue!33187))))

(declare-fun b!953700 () Bool)

(assert (=> b!953700 (= e!537215 (and e!537218 mapRes!33187))))

(declare-fun condMapEmpty!33187 () Bool)

(declare-fun mapDefault!33187 () ValueCell!9932)

