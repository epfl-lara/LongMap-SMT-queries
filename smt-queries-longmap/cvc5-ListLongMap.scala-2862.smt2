; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41228 () Bool)

(assert start!41228)

(declare-fun b_free!11071 () Bool)

(declare-fun b_next!11071 () Bool)

(assert (=> start!41228 (= b_free!11071 (not b_next!11071))))

(declare-fun tp!39051 () Bool)

(declare-fun b_and!19391 () Bool)

(assert (=> start!41228 (= tp!39051 b_and!19391)))

(declare-fun b!461094 () Bool)

(declare-fun e!268959 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((V!17651 0))(
  ( (V!17652 (val!6249 Int)) )
))
(declare-datatypes ((ValueCell!5861 0))(
  ( (ValueCellFull!5861 (v!8531 V!17651)) (EmptyCell!5861) )
))
(declare-datatypes ((array!28619 0))(
  ( (array!28620 (arr!13749 (Array (_ BitVec 32) ValueCell!5861)) (size!14101 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28619)

(assert (=> b!461094 (= e!268959 (bvslt i!563 (size!14101 _values!549)))))

(declare-fun b!461095 () Bool)

(declare-fun res!275747 () Bool)

(declare-fun e!268961 () Bool)

(assert (=> b!461095 (=> (not res!275747) (not e!268961))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!461095 (= res!275747 (bvsle from!863 i!563))))

(declare-fun b!461096 () Bool)

(declare-fun e!268962 () Bool)

(declare-fun e!268957 () Bool)

(declare-fun mapRes!20266 () Bool)

(assert (=> b!461096 (= e!268962 (and e!268957 mapRes!20266))))

(declare-fun condMapEmpty!20266 () Bool)

(declare-fun mapDefault!20266 () ValueCell!5861)

