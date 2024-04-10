; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93708 () Bool)

(assert start!93708)

(declare-fun b_free!21193 () Bool)

(declare-fun b_next!21193 () Bool)

(assert (=> start!93708 (= b_free!21193 (not b_next!21193))))

(declare-fun tp!74999 () Bool)

(declare-fun b_and!33903 () Bool)

(assert (=> start!93708 (= tp!74999 b_and!33903)))

(declare-fun b!1060015 () Bool)

(declare-fun e!603435 () Bool)

(declare-fun tp_is_empty!25003 () Bool)

(assert (=> b!1060015 (= e!603435 tp_is_empty!25003)))

(declare-fun b!1060016 () Bool)

(declare-fun e!603432 () Bool)

(declare-fun mapRes!39172 () Bool)

(assert (=> b!1060016 (= e!603432 (and e!603435 mapRes!39172))))

(declare-fun condMapEmpty!39172 () Bool)

(declare-datatypes ((V!38473 0))(
  ( (V!38474 (val!12552 Int)) )
))
(declare-datatypes ((ValueCell!11798 0))(
  ( (ValueCellFull!11798 (v!15162 V!38473)) (EmptyCell!11798) )
))
(declare-datatypes ((array!67031 0))(
  ( (array!67032 (arr!32224 (Array (_ BitVec 32) ValueCell!11798)) (size!32760 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67031)

(declare-fun mapDefault!39172 () ValueCell!11798)

