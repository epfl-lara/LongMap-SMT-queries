; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108204 () Bool)

(assert start!108204)

(declare-fun b_free!27899 () Bool)

(declare-fun b_next!27899 () Bool)

(assert (=> start!108204 (= b_free!27899 (not b_next!27899))))

(declare-fun tp!98653 () Bool)

(declare-fun b_and!45957 () Bool)

(assert (=> start!108204 (= tp!98653 b_and!45957)))

(declare-fun b!1277739 () Bool)

(declare-fun e!729759 () Bool)

(declare-fun e!729757 () Bool)

(declare-fun mapRes!51707 () Bool)

(assert (=> b!1277739 (= e!729759 (and e!729757 mapRes!51707))))

(declare-fun condMapEmpty!51707 () Bool)

(declare-datatypes ((V!49701 0))(
  ( (V!49702 (val!16799 Int)) )
))
(declare-datatypes ((ValueCell!15826 0))(
  ( (ValueCellFull!15826 (v!19397 V!49701)) (EmptyCell!15826) )
))
(declare-datatypes ((array!83990 0))(
  ( (array!83991 (arr!40505 (Array (_ BitVec 32) ValueCell!15826)) (size!41055 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83990)

(declare-fun mapDefault!51707 () ValueCell!15826)

