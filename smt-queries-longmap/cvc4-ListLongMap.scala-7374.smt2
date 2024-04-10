; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93988 () Bool)

(assert start!93988)

(declare-fun b_free!21425 () Bool)

(declare-fun b_next!21425 () Bool)

(assert (=> start!93988 (= b_free!21425 (not b_next!21425))))

(declare-fun tp!75704 () Bool)

(declare-fun b_and!34157 () Bool)

(assert (=> start!93988 (= tp!75704 b_and!34157)))

(declare-fun b!1062971 () Bool)

(declare-fun e!605584 () Bool)

(declare-fun e!605579 () Bool)

(declare-fun mapRes!39529 () Bool)

(assert (=> b!1062971 (= e!605584 (and e!605579 mapRes!39529))))

(declare-fun condMapEmpty!39529 () Bool)

(declare-datatypes ((V!38781 0))(
  ( (V!38782 (val!12668 Int)) )
))
(declare-datatypes ((ValueCell!11914 0))(
  ( (ValueCellFull!11914 (v!15279 V!38781)) (EmptyCell!11914) )
))
(declare-datatypes ((array!67473 0))(
  ( (array!67474 (arr!32442 (Array (_ BitVec 32) ValueCell!11914)) (size!32978 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67473)

(declare-fun mapDefault!39529 () ValueCell!11914)

