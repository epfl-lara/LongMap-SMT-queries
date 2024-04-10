; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108396 () Bool)

(assert start!108396)

(declare-fun b_free!27943 () Bool)

(declare-fun b_next!27943 () Bool)

(assert (=> start!108396 (= b_free!27943 (not b_next!27943))))

(declare-fun tp!98938 () Bool)

(declare-fun b_and!46003 () Bool)

(assert (=> start!108396 (= tp!98938 b_and!46003)))

(declare-fun b!1279320 () Bool)

(declare-fun e!730940 () Bool)

(declare-fun e!730938 () Bool)

(declare-fun mapRes!51926 () Bool)

(assert (=> b!1279320 (= e!730940 (and e!730938 mapRes!51926))))

(declare-fun condMapEmpty!51926 () Bool)

(declare-datatypes ((V!49881 0))(
  ( (V!49882 (val!16866 Int)) )
))
(declare-datatypes ((ValueCell!15893 0))(
  ( (ValueCellFull!15893 (v!19466 V!49881)) (EmptyCell!15893) )
))
(declare-datatypes ((array!84254 0))(
  ( (array!84255 (arr!40631 (Array (_ BitVec 32) ValueCell!15893)) (size!41181 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84254)

(declare-fun mapDefault!51926 () ValueCell!15893)

