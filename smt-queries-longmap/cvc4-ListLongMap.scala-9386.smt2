; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111756 () Bool)

(assert start!111756)

(declare-fun b_free!30413 () Bool)

(declare-fun b_next!30413 () Bool)

(assert (=> start!111756 (= b_free!30413 (not b_next!30413))))

(declare-fun tp!106715 () Bool)

(declare-fun b_and!48951 () Bool)

(assert (=> start!111756 (= tp!106715 b_and!48951)))

(declare-fun b!1324252 () Bool)

(declare-fun res!878978 () Bool)

(declare-fun e!754935 () Bool)

(assert (=> b!1324252 (=> (not res!878978) (not e!754935))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53413 0))(
  ( (V!53414 (val!18191 Int)) )
))
(declare-datatypes ((ValueCell!17218 0))(
  ( (ValueCellFull!17218 (v!20821 V!53413)) (EmptyCell!17218) )
))
(declare-datatypes ((array!89382 0))(
  ( (array!89383 (arr!43165 (Array (_ BitVec 32) ValueCell!17218)) (size!43715 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89382)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((array!89384 0))(
  ( (array!89385 (arr!43166 (Array (_ BitVec 32) (_ BitVec 64))) (size!43716 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89384)

(assert (=> b!1324252 (= res!878978 (and (= (size!43715 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43716 _keys!1609) (size!43715 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!55997 () Bool)

(declare-fun mapRes!55997 () Bool)

(declare-fun tp!106714 () Bool)

(declare-fun e!754939 () Bool)

(assert (=> mapNonEmpty!55997 (= mapRes!55997 (and tp!106714 e!754939))))

(declare-fun mapRest!55997 () (Array (_ BitVec 32) ValueCell!17218))

(declare-fun mapKey!55997 () (_ BitVec 32))

(declare-fun mapValue!55997 () ValueCell!17218)

(assert (=> mapNonEmpty!55997 (= (arr!43165 _values!1337) (store mapRest!55997 mapKey!55997 mapValue!55997))))

(declare-fun b!1324253 () Bool)

(declare-fun e!754937 () Bool)

(declare-fun e!754936 () Bool)

(assert (=> b!1324253 (= e!754937 (and e!754936 mapRes!55997))))

(declare-fun condMapEmpty!55997 () Bool)

(declare-fun mapDefault!55997 () ValueCell!17218)

