; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133504 () Bool)

(assert start!133504)

(declare-fun b!1560702 () Bool)

(declare-fun res!1067172 () Bool)

(declare-fun e!869734 () Bool)

(assert (=> b!1560702 (=> (not res!1067172) (not e!869734))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!103894 0))(
  ( (array!103895 (arr!50139 (Array (_ BitVec 32) (_ BitVec 64))) (size!50689 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103894)

(declare-datatypes ((V!59657 0))(
  ( (V!59658 (val!19377 Int)) )
))
(declare-datatypes ((ValueCell!18263 0))(
  ( (ValueCellFull!18263 (v!22129 V!59657)) (EmptyCell!18263) )
))
(declare-datatypes ((array!103896 0))(
  ( (array!103897 (arr!50140 (Array (_ BitVec 32) ValueCell!18263)) (size!50690 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103896)

(assert (=> b!1560702 (= res!1067172 (and (= (size!50690 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50689 _keys!637) (size!50690 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1560703 () Bool)

(declare-fun e!869730 () Bool)

(declare-fun tp_is_empty!38587 () Bool)

(assert (=> b!1560703 (= e!869730 tp_is_empty!38587)))

(declare-fun b!1560704 () Bool)

(declare-fun e!869732 () Bool)

(declare-fun e!869731 () Bool)

(declare-fun mapRes!59256 () Bool)

(assert (=> b!1560704 (= e!869732 (and e!869731 mapRes!59256))))

(declare-fun condMapEmpty!59256 () Bool)

(declare-fun mapDefault!59256 () ValueCell!18263)

