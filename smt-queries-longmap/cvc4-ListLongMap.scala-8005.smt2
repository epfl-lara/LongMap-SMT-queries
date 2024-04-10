; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98874 () Bool)

(assert start!98874)

(declare-fun b_free!24479 () Bool)

(declare-fun b_next!24479 () Bool)

(assert (=> start!98874 (= b_free!24479 (not b_next!24479))))

(declare-fun tp!86148 () Bool)

(declare-fun b_and!39807 () Bool)

(assert (=> start!98874 (= tp!86148 b_and!39807)))

(declare-fun c!115173 () Bool)

(declare-fun bm!55287 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-datatypes ((V!43805 0))(
  ( (V!43806 (val!14561 Int)) )
))
(declare-datatypes ((tuple2!18524 0))(
  ( (tuple2!18525 (_1!9273 (_ BitVec 64)) (_2!9273 V!43805)) )
))
(declare-datatypes ((List!25267 0))(
  ( (Nil!25264) (Cons!25263 (h!26472 tuple2!18524) (t!36738 List!25267)) )
))
(declare-datatypes ((ListLongMap!16493 0))(
  ( (ListLongMap!16494 (toList!8262 List!25267)) )
))
(declare-fun lt!519549 () ListLongMap!16493)

(declare-fun call!55296 () ListLongMap!16493)

(declare-fun call!55295 () Bool)

(declare-fun contains!6774 (ListLongMap!16493 (_ BitVec 64)) Bool)

(assert (=> bm!55287 (= call!55295 (contains!6774 (ite c!115173 lt!519549 call!55296) k!934))))

(declare-fun b!1157046 () Bool)

(declare-fun e!658003 () Bool)

(declare-fun e!658005 () Bool)

(declare-fun mapRes!45338 () Bool)

(assert (=> b!1157046 (= e!658003 (and e!658005 mapRes!45338))))

(declare-fun condMapEmpty!45338 () Bool)

(declare-datatypes ((ValueCell!13795 0))(
  ( (ValueCellFull!13795 (v!17198 V!43805)) (EmptyCell!13795) )
))
(declare-datatypes ((array!74863 0))(
  ( (array!74864 (arr!36082 (Array (_ BitVec 32) ValueCell!13795)) (size!36618 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74863)

(declare-fun mapDefault!45338 () ValueCell!13795)

