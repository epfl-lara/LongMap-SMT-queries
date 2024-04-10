; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39598 () Bool)

(assert start!39598)

(declare-fun b_free!9865 () Bool)

(declare-fun b_next!9865 () Bool)

(assert (=> start!39598 (= b_free!9865 (not b_next!9865))))

(declare-fun tp!35124 () Bool)

(declare-fun b_and!17521 () Bool)

(assert (=> start!39598 (= tp!35124 b_and!17521)))

(declare-fun b!424209 () Bool)

(declare-fun res!248095 () Bool)

(declare-fun e!252043 () Bool)

(assert (=> b!424209 (=> (not res!248095) (not e!252043))))

(declare-datatypes ((array!25873 0))(
  ( (array!25874 (arr!12386 (Array (_ BitVec 32) (_ BitVec 64))) (size!12738 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25873)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25873 (_ BitVec 32)) Bool)

(assert (=> b!424209 (= res!248095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!424210 () Bool)

(declare-fun e!252044 () Bool)

(declare-fun tp_is_empty!11017 () Bool)

(assert (=> b!424210 (= e!252044 tp_is_empty!11017)))

(declare-fun b!424211 () Bool)

(declare-fun e!252047 () Bool)

(assert (=> b!424211 (= e!252047 tp_is_empty!11017)))

(declare-fun b!424212 () Bool)

(declare-fun res!248101 () Bool)

(declare-fun e!252046 () Bool)

(assert (=> b!424212 (=> (not res!248101) (not e!252046))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!424212 (= res!248101 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!18147 () Bool)

(declare-fun mapRes!18147 () Bool)

(assert (=> mapIsEmpty!18147 mapRes!18147))

(declare-fun b!424213 () Bool)

(declare-fun res!248103 () Bool)

(assert (=> b!424213 (=> (not res!248103) (not e!252043))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!424213 (= res!248103 (validKeyInArray!0 k!794))))

(declare-fun b!424214 () Bool)

(declare-fun res!248092 () Bool)

(assert (=> b!424214 (=> (not res!248092) (not e!252043))))

(declare-fun arrayContainsKey!0 (array!25873 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!424214 (= res!248092 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!424215 () Bool)

(declare-fun e!252048 () Bool)

(assert (=> b!424215 (= e!252048 (and e!252047 mapRes!18147))))

(declare-fun condMapEmpty!18147 () Bool)

(declare-datatypes ((V!15795 0))(
  ( (V!15796 (val!5553 Int)) )
))
(declare-datatypes ((ValueCell!5165 0))(
  ( (ValueCellFull!5165 (v!7800 V!15795)) (EmptyCell!5165) )
))
(declare-datatypes ((array!25875 0))(
  ( (array!25876 (arr!12387 (Array (_ BitVec 32) ValueCell!5165)) (size!12739 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25875)

(declare-fun mapDefault!18147 () ValueCell!5165)

