; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100102 () Bool)

(assert start!100102)

(declare-fun b_free!25675 () Bool)

(declare-fun b_next!25675 () Bool)

(assert (=> start!100102 (= b_free!25675 (not b_next!25675))))

(declare-fun tp!89747 () Bool)

(declare-fun b_and!42217 () Bool)

(assert (=> start!100102 (= tp!89747 b_and!42217)))

(declare-fun mapNonEmpty!47144 () Bool)

(declare-fun mapRes!47144 () Bool)

(declare-fun tp!89748 () Bool)

(declare-fun e!678406 () Bool)

(assert (=> mapNonEmpty!47144 (= mapRes!47144 (and tp!89748 e!678406))))

(declare-datatypes ((V!45409 0))(
  ( (V!45410 (val!15162 Int)) )
))
(declare-datatypes ((ValueCell!14396 0))(
  ( (ValueCellFull!14396 (v!17800 V!45409)) (EmptyCell!14396) )
))
(declare-fun mapValue!47144 () ValueCell!14396)

(declare-fun mapKey!47144 () (_ BitVec 32))

(declare-datatypes ((array!77201 0))(
  ( (array!77202 (arr!37250 (Array (_ BitVec 32) ValueCell!14396)) (size!37786 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77201)

(declare-fun mapRest!47144 () (Array (_ BitVec 32) ValueCell!14396))

(assert (=> mapNonEmpty!47144 (= (arr!37250 _values!996) (store mapRest!47144 mapKey!47144 mapValue!47144))))

(declare-fun b!1193669 () Bool)

(declare-fun res!794181 () Bool)

(declare-fun e!678405 () Bool)

(assert (=> b!1193669 (=> (not res!794181) (not e!678405))))

(declare-datatypes ((array!77203 0))(
  ( (array!77204 (arr!37251 (Array (_ BitVec 32) (_ BitVec 64))) (size!37787 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77203)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1193669 (= res!794181 (= (select (arr!37251 _keys!1208) i!673) k!934))))

(declare-fun b!1193670 () Bool)

(declare-fun res!794179 () Bool)

(declare-fun e!678401 () Bool)

(assert (=> b!1193670 (=> (not res!794179) (not e!678401))))

(declare-fun lt!542649 () array!77203)

(declare-datatypes ((List!26239 0))(
  ( (Nil!26236) (Cons!26235 (h!27444 (_ BitVec 64)) (t!38906 List!26239)) )
))
(declare-fun arrayNoDuplicates!0 (array!77203 (_ BitVec 32) List!26239) Bool)

(assert (=> b!1193670 (= res!794179 (arrayNoDuplicates!0 lt!542649 #b00000000000000000000000000000000 Nil!26236))))

(declare-fun res!794172 () Bool)

(assert (=> start!100102 (=> (not res!794172) (not e!678405))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100102 (= res!794172 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37787 _keys!1208))))))

(assert (=> start!100102 e!678405))

(declare-fun tp_is_empty!30211 () Bool)

(assert (=> start!100102 tp_is_empty!30211))

(declare-fun array_inv!28400 (array!77203) Bool)

(assert (=> start!100102 (array_inv!28400 _keys!1208)))

(assert (=> start!100102 true))

(assert (=> start!100102 tp!89747))

(declare-fun e!678403 () Bool)

(declare-fun array_inv!28401 (array!77201) Bool)

(assert (=> start!100102 (and (array_inv!28401 _values!996) e!678403)))

(declare-fun b!1193671 () Bool)

(declare-fun e!678402 () Bool)

(assert (=> b!1193671 (= e!678401 (not e!678402))))

(declare-fun res!794176 () Bool)

(assert (=> b!1193671 (=> res!794176 e!678402)))

(assert (=> b!1193671 (= res!794176 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77203 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1193671 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39598 0))(
  ( (Unit!39599) )
))
(declare-fun lt!542650 () Unit!39598)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77203 (_ BitVec 64) (_ BitVec 32)) Unit!39598)

(assert (=> b!1193671 (= lt!542650 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1193672 () Bool)

(assert (=> b!1193672 (= e!678406 tp_is_empty!30211)))

(declare-fun b!1193673 () Bool)

(declare-fun res!794177 () Bool)

(assert (=> b!1193673 (=> (not res!794177) (not e!678405))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77203 (_ BitVec 32)) Bool)

(assert (=> b!1193673 (= res!794177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1193674 () Bool)

(declare-fun e!678404 () Bool)

(assert (=> b!1193674 (= e!678403 (and e!678404 mapRes!47144))))

(declare-fun condMapEmpty!47144 () Bool)

(declare-fun mapDefault!47144 () ValueCell!14396)

