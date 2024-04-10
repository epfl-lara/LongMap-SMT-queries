; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133508 () Bool)

(assert start!133508)

(declare-fun b!1560738 () Bool)

(declare-fun e!869760 () Bool)

(declare-fun e!869761 () Bool)

(declare-fun mapRes!59262 () Bool)

(assert (=> b!1560738 (= e!869760 (and e!869761 mapRes!59262))))

(declare-fun condMapEmpty!59262 () Bool)

(declare-datatypes ((V!59661 0))(
  ( (V!59662 (val!19379 Int)) )
))
(declare-datatypes ((ValueCell!18265 0))(
  ( (ValueCellFull!18265 (v!22131 V!59661)) (EmptyCell!18265) )
))
(declare-datatypes ((array!103902 0))(
  ( (array!103903 (arr!50143 (Array (_ BitVec 32) ValueCell!18265)) (size!50693 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103902)

(declare-fun mapDefault!59262 () ValueCell!18265)

