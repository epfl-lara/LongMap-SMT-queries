; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93920 () Bool)

(assert start!93920)

(declare-fun b_free!21379 () Bool)

(declare-fun b_next!21379 () Bool)

(assert (=> start!93920 (= b_free!21379 (not b_next!21379))))

(declare-fun tp!75562 () Bool)

(declare-fun b_and!34101 () Bool)

(assert (=> start!93920 (= tp!75562 b_and!34101)))

(declare-fun mapIsEmpty!39457 () Bool)

(declare-fun mapRes!39457 () Bool)

(assert (=> mapIsEmpty!39457 mapRes!39457))

(declare-fun b!1062193 () Bool)

(declare-fun e!604997 () Bool)

(declare-fun e!605001 () Bool)

(assert (=> b!1062193 (= e!604997 (and e!605001 mapRes!39457))))

(declare-fun condMapEmpty!39457 () Bool)

(declare-datatypes ((V!38721 0))(
  ( (V!38722 (val!12645 Int)) )
))
(declare-datatypes ((ValueCell!11891 0))(
  ( (ValueCellFull!11891 (v!15255 V!38721)) (EmptyCell!11891) )
))
(declare-datatypes ((array!67383 0))(
  ( (array!67384 (arr!32398 (Array (_ BitVec 32) ValueCell!11891)) (size!32934 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67383)

(declare-fun mapDefault!39457 () ValueCell!11891)

