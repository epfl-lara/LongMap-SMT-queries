; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20124 () Bool)

(assert start!20124)

(declare-fun b_free!4783 () Bool)

(declare-fun b_next!4783 () Bool)

(assert (=> start!20124 (= b_free!4783 (not b_next!4783))))

(declare-fun tp!17381 () Bool)

(declare-fun b_and!11529 () Bool)

(assert (=> start!20124 (= tp!17381 b_and!11529)))

(declare-fun b!197294 () Bool)

(declare-fun res!93287 () Bool)

(declare-fun e!129854 () Bool)

(assert (=> b!197294 (=> (not res!93287) (not e!129854))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!5833 0))(
  ( (V!5834 (val!2364 Int)) )
))
(declare-datatypes ((ValueCell!1976 0))(
  ( (ValueCellFull!1976 (v!4334 V!5833)) (EmptyCell!1976) )
))
(declare-datatypes ((array!8531 0))(
  ( (array!8532 (arr!4016 (Array (_ BitVec 32) ValueCell!1976)) (size!4341 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8531)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((array!8533 0))(
  ( (array!8534 (arr!4017 (Array (_ BitVec 32) (_ BitVec 64))) (size!4342 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8533)

(assert (=> b!197294 (= res!93287 (and (= (size!4341 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4342 _keys!825) (size!4341 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!197295 () Bool)

(declare-fun e!129853 () Bool)

(declare-fun e!129851 () Bool)

(declare-fun mapRes!8027 () Bool)

(assert (=> b!197295 (= e!129853 (and e!129851 mapRes!8027))))

(declare-fun condMapEmpty!8027 () Bool)

(declare-fun mapDefault!8027 () ValueCell!1976)

