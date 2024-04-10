; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40578 () Bool)

(assert start!40578)

(declare-fun b_free!10589 () Bool)

(declare-fun b_next!10589 () Bool)

(assert (=> start!40578 (= b_free!10589 (not b_next!10589))))

(declare-fun tp!37586 () Bool)

(declare-fun b_and!18597 () Bool)

(assert (=> start!40578 (= tp!37586 b_and!18597)))

(declare-fun b!447422 () Bool)

(declare-fun e!262720 () Bool)

(declare-fun tp_is_empty!11927 () Bool)

(assert (=> b!447422 (= e!262720 tp_is_empty!11927)))

(declare-fun b!447423 () Bool)

(declare-fun res!265721 () Bool)

(declare-fun e!262719 () Bool)

(assert (=> b!447423 (=> (not res!265721) (not e!262719))))

(declare-datatypes ((array!27661 0))(
  ( (array!27662 (arr!13276 (Array (_ BitVec 32) (_ BitVec 64))) (size!13628 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27661)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27661 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!447423 (= res!265721 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!447424 () Bool)

(declare-fun e!262723 () Bool)

(declare-fun mapRes!19524 () Bool)

(assert (=> b!447424 (= e!262723 (and e!262720 mapRes!19524))))

(declare-fun condMapEmpty!19524 () Bool)

(declare-datatypes ((V!17007 0))(
  ( (V!17008 (val!6008 Int)) )
))
(declare-datatypes ((ValueCell!5620 0))(
  ( (ValueCellFull!5620 (v!8263 V!17007)) (EmptyCell!5620) )
))
(declare-datatypes ((array!27663 0))(
  ( (array!27664 (arr!13277 (Array (_ BitVec 32) ValueCell!5620)) (size!13629 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27663)

(declare-fun mapDefault!19524 () ValueCell!5620)

