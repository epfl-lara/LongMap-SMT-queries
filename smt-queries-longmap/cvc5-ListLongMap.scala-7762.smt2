; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97316 () Bool)

(assert start!97316)

(declare-fun b_free!23287 () Bool)

(declare-fun b_next!23287 () Bool)

(assert (=> start!97316 (= b_free!23287 (not b_next!23287))))

(declare-fun tp!82159 () Bool)

(declare-fun b_and!37405 () Bool)

(assert (=> start!97316 (= tp!82159 b_and!37405)))

(declare-fun b!1108553 () Bool)

(declare-fun e!632387 () Bool)

(declare-fun e!632385 () Bool)

(assert (=> b!1108553 (= e!632387 e!632385)))

(declare-fun res!739801 () Bool)

(assert (=> b!1108553 (=> (not res!739801) (not e!632385))))

(declare-datatypes ((array!72011 0))(
  ( (array!72012 (arr!34658 (Array (_ BitVec 32) (_ BitVec 64))) (size!35194 (_ BitVec 32))) )
))
(declare-fun lt!495828 () array!72011)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72011 (_ BitVec 32)) Bool)

(assert (=> b!1108553 (= res!739801 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495828 mask!1564))))

(declare-fun _keys!1208 () array!72011)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1108553 (= lt!495828 (array!72012 (store (arr!34658 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35194 _keys!1208)))))

(declare-fun b!1108554 () Bool)

(declare-fun e!632384 () Bool)

(declare-fun e!632388 () Bool)

(declare-fun mapRes!43138 () Bool)

(assert (=> b!1108554 (= e!632384 (and e!632388 mapRes!43138))))

(declare-fun condMapEmpty!43138 () Bool)

(declare-datatypes ((V!41857 0))(
  ( (V!41858 (val!13830 Int)) )
))
(declare-datatypes ((ValueCell!13064 0))(
  ( (ValueCellFull!13064 (v!16463 V!41857)) (EmptyCell!13064) )
))
(declare-datatypes ((array!72013 0))(
  ( (array!72014 (arr!34659 (Array (_ BitVec 32) ValueCell!13064)) (size!35195 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72013)

(declare-fun mapDefault!43138 () ValueCell!13064)

