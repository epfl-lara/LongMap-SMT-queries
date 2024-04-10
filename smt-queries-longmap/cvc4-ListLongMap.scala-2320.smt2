; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37386 () Bool)

(assert start!37386)

(declare-fun b_free!8513 () Bool)

(declare-fun b_next!8513 () Bool)

(assert (=> start!37386 (= b_free!8513 (not b_next!8513))))

(declare-fun tp!30254 () Bool)

(declare-fun b_and!15755 () Bool)

(assert (=> start!37386 (= tp!30254 b_and!15755)))

(declare-fun mapNonEmpty!15306 () Bool)

(declare-fun mapRes!15306 () Bool)

(declare-fun tp!30255 () Bool)

(declare-fun e!231155 () Bool)

(assert (=> mapNonEmpty!15306 (= mapRes!15306 (and tp!30255 e!231155))))

(declare-datatypes ((V!13319 0))(
  ( (V!13320 (val!4625 Int)) )
))
(declare-datatypes ((ValueCell!4237 0))(
  ( (ValueCellFull!4237 (v!6822 V!13319)) (EmptyCell!4237) )
))
(declare-datatypes ((array!22243 0))(
  ( (array!22244 (arr!10590 (Array (_ BitVec 32) ValueCell!4237)) (size!10942 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22243)

(declare-fun mapValue!15306 () ValueCell!4237)

(declare-fun mapKey!15306 () (_ BitVec 32))

(declare-fun mapRest!15306 () (Array (_ BitVec 32) ValueCell!4237))

(assert (=> mapNonEmpty!15306 (= (arr!10590 _values!506) (store mapRest!15306 mapKey!15306 mapValue!15306))))

(declare-fun b!379995 () Bool)

(declare-fun res!215601 () Bool)

(declare-fun e!231157 () Bool)

(assert (=> b!379995 (=> (not res!215601) (not e!231157))))

(declare-datatypes ((array!22245 0))(
  ( (array!22246 (arr!10591 (Array (_ BitVec 32) (_ BitVec 64))) (size!10943 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22245)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22245 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!379995 (= res!215601 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!379996 () Bool)

(declare-fun e!231154 () Bool)

(declare-fun tp_is_empty!9161 () Bool)

(assert (=> b!379996 (= e!231154 tp_is_empty!9161)))

(declare-fun b!379997 () Bool)

(declare-fun e!231152 () Bool)

(declare-fun e!231153 () Bool)

(assert (=> b!379997 (= e!231152 (not e!231153))))

(declare-fun res!215602 () Bool)

(assert (=> b!379997 (=> res!215602 e!231153)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!379997 (= res!215602 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13319)

(declare-datatypes ((tuple2!6196 0))(
  ( (tuple2!6197 (_1!3109 (_ BitVec 64)) (_2!3109 V!13319)) )
))
(declare-datatypes ((List!6031 0))(
  ( (Nil!6028) (Cons!6027 (h!6883 tuple2!6196) (t!11181 List!6031)) )
))
(declare-datatypes ((ListLongMap!5109 0))(
  ( (ListLongMap!5110 (toList!2570 List!6031)) )
))
(declare-fun lt!177669 () ListLongMap!5109)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13319)

(declare-fun getCurrentListMap!1987 (array!22245 array!22243 (_ BitVec 32) (_ BitVec 32) V!13319 V!13319 (_ BitVec 32) Int) ListLongMap!5109)

(assert (=> b!379997 (= lt!177669 (getCurrentListMap!1987 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177670 () ListLongMap!5109)

(declare-fun lt!177678 () array!22243)

(declare-fun lt!177676 () array!22245)

(assert (=> b!379997 (= lt!177670 (getCurrentListMap!1987 lt!177676 lt!177678 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177677 () ListLongMap!5109)

(declare-fun lt!177666 () ListLongMap!5109)

(assert (=> b!379997 (and (= lt!177677 lt!177666) (= lt!177666 lt!177677))))

(declare-fun lt!177674 () ListLongMap!5109)

(declare-fun lt!177667 () tuple2!6196)

(declare-fun +!916 (ListLongMap!5109 tuple2!6196) ListLongMap!5109)

(assert (=> b!379997 (= lt!177666 (+!916 lt!177674 lt!177667))))

(declare-fun v!373 () V!13319)

(assert (=> b!379997 (= lt!177667 (tuple2!6197 k!778 v!373))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((Unit!11726 0))(
  ( (Unit!11727) )
))
(declare-fun lt!177668 () Unit!11726)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!145 (array!22245 array!22243 (_ BitVec 32) (_ BitVec 32) V!13319 V!13319 (_ BitVec 32) (_ BitVec 64) V!13319 (_ BitVec 32) Int) Unit!11726)

(assert (=> b!379997 (= lt!177668 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!145 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!821 (array!22245 array!22243 (_ BitVec 32) (_ BitVec 32) V!13319 V!13319 (_ BitVec 32) Int) ListLongMap!5109)

(assert (=> b!379997 (= lt!177677 (getCurrentListMapNoExtraKeys!821 lt!177676 lt!177678 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!379997 (= lt!177678 (array!22244 (store (arr!10590 _values!506) i!548 (ValueCellFull!4237 v!373)) (size!10942 _values!506)))))

(assert (=> b!379997 (= lt!177674 (getCurrentListMapNoExtraKeys!821 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun res!215600 () Bool)

(assert (=> start!37386 (=> (not res!215600) (not e!231157))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37386 (= res!215600 (validMask!0 mask!970))))

(assert (=> start!37386 e!231157))

(declare-fun e!231151 () Bool)

(declare-fun array_inv!7798 (array!22243) Bool)

(assert (=> start!37386 (and (array_inv!7798 _values!506) e!231151)))

(assert (=> start!37386 tp!30254))

(assert (=> start!37386 true))

(assert (=> start!37386 tp_is_empty!9161))

(declare-fun array_inv!7799 (array!22245) Bool)

(assert (=> start!37386 (array_inv!7799 _keys!658)))

(declare-fun b!379998 () Bool)

(declare-fun res!215603 () Bool)

(assert (=> b!379998 (=> (not res!215603) (not e!231157))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22245 (_ BitVec 32)) Bool)

(assert (=> b!379998 (= res!215603 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!379999 () Bool)

(declare-fun res!215592 () Bool)

(assert (=> b!379999 (=> (not res!215592) (not e!231157))))

(declare-datatypes ((List!6032 0))(
  ( (Nil!6029) (Cons!6028 (h!6884 (_ BitVec 64)) (t!11182 List!6032)) )
))
(declare-fun arrayNoDuplicates!0 (array!22245 (_ BitVec 32) List!6032) Bool)

(assert (=> b!379999 (= res!215592 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6029))))

(declare-fun b!380000 () Bool)

(declare-fun e!231156 () Bool)

(assert (=> b!380000 (= e!231156 true)))

(declare-fun lt!177672 () ListLongMap!5109)

(declare-fun lt!177673 () ListLongMap!5109)

(assert (=> b!380000 (= lt!177672 (+!916 lt!177673 lt!177667))))

(declare-fun lt!177671 () Unit!11726)

(declare-fun addCommutativeForDiffKeys!313 (ListLongMap!5109 (_ BitVec 64) V!13319 (_ BitVec 64) V!13319) Unit!11726)

(assert (=> b!380000 (= lt!177671 (addCommutativeForDiffKeys!313 lt!177674 k!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!380001 () Bool)

(declare-fun res!215595 () Bool)

(assert (=> b!380001 (=> (not res!215595) (not e!231152))))

(assert (=> b!380001 (= res!215595 (arrayNoDuplicates!0 lt!177676 #b00000000000000000000000000000000 Nil!6029))))

(declare-fun b!380002 () Bool)

(assert (=> b!380002 (= e!231153 e!231156)))

(declare-fun res!215597 () Bool)

(assert (=> b!380002 (=> res!215597 e!231156)))

(assert (=> b!380002 (= res!215597 (= k!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!380002 (= lt!177669 lt!177673)))

(declare-fun lt!177675 () tuple2!6196)

(assert (=> b!380002 (= lt!177673 (+!916 lt!177674 lt!177675))))

(assert (=> b!380002 (= lt!177670 lt!177672)))

(assert (=> b!380002 (= lt!177672 (+!916 lt!177666 lt!177675))))

(assert (=> b!380002 (= lt!177670 (+!916 lt!177677 lt!177675))))

(assert (=> b!380002 (= lt!177675 (tuple2!6197 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!380003 () Bool)

(declare-fun res!215593 () Bool)

(assert (=> b!380003 (=> (not res!215593) (not e!231157))))

(assert (=> b!380003 (= res!215593 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10943 _keys!658))))))

(declare-fun mapIsEmpty!15306 () Bool)

(assert (=> mapIsEmpty!15306 mapRes!15306))

(declare-fun b!380004 () Bool)

(declare-fun res!215594 () Bool)

(assert (=> b!380004 (=> (not res!215594) (not e!231157))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!380004 (= res!215594 (validKeyInArray!0 k!778))))

(declare-fun b!380005 () Bool)

(declare-fun res!215598 () Bool)

(assert (=> b!380005 (=> (not res!215598) (not e!231157))))

(assert (=> b!380005 (= res!215598 (or (= (select (arr!10591 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10591 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!380006 () Bool)

(assert (=> b!380006 (= e!231157 e!231152)))

(declare-fun res!215599 () Bool)

(assert (=> b!380006 (=> (not res!215599) (not e!231152))))

(assert (=> b!380006 (= res!215599 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!177676 mask!970))))

(assert (=> b!380006 (= lt!177676 (array!22246 (store (arr!10591 _keys!658) i!548 k!778) (size!10943 _keys!658)))))

(declare-fun b!380007 () Bool)

(assert (=> b!380007 (= e!231155 tp_is_empty!9161)))

(declare-fun b!380008 () Bool)

(assert (=> b!380008 (= e!231151 (and e!231154 mapRes!15306))))

(declare-fun condMapEmpty!15306 () Bool)

(declare-fun mapDefault!15306 () ValueCell!4237)

