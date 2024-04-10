; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41184 () Bool)

(assert start!41184)

(declare-fun b_free!11053 () Bool)

(declare-fun b_next!11053 () Bool)

(assert (=> start!41184 (= b_free!11053 (not b_next!11053))))

(declare-fun tp!38994 () Bool)

(declare-fun b_and!19345 () Bool)

(assert (=> start!41184 (= tp!38994 b_and!19345)))

(declare-fun b!460433 () Bool)

(declare-fun res!275292 () Bool)

(declare-fun e!268628 () Bool)

(assert (=> b!460433 (=> (not res!275292) (not e!268628))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!460433 (= res!275292 (validKeyInArray!0 k!794))))

(declare-fun b!460434 () Bool)

(declare-fun e!268623 () Bool)

(declare-fun tp_is_empty!12391 () Bool)

(assert (=> b!460434 (= e!268623 tp_is_empty!12391)))

(declare-fun b!460435 () Bool)

(declare-fun res!275282 () Bool)

(assert (=> b!460435 (=> (not res!275282) (not e!268628))))

(declare-datatypes ((array!28581 0))(
  ( (array!28582 (arr!13731 (Array (_ BitVec 32) (_ BitVec 64))) (size!14083 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28581)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28581 (_ BitVec 32)) Bool)

(assert (=> b!460435 (= res!275282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!275289 () Bool)

(assert (=> start!41184 (=> (not res!275289) (not e!268628))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!41184 (= res!275289 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14083 _keys!709))))))

(assert (=> start!41184 e!268628))

(assert (=> start!41184 tp_is_empty!12391))

(assert (=> start!41184 tp!38994))

(assert (=> start!41184 true))

(declare-datatypes ((V!17627 0))(
  ( (V!17628 (val!6240 Int)) )
))
(declare-datatypes ((ValueCell!5852 0))(
  ( (ValueCellFull!5852 (v!8518 V!17627)) (EmptyCell!5852) )
))
(declare-datatypes ((array!28583 0))(
  ( (array!28584 (arr!13732 (Array (_ BitVec 32) ValueCell!5852)) (size!14084 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28583)

(declare-fun e!268620 () Bool)

(declare-fun array_inv!9930 (array!28583) Bool)

(assert (=> start!41184 (and (array_inv!9930 _values!549) e!268620)))

(declare-fun array_inv!9931 (array!28581) Bool)

(assert (=> start!41184 (array_inv!9931 _keys!709)))

(declare-fun b!460436 () Bool)

(declare-fun res!275290 () Bool)

(assert (=> b!460436 (=> (not res!275290) (not e!268628))))

(declare-datatypes ((List!8301 0))(
  ( (Nil!8298) (Cons!8297 (h!9153 (_ BitVec 64)) (t!14233 List!8301)) )
))
(declare-fun arrayNoDuplicates!0 (array!28581 (_ BitVec 32) List!8301) Bool)

(assert (=> b!460436 (= res!275290 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8298))))

(declare-fun b!460437 () Bool)

(declare-datatypes ((Unit!13400 0))(
  ( (Unit!13401) )
))
(declare-fun e!268622 () Unit!13400)

(declare-fun Unit!13402 () Unit!13400)

(assert (=> b!460437 (= e!268622 Unit!13402)))

(declare-fun lt!208511 () Unit!13400)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!28581 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!13400)

(assert (=> b!460437 (= lt!208511 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!460437 false))

(declare-fun b!460438 () Bool)

(declare-fun res!275296 () Bool)

(declare-fun e!268626 () Bool)

(assert (=> b!460438 (=> (not res!275296) (not e!268626))))

(declare-fun lt!208508 () array!28581)

(assert (=> b!460438 (= res!275296 (arrayNoDuplicates!0 lt!208508 #b00000000000000000000000000000000 Nil!8298))))

(declare-fun b!460439 () Bool)

(declare-fun e!268629 () Bool)

(assert (=> b!460439 (= e!268626 e!268629)))

(declare-fun res!275283 () Bool)

(assert (=> b!460439 (=> (not res!275283) (not e!268629))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!460439 (= res!275283 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!17627)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17627)

(declare-fun lt!208500 () array!28583)

(declare-datatypes ((tuple2!8230 0))(
  ( (tuple2!8231 (_1!4126 (_ BitVec 64)) (_2!4126 V!17627)) )
))
(declare-datatypes ((List!8302 0))(
  ( (Nil!8299) (Cons!8298 (h!9154 tuple2!8230) (t!14234 List!8302)) )
))
(declare-datatypes ((ListLongMap!7143 0))(
  ( (ListLongMap!7144 (toList!3587 List!8302)) )
))
(declare-fun lt!208507 () ListLongMap!7143)

(declare-fun getCurrentListMapNoExtraKeys!1767 (array!28581 array!28583 (_ BitVec 32) (_ BitVec 32) V!17627 V!17627 (_ BitVec 32) Int) ListLongMap!7143)

(assert (=> b!460439 (= lt!208507 (getCurrentListMapNoExtraKeys!1767 lt!208508 lt!208500 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!17627)

(assert (=> b!460439 (= lt!208500 (array!28584 (store (arr!13732 _values!549) i!563 (ValueCellFull!5852 v!412)) (size!14084 _values!549)))))

(declare-fun lt!208509 () ListLongMap!7143)

(assert (=> b!460439 (= lt!208509 (getCurrentListMapNoExtraKeys!1767 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!460440 () Bool)

(declare-fun res!275291 () Bool)

(assert (=> b!460440 (=> (not res!275291) (not e!268628))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!460440 (= res!275291 (validMask!0 mask!1025))))

(declare-fun b!460441 () Bool)

(assert (=> b!460441 (= e!268628 e!268626)))

(declare-fun res!275293 () Bool)

(assert (=> b!460441 (=> (not res!275293) (not e!268626))))

(assert (=> b!460441 (= res!275293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!208508 mask!1025))))

(assert (=> b!460441 (= lt!208508 (array!28582 (store (arr!13731 _keys!709) i!563 k!794) (size!14083 _keys!709)))))

(declare-fun b!460442 () Bool)

(declare-fun e!268627 () Bool)

(assert (=> b!460442 (= e!268627 tp_is_empty!12391)))

(declare-fun b!460443 () Bool)

(declare-fun Unit!13403 () Unit!13400)

(assert (=> b!460443 (= e!268622 Unit!13403)))

(declare-fun b!460444 () Bool)

(declare-fun res!275285 () Bool)

(assert (=> b!460444 (=> (not res!275285) (not e!268626))))

(assert (=> b!460444 (= res!275285 (bvsle from!863 i!563))))

(declare-fun b!460445 () Bool)

(declare-fun e!268624 () Bool)

(assert (=> b!460445 (= e!268629 (not e!268624))))

(declare-fun res!275295 () Bool)

(assert (=> b!460445 (=> res!275295 e!268624)))

(assert (=> b!460445 (= res!275295 (not (validKeyInArray!0 (select (arr!13731 _keys!709) from!863))))))

(declare-fun lt!208510 () ListLongMap!7143)

(declare-fun lt!208502 () ListLongMap!7143)

(assert (=> b!460445 (= lt!208510 lt!208502)))

(declare-fun lt!208503 () ListLongMap!7143)

(declare-fun lt!208506 () tuple2!8230)

(declare-fun +!1623 (ListLongMap!7143 tuple2!8230) ListLongMap!7143)

(assert (=> b!460445 (= lt!208502 (+!1623 lt!208503 lt!208506))))

(assert (=> b!460445 (= lt!208510 (getCurrentListMapNoExtraKeys!1767 lt!208508 lt!208500 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!460445 (= lt!208506 (tuple2!8231 k!794 v!412))))

(assert (=> b!460445 (= lt!208503 (getCurrentListMapNoExtraKeys!1767 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!208497 () Unit!13400)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!779 (array!28581 array!28583 (_ BitVec 32) (_ BitVec 32) V!17627 V!17627 (_ BitVec 32) (_ BitVec 64) V!17627 (_ BitVec 32) Int) Unit!13400)

(assert (=> b!460445 (= lt!208497 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!779 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!460446 () Bool)

(declare-fun e!268625 () Bool)

(assert (=> b!460446 (= e!268624 e!268625)))

(declare-fun res!275287 () Bool)

(assert (=> b!460446 (=> res!275287 e!268625)))

(assert (=> b!460446 (= res!275287 (= k!794 (select (arr!13731 _keys!709) from!863)))))

(assert (=> b!460446 (not (= (select (arr!13731 _keys!709) from!863) k!794))))

(declare-fun lt!208504 () Unit!13400)

(assert (=> b!460446 (= lt!208504 e!268622)))

(declare-fun c!56528 () Bool)

(assert (=> b!460446 (= c!56528 (= (select (arr!13731 _keys!709) from!863) k!794))))

(declare-fun lt!208498 () ListLongMap!7143)

(assert (=> b!460446 (= lt!208507 lt!208498)))

(declare-fun lt!208501 () tuple2!8230)

(assert (=> b!460446 (= lt!208498 (+!1623 lt!208502 lt!208501))))

(declare-fun lt!208505 () V!17627)

(assert (=> b!460446 (= lt!208501 (tuple2!8231 (select (arr!13731 _keys!709) from!863) lt!208505))))

(declare-fun get!6779 (ValueCell!5852 V!17627) V!17627)

(declare-fun dynLambda!907 (Int (_ BitVec 64)) V!17627)

(assert (=> b!460446 (= lt!208505 (get!6779 (select (arr!13732 _values!549) from!863) (dynLambda!907 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!460447 () Bool)

(declare-fun res!275284 () Bool)

(assert (=> b!460447 (=> (not res!275284) (not e!268628))))

(assert (=> b!460447 (= res!275284 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14083 _keys!709))))))

(declare-fun b!460448 () Bool)

(declare-fun mapRes!20236 () Bool)

(assert (=> b!460448 (= e!268620 (and e!268627 mapRes!20236))))

(declare-fun condMapEmpty!20236 () Bool)

(declare-fun mapDefault!20236 () ValueCell!5852)

