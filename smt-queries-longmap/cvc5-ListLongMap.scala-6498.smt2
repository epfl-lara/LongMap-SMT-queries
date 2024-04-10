; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82828 () Bool)

(assert start!82828)

(declare-fun b_free!18955 () Bool)

(declare-fun b_next!18955 () Bool)

(assert (=> start!82828 (= b_free!18955 (not b_next!18955))))

(declare-fun tp!65993 () Bool)

(declare-fun b_and!30443 () Bool)

(assert (=> start!82828 (= tp!65993 b_and!30443)))

(declare-fun b!966209 () Bool)

(declare-fun res!646749 () Bool)

(declare-fun e!544673 () Bool)

(assert (=> b!966209 (=> (not res!646749) (not e!544673))))

(declare-datatypes ((array!59611 0))(
  ( (array!59612 (arr!28674 (Array (_ BitVec 32) (_ BitVec 64))) (size!29153 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59611)

(declare-datatypes ((List!19903 0))(
  ( (Nil!19900) (Cons!19899 (h!21061 (_ BitVec 64)) (t!28266 List!19903)) )
))
(declare-fun arrayNoDuplicates!0 (array!59611 (_ BitVec 32) List!19903) Bool)

(assert (=> b!966209 (= res!646749 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19900))))

(declare-fun b!966210 () Bool)

(declare-fun e!544675 () Bool)

(declare-fun e!544676 () Bool)

(declare-fun mapRes!34639 () Bool)

(assert (=> b!966210 (= e!544675 (and e!544676 mapRes!34639))))

(declare-fun condMapEmpty!34639 () Bool)

(declare-datatypes ((V!34001 0))(
  ( (V!34002 (val!10932 Int)) )
))
(declare-datatypes ((ValueCell!10400 0))(
  ( (ValueCellFull!10400 (v!13490 V!34001)) (EmptyCell!10400) )
))
(declare-datatypes ((array!59613 0))(
  ( (array!59614 (arr!28675 (Array (_ BitVec 32) ValueCell!10400)) (size!29154 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59613)

(declare-fun mapDefault!34639 () ValueCell!10400)

