; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100082 () Bool)

(assert start!100082)

(declare-fun b_free!25661 () Bool)

(declare-fun b_next!25661 () Bool)

(assert (=> start!100082 (= b_free!25661 (not b_next!25661))))

(declare-fun tp!89697 () Bool)

(declare-fun b_and!42189 () Bool)

(assert (=> start!100082 (= tp!89697 b_and!42189)))

(declare-fun b!1193207 () Bool)

(declare-fun e!678173 () Bool)

(declare-fun e!678174 () Bool)

(declare-fun mapRes!47114 () Bool)

(assert (=> b!1193207 (= e!678173 (and e!678174 mapRes!47114))))

(declare-fun condMapEmpty!47114 () Bool)

(declare-datatypes ((V!45381 0))(
  ( (V!45382 (val!15152 Int)) )
))
(declare-datatypes ((ValueCell!14386 0))(
  ( (ValueCellFull!14386 (v!17790 V!45381)) (EmptyCell!14386) )
))
(declare-datatypes ((array!77163 0))(
  ( (array!77164 (arr!37231 (Array (_ BitVec 32) ValueCell!14386)) (size!37767 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77163)

(declare-fun mapDefault!47114 () ValueCell!14386)

