; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74320 () Bool)

(assert start!74320)

(declare-fun b_free!15083 () Bool)

(declare-fun b_next!15083 () Bool)

(assert (=> start!74320 (= b_free!15083 (not b_next!15083))))

(declare-fun tp!52924 () Bool)

(declare-fun b_and!24859 () Bool)

(assert (=> start!74320 (= tp!52924 b_and!24859)))

(declare-fun mapIsEmpty!27599 () Bool)

(declare-fun mapRes!27599 () Bool)

(assert (=> mapIsEmpty!27599 mapRes!27599))

(declare-fun b!874544 () Bool)

(declare-fun res!594329 () Bool)

(declare-fun e!486920 () Bool)

(assert (=> b!874544 (=> (not res!594329) (not e!486920))))

(declare-datatypes ((array!50782 0))(
  ( (array!50783 (arr!24419 (Array (_ BitVec 32) (_ BitVec 64))) (size!24859 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50782)

(declare-datatypes ((List!17333 0))(
  ( (Nil!17330) (Cons!17329 (h!18460 (_ BitVec 64)) (t!24374 List!17333)) )
))
(declare-fun arrayNoDuplicates!0 (array!50782 (_ BitVec 32) List!17333) Bool)

(assert (=> b!874544 (= res!594329 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17330))))

(declare-fun b!874545 () Bool)

(declare-fun e!486916 () Bool)

(declare-fun tp_is_empty!17327 () Bool)

(assert (=> b!874545 (= e!486916 tp_is_empty!17327)))

(declare-fun b!874546 () Bool)

(declare-fun res!594327 () Bool)

(assert (=> b!874546 (=> (not res!594327) (not e!486920))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!874546 (= res!594327 (and (= (select (arr!24419 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!874547 () Bool)

(declare-fun res!594330 () Bool)

(assert (=> b!874547 (=> (not res!594330) (not e!486920))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!874547 (= res!594330 (validKeyInArray!0 k!854))))

(declare-fun b!874548 () Bool)

(declare-fun res!594326 () Bool)

(assert (=> b!874548 (=> (not res!594326) (not e!486920))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50782 (_ BitVec 32)) Bool)

(assert (=> b!874548 (= res!594326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!874549 () Bool)

(declare-fun res!594325 () Bool)

(assert (=> b!874549 (=> (not res!594325) (not e!486920))))

(assert (=> b!874549 (= res!594325 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24859 _keys!868))))))

(declare-fun b!874550 () Bool)

(declare-fun e!486919 () Bool)

(declare-fun e!486918 () Bool)

(assert (=> b!874550 (= e!486919 (and e!486918 mapRes!27599))))

(declare-fun condMapEmpty!27599 () Bool)

(declare-datatypes ((V!28149 0))(
  ( (V!28150 (val!8711 Int)) )
))
(declare-datatypes ((ValueCell!8224 0))(
  ( (ValueCellFull!8224 (v!11140 V!28149)) (EmptyCell!8224) )
))
(declare-datatypes ((array!50784 0))(
  ( (array!50785 (arr!24420 (Array (_ BitVec 32) ValueCell!8224)) (size!24860 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50784)

(declare-fun mapDefault!27599 () ValueCell!8224)

