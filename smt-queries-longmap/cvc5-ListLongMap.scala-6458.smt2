; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82588 () Bool)

(assert start!82588)

(declare-fun b_free!18721 () Bool)

(declare-fun b_next!18721 () Bool)

(assert (=> start!82588 (= b_free!18721 (not b_next!18721))))

(declare-fun tp!65283 () Bool)

(declare-fun b_and!30209 () Bool)

(assert (=> start!82588 (= tp!65283 b_and!30209)))

(declare-fun b!962519 () Bool)

(declare-fun res!644142 () Bool)

(declare-fun e!542794 () Bool)

(assert (=> b!962519 (=> (not res!644142) (not e!542794))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33681 0))(
  ( (V!33682 (val!10812 Int)) )
))
(declare-datatypes ((ValueCell!10280 0))(
  ( (ValueCellFull!10280 (v!13370 V!33681)) (EmptyCell!10280) )
))
(declare-datatypes ((array!59143 0))(
  ( (array!59144 (arr!28440 (Array (_ BitVec 32) ValueCell!10280)) (size!28919 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59143)

(declare-datatypes ((array!59145 0))(
  ( (array!59146 (arr!28441 (Array (_ BitVec 32) (_ BitVec 64))) (size!28920 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59145)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!962519 (= res!644142 (and (= (size!28919 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28920 _keys!1686) (size!28919 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!962520 () Bool)

(declare-fun e!542792 () Bool)

(declare-fun e!542791 () Bool)

(declare-fun mapRes!34279 () Bool)

(assert (=> b!962520 (= e!542792 (and e!542791 mapRes!34279))))

(declare-fun condMapEmpty!34279 () Bool)

(declare-fun mapDefault!34279 () ValueCell!10280)

