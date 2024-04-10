; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37384 () Bool)

(assert start!37384)

(declare-fun b_free!8511 () Bool)

(declare-fun b_next!8511 () Bool)

(assert (=> start!37384 (= b_free!8511 (not b_next!8511))))

(declare-fun tp!30248 () Bool)

(declare-fun b_and!15753 () Bool)

(assert (=> start!37384 (= tp!30248 b_and!15753)))

(declare-fun mapIsEmpty!15303 () Bool)

(declare-fun mapRes!15303 () Bool)

(assert (=> mapIsEmpty!15303 mapRes!15303))

(declare-fun b!379950 () Bool)

(declare-fun e!231131 () Bool)

(declare-fun e!231134 () Bool)

(assert (=> b!379950 (= e!231131 (not e!231134))))

(declare-fun res!215558 () Bool)

(assert (=> b!379950 (=> res!215558 e!231134)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!379950 (= res!215558 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!13317 0))(
  ( (V!13318 (val!4624 Int)) )
))
(declare-datatypes ((ValueCell!4236 0))(
  ( (ValueCellFull!4236 (v!6821 V!13317)) (EmptyCell!4236) )
))
(declare-datatypes ((array!22239 0))(
  ( (array!22240 (arr!10588 (Array (_ BitVec 32) ValueCell!4236)) (size!10940 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22239)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6194 0))(
  ( (tuple2!6195 (_1!3108 (_ BitVec 64)) (_2!3108 V!13317)) )
))
(declare-datatypes ((List!6029 0))(
  ( (Nil!6026) (Cons!6025 (h!6881 tuple2!6194) (t!11179 List!6029)) )
))
(declare-datatypes ((ListLongMap!5107 0))(
  ( (ListLongMap!5108 (toList!2569 List!6029)) )
))
(declare-fun lt!177636 () ListLongMap!5107)

(declare-datatypes ((array!22241 0))(
  ( (array!22242 (arr!10589 (Array (_ BitVec 32) (_ BitVec 64))) (size!10941 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22241)

(declare-fun zeroValue!472 () V!13317)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13317)

(declare-fun getCurrentListMap!1986 (array!22241 array!22239 (_ BitVec 32) (_ BitVec 32) V!13317 V!13317 (_ BitVec 32) Int) ListLongMap!5107)

(assert (=> b!379950 (= lt!177636 (getCurrentListMap!1986 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177635 () array!22239)

(declare-fun lt!177637 () array!22241)

(declare-fun lt!177628 () ListLongMap!5107)

(assert (=> b!379950 (= lt!177628 (getCurrentListMap!1986 lt!177637 lt!177635 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177629 () ListLongMap!5107)

(declare-fun lt!177631 () ListLongMap!5107)

(assert (=> b!379950 (and (= lt!177629 lt!177631) (= lt!177631 lt!177629))))

(declare-fun lt!177639 () ListLongMap!5107)

(declare-fun lt!177633 () tuple2!6194)

(declare-fun +!915 (ListLongMap!5107 tuple2!6194) ListLongMap!5107)

(assert (=> b!379950 (= lt!177631 (+!915 lt!177639 lt!177633))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun v!373 () V!13317)

(assert (=> b!379950 (= lt!177633 (tuple2!6195 k0!778 v!373))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((Unit!11724 0))(
  ( (Unit!11725) )
))
(declare-fun lt!177638 () Unit!11724)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!144 (array!22241 array!22239 (_ BitVec 32) (_ BitVec 32) V!13317 V!13317 (_ BitVec 32) (_ BitVec 64) V!13317 (_ BitVec 32) Int) Unit!11724)

(assert (=> b!379950 (= lt!177638 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!144 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!820 (array!22241 array!22239 (_ BitVec 32) (_ BitVec 32) V!13317 V!13317 (_ BitVec 32) Int) ListLongMap!5107)

(assert (=> b!379950 (= lt!177629 (getCurrentListMapNoExtraKeys!820 lt!177637 lt!177635 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!379950 (= lt!177635 (array!22240 (store (arr!10588 _values!506) i!548 (ValueCellFull!4236 v!373)) (size!10940 _values!506)))))

(assert (=> b!379950 (= lt!177639 (getCurrentListMapNoExtraKeys!820 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!379951 () Bool)

(declare-fun res!215565 () Bool)

(declare-fun e!231127 () Bool)

(assert (=> b!379951 (=> (not res!215565) (not e!231127))))

(declare-datatypes ((List!6030 0))(
  ( (Nil!6027) (Cons!6026 (h!6882 (_ BitVec 64)) (t!11180 List!6030)) )
))
(declare-fun arrayNoDuplicates!0 (array!22241 (_ BitVec 32) List!6030) Bool)

(assert (=> b!379951 (= res!215565 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6027))))

(declare-fun b!379953 () Bool)

(declare-fun e!231129 () Bool)

(declare-fun tp_is_empty!9159 () Bool)

(assert (=> b!379953 (= e!231129 tp_is_empty!9159)))

(declare-fun b!379954 () Bool)

(declare-fun res!215561 () Bool)

(assert (=> b!379954 (=> (not res!215561) (not e!231127))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22241 (_ BitVec 32)) Bool)

(assert (=> b!379954 (= res!215561 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!379955 () Bool)

(declare-fun e!231133 () Bool)

(declare-fun e!231130 () Bool)

(assert (=> b!379955 (= e!231133 (and e!231130 mapRes!15303))))

(declare-fun condMapEmpty!15303 () Bool)

(declare-fun mapDefault!15303 () ValueCell!4236)

(assert (=> b!379955 (= condMapEmpty!15303 (= (arr!10588 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4236)) mapDefault!15303)))))

(declare-fun b!379956 () Bool)

(declare-fun res!215567 () Bool)

(assert (=> b!379956 (=> (not res!215567) (not e!231127))))

(assert (=> b!379956 (= res!215567 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10941 _keys!658))))))

(declare-fun mapNonEmpty!15303 () Bool)

(declare-fun tp!30249 () Bool)

(assert (=> mapNonEmpty!15303 (= mapRes!15303 (and tp!30249 e!231129))))

(declare-fun mapValue!15303 () ValueCell!4236)

(declare-fun mapKey!15303 () (_ BitVec 32))

(declare-fun mapRest!15303 () (Array (_ BitVec 32) ValueCell!4236))

(assert (=> mapNonEmpty!15303 (= (arr!10588 _values!506) (store mapRest!15303 mapKey!15303 mapValue!15303))))

(declare-fun b!379957 () Bool)

(assert (=> b!379957 (= e!231130 tp_is_empty!9159)))

(declare-fun b!379958 () Bool)

(declare-fun res!215556 () Bool)

(assert (=> b!379958 (=> (not res!215556) (not e!231127))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!379958 (= res!215556 (validKeyInArray!0 k0!778))))

(declare-fun b!379959 () Bool)

(declare-fun res!215557 () Bool)

(assert (=> b!379959 (=> (not res!215557) (not e!231127))))

(assert (=> b!379959 (= res!215557 (and (= (size!10940 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10941 _keys!658) (size!10940 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!379960 () Bool)

(declare-fun e!231132 () Bool)

(assert (=> b!379960 (= e!231132 true)))

(declare-fun lt!177634 () ListLongMap!5107)

(declare-fun lt!177627 () ListLongMap!5107)

(assert (=> b!379960 (= lt!177634 (+!915 lt!177627 lt!177633))))

(declare-fun lt!177630 () Unit!11724)

(declare-fun addCommutativeForDiffKeys!312 (ListLongMap!5107 (_ BitVec 64) V!13317 (_ BitVec 64) V!13317) Unit!11724)

(assert (=> b!379960 (= lt!177630 (addCommutativeForDiffKeys!312 lt!177639 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun res!215559 () Bool)

(assert (=> start!37384 (=> (not res!215559) (not e!231127))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37384 (= res!215559 (validMask!0 mask!970))))

(assert (=> start!37384 e!231127))

(declare-fun array_inv!7796 (array!22239) Bool)

(assert (=> start!37384 (and (array_inv!7796 _values!506) e!231133)))

(assert (=> start!37384 tp!30248))

(assert (=> start!37384 true))

(assert (=> start!37384 tp_is_empty!9159))

(declare-fun array_inv!7797 (array!22241) Bool)

(assert (=> start!37384 (array_inv!7797 _keys!658)))

(declare-fun b!379952 () Bool)

(declare-fun res!215566 () Bool)

(assert (=> b!379952 (=> (not res!215566) (not e!231127))))

(declare-fun arrayContainsKey!0 (array!22241 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!379952 (= res!215566 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!379961 () Bool)

(declare-fun res!215563 () Bool)

(assert (=> b!379961 (=> (not res!215563) (not e!231127))))

(assert (=> b!379961 (= res!215563 (or (= (select (arr!10589 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10589 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!379962 () Bool)

(assert (=> b!379962 (= e!231134 e!231132)))

(declare-fun res!215562 () Bool)

(assert (=> b!379962 (=> res!215562 e!231132)))

(assert (=> b!379962 (= res!215562 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!379962 (= lt!177636 lt!177627)))

(declare-fun lt!177632 () tuple2!6194)

(assert (=> b!379962 (= lt!177627 (+!915 lt!177639 lt!177632))))

(assert (=> b!379962 (= lt!177628 lt!177634)))

(assert (=> b!379962 (= lt!177634 (+!915 lt!177631 lt!177632))))

(assert (=> b!379962 (= lt!177628 (+!915 lt!177629 lt!177632))))

(assert (=> b!379962 (= lt!177632 (tuple2!6195 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!379963 () Bool)

(declare-fun res!215560 () Bool)

(assert (=> b!379963 (=> (not res!215560) (not e!231131))))

(assert (=> b!379963 (= res!215560 (arrayNoDuplicates!0 lt!177637 #b00000000000000000000000000000000 Nil!6027))))

(declare-fun b!379964 () Bool)

(assert (=> b!379964 (= e!231127 e!231131)))

(declare-fun res!215564 () Bool)

(assert (=> b!379964 (=> (not res!215564) (not e!231131))))

(assert (=> b!379964 (= res!215564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!177637 mask!970))))

(assert (=> b!379964 (= lt!177637 (array!22242 (store (arr!10589 _keys!658) i!548 k0!778) (size!10941 _keys!658)))))

(assert (= (and start!37384 res!215559) b!379959))

(assert (= (and b!379959 res!215557) b!379954))

(assert (= (and b!379954 res!215561) b!379951))

(assert (= (and b!379951 res!215565) b!379956))

(assert (= (and b!379956 res!215567) b!379958))

(assert (= (and b!379958 res!215556) b!379961))

(assert (= (and b!379961 res!215563) b!379952))

(assert (= (and b!379952 res!215566) b!379964))

(assert (= (and b!379964 res!215564) b!379963))

(assert (= (and b!379963 res!215560) b!379950))

(assert (= (and b!379950 (not res!215558)) b!379962))

(assert (= (and b!379962 (not res!215562)) b!379960))

(assert (= (and b!379955 condMapEmpty!15303) mapIsEmpty!15303))

(assert (= (and b!379955 (not condMapEmpty!15303)) mapNonEmpty!15303))

(get-info :version)

(assert (= (and mapNonEmpty!15303 ((_ is ValueCellFull!4236) mapValue!15303)) b!379953))

(assert (= (and b!379955 ((_ is ValueCellFull!4236) mapDefault!15303)) b!379957))

(assert (= start!37384 b!379955))

(declare-fun m!376863 () Bool)

(assert (=> b!379954 m!376863))

(declare-fun m!376865 () Bool)

(assert (=> b!379963 m!376865))

(declare-fun m!376867 () Bool)

(assert (=> b!379964 m!376867))

(declare-fun m!376869 () Bool)

(assert (=> b!379964 m!376869))

(declare-fun m!376871 () Bool)

(assert (=> b!379960 m!376871))

(declare-fun m!376873 () Bool)

(assert (=> b!379960 m!376873))

(declare-fun m!376875 () Bool)

(assert (=> b!379962 m!376875))

(declare-fun m!376877 () Bool)

(assert (=> b!379962 m!376877))

(declare-fun m!376879 () Bool)

(assert (=> b!379962 m!376879))

(declare-fun m!376881 () Bool)

(assert (=> b!379950 m!376881))

(declare-fun m!376883 () Bool)

(assert (=> b!379950 m!376883))

(declare-fun m!376885 () Bool)

(assert (=> b!379950 m!376885))

(declare-fun m!376887 () Bool)

(assert (=> b!379950 m!376887))

(declare-fun m!376889 () Bool)

(assert (=> b!379950 m!376889))

(declare-fun m!376891 () Bool)

(assert (=> b!379950 m!376891))

(declare-fun m!376893 () Bool)

(assert (=> b!379950 m!376893))

(declare-fun m!376895 () Bool)

(assert (=> b!379961 m!376895))

(declare-fun m!376897 () Bool)

(assert (=> b!379951 m!376897))

(declare-fun m!376899 () Bool)

(assert (=> start!37384 m!376899))

(declare-fun m!376901 () Bool)

(assert (=> start!37384 m!376901))

(declare-fun m!376903 () Bool)

(assert (=> start!37384 m!376903))

(declare-fun m!376905 () Bool)

(assert (=> b!379958 m!376905))

(declare-fun m!376907 () Bool)

(assert (=> mapNonEmpty!15303 m!376907))

(declare-fun m!376909 () Bool)

(assert (=> b!379952 m!376909))

(check-sat (not b!379962) (not start!37384) (not b!379951) (not b!379963) (not b!379952) (not b!379954) (not mapNonEmpty!15303) (not b!379960) b_and!15753 (not b!379950) tp_is_empty!9159 (not b_next!8511) (not b!379964) (not b!379958))
(check-sat b_and!15753 (not b_next!8511))
