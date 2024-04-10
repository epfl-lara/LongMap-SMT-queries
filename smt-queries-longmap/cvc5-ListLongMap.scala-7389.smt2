; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94096 () Bool)

(assert start!94096)

(declare-fun b_free!21511 () Bool)

(declare-fun b_next!21511 () Bool)

(assert (=> start!94096 (= b_free!21511 (not b_next!21511))))

(declare-fun tp!75964 () Bool)

(declare-fun b_and!34253 () Bool)

(assert (=> start!94096 (= tp!75964 b_and!34253)))

(declare-fun b!1064159 () Bool)

(declare-fun e!606456 () Bool)

(declare-fun e!606455 () Bool)

(declare-fun mapRes!39661 () Bool)

(assert (=> b!1064159 (= e!606456 (and e!606455 mapRes!39661))))

(declare-fun condMapEmpty!39661 () Bool)

(declare-datatypes ((V!38897 0))(
  ( (V!38898 (val!12711 Int)) )
))
(declare-datatypes ((ValueCell!11957 0))(
  ( (ValueCellFull!11957 (v!15323 V!38897)) (EmptyCell!11957) )
))
(declare-datatypes ((array!67637 0))(
  ( (array!67638 (arr!32523 (Array (_ BitVec 32) ValueCell!11957)) (size!33059 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67637)

(declare-fun mapDefault!39661 () ValueCell!11957)

