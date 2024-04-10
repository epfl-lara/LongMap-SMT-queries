; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98780 () Bool)

(assert start!98780)

(declare-fun b_free!24385 () Bool)

(declare-fun b_next!24385 () Bool)

(assert (=> start!98780 (= b_free!24385 (not b_next!24385))))

(declare-fun tp!85865 () Bool)

(declare-fun b_and!39619 () Bool)

(assert (=> start!98780 (= tp!85865 b_and!39619)))

(declare-fun b!1152722 () Bool)

(declare-datatypes ((Unit!37935 0))(
  ( (Unit!37936) )
))
(declare-fun e!655605 () Unit!37935)

(declare-fun lt!516447 () Unit!37935)

(assert (=> b!1152722 (= e!655605 lt!516447)))

(declare-fun call!54167 () Unit!37935)

(assert (=> b!1152722 (= lt!516447 call!54167)))

(declare-fun call!54165 () Bool)

(assert (=> b!1152722 call!54165))

(declare-fun b!1152723 () Bool)

(declare-fun e!655603 () Unit!37935)

(assert (=> b!1152723 (= e!655605 e!655603)))

(declare-fun c!114323 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!516441 () Bool)

(assert (=> b!1152723 (= c!114323 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!516441))))

(declare-datatypes ((array!74677 0))(
  ( (array!74678 (arr!35989 (Array (_ BitVec 32) (_ BitVec 64))) (size!36525 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74677)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!655602 () Bool)

(declare-fun b!1152724 () Bool)

(declare-fun arrayContainsKey!0 (array!74677 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1152724 (= e!655602 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1152725 () Bool)

(declare-fun res!766343 () Bool)

(declare-fun e!655617 () Bool)

(assert (=> b!1152725 (=> (not res!766343) (not e!655617))))

(declare-fun lt!516446 () array!74677)

(declare-datatypes ((List!25183 0))(
  ( (Nil!25180) (Cons!25179 (h!26388 (_ BitVec 64)) (t!36560 List!25183)) )
))
(declare-fun arrayNoDuplicates!0 (array!74677 (_ BitVec 32) List!25183) Bool)

(assert (=> b!1152725 (= res!766343 (arrayNoDuplicates!0 lt!516446 #b00000000000000000000000000000000 Nil!25180))))

(declare-fun c!114327 () Bool)

(declare-datatypes ((V!43681 0))(
  ( (V!43682 (val!14514 Int)) )
))
(declare-datatypes ((tuple2!18436 0))(
  ( (tuple2!18437 (_1!9229 (_ BitVec 64)) (_2!9229 V!43681)) )
))
(declare-datatypes ((List!25184 0))(
  ( (Nil!25181) (Cons!25180 (h!26389 tuple2!18436) (t!36561 List!25184)) )
))
(declare-datatypes ((ListLongMap!16405 0))(
  ( (ListLongMap!16406 (toList!8218 List!25184)) )
))
(declare-fun lt!516458 () ListLongMap!16405)

(declare-fun call!54168 () ListLongMap!16405)

(declare-fun call!54163 () Bool)

(declare-fun bm!54159 () Bool)

(declare-fun contains!6736 (ListLongMap!16405 (_ BitVec 64)) Bool)

(assert (=> bm!54159 (= call!54163 (contains!6736 (ite c!114327 lt!516458 call!54168) k!934))))

(declare-fun bm!54160 () Bool)

(declare-fun call!54164 () Unit!37935)

(assert (=> bm!54160 (= call!54167 call!54164)))

(declare-fun b!1152726 () Bool)

(assert (=> b!1152726 call!54165))

(declare-fun lt!516443 () Unit!37935)

(assert (=> b!1152726 (= lt!516443 call!54167)))

(assert (=> b!1152726 (= e!655603 lt!516443)))

(declare-fun e!655611 () Bool)

(declare-fun b!1152727 () Bool)

(assert (=> b!1152727 (= e!655611 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!516441) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!766329 () Bool)

(declare-fun e!655606 () Bool)

(assert (=> start!98780 (=> (not res!766329) (not e!655606))))

(assert (=> start!98780 (= res!766329 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36525 _keys!1208))))))

(assert (=> start!98780 e!655606))

(declare-fun tp_is_empty!28915 () Bool)

(assert (=> start!98780 tp_is_empty!28915))

(declare-fun array_inv!27558 (array!74677) Bool)

(assert (=> start!98780 (array_inv!27558 _keys!1208)))

(assert (=> start!98780 true))

(assert (=> start!98780 tp!85865))

(declare-datatypes ((ValueCell!13748 0))(
  ( (ValueCellFull!13748 (v!17151 V!43681)) (EmptyCell!13748) )
))
(declare-datatypes ((array!74679 0))(
  ( (array!74680 (arr!35990 (Array (_ BitVec 32) ValueCell!13748)) (size!36526 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74679)

(declare-fun e!655613 () Bool)

(declare-fun array_inv!27559 (array!74679) Bool)

(assert (=> start!98780 (and (array_inv!27559 _values!996) e!655613)))

(declare-fun b!1152728 () Bool)

(declare-fun e!655616 () Bool)

(declare-fun mapRes!45197 () Bool)

(assert (=> b!1152728 (= e!655613 (and e!655616 mapRes!45197))))

(declare-fun condMapEmpty!45197 () Bool)

(declare-fun mapDefault!45197 () ValueCell!13748)

