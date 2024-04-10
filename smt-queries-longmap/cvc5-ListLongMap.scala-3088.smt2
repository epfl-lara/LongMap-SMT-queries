; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43468 () Bool)

(assert start!43468)

(declare-fun b_free!12247 () Bool)

(declare-fun b_next!12247 () Bool)

(assert (=> start!43468 (= b_free!12247 (not b_next!12247))))

(declare-fun tp!43023 () Bool)

(declare-fun b_and!21007 () Bool)

(assert (=> start!43468 (= tp!43023 b_and!21007)))

(declare-fun b!481549 () Bool)

(declare-fun e!283333 () Bool)

(declare-fun tp_is_empty!13759 () Bool)

(assert (=> b!481549 (= e!283333 tp_is_empty!13759)))

(declare-fun b!481550 () Bool)

(declare-fun e!283334 () Bool)

(assert (=> b!481550 (= e!283334 tp_is_empty!13759)))

(declare-fun b!481551 () Bool)

(declare-fun res!287084 () Bool)

(declare-fun e!283335 () Bool)

(assert (=> b!481551 (=> (not res!287084) (not e!283335))))

(declare-datatypes ((array!31181 0))(
  ( (array!31182 (arr!14993 (Array (_ BitVec 32) (_ BitVec 64))) (size!15351 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31181)

(declare-datatypes ((List!9169 0))(
  ( (Nil!9166) (Cons!9165 (h!10021 (_ BitVec 64)) (t!15383 List!9169)) )
))
(declare-fun arrayNoDuplicates!0 (array!31181 (_ BitVec 32) List!9169) Bool)

(assert (=> b!481551 (= res!287084 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9166))))

(declare-fun b!481552 () Bool)

(declare-fun res!287088 () Bool)

(assert (=> b!481552 (=> (not res!287088) (not e!283335))))

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!481552 (= res!287088 (validKeyInArray!0 k!1332))))

(declare-fun b!481553 () Bool)

(declare-fun e!283331 () Bool)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!481553 (= e!283331 (ite (= k!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!481554 () Bool)

(declare-fun e!283332 () Bool)

(declare-fun mapRes!22348 () Bool)

(assert (=> b!481554 (= e!283332 (and e!283333 mapRes!22348))))

(declare-fun condMapEmpty!22348 () Bool)

(declare-datatypes ((V!19417 0))(
  ( (V!19418 (val!6927 Int)) )
))
(declare-datatypes ((ValueCell!6518 0))(
  ( (ValueCellFull!6518 (v!9220 V!19417)) (EmptyCell!6518) )
))
(declare-datatypes ((array!31183 0))(
  ( (array!31184 (arr!14994 (Array (_ BitVec 32) ValueCell!6518)) (size!15352 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31183)

(declare-fun mapDefault!22348 () ValueCell!6518)

