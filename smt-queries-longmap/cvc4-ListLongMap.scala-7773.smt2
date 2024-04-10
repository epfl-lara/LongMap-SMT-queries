; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97386 () Bool)

(assert start!97386)

(declare-fun b_free!23357 () Bool)

(declare-fun b_next!23357 () Bool)

(assert (=> start!97386 (= b_free!23357 (not b_next!23357))))

(declare-fun tp!82370 () Bool)

(declare-fun b_and!37549 () Bool)

(assert (=> start!97386 (= tp!82370 b_and!37549)))

(declare-fun b!1110319 () Bool)

(declare-fun res!740956 () Bool)

(declare-fun e!633236 () Bool)

(assert (=> b!1110319 (=> (not res!740956) (not e!633236))))

(declare-datatypes ((array!72151 0))(
  ( (array!72152 (arr!34728 (Array (_ BitVec 32) (_ BitVec 64))) (size!35264 (_ BitVec 32))) )
))
(declare-fun lt!496145 () array!72151)

(declare-datatypes ((List!24218 0))(
  ( (Nil!24215) (Cons!24214 (h!25423 (_ BitVec 64)) (t!34621 List!24218)) )
))
(declare-fun arrayNoDuplicates!0 (array!72151 (_ BitVec 32) List!24218) Bool)

(assert (=> b!1110319 (= res!740956 (arrayNoDuplicates!0 lt!496145 #b00000000000000000000000000000000 Nil!24215))))

(declare-fun b!1110320 () Bool)

(declare-fun res!740959 () Bool)

(declare-fun e!633237 () Bool)

(assert (=> b!1110320 (=> (not res!740959) (not e!633237))))

(declare-fun _keys!1208 () array!72151)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72151 (_ BitVec 32)) Bool)

(assert (=> b!1110320 (= res!740959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1110321 () Bool)

(declare-fun res!740965 () Bool)

(assert (=> b!1110321 (=> (not res!740965) (not e!633237))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1110321 (= res!740965 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35264 _keys!1208))))))

(declare-fun b!1110322 () Bool)

(declare-fun e!633234 () Bool)

(declare-fun e!633232 () Bool)

(declare-fun mapRes!43243 () Bool)

(assert (=> b!1110322 (= e!633234 (and e!633232 mapRes!43243))))

(declare-fun condMapEmpty!43243 () Bool)

(declare-datatypes ((V!41949 0))(
  ( (V!41950 (val!13865 Int)) )
))
(declare-datatypes ((ValueCell!13099 0))(
  ( (ValueCellFull!13099 (v!16498 V!41949)) (EmptyCell!13099) )
))
(declare-datatypes ((array!72153 0))(
  ( (array!72154 (arr!34729 (Array (_ BitVec 32) ValueCell!13099)) (size!35265 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72153)

(declare-fun mapDefault!43243 () ValueCell!13099)

