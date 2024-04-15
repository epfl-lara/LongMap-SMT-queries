; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37344 () Bool)

(assert start!37344)

(declare-fun b_free!8485 () Bool)

(declare-fun b_next!8485 () Bool)

(assert (=> start!37344 (= b_free!8485 (not b_next!8485))))

(declare-fun tp!30171 () Bool)

(declare-fun b_and!15701 () Bool)

(assert (=> start!37344 (= tp!30171 b_and!15701)))

(declare-fun b!379094 () Bool)

(declare-fun res!214970 () Bool)

(declare-fun e!230643 () Bool)

(assert (=> b!379094 (=> (not res!214970) (not e!230643))))

(declare-datatypes ((array!22171 0))(
  ( (array!22172 (arr!10554 (Array (_ BitVec 32) (_ BitVec 64))) (size!10907 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22171)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22171 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!379094 (= res!214970 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!379095 () Bool)

(declare-fun e!230641 () Bool)

(assert (=> b!379095 (= e!230643 e!230641)))

(declare-fun res!214967 () Bool)

(assert (=> b!379095 (=> (not res!214967) (not e!230641))))

(declare-fun lt!176886 () array!22171)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22171 (_ BitVec 32)) Bool)

(assert (=> b!379095 (= res!214967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!176886 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!379095 (= lt!176886 (array!22172 (store (arr!10554 _keys!658) i!548 k0!778) (size!10907 _keys!658)))))

(declare-fun b!379096 () Bool)

(declare-fun e!230646 () Bool)

(assert (=> b!379096 (= e!230641 (not e!230646))))

(declare-fun res!214961 () Bool)

(assert (=> b!379096 (=> res!214961 e!230646)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!379096 (= res!214961 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!13283 0))(
  ( (V!13284 (val!4611 Int)) )
))
(declare-datatypes ((tuple2!6144 0))(
  ( (tuple2!6145 (_1!3083 (_ BitVec 64)) (_2!3083 V!13283)) )
))
(declare-datatypes ((List!5973 0))(
  ( (Nil!5970) (Cons!5969 (h!6825 tuple2!6144) (t!11114 List!5973)) )
))
(declare-datatypes ((ListLongMap!5047 0))(
  ( (ListLongMap!5048 (toList!2539 List!5973)) )
))
(declare-fun lt!176890 () ListLongMap!5047)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13283)

(declare-datatypes ((ValueCell!4223 0))(
  ( (ValueCellFull!4223 (v!6802 V!13283)) (EmptyCell!4223) )
))
(declare-datatypes ((array!22173 0))(
  ( (array!22174 (arr!10555 (Array (_ BitVec 32) ValueCell!4223)) (size!10908 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22173)

(declare-fun minValue!472 () V!13283)

(declare-fun getCurrentListMap!1938 (array!22171 array!22173 (_ BitVec 32) (_ BitVec 32) V!13283 V!13283 (_ BitVec 32) Int) ListLongMap!5047)

(assert (=> b!379096 (= lt!176890 (getCurrentListMap!1938 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176888 () array!22173)

(declare-fun lt!176898 () ListLongMap!5047)

(assert (=> b!379096 (= lt!176898 (getCurrentListMap!1938 lt!176886 lt!176888 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176893 () ListLongMap!5047)

(declare-fun lt!176887 () ListLongMap!5047)

(assert (=> b!379096 (and (= lt!176893 lt!176887) (= lt!176887 lt!176893))))

(declare-fun lt!176895 () ListLongMap!5047)

(declare-fun lt!176894 () tuple2!6144)

(declare-fun +!907 (ListLongMap!5047 tuple2!6144) ListLongMap!5047)

(assert (=> b!379096 (= lt!176887 (+!907 lt!176895 lt!176894))))

(declare-fun v!373 () V!13283)

(assert (=> b!379096 (= lt!176894 (tuple2!6145 k0!778 v!373))))

(declare-datatypes ((Unit!11676 0))(
  ( (Unit!11677) )
))
(declare-fun lt!176897 () Unit!11676)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!131 (array!22171 array!22173 (_ BitVec 32) (_ BitVec 32) V!13283 V!13283 (_ BitVec 32) (_ BitVec 64) V!13283 (_ BitVec 32) Int) Unit!11676)

(assert (=> b!379096 (= lt!176897 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!131 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!803 (array!22171 array!22173 (_ BitVec 32) (_ BitVec 32) V!13283 V!13283 (_ BitVec 32) Int) ListLongMap!5047)

(assert (=> b!379096 (= lt!176893 (getCurrentListMapNoExtraKeys!803 lt!176886 lt!176888 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!379096 (= lt!176888 (array!22174 (store (arr!10555 _values!506) i!548 (ValueCellFull!4223 v!373)) (size!10908 _values!506)))))

(assert (=> b!379096 (= lt!176895 (getCurrentListMapNoExtraKeys!803 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!379097 () Bool)

(declare-fun e!230645 () Bool)

(declare-fun tp_is_empty!9133 () Bool)

(assert (=> b!379097 (= e!230645 tp_is_empty!9133)))

(declare-fun mapNonEmpty!15264 () Bool)

(declare-fun mapRes!15264 () Bool)

(declare-fun tp!30170 () Bool)

(assert (=> mapNonEmpty!15264 (= mapRes!15264 (and tp!30170 e!230645))))

(declare-fun mapRest!15264 () (Array (_ BitVec 32) ValueCell!4223))

(declare-fun mapValue!15264 () ValueCell!4223)

(declare-fun mapKey!15264 () (_ BitVec 32))

(assert (=> mapNonEmpty!15264 (= (arr!10555 _values!506) (store mapRest!15264 mapKey!15264 mapValue!15264))))

(declare-fun b!379098 () Bool)

(declare-fun res!214962 () Bool)

(assert (=> b!379098 (=> (not res!214962) (not e!230641))))

(declare-datatypes ((List!5974 0))(
  ( (Nil!5971) (Cons!5970 (h!6826 (_ BitVec 64)) (t!11115 List!5974)) )
))
(declare-fun arrayNoDuplicates!0 (array!22171 (_ BitVec 32) List!5974) Bool)

(assert (=> b!379098 (= res!214962 (arrayNoDuplicates!0 lt!176886 #b00000000000000000000000000000000 Nil!5971))))

(declare-fun b!379099 () Bool)

(declare-fun e!230644 () Bool)

(assert (=> b!379099 (= e!230646 e!230644)))

(declare-fun res!214963 () Bool)

(assert (=> b!379099 (=> res!214963 e!230644)))

(assert (=> b!379099 (= res!214963 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!176889 () ListLongMap!5047)

(assert (=> b!379099 (= lt!176890 lt!176889)))

(declare-fun lt!176892 () tuple2!6144)

(assert (=> b!379099 (= lt!176889 (+!907 lt!176895 lt!176892))))

(declare-fun lt!176891 () ListLongMap!5047)

(assert (=> b!379099 (= lt!176898 lt!176891)))

(assert (=> b!379099 (= lt!176891 (+!907 lt!176887 lt!176892))))

(assert (=> b!379099 (= lt!176898 (+!907 lt!176893 lt!176892))))

(assert (=> b!379099 (= lt!176892 (tuple2!6145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun mapIsEmpty!15264 () Bool)

(assert (=> mapIsEmpty!15264 mapRes!15264))

(declare-fun b!379100 () Bool)

(assert (=> b!379100 (= e!230644 true)))

(assert (=> b!379100 (= lt!176891 (+!907 lt!176889 lt!176894))))

(declare-fun lt!176896 () Unit!11676)

(declare-fun addCommutativeForDiffKeys!304 (ListLongMap!5047 (_ BitVec 64) V!13283 (_ BitVec 64) V!13283) Unit!11676)

(assert (=> b!379100 (= lt!176896 (addCommutativeForDiffKeys!304 lt!176895 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!379101 () Bool)

(declare-fun res!214959 () Bool)

(assert (=> b!379101 (=> (not res!214959) (not e!230643))))

(assert (=> b!379101 (= res!214959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!379102 () Bool)

(declare-fun e!230648 () Bool)

(assert (=> b!379102 (= e!230648 tp_is_empty!9133)))

(declare-fun b!379103 () Bool)

(declare-fun res!214969 () Bool)

(assert (=> b!379103 (=> (not res!214969) (not e!230643))))

(assert (=> b!379103 (= res!214969 (or (= (select (arr!10554 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10554 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!379105 () Bool)

(declare-fun res!214965 () Bool)

(assert (=> b!379105 (=> (not res!214965) (not e!230643))))

(assert (=> b!379105 (= res!214965 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5971))))

(declare-fun b!379106 () Bool)

(declare-fun res!214964 () Bool)

(assert (=> b!379106 (=> (not res!214964) (not e!230643))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!379106 (= res!214964 (validKeyInArray!0 k0!778))))

(declare-fun b!379107 () Bool)

(declare-fun res!214968 () Bool)

(assert (=> b!379107 (=> (not res!214968) (not e!230643))))

(assert (=> b!379107 (= res!214968 (and (= (size!10908 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10907 _keys!658) (size!10908 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!379108 () Bool)

(declare-fun e!230642 () Bool)

(assert (=> b!379108 (= e!230642 (and e!230648 mapRes!15264))))

(declare-fun condMapEmpty!15264 () Bool)

(declare-fun mapDefault!15264 () ValueCell!4223)

(assert (=> b!379108 (= condMapEmpty!15264 (= (arr!10555 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4223)) mapDefault!15264)))))

(declare-fun res!214960 () Bool)

(assert (=> start!37344 (=> (not res!214960) (not e!230643))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37344 (= res!214960 (validMask!0 mask!970))))

(assert (=> start!37344 e!230643))

(declare-fun array_inv!7776 (array!22173) Bool)

(assert (=> start!37344 (and (array_inv!7776 _values!506) e!230642)))

(assert (=> start!37344 tp!30171))

(assert (=> start!37344 true))

(assert (=> start!37344 tp_is_empty!9133))

(declare-fun array_inv!7777 (array!22171) Bool)

(assert (=> start!37344 (array_inv!7777 _keys!658)))

(declare-fun b!379104 () Bool)

(declare-fun res!214966 () Bool)

(assert (=> b!379104 (=> (not res!214966) (not e!230643))))

(assert (=> b!379104 (= res!214966 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10907 _keys!658))))))

(assert (= (and start!37344 res!214960) b!379107))

(assert (= (and b!379107 res!214968) b!379101))

(assert (= (and b!379101 res!214959) b!379105))

(assert (= (and b!379105 res!214965) b!379104))

(assert (= (and b!379104 res!214966) b!379106))

(assert (= (and b!379106 res!214964) b!379103))

(assert (= (and b!379103 res!214969) b!379094))

(assert (= (and b!379094 res!214970) b!379095))

(assert (= (and b!379095 res!214967) b!379098))

(assert (= (and b!379098 res!214962) b!379096))

(assert (= (and b!379096 (not res!214961)) b!379099))

(assert (= (and b!379099 (not res!214963)) b!379100))

(assert (= (and b!379108 condMapEmpty!15264) mapIsEmpty!15264))

(assert (= (and b!379108 (not condMapEmpty!15264)) mapNonEmpty!15264))

(get-info :version)

(assert (= (and mapNonEmpty!15264 ((_ is ValueCellFull!4223) mapValue!15264)) b!379097))

(assert (= (and b!379108 ((_ is ValueCellFull!4223) mapDefault!15264)) b!379102))

(assert (= start!37344 b!379108))

(declare-fun m!375515 () Bool)

(assert (=> b!379099 m!375515))

(declare-fun m!375517 () Bool)

(assert (=> b!379099 m!375517))

(declare-fun m!375519 () Bool)

(assert (=> b!379099 m!375519))

(declare-fun m!375521 () Bool)

(assert (=> b!379105 m!375521))

(declare-fun m!375523 () Bool)

(assert (=> mapNonEmpty!15264 m!375523))

(declare-fun m!375525 () Bool)

(assert (=> start!37344 m!375525))

(declare-fun m!375527 () Bool)

(assert (=> start!37344 m!375527))

(declare-fun m!375529 () Bool)

(assert (=> start!37344 m!375529))

(declare-fun m!375531 () Bool)

(assert (=> b!379096 m!375531))

(declare-fun m!375533 () Bool)

(assert (=> b!379096 m!375533))

(declare-fun m!375535 () Bool)

(assert (=> b!379096 m!375535))

(declare-fun m!375537 () Bool)

(assert (=> b!379096 m!375537))

(declare-fun m!375539 () Bool)

(assert (=> b!379096 m!375539))

(declare-fun m!375541 () Bool)

(assert (=> b!379096 m!375541))

(declare-fun m!375543 () Bool)

(assert (=> b!379096 m!375543))

(declare-fun m!375545 () Bool)

(assert (=> b!379094 m!375545))

(declare-fun m!375547 () Bool)

(assert (=> b!379100 m!375547))

(declare-fun m!375549 () Bool)

(assert (=> b!379100 m!375549))

(declare-fun m!375551 () Bool)

(assert (=> b!379103 m!375551))

(declare-fun m!375553 () Bool)

(assert (=> b!379101 m!375553))

(declare-fun m!375555 () Bool)

(assert (=> b!379098 m!375555))

(declare-fun m!375557 () Bool)

(assert (=> b!379095 m!375557))

(declare-fun m!375559 () Bool)

(assert (=> b!379095 m!375559))

(declare-fun m!375561 () Bool)

(assert (=> b!379106 m!375561))

(check-sat tp_is_empty!9133 (not b!379105) (not b!379100) (not b_next!8485) (not b!379106) b_and!15701 (not b!379101) (not start!37344) (not b!379094) (not b!379095) (not mapNonEmpty!15264) (not b!379098) (not b!379096) (not b!379099))
(check-sat b_and!15701 (not b_next!8485))
