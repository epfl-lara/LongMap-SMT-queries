; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100120 () Bool)

(assert start!100120)

(declare-fun b!1193921 () Bool)

(declare-fun res!794341 () Bool)

(declare-fun e!678553 () Bool)

(assert (=> b!1193921 (=> (not res!794341) (not e!678553))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1193921 (= res!794341 (validKeyInArray!0 k!934))))

(declare-fun b!1193922 () Bool)

(declare-fun e!678551 () Bool)

(declare-fun tp_is_empty!30229 () Bool)

(assert (=> b!1193922 (= e!678551 tp_is_empty!30229)))

(declare-fun mapIsEmpty!47171 () Bool)

(declare-fun mapRes!47171 () Bool)

(assert (=> mapIsEmpty!47171 mapRes!47171))

(declare-fun b!1193923 () Bool)

(declare-fun res!794339 () Bool)

(assert (=> b!1193923 (=> (not res!794339) (not e!678553))))

(declare-datatypes ((array!77237 0))(
  ( (array!77238 (arr!37268 (Array (_ BitVec 32) (_ BitVec 64))) (size!37804 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77237)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77237 (_ BitVec 32)) Bool)

(assert (=> b!1193923 (= res!794339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1193924 () Bool)

(declare-fun res!794343 () Bool)

(assert (=> b!1193924 (=> (not res!794343) (not e!678553))))

(declare-datatypes ((List!26249 0))(
  ( (Nil!26246) (Cons!26245 (h!27454 (_ BitVec 64)) (t!38920 List!26249)) )
))
(declare-fun arrayNoDuplicates!0 (array!77237 (_ BitVec 32) List!26249) Bool)

(assert (=> b!1193924 (= res!794343 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26246))))

(declare-fun b!1193925 () Bool)

(assert (=> b!1193925 (= e!678553 false)))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lt!542697 () Bool)

(assert (=> b!1193925 (= lt!542697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!77238 (store (arr!37268 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37804 _keys!1208)) mask!1564))))

(declare-fun b!1193926 () Bool)

(declare-fun res!794342 () Bool)

(assert (=> b!1193926 (=> (not res!794342) (not e!678553))))

(assert (=> b!1193926 (= res!794342 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37804 _keys!1208))))))

(declare-fun b!1193927 () Bool)

(declare-fun res!794338 () Bool)

(assert (=> b!1193927 (=> (not res!794338) (not e!678553))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45433 0))(
  ( (V!45434 (val!15171 Int)) )
))
(declare-datatypes ((ValueCell!14405 0))(
  ( (ValueCellFull!14405 (v!17809 V!45433)) (EmptyCell!14405) )
))
(declare-datatypes ((array!77239 0))(
  ( (array!77240 (arr!37269 (Array (_ BitVec 32) ValueCell!14405)) (size!37805 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77239)

(assert (=> b!1193927 (= res!794338 (and (= (size!37805 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37804 _keys!1208) (size!37805 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1193928 () Bool)

(declare-fun e!678550 () Bool)

(assert (=> b!1193928 (= e!678550 tp_is_empty!30229)))

(declare-fun b!1193929 () Bool)

(declare-fun res!794340 () Bool)

(assert (=> b!1193929 (=> (not res!794340) (not e!678553))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1193929 (= res!794340 (validMask!0 mask!1564))))

(declare-fun b!1193930 () Bool)

(declare-fun res!794344 () Bool)

(assert (=> b!1193930 (=> (not res!794344) (not e!678553))))

(assert (=> b!1193930 (= res!794344 (= (select (arr!37268 _keys!1208) i!673) k!934))))

(declare-fun res!794337 () Bool)

(assert (=> start!100120 (=> (not res!794337) (not e!678553))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100120 (= res!794337 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37804 _keys!1208))))))

(assert (=> start!100120 e!678553))

(declare-fun array_inv!28412 (array!77237) Bool)

(assert (=> start!100120 (array_inv!28412 _keys!1208)))

(assert (=> start!100120 true))

(declare-fun e!678552 () Bool)

(declare-fun array_inv!28413 (array!77239) Bool)

(assert (=> start!100120 (and (array_inv!28413 _values!996) e!678552)))

(declare-fun mapNonEmpty!47171 () Bool)

(declare-fun tp!89781 () Bool)

(assert (=> mapNonEmpty!47171 (= mapRes!47171 (and tp!89781 e!678550))))

(declare-fun mapRest!47171 () (Array (_ BitVec 32) ValueCell!14405))

(declare-fun mapValue!47171 () ValueCell!14405)

(declare-fun mapKey!47171 () (_ BitVec 32))

(assert (=> mapNonEmpty!47171 (= (arr!37269 _values!996) (store mapRest!47171 mapKey!47171 mapValue!47171))))

(declare-fun b!1193931 () Bool)

(assert (=> b!1193931 (= e!678552 (and e!678551 mapRes!47171))))

(declare-fun condMapEmpty!47171 () Bool)

(declare-fun mapDefault!47171 () ValueCell!14405)

