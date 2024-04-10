; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133712 () Bool)

(assert start!133712)

(declare-fun b_free!32075 () Bool)

(declare-fun b_next!32075 () Bool)

(assert (=> start!133712 (= b_free!32075 (not b_next!32075))))

(declare-fun tp!113430 () Bool)

(declare-fun b_and!51645 () Bool)

(assert (=> start!133712 (= tp!113430 b_and!51645)))

(declare-fun b!1563396 () Bool)

(declare-fun res!1068817 () Bool)

(declare-fun e!871327 () Bool)

(assert (=> b!1563396 (=> (not res!1068817) (not e!871327))))

(declare-datatypes ((array!104286 0))(
  ( (array!104287 (arr!50335 (Array (_ BitVec 32) (_ BitVec 64))) (size!50885 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104286)

(declare-datatypes ((List!36519 0))(
  ( (Nil!36516) (Cons!36515 (h!37961 (_ BitVec 64)) (t!51366 List!36519)) )
))
(declare-fun arrayNoDuplicates!0 (array!104286 (_ BitVec 32) List!36519) Bool)

(assert (=> b!1563396 (= res!1068817 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36516))))

(declare-fun b!1563397 () Bool)

(declare-fun e!871326 () Bool)

(declare-fun e!871328 () Bool)

(declare-fun mapRes!59568 () Bool)

(assert (=> b!1563397 (= e!871326 (and e!871328 mapRes!59568))))

(declare-fun condMapEmpty!59568 () Bool)

(declare-datatypes ((V!59933 0))(
  ( (V!59934 (val!19481 Int)) )
))
(declare-datatypes ((ValueCell!18367 0))(
  ( (ValueCellFull!18367 (v!22233 V!59933)) (EmptyCell!18367) )
))
(declare-datatypes ((array!104288 0))(
  ( (array!104289 (arr!50336 (Array (_ BitVec 32) ValueCell!18367)) (size!50886 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104288)

(declare-fun mapDefault!59568 () ValueCell!18367)

