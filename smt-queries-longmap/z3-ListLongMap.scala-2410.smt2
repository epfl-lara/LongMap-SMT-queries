; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38130 () Bool)

(assert start!38130)

(declare-fun b_free!9025 () Bool)

(declare-fun b_next!9025 () Bool)

(assert (=> start!38130 (= b_free!9025 (not b_next!9025))))

(declare-fun tp!31856 () Bool)

(declare-fun b_and!16401 () Bool)

(assert (=> start!38130 (= tp!31856 b_and!16401)))

(declare-fun b!393025 () Bool)

(declare-fun e!237987 () Bool)

(declare-fun tp_is_empty!9697 () Bool)

(assert (=> b!393025 (= e!237987 tp_is_empty!9697)))

(declare-fun b!393026 () Bool)

(declare-fun res!225137 () Bool)

(declare-fun e!237983 () Bool)

(assert (=> b!393026 (=> (not res!225137) (not e!237983))))

(declare-datatypes ((array!23288 0))(
  ( (array!23289 (arr!11102 (Array (_ BitVec 32) (_ BitVec 64))) (size!11454 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23288)

(declare-datatypes ((List!6313 0))(
  ( (Nil!6310) (Cons!6309 (h!7165 (_ BitVec 64)) (t!11475 List!6313)) )
))
(declare-fun arrayNoDuplicates!0 (array!23288 (_ BitVec 32) List!6313) Bool)

(assert (=> b!393026 (= res!225137 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6310))))

(declare-fun b!393027 () Bool)

(declare-fun res!225143 () Bool)

(assert (=> b!393027 (=> (not res!225143) (not e!237983))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23288 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!393027 (= res!225143 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!393028 () Bool)

(declare-fun e!237988 () Bool)

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((V!14035 0))(
  ( (V!14036 (val!4893 Int)) )
))
(declare-datatypes ((ValueCell!4505 0))(
  ( (ValueCellFull!4505 (v!7131 V!14035)) (EmptyCell!4505) )
))
(declare-datatypes ((array!23290 0))(
  ( (array!23291 (arr!11103 (Array (_ BitVec 32) ValueCell!4505)) (size!11455 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23290)

(assert (=> b!393028 (= e!237988 (bvslt i!548 (size!11455 _values!506)))))

(declare-datatypes ((tuple2!6466 0))(
  ( (tuple2!6467 (_1!3244 (_ BitVec 64)) (_2!3244 V!14035)) )
))
(declare-datatypes ((List!6314 0))(
  ( (Nil!6311) (Cons!6310 (h!7166 tuple2!6466) (t!11476 List!6314)) )
))
(declare-datatypes ((ListLongMap!5381 0))(
  ( (ListLongMap!5382 (toList!2706 List!6314)) )
))
(declare-fun lt!185935 () ListLongMap!5381)

(declare-fun lt!185934 () ListLongMap!5381)

(declare-fun lt!185938 () tuple2!6466)

(declare-fun +!1060 (ListLongMap!5381 tuple2!6466) ListLongMap!5381)

(assert (=> b!393028 (= lt!185935 (+!1060 lt!185934 lt!185938))))

(declare-fun v!373 () V!14035)

(declare-datatypes ((Unit!11991 0))(
  ( (Unit!11992) )
))
(declare-fun lt!185931 () Unit!11991)

(declare-fun lt!185933 () ListLongMap!5381)

(declare-fun minValue!472 () V!14035)

(declare-fun addCommutativeForDiffKeys!347 (ListLongMap!5381 (_ BitVec 64) V!14035 (_ BitVec 64) V!14035) Unit!11991)

(assert (=> b!393028 (= lt!185931 (addCommutativeForDiffKeys!347 lt!185933 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!393029 () Bool)

(declare-fun res!225136 () Bool)

(assert (=> b!393029 (=> (not res!225136) (not e!237983))))

(assert (=> b!393029 (= res!225136 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11454 _keys!658))))))

(declare-fun b!393030 () Bool)

(declare-fun e!237982 () Bool)

(assert (=> b!393030 (= e!237982 e!237988)))

(declare-fun res!225141 () Bool)

(assert (=> b!393030 (=> res!225141 e!237988)))

(assert (=> b!393030 (= res!225141 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!185936 () ListLongMap!5381)

(assert (=> b!393030 (= lt!185936 lt!185934)))

(declare-fun lt!185927 () tuple2!6466)

(assert (=> b!393030 (= lt!185934 (+!1060 lt!185933 lt!185927))))

(declare-fun lt!185928 () ListLongMap!5381)

(assert (=> b!393030 (= lt!185928 lt!185935)))

(declare-fun lt!185937 () ListLongMap!5381)

(assert (=> b!393030 (= lt!185935 (+!1060 lt!185937 lt!185927))))

(declare-fun lt!185939 () ListLongMap!5381)

(assert (=> b!393030 (= lt!185928 (+!1060 lt!185939 lt!185927))))

(assert (=> b!393030 (= lt!185927 (tuple2!6467 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun mapNonEmpty!16140 () Bool)

(declare-fun mapRes!16140 () Bool)

(declare-fun tp!31857 () Bool)

(declare-fun e!237989 () Bool)

(assert (=> mapNonEmpty!16140 (= mapRes!16140 (and tp!31857 e!237989))))

(declare-fun mapValue!16140 () ValueCell!4505)

(declare-fun mapRest!16140 () (Array (_ BitVec 32) ValueCell!4505))

(declare-fun mapKey!16140 () (_ BitVec 32))

(assert (=> mapNonEmpty!16140 (= (arr!11103 _values!506) (store mapRest!16140 mapKey!16140 mapValue!16140))))

(declare-fun b!393031 () Bool)

(declare-fun e!237984 () Bool)

(assert (=> b!393031 (= e!237983 e!237984)))

(declare-fun res!225146 () Bool)

(assert (=> b!393031 (=> (not res!225146) (not e!237984))))

(declare-fun lt!185929 () array!23288)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23288 (_ BitVec 32)) Bool)

(assert (=> b!393031 (= res!225146 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!185929 mask!970))))

(assert (=> b!393031 (= lt!185929 (array!23289 (store (arr!11102 _keys!658) i!548 k0!778) (size!11454 _keys!658)))))

(declare-fun b!393032 () Bool)

(assert (=> b!393032 (= e!237984 (not e!237982))))

(declare-fun res!225147 () Bool)

(assert (=> b!393032 (=> res!225147 e!237982)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!393032 (= res!225147 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!472 () V!14035)

(declare-fun defaultEntry!514 () Int)

(declare-fun getCurrentListMap!2082 (array!23288 array!23290 (_ BitVec 32) (_ BitVec 32) V!14035 V!14035 (_ BitVec 32) Int) ListLongMap!5381)

(assert (=> b!393032 (= lt!185936 (getCurrentListMap!2082 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185930 () array!23290)

(assert (=> b!393032 (= lt!185928 (getCurrentListMap!2082 lt!185929 lt!185930 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!393032 (and (= lt!185939 lt!185937) (= lt!185937 lt!185939))))

(assert (=> b!393032 (= lt!185937 (+!1060 lt!185933 lt!185938))))

(assert (=> b!393032 (= lt!185938 (tuple2!6467 k0!778 v!373))))

(declare-fun lt!185932 () Unit!11991)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!273 (array!23288 array!23290 (_ BitVec 32) (_ BitVec 32) V!14035 V!14035 (_ BitVec 32) (_ BitVec 64) V!14035 (_ BitVec 32) Int) Unit!11991)

(assert (=> b!393032 (= lt!185932 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!273 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!971 (array!23288 array!23290 (_ BitVec 32) (_ BitVec 32) V!14035 V!14035 (_ BitVec 32) Int) ListLongMap!5381)

(assert (=> b!393032 (= lt!185939 (getCurrentListMapNoExtraKeys!971 lt!185929 lt!185930 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!393032 (= lt!185930 (array!23291 (store (arr!11103 _values!506) i!548 (ValueCellFull!4505 v!373)) (size!11455 _values!506)))))

(assert (=> b!393032 (= lt!185933 (getCurrentListMapNoExtraKeys!971 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!393033 () Bool)

(declare-fun res!225145 () Bool)

(assert (=> b!393033 (=> (not res!225145) (not e!237984))))

(assert (=> b!393033 (= res!225145 (arrayNoDuplicates!0 lt!185929 #b00000000000000000000000000000000 Nil!6310))))

(declare-fun b!393034 () Bool)

(declare-fun res!225139 () Bool)

(assert (=> b!393034 (=> (not res!225139) (not e!237983))))

(assert (=> b!393034 (= res!225139 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!393035 () Bool)

(declare-fun res!225140 () Bool)

(assert (=> b!393035 (=> (not res!225140) (not e!237983))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!393035 (= res!225140 (validKeyInArray!0 k0!778))))

(declare-fun mapIsEmpty!16140 () Bool)

(assert (=> mapIsEmpty!16140 mapRes!16140))

(declare-fun b!393036 () Bool)

(declare-fun res!225142 () Bool)

(assert (=> b!393036 (=> (not res!225142) (not e!237983))))

(assert (=> b!393036 (= res!225142 (and (= (size!11455 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11454 _keys!658) (size!11455 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!393037 () Bool)

(declare-fun res!225144 () Bool)

(assert (=> b!393037 (=> (not res!225144) (not e!237983))))

(assert (=> b!393037 (= res!225144 (or (= (select (arr!11102 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11102 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!393038 () Bool)

(declare-fun e!237986 () Bool)

(assert (=> b!393038 (= e!237986 (and e!237987 mapRes!16140))))

(declare-fun condMapEmpty!16140 () Bool)

(declare-fun mapDefault!16140 () ValueCell!4505)

(assert (=> b!393038 (= condMapEmpty!16140 (= (arr!11103 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4505)) mapDefault!16140)))))

(declare-fun res!225138 () Bool)

(assert (=> start!38130 (=> (not res!225138) (not e!237983))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38130 (= res!225138 (validMask!0 mask!970))))

(assert (=> start!38130 e!237983))

(declare-fun array_inv!8204 (array!23290) Bool)

(assert (=> start!38130 (and (array_inv!8204 _values!506) e!237986)))

(assert (=> start!38130 tp!31856))

(assert (=> start!38130 true))

(assert (=> start!38130 tp_is_empty!9697))

(declare-fun array_inv!8205 (array!23288) Bool)

(assert (=> start!38130 (array_inv!8205 _keys!658)))

(declare-fun b!393039 () Bool)

(assert (=> b!393039 (= e!237989 tp_is_empty!9697)))

(assert (= (and start!38130 res!225138) b!393036))

(assert (= (and b!393036 res!225142) b!393034))

(assert (= (and b!393034 res!225139) b!393026))

(assert (= (and b!393026 res!225137) b!393029))

(assert (= (and b!393029 res!225136) b!393035))

(assert (= (and b!393035 res!225140) b!393037))

(assert (= (and b!393037 res!225144) b!393027))

(assert (= (and b!393027 res!225143) b!393031))

(assert (= (and b!393031 res!225146) b!393033))

(assert (= (and b!393033 res!225145) b!393032))

(assert (= (and b!393032 (not res!225147)) b!393030))

(assert (= (and b!393030 (not res!225141)) b!393028))

(assert (= (and b!393038 condMapEmpty!16140) mapIsEmpty!16140))

(assert (= (and b!393038 (not condMapEmpty!16140)) mapNonEmpty!16140))

(get-info :version)

(assert (= (and mapNonEmpty!16140 ((_ is ValueCellFull!4505) mapValue!16140)) b!393039))

(assert (= (and b!393038 ((_ is ValueCellFull!4505) mapDefault!16140)) b!393025))

(assert (= start!38130 b!393038))

(declare-fun m!389749 () Bool)

(assert (=> b!393031 m!389749))

(declare-fun m!389751 () Bool)

(assert (=> b!393031 m!389751))

(declare-fun m!389753 () Bool)

(assert (=> b!393032 m!389753))

(declare-fun m!389755 () Bool)

(assert (=> b!393032 m!389755))

(declare-fun m!389757 () Bool)

(assert (=> b!393032 m!389757))

(declare-fun m!389759 () Bool)

(assert (=> b!393032 m!389759))

(declare-fun m!389761 () Bool)

(assert (=> b!393032 m!389761))

(declare-fun m!389763 () Bool)

(assert (=> b!393032 m!389763))

(declare-fun m!389765 () Bool)

(assert (=> b!393032 m!389765))

(declare-fun m!389767 () Bool)

(assert (=> mapNonEmpty!16140 m!389767))

(declare-fun m!389769 () Bool)

(assert (=> b!393033 m!389769))

(declare-fun m!389771 () Bool)

(assert (=> b!393035 m!389771))

(declare-fun m!389773 () Bool)

(assert (=> b!393037 m!389773))

(declare-fun m!389775 () Bool)

(assert (=> b!393030 m!389775))

(declare-fun m!389777 () Bool)

(assert (=> b!393030 m!389777))

(declare-fun m!389779 () Bool)

(assert (=> b!393030 m!389779))

(declare-fun m!389781 () Bool)

(assert (=> b!393026 m!389781))

(declare-fun m!389783 () Bool)

(assert (=> start!38130 m!389783))

(declare-fun m!389785 () Bool)

(assert (=> start!38130 m!389785))

(declare-fun m!389787 () Bool)

(assert (=> start!38130 m!389787))

(declare-fun m!389789 () Bool)

(assert (=> b!393034 m!389789))

(declare-fun m!389791 () Bool)

(assert (=> b!393028 m!389791))

(declare-fun m!389793 () Bool)

(assert (=> b!393028 m!389793))

(declare-fun m!389795 () Bool)

(assert (=> b!393027 m!389795))

(check-sat (not b!393033) (not start!38130) (not b!393031) (not b_next!9025) (not b!393026) (not b!393035) tp_is_empty!9697 b_and!16401 (not b!393027) (not b!393030) (not b!393034) (not b!393032) (not b!393028) (not mapNonEmpty!16140))
(check-sat b_and!16401 (not b_next!9025))
