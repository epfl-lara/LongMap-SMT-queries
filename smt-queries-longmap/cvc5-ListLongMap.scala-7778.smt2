; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97412 () Bool)

(assert start!97412)

(declare-fun b_free!23383 () Bool)

(declare-fun b_next!23383 () Bool)

(assert (=> start!97412 (= b_free!23383 (not b_next!23383))))

(declare-fun tp!82447 () Bool)

(declare-fun b_and!37603 () Bool)

(assert (=> start!97412 (= tp!82447 b_and!37603)))

(declare-fun b!1110981 () Bool)

(declare-fun res!741391 () Bool)

(declare-fun e!633548 () Bool)

(assert (=> b!1110981 (=> (not res!741391) (not e!633548))))

(declare-datatypes ((array!72203 0))(
  ( (array!72204 (arr!34754 (Array (_ BitVec 32) (_ BitVec 64))) (size!35290 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72203)

(declare-datatypes ((List!24242 0))(
  ( (Nil!24239) (Cons!24238 (h!25447 (_ BitVec 64)) (t!34671 List!24242)) )
))
(declare-fun arrayNoDuplicates!0 (array!72203 (_ BitVec 32) List!24242) Bool)

(assert (=> b!1110981 (= res!741391 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24239))))

(declare-fun b!1110982 () Bool)

(declare-fun res!741392 () Bool)

(assert (=> b!1110982 (=> (not res!741392) (not e!633548))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72203 (_ BitVec 32)) Bool)

(assert (=> b!1110982 (= res!741392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1110983 () Bool)

(declare-fun res!741385 () Bool)

(assert (=> b!1110983 (=> (not res!741385) (not e!633548))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1110983 (= res!741385 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35290 _keys!1208))))))

(declare-fun b!1110984 () Bool)

(declare-fun res!741390 () Bool)

(assert (=> b!1110984 (=> (not res!741390) (not e!633548))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1110984 (= res!741390 (= (select (arr!34754 _keys!1208) i!673) k!934))))

(declare-fun b!1110985 () Bool)

(declare-fun res!741388 () Bool)

(assert (=> b!1110985 (=> (not res!741388) (not e!633548))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1110985 (= res!741388 (validKeyInArray!0 k!934))))

(declare-datatypes ((V!41985 0))(
  ( (V!41986 (val!13878 Int)) )
))
(declare-fun zeroValue!944 () V!41985)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!496262 () array!72203)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13112 0))(
  ( (ValueCellFull!13112 (v!16511 V!41985)) (EmptyCell!13112) )
))
(declare-datatypes ((array!72205 0))(
  ( (array!72206 (arr!34755 (Array (_ BitVec 32) ValueCell!13112)) (size!35291 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72205)

(declare-fun minValue!944 () V!41985)

(declare-fun bm!46842 () Bool)

(declare-datatypes ((tuple2!17558 0))(
  ( (tuple2!17559 (_1!8790 (_ BitVec 64)) (_2!8790 V!41985)) )
))
(declare-datatypes ((List!24243 0))(
  ( (Nil!24240) (Cons!24239 (h!25448 tuple2!17558) (t!34672 List!24243)) )
))
(declare-datatypes ((ListLongMap!15527 0))(
  ( (ListLongMap!15528 (toList!7779 List!24243)) )
))
(declare-fun call!46846 () ListLongMap!15527)

(declare-fun getCurrentListMapNoExtraKeys!4271 (array!72203 array!72205 (_ BitVec 32) (_ BitVec 32) V!41985 V!41985 (_ BitVec 32) Int) ListLongMap!15527)

(declare-fun dynLambda!2400 (Int (_ BitVec 64)) V!41985)

(assert (=> bm!46842 (= call!46846 (getCurrentListMapNoExtraKeys!4271 lt!496262 (array!72206 (store (arr!34755 _values!996) i!673 (ValueCellFull!13112 (dynLambda!2400 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35291 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110986 () Bool)

(declare-fun e!633549 () Bool)

(declare-fun e!633555 () Bool)

(declare-fun mapRes!43282 () Bool)

(assert (=> b!1110986 (= e!633549 (and e!633555 mapRes!43282))))

(declare-fun condMapEmpty!43282 () Bool)

(declare-fun mapDefault!43282 () ValueCell!13112)

