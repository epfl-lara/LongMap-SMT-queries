; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93814 () Bool)

(assert start!93814)

(declare-fun b_free!21287 () Bool)

(declare-fun b_next!21287 () Bool)

(assert (=> start!93814 (= b_free!21287 (not b_next!21287))))

(declare-fun tp!75283 () Bool)

(declare-fun b_and!34001 () Bool)

(assert (=> start!93814 (= tp!75283 b_and!34001)))

(declare-fun b!1061075 () Bool)

(declare-fun e!604187 () Bool)

(declare-fun tp_is_empty!25097 () Bool)

(assert (=> b!1061075 (= e!604187 tp_is_empty!25097)))

(declare-fun b!1061076 () Bool)

(declare-fun e!604186 () Bool)

(declare-fun e!604185 () Bool)

(declare-fun mapRes!39316 () Bool)

(assert (=> b!1061076 (= e!604186 (and e!604185 mapRes!39316))))

(declare-fun condMapEmpty!39316 () Bool)

(declare-datatypes ((V!38597 0))(
  ( (V!38598 (val!12599 Int)) )
))
(declare-datatypes ((ValueCell!11845 0))(
  ( (ValueCellFull!11845 (v!15209 V!38597)) (EmptyCell!11845) )
))
(declare-datatypes ((array!67203 0))(
  ( (array!67204 (arr!32309 (Array (_ BitVec 32) ValueCell!11845)) (size!32845 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67203)

(declare-fun mapDefault!39316 () ValueCell!11845)

