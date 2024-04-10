; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100112 () Bool)

(assert start!100112)

(declare-fun b!1193829 () Bool)

(declare-fun e!678489 () Bool)

(declare-fun tp_is_empty!30221 () Bool)

(assert (=> b!1193829 (= e!678489 tp_is_empty!30221)))

(declare-fun b!1193830 () Bool)

(declare-fun res!794283 () Bool)

(declare-fun e!678490 () Bool)

(assert (=> b!1193830 (=> (not res!794283) (not e!678490))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1193830 (= res!794283 (validMask!0 mask!1564))))

(declare-fun b!1193831 () Bool)

(declare-fun res!794281 () Bool)

(assert (=> b!1193831 (=> (not res!794281) (not e!678490))))

(declare-datatypes ((array!77221 0))(
  ( (array!77222 (arr!37260 (Array (_ BitVec 32) (_ BitVec 64))) (size!37796 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77221)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77221 (_ BitVec 32)) Bool)

(assert (=> b!1193831 (= res!794281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1193832 () Bool)

(declare-fun e!678491 () Bool)

(assert (=> b!1193832 (= e!678491 tp_is_empty!30221)))

(declare-fun b!1193834 () Bool)

(declare-fun res!794284 () Bool)

(assert (=> b!1193834 (=> (not res!794284) (not e!678490))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45421 0))(
  ( (V!45422 (val!15167 Int)) )
))
(declare-datatypes ((ValueCell!14401 0))(
  ( (ValueCellFull!14401 (v!17805 V!45421)) (EmptyCell!14401) )
))
(declare-datatypes ((array!77223 0))(
  ( (array!77224 (arr!37261 (Array (_ BitVec 32) ValueCell!14401)) (size!37797 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77223)

(assert (=> b!1193834 (= res!794284 (and (= (size!37797 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37796 _keys!1208) (size!37797 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1193835 () Bool)

(declare-fun e!678492 () Bool)

(declare-fun mapRes!47159 () Bool)

(assert (=> b!1193835 (= e!678492 (and e!678491 mapRes!47159))))

(declare-fun condMapEmpty!47159 () Bool)

(declare-fun mapDefault!47159 () ValueCell!14401)

