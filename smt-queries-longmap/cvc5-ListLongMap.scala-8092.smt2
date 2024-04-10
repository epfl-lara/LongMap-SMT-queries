; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99418 () Bool)

(assert start!99418)

(declare-fun b_free!24997 () Bool)

(declare-fun b_next!24997 () Bool)

(assert (=> start!99418 (= b_free!24997 (not b_next!24997))))

(declare-fun tp!87704 () Bool)

(declare-fun b_and!40861 () Bool)

(assert (=> start!99418 (= tp!87704 b_and!40861)))

(declare-fun b!1173851 () Bool)

(declare-fun res!779496 () Bool)

(declare-fun e!667225 () Bool)

(assert (=> b!1173851 (=> (not res!779496) (not e!667225))))

(declare-datatypes ((array!75865 0))(
  ( (array!75866 (arr!36582 (Array (_ BitVec 32) (_ BitVec 64))) (size!37118 (_ BitVec 32))) )
))
(declare-fun lt!529208 () array!75865)

(declare-datatypes ((List!25679 0))(
  ( (Nil!25676) (Cons!25675 (h!26884 (_ BitVec 64)) (t!37668 List!25679)) )
))
(declare-fun arrayNoDuplicates!0 (array!75865 (_ BitVec 32) List!25679) Bool)

(assert (=> b!1173851 (= res!779496 (arrayNoDuplicates!0 lt!529208 #b00000000000000000000000000000000 Nil!25676))))

(declare-fun b!1173852 () Bool)

(declare-fun res!779499 () Bool)

(declare-fun e!667223 () Bool)

(assert (=> b!1173852 (=> (not res!779499) (not e!667223))))

(declare-fun _keys!1208 () array!75865)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75865 (_ BitVec 32)) Bool)

(assert (=> b!1173852 (= res!779499 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1173853 () Bool)

(declare-fun e!667229 () Bool)

(declare-fun e!667227 () Bool)

(declare-fun mapRes!46118 () Bool)

(assert (=> b!1173853 (= e!667229 (and e!667227 mapRes!46118))))

(declare-fun condMapEmpty!46118 () Bool)

(declare-datatypes ((V!44497 0))(
  ( (V!44498 (val!14820 Int)) )
))
(declare-datatypes ((ValueCell!14054 0))(
  ( (ValueCellFull!14054 (v!17458 V!44497)) (EmptyCell!14054) )
))
(declare-datatypes ((array!75867 0))(
  ( (array!75868 (arr!36583 (Array (_ BitVec 32) ValueCell!14054)) (size!37119 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75867)

(declare-fun mapDefault!46118 () ValueCell!14054)

