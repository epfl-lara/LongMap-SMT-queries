; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37298 () Bool)

(assert start!37298)

(declare-fun b_free!8425 () Bool)

(declare-fun b_next!8425 () Bool)

(assert (=> start!37298 (= b_free!8425 (not b_next!8425))))

(declare-fun tp!29990 () Bool)

(declare-fun b_and!15667 () Bool)

(assert (=> start!37298 (= tp!29990 b_and!15667)))

(declare-fun res!214008 () Bool)

(declare-fun e!230096 () Bool)

(assert (=> start!37298 (=> (not res!214008) (not e!230096))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37298 (= res!214008 (validMask!0 mask!970))))

(assert (=> start!37298 e!230096))

(declare-datatypes ((V!13203 0))(
  ( (V!13204 (val!4581 Int)) )
))
(declare-datatypes ((ValueCell!4193 0))(
  ( (ValueCellFull!4193 (v!6778 V!13203)) (EmptyCell!4193) )
))
(declare-datatypes ((array!22073 0))(
  ( (array!22074 (arr!10505 (Array (_ BitVec 32) ValueCell!4193)) (size!10857 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22073)

(declare-fun e!230095 () Bool)

(declare-fun array_inv!7738 (array!22073) Bool)

(assert (=> start!37298 (and (array_inv!7738 _values!506) e!230095)))

(assert (=> start!37298 tp!29990))

(assert (=> start!37298 true))

(declare-fun tp_is_empty!9073 () Bool)

(assert (=> start!37298 tp_is_empty!9073))

(declare-datatypes ((array!22075 0))(
  ( (array!22076 (arr!10506 (Array (_ BitVec 32) (_ BitVec 64))) (size!10858 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22075)

(declare-fun array_inv!7739 (array!22075) Bool)

(assert (=> start!37298 (array_inv!7739 _keys!658)))

(declare-fun b!378006 () Bool)

(declare-fun res!214009 () Bool)

(assert (=> b!378006 (=> (not res!214009) (not e!230096))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22075 (_ BitVec 32)) Bool)

(assert (=> b!378006 (= res!214009 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!378007 () Bool)

(declare-fun e!230100 () Bool)

(declare-fun e!230099 () Bool)

(assert (=> b!378007 (= e!230100 (not e!230099))))

(declare-fun res!214002 () Bool)

(assert (=> b!378007 (=> res!214002 e!230099)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!378007 (= res!214002 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6114 0))(
  ( (tuple2!6115 (_1!3068 (_ BitVec 64)) (_2!3068 V!13203)) )
))
(declare-datatypes ((List!5952 0))(
  ( (Nil!5949) (Cons!5948 (h!6804 tuple2!6114) (t!11102 List!5952)) )
))
(declare-datatypes ((ListLongMap!5027 0))(
  ( (ListLongMap!5028 (toList!2529 List!5952)) )
))
(declare-fun lt!175987 () ListLongMap!5027)

(declare-fun zeroValue!472 () V!13203)

(declare-fun minValue!472 () V!13203)

(declare-fun getCurrentListMap!1956 (array!22075 array!22073 (_ BitVec 32) (_ BitVec 32) V!13203 V!13203 (_ BitVec 32) Int) ListLongMap!5027)

(assert (=> b!378007 (= lt!175987 (getCurrentListMap!1956 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175994 () array!22075)

(declare-fun lt!175989 () array!22073)

(declare-fun lt!175991 () ListLongMap!5027)

(assert (=> b!378007 (= lt!175991 (getCurrentListMap!1956 lt!175994 lt!175989 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175998 () ListLongMap!5027)

(declare-fun lt!175988 () ListLongMap!5027)

(assert (=> b!378007 (and (= lt!175998 lt!175988) (= lt!175988 lt!175998))))

(declare-fun lt!175995 () ListLongMap!5027)

(declare-fun lt!175986 () tuple2!6114)

(declare-fun +!875 (ListLongMap!5027 tuple2!6114) ListLongMap!5027)

(assert (=> b!378007 (= lt!175988 (+!875 lt!175995 lt!175986))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun v!373 () V!13203)

(assert (=> b!378007 (= lt!175986 (tuple2!6115 k!778 v!373))))

(declare-datatypes ((Unit!11650 0))(
  ( (Unit!11651) )
))
(declare-fun lt!175993 () Unit!11650)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!114 (array!22075 array!22073 (_ BitVec 32) (_ BitVec 32) V!13203 V!13203 (_ BitVec 32) (_ BitVec 64) V!13203 (_ BitVec 32) Int) Unit!11650)

(assert (=> b!378007 (= lt!175993 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!114 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!790 (array!22075 array!22073 (_ BitVec 32) (_ BitVec 32) V!13203 V!13203 (_ BitVec 32) Int) ListLongMap!5027)

(assert (=> b!378007 (= lt!175998 (getCurrentListMapNoExtraKeys!790 lt!175994 lt!175989 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!378007 (= lt!175989 (array!22074 (store (arr!10505 _values!506) i!548 (ValueCellFull!4193 v!373)) (size!10857 _values!506)))))

(assert (=> b!378007 (= lt!175995 (getCurrentListMapNoExtraKeys!790 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!378008 () Bool)

(declare-fun res!214006 () Bool)

(assert (=> b!378008 (=> (not res!214006) (not e!230096))))

(assert (=> b!378008 (= res!214006 (or (= (select (arr!10506 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10506 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15174 () Bool)

(declare-fun mapRes!15174 () Bool)

(assert (=> mapIsEmpty!15174 mapRes!15174))

(declare-fun b!378009 () Bool)

(declare-fun e!230102 () Bool)

(assert (=> b!378009 (= e!230102 tp_is_empty!9073)))

(declare-fun b!378010 () Bool)

(declare-fun res!214007 () Bool)

(assert (=> b!378010 (=> (not res!214007) (not e!230096))))

(assert (=> b!378010 (= res!214007 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10858 _keys!658))))))

(declare-fun b!378011 () Bool)

(declare-fun e!230098 () Bool)

(assert (=> b!378011 (= e!230099 e!230098)))

(declare-fun res!214001 () Bool)

(assert (=> b!378011 (=> res!214001 e!230098)))

(assert (=> b!378011 (= res!214001 (= k!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!175992 () ListLongMap!5027)

(assert (=> b!378011 (= lt!175991 lt!175992)))

(declare-fun lt!175997 () tuple2!6114)

(assert (=> b!378011 (= lt!175992 (+!875 lt!175988 lt!175997))))

(declare-fun lt!175996 () ListLongMap!5027)

(assert (=> b!378011 (= lt!175987 lt!175996)))

(assert (=> b!378011 (= lt!175996 (+!875 lt!175995 lt!175997))))

(assert (=> b!378011 (= lt!175991 (+!875 lt!175998 lt!175997))))

(assert (=> b!378011 (= lt!175997 (tuple2!6115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!378012 () Bool)

(declare-fun res!214003 () Bool)

(assert (=> b!378012 (=> (not res!214003) (not e!230100))))

(declare-datatypes ((List!5953 0))(
  ( (Nil!5950) (Cons!5949 (h!6805 (_ BitVec 64)) (t!11103 List!5953)) )
))
(declare-fun arrayNoDuplicates!0 (array!22075 (_ BitVec 32) List!5953) Bool)

(assert (=> b!378012 (= res!214003 (arrayNoDuplicates!0 lt!175994 #b00000000000000000000000000000000 Nil!5950))))

(declare-fun b!378013 () Bool)

(declare-fun res!214010 () Bool)

(assert (=> b!378013 (=> (not res!214010) (not e!230096))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!378013 (= res!214010 (validKeyInArray!0 k!778))))

(declare-fun mapNonEmpty!15174 () Bool)

(declare-fun tp!29991 () Bool)

(assert (=> mapNonEmpty!15174 (= mapRes!15174 (and tp!29991 e!230102))))

(declare-fun mapValue!15174 () ValueCell!4193)

(declare-fun mapKey!15174 () (_ BitVec 32))

(declare-fun mapRest!15174 () (Array (_ BitVec 32) ValueCell!4193))

(assert (=> mapNonEmpty!15174 (= (arr!10505 _values!506) (store mapRest!15174 mapKey!15174 mapValue!15174))))

(declare-fun b!378014 () Bool)

(declare-fun e!230101 () Bool)

(assert (=> b!378014 (= e!230095 (and e!230101 mapRes!15174))))

(declare-fun condMapEmpty!15174 () Bool)

(declare-fun mapDefault!15174 () ValueCell!4193)

