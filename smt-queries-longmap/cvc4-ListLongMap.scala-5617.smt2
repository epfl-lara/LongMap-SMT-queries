; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73490 () Bool)

(assert start!73490)

(declare-fun b_free!14405 () Bool)

(declare-fun b_next!14405 () Bool)

(assert (=> start!73490 (= b_free!14405 (not b_next!14405))))

(declare-fun tp!50718 () Bool)

(declare-fun b_and!23789 () Bool)

(assert (=> start!73490 (= tp!50718 b_and!23789)))

(declare-fun b!858495 () Bool)

(declare-fun e!478440 () Bool)

(declare-fun tp_is_empty!16541 () Bool)

(assert (=> b!858495 (= e!478440 tp_is_empty!16541)))

(declare-fun b!858497 () Bool)

(declare-fun res!583236 () Bool)

(declare-fun e!478438 () Bool)

(assert (=> b!858497 (=> (not res!583236) (not e!478438))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!858497 (= res!583236 (validKeyInArray!0 k!854))))

(declare-fun mapNonEmpty!26411 () Bool)

(declare-fun mapRes!26411 () Bool)

(declare-fun tp!50719 () Bool)

(declare-fun e!478441 () Bool)

(assert (=> mapNonEmpty!26411 (= mapRes!26411 (and tp!50719 e!478441))))

(declare-datatypes ((V!27101 0))(
  ( (V!27102 (val!8318 Int)) )
))
(declare-datatypes ((ValueCell!7831 0))(
  ( (ValueCellFull!7831 (v!10743 V!27101)) (EmptyCell!7831) )
))
(declare-fun mapValue!26411 () ValueCell!7831)

(declare-fun mapKey!26411 () (_ BitVec 32))

(declare-fun mapRest!26411 () (Array (_ BitVec 32) ValueCell!7831))

(declare-datatypes ((array!49266 0))(
  ( (array!49267 (arr!23664 (Array (_ BitVec 32) ValueCell!7831)) (size!24104 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49266)

(assert (=> mapNonEmpty!26411 (= (arr!23664 _values!688) (store mapRest!26411 mapKey!26411 mapValue!26411))))

(declare-fun mapIsEmpty!26411 () Bool)

(assert (=> mapIsEmpty!26411 mapRes!26411))

(declare-fun b!858498 () Bool)

(declare-fun res!583233 () Bool)

(assert (=> b!858498 (=> (not res!583233) (not e!478438))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!858498 (= res!583233 (validMask!0 mask!1196))))

(declare-fun b!858499 () Bool)

(declare-fun res!583234 () Bool)

(assert (=> b!858499 (=> (not res!583234) (not e!478438))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!49268 0))(
  ( (array!49269 (arr!23665 (Array (_ BitVec 32) (_ BitVec 64))) (size!24105 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49268)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!858499 (= res!583234 (and (= (select (arr!23665 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!858500 () Bool)

(declare-fun res!583237 () Bool)

(assert (=> b!858500 (=> (not res!583237) (not e!478438))))

(assert (=> b!858500 (= res!583237 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24105 _keys!868))))))

(declare-fun res!583231 () Bool)

(assert (=> start!73490 (=> (not res!583231) (not e!478438))))

(assert (=> start!73490 (= res!583231 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24105 _keys!868))))))

(assert (=> start!73490 e!478438))

(assert (=> start!73490 tp_is_empty!16541))

(assert (=> start!73490 true))

(assert (=> start!73490 tp!50718))

(declare-fun array_inv!18742 (array!49268) Bool)

(assert (=> start!73490 (array_inv!18742 _keys!868)))

(declare-fun e!478444 () Bool)

(declare-fun array_inv!18743 (array!49266) Bool)

(assert (=> start!73490 (and (array_inv!18743 _values!688) e!478444)))

(declare-fun b!858496 () Bool)

(assert (=> b!858496 (= e!478444 (and e!478440 mapRes!26411))))

(declare-fun condMapEmpty!26411 () Bool)

(declare-fun mapDefault!26411 () ValueCell!7831)

