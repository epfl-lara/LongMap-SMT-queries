; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36990 () Bool)

(assert start!36990)

(declare-fun b_free!8117 () Bool)

(declare-fun b_next!8117 () Bool)

(assert (=> start!36990 (= b_free!8117 (not b_next!8117))))

(declare-fun tp!29066 () Bool)

(declare-fun b_and!15359 () Bool)

(assert (=> start!36990 (= tp!29066 b_and!15359)))

(declare-fun b!371321 () Bool)

(declare-fun e!226666 () Bool)

(assert (=> b!371321 (= e!226666 (not true))))

(declare-datatypes ((V!12791 0))(
  ( (V!12792 (val!4427 Int)) )
))
(declare-datatypes ((tuple2!5874 0))(
  ( (tuple2!5875 (_1!2948 (_ BitVec 64)) (_2!2948 V!12791)) )
))
(declare-datatypes ((List!5713 0))(
  ( (Nil!5710) (Cons!5709 (h!6565 tuple2!5874) (t!10863 List!5713)) )
))
(declare-datatypes ((ListLongMap!4787 0))(
  ( (ListLongMap!4788 (toList!2409 List!5713)) )
))
(declare-fun lt!170244 () ListLongMap!4787)

(declare-fun lt!170242 () ListLongMap!4787)

(assert (=> b!371321 (and (= lt!170244 lt!170242) (= lt!170242 lt!170244))))

(declare-fun v!373 () V!12791)

(declare-fun lt!170241 () ListLongMap!4787)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun +!755 (ListLongMap!4787 tuple2!5874) ListLongMap!4787)

(assert (=> b!371321 (= lt!170242 (+!755 lt!170241 (tuple2!5875 k!778 v!373)))))

(declare-datatypes ((ValueCell!4039 0))(
  ( (ValueCellFull!4039 (v!6624 V!12791)) (EmptyCell!4039) )
))
(declare-datatypes ((array!21471 0))(
  ( (array!21472 (arr!10204 (Array (_ BitVec 32) ValueCell!4039)) (size!10556 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21471)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12791)

(declare-datatypes ((array!21473 0))(
  ( (array!21474 (arr!10205 (Array (_ BitVec 32) (_ BitVec 64))) (size!10557 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21473)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((Unit!11416 0))(
  ( (Unit!11417) )
))
(declare-fun lt!170243 () Unit!11416)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!12791)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!10 (array!21473 array!21471 (_ BitVec 32) (_ BitVec 32) V!12791 V!12791 (_ BitVec 32) (_ BitVec 64) V!12791 (_ BitVec 32) Int) Unit!11416)

(assert (=> b!371321 (= lt!170243 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!10 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170240 () array!21473)

(declare-fun getCurrentListMapNoExtraKeys!686 (array!21473 array!21471 (_ BitVec 32) (_ BitVec 32) V!12791 V!12791 (_ BitVec 32) Int) ListLongMap!4787)

(assert (=> b!371321 (= lt!170244 (getCurrentListMapNoExtraKeys!686 lt!170240 (array!21472 (store (arr!10204 _values!506) i!548 (ValueCellFull!4039 v!373)) (size!10556 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!371321 (= lt!170241 (getCurrentListMapNoExtraKeys!686 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!371322 () Bool)

(declare-fun res!208700 () Bool)

(declare-fun e!226663 () Bool)

(assert (=> b!371322 (=> (not res!208700) (not e!226663))))

(declare-datatypes ((List!5714 0))(
  ( (Nil!5711) (Cons!5710 (h!6566 (_ BitVec 64)) (t!10864 List!5714)) )
))
(declare-fun arrayNoDuplicates!0 (array!21473 (_ BitVec 32) List!5714) Bool)

(assert (=> b!371322 (= res!208700 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5711))))

(declare-fun b!371323 () Bool)

(declare-fun e!226664 () Bool)

(declare-fun tp_is_empty!8765 () Bool)

(assert (=> b!371323 (= e!226664 tp_is_empty!8765)))

(declare-fun b!371324 () Bool)

(declare-fun res!208708 () Bool)

(assert (=> b!371324 (=> (not res!208708) (not e!226663))))

(assert (=> b!371324 (= res!208708 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10557 _keys!658))))))

(declare-fun b!371325 () Bool)

(declare-fun res!208703 () Bool)

(assert (=> b!371325 (=> (not res!208703) (not e!226663))))

(assert (=> b!371325 (= res!208703 (and (= (size!10556 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10557 _keys!658) (size!10556 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!371326 () Bool)

(assert (=> b!371326 (= e!226663 e!226666)))

(declare-fun res!208709 () Bool)

(assert (=> b!371326 (=> (not res!208709) (not e!226666))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21473 (_ BitVec 32)) Bool)

(assert (=> b!371326 (= res!208709 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170240 mask!970))))

(assert (=> b!371326 (= lt!170240 (array!21474 (store (arr!10205 _keys!658) i!548 k!778) (size!10557 _keys!658)))))

(declare-fun b!371327 () Bool)

(declare-fun res!208701 () Bool)

(assert (=> b!371327 (=> (not res!208701) (not e!226663))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!371327 (= res!208701 (validKeyInArray!0 k!778))))

(declare-fun res!208702 () Bool)

(assert (=> start!36990 (=> (not res!208702) (not e!226663))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36990 (= res!208702 (validMask!0 mask!970))))

(assert (=> start!36990 e!226663))

(declare-fun e!226665 () Bool)

(declare-fun array_inv!7536 (array!21471) Bool)

(assert (=> start!36990 (and (array_inv!7536 _values!506) e!226665)))

(assert (=> start!36990 tp!29066))

(assert (=> start!36990 true))

(assert (=> start!36990 tp_is_empty!8765))

(declare-fun array_inv!7537 (array!21473) Bool)

(assert (=> start!36990 (array_inv!7537 _keys!658)))

(declare-fun mapIsEmpty!14712 () Bool)

(declare-fun mapRes!14712 () Bool)

(assert (=> mapIsEmpty!14712 mapRes!14712))

(declare-fun b!371328 () Bool)

(declare-fun e!226662 () Bool)

(assert (=> b!371328 (= e!226665 (and e!226662 mapRes!14712))))

(declare-fun condMapEmpty!14712 () Bool)

(declare-fun mapDefault!14712 () ValueCell!4039)

