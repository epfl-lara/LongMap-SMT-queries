; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37152 () Bool)

(assert start!37152)

(declare-fun b_free!8279 () Bool)

(declare-fun b_next!8279 () Bool)

(assert (=> start!37152 (= b_free!8279 (not b_next!8279))))

(declare-fun tp!29552 () Bool)

(declare-fun b_and!15521 () Bool)

(assert (=> start!37152 (= tp!29552 b_and!15521)))

(declare-fun b!374712 () Bool)

(declare-fun res!211368 () Bool)

(declare-fun e!228346 () Bool)

(assert (=> b!374712 (=> (not res!211368) (not e!228346))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!21793 0))(
  ( (array!21794 (arr!10365 (Array (_ BitVec 32) (_ BitVec 64))) (size!10717 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21793)

(assert (=> b!374712 (= res!211368 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10717 _keys!658))))))

(declare-fun b!374713 () Bool)

(declare-fun e!228344 () Bool)

(declare-fun e!228345 () Bool)

(assert (=> b!374713 (= e!228344 (not e!228345))))

(declare-fun res!211372 () Bool)

(assert (=> b!374713 (=> res!211372 e!228345)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!374713 (= res!211372 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!13007 0))(
  ( (V!13008 (val!4508 Int)) )
))
(declare-datatypes ((ValueCell!4120 0))(
  ( (ValueCellFull!4120 (v!6705 V!13007)) (EmptyCell!4120) )
))
(declare-datatypes ((array!21795 0))(
  ( (array!21796 (arr!10366 (Array (_ BitVec 32) ValueCell!4120)) (size!10718 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21795)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13007)

(declare-datatypes ((tuple2!5996 0))(
  ( (tuple2!5997 (_1!3009 (_ BitVec 64)) (_2!3009 V!13007)) )
))
(declare-datatypes ((List!5841 0))(
  ( (Nil!5838) (Cons!5837 (h!6693 tuple2!5996) (t!10991 List!5841)) )
))
(declare-datatypes ((ListLongMap!4909 0))(
  ( (ListLongMap!4910 (toList!2470 List!5841)) )
))
(declare-fun lt!172931 () ListLongMap!4909)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13007)

(declare-fun getCurrentListMap!1907 (array!21793 array!21795 (_ BitVec 32) (_ BitVec 32) V!13007 V!13007 (_ BitVec 32) Int) ListLongMap!4909)

(assert (=> b!374713 (= lt!172931 (getCurrentListMap!1907 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!172934 () array!21795)

(declare-fun lt!172926 () ListLongMap!4909)

(declare-fun lt!172933 () array!21793)

(assert (=> b!374713 (= lt!172926 (getCurrentListMap!1907 lt!172933 lt!172934 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!172921 () ListLongMap!4909)

(declare-fun lt!172922 () ListLongMap!4909)

(assert (=> b!374713 (and (= lt!172921 lt!172922) (= lt!172922 lt!172921))))

(declare-fun lt!172930 () ListLongMap!4909)

(declare-fun lt!172925 () tuple2!5996)

(declare-fun +!816 (ListLongMap!4909 tuple2!5996) ListLongMap!4909)

(assert (=> b!374713 (= lt!172922 (+!816 lt!172930 lt!172925))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun v!373 () V!13007)

(assert (=> b!374713 (= lt!172925 (tuple2!5997 k!778 v!373))))

(declare-datatypes ((Unit!11538 0))(
  ( (Unit!11539) )
))
(declare-fun lt!172928 () Unit!11538)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!65 (array!21793 array!21795 (_ BitVec 32) (_ BitVec 32) V!13007 V!13007 (_ BitVec 32) (_ BitVec 64) V!13007 (_ BitVec 32) Int) Unit!11538)

(assert (=> b!374713 (= lt!172928 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!65 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!741 (array!21793 array!21795 (_ BitVec 32) (_ BitVec 32) V!13007 V!13007 (_ BitVec 32) Int) ListLongMap!4909)

(assert (=> b!374713 (= lt!172921 (getCurrentListMapNoExtraKeys!741 lt!172933 lt!172934 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!374713 (= lt!172934 (array!21796 (store (arr!10366 _values!506) i!548 (ValueCellFull!4120 v!373)) (size!10718 _values!506)))))

(assert (=> b!374713 (= lt!172930 (getCurrentListMapNoExtraKeys!741 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!374714 () Bool)

(declare-fun res!211364 () Bool)

(assert (=> b!374714 (=> (not res!211364) (not e!228346))))

(assert (=> b!374714 (= res!211364 (and (= (size!10718 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10717 _keys!658) (size!10718 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!374716 () Bool)

(declare-fun e!228347 () Bool)

(declare-fun tp_is_empty!8927 () Bool)

(assert (=> b!374716 (= e!228347 tp_is_empty!8927)))

(declare-fun b!374717 () Bool)

(declare-fun e!228350 () Bool)

(assert (=> b!374717 (= e!228350 tp_is_empty!8927)))

(declare-fun b!374718 () Bool)

(declare-fun e!228348 () Bool)

(declare-fun mapRes!14955 () Bool)

(assert (=> b!374718 (= e!228348 (and e!228350 mapRes!14955))))

(declare-fun condMapEmpty!14955 () Bool)

(declare-fun mapDefault!14955 () ValueCell!4120)

