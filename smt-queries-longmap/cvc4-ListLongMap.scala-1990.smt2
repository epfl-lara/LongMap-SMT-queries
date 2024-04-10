; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34828 () Bool)

(assert start!34828)

(declare-fun b_free!7613 () Bool)

(declare-fun b_next!7613 () Bool)

(assert (=> start!34828 (= b_free!7613 (not b_next!7613))))

(declare-fun tp!26405 () Bool)

(declare-fun b_and!14835 () Bool)

(assert (=> start!34828 (= tp!26405 b_and!14835)))

(declare-fun b!348674 () Bool)

(declare-fun res!193187 () Bool)

(declare-fun e!213614 () Bool)

(assert (=> b!348674 (=> (not res!193187) (not e!213614))))

(declare-datatypes ((array!18717 0))(
  ( (array!18718 (arr!8868 (Array (_ BitVec 32) (_ BitVec 64))) (size!9220 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18717)

(declare-datatypes ((List!5154 0))(
  ( (Nil!5151) (Cons!5150 (h!6006 (_ BitVec 64)) (t!10284 List!5154)) )
))
(declare-fun arrayNoDuplicates!0 (array!18717 (_ BitVec 32) List!5154) Bool)

(assert (=> b!348674 (= res!193187 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5151))))

(declare-fun b!348675 () Bool)

(declare-fun res!193190 () Bool)

(assert (=> b!348675 (=> (not res!193190) (not e!213614))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!348675 (= res!193190 (validKeyInArray!0 k!1348))))

(declare-fun b!348676 () Bool)

(declare-fun e!213610 () Bool)

(declare-fun e!213609 () Bool)

(declare-fun mapRes!12807 () Bool)

(assert (=> b!348676 (= e!213610 (and e!213609 mapRes!12807))))

(declare-fun condMapEmpty!12807 () Bool)

(declare-datatypes ((V!11063 0))(
  ( (V!11064 (val!3827 Int)) )
))
(declare-datatypes ((ValueCell!3439 0))(
  ( (ValueCellFull!3439 (v!6010 V!11063)) (EmptyCell!3439) )
))
(declare-datatypes ((array!18719 0))(
  ( (array!18720 (arr!8869 (Array (_ BitVec 32) ValueCell!3439)) (size!9221 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18719)

(declare-fun mapDefault!12807 () ValueCell!3439)

