; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100754 () Bool)

(assert start!100754)

(declare-fun b_free!25925 () Bool)

(declare-fun b_next!25925 () Bool)

(assert (=> start!100754 (= b_free!25925 (not b_next!25925))))

(declare-fun tp!90777 () Bool)

(declare-fun b_and!42833 () Bool)

(assert (=> start!100754 (= tp!90777 b_and!42833)))

(declare-fun b!1205349 () Bool)

(declare-fun res!801755 () Bool)

(declare-fun e!684509 () Bool)

(assert (=> b!1205349 (=> (not res!801755) (not e!684509))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1205349 (= res!801755 (validMask!0 mask!1564))))

(declare-datatypes ((array!78039 0))(
  ( (array!78040 (arr!37660 (Array (_ BitVec 32) (_ BitVec 64))) (size!38196 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78039)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1205350 () Bool)

(declare-fun e!684512 () Bool)

(declare-fun arrayContainsKey!0 (array!78039 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1205350 (= e!684512 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!58425 () Bool)

(declare-fun call!58431 () Bool)

(declare-fun call!58433 () Bool)

(assert (=> bm!58425 (= call!58431 call!58433)))

(declare-fun b!1205351 () Bool)

(declare-fun c!118268 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!546695 () Bool)

(assert (=> b!1205351 (= c!118268 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!546695))))

(declare-datatypes ((Unit!39961 0))(
  ( (Unit!39962) )
))
(declare-fun e!684503 () Unit!39961)

(declare-fun e!684516 () Unit!39961)

(assert (=> b!1205351 (= e!684503 e!684516)))

(declare-datatypes ((V!45965 0))(
  ( (V!45966 (val!15371 Int)) )
))
(declare-fun zeroValue!944 () V!45965)

(declare-fun c!118266 () Bool)

(declare-fun c!118267 () Bool)

(declare-datatypes ((tuple2!19714 0))(
  ( (tuple2!19715 (_1!9868 (_ BitVec 64)) (_2!9868 V!45965)) )
))
(declare-datatypes ((List!26521 0))(
  ( (Nil!26518) (Cons!26517 (h!27726 tuple2!19714) (t!39426 List!26521)) )
))
(declare-datatypes ((ListLongMap!17683 0))(
  ( (ListLongMap!17684 (toList!8857 List!26521)) )
))
(declare-fun call!58429 () ListLongMap!17683)

(declare-fun bm!58426 () Bool)

(declare-fun lt!546697 () ListLongMap!17683)

(declare-fun minValue!944 () V!45965)

(declare-fun +!3982 (ListLongMap!17683 tuple2!19714) ListLongMap!17683)

(assert (=> bm!58426 (= call!58429 (+!3982 lt!546697 (ite (or c!118266 c!118267) (tuple2!19715 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19715 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun call!58435 () Unit!39961)

(declare-fun bm!58427 () Bool)

(declare-fun addStillContains!1011 (ListLongMap!17683 (_ BitVec 64) V!45965 (_ BitVec 64)) Unit!39961)

(assert (=> bm!58427 (= call!58435 (addStillContains!1011 lt!546697 (ite (or c!118266 c!118267) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118266 c!118267) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1205352 () Bool)

(declare-fun e!684510 () Bool)

(declare-fun tp_is_empty!30629 () Bool)

(assert (=> b!1205352 (= e!684510 tp_is_empty!30629)))

(declare-fun b!1205353 () Bool)

(declare-fun e!684513 () Bool)

(declare-fun e!684506 () Bool)

(declare-fun mapRes!47799 () Bool)

(assert (=> b!1205353 (= e!684513 (and e!684506 mapRes!47799))))

(declare-fun condMapEmpty!47799 () Bool)

(declare-datatypes ((ValueCell!14605 0))(
  ( (ValueCellFull!14605 (v!18015 V!45965)) (EmptyCell!14605) )
))
(declare-datatypes ((array!78041 0))(
  ( (array!78042 (arr!37661 (Array (_ BitVec 32) ValueCell!14605)) (size!38197 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78041)

(declare-fun mapDefault!47799 () ValueCell!14605)

