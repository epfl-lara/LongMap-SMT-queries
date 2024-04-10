; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93798 () Bool)

(assert start!93798)

(declare-fun b_free!21271 () Bool)

(declare-fun b_next!21271 () Bool)

(assert (=> start!93798 (= b_free!21271 (not b_next!21271))))

(declare-fun tp!75236 () Bool)

(declare-fun b_and!33985 () Bool)

(assert (=> start!93798 (= tp!75236 b_and!33985)))

(declare-fun b!1060907 () Bool)

(declare-fun e!604064 () Bool)

(declare-fun e!604066 () Bool)

(declare-fun mapRes!39292 () Bool)

(assert (=> b!1060907 (= e!604064 (and e!604066 mapRes!39292))))

(declare-fun condMapEmpty!39292 () Bool)

(declare-datatypes ((V!38577 0))(
  ( (V!38578 (val!12591 Int)) )
))
(declare-datatypes ((ValueCell!11837 0))(
  ( (ValueCellFull!11837 (v!15201 V!38577)) (EmptyCell!11837) )
))
(declare-datatypes ((array!67173 0))(
  ( (array!67174 (arr!32294 (Array (_ BitVec 32) ValueCell!11837)) (size!32830 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67173)

(declare-fun mapDefault!39292 () ValueCell!11837)

