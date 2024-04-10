; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101638 () Bool)

(assert start!101638)

(declare-fun b_free!26359 () Bool)

(declare-fun b_next!26359 () Bool)

(assert (=> start!101638 (= b_free!26359 (not b_next!26359))))

(declare-fun tp!92120 () Bool)

(declare-fun b_and!43961 () Bool)

(assert (=> start!101638 (= tp!92120 b_and!43961)))

(declare-fun b!1222356 () Bool)

(declare-fun res!812152 () Bool)

(declare-fun e!694199 () Bool)

(assert (=> b!1222356 (=> (not res!812152) (not e!694199))))

(declare-datatypes ((array!78909 0))(
  ( (array!78910 (arr!38082 (Array (_ BitVec 32) (_ BitVec 64))) (size!38618 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78909)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78909 (_ BitVec 32)) Bool)

(assert (=> b!1222356 (= res!812152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1222357 () Bool)

(declare-fun res!812153 () Bool)

(assert (=> b!1222357 (=> (not res!812153) (not e!694199))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1222357 (= res!812153 (validKeyInArray!0 k!934))))

(declare-fun b!1222358 () Bool)

(declare-fun e!694192 () Bool)

(declare-fun e!694196 () Bool)

(declare-fun mapRes!48490 () Bool)

(assert (=> b!1222358 (= e!694192 (and e!694196 mapRes!48490))))

(declare-fun condMapEmpty!48490 () Bool)

(declare-datatypes ((V!46545 0))(
  ( (V!46546 (val!15588 Int)) )
))
(declare-datatypes ((ValueCell!14822 0))(
  ( (ValueCellFull!14822 (v!18249 V!46545)) (EmptyCell!14822) )
))
(declare-datatypes ((array!78911 0))(
  ( (array!78912 (arr!38083 (Array (_ BitVec 32) ValueCell!14822)) (size!38619 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78911)

(declare-fun mapDefault!48490 () ValueCell!14822)

