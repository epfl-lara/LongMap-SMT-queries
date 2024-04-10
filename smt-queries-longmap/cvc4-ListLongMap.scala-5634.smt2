; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73592 () Bool)

(assert start!73592)

(declare-fun b_free!14507 () Bool)

(declare-fun b_next!14507 () Bool)

(assert (=> start!73592 (= b_free!14507 (not b_next!14507))))

(declare-fun tp!51025 () Bool)

(declare-fun b_and!23993 () Bool)

(assert (=> start!73592 (= tp!51025 b_and!23993)))

(declare-fun b!860998 () Bool)

(declare-datatypes ((Unit!29359 0))(
  ( (Unit!29360) )
))
(declare-fun e!479744 () Unit!29359)

(declare-fun Unit!29361 () Unit!29359)

(assert (=> b!860998 (= e!479744 Unit!29361)))

(declare-fun lt!388182 () Unit!29359)

(declare-datatypes ((array!49458 0))(
  ( (array!49459 (arr!23760 (Array (_ BitVec 32) (_ BitVec 64))) (size!24200 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49458)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49458 (_ BitVec 32) (_ BitVec 32)) Unit!29359)

(assert (=> b!860998 (= lt!388182 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16871 0))(
  ( (Nil!16868) (Cons!16867 (h!17998 (_ BitVec 64)) (t!23644 List!16871)) )
))
(declare-fun arrayNoDuplicates!0 (array!49458 (_ BitVec 32) List!16871) Bool)

(assert (=> b!860998 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16868)))

(declare-fun lt!388186 () Unit!29359)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49458 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29359)

(assert (=> b!860998 (= lt!388186 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49458 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!860998 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!388187 () Unit!29359)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49458 (_ BitVec 64) (_ BitVec 32) List!16871) Unit!29359)

(assert (=> b!860998 (= lt!388187 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!16868))))

(assert (=> b!860998 false))

(declare-fun b!860999 () Bool)

(declare-fun e!479748 () Bool)

(declare-fun e!479745 () Bool)

(declare-fun mapRes!26564 () Bool)

(assert (=> b!860999 (= e!479748 (and e!479745 mapRes!26564))))

(declare-fun condMapEmpty!26564 () Bool)

(declare-datatypes ((V!27237 0))(
  ( (V!27238 (val!8369 Int)) )
))
(declare-datatypes ((ValueCell!7882 0))(
  ( (ValueCellFull!7882 (v!10794 V!27237)) (EmptyCell!7882) )
))
(declare-datatypes ((array!49460 0))(
  ( (array!49461 (arr!23761 (Array (_ BitVec 32) ValueCell!7882)) (size!24201 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49460)

(declare-fun mapDefault!26564 () ValueCell!7882)

