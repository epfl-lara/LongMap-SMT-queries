; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100234 () Bool)

(assert start!100234)

(declare-fun res!795462 () Bool)

(declare-fun e!679309 () Bool)

(assert (=> start!100234 (=> (not res!795462) (not e!679309))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!77383 0))(
  ( (array!77384 (arr!37338 (Array (_ BitVec 32) (_ BitVec 64))) (size!37874 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77383)

(assert (=> start!100234 (= res!795462 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37874 _keys!1208))))))

(assert (=> start!100234 e!679309))

(declare-fun array_inv!28458 (array!77383) Bool)

(assert (=> start!100234 (array_inv!28458 _keys!1208)))

(assert (=> start!100234 true))

(declare-datatypes ((V!45529 0))(
  ( (V!45530 (val!15207 Int)) )
))
(declare-datatypes ((ValueCell!14441 0))(
  ( (ValueCellFull!14441 (v!17845 V!45529)) (EmptyCell!14441) )
))
(declare-datatypes ((array!77385 0))(
  ( (array!77386 (arr!37339 (Array (_ BitVec 32) ValueCell!14441)) (size!37875 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77385)

(declare-fun e!679305 () Bool)

(declare-fun array_inv!28459 (array!77385) Bool)

(assert (=> start!100234 (and (array_inv!28459 _values!996) e!679305)))

(declare-fun b!1195437 () Bool)

(declare-fun e!679307 () Bool)

(declare-fun tp_is_empty!30301 () Bool)

(assert (=> b!1195437 (= e!679307 tp_is_empty!30301)))

(declare-fun mapIsEmpty!47288 () Bool)

(declare-fun mapRes!47288 () Bool)

(assert (=> mapIsEmpty!47288 mapRes!47288))

(declare-fun b!1195438 () Bool)

(declare-fun res!795459 () Bool)

(assert (=> b!1195438 (=> (not res!795459) (not e!679309))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1195438 (= res!795459 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!47288 () Bool)

(declare-fun tp!89898 () Bool)

(assert (=> mapNonEmpty!47288 (= mapRes!47288 (and tp!89898 e!679307))))

(declare-fun mapKey!47288 () (_ BitVec 32))

(declare-fun mapRest!47288 () (Array (_ BitVec 32) ValueCell!14441))

(declare-fun mapValue!47288 () ValueCell!14441)

(assert (=> mapNonEmpty!47288 (= (arr!37339 _values!996) (store mapRest!47288 mapKey!47288 mapValue!47288))))

(declare-fun b!1195439 () Bool)

(declare-fun e!679308 () Bool)

(assert (=> b!1195439 (= e!679305 (and e!679308 mapRes!47288))))

(declare-fun condMapEmpty!47288 () Bool)

(declare-fun mapDefault!47288 () ValueCell!14441)

