; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37344 () Bool)

(assert start!37344)

(declare-fun b_free!8471 () Bool)

(declare-fun b_next!8471 () Bool)

(assert (=> start!37344 (= b_free!8471 (not b_next!8471))))

(declare-fun tp!30129 () Bool)

(declare-fun b_and!15713 () Bool)

(assert (=> start!37344 (= tp!30129 b_and!15713)))

(declare-fun b!379050 () Bool)

(declare-fun res!214836 () Bool)

(declare-fun e!230652 () Bool)

(assert (=> b!379050 (=> (not res!214836) (not e!230652))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!379050 (= res!214836 (validKeyInArray!0 k!778))))

(declare-fun b!379051 () Bool)

(declare-fun res!214839 () Bool)

(assert (=> b!379051 (=> (not res!214839) (not e!230652))))

(declare-datatypes ((array!22161 0))(
  ( (array!22162 (arr!10549 (Array (_ BitVec 32) (_ BitVec 64))) (size!10901 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22161)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!379051 (= res!214839 (or (= (select (arr!10549 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10549 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!379052 () Bool)

(declare-fun res!214840 () Bool)

(declare-fun e!230651 () Bool)

(assert (=> b!379052 (=> (not res!214840) (not e!230651))))

(declare-fun lt!176856 () array!22161)

(declare-datatypes ((List!5992 0))(
  ( (Nil!5989) (Cons!5988 (h!6844 (_ BitVec 64)) (t!11142 List!5992)) )
))
(declare-fun arrayNoDuplicates!0 (array!22161 (_ BitVec 32) List!5992) Bool)

(assert (=> b!379052 (= res!214840 (arrayNoDuplicates!0 lt!176856 #b00000000000000000000000000000000 Nil!5989))))

(declare-fun b!379054 () Bool)

(declare-fun res!214845 () Bool)

(assert (=> b!379054 (=> (not res!214845) (not e!230652))))

(declare-fun arrayContainsKey!0 (array!22161 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!379054 (= res!214845 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!379055 () Bool)

(declare-fun res!214837 () Bool)

(assert (=> b!379055 (=> (not res!214837) (not e!230652))))

(assert (=> b!379055 (= res!214837 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10901 _keys!658))))))

(declare-fun b!379056 () Bool)

(declare-fun res!214844 () Bool)

(assert (=> b!379056 (=> (not res!214844) (not e!230652))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22161 (_ BitVec 32)) Bool)

(assert (=> b!379056 (= res!214844 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!379057 () Bool)

(declare-fun e!230648 () Bool)

(declare-fun tp_is_empty!9119 () Bool)

(assert (=> b!379057 (= e!230648 tp_is_empty!9119)))

(declare-fun b!379058 () Bool)

(declare-fun e!230649 () Bool)

(declare-fun e!230653 () Bool)

(assert (=> b!379058 (= e!230649 e!230653)))

(declare-fun res!214841 () Bool)

(assert (=> b!379058 (=> res!214841 e!230653)))

(assert (=> b!379058 (= res!214841 (= k!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!13263 0))(
  ( (V!13264 (val!4604 Int)) )
))
(declare-datatypes ((tuple2!6156 0))(
  ( (tuple2!6157 (_1!3089 (_ BitVec 64)) (_2!3089 V!13263)) )
))
(declare-datatypes ((List!5993 0))(
  ( (Nil!5990) (Cons!5989 (h!6845 tuple2!6156) (t!11143 List!5993)) )
))
(declare-datatypes ((ListLongMap!5069 0))(
  ( (ListLongMap!5070 (toList!2550 List!5993)) )
))
(declare-fun lt!176849 () ListLongMap!5069)

(declare-fun lt!176854 () ListLongMap!5069)

(assert (=> b!379058 (= lt!176849 lt!176854)))

(declare-fun lt!176855 () ListLongMap!5069)

(declare-fun lt!176850 () tuple2!6156)

(declare-fun +!896 (ListLongMap!5069 tuple2!6156) ListLongMap!5069)

(assert (=> b!379058 (= lt!176854 (+!896 lt!176855 lt!176850))))

(declare-fun lt!176859 () ListLongMap!5069)

(declare-fun lt!176847 () ListLongMap!5069)

(assert (=> b!379058 (= lt!176859 lt!176847)))

(declare-fun lt!176853 () ListLongMap!5069)

(assert (=> b!379058 (= lt!176847 (+!896 lt!176853 lt!176850))))

(declare-fun lt!176858 () ListLongMap!5069)

(assert (=> b!379058 (= lt!176859 (+!896 lt!176858 lt!176850))))

(declare-fun minValue!472 () V!13263)

(assert (=> b!379058 (= lt!176850 (tuple2!6157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!379059 () Bool)

(assert (=> b!379059 (= e!230653 true)))

(declare-fun lt!176851 () tuple2!6156)

(assert (=> b!379059 (= lt!176847 (+!896 lt!176854 lt!176851))))

(declare-datatypes ((Unit!11690 0))(
  ( (Unit!11691) )
))
(declare-fun lt!176857 () Unit!11690)

(declare-fun v!373 () V!13263)

(declare-fun addCommutativeForDiffKeys!296 (ListLongMap!5069 (_ BitVec 64) V!13263 (_ BitVec 64) V!13263) Unit!11690)

(assert (=> b!379059 (= lt!176857 (addCommutativeForDiffKeys!296 lt!176855 k!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun mapNonEmpty!15243 () Bool)

(declare-fun mapRes!15243 () Bool)

(declare-fun tp!30128 () Bool)

(declare-fun e!230654 () Bool)

(assert (=> mapNonEmpty!15243 (= mapRes!15243 (and tp!30128 e!230654))))

(declare-datatypes ((ValueCell!4216 0))(
  ( (ValueCellFull!4216 (v!6801 V!13263)) (EmptyCell!4216) )
))
(declare-fun mapValue!15243 () ValueCell!4216)

(declare-fun mapKey!15243 () (_ BitVec 32))

(declare-fun mapRest!15243 () (Array (_ BitVec 32) ValueCell!4216))

(declare-datatypes ((array!22163 0))(
  ( (array!22164 (arr!10550 (Array (_ BitVec 32) ValueCell!4216)) (size!10902 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22163)

(assert (=> mapNonEmpty!15243 (= (arr!10550 _values!506) (store mapRest!15243 mapKey!15243 mapValue!15243))))

(declare-fun b!379060 () Bool)

(declare-fun res!214838 () Bool)

(assert (=> b!379060 (=> (not res!214838) (not e!230652))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!379060 (= res!214838 (and (= (size!10902 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10901 _keys!658) (size!10902 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!379061 () Bool)

(assert (=> b!379061 (= e!230651 (not e!230649))))

(declare-fun res!214842 () Bool)

(assert (=> b!379061 (=> res!214842 e!230649)))

(assert (=> b!379061 (= res!214842 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13263)

(declare-fun getCurrentListMap!1973 (array!22161 array!22163 (_ BitVec 32) (_ BitVec 32) V!13263 V!13263 (_ BitVec 32) Int) ListLongMap!5069)

(assert (=> b!379061 (= lt!176849 (getCurrentListMap!1973 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176852 () array!22163)

(assert (=> b!379061 (= lt!176859 (getCurrentListMap!1973 lt!176856 lt!176852 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!379061 (and (= lt!176858 lt!176853) (= lt!176853 lt!176858))))

(assert (=> b!379061 (= lt!176853 (+!896 lt!176855 lt!176851))))

(assert (=> b!379061 (= lt!176851 (tuple2!6157 k!778 v!373))))

(declare-fun lt!176848 () Unit!11690)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!131 (array!22161 array!22163 (_ BitVec 32) (_ BitVec 32) V!13263 V!13263 (_ BitVec 32) (_ BitVec 64) V!13263 (_ BitVec 32) Int) Unit!11690)

(assert (=> b!379061 (= lt!176848 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!131 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!807 (array!22161 array!22163 (_ BitVec 32) (_ BitVec 32) V!13263 V!13263 (_ BitVec 32) Int) ListLongMap!5069)

(assert (=> b!379061 (= lt!176858 (getCurrentListMapNoExtraKeys!807 lt!176856 lt!176852 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!379061 (= lt!176852 (array!22164 (store (arr!10550 _values!506) i!548 (ValueCellFull!4216 v!373)) (size!10902 _values!506)))))

(assert (=> b!379061 (= lt!176855 (getCurrentListMapNoExtraKeys!807 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!379062 () Bool)

(declare-fun e!230650 () Bool)

(assert (=> b!379062 (= e!230650 (and e!230648 mapRes!15243))))

(declare-fun condMapEmpty!15243 () Bool)

(declare-fun mapDefault!15243 () ValueCell!4216)

