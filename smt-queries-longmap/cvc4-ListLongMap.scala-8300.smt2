; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101152 () Bool)

(assert start!101152)

(declare-fun b_free!26075 () Bool)

(declare-fun b_next!26075 () Bool)

(assert (=> start!101152 (= b_free!26075 (not b_next!26075))))

(declare-fun tp!91246 () Bool)

(declare-fun b_and!43267 () Bool)

(assert (=> start!101152 (= tp!91246 b_and!43267)))

(declare-fun b!1213476 () Bool)

(declare-fun c!119882 () Bool)

(declare-fun lt!551715 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1213476 (= c!119882 (and (not lt!551715) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!40241 0))(
  ( (Unit!40242) )
))
(declare-fun e!689153 () Unit!40241)

(declare-fun e!689150 () Unit!40241)

(assert (=> b!1213476 (= e!689153 e!689150)))

(declare-fun b!1213477 () Bool)

(declare-fun e!689145 () Bool)

(declare-fun tp_is_empty!30779 () Bool)

(assert (=> b!1213477 (= e!689145 tp_is_empty!30779)))

(declare-fun b!1213478 () Bool)

(declare-fun res!805763 () Bool)

(declare-fun e!689155 () Bool)

(assert (=> b!1213478 (=> (not res!805763) (not e!689155))))

(declare-datatypes ((array!78345 0))(
  ( (array!78346 (arr!37807 (Array (_ BitVec 32) (_ BitVec 64))) (size!38343 (_ BitVec 32))) )
))
(declare-fun lt!551701 () array!78345)

(declare-datatypes ((List!26651 0))(
  ( (Nil!26648) (Cons!26647 (h!27856 (_ BitVec 64)) (t!39706 List!26651)) )
))
(declare-fun arrayNoDuplicates!0 (array!78345 (_ BitVec 32) List!26651) Bool)

(assert (=> b!1213478 (= res!805763 (arrayNoDuplicates!0 lt!551701 #b00000000000000000000000000000000 Nil!26648))))

(declare-datatypes ((V!46165 0))(
  ( (V!46166 (val!15446 Int)) )
))
(declare-datatypes ((tuple2!19852 0))(
  ( (tuple2!19853 (_1!9937 (_ BitVec 64)) (_2!9937 V!46165)) )
))
(declare-datatypes ((List!26652 0))(
  ( (Nil!26649) (Cons!26648 (h!27857 tuple2!19852) (t!39707 List!26652)) )
))
(declare-datatypes ((ListLongMap!17821 0))(
  ( (ListLongMap!17822 (toList!8926 List!26652)) )
))
(declare-fun call!60384 () ListLongMap!17821)

(declare-fun call!60385 () ListLongMap!17821)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun e!689152 () Bool)

(declare-fun b!1213479 () Bool)

(declare-fun -!1872 (ListLongMap!17821 (_ BitVec 64)) ListLongMap!17821)

(assert (=> b!1213479 (= e!689152 (= call!60385 (-!1872 call!60384 k!934)))))

(declare-fun bm!60380 () Bool)

(declare-fun call!60383 () Bool)

(declare-fun call!60390 () Bool)

(assert (=> bm!60380 (= call!60383 call!60390)))

(declare-fun b!1213480 () Bool)

(assert (=> b!1213480 (= e!689152 (= call!60385 call!60384))))

(declare-fun mapIsEmpty!48043 () Bool)

(declare-fun mapRes!48043 () Bool)

(assert (=> mapIsEmpty!48043 mapRes!48043))

(declare-fun bm!60381 () Bool)

(declare-fun call!60387 () Unit!40241)

(declare-fun call!60389 () Unit!40241)

(assert (=> bm!60381 (= call!60387 call!60389)))

(declare-fun b!1213481 () Bool)

(declare-fun e!689144 () Bool)

(assert (=> b!1213481 (= e!689144 (and e!689145 mapRes!48043))))

(declare-fun condMapEmpty!48043 () Bool)

(declare-datatypes ((ValueCell!14680 0))(
  ( (ValueCellFull!14680 (v!18099 V!46165)) (EmptyCell!14680) )
))
(declare-datatypes ((array!78347 0))(
  ( (array!78348 (arr!37808 (Array (_ BitVec 32) ValueCell!14680)) (size!38344 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78347)

(declare-fun mapDefault!48043 () ValueCell!14680)

