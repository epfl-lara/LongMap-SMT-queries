; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37236 () Bool)

(assert start!37236)

(declare-fun b_free!8363 () Bool)

(declare-fun b_next!8363 () Bool)

(assert (=> start!37236 (= b_free!8363 (not b_next!8363))))

(declare-fun tp!29805 () Bool)

(declare-fun b_and!15605 () Bool)

(assert (=> start!37236 (= tp!29805 b_and!15605)))

(declare-fun b!376611 () Bool)

(declare-fun res!212884 () Bool)

(declare-fun e!229352 () Bool)

(assert (=> b!376611 (=> (not res!212884) (not e!229352))))

(declare-datatypes ((array!21951 0))(
  ( (array!21952 (arr!10444 (Array (_ BitVec 32) (_ BitVec 64))) (size!10796 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21951)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21951 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!376611 (= res!212884 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!376612 () Bool)

(declare-fun e!229357 () Bool)

(assert (=> b!376612 (= e!229357 true)))

(declare-datatypes ((V!13119 0))(
  ( (V!13120 (val!4550 Int)) )
))
(declare-datatypes ((tuple2!6058 0))(
  ( (tuple2!6059 (_1!3040 (_ BitVec 64)) (_2!3040 V!13119)) )
))
(declare-datatypes ((List!5900 0))(
  ( (Nil!5897) (Cons!5896 (h!6752 tuple2!6058) (t!11050 List!5900)) )
))
(declare-datatypes ((ListLongMap!4971 0))(
  ( (ListLongMap!4972 (toList!2501 List!5900)) )
))
(declare-fun lt!174786 () ListLongMap!4971)

(declare-fun lt!174782 () ListLongMap!4971)

(declare-fun lt!174783 () tuple2!6058)

(declare-fun +!847 (ListLongMap!4971 tuple2!6058) ListLongMap!4971)

(assert (=> b!376612 (= lt!174786 (+!847 lt!174782 lt!174783))))

(declare-fun v!373 () V!13119)

(declare-fun lt!174779 () ListLongMap!4971)

(declare-datatypes ((Unit!11600 0))(
  ( (Unit!11601) )
))
(declare-fun lt!174784 () Unit!11600)

(declare-fun zeroValue!472 () V!13119)

(declare-fun addCommutativeForDiffKeys!261 (ListLongMap!4971 (_ BitVec 64) V!13119 (_ BitVec 64) V!13119) Unit!11600)

(assert (=> b!376612 (= lt!174784 (addCommutativeForDiffKeys!261 lt!174779 k!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!376613 () Bool)

(declare-fun res!212887 () Bool)

(assert (=> b!376613 (=> (not res!212887) (not e!229352))))

(declare-datatypes ((List!5901 0))(
  ( (Nil!5898) (Cons!5897 (h!6753 (_ BitVec 64)) (t!11051 List!5901)) )
))
(declare-fun arrayNoDuplicates!0 (array!21951 (_ BitVec 32) List!5901) Bool)

(assert (=> b!376613 (= res!212887 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5898))))

(declare-fun b!376614 () Bool)

(declare-fun res!212894 () Bool)

(assert (=> b!376614 (=> (not res!212894) (not e!229352))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!376614 (= res!212894 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10796 _keys!658))))))

(declare-fun res!212888 () Bool)

(assert (=> start!37236 (=> (not res!212888) (not e!229352))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37236 (= res!212888 (validMask!0 mask!970))))

(assert (=> start!37236 e!229352))

(declare-datatypes ((ValueCell!4162 0))(
  ( (ValueCellFull!4162 (v!6747 V!13119)) (EmptyCell!4162) )
))
(declare-datatypes ((array!21953 0))(
  ( (array!21954 (arr!10445 (Array (_ BitVec 32) ValueCell!4162)) (size!10797 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21953)

(declare-fun e!229355 () Bool)

(declare-fun array_inv!7698 (array!21953) Bool)

(assert (=> start!37236 (and (array_inv!7698 _values!506) e!229355)))

(assert (=> start!37236 tp!29805))

(assert (=> start!37236 true))

(declare-fun tp_is_empty!9011 () Bool)

(assert (=> start!37236 tp_is_empty!9011))

(declare-fun array_inv!7699 (array!21951) Bool)

(assert (=> start!37236 (array_inv!7699 _keys!658)))

(declare-fun mapNonEmpty!15081 () Bool)

(declare-fun mapRes!15081 () Bool)

(declare-fun tp!29804 () Bool)

(declare-fun e!229353 () Bool)

(assert (=> mapNonEmpty!15081 (= mapRes!15081 (and tp!29804 e!229353))))

(declare-fun mapKey!15081 () (_ BitVec 32))

(declare-fun mapRest!15081 () (Array (_ BitVec 32) ValueCell!4162))

(declare-fun mapValue!15081 () ValueCell!4162)

(assert (=> mapNonEmpty!15081 (= (arr!10445 _values!506) (store mapRest!15081 mapKey!15081 mapValue!15081))))

(declare-fun b!376615 () Bool)

(assert (=> b!376615 (= e!229353 tp_is_empty!9011)))

(declare-fun b!376616 () Bool)

(declare-fun res!212885 () Bool)

(assert (=> b!376616 (=> (not res!212885) (not e!229352))))

(assert (=> b!376616 (= res!212885 (or (= (select (arr!10444 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10444 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!376617 () Bool)

(declare-fun e!229358 () Bool)

(assert (=> b!376617 (= e!229358 tp_is_empty!9011)))

(declare-fun b!376618 () Bool)

(declare-fun e!229351 () Bool)

(assert (=> b!376618 (= e!229351 e!229357)))

(declare-fun res!212886 () Bool)

(assert (=> b!376618 (=> res!212886 e!229357)))

(assert (=> b!376618 (= res!212886 (= k!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!174777 () ListLongMap!4971)

(assert (=> b!376618 (= lt!174777 lt!174786)))

(declare-fun lt!174787 () ListLongMap!4971)

(declare-fun lt!174785 () tuple2!6058)

(assert (=> b!376618 (= lt!174786 (+!847 lt!174787 lt!174785))))

(declare-fun lt!174778 () ListLongMap!4971)

(assert (=> b!376618 (= lt!174778 lt!174782)))

(assert (=> b!376618 (= lt!174782 (+!847 lt!174779 lt!174785))))

(declare-fun lt!174781 () ListLongMap!4971)

(assert (=> b!376618 (= lt!174777 (+!847 lt!174781 lt!174785))))

(assert (=> b!376618 (= lt!174785 (tuple2!6059 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!376619 () Bool)

(declare-fun e!229354 () Bool)

(assert (=> b!376619 (= e!229352 e!229354)))

(declare-fun res!212889 () Bool)

(assert (=> b!376619 (=> (not res!212889) (not e!229354))))

(declare-fun lt!174780 () array!21951)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21951 (_ BitVec 32)) Bool)

(assert (=> b!376619 (= res!212889 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!174780 mask!970))))

(assert (=> b!376619 (= lt!174780 (array!21952 (store (arr!10444 _keys!658) i!548 k!778) (size!10796 _keys!658)))))

(declare-fun mapIsEmpty!15081 () Bool)

(assert (=> mapIsEmpty!15081 mapRes!15081))

(declare-fun b!376620 () Bool)

(declare-fun res!212891 () Bool)

(assert (=> b!376620 (=> (not res!212891) (not e!229352))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!376620 (= res!212891 (and (= (size!10797 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10796 _keys!658) (size!10797 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!376621 () Bool)

(declare-fun res!212892 () Bool)

(assert (=> b!376621 (=> (not res!212892) (not e!229352))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!376621 (= res!212892 (validKeyInArray!0 k!778))))

(declare-fun b!376622 () Bool)

(assert (=> b!376622 (= e!229354 (not e!229351))))

(declare-fun res!212890 () Bool)

(assert (=> b!376622 (=> res!212890 e!229351)))

(assert (=> b!376622 (= res!212890 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13119)

(declare-fun getCurrentListMap!1935 (array!21951 array!21953 (_ BitVec 32) (_ BitVec 32) V!13119 V!13119 (_ BitVec 32) Int) ListLongMap!4971)

(assert (=> b!376622 (= lt!174778 (getCurrentListMap!1935 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174789 () array!21953)

(assert (=> b!376622 (= lt!174777 (getCurrentListMap!1935 lt!174780 lt!174789 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!376622 (and (= lt!174781 lt!174787) (= lt!174787 lt!174781))))

(assert (=> b!376622 (= lt!174787 (+!847 lt!174779 lt!174783))))

(assert (=> b!376622 (= lt!174783 (tuple2!6059 k!778 v!373))))

(declare-fun lt!174788 () Unit!11600)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!93 (array!21951 array!21953 (_ BitVec 32) (_ BitVec 32) V!13119 V!13119 (_ BitVec 32) (_ BitVec 64) V!13119 (_ BitVec 32) Int) Unit!11600)

(assert (=> b!376622 (= lt!174788 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!93 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!769 (array!21951 array!21953 (_ BitVec 32) (_ BitVec 32) V!13119 V!13119 (_ BitVec 32) Int) ListLongMap!4971)

(assert (=> b!376622 (= lt!174781 (getCurrentListMapNoExtraKeys!769 lt!174780 lt!174789 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!376622 (= lt!174789 (array!21954 (store (arr!10445 _values!506) i!548 (ValueCellFull!4162 v!373)) (size!10797 _values!506)))))

(assert (=> b!376622 (= lt!174779 (getCurrentListMapNoExtraKeys!769 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!376623 () Bool)

(declare-fun res!212893 () Bool)

(assert (=> b!376623 (=> (not res!212893) (not e!229352))))

(assert (=> b!376623 (= res!212893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!376624 () Bool)

(assert (=> b!376624 (= e!229355 (and e!229358 mapRes!15081))))

(declare-fun condMapEmpty!15081 () Bool)

(declare-fun mapDefault!15081 () ValueCell!4162)

