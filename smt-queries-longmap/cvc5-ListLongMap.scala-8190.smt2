; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100006 () Bool)

(assert start!100006)

(declare-fun b_free!25585 () Bool)

(declare-fun b_next!25585 () Bool)

(assert (=> start!100006 (= b_free!25585 (not b_next!25585))))

(declare-fun tp!89469 () Bool)

(declare-fun b_and!42037 () Bool)

(assert (=> start!100006 (= tp!89469 b_and!42037)))

(declare-fun b!1191421 () Bool)

(declare-fun res!792472 () Bool)

(declare-fun e!677260 () Bool)

(assert (=> b!1191421 (=> (not res!792472) (not e!677260))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1191421 (= res!792472 (validMask!0 mask!1564))))

(declare-fun b!1191422 () Bool)

(declare-fun e!677259 () Bool)

(declare-fun tp_is_empty!30115 () Bool)

(assert (=> b!1191422 (= e!677259 tp_is_empty!30115)))

(declare-fun b!1191423 () Bool)

(declare-fun res!792469 () Bool)

(assert (=> b!1191423 (=> (not res!792469) (not e!677260))))

(declare-datatypes ((array!77021 0))(
  ( (array!77022 (arr!37160 (Array (_ BitVec 32) (_ BitVec 64))) (size!37696 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77021)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45281 0))(
  ( (V!45282 (val!15114 Int)) )
))
(declare-datatypes ((ValueCell!14348 0))(
  ( (ValueCellFull!14348 (v!17752 V!45281)) (EmptyCell!14348) )
))
(declare-datatypes ((array!77023 0))(
  ( (array!77024 (arr!37161 (Array (_ BitVec 32) ValueCell!14348)) (size!37697 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77023)

(assert (=> b!1191423 (= res!792469 (and (= (size!37697 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37696 _keys!1208) (size!37697 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!47000 () Bool)

(declare-fun mapRes!47000 () Bool)

(declare-fun tp!89468 () Bool)

(declare-fun e!677266 () Bool)

(assert (=> mapNonEmpty!47000 (= mapRes!47000 (and tp!89468 e!677266))))

(declare-fun mapKey!47000 () (_ BitVec 32))

(declare-fun mapValue!47000 () ValueCell!14348)

(declare-fun mapRest!47000 () (Array (_ BitVec 32) ValueCell!14348))

(assert (=> mapNonEmpty!47000 (= (arr!37161 _values!996) (store mapRest!47000 mapKey!47000 mapValue!47000))))

(declare-fun b!1191424 () Bool)

(declare-fun e!677262 () Bool)

(assert (=> b!1191424 (= e!677262 (and e!677259 mapRes!47000))))

(declare-fun condMapEmpty!47000 () Bool)

(declare-fun mapDefault!47000 () ValueCell!14348)

