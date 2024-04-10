; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39326 () Bool)

(assert start!39326)

(declare-fun b_free!9593 () Bool)

(declare-fun b_next!9593 () Bool)

(assert (=> start!39326 (= b_free!9593 (not b_next!9593))))

(declare-fun tp!34307 () Bool)

(declare-fun b_and!17061 () Bool)

(assert (=> start!39326 (= tp!34307 b_and!17061)))

(declare-fun b!416781 () Bool)

(declare-fun e!248758 () Bool)

(declare-fun tp_is_empty!10745 () Bool)

(assert (=> b!416781 (= e!248758 tp_is_empty!10745)))

(declare-datatypes ((array!25345 0))(
  ( (array!25346 (arr!12122 (Array (_ BitVec 32) (_ BitVec 64))) (size!12474 (_ BitVec 32))) )
))
(declare-fun lt!190863 () array!25345)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun c!55103 () Bool)

(declare-datatypes ((V!15431 0))(
  ( (V!15432 (val!5417 Int)) )
))
(declare-fun zeroValue!515 () V!15431)

(declare-datatypes ((ValueCell!5029 0))(
  ( (ValueCellFull!5029 (v!7664 V!15431)) (EmptyCell!5029) )
))
(declare-datatypes ((array!25347 0))(
  ( (array!25348 (arr!12123 (Array (_ BitVec 32) ValueCell!5029)) (size!12475 (_ BitVec 32))) )
))
(declare-fun lt!190864 () array!25347)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!25345)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun bm!28954 () Bool)

(declare-fun minValue!515 () V!15431)

(declare-datatypes ((tuple2!7068 0))(
  ( (tuple2!7069 (_1!3545 (_ BitVec 64)) (_2!3545 V!15431)) )
))
(declare-datatypes ((List!7086 0))(
  ( (Nil!7083) (Cons!7082 (h!7938 tuple2!7068) (t!12344 List!7086)) )
))
(declare-datatypes ((ListLongMap!5981 0))(
  ( (ListLongMap!5982 (toList!3006 List!7086)) )
))
(declare-fun call!28957 () ListLongMap!5981)

(declare-fun _values!549 () array!25347)

(declare-fun getCurrentListMapNoExtraKeys!1211 (array!25345 array!25347 (_ BitVec 32) (_ BitVec 32) V!15431 V!15431 (_ BitVec 32) Int) ListLongMap!5981)

