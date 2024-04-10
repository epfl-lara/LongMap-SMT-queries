; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36894 () Bool)

(assert start!36894)

(declare-fun b_free!8021 () Bool)

(declare-fun b_next!8021 () Bool)

(assert (=> start!36894 (= b_free!8021 (not b_next!8021))))

(declare-fun tp!28778 () Bool)

(declare-fun b_and!15263 () Bool)

(assert (=> start!36894 (= tp!28778 b_and!15263)))

(declare-fun b!369449 () Bool)

(declare-fun res!207268 () Bool)

(declare-fun e!225799 () Bool)

(assert (=> b!369449 (=> (not res!207268) (not e!225799))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!369449 (= res!207268 (validKeyInArray!0 k!778))))

(declare-fun b!369450 () Bool)

(declare-fun e!225802 () Bool)

(declare-fun tp_is_empty!8669 () Bool)

(assert (=> b!369450 (= e!225802 tp_is_empty!8669)))

(declare-fun b!369451 () Bool)

(declare-fun e!225798 () Bool)

(assert (=> b!369451 (= e!225798 false)))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((V!12663 0))(
  ( (V!12664 (val!4379 Int)) )
))
(declare-datatypes ((tuple2!5810 0))(
  ( (tuple2!5811 (_1!2916 (_ BitVec 64)) (_2!2916 V!12663)) )
))
(declare-datatypes ((List!5644 0))(
  ( (Nil!5641) (Cons!5640 (h!6496 tuple2!5810) (t!10794 List!5644)) )
))
(declare-datatypes ((ListLongMap!4723 0))(
  ( (ListLongMap!4724 (toList!2377 List!5644)) )
))
(declare-fun lt!169740 () ListLongMap!4723)

(declare-fun zeroValue!472 () V!12663)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!12663)

(declare-datatypes ((array!21289 0))(
  ( (array!21290 (arr!10113 (Array (_ BitVec 32) (_ BitVec 64))) (size!10465 (_ BitVec 32))) )
))
(declare-fun lt!169738 () array!21289)

(declare-datatypes ((ValueCell!3991 0))(
  ( (ValueCellFull!3991 (v!6576 V!12663)) (EmptyCell!3991) )
))
(declare-datatypes ((array!21291 0))(
  ( (array!21292 (arr!10114 (Array (_ BitVec 32) ValueCell!3991)) (size!10466 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21291)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!12663)

(declare-fun getCurrentListMapNoExtraKeys!654 (array!21289 array!21291 (_ BitVec 32) (_ BitVec 32) V!12663 V!12663 (_ BitVec 32) Int) ListLongMap!4723)

(assert (=> b!369451 (= lt!169740 (getCurrentListMapNoExtraKeys!654 lt!169738 (array!21292 (store (arr!10114 _values!506) i!548 (ValueCellFull!3991 v!373)) (size!10466 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169739 () ListLongMap!4723)

(declare-fun _keys!658 () array!21289)

(assert (=> b!369451 (= lt!169739 (getCurrentListMapNoExtraKeys!654 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!369452 () Bool)

(declare-fun res!207265 () Bool)

(assert (=> b!369452 (=> (not res!207265) (not e!225799))))

(declare-datatypes ((List!5645 0))(
  ( (Nil!5642) (Cons!5641 (h!6497 (_ BitVec 64)) (t!10795 List!5645)) )
))
(declare-fun arrayNoDuplicates!0 (array!21289 (_ BitVec 32) List!5645) Bool)

(assert (=> b!369452 (= res!207265 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5642))))

(declare-fun b!369453 () Bool)

(declare-fun res!207267 () Bool)

(assert (=> b!369453 (=> (not res!207267) (not e!225798))))

(assert (=> b!369453 (= res!207267 (arrayNoDuplicates!0 lt!169738 #b00000000000000000000000000000000 Nil!5642))))

(declare-fun res!207262 () Bool)

(assert (=> start!36894 (=> (not res!207262) (not e!225799))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36894 (= res!207262 (validMask!0 mask!970))))

(assert (=> start!36894 e!225799))

(declare-fun e!225803 () Bool)

(declare-fun array_inv!7476 (array!21291) Bool)

(assert (=> start!36894 (and (array_inv!7476 _values!506) e!225803)))

(assert (=> start!36894 tp!28778))

(assert (=> start!36894 true))

(assert (=> start!36894 tp_is_empty!8669))

(declare-fun array_inv!7477 (array!21289) Bool)

(assert (=> start!36894 (array_inv!7477 _keys!658)))

(declare-fun b!369454 () Bool)

(declare-fun res!207266 () Bool)

(assert (=> b!369454 (=> (not res!207266) (not e!225799))))

(assert (=> b!369454 (= res!207266 (or (= (select (arr!10113 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10113 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!369455 () Bool)

(declare-fun res!207260 () Bool)

(assert (=> b!369455 (=> (not res!207260) (not e!225799))))

(assert (=> b!369455 (= res!207260 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10465 _keys!658))))))

(declare-fun mapIsEmpty!14568 () Bool)

(declare-fun mapRes!14568 () Bool)

(assert (=> mapIsEmpty!14568 mapRes!14568))

(declare-fun b!369456 () Bool)

(assert (=> b!369456 (= e!225803 (and e!225802 mapRes!14568))))

(declare-fun condMapEmpty!14568 () Bool)

(declare-fun mapDefault!14568 () ValueCell!3991)

