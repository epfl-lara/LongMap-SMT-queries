; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20080 () Bool)

(assert start!20080)

(declare-fun mapIsEmpty!7961 () Bool)

(declare-fun mapRes!7961 () Bool)

(assert (=> mapIsEmpty!7961 mapRes!7961))

(declare-fun b!196635 () Bool)

(declare-fun res!92826 () Bool)

(declare-fun e!129520 () Bool)

(assert (=> b!196635 (=> (not res!92826) (not e!129520))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!196635 (= res!92826 (validKeyInArray!0 k!843))))

(declare-fun b!196636 () Bool)

(declare-fun res!92827 () Bool)

(assert (=> b!196636 (=> (not res!92827) (not e!129520))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!8447 0))(
  ( (array!8448 (arr!3974 (Array (_ BitVec 32) (_ BitVec 64))) (size!4299 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8447)

(assert (=> b!196636 (= res!92827 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4299 _keys!825))))))

(declare-fun b!196637 () Bool)

(declare-fun e!129522 () Bool)

(declare-fun e!129524 () Bool)

(assert (=> b!196637 (= e!129522 (and e!129524 mapRes!7961))))

(declare-fun condMapEmpty!7961 () Bool)

(declare-datatypes ((V!5773 0))(
  ( (V!5774 (val!2342 Int)) )
))
(declare-datatypes ((ValueCell!1954 0))(
  ( (ValueCellFull!1954 (v!4312 V!5773)) (EmptyCell!1954) )
))
(declare-datatypes ((array!8449 0))(
  ( (array!8450 (arr!3975 (Array (_ BitVec 32) ValueCell!1954)) (size!4300 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8449)

(declare-fun mapDefault!7961 () ValueCell!1954)

