; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36954 () Bool)

(assert start!36954)

(declare-fun b_free!8081 () Bool)

(declare-fun b_next!8081 () Bool)

(assert (=> start!36954 (= b_free!8081 (not b_next!8081))))

(declare-fun tp!28958 () Bool)

(declare-fun b_and!15323 () Bool)

(assert (=> start!36954 (= tp!28958 b_and!15323)))

(declare-fun b!370619 () Bool)

(declare-fun e!226339 () Bool)

(assert (=> b!370619 (= e!226339 false)))

(declare-datatypes ((V!12743 0))(
  ( (V!12744 (val!4409 Int)) )
))
(declare-fun zeroValue!472 () V!12743)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!12743)

(declare-datatypes ((tuple2!5846 0))(
  ( (tuple2!5847 (_1!2934 (_ BitVec 64)) (_2!2934 V!12743)) )
))
(declare-datatypes ((List!5685 0))(
  ( (Nil!5682) (Cons!5681 (h!6537 tuple2!5846) (t!10835 List!5685)) )
))
(declare-datatypes ((ListLongMap!4759 0))(
  ( (ListLongMap!4760 (toList!2395 List!5685)) )
))
(declare-fun lt!170010 () ListLongMap!4759)

(declare-datatypes ((ValueCell!4021 0))(
  ( (ValueCellFull!4021 (v!6606 V!12743)) (EmptyCell!4021) )
))
(declare-datatypes ((array!21401 0))(
  ( (array!21402 (arr!10169 (Array (_ BitVec 32) ValueCell!4021)) (size!10521 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21401)

(declare-datatypes ((array!21403 0))(
  ( (array!21404 (arr!10170 (Array (_ BitVec 32) (_ BitVec 64))) (size!10522 (_ BitVec 32))) )
))
(declare-fun lt!170008 () array!21403)

(declare-fun defaultEntry!514 () Int)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!12743)

(declare-fun getCurrentListMapNoExtraKeys!672 (array!21403 array!21401 (_ BitVec 32) (_ BitVec 32) V!12743 V!12743 (_ BitVec 32) Int) ListLongMap!4759)

(assert (=> b!370619 (= lt!170010 (getCurrentListMapNoExtraKeys!672 lt!170008 (array!21402 (store (arr!10169 _values!506) i!548 (ValueCellFull!4021 v!373)) (size!10521 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170009 () ListLongMap!4759)

(declare-fun _keys!658 () array!21403)

(assert (=> b!370619 (= lt!170009 (getCurrentListMapNoExtraKeys!672 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!370620 () Bool)

(declare-fun e!226338 () Bool)

(assert (=> b!370620 (= e!226338 e!226339)))

(declare-fun res!208164 () Bool)

(assert (=> b!370620 (=> (not res!208164) (not e!226339))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21403 (_ BitVec 32)) Bool)

(assert (=> b!370620 (= res!208164 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170008 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(assert (=> b!370620 (= lt!170008 (array!21404 (store (arr!10170 _keys!658) i!548 k!778) (size!10522 _keys!658)))))

(declare-fun b!370621 () Bool)

(declare-fun res!208168 () Bool)

(assert (=> b!370621 (=> (not res!208168) (not e!226338))))

(assert (=> b!370621 (= res!208168 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10522 _keys!658))))))

(declare-fun b!370622 () Bool)

(declare-fun res!208162 () Bool)

(assert (=> b!370622 (=> (not res!208162) (not e!226338))))

(assert (=> b!370622 (= res!208162 (and (= (size!10521 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10522 _keys!658) (size!10521 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!370623 () Bool)

(declare-fun e!226343 () Bool)

(declare-fun tp_is_empty!8729 () Bool)

(assert (=> b!370623 (= e!226343 tp_is_empty!8729)))

(declare-fun b!370624 () Bool)

(declare-fun res!208161 () Bool)

(assert (=> b!370624 (=> (not res!208161) (not e!226338))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!370624 (= res!208161 (validKeyInArray!0 k!778))))

(declare-fun b!370625 () Bool)

(declare-fun e!226341 () Bool)

(declare-fun e!226342 () Bool)

(declare-fun mapRes!14658 () Bool)

(assert (=> b!370625 (= e!226341 (and e!226342 mapRes!14658))))

(declare-fun condMapEmpty!14658 () Bool)

(declare-fun mapDefault!14658 () ValueCell!4021)