(assert (=> bm!28954 (= call!28957 (getCurrentListMapNoExtraKeys!1211 (ite c!55103 lt!190863 _keys!709) (ite c!55103 lt!190864 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!17739 () Bool)

(declare-fun mapRes!17739 () Bool)

(declare-fun tp!34308 () Bool)

(assert (=> mapNonEmpty!17739 (= mapRes!17739 (and tp!34308 e!248758))))

(declare-fun mapRest!17739 () (Array (_ BitVec 32) ValueCell!5029))

(declare-fun mapKey!17739 () (_ BitVec 32))

(declare-fun mapValue!17739 () ValueCell!5029)

(assert (=> mapNonEmpty!17739 (= (arr!12123 _values!549) (store mapRest!17739 mapKey!17739 mapValue!17739))))

(declare-fun bm!28955 () Bool)

(declare-fun call!28958 () ListLongMap!5981)

(assert (=> bm!28955 (= call!28958 (getCurrentListMapNoExtraKeys!1211 (ite c!55103 _keys!709 lt!190863) (ite c!55103 _values!549 lt!190864) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416782 () Bool)

(declare-fun res!242636 () Bool)

(declare-fun e!248756 () Bool)

(assert (=> b!416782 (=> (not res!242636) (not e!248756))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!416782 (= res!242636 (bvsle from!863 i!563))))

(declare-fun b!416783 () Bool)

(declare-fun res!242648 () Bool)

(declare-fun e!248757 () Bool)

(assert (=> b!416783 (=> (not res!242648) (not e!248757))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25345 (_ BitVec 32)) Bool)

(assert (=> b!416783 (= res!242648 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!416784 () Bool)

(declare-fun res!242641 () Bool)

(assert (=> b!416784 (=> (not res!242641) (not e!248757))))

(assert (=> b!416784 (= res!242641 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12474 _keys!709))))))

(declare-fun b!416785 () Bool)

(declare-fun e!248759 () Bool)

(assert (=> b!416785 (= e!248756 e!248759)))

(declare-fun res!242647 () Bool)

(assert (=> b!416785 (=> (not res!242647) (not e!248759))))

(assert (=> b!416785 (= res!242647 (= from!863 i!563))))

(declare-fun lt!190861 () ListLongMap!5981)

(assert (=> b!416785 (= lt!190861 (getCurrentListMapNoExtraKeys!1211 lt!190863 lt!190864 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15431)

(assert (=> b!416785 (= lt!190864 (array!25348 (store (arr!12123 _values!549) i!563 (ValueCellFull!5029 v!412)) (size!12475 _values!549)))))

(declare-fun lt!190862 () ListLongMap!5981)

(assert (=> b!416785 (= lt!190862 (getCurrentListMapNoExtraKeys!1211 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!416786 () Bool)

(declare-fun res!242637 () Bool)

(assert (=> b!416786 (=> (not res!242637) (not e!248756))))

(declare-datatypes ((List!7087 0))(
  ( (Nil!7084) (Cons!7083 (h!7939 (_ BitVec 64)) (t!12345 List!7087)) )
))
(declare-fun arrayNoDuplicates!0 (array!25345 (_ BitVec 32) List!7087) Bool)

(assert (=> b!416786 (= res!242637 (arrayNoDuplicates!0 lt!190863 #b00000000000000000000000000000000 Nil!7084))))

(declare-fun b!416787 () Bool)

(declare-fun res!242642 () Bool)

(assert (=> b!416787 (=> (not res!242642) (not e!248757))))

(assert (=> b!416787 (= res!242642 (and (= (size!12475 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12474 _keys!709) (size!12475 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!416788 () Bool)

(declare-fun e!248762 () Bool)

(assert (=> b!416788 (= e!248762 (= call!28958 call!28957))))

(declare-fun b!416789 () Bool)

(declare-fun res!242638 () Bool)

(assert (=> b!416789 (=> (not res!242638) (not e!248757))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!416789 (= res!242638 (validKeyInArray!0 k!794))))

(declare-fun mapIsEmpty!17739 () Bool)

(assert (=> mapIsEmpty!17739 mapRes!17739))

(declare-fun res!242639 () Bool)

(assert (=> start!39326 (=> (not res!242639) (not e!248757))))

(assert (=> start!39326 (= res!242639 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12474 _keys!709))))))

(assert (=> start!39326 e!248757))

(assert (=> start!39326 tp_is_empty!10745))

(assert (=> start!39326 tp!34307))

(assert (=> start!39326 true))

(declare-fun e!248760 () Bool)

(declare-fun array_inv!8842 (array!25347) Bool)

(assert (=> start!39326 (and (array_inv!8842 _values!549) e!248760)))

(declare-fun array_inv!8843 (array!25345) Bool)

(assert (=> start!39326 (array_inv!8843 _keys!709)))

(declare-fun b!416790 () Bool)

(declare-fun res!242644 () Bool)

(assert (=> b!416790 (=> (not res!242644) (not e!248757))))

(assert (=> b!416790 (= res!242644 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7084))))

(declare-fun b!416791 () Bool)

(assert (=> b!416791 (= e!248757 e!248756)))

(declare-fun res!242643 () Bool)

(assert (=> b!416791 (=> (not res!242643) (not e!248756))))

(assert (=> b!416791 (= res!242643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190863 mask!1025))))

(assert (=> b!416791 (= lt!190863 (array!25346 (store (arr!12122 _keys!709) i!563 k!794) (size!12474 _keys!709)))))

(declare-fun b!416792 () Bool)

(declare-fun e!248761 () Bool)

(assert (=> b!416792 (= e!248759 (not e!248761))))

(declare-fun res!242640 () Bool)

(assert (=> b!416792 (=> res!242640 e!248761)))

(assert (=> b!416792 (= res!242640 (validKeyInArray!0 (select (arr!12122 _keys!709) from!863)))))

(assert (=> b!416792 e!248762))

(assert (=> b!416792 (= c!55103 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12320 0))(
  ( (Unit!12321) )
))
(declare-fun lt!190865 () Unit!12320)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!416 (array!25345 array!25347 (_ BitVec 32) (_ BitVec 32) V!15431 V!15431 (_ BitVec 32) (_ BitVec 64) V!15431 (_ BitVec 32) Int) Unit!12320)

(assert (=> b!416792 (= lt!190865 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!416 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416793 () Bool)

(declare-fun res!242649 () Bool)

(assert (=> b!416793 (=> (not res!242649) (not e!248757))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!416793 (= res!242649 (validMask!0 mask!1025))))

(declare-fun b!416794 () Bool)

(declare-fun +!1208 (ListLongMap!5981 tuple2!7068) ListLongMap!5981)

(assert (=> b!416794 (= e!248762 (= call!28957 (+!1208 call!28958 (tuple2!7069 k!794 v!412))))))

(declare-fun b!416795 () Bool)

(declare-fun res!242646 () Bool)

(assert (=> b!416795 (=> (not res!242646) (not e!248757))))

(assert (=> b!416795 (= res!242646 (or (= (select (arr!12122 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12122 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!416796 () Bool)

(assert (=> b!416796 (= e!248761 true)))

(declare-fun lt!190866 () V!15431)

(declare-fun lt!190868 () ListLongMap!5981)

(declare-fun lt!190859 () tuple2!7068)

(assert (=> b!416796 (= (+!1208 lt!190868 lt!190859) (+!1208 (+!1208 lt!190868 (tuple2!7069 k!794 lt!190866)) lt!190859))))

(declare-fun lt!190858 () V!15431)

(assert (=> b!416796 (= lt!190859 (tuple2!7069 k!794 lt!190858))))

(declare-fun lt!190860 () Unit!12320)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!12 (ListLongMap!5981 (_ BitVec 64) V!15431 V!15431) Unit!12320)

(assert (=> b!416796 (= lt!190860 (addSameAsAddTwiceSameKeyDiffValues!12 lt!190868 k!794 lt!190866 lt!190858))))

(declare-fun lt!190867 () V!15431)

(declare-fun get!5994 (ValueCell!5029 V!15431) V!15431)

(assert (=> b!416796 (= lt!190866 (get!5994 (select (arr!12123 _values!549) from!863) lt!190867))))

(assert (=> b!416796 (= lt!190861 (+!1208 lt!190868 (tuple2!7069 (select (arr!12122 lt!190863) from!863) lt!190858)))))

(assert (=> b!416796 (= lt!190858 (get!5994 (select (store (arr!12123 _values!549) i!563 (ValueCellFull!5029 v!412)) from!863) lt!190867))))

(declare-fun dynLambda!683 (Int (_ BitVec 64)) V!15431)

(assert (=> b!416796 (= lt!190867 (dynLambda!683 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!416796 (= lt!190868 (getCurrentListMapNoExtraKeys!1211 lt!190863 lt!190864 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416797 () Bool)

(declare-fun res!242645 () Bool)

(assert (=> b!416797 (=> (not res!242645) (not e!248757))))

(declare-fun arrayContainsKey!0 (array!25345 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!416797 (= res!242645 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!416798 () Bool)

(declare-fun e!248763 () Bool)

(assert (=> b!416798 (= e!248763 tp_is_empty!10745)))

(declare-fun b!416799 () Bool)

(assert (=> b!416799 (= e!248760 (and e!248763 mapRes!17739))))

(declare-fun condMapEmpty!17739 () Bool)

(declare-fun mapDefault!17739 () ValueCell!5029)

