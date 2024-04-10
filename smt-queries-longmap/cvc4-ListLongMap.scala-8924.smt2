; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108230 () Bool)

(assert start!108230)

(declare-fun b_free!27911 () Bool)

(declare-fun b_next!27911 () Bool)

(assert (=> start!108230 (= b_free!27911 (not b_next!27911))))

(declare-fun tp!98693 () Bool)

(declare-fun b_and!45971 () Bool)

(assert (=> start!108230 (= tp!98693 b_and!45971)))

(declare-fun b!1277983 () Bool)

(declare-fun e!729918 () Bool)

(declare-fun e!729919 () Bool)

(declare-fun mapRes!51728 () Bool)

(assert (=> b!1277983 (= e!729918 (and e!729919 mapRes!51728))))

(declare-fun condMapEmpty!51728 () Bool)

(declare-datatypes ((V!49717 0))(
  ( (V!49718 (val!16805 Int)) )
))
(declare-datatypes ((ValueCell!15832 0))(
  ( (ValueCellFull!15832 (v!19404 V!49717)) (EmptyCell!15832) )
))
(declare-datatypes ((array!84012 0))(
  ( (array!84013 (arr!40515 (Array (_ BitVec 32) ValueCell!15832)) (size!41065 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!84012)

(declare-fun mapDefault!51728 () ValueCell!15832)

