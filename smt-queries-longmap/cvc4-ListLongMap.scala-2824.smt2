; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40912 () Bool)

(assert start!40912)

(declare-fun b_free!10847 () Bool)

(declare-fun b_next!10847 () Bool)

(assert (=> start!40912 (= b_free!10847 (not b_next!10847))))

(declare-fun tp!38368 () Bool)

(declare-fun b_and!18989 () Bool)

(assert (=> start!40912 (= tp!38368 b_and!18989)))

(declare-fun b!454682 () Bool)

(declare-fun res!270962 () Bool)

(declare-fun e!265979 () Bool)

(assert (=> b!454682 (=> (not res!270962) (not e!265979))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!454682 (= res!270962 (bvsle from!863 i!563))))

(declare-fun b!454683 () Bool)

(declare-fun res!270970 () Bool)

(declare-fun e!265976 () Bool)

(assert (=> b!454683 (=> (not res!270970) (not e!265976))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!454683 (= res!270970 (validKeyInArray!0 k!794))))

(declare-fun b!454684 () Bool)

(declare-fun e!265980 () Bool)

(declare-fun e!265977 () Bool)

(declare-fun mapRes!19918 () Bool)

(assert (=> b!454684 (= e!265980 (and e!265977 mapRes!19918))))

(declare-fun condMapEmpty!19918 () Bool)

(declare-datatypes ((V!17351 0))(
  ( (V!17352 (val!6137 Int)) )
))
(declare-datatypes ((ValueCell!5749 0))(
  ( (ValueCellFull!5749 (v!8403 V!17351)) (EmptyCell!5749) )
))
(declare-datatypes ((array!28175 0))(
  ( (array!28176 (arr!13531 (Array (_ BitVec 32) ValueCell!5749)) (size!13883 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28175)

(declare-fun mapDefault!19918 () ValueCell!5749)

