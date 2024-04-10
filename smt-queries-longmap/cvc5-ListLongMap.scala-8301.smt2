; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101154 () Bool)

(assert start!101154)

(declare-fun b_free!26077 () Bool)

(declare-fun b_next!26077 () Bool)

(assert (=> start!101154 (= b_free!26077 (not b_next!26077))))

(declare-fun tp!91252 () Bool)

(declare-fun b_and!43271 () Bool)

(assert (=> start!101154 (= tp!91252 b_and!43271)))

(declare-fun k!934 () (_ BitVec 64))

(declare-datatypes ((V!46169 0))(
  ( (V!46170 (val!15447 Int)) )
))
(declare-datatypes ((tuple2!19854 0))(
  ( (tuple2!19855 (_1!9938 (_ BitVec 64)) (_2!9938 V!46169)) )
))
(declare-datatypes ((List!26653 0))(
  ( (Nil!26650) (Cons!26649 (h!27858 tuple2!19854) (t!39710 List!26653)) )
))
(declare-datatypes ((ListLongMap!17823 0))(
  ( (ListLongMap!17824 (toList!8927 List!26653)) )
))
(declare-fun call!60408 () ListLongMap!17823)

(declare-fun e!689195 () Bool)

(declare-fun call!60411 () ListLongMap!17823)

(declare-fun b!1213568 () Bool)

(declare-fun -!1873 (ListLongMap!17823 (_ BitVec 64)) ListLongMap!17823)

(assert (=> b!1213568 (= e!689195 (= call!60408 (-!1873 call!60411 k!934)))))

(declare-fun b!1213569 () Bool)

(declare-fun res!805808 () Bool)

(declare-fun e!689203 () Bool)

(assert (=> b!1213569 (=> (not res!805808) (not e!689203))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1213569 (= res!805808 (validMask!0 mask!1564))))

(declare-fun b!1213570 () Bool)

(declare-fun res!805813 () Bool)

(assert (=> b!1213570 (=> (not res!805813) (not e!689203))))

(declare-datatypes ((array!78349 0))(
  ( (array!78350 (arr!37809 (Array (_ BitVec 32) (_ BitVec 64))) (size!38345 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78349)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78349 (_ BitVec 32)) Bool)

(assert (=> b!1213570 (= res!805813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!689199 () Bool)

(declare-fun b!1213571 () Bool)

(declare-fun arrayContainsKey!0 (array!78349 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1213571 (= e!689199 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1213572 () Bool)

(declare-fun call!60409 () ListLongMap!17823)

(declare-fun contains!6997 (ListLongMap!17823 (_ BitVec 64)) Bool)

(assert (=> b!1213572 (contains!6997 call!60409 k!934)))

(declare-fun minValue!944 () V!46169)

(declare-fun lt!551783 () ListLongMap!17823)

(declare-datatypes ((Unit!40243 0))(
  ( (Unit!40244) )
))
(declare-fun lt!551768 () Unit!40243)

(declare-fun addStillContains!1068 (ListLongMap!17823 (_ BitVec 64) V!46169 (_ BitVec 64)) Unit!40243)

(assert (=> b!1213572 (= lt!551768 (addStillContains!1068 lt!551783 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(declare-fun call!60412 () Bool)

(assert (=> b!1213572 call!60412))

(declare-fun lt!551774 () ListLongMap!17823)

(declare-fun zeroValue!944 () V!46169)

(declare-fun +!4040 (ListLongMap!17823 tuple2!19854) ListLongMap!17823)

(assert (=> b!1213572 (= lt!551783 (+!4040 lt!551774 (tuple2!19855 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!551777 () Unit!40243)

(declare-fun call!60410 () Unit!40243)

(assert (=> b!1213572 (= lt!551777 call!60410)))

(declare-fun e!689190 () Unit!40243)

(assert (=> b!1213572 (= e!689190 lt!551768)))

(declare-fun e!689204 () Bool)

(declare-fun b!1213573 () Bool)

(assert (=> b!1213573 (= e!689204 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!60404 () Bool)

(declare-fun c!119899 () Bool)

(declare-fun call!60413 () ListLongMap!17823)

(assert (=> bm!60404 (= call!60412 (contains!6997 (ite c!119899 lt!551783 call!60413) k!934))))

(declare-fun bm!60405 () Bool)

(declare-fun call!60414 () Bool)

(assert (=> bm!60405 (= call!60414 call!60412)))

(declare-fun b!1213574 () Bool)

(declare-fun e!689191 () Bool)

(assert (=> b!1213574 (= e!689203 e!689191)))

(declare-fun res!805809 () Bool)

(assert (=> b!1213574 (=> (not res!805809) (not e!689191))))

(declare-fun lt!551776 () array!78349)

(assert (=> b!1213574 (= res!805809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!551776 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1213574 (= lt!551776 (array!78350 (store (arr!37809 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38345 _keys!1208)))))

(declare-fun b!1213575 () Bool)

(declare-fun e!689205 () Bool)

(declare-fun tp_is_empty!30781 () Bool)

(assert (=> b!1213575 (= e!689205 tp_is_empty!30781)))

(declare-fun b!1213576 () Bool)

(declare-fun res!805803 () Bool)

(assert (=> b!1213576 (=> (not res!805803) (not e!689203))))

(declare-datatypes ((List!26654 0))(
  ( (Nil!26651) (Cons!26650 (h!27859 (_ BitVec 64)) (t!39711 List!26654)) )
))
(declare-fun arrayNoDuplicates!0 (array!78349 (_ BitVec 32) List!26654) Bool)

(assert (=> b!1213576 (= res!805803 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26651))))

(declare-fun b!1213577 () Bool)

(declare-fun e!689197 () Bool)

(assert (=> b!1213577 (= e!689197 tp_is_empty!30781)))

(declare-fun b!1213578 () Bool)

(declare-fun e!689200 () Bool)

(declare-fun mapRes!48046 () Bool)

(assert (=> b!1213578 (= e!689200 (and e!689205 mapRes!48046))))

(declare-fun condMapEmpty!48046 () Bool)

(declare-datatypes ((ValueCell!14681 0))(
  ( (ValueCellFull!14681 (v!18100 V!46169)) (EmptyCell!14681) )
))
(declare-datatypes ((array!78351 0))(
  ( (array!78352 (arr!37810 (Array (_ BitVec 32) ValueCell!14681)) (size!38346 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78351)

(declare-fun mapDefault!48046 () ValueCell!14681)

