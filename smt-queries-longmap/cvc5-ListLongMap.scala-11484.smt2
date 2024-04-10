; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133702 () Bool)

(assert start!133702)

(declare-fun b_free!32065 () Bool)

(declare-fun b_next!32065 () Bool)

(assert (=> start!133702 (= b_free!32065 (not b_next!32065))))

(declare-fun tp!113400 () Bool)

(declare-fun b_and!51635 () Bool)

(assert (=> start!133702 (= tp!113400 b_and!51635)))

(declare-fun mapIsEmpty!59553 () Bool)

(declare-fun mapRes!59553 () Bool)

(assert (=> mapIsEmpty!59553 mapRes!59553))

(declare-fun b!1563245 () Bool)

(declare-fun e!871238 () Bool)

(declare-fun tp_is_empty!38785 () Bool)

(assert (=> b!1563245 (= e!871238 tp_is_empty!38785)))

(declare-fun b!1563246 () Bool)

(declare-fun res!1068710 () Bool)

(declare-fun e!871237 () Bool)

(assert (=> b!1563246 (=> (not res!1068710) (not e!871237))))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!104268 0))(
  ( (array!104269 (arr!50326 (Array (_ BitVec 32) (_ BitVec 64))) (size!50876 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104268)

(assert (=> b!1563246 (= res!1068710 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50876 _keys!637)) (bvslt from!782 (size!50876 _keys!637))))))

(declare-fun res!1068713 () Bool)

(assert (=> start!133702 (=> (not res!1068713) (not e!871237))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133702 (= res!1068713 (validMask!0 mask!947))))

(assert (=> start!133702 e!871237))

(assert (=> start!133702 tp!113400))

(assert (=> start!133702 tp_is_empty!38785))

(assert (=> start!133702 true))

(declare-fun array_inv!39113 (array!104268) Bool)

(assert (=> start!133702 (array_inv!39113 _keys!637)))

(declare-datatypes ((V!59921 0))(
  ( (V!59922 (val!19476 Int)) )
))
(declare-datatypes ((ValueCell!18362 0))(
  ( (ValueCellFull!18362 (v!22228 V!59921)) (EmptyCell!18362) )
))
(declare-datatypes ((array!104270 0))(
  ( (array!104271 (arr!50327 (Array (_ BitVec 32) ValueCell!18362)) (size!50877 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104270)

(declare-fun e!871239 () Bool)

(declare-fun array_inv!39114 (array!104270) Bool)

(assert (=> start!133702 (and (array_inv!39114 _values!487) e!871239)))

(declare-fun b!1563247 () Bool)

(assert (=> b!1563247 (= e!871239 (and e!871238 mapRes!59553))))

(declare-fun condMapEmpty!59553 () Bool)

(declare-fun mapDefault!59553 () ValueCell!18362)

