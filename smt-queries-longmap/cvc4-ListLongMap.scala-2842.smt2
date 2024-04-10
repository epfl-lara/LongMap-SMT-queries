; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41020 () Bool)

(assert start!41020)

(declare-fun b_free!10955 () Bool)

(declare-fun b_next!10955 () Bool)

(assert (=> start!41020 (= b_free!10955 (not b_next!10955))))

(declare-fun tp!38692 () Bool)

(declare-fun b_and!19101 () Bool)

(assert (=> start!41020 (= tp!38692 b_and!19101)))

(declare-fun res!273005 () Bool)

(declare-fun e!267040 () Bool)

(assert (=> start!41020 (=> (not res!273005) (not e!267040))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!28387 0))(
  ( (array!28388 (arr!13637 (Array (_ BitVec 32) (_ BitVec 64))) (size!13989 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28387)

(assert (=> start!41020 (= res!273005 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13989 _keys!709))))))

(assert (=> start!41020 e!267040))

(declare-fun tp_is_empty!12293 () Bool)

(assert (=> start!41020 tp_is_empty!12293))

(assert (=> start!41020 tp!38692))

(assert (=> start!41020 true))

(declare-datatypes ((V!17495 0))(
  ( (V!17496 (val!6191 Int)) )
))
(declare-datatypes ((ValueCell!5803 0))(
  ( (ValueCellFull!5803 (v!8457 V!17495)) (EmptyCell!5803) )
))
(declare-datatypes ((array!28389 0))(
  ( (array!28390 (arr!13638 (Array (_ BitVec 32) ValueCell!5803)) (size!13990 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28389)

(declare-fun e!267038 () Bool)

(declare-fun array_inv!9874 (array!28389) Bool)

(assert (=> start!41020 (and (array_inv!9874 _values!549) e!267038)))

(declare-fun array_inv!9875 (array!28387) Bool)

(assert (=> start!41020 (array_inv!9875 _keys!709)))

(declare-fun b!457204 () Bool)

(declare-fun e!267036 () Bool)

(assert (=> b!457204 (= e!267036 tp_is_empty!12293)))

(declare-fun b!457205 () Bool)

(declare-fun res!273003 () Bool)

(assert (=> b!457205 (=> (not res!273003) (not e!267040))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!457205 (= res!273003 (and (= (size!13990 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13989 _keys!709) (size!13990 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!457206 () Bool)

(declare-fun mapRes!20080 () Bool)

(assert (=> b!457206 (= e!267038 (and e!267036 mapRes!20080))))

(declare-fun condMapEmpty!20080 () Bool)

(declare-fun mapDefault!20080 () ValueCell!5803)

