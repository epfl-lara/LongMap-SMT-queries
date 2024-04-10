; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43496 () Bool)

(assert start!43496)

(declare-fun b_free!12275 () Bool)

(declare-fun b_next!12275 () Bool)

(assert (=> start!43496 (= b_free!12275 (not b_next!12275))))

(declare-fun tp!43108 () Bool)

(declare-fun b_and!21035 () Bool)

(assert (=> start!43496 (= tp!43108 b_and!21035)))

(declare-fun b!481943 () Bool)

(declare-fun res!287304 () Bool)

(declare-fun e!283566 () Bool)

(assert (=> b!481943 (=> (not res!287304) (not e!283566))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((array!31233 0))(
  ( (array!31234 (arr!15019 (Array (_ BitVec 32) (_ BitVec 64))) (size!15377 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31233)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19453 0))(
  ( (V!19454 (val!6941 Int)) )
))
(declare-datatypes ((ValueCell!6532 0))(
  ( (ValueCellFull!6532 (v!9234 V!19453)) (EmptyCell!6532) )
))
(declare-datatypes ((array!31235 0))(
  ( (array!31236 (arr!15020 (Array (_ BitVec 32) ValueCell!6532)) (size!15378 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31235)

(assert (=> b!481943 (= res!287304 (and (= (size!15378 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15377 _keys!1874) (size!15378 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!22390 () Bool)

(declare-fun mapRes!22390 () Bool)

(declare-fun tp!43107 () Bool)

(declare-fun e!283567 () Bool)

(assert (=> mapNonEmpty!22390 (= mapRes!22390 (and tp!43107 e!283567))))

(declare-fun mapKey!22390 () (_ BitVec 32))

(declare-fun mapValue!22390 () ValueCell!6532)

(declare-fun mapRest!22390 () (Array (_ BitVec 32) ValueCell!6532))

(assert (=> mapNonEmpty!22390 (= (arr!15020 _values!1516) (store mapRest!22390 mapKey!22390 mapValue!22390))))

(declare-fun b!481944 () Bool)

(declare-fun e!283569 () Bool)

(declare-fun e!283565 () Bool)

(assert (=> b!481944 (= e!283569 (and e!283565 mapRes!22390))))

(declare-fun condMapEmpty!22390 () Bool)

(declare-fun mapDefault!22390 () ValueCell!6532)

