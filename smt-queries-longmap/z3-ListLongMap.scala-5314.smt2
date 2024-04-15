; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71084 () Bool)

(assert start!71084)

(declare-fun b_free!13291 () Bool)

(declare-fun b_next!13291 () Bool)

(assert (=> start!71084 (= b_free!13291 (not b_next!13291))))

(declare-fun tp!46629 () Bool)

(declare-fun b_and!22179 () Bool)

(assert (=> start!71084 (= tp!46629 b_and!22179)))

(declare-fun b!825584 () Bool)

(declare-fun e!459606 () Bool)

(declare-fun e!459603 () Bool)

(assert (=> b!825584 (= e!459606 e!459603)))

(declare-fun res!562865 () Bool)

(assert (=> b!825584 (=> res!562865 e!459603)))

(declare-datatypes ((V!25003 0))(
  ( (V!25004 (val!7548 Int)) )
))
(declare-datatypes ((tuple2!10002 0))(
  ( (tuple2!10003 (_1!5012 (_ BitVec 64)) (_2!5012 V!25003)) )
))
(declare-fun lt!372972 () tuple2!10002)

(declare-fun lt!372983 () tuple2!10002)

(declare-datatypes ((List!15794 0))(
  ( (Nil!15791) (Cons!15790 (h!16919 tuple2!10002) (t!22130 List!15794)) )
))
(declare-datatypes ((ListLongMap!8815 0))(
  ( (ListLongMap!8816 (toList!4423 List!15794)) )
))
(declare-fun lt!372974 () ListLongMap!8815)

(declare-fun lt!372984 () ListLongMap!8815)

(declare-fun +!1960 (ListLongMap!8815 tuple2!10002) ListLongMap!8815)

(assert (=> b!825584 (= res!562865 (not (= lt!372974 (+!1960 (+!1960 lt!372984 lt!372972) lt!372983))))))

(declare-fun lt!372976 () ListLongMap!8815)

(declare-fun lt!372982 () ListLongMap!8815)

(assert (=> b!825584 (and (= lt!372976 lt!372982) (= lt!372974 lt!372982) (= lt!372974 lt!372976))))

(declare-fun lt!372980 () ListLongMap!8815)

(assert (=> b!825584 (= lt!372982 (+!1960 lt!372980 lt!372972))))

(declare-fun lt!372979 () ListLongMap!8815)

(assert (=> b!825584 (= lt!372976 (+!1960 lt!372979 lt!372972))))

(declare-fun zeroValueBefore!34 () V!25003)

(declare-datatypes ((Unit!28259 0))(
  ( (Unit!28260) )
))
(declare-fun lt!372975 () Unit!28259)

(declare-fun zeroValueAfter!34 () V!25003)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!227 (ListLongMap!8815 (_ BitVec 64) V!25003 V!25003) Unit!28259)

(assert (=> b!825584 (= lt!372975 (addSameAsAddTwiceSameKeyDiffValues!227 lt!372979 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(declare-fun e!459605 () Bool)

(assert (=> b!825584 e!459605))

(declare-fun res!562866 () Bool)

(assert (=> b!825584 (=> (not res!562866) (not e!459605))))

(declare-fun lt!372977 () ListLongMap!8815)

(assert (=> b!825584 (= res!562866 (= lt!372977 lt!372980))))

(declare-fun lt!372978 () tuple2!10002)

(assert (=> b!825584 (= lt!372980 (+!1960 lt!372979 lt!372978))))

(assert (=> b!825584 (= lt!372979 (+!1960 lt!372984 lt!372983))))

(assert (=> b!825584 (= lt!372972 (tuple2!10003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!459598 () Bool)

(assert (=> b!825584 e!459598))

(declare-fun res!562871 () Bool)

(assert (=> b!825584 (=> (not res!562871) (not e!459598))))

(assert (=> b!825584 (= res!562871 (= lt!372977 (+!1960 (+!1960 lt!372984 lt!372978) lt!372983)))))

(declare-fun minValue!754 () V!25003)

(assert (=> b!825584 (= lt!372983 (tuple2!10003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!825584 (= lt!372978 (tuple2!10003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-datatypes ((array!46147 0))(
  ( (array!46148 (arr!22120 (Array (_ BitVec 32) (_ BitVec 64))) (size!22541 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46147)

(declare-datatypes ((ValueCell!7085 0))(
  ( (ValueCellFull!7085 (v!9975 V!25003)) (EmptyCell!7085) )
))
(declare-datatypes ((array!46149 0))(
  ( (array!46150 (arr!22121 (Array (_ BitVec 32) ValueCell!7085)) (size!22542 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46149)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2510 (array!46147 array!46149 (_ BitVec 32) (_ BitVec 32) V!25003 V!25003 (_ BitVec 32) Int) ListLongMap!8815)

(assert (=> b!825584 (= lt!372974 (getCurrentListMap!2510 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!825584 (= lt!372977 (getCurrentListMap!2510 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825585 () Bool)

(declare-fun e!459600 () Bool)

(assert (=> b!825585 (= e!459600 (not e!459606))))

(declare-fun res!562872 () Bool)

(assert (=> b!825585 (=> res!562872 e!459606)))

(assert (=> b!825585 (= res!562872 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!372973 () ListLongMap!8815)

(assert (=> b!825585 (= lt!372984 lt!372973)))

(declare-fun lt!372981 () Unit!28259)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!553 (array!46147 array!46149 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25003 V!25003 V!25003 V!25003 (_ BitVec 32) Int) Unit!28259)

(assert (=> b!825585 (= lt!372981 (lemmaNoChangeToArrayThenSameMapNoExtras!553 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2460 (array!46147 array!46149 (_ BitVec 32) (_ BitVec 32) V!25003 V!25003 (_ BitVec 32) Int) ListLongMap!8815)

(assert (=> b!825585 (= lt!372973 (getCurrentListMapNoExtraKeys!2460 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!825585 (= lt!372984 (getCurrentListMapNoExtraKeys!2460 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!562869 () Bool)

(assert (=> start!71084 (=> (not res!562869) (not e!459600))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71084 (= res!562869 (validMask!0 mask!1312))))

(assert (=> start!71084 e!459600))

(declare-fun tp_is_empty!15001 () Bool)

(assert (=> start!71084 tp_is_empty!15001))

(declare-fun array_inv!17701 (array!46147) Bool)

(assert (=> start!71084 (array_inv!17701 _keys!976)))

(assert (=> start!71084 true))

(declare-fun e!459604 () Bool)

(declare-fun array_inv!17702 (array!46149) Bool)

(assert (=> start!71084 (and (array_inv!17702 _values!788) e!459604)))

(assert (=> start!71084 tp!46629))

(declare-fun b!825586 () Bool)

(declare-fun res!562868 () Bool)

(assert (=> b!825586 (=> (not res!562868) (not e!459600))))

(assert (=> b!825586 (= res!562868 (and (= (size!22542 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22541 _keys!976) (size!22542 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!24124 () Bool)

(declare-fun mapRes!24124 () Bool)

(declare-fun tp!46630 () Bool)

(declare-fun e!459599 () Bool)

(assert (=> mapNonEmpty!24124 (= mapRes!24124 (and tp!46630 e!459599))))

(declare-fun mapKey!24124 () (_ BitVec 32))

(declare-fun mapRest!24124 () (Array (_ BitVec 32) ValueCell!7085))

(declare-fun mapValue!24124 () ValueCell!7085)

(assert (=> mapNonEmpty!24124 (= (arr!22121 _values!788) (store mapRest!24124 mapKey!24124 mapValue!24124))))

(declare-fun b!825587 () Bool)

(declare-fun e!459601 () Bool)

(assert (=> b!825587 (= e!459604 (and e!459601 mapRes!24124))))

(declare-fun condMapEmpty!24124 () Bool)

(declare-fun mapDefault!24124 () ValueCell!7085)

(assert (=> b!825587 (= condMapEmpty!24124 (= (arr!22121 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7085)) mapDefault!24124)))))

(declare-fun b!825588 () Bool)

(declare-fun res!562870 () Bool)

(assert (=> b!825588 (=> (not res!562870) (not e!459600))))

(declare-datatypes ((List!15795 0))(
  ( (Nil!15792) (Cons!15791 (h!16920 (_ BitVec 64)) (t!22131 List!15795)) )
))
(declare-fun arrayNoDuplicates!0 (array!46147 (_ BitVec 32) List!15795) Bool)

(assert (=> b!825588 (= res!562870 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15792))))

(declare-fun b!825589 () Bool)

(assert (=> b!825589 (= e!459605 (= lt!372974 (+!1960 (+!1960 lt!372973 lt!372983) lt!372972)))))

(declare-fun b!825590 () Bool)

(assert (=> b!825590 (= e!459601 tp_is_empty!15001)))

(declare-fun b!825591 () Bool)

(assert (=> b!825591 (= e!459598 (= lt!372974 (+!1960 (+!1960 lt!372973 (tuple2!10003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!372983)))))

(declare-fun b!825592 () Bool)

(assert (=> b!825592 (= e!459603 (bvsle #b00000000000000000000000000000000 (size!22541 _keys!976)))))

(declare-fun b!825593 () Bool)

(assert (=> b!825593 (= e!459599 tp_is_empty!15001)))

(declare-fun b!825594 () Bool)

(declare-fun res!562867 () Bool)

(assert (=> b!825594 (=> (not res!562867) (not e!459600))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46147 (_ BitVec 32)) Bool)

(assert (=> b!825594 (= res!562867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!24124 () Bool)

(assert (=> mapIsEmpty!24124 mapRes!24124))

(assert (= (and start!71084 res!562869) b!825586))

(assert (= (and b!825586 res!562868) b!825594))

(assert (= (and b!825594 res!562867) b!825588))

(assert (= (and b!825588 res!562870) b!825585))

(assert (= (and b!825585 (not res!562872)) b!825584))

(assert (= (and b!825584 res!562871) b!825591))

(assert (= (and b!825584 res!562866) b!825589))

(assert (= (and b!825584 (not res!562865)) b!825592))

(assert (= (and b!825587 condMapEmpty!24124) mapIsEmpty!24124))

(assert (= (and b!825587 (not condMapEmpty!24124)) mapNonEmpty!24124))

(get-info :version)

(assert (= (and mapNonEmpty!24124 ((_ is ValueCellFull!7085) mapValue!24124)) b!825593))

(assert (= (and b!825587 ((_ is ValueCellFull!7085) mapDefault!24124)) b!825590))

(assert (= start!71084 b!825587))

(declare-fun m!767469 () Bool)

(assert (=> b!825584 m!767469))

(declare-fun m!767471 () Bool)

(assert (=> b!825584 m!767471))

(declare-fun m!767473 () Bool)

(assert (=> b!825584 m!767473))

(declare-fun m!767475 () Bool)

(assert (=> b!825584 m!767475))

(declare-fun m!767477 () Bool)

(assert (=> b!825584 m!767477))

(declare-fun m!767479 () Bool)

(assert (=> b!825584 m!767479))

(declare-fun m!767481 () Bool)

(assert (=> b!825584 m!767481))

(assert (=> b!825584 m!767471))

(assert (=> b!825584 m!767475))

(declare-fun m!767483 () Bool)

(assert (=> b!825584 m!767483))

(declare-fun m!767485 () Bool)

(assert (=> b!825584 m!767485))

(declare-fun m!767487 () Bool)

(assert (=> b!825584 m!767487))

(declare-fun m!767489 () Bool)

(assert (=> b!825584 m!767489))

(declare-fun m!767491 () Bool)

(assert (=> start!71084 m!767491))

(declare-fun m!767493 () Bool)

(assert (=> start!71084 m!767493))

(declare-fun m!767495 () Bool)

(assert (=> start!71084 m!767495))

(declare-fun m!767497 () Bool)

(assert (=> b!825585 m!767497))

(declare-fun m!767499 () Bool)

(assert (=> b!825585 m!767499))

(declare-fun m!767501 () Bool)

(assert (=> b!825585 m!767501))

(declare-fun m!767503 () Bool)

(assert (=> b!825594 m!767503))

(declare-fun m!767505 () Bool)

(assert (=> b!825589 m!767505))

(assert (=> b!825589 m!767505))

(declare-fun m!767507 () Bool)

(assert (=> b!825589 m!767507))

(declare-fun m!767509 () Bool)

(assert (=> b!825591 m!767509))

(assert (=> b!825591 m!767509))

(declare-fun m!767511 () Bool)

(assert (=> b!825591 m!767511))

(declare-fun m!767513 () Bool)

(assert (=> mapNonEmpty!24124 m!767513))

(declare-fun m!767515 () Bool)

(assert (=> b!825588 m!767515))

(check-sat (not b!825585) b_and!22179 (not b_next!13291) (not b!825589) (not mapNonEmpty!24124) (not start!71084) (not b!825594) tp_is_empty!15001 (not b!825584) (not b!825591) (not b!825588))
(check-sat b_and!22179 (not b_next!13291))
(get-model)

(declare-fun d!104799 () Bool)

(declare-fun e!459663 () Bool)

(assert (=> d!104799 e!459663))

(declare-fun res!562925 () Bool)

(assert (=> d!104799 (=> (not res!562925) (not e!459663))))

(declare-fun lt!373073 () ListLongMap!8815)

(declare-fun contains!4158 (ListLongMap!8815 (_ BitVec 64)) Bool)

(assert (=> d!104799 (= res!562925 (contains!4158 lt!373073 (_1!5012 lt!372983)))))

(declare-fun lt!373072 () List!15794)

(assert (=> d!104799 (= lt!373073 (ListLongMap!8816 lt!373072))))

(declare-fun lt!373074 () Unit!28259)

(declare-fun lt!373071 () Unit!28259)

(assert (=> d!104799 (= lt!373074 lt!373071)))

(declare-datatypes ((Option!410 0))(
  ( (Some!409 (v!9978 V!25003)) (None!408) )
))
(declare-fun getValueByKey!404 (List!15794 (_ BitVec 64)) Option!410)

(assert (=> d!104799 (= (getValueByKey!404 lt!373072 (_1!5012 lt!372983)) (Some!409 (_2!5012 lt!372983)))))

(declare-fun lemmaContainsTupThenGetReturnValue!221 (List!15794 (_ BitVec 64) V!25003) Unit!28259)

(assert (=> d!104799 (= lt!373071 (lemmaContainsTupThenGetReturnValue!221 lt!373072 (_1!5012 lt!372983) (_2!5012 lt!372983)))))

(declare-fun insertStrictlySorted!260 (List!15794 (_ BitVec 64) V!25003) List!15794)

(assert (=> d!104799 (= lt!373072 (insertStrictlySorted!260 (toList!4423 (+!1960 lt!372973 (tuple2!10003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (_1!5012 lt!372983) (_2!5012 lt!372983)))))

(assert (=> d!104799 (= (+!1960 (+!1960 lt!372973 (tuple2!10003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!372983) lt!373073)))

(declare-fun b!825665 () Bool)

(declare-fun res!562926 () Bool)

(assert (=> b!825665 (=> (not res!562926) (not e!459663))))

(assert (=> b!825665 (= res!562926 (= (getValueByKey!404 (toList!4423 lt!373073) (_1!5012 lt!372983)) (Some!409 (_2!5012 lt!372983))))))

(declare-fun b!825666 () Bool)

(declare-fun contains!4159 (List!15794 tuple2!10002) Bool)

(assert (=> b!825666 (= e!459663 (contains!4159 (toList!4423 lt!373073) lt!372983))))

(assert (= (and d!104799 res!562925) b!825665))

(assert (= (and b!825665 res!562926) b!825666))

(declare-fun m!767613 () Bool)

(assert (=> d!104799 m!767613))

(declare-fun m!767615 () Bool)

(assert (=> d!104799 m!767615))

(declare-fun m!767617 () Bool)

(assert (=> d!104799 m!767617))

(declare-fun m!767619 () Bool)

(assert (=> d!104799 m!767619))

(declare-fun m!767621 () Bool)

(assert (=> b!825665 m!767621))

(declare-fun m!767623 () Bool)

(assert (=> b!825666 m!767623))

(assert (=> b!825591 d!104799))

(declare-fun d!104801 () Bool)

(declare-fun e!459664 () Bool)

(assert (=> d!104801 e!459664))

(declare-fun res!562927 () Bool)

(assert (=> d!104801 (=> (not res!562927) (not e!459664))))

(declare-fun lt!373077 () ListLongMap!8815)

(assert (=> d!104801 (= res!562927 (contains!4158 lt!373077 (_1!5012 (tuple2!10003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!373076 () List!15794)

(assert (=> d!104801 (= lt!373077 (ListLongMap!8816 lt!373076))))

(declare-fun lt!373078 () Unit!28259)

(declare-fun lt!373075 () Unit!28259)

(assert (=> d!104801 (= lt!373078 lt!373075)))

(assert (=> d!104801 (= (getValueByKey!404 lt!373076 (_1!5012 (tuple2!10003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!409 (_2!5012 (tuple2!10003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!104801 (= lt!373075 (lemmaContainsTupThenGetReturnValue!221 lt!373076 (_1!5012 (tuple2!10003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5012 (tuple2!10003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!104801 (= lt!373076 (insertStrictlySorted!260 (toList!4423 lt!372973) (_1!5012 (tuple2!10003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5012 (tuple2!10003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!104801 (= (+!1960 lt!372973 (tuple2!10003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!373077)))

(declare-fun b!825667 () Bool)

(declare-fun res!562928 () Bool)

(assert (=> b!825667 (=> (not res!562928) (not e!459664))))

(assert (=> b!825667 (= res!562928 (= (getValueByKey!404 (toList!4423 lt!373077) (_1!5012 (tuple2!10003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!409 (_2!5012 (tuple2!10003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!825668 () Bool)

(assert (=> b!825668 (= e!459664 (contains!4159 (toList!4423 lt!373077) (tuple2!10003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!104801 res!562927) b!825667))

(assert (= (and b!825667 res!562928) b!825668))

(declare-fun m!767625 () Bool)

(assert (=> d!104801 m!767625))

(declare-fun m!767627 () Bool)

(assert (=> d!104801 m!767627))

(declare-fun m!767629 () Bool)

(assert (=> d!104801 m!767629))

(declare-fun m!767631 () Bool)

(assert (=> d!104801 m!767631))

(declare-fun m!767633 () Bool)

(assert (=> b!825667 m!767633))

(declare-fun m!767635 () Bool)

(assert (=> b!825668 m!767635))

(assert (=> b!825591 d!104801))

(declare-fun d!104803 () Bool)

(assert (=> d!104803 (= (getCurrentListMapNoExtraKeys!2460 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2460 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!373081 () Unit!28259)

(declare-fun choose!1414 (array!46147 array!46149 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25003 V!25003 V!25003 V!25003 (_ BitVec 32) Int) Unit!28259)

(assert (=> d!104803 (= lt!373081 (choose!1414 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!104803 (validMask!0 mask!1312)))

(assert (=> d!104803 (= (lemmaNoChangeToArrayThenSameMapNoExtras!553 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!373081)))

(declare-fun bs!23039 () Bool)

(assert (= bs!23039 d!104803))

(assert (=> bs!23039 m!767501))

(assert (=> bs!23039 m!767499))

(declare-fun m!767637 () Bool)

(assert (=> bs!23039 m!767637))

(assert (=> bs!23039 m!767491))

(assert (=> b!825585 d!104803))

(declare-fun b!825694 () Bool)

(declare-fun res!562938 () Bool)

(declare-fun e!459682 () Bool)

(assert (=> b!825694 (=> (not res!562938) (not e!459682))))

(declare-fun lt!373099 () ListLongMap!8815)

(assert (=> b!825694 (= res!562938 (not (contains!4158 lt!373099 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!825695 () Bool)

(declare-fun e!459683 () ListLongMap!8815)

(declare-fun call!35847 () ListLongMap!8815)

(assert (=> b!825695 (= e!459683 call!35847)))

(declare-fun b!825696 () Bool)

(assert (=> b!825696 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22541 _keys!976)))))

(assert (=> b!825696 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22542 _values!788)))))

(declare-fun e!459680 () Bool)

(declare-fun apply!362 (ListLongMap!8815 (_ BitVec 64)) V!25003)

(declare-fun get!11745 (ValueCell!7085 V!25003) V!25003)

(declare-fun dynLambda!976 (Int (_ BitVec 64)) V!25003)

(assert (=> b!825696 (= e!459680 (= (apply!362 lt!373099 (select (arr!22120 _keys!976) #b00000000000000000000000000000000)) (get!11745 (select (arr!22121 _values!788) #b00000000000000000000000000000000) (dynLambda!976 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!825697 () Bool)

(declare-fun e!459681 () Bool)

(declare-fun isEmpty!649 (ListLongMap!8815) Bool)

(assert (=> b!825697 (= e!459681 (isEmpty!649 lt!373099))))

(declare-fun b!825698 () Bool)

(declare-fun e!459684 () Bool)

(assert (=> b!825698 (= e!459684 e!459680)))

(assert (=> b!825698 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22541 _keys!976)))))

(declare-fun res!562940 () Bool)

(assert (=> b!825698 (= res!562940 (contains!4158 lt!373099 (select (arr!22120 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!825698 (=> (not res!562940) (not e!459680))))

(declare-fun b!825699 () Bool)

(declare-fun e!459679 () ListLongMap!8815)

(assert (=> b!825699 (= e!459679 e!459683)))

(declare-fun c!89370 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!825699 (= c!89370 (validKeyInArray!0 (select (arr!22120 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!104805 () Bool)

(assert (=> d!104805 e!459682))

(declare-fun res!562939 () Bool)

(assert (=> d!104805 (=> (not res!562939) (not e!459682))))

(assert (=> d!104805 (= res!562939 (not (contains!4158 lt!373099 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104805 (= lt!373099 e!459679)))

(declare-fun c!89372 () Bool)

(assert (=> d!104805 (= c!89372 (bvsge #b00000000000000000000000000000000 (size!22541 _keys!976)))))

(assert (=> d!104805 (validMask!0 mask!1312)))

(assert (=> d!104805 (= (getCurrentListMapNoExtraKeys!2460 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!373099)))

(declare-fun b!825693 () Bool)

(declare-fun e!459685 () Bool)

(assert (=> b!825693 (= e!459685 (validKeyInArray!0 (select (arr!22120 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!825693 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!35844 () Bool)

(assert (=> bm!35844 (= call!35847 (getCurrentListMapNoExtraKeys!2460 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!825700 () Bool)

(assert (=> b!825700 (= e!459684 e!459681)))

(declare-fun c!89371 () Bool)

(assert (=> b!825700 (= c!89371 (bvslt #b00000000000000000000000000000000 (size!22541 _keys!976)))))

(declare-fun b!825701 () Bool)

(assert (=> b!825701 (= e!459681 (= lt!373099 (getCurrentListMapNoExtraKeys!2460 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!825702 () Bool)

(assert (=> b!825702 (= e!459679 (ListLongMap!8816 Nil!15791))))

(declare-fun b!825703 () Bool)

(declare-fun lt!373098 () Unit!28259)

(declare-fun lt!373102 () Unit!28259)

(assert (=> b!825703 (= lt!373098 lt!373102)))

(declare-fun lt!373101 () V!25003)

(declare-fun lt!373097 () (_ BitVec 64))

(declare-fun lt!373100 () (_ BitVec 64))

(declare-fun lt!373096 () ListLongMap!8815)

(assert (=> b!825703 (not (contains!4158 (+!1960 lt!373096 (tuple2!10003 lt!373097 lt!373101)) lt!373100))))

(declare-fun addStillNotContains!188 (ListLongMap!8815 (_ BitVec 64) V!25003 (_ BitVec 64)) Unit!28259)

(assert (=> b!825703 (= lt!373102 (addStillNotContains!188 lt!373096 lt!373097 lt!373101 lt!373100))))

(assert (=> b!825703 (= lt!373100 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!825703 (= lt!373101 (get!11745 (select (arr!22121 _values!788) #b00000000000000000000000000000000) (dynLambda!976 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!825703 (= lt!373097 (select (arr!22120 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!825703 (= lt!373096 call!35847)))

(assert (=> b!825703 (= e!459683 (+!1960 call!35847 (tuple2!10003 (select (arr!22120 _keys!976) #b00000000000000000000000000000000) (get!11745 (select (arr!22121 _values!788) #b00000000000000000000000000000000) (dynLambda!976 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!825704 () Bool)

(assert (=> b!825704 (= e!459682 e!459684)))

(declare-fun c!89369 () Bool)

(assert (=> b!825704 (= c!89369 e!459685)))

(declare-fun res!562937 () Bool)

(assert (=> b!825704 (=> (not res!562937) (not e!459685))))

(assert (=> b!825704 (= res!562937 (bvslt #b00000000000000000000000000000000 (size!22541 _keys!976)))))

(assert (= (and d!104805 c!89372) b!825702))

(assert (= (and d!104805 (not c!89372)) b!825699))

(assert (= (and b!825699 c!89370) b!825703))

(assert (= (and b!825699 (not c!89370)) b!825695))

(assert (= (or b!825703 b!825695) bm!35844))

(assert (= (and d!104805 res!562939) b!825694))

(assert (= (and b!825694 res!562938) b!825704))

(assert (= (and b!825704 res!562937) b!825693))

(assert (= (and b!825704 c!89369) b!825698))

(assert (= (and b!825704 (not c!89369)) b!825700))

(assert (= (and b!825698 res!562940) b!825696))

(assert (= (and b!825700 c!89371) b!825701))

(assert (= (and b!825700 (not c!89371)) b!825697))

(declare-fun b_lambda!11097 () Bool)

(assert (=> (not b_lambda!11097) (not b!825696)))

(declare-fun t!22137 () Bool)

(declare-fun tb!4197 () Bool)

(assert (=> (and start!71084 (= defaultEntry!796 defaultEntry!796) t!22137) tb!4197))

(declare-fun result!7947 () Bool)

(assert (=> tb!4197 (= result!7947 tp_is_empty!15001)))

(assert (=> b!825696 t!22137))

(declare-fun b_and!22185 () Bool)

(assert (= b_and!22179 (and (=> t!22137 result!7947) b_and!22185)))

(declare-fun b_lambda!11099 () Bool)

(assert (=> (not b_lambda!11099) (not b!825703)))

(assert (=> b!825703 t!22137))

(declare-fun b_and!22187 () Bool)

(assert (= b_and!22185 (and (=> t!22137 result!7947) b_and!22187)))

(declare-fun m!767639 () Bool)

(assert (=> b!825694 m!767639))

(declare-fun m!767641 () Bool)

(assert (=> b!825701 m!767641))

(declare-fun m!767643 () Bool)

(assert (=> b!825697 m!767643))

(assert (=> bm!35844 m!767641))

(declare-fun m!767645 () Bool)

(assert (=> d!104805 m!767645))

(assert (=> d!104805 m!767491))

(declare-fun m!767647 () Bool)

(assert (=> b!825693 m!767647))

(assert (=> b!825693 m!767647))

(declare-fun m!767649 () Bool)

(assert (=> b!825693 m!767649))

(declare-fun m!767651 () Bool)

(assert (=> b!825703 m!767651))

(assert (=> b!825703 m!767647))

(declare-fun m!767653 () Bool)

(assert (=> b!825703 m!767653))

(assert (=> b!825703 m!767651))

(declare-fun m!767655 () Bool)

(assert (=> b!825703 m!767655))

(declare-fun m!767657 () Bool)

(assert (=> b!825703 m!767657))

(declare-fun m!767659 () Bool)

(assert (=> b!825703 m!767659))

(declare-fun m!767661 () Bool)

(assert (=> b!825703 m!767661))

(declare-fun m!767663 () Bool)

(assert (=> b!825703 m!767663))

(assert (=> b!825703 m!767653))

(assert (=> b!825703 m!767657))

(assert (=> b!825696 m!767651))

(assert (=> b!825696 m!767647))

(assert (=> b!825696 m!767653))

(assert (=> b!825696 m!767651))

(assert (=> b!825696 m!767655))

(assert (=> b!825696 m!767647))

(declare-fun m!767665 () Bool)

(assert (=> b!825696 m!767665))

(assert (=> b!825696 m!767653))

(assert (=> b!825698 m!767647))

(assert (=> b!825698 m!767647))

(declare-fun m!767667 () Bool)

(assert (=> b!825698 m!767667))

(assert (=> b!825699 m!767647))

(assert (=> b!825699 m!767647))

(assert (=> b!825699 m!767649))

(assert (=> b!825585 d!104805))

(declare-fun b!825708 () Bool)

(declare-fun res!562942 () Bool)

(declare-fun e!459689 () Bool)

(assert (=> b!825708 (=> (not res!562942) (not e!459689))))

(declare-fun lt!373106 () ListLongMap!8815)

(assert (=> b!825708 (= res!562942 (not (contains!4158 lt!373106 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!825709 () Bool)

(declare-fun e!459690 () ListLongMap!8815)

(declare-fun call!35848 () ListLongMap!8815)

(assert (=> b!825709 (= e!459690 call!35848)))

(declare-fun b!825710 () Bool)

(assert (=> b!825710 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22541 _keys!976)))))

(assert (=> b!825710 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22542 _values!788)))))

(declare-fun e!459687 () Bool)

(assert (=> b!825710 (= e!459687 (= (apply!362 lt!373106 (select (arr!22120 _keys!976) #b00000000000000000000000000000000)) (get!11745 (select (arr!22121 _values!788) #b00000000000000000000000000000000) (dynLambda!976 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!825711 () Bool)

(declare-fun e!459688 () Bool)

(assert (=> b!825711 (= e!459688 (isEmpty!649 lt!373106))))

(declare-fun b!825712 () Bool)

(declare-fun e!459691 () Bool)

(assert (=> b!825712 (= e!459691 e!459687)))

(assert (=> b!825712 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22541 _keys!976)))))

(declare-fun res!562944 () Bool)

(assert (=> b!825712 (= res!562944 (contains!4158 lt!373106 (select (arr!22120 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!825712 (=> (not res!562944) (not e!459687))))

(declare-fun b!825713 () Bool)

(declare-fun e!459686 () ListLongMap!8815)

(assert (=> b!825713 (= e!459686 e!459690)))

(declare-fun c!89374 () Bool)

(assert (=> b!825713 (= c!89374 (validKeyInArray!0 (select (arr!22120 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!104807 () Bool)

(assert (=> d!104807 e!459689))

(declare-fun res!562943 () Bool)

(assert (=> d!104807 (=> (not res!562943) (not e!459689))))

(assert (=> d!104807 (= res!562943 (not (contains!4158 lt!373106 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104807 (= lt!373106 e!459686)))

(declare-fun c!89376 () Bool)

(assert (=> d!104807 (= c!89376 (bvsge #b00000000000000000000000000000000 (size!22541 _keys!976)))))

(assert (=> d!104807 (validMask!0 mask!1312)))

(assert (=> d!104807 (= (getCurrentListMapNoExtraKeys!2460 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!373106)))

(declare-fun b!825707 () Bool)

(declare-fun e!459692 () Bool)

(assert (=> b!825707 (= e!459692 (validKeyInArray!0 (select (arr!22120 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!825707 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!35845 () Bool)

(assert (=> bm!35845 (= call!35848 (getCurrentListMapNoExtraKeys!2460 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!825714 () Bool)

(assert (=> b!825714 (= e!459691 e!459688)))

(declare-fun c!89375 () Bool)

(assert (=> b!825714 (= c!89375 (bvslt #b00000000000000000000000000000000 (size!22541 _keys!976)))))

(declare-fun b!825715 () Bool)

(assert (=> b!825715 (= e!459688 (= lt!373106 (getCurrentListMapNoExtraKeys!2460 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!825716 () Bool)

(assert (=> b!825716 (= e!459686 (ListLongMap!8816 Nil!15791))))

(declare-fun b!825717 () Bool)

(declare-fun lt!373105 () Unit!28259)

(declare-fun lt!373109 () Unit!28259)

(assert (=> b!825717 (= lt!373105 lt!373109)))

(declare-fun lt!373103 () ListLongMap!8815)

(declare-fun lt!373104 () (_ BitVec 64))

(declare-fun lt!373108 () V!25003)

(declare-fun lt!373107 () (_ BitVec 64))

(assert (=> b!825717 (not (contains!4158 (+!1960 lt!373103 (tuple2!10003 lt!373104 lt!373108)) lt!373107))))

(assert (=> b!825717 (= lt!373109 (addStillNotContains!188 lt!373103 lt!373104 lt!373108 lt!373107))))

(assert (=> b!825717 (= lt!373107 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!825717 (= lt!373108 (get!11745 (select (arr!22121 _values!788) #b00000000000000000000000000000000) (dynLambda!976 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!825717 (= lt!373104 (select (arr!22120 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!825717 (= lt!373103 call!35848)))

(assert (=> b!825717 (= e!459690 (+!1960 call!35848 (tuple2!10003 (select (arr!22120 _keys!976) #b00000000000000000000000000000000) (get!11745 (select (arr!22121 _values!788) #b00000000000000000000000000000000) (dynLambda!976 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!825718 () Bool)

(assert (=> b!825718 (= e!459689 e!459691)))

(declare-fun c!89373 () Bool)

(assert (=> b!825718 (= c!89373 e!459692)))

(declare-fun res!562941 () Bool)

(assert (=> b!825718 (=> (not res!562941) (not e!459692))))

(assert (=> b!825718 (= res!562941 (bvslt #b00000000000000000000000000000000 (size!22541 _keys!976)))))

(assert (= (and d!104807 c!89376) b!825716))

(assert (= (and d!104807 (not c!89376)) b!825713))

(assert (= (and b!825713 c!89374) b!825717))

(assert (= (and b!825713 (not c!89374)) b!825709))

(assert (= (or b!825717 b!825709) bm!35845))

(assert (= (and d!104807 res!562943) b!825708))

(assert (= (and b!825708 res!562942) b!825718))

(assert (= (and b!825718 res!562941) b!825707))

(assert (= (and b!825718 c!89373) b!825712))

(assert (= (and b!825718 (not c!89373)) b!825714))

(assert (= (and b!825712 res!562944) b!825710))

(assert (= (and b!825714 c!89375) b!825715))

(assert (= (and b!825714 (not c!89375)) b!825711))

(declare-fun b_lambda!11101 () Bool)

(assert (=> (not b_lambda!11101) (not b!825710)))

(assert (=> b!825710 t!22137))

(declare-fun b_and!22189 () Bool)

(assert (= b_and!22187 (and (=> t!22137 result!7947) b_and!22189)))

(declare-fun b_lambda!11103 () Bool)

(assert (=> (not b_lambda!11103) (not b!825717)))

(assert (=> b!825717 t!22137))

(declare-fun b_and!22191 () Bool)

(assert (= b_and!22189 (and (=> t!22137 result!7947) b_and!22191)))

(declare-fun m!767669 () Bool)

(assert (=> b!825708 m!767669))

(declare-fun m!767671 () Bool)

(assert (=> b!825715 m!767671))

(declare-fun m!767673 () Bool)

(assert (=> b!825711 m!767673))

(assert (=> bm!35845 m!767671))

(declare-fun m!767675 () Bool)

(assert (=> d!104807 m!767675))

(assert (=> d!104807 m!767491))

(assert (=> b!825707 m!767647))

(assert (=> b!825707 m!767647))

(assert (=> b!825707 m!767649))

(assert (=> b!825717 m!767651))

(assert (=> b!825717 m!767647))

(assert (=> b!825717 m!767653))

(assert (=> b!825717 m!767651))

(assert (=> b!825717 m!767655))

(declare-fun m!767677 () Bool)

(assert (=> b!825717 m!767677))

(declare-fun m!767679 () Bool)

(assert (=> b!825717 m!767679))

(declare-fun m!767681 () Bool)

(assert (=> b!825717 m!767681))

(declare-fun m!767683 () Bool)

(assert (=> b!825717 m!767683))

(assert (=> b!825717 m!767653))

(assert (=> b!825717 m!767677))

(assert (=> b!825710 m!767651))

(assert (=> b!825710 m!767647))

(assert (=> b!825710 m!767653))

(assert (=> b!825710 m!767651))

(assert (=> b!825710 m!767655))

(assert (=> b!825710 m!767647))

(declare-fun m!767685 () Bool)

(assert (=> b!825710 m!767685))

(assert (=> b!825710 m!767653))

(assert (=> b!825712 m!767647))

(assert (=> b!825712 m!767647))

(declare-fun m!767687 () Bool)

(assert (=> b!825712 m!767687))

(assert (=> b!825713 m!767647))

(assert (=> b!825713 m!767647))

(assert (=> b!825713 m!767649))

(assert (=> b!825585 d!104807))

(declare-fun d!104809 () Bool)

(assert (=> d!104809 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!71084 d!104809))

(declare-fun d!104811 () Bool)

(assert (=> d!104811 (= (array_inv!17701 _keys!976) (bvsge (size!22541 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!71084 d!104811))

(declare-fun d!104813 () Bool)

(assert (=> d!104813 (= (array_inv!17702 _values!788) (bvsge (size!22542 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!71084 d!104813))

(declare-fun d!104815 () Bool)

(declare-fun res!562951 () Bool)

(declare-fun e!459704 () Bool)

(assert (=> d!104815 (=> res!562951 e!459704)))

(assert (=> d!104815 (= res!562951 (bvsge #b00000000000000000000000000000000 (size!22541 _keys!976)))))

(assert (=> d!104815 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15792) e!459704)))

(declare-fun b!825729 () Bool)

(declare-fun e!459701 () Bool)

(declare-fun e!459702 () Bool)

(assert (=> b!825729 (= e!459701 e!459702)))

(declare-fun c!89379 () Bool)

(assert (=> b!825729 (= c!89379 (validKeyInArray!0 (select (arr!22120 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!825730 () Bool)

(declare-fun call!35851 () Bool)

(assert (=> b!825730 (= e!459702 call!35851)))

(declare-fun b!825731 () Bool)

(assert (=> b!825731 (= e!459702 call!35851)))

(declare-fun bm!35848 () Bool)

(assert (=> bm!35848 (= call!35851 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89379 (Cons!15791 (select (arr!22120 _keys!976) #b00000000000000000000000000000000) Nil!15792) Nil!15792)))))

(declare-fun b!825732 () Bool)

(declare-fun e!459703 () Bool)

(declare-fun contains!4160 (List!15795 (_ BitVec 64)) Bool)

(assert (=> b!825732 (= e!459703 (contains!4160 Nil!15792 (select (arr!22120 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!825733 () Bool)

(assert (=> b!825733 (= e!459704 e!459701)))

(declare-fun res!562952 () Bool)

(assert (=> b!825733 (=> (not res!562952) (not e!459701))))

(assert (=> b!825733 (= res!562952 (not e!459703))))

(declare-fun res!562953 () Bool)

(assert (=> b!825733 (=> (not res!562953) (not e!459703))))

(assert (=> b!825733 (= res!562953 (validKeyInArray!0 (select (arr!22120 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!104815 (not res!562951)) b!825733))

(assert (= (and b!825733 res!562953) b!825732))

(assert (= (and b!825733 res!562952) b!825729))

(assert (= (and b!825729 c!89379) b!825731))

(assert (= (and b!825729 (not c!89379)) b!825730))

(assert (= (or b!825731 b!825730) bm!35848))

(assert (=> b!825729 m!767647))

(assert (=> b!825729 m!767647))

(assert (=> b!825729 m!767649))

(assert (=> bm!35848 m!767647))

(declare-fun m!767689 () Bool)

(assert (=> bm!35848 m!767689))

(assert (=> b!825732 m!767647))

(assert (=> b!825732 m!767647))

(declare-fun m!767691 () Bool)

(assert (=> b!825732 m!767691))

(assert (=> b!825733 m!767647))

(assert (=> b!825733 m!767647))

(assert (=> b!825733 m!767649))

(assert (=> b!825588 d!104815))

(declare-fun d!104817 () Bool)

(declare-fun e!459705 () Bool)

(assert (=> d!104817 e!459705))

(declare-fun res!562954 () Bool)

(assert (=> d!104817 (=> (not res!562954) (not e!459705))))

(declare-fun lt!373112 () ListLongMap!8815)

(assert (=> d!104817 (= res!562954 (contains!4158 lt!373112 (_1!5012 lt!372972)))))

(declare-fun lt!373111 () List!15794)

(assert (=> d!104817 (= lt!373112 (ListLongMap!8816 lt!373111))))

(declare-fun lt!373113 () Unit!28259)

(declare-fun lt!373110 () Unit!28259)

(assert (=> d!104817 (= lt!373113 lt!373110)))

(assert (=> d!104817 (= (getValueByKey!404 lt!373111 (_1!5012 lt!372972)) (Some!409 (_2!5012 lt!372972)))))

(assert (=> d!104817 (= lt!373110 (lemmaContainsTupThenGetReturnValue!221 lt!373111 (_1!5012 lt!372972) (_2!5012 lt!372972)))))

(assert (=> d!104817 (= lt!373111 (insertStrictlySorted!260 (toList!4423 lt!372984) (_1!5012 lt!372972) (_2!5012 lt!372972)))))

(assert (=> d!104817 (= (+!1960 lt!372984 lt!372972) lt!373112)))

(declare-fun b!825734 () Bool)

(declare-fun res!562955 () Bool)

(assert (=> b!825734 (=> (not res!562955) (not e!459705))))

(assert (=> b!825734 (= res!562955 (= (getValueByKey!404 (toList!4423 lt!373112) (_1!5012 lt!372972)) (Some!409 (_2!5012 lt!372972))))))

(declare-fun b!825735 () Bool)

(assert (=> b!825735 (= e!459705 (contains!4159 (toList!4423 lt!373112) lt!372972))))

(assert (= (and d!104817 res!562954) b!825734))

(assert (= (and b!825734 res!562955) b!825735))

(declare-fun m!767693 () Bool)

(assert (=> d!104817 m!767693))

(declare-fun m!767695 () Bool)

(assert (=> d!104817 m!767695))

(declare-fun m!767697 () Bool)

(assert (=> d!104817 m!767697))

(declare-fun m!767699 () Bool)

(assert (=> d!104817 m!767699))

(declare-fun m!767701 () Bool)

(assert (=> b!825734 m!767701))

(declare-fun m!767703 () Bool)

(assert (=> b!825735 m!767703))

(assert (=> b!825584 d!104817))

(declare-fun d!104819 () Bool)

(declare-fun e!459706 () Bool)

(assert (=> d!104819 e!459706))

(declare-fun res!562956 () Bool)

(assert (=> d!104819 (=> (not res!562956) (not e!459706))))

(declare-fun lt!373116 () ListLongMap!8815)

(assert (=> d!104819 (= res!562956 (contains!4158 lt!373116 (_1!5012 lt!372972)))))

(declare-fun lt!373115 () List!15794)

(assert (=> d!104819 (= lt!373116 (ListLongMap!8816 lt!373115))))

(declare-fun lt!373117 () Unit!28259)

(declare-fun lt!373114 () Unit!28259)

(assert (=> d!104819 (= lt!373117 lt!373114)))

(assert (=> d!104819 (= (getValueByKey!404 lt!373115 (_1!5012 lt!372972)) (Some!409 (_2!5012 lt!372972)))))

(assert (=> d!104819 (= lt!373114 (lemmaContainsTupThenGetReturnValue!221 lt!373115 (_1!5012 lt!372972) (_2!5012 lt!372972)))))

(assert (=> d!104819 (= lt!373115 (insertStrictlySorted!260 (toList!4423 lt!372979) (_1!5012 lt!372972) (_2!5012 lt!372972)))))

(assert (=> d!104819 (= (+!1960 lt!372979 lt!372972) lt!373116)))

(declare-fun b!825736 () Bool)

(declare-fun res!562957 () Bool)

(assert (=> b!825736 (=> (not res!562957) (not e!459706))))

(assert (=> b!825736 (= res!562957 (= (getValueByKey!404 (toList!4423 lt!373116) (_1!5012 lt!372972)) (Some!409 (_2!5012 lt!372972))))))

(declare-fun b!825737 () Bool)

(assert (=> b!825737 (= e!459706 (contains!4159 (toList!4423 lt!373116) lt!372972))))

(assert (= (and d!104819 res!562956) b!825736))

(assert (= (and b!825736 res!562957) b!825737))

(declare-fun m!767705 () Bool)

(assert (=> d!104819 m!767705))

(declare-fun m!767707 () Bool)

(assert (=> d!104819 m!767707))

(declare-fun m!767709 () Bool)

(assert (=> d!104819 m!767709))

(declare-fun m!767711 () Bool)

(assert (=> d!104819 m!767711))

(declare-fun m!767713 () Bool)

(assert (=> b!825736 m!767713))

(declare-fun m!767715 () Bool)

(assert (=> b!825737 m!767715))

(assert (=> b!825584 d!104819))

(declare-fun d!104821 () Bool)

(declare-fun e!459707 () Bool)

(assert (=> d!104821 e!459707))

(declare-fun res!562958 () Bool)

(assert (=> d!104821 (=> (not res!562958) (not e!459707))))

(declare-fun lt!373120 () ListLongMap!8815)

(assert (=> d!104821 (= res!562958 (contains!4158 lt!373120 (_1!5012 lt!372983)))))

(declare-fun lt!373119 () List!15794)

(assert (=> d!104821 (= lt!373120 (ListLongMap!8816 lt!373119))))

(declare-fun lt!373121 () Unit!28259)

(declare-fun lt!373118 () Unit!28259)

(assert (=> d!104821 (= lt!373121 lt!373118)))

(assert (=> d!104821 (= (getValueByKey!404 lt!373119 (_1!5012 lt!372983)) (Some!409 (_2!5012 lt!372983)))))

(assert (=> d!104821 (= lt!373118 (lemmaContainsTupThenGetReturnValue!221 lt!373119 (_1!5012 lt!372983) (_2!5012 lt!372983)))))

(assert (=> d!104821 (= lt!373119 (insertStrictlySorted!260 (toList!4423 (+!1960 lt!372984 lt!372972)) (_1!5012 lt!372983) (_2!5012 lt!372983)))))

(assert (=> d!104821 (= (+!1960 (+!1960 lt!372984 lt!372972) lt!372983) lt!373120)))

(declare-fun b!825738 () Bool)

(declare-fun res!562959 () Bool)

(assert (=> b!825738 (=> (not res!562959) (not e!459707))))

(assert (=> b!825738 (= res!562959 (= (getValueByKey!404 (toList!4423 lt!373120) (_1!5012 lt!372983)) (Some!409 (_2!5012 lt!372983))))))

(declare-fun b!825739 () Bool)

(assert (=> b!825739 (= e!459707 (contains!4159 (toList!4423 lt!373120) lt!372983))))

(assert (= (and d!104821 res!562958) b!825738))

(assert (= (and b!825738 res!562959) b!825739))

(declare-fun m!767717 () Bool)

(assert (=> d!104821 m!767717))

(declare-fun m!767719 () Bool)

(assert (=> d!104821 m!767719))

(declare-fun m!767721 () Bool)

(assert (=> d!104821 m!767721))

(declare-fun m!767723 () Bool)

(assert (=> d!104821 m!767723))

(declare-fun m!767725 () Bool)

(assert (=> b!825738 m!767725))

(declare-fun m!767727 () Bool)

(assert (=> b!825739 m!767727))

(assert (=> b!825584 d!104821))

(declare-fun d!104823 () Bool)

(declare-fun e!459708 () Bool)

(assert (=> d!104823 e!459708))

(declare-fun res!562960 () Bool)

(assert (=> d!104823 (=> (not res!562960) (not e!459708))))

(declare-fun lt!373124 () ListLongMap!8815)

(assert (=> d!104823 (= res!562960 (contains!4158 lt!373124 (_1!5012 lt!372972)))))

(declare-fun lt!373123 () List!15794)

(assert (=> d!104823 (= lt!373124 (ListLongMap!8816 lt!373123))))

(declare-fun lt!373125 () Unit!28259)

(declare-fun lt!373122 () Unit!28259)

(assert (=> d!104823 (= lt!373125 lt!373122)))

(assert (=> d!104823 (= (getValueByKey!404 lt!373123 (_1!5012 lt!372972)) (Some!409 (_2!5012 lt!372972)))))

(assert (=> d!104823 (= lt!373122 (lemmaContainsTupThenGetReturnValue!221 lt!373123 (_1!5012 lt!372972) (_2!5012 lt!372972)))))

(assert (=> d!104823 (= lt!373123 (insertStrictlySorted!260 (toList!4423 lt!372980) (_1!5012 lt!372972) (_2!5012 lt!372972)))))

(assert (=> d!104823 (= (+!1960 lt!372980 lt!372972) lt!373124)))

(declare-fun b!825740 () Bool)

(declare-fun res!562961 () Bool)

(assert (=> b!825740 (=> (not res!562961) (not e!459708))))

(assert (=> b!825740 (= res!562961 (= (getValueByKey!404 (toList!4423 lt!373124) (_1!5012 lt!372972)) (Some!409 (_2!5012 lt!372972))))))

(declare-fun b!825741 () Bool)

(assert (=> b!825741 (= e!459708 (contains!4159 (toList!4423 lt!373124) lt!372972))))

(assert (= (and d!104823 res!562960) b!825740))

(assert (= (and b!825740 res!562961) b!825741))

(declare-fun m!767729 () Bool)

(assert (=> d!104823 m!767729))

(declare-fun m!767731 () Bool)

(assert (=> d!104823 m!767731))

(declare-fun m!767733 () Bool)

(assert (=> d!104823 m!767733))

(declare-fun m!767735 () Bool)

(assert (=> d!104823 m!767735))

(declare-fun m!767737 () Bool)

(assert (=> b!825740 m!767737))

(declare-fun m!767739 () Bool)

(assert (=> b!825741 m!767739))

(assert (=> b!825584 d!104823))

(declare-fun b!825784 () Bool)

(declare-fun e!459745 () Bool)

(declare-fun lt!373171 () ListLongMap!8815)

(assert (=> b!825784 (= e!459745 (= (apply!362 lt!373171 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!825785 () Bool)

(declare-fun e!459739 () Bool)

(declare-fun e!459741 () Bool)

(assert (=> b!825785 (= e!459739 e!459741)))

(declare-fun res!562987 () Bool)

(declare-fun call!35866 () Bool)

(assert (=> b!825785 (= res!562987 call!35866)))

(assert (=> b!825785 (=> (not res!562987) (not e!459741))))

(declare-fun call!35869 () ListLongMap!8815)

(declare-fun call!35872 () ListLongMap!8815)

(declare-fun c!89394 () Bool)

(declare-fun call!35868 () ListLongMap!8815)

(declare-fun c!89396 () Bool)

(declare-fun bm!35863 () Bool)

(declare-fun call!35870 () ListLongMap!8815)

(assert (=> bm!35863 (= call!35869 (+!1960 (ite c!89396 call!35868 (ite c!89394 call!35872 call!35870)) (ite (or c!89396 c!89394) (tuple2!10003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun bm!35864 () Bool)

(assert (=> bm!35864 (= call!35868 (getCurrentListMapNoExtraKeys!2460 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825786 () Bool)

(assert (=> b!825786 (= e!459741 (= (apply!362 lt!373171 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun b!825787 () Bool)

(declare-fun res!562988 () Bool)

(declare-fun e!459735 () Bool)

(assert (=> b!825787 (=> (not res!562988) (not e!459735))))

(declare-fun e!459743 () Bool)

(assert (=> b!825787 (= res!562988 e!459743)))

(declare-fun res!562985 () Bool)

(assert (=> b!825787 (=> res!562985 e!459743)))

(declare-fun e!459746 () Bool)

(assert (=> b!825787 (= res!562985 (not e!459746))))

(declare-fun res!562983 () Bool)

(assert (=> b!825787 (=> (not res!562983) (not e!459746))))

(assert (=> b!825787 (= res!562983 (bvslt #b00000000000000000000000000000000 (size!22541 _keys!976)))))

(declare-fun b!825788 () Bool)

(declare-fun c!89393 () Bool)

(assert (=> b!825788 (= c!89393 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!459740 () ListLongMap!8815)

(declare-fun e!459738 () ListLongMap!8815)

(assert (=> b!825788 (= e!459740 e!459738)))

(declare-fun b!825789 () Bool)

(declare-fun e!459742 () Bool)

(assert (=> b!825789 (= e!459742 (validKeyInArray!0 (select (arr!22120 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!825790 () Bool)

(declare-fun res!562986 () Bool)

(assert (=> b!825790 (=> (not res!562986) (not e!459735))))

(assert (=> b!825790 (= res!562986 e!459739)))

(declare-fun c!89392 () Bool)

(assert (=> b!825790 (= c!89392 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!825791 () Bool)

(declare-fun e!459736 () Bool)

(assert (=> b!825791 (= e!459735 e!459736)))

(declare-fun c!89395 () Bool)

(assert (=> b!825791 (= c!89395 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!104825 () Bool)

(assert (=> d!104825 e!459735))

(declare-fun res!562984 () Bool)

(assert (=> d!104825 (=> (not res!562984) (not e!459735))))

(assert (=> d!104825 (= res!562984 (or (bvsge #b00000000000000000000000000000000 (size!22541 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22541 _keys!976)))))))

(declare-fun lt!373188 () ListLongMap!8815)

(assert (=> d!104825 (= lt!373171 lt!373188)))

(declare-fun lt!373170 () Unit!28259)

(declare-fun e!459744 () Unit!28259)

(assert (=> d!104825 (= lt!373170 e!459744)))

(declare-fun c!89397 () Bool)

(assert (=> d!104825 (= c!89397 e!459742)))

(declare-fun res!562981 () Bool)

(assert (=> d!104825 (=> (not res!562981) (not e!459742))))

(assert (=> d!104825 (= res!562981 (bvslt #b00000000000000000000000000000000 (size!22541 _keys!976)))))

(declare-fun e!459747 () ListLongMap!8815)

(assert (=> d!104825 (= lt!373188 e!459747)))

(assert (=> d!104825 (= c!89396 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!104825 (validMask!0 mask!1312)))

(assert (=> d!104825 (= (getCurrentListMap!2510 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!373171)))

(declare-fun b!825792 () Bool)

(assert (=> b!825792 (= e!459747 (+!1960 call!35869 (tuple2!10003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!825793 () Bool)

(declare-fun call!35867 () Bool)

(assert (=> b!825793 (= e!459736 (not call!35867))))

(declare-fun b!825794 () Bool)

(declare-fun Unit!28265 () Unit!28259)

(assert (=> b!825794 (= e!459744 Unit!28265)))

(declare-fun e!459737 () Bool)

(declare-fun b!825795 () Bool)

(assert (=> b!825795 (= e!459737 (= (apply!362 lt!373171 (select (arr!22120 _keys!976) #b00000000000000000000000000000000)) (get!11745 (select (arr!22121 _values!788) #b00000000000000000000000000000000) (dynLambda!976 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!825795 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22542 _values!788)))))

(assert (=> b!825795 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22541 _keys!976)))))

(declare-fun b!825796 () Bool)

(assert (=> b!825796 (= e!459743 e!459737)))

(declare-fun res!562980 () Bool)

(assert (=> b!825796 (=> (not res!562980) (not e!459737))))

(assert (=> b!825796 (= res!562980 (contains!4158 lt!373171 (select (arr!22120 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!825796 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22541 _keys!976)))))

(declare-fun b!825797 () Bool)

(assert (=> b!825797 (= e!459739 (not call!35866))))

(declare-fun bm!35865 () Bool)

(assert (=> bm!35865 (= call!35867 (contains!4158 lt!373171 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!35866 () Bool)

(assert (=> bm!35866 (= call!35872 call!35868)))

(declare-fun b!825798 () Bool)

(assert (=> b!825798 (= e!459736 e!459745)))

(declare-fun res!562982 () Bool)

(assert (=> b!825798 (= res!562982 call!35867)))

(assert (=> b!825798 (=> (not res!562982) (not e!459745))))

(declare-fun bm!35867 () Bool)

(assert (=> bm!35867 (= call!35870 call!35872)))

(declare-fun bm!35868 () Bool)

(assert (=> bm!35868 (= call!35866 (contains!4158 lt!373171 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!825799 () Bool)

(declare-fun lt!373172 () Unit!28259)

(assert (=> b!825799 (= e!459744 lt!373172)))

(declare-fun lt!373182 () ListLongMap!8815)

(assert (=> b!825799 (= lt!373182 (getCurrentListMapNoExtraKeys!2460 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!373184 () (_ BitVec 64))

(assert (=> b!825799 (= lt!373184 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!373175 () (_ BitVec 64))

(assert (=> b!825799 (= lt!373175 (select (arr!22120 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!373189 () Unit!28259)

(declare-fun addStillContains!314 (ListLongMap!8815 (_ BitVec 64) V!25003 (_ BitVec 64)) Unit!28259)

(assert (=> b!825799 (= lt!373189 (addStillContains!314 lt!373182 lt!373184 zeroValueBefore!34 lt!373175))))

(assert (=> b!825799 (contains!4158 (+!1960 lt!373182 (tuple2!10003 lt!373184 zeroValueBefore!34)) lt!373175)))

(declare-fun lt!373191 () Unit!28259)

(assert (=> b!825799 (= lt!373191 lt!373189)))

(declare-fun lt!373183 () ListLongMap!8815)

(assert (=> b!825799 (= lt!373183 (getCurrentListMapNoExtraKeys!2460 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!373178 () (_ BitVec 64))

(assert (=> b!825799 (= lt!373178 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!373174 () (_ BitVec 64))

(assert (=> b!825799 (= lt!373174 (select (arr!22120 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!373177 () Unit!28259)

(declare-fun addApplyDifferent!314 (ListLongMap!8815 (_ BitVec 64) V!25003 (_ BitVec 64)) Unit!28259)

(assert (=> b!825799 (= lt!373177 (addApplyDifferent!314 lt!373183 lt!373178 minValue!754 lt!373174))))

(assert (=> b!825799 (= (apply!362 (+!1960 lt!373183 (tuple2!10003 lt!373178 minValue!754)) lt!373174) (apply!362 lt!373183 lt!373174))))

(declare-fun lt!373186 () Unit!28259)

(assert (=> b!825799 (= lt!373186 lt!373177)))

(declare-fun lt!373185 () ListLongMap!8815)

(assert (=> b!825799 (= lt!373185 (getCurrentListMapNoExtraKeys!2460 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!373190 () (_ BitVec 64))

(assert (=> b!825799 (= lt!373190 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!373187 () (_ BitVec 64))

(assert (=> b!825799 (= lt!373187 (select (arr!22120 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!373173 () Unit!28259)

(assert (=> b!825799 (= lt!373173 (addApplyDifferent!314 lt!373185 lt!373190 zeroValueBefore!34 lt!373187))))

(assert (=> b!825799 (= (apply!362 (+!1960 lt!373185 (tuple2!10003 lt!373190 zeroValueBefore!34)) lt!373187) (apply!362 lt!373185 lt!373187))))

(declare-fun lt!373179 () Unit!28259)

(assert (=> b!825799 (= lt!373179 lt!373173)))

(declare-fun lt!373176 () ListLongMap!8815)

(assert (=> b!825799 (= lt!373176 (getCurrentListMapNoExtraKeys!2460 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!373180 () (_ BitVec 64))

(assert (=> b!825799 (= lt!373180 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!373181 () (_ BitVec 64))

(assert (=> b!825799 (= lt!373181 (select (arr!22120 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!825799 (= lt!373172 (addApplyDifferent!314 lt!373176 lt!373180 minValue!754 lt!373181))))

(assert (=> b!825799 (= (apply!362 (+!1960 lt!373176 (tuple2!10003 lt!373180 minValue!754)) lt!373181) (apply!362 lt!373176 lt!373181))))

(declare-fun b!825800 () Bool)

(assert (=> b!825800 (= e!459738 call!35870)))

(declare-fun b!825801 () Bool)

(declare-fun call!35871 () ListLongMap!8815)

(assert (=> b!825801 (= e!459740 call!35871)))

(declare-fun bm!35869 () Bool)

(assert (=> bm!35869 (= call!35871 call!35869)))

(declare-fun b!825802 () Bool)

(assert (=> b!825802 (= e!459746 (validKeyInArray!0 (select (arr!22120 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!825803 () Bool)

(assert (=> b!825803 (= e!459738 call!35871)))

(declare-fun b!825804 () Bool)

(assert (=> b!825804 (= e!459747 e!459740)))

(assert (=> b!825804 (= c!89394 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!104825 c!89396) b!825792))

(assert (= (and d!104825 (not c!89396)) b!825804))

(assert (= (and b!825804 c!89394) b!825801))

(assert (= (and b!825804 (not c!89394)) b!825788))

(assert (= (and b!825788 c!89393) b!825803))

(assert (= (and b!825788 (not c!89393)) b!825800))

(assert (= (or b!825803 b!825800) bm!35867))

(assert (= (or b!825801 bm!35867) bm!35866))

(assert (= (or b!825801 b!825803) bm!35869))

(assert (= (or b!825792 bm!35866) bm!35864))

(assert (= (or b!825792 bm!35869) bm!35863))

(assert (= (and d!104825 res!562981) b!825789))

(assert (= (and d!104825 c!89397) b!825799))

(assert (= (and d!104825 (not c!89397)) b!825794))

(assert (= (and d!104825 res!562984) b!825787))

(assert (= (and b!825787 res!562983) b!825802))

(assert (= (and b!825787 (not res!562985)) b!825796))

(assert (= (and b!825796 res!562980) b!825795))

(assert (= (and b!825787 res!562988) b!825790))

(assert (= (and b!825790 c!89392) b!825785))

(assert (= (and b!825790 (not c!89392)) b!825797))

(assert (= (and b!825785 res!562987) b!825786))

(assert (= (or b!825785 b!825797) bm!35868))

(assert (= (and b!825790 res!562986) b!825791))

(assert (= (and b!825791 c!89395) b!825798))

(assert (= (and b!825791 (not c!89395)) b!825793))

(assert (= (and b!825798 res!562982) b!825784))

(assert (= (or b!825798 b!825793) bm!35865))

(declare-fun b_lambda!11105 () Bool)

(assert (=> (not b_lambda!11105) (not b!825795)))

(assert (=> b!825795 t!22137))

(declare-fun b_and!22193 () Bool)

(assert (= b_and!22191 (and (=> t!22137 result!7947) b_and!22193)))

(assert (=> d!104825 m!767491))

(declare-fun m!767741 () Bool)

(assert (=> b!825784 m!767741))

(declare-fun m!767743 () Bool)

(assert (=> b!825786 m!767743))

(assert (=> b!825795 m!767647))

(declare-fun m!767745 () Bool)

(assert (=> b!825795 m!767745))

(assert (=> b!825795 m!767651))

(assert (=> b!825795 m!767653))

(assert (=> b!825795 m!767653))

(assert (=> b!825795 m!767651))

(assert (=> b!825795 m!767655))

(assert (=> b!825795 m!767647))

(assert (=> b!825802 m!767647))

(assert (=> b!825802 m!767647))

(assert (=> b!825802 m!767649))

(declare-fun m!767747 () Bool)

(assert (=> bm!35863 m!767747))

(assert (=> b!825796 m!767647))

(assert (=> b!825796 m!767647))

(declare-fun m!767749 () Bool)

(assert (=> b!825796 m!767749))

(declare-fun m!767751 () Bool)

(assert (=> bm!35865 m!767751))

(declare-fun m!767753 () Bool)

(assert (=> b!825799 m!767753))

(declare-fun m!767755 () Bool)

(assert (=> b!825799 m!767755))

(declare-fun m!767757 () Bool)

(assert (=> b!825799 m!767757))

(declare-fun m!767759 () Bool)

(assert (=> b!825799 m!767759))

(declare-fun m!767761 () Bool)

(assert (=> b!825799 m!767761))

(declare-fun m!767763 () Bool)

(assert (=> b!825799 m!767763))

(declare-fun m!767765 () Bool)

(assert (=> b!825799 m!767765))

(assert (=> b!825799 m!767501))

(declare-fun m!767767 () Bool)

(assert (=> b!825799 m!767767))

(assert (=> b!825799 m!767761))

(declare-fun m!767769 () Bool)

(assert (=> b!825799 m!767769))

(declare-fun m!767771 () Bool)

(assert (=> b!825799 m!767771))

(declare-fun m!767773 () Bool)

(assert (=> b!825799 m!767773))

(assert (=> b!825799 m!767647))

(declare-fun m!767775 () Bool)

(assert (=> b!825799 m!767775))

(declare-fun m!767777 () Bool)

(assert (=> b!825799 m!767777))

(assert (=> b!825799 m!767775))

(assert (=> b!825799 m!767757))

(declare-fun m!767779 () Bool)

(assert (=> b!825799 m!767779))

(declare-fun m!767781 () Bool)

(assert (=> b!825799 m!767781))

(assert (=> b!825799 m!767779))

(declare-fun m!767783 () Bool)

(assert (=> b!825792 m!767783))

(assert (=> b!825789 m!767647))

(assert (=> b!825789 m!767647))

(assert (=> b!825789 m!767649))

(declare-fun m!767785 () Bool)

(assert (=> bm!35868 m!767785))

(assert (=> bm!35864 m!767501))

(assert (=> b!825584 d!104825))

(declare-fun d!104827 () Bool)

(assert (=> d!104827 (= (+!1960 lt!372979 (tuple2!10003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (+!1960 (+!1960 lt!372979 (tuple2!10003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) (tuple2!10003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun lt!373194 () Unit!28259)

(declare-fun choose!1415 (ListLongMap!8815 (_ BitVec 64) V!25003 V!25003) Unit!28259)

(assert (=> d!104827 (= lt!373194 (choose!1415 lt!372979 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> d!104827 (= (addSameAsAddTwiceSameKeyDiffValues!227 lt!372979 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34) lt!373194)))

(declare-fun bs!23040 () Bool)

(assert (= bs!23040 d!104827))

(declare-fun m!767787 () Bool)

(assert (=> bs!23040 m!767787))

(declare-fun m!767789 () Bool)

(assert (=> bs!23040 m!767789))

(assert (=> bs!23040 m!767789))

(declare-fun m!767791 () Bool)

(assert (=> bs!23040 m!767791))

(declare-fun m!767793 () Bool)

(assert (=> bs!23040 m!767793))

(assert (=> b!825584 d!104827))

(declare-fun d!104829 () Bool)

(declare-fun e!459748 () Bool)

(assert (=> d!104829 e!459748))

(declare-fun res!562989 () Bool)

(assert (=> d!104829 (=> (not res!562989) (not e!459748))))

(declare-fun lt!373197 () ListLongMap!8815)

(assert (=> d!104829 (= res!562989 (contains!4158 lt!373197 (_1!5012 lt!372983)))))

(declare-fun lt!373196 () List!15794)

(assert (=> d!104829 (= lt!373197 (ListLongMap!8816 lt!373196))))

(declare-fun lt!373198 () Unit!28259)

(declare-fun lt!373195 () Unit!28259)

(assert (=> d!104829 (= lt!373198 lt!373195)))

(assert (=> d!104829 (= (getValueByKey!404 lt!373196 (_1!5012 lt!372983)) (Some!409 (_2!5012 lt!372983)))))

(assert (=> d!104829 (= lt!373195 (lemmaContainsTupThenGetReturnValue!221 lt!373196 (_1!5012 lt!372983) (_2!5012 lt!372983)))))

(assert (=> d!104829 (= lt!373196 (insertStrictlySorted!260 (toList!4423 (+!1960 lt!372984 lt!372978)) (_1!5012 lt!372983) (_2!5012 lt!372983)))))

(assert (=> d!104829 (= (+!1960 (+!1960 lt!372984 lt!372978) lt!372983) lt!373197)))

(declare-fun b!825805 () Bool)

(declare-fun res!562990 () Bool)

(assert (=> b!825805 (=> (not res!562990) (not e!459748))))

(assert (=> b!825805 (= res!562990 (= (getValueByKey!404 (toList!4423 lt!373197) (_1!5012 lt!372983)) (Some!409 (_2!5012 lt!372983))))))

(declare-fun b!825806 () Bool)

(assert (=> b!825806 (= e!459748 (contains!4159 (toList!4423 lt!373197) lt!372983))))

(assert (= (and d!104829 res!562989) b!825805))

(assert (= (and b!825805 res!562990) b!825806))

(declare-fun m!767795 () Bool)

(assert (=> d!104829 m!767795))

(declare-fun m!767797 () Bool)

(assert (=> d!104829 m!767797))

(declare-fun m!767799 () Bool)

(assert (=> d!104829 m!767799))

(declare-fun m!767801 () Bool)

(assert (=> d!104829 m!767801))

(declare-fun m!767803 () Bool)

(assert (=> b!825805 m!767803))

(declare-fun m!767805 () Bool)

(assert (=> b!825806 m!767805))

(assert (=> b!825584 d!104829))

(declare-fun d!104831 () Bool)

(declare-fun e!459749 () Bool)

(assert (=> d!104831 e!459749))

(declare-fun res!562991 () Bool)

(assert (=> d!104831 (=> (not res!562991) (not e!459749))))

(declare-fun lt!373201 () ListLongMap!8815)

(assert (=> d!104831 (= res!562991 (contains!4158 lt!373201 (_1!5012 lt!372983)))))

(declare-fun lt!373200 () List!15794)

(assert (=> d!104831 (= lt!373201 (ListLongMap!8816 lt!373200))))

(declare-fun lt!373202 () Unit!28259)

(declare-fun lt!373199 () Unit!28259)

(assert (=> d!104831 (= lt!373202 lt!373199)))

(assert (=> d!104831 (= (getValueByKey!404 lt!373200 (_1!5012 lt!372983)) (Some!409 (_2!5012 lt!372983)))))

(assert (=> d!104831 (= lt!373199 (lemmaContainsTupThenGetReturnValue!221 lt!373200 (_1!5012 lt!372983) (_2!5012 lt!372983)))))

(assert (=> d!104831 (= lt!373200 (insertStrictlySorted!260 (toList!4423 lt!372984) (_1!5012 lt!372983) (_2!5012 lt!372983)))))

(assert (=> d!104831 (= (+!1960 lt!372984 lt!372983) lt!373201)))

(declare-fun b!825807 () Bool)

(declare-fun res!562992 () Bool)

(assert (=> b!825807 (=> (not res!562992) (not e!459749))))

(assert (=> b!825807 (= res!562992 (= (getValueByKey!404 (toList!4423 lt!373201) (_1!5012 lt!372983)) (Some!409 (_2!5012 lt!372983))))))

(declare-fun b!825808 () Bool)

(assert (=> b!825808 (= e!459749 (contains!4159 (toList!4423 lt!373201) lt!372983))))

(assert (= (and d!104831 res!562991) b!825807))

(assert (= (and b!825807 res!562992) b!825808))

(declare-fun m!767807 () Bool)

(assert (=> d!104831 m!767807))

(declare-fun m!767809 () Bool)

(assert (=> d!104831 m!767809))

(declare-fun m!767811 () Bool)

(assert (=> d!104831 m!767811))

(declare-fun m!767813 () Bool)

(assert (=> d!104831 m!767813))

(declare-fun m!767815 () Bool)

(assert (=> b!825807 m!767815))

(declare-fun m!767817 () Bool)

(assert (=> b!825808 m!767817))

(assert (=> b!825584 d!104831))

(declare-fun b!825809 () Bool)

(declare-fun e!459760 () Bool)

(declare-fun lt!373204 () ListLongMap!8815)

(assert (=> b!825809 (= e!459760 (= (apply!362 lt!373204 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!825810 () Bool)

(declare-fun e!459754 () Bool)

(declare-fun e!459756 () Bool)

(assert (=> b!825810 (= e!459754 e!459756)))

(declare-fun res!563000 () Bool)

(declare-fun call!35873 () Bool)

(assert (=> b!825810 (= res!563000 call!35873)))

(assert (=> b!825810 (=> (not res!563000) (not e!459756))))

(declare-fun c!89400 () Bool)

(declare-fun call!35877 () ListLongMap!8815)

(declare-fun call!35875 () ListLongMap!8815)

(declare-fun call!35879 () ListLongMap!8815)

(declare-fun c!89402 () Bool)

(declare-fun call!35876 () ListLongMap!8815)

(declare-fun bm!35870 () Bool)

(assert (=> bm!35870 (= call!35876 (+!1960 (ite c!89402 call!35875 (ite c!89400 call!35879 call!35877)) (ite (or c!89402 c!89400) (tuple2!10003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun bm!35871 () Bool)

(assert (=> bm!35871 (= call!35875 (getCurrentListMapNoExtraKeys!2460 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825811 () Bool)

(assert (=> b!825811 (= e!459756 (= (apply!362 lt!373204 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(declare-fun b!825812 () Bool)

(declare-fun res!563001 () Bool)

(declare-fun e!459750 () Bool)

(assert (=> b!825812 (=> (not res!563001) (not e!459750))))

(declare-fun e!459758 () Bool)

(assert (=> b!825812 (= res!563001 e!459758)))

(declare-fun res!562998 () Bool)

(assert (=> b!825812 (=> res!562998 e!459758)))

(declare-fun e!459761 () Bool)

(assert (=> b!825812 (= res!562998 (not e!459761))))

(declare-fun res!562996 () Bool)

(assert (=> b!825812 (=> (not res!562996) (not e!459761))))

(assert (=> b!825812 (= res!562996 (bvslt #b00000000000000000000000000000000 (size!22541 _keys!976)))))

(declare-fun b!825813 () Bool)

(declare-fun c!89399 () Bool)

(assert (=> b!825813 (= c!89399 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!459755 () ListLongMap!8815)

(declare-fun e!459753 () ListLongMap!8815)

(assert (=> b!825813 (= e!459755 e!459753)))

(declare-fun b!825814 () Bool)

(declare-fun e!459757 () Bool)

(assert (=> b!825814 (= e!459757 (validKeyInArray!0 (select (arr!22120 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!825815 () Bool)

(declare-fun res!562999 () Bool)

(assert (=> b!825815 (=> (not res!562999) (not e!459750))))

(assert (=> b!825815 (= res!562999 e!459754)))

(declare-fun c!89398 () Bool)

(assert (=> b!825815 (= c!89398 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!825816 () Bool)

(declare-fun e!459751 () Bool)

(assert (=> b!825816 (= e!459750 e!459751)))

(declare-fun c!89401 () Bool)

(assert (=> b!825816 (= c!89401 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!104833 () Bool)

(assert (=> d!104833 e!459750))

(declare-fun res!562997 () Bool)

(assert (=> d!104833 (=> (not res!562997) (not e!459750))))

(assert (=> d!104833 (= res!562997 (or (bvsge #b00000000000000000000000000000000 (size!22541 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22541 _keys!976)))))))

(declare-fun lt!373221 () ListLongMap!8815)

(assert (=> d!104833 (= lt!373204 lt!373221)))

(declare-fun lt!373203 () Unit!28259)

(declare-fun e!459759 () Unit!28259)

(assert (=> d!104833 (= lt!373203 e!459759)))

(declare-fun c!89403 () Bool)

(assert (=> d!104833 (= c!89403 e!459757)))

(declare-fun res!562994 () Bool)

(assert (=> d!104833 (=> (not res!562994) (not e!459757))))

(assert (=> d!104833 (= res!562994 (bvslt #b00000000000000000000000000000000 (size!22541 _keys!976)))))

(declare-fun e!459762 () ListLongMap!8815)

(assert (=> d!104833 (= lt!373221 e!459762)))

(assert (=> d!104833 (= c!89402 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!104833 (validMask!0 mask!1312)))

(assert (=> d!104833 (= (getCurrentListMap!2510 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!373204)))

(declare-fun b!825817 () Bool)

(assert (=> b!825817 (= e!459762 (+!1960 call!35876 (tuple2!10003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!825818 () Bool)

(declare-fun call!35874 () Bool)

(assert (=> b!825818 (= e!459751 (not call!35874))))

(declare-fun b!825819 () Bool)

(declare-fun Unit!28266 () Unit!28259)

(assert (=> b!825819 (= e!459759 Unit!28266)))

(declare-fun e!459752 () Bool)

(declare-fun b!825820 () Bool)

(assert (=> b!825820 (= e!459752 (= (apply!362 lt!373204 (select (arr!22120 _keys!976) #b00000000000000000000000000000000)) (get!11745 (select (arr!22121 _values!788) #b00000000000000000000000000000000) (dynLambda!976 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!825820 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22542 _values!788)))))

(assert (=> b!825820 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22541 _keys!976)))))

(declare-fun b!825821 () Bool)

(assert (=> b!825821 (= e!459758 e!459752)))

(declare-fun res!562993 () Bool)

(assert (=> b!825821 (=> (not res!562993) (not e!459752))))

(assert (=> b!825821 (= res!562993 (contains!4158 lt!373204 (select (arr!22120 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!825821 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22541 _keys!976)))))

(declare-fun b!825822 () Bool)

(assert (=> b!825822 (= e!459754 (not call!35873))))

(declare-fun bm!35872 () Bool)

(assert (=> bm!35872 (= call!35874 (contains!4158 lt!373204 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!35873 () Bool)

(assert (=> bm!35873 (= call!35879 call!35875)))

(declare-fun b!825823 () Bool)

(assert (=> b!825823 (= e!459751 e!459760)))

(declare-fun res!562995 () Bool)

(assert (=> b!825823 (= res!562995 call!35874)))

(assert (=> b!825823 (=> (not res!562995) (not e!459760))))

(declare-fun bm!35874 () Bool)

(assert (=> bm!35874 (= call!35877 call!35879)))

(declare-fun bm!35875 () Bool)

(assert (=> bm!35875 (= call!35873 (contains!4158 lt!373204 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!825824 () Bool)

(declare-fun lt!373205 () Unit!28259)

(assert (=> b!825824 (= e!459759 lt!373205)))

(declare-fun lt!373215 () ListLongMap!8815)

(assert (=> b!825824 (= lt!373215 (getCurrentListMapNoExtraKeys!2460 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!373217 () (_ BitVec 64))

(assert (=> b!825824 (= lt!373217 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!373208 () (_ BitVec 64))

(assert (=> b!825824 (= lt!373208 (select (arr!22120 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!373222 () Unit!28259)

(assert (=> b!825824 (= lt!373222 (addStillContains!314 lt!373215 lt!373217 zeroValueAfter!34 lt!373208))))

(assert (=> b!825824 (contains!4158 (+!1960 lt!373215 (tuple2!10003 lt!373217 zeroValueAfter!34)) lt!373208)))

(declare-fun lt!373224 () Unit!28259)

(assert (=> b!825824 (= lt!373224 lt!373222)))

(declare-fun lt!373216 () ListLongMap!8815)

(assert (=> b!825824 (= lt!373216 (getCurrentListMapNoExtraKeys!2460 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!373211 () (_ BitVec 64))

(assert (=> b!825824 (= lt!373211 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!373207 () (_ BitVec 64))

(assert (=> b!825824 (= lt!373207 (select (arr!22120 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!373210 () Unit!28259)

(assert (=> b!825824 (= lt!373210 (addApplyDifferent!314 lt!373216 lt!373211 minValue!754 lt!373207))))

(assert (=> b!825824 (= (apply!362 (+!1960 lt!373216 (tuple2!10003 lt!373211 minValue!754)) lt!373207) (apply!362 lt!373216 lt!373207))))

(declare-fun lt!373219 () Unit!28259)

(assert (=> b!825824 (= lt!373219 lt!373210)))

(declare-fun lt!373218 () ListLongMap!8815)

(assert (=> b!825824 (= lt!373218 (getCurrentListMapNoExtraKeys!2460 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!373223 () (_ BitVec 64))

(assert (=> b!825824 (= lt!373223 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!373220 () (_ BitVec 64))

(assert (=> b!825824 (= lt!373220 (select (arr!22120 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!373206 () Unit!28259)

(assert (=> b!825824 (= lt!373206 (addApplyDifferent!314 lt!373218 lt!373223 zeroValueAfter!34 lt!373220))))

(assert (=> b!825824 (= (apply!362 (+!1960 lt!373218 (tuple2!10003 lt!373223 zeroValueAfter!34)) lt!373220) (apply!362 lt!373218 lt!373220))))

(declare-fun lt!373212 () Unit!28259)

(assert (=> b!825824 (= lt!373212 lt!373206)))

(declare-fun lt!373209 () ListLongMap!8815)

(assert (=> b!825824 (= lt!373209 (getCurrentListMapNoExtraKeys!2460 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!373213 () (_ BitVec 64))

(assert (=> b!825824 (= lt!373213 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!373214 () (_ BitVec 64))

(assert (=> b!825824 (= lt!373214 (select (arr!22120 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!825824 (= lt!373205 (addApplyDifferent!314 lt!373209 lt!373213 minValue!754 lt!373214))))

(assert (=> b!825824 (= (apply!362 (+!1960 lt!373209 (tuple2!10003 lt!373213 minValue!754)) lt!373214) (apply!362 lt!373209 lt!373214))))

(declare-fun b!825825 () Bool)

(assert (=> b!825825 (= e!459753 call!35877)))

(declare-fun b!825826 () Bool)

(declare-fun call!35878 () ListLongMap!8815)

(assert (=> b!825826 (= e!459755 call!35878)))

(declare-fun bm!35876 () Bool)

(assert (=> bm!35876 (= call!35878 call!35876)))

(declare-fun b!825827 () Bool)

(assert (=> b!825827 (= e!459761 (validKeyInArray!0 (select (arr!22120 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!825828 () Bool)

(assert (=> b!825828 (= e!459753 call!35878)))

(declare-fun b!825829 () Bool)

(assert (=> b!825829 (= e!459762 e!459755)))

(assert (=> b!825829 (= c!89400 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!104833 c!89402) b!825817))

(assert (= (and d!104833 (not c!89402)) b!825829))

(assert (= (and b!825829 c!89400) b!825826))

(assert (= (and b!825829 (not c!89400)) b!825813))

(assert (= (and b!825813 c!89399) b!825828))

(assert (= (and b!825813 (not c!89399)) b!825825))

(assert (= (or b!825828 b!825825) bm!35874))

(assert (= (or b!825826 bm!35874) bm!35873))

(assert (= (or b!825826 b!825828) bm!35876))

(assert (= (or b!825817 bm!35873) bm!35871))

(assert (= (or b!825817 bm!35876) bm!35870))

(assert (= (and d!104833 res!562994) b!825814))

(assert (= (and d!104833 c!89403) b!825824))

(assert (= (and d!104833 (not c!89403)) b!825819))

(assert (= (and d!104833 res!562997) b!825812))

(assert (= (and b!825812 res!562996) b!825827))

(assert (= (and b!825812 (not res!562998)) b!825821))

(assert (= (and b!825821 res!562993) b!825820))

(assert (= (and b!825812 res!563001) b!825815))

(assert (= (and b!825815 c!89398) b!825810))

(assert (= (and b!825815 (not c!89398)) b!825822))

(assert (= (and b!825810 res!563000) b!825811))

(assert (= (or b!825810 b!825822) bm!35875))

(assert (= (and b!825815 res!562999) b!825816))

(assert (= (and b!825816 c!89401) b!825823))

(assert (= (and b!825816 (not c!89401)) b!825818))

(assert (= (and b!825823 res!562995) b!825809))

(assert (= (or b!825823 b!825818) bm!35872))

(declare-fun b_lambda!11107 () Bool)

(assert (=> (not b_lambda!11107) (not b!825820)))

(assert (=> b!825820 t!22137))

(declare-fun b_and!22195 () Bool)

(assert (= b_and!22193 (and (=> t!22137 result!7947) b_and!22195)))

(assert (=> d!104833 m!767491))

(declare-fun m!767819 () Bool)

(assert (=> b!825809 m!767819))

(declare-fun m!767821 () Bool)

(assert (=> b!825811 m!767821))

(assert (=> b!825820 m!767647))

(declare-fun m!767823 () Bool)

(assert (=> b!825820 m!767823))

(assert (=> b!825820 m!767651))

(assert (=> b!825820 m!767653))

(assert (=> b!825820 m!767653))

(assert (=> b!825820 m!767651))

(assert (=> b!825820 m!767655))

(assert (=> b!825820 m!767647))

(assert (=> b!825827 m!767647))

(assert (=> b!825827 m!767647))

(assert (=> b!825827 m!767649))

(declare-fun m!767825 () Bool)

(assert (=> bm!35870 m!767825))

(assert (=> b!825821 m!767647))

(assert (=> b!825821 m!767647))

(declare-fun m!767827 () Bool)

(assert (=> b!825821 m!767827))

(declare-fun m!767829 () Bool)

(assert (=> bm!35872 m!767829))

(declare-fun m!767831 () Bool)

(assert (=> b!825824 m!767831))

(declare-fun m!767833 () Bool)

(assert (=> b!825824 m!767833))

(declare-fun m!767835 () Bool)

(assert (=> b!825824 m!767835))

(declare-fun m!767837 () Bool)

(assert (=> b!825824 m!767837))

(declare-fun m!767839 () Bool)

(assert (=> b!825824 m!767839))

(declare-fun m!767841 () Bool)

(assert (=> b!825824 m!767841))

(declare-fun m!767843 () Bool)

(assert (=> b!825824 m!767843))

(assert (=> b!825824 m!767499))

(declare-fun m!767845 () Bool)

(assert (=> b!825824 m!767845))

(assert (=> b!825824 m!767839))

(declare-fun m!767847 () Bool)

(assert (=> b!825824 m!767847))

(declare-fun m!767849 () Bool)

(assert (=> b!825824 m!767849))

(declare-fun m!767851 () Bool)

(assert (=> b!825824 m!767851))

(assert (=> b!825824 m!767647))

(declare-fun m!767853 () Bool)

(assert (=> b!825824 m!767853))

(declare-fun m!767855 () Bool)

(assert (=> b!825824 m!767855))

(assert (=> b!825824 m!767853))

(assert (=> b!825824 m!767835))

(declare-fun m!767857 () Bool)

(assert (=> b!825824 m!767857))

(declare-fun m!767859 () Bool)

(assert (=> b!825824 m!767859))

(assert (=> b!825824 m!767857))

(declare-fun m!767861 () Bool)

(assert (=> b!825817 m!767861))

(assert (=> b!825814 m!767647))

(assert (=> b!825814 m!767647))

(assert (=> b!825814 m!767649))

(declare-fun m!767863 () Bool)

(assert (=> bm!35875 m!767863))

(assert (=> bm!35871 m!767499))

(assert (=> b!825584 d!104833))

(declare-fun d!104835 () Bool)

(declare-fun e!459763 () Bool)

(assert (=> d!104835 e!459763))

(declare-fun res!563002 () Bool)

(assert (=> d!104835 (=> (not res!563002) (not e!459763))))

(declare-fun lt!373227 () ListLongMap!8815)

(assert (=> d!104835 (= res!563002 (contains!4158 lt!373227 (_1!5012 lt!372978)))))

(declare-fun lt!373226 () List!15794)

(assert (=> d!104835 (= lt!373227 (ListLongMap!8816 lt!373226))))

(declare-fun lt!373228 () Unit!28259)

(declare-fun lt!373225 () Unit!28259)

(assert (=> d!104835 (= lt!373228 lt!373225)))

(assert (=> d!104835 (= (getValueByKey!404 lt!373226 (_1!5012 lt!372978)) (Some!409 (_2!5012 lt!372978)))))

(assert (=> d!104835 (= lt!373225 (lemmaContainsTupThenGetReturnValue!221 lt!373226 (_1!5012 lt!372978) (_2!5012 lt!372978)))))

(assert (=> d!104835 (= lt!373226 (insertStrictlySorted!260 (toList!4423 lt!372979) (_1!5012 lt!372978) (_2!5012 lt!372978)))))

(assert (=> d!104835 (= (+!1960 lt!372979 lt!372978) lt!373227)))

(declare-fun b!825830 () Bool)

(declare-fun res!563003 () Bool)

(assert (=> b!825830 (=> (not res!563003) (not e!459763))))

(assert (=> b!825830 (= res!563003 (= (getValueByKey!404 (toList!4423 lt!373227) (_1!5012 lt!372978)) (Some!409 (_2!5012 lt!372978))))))

(declare-fun b!825831 () Bool)

(assert (=> b!825831 (= e!459763 (contains!4159 (toList!4423 lt!373227) lt!372978))))

(assert (= (and d!104835 res!563002) b!825830))

(assert (= (and b!825830 res!563003) b!825831))

(declare-fun m!767865 () Bool)

(assert (=> d!104835 m!767865))

(declare-fun m!767867 () Bool)

(assert (=> d!104835 m!767867))

(declare-fun m!767869 () Bool)

(assert (=> d!104835 m!767869))

(declare-fun m!767871 () Bool)

(assert (=> d!104835 m!767871))

(declare-fun m!767873 () Bool)

(assert (=> b!825830 m!767873))

(declare-fun m!767875 () Bool)

(assert (=> b!825831 m!767875))

(assert (=> b!825584 d!104835))

(declare-fun d!104837 () Bool)

(declare-fun e!459764 () Bool)

(assert (=> d!104837 e!459764))

(declare-fun res!563004 () Bool)

(assert (=> d!104837 (=> (not res!563004) (not e!459764))))

(declare-fun lt!373231 () ListLongMap!8815)

(assert (=> d!104837 (= res!563004 (contains!4158 lt!373231 (_1!5012 lt!372978)))))

(declare-fun lt!373230 () List!15794)

(assert (=> d!104837 (= lt!373231 (ListLongMap!8816 lt!373230))))

(declare-fun lt!373232 () Unit!28259)

(declare-fun lt!373229 () Unit!28259)

(assert (=> d!104837 (= lt!373232 lt!373229)))

(assert (=> d!104837 (= (getValueByKey!404 lt!373230 (_1!5012 lt!372978)) (Some!409 (_2!5012 lt!372978)))))

(assert (=> d!104837 (= lt!373229 (lemmaContainsTupThenGetReturnValue!221 lt!373230 (_1!5012 lt!372978) (_2!5012 lt!372978)))))

(assert (=> d!104837 (= lt!373230 (insertStrictlySorted!260 (toList!4423 lt!372984) (_1!5012 lt!372978) (_2!5012 lt!372978)))))

(assert (=> d!104837 (= (+!1960 lt!372984 lt!372978) lt!373231)))

(declare-fun b!825832 () Bool)

(declare-fun res!563005 () Bool)

(assert (=> b!825832 (=> (not res!563005) (not e!459764))))

(assert (=> b!825832 (= res!563005 (= (getValueByKey!404 (toList!4423 lt!373231) (_1!5012 lt!372978)) (Some!409 (_2!5012 lt!372978))))))

(declare-fun b!825833 () Bool)

(assert (=> b!825833 (= e!459764 (contains!4159 (toList!4423 lt!373231) lt!372978))))

(assert (= (and d!104837 res!563004) b!825832))

(assert (= (and b!825832 res!563005) b!825833))

(declare-fun m!767877 () Bool)

(assert (=> d!104837 m!767877))

(declare-fun m!767879 () Bool)

(assert (=> d!104837 m!767879))

(declare-fun m!767881 () Bool)

(assert (=> d!104837 m!767881))

(declare-fun m!767883 () Bool)

(assert (=> d!104837 m!767883))

(declare-fun m!767885 () Bool)

(assert (=> b!825832 m!767885))

(declare-fun m!767887 () Bool)

(assert (=> b!825833 m!767887))

(assert (=> b!825584 d!104837))

(declare-fun b!825842 () Bool)

(declare-fun e!459771 () Bool)

(declare-fun e!459773 () Bool)

(assert (=> b!825842 (= e!459771 e!459773)))

(declare-fun c!89406 () Bool)

(assert (=> b!825842 (= c!89406 (validKeyInArray!0 (select (arr!22120 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!825843 () Bool)

(declare-fun call!35882 () Bool)

(assert (=> b!825843 (= e!459773 call!35882)))

(declare-fun bm!35879 () Bool)

(assert (=> bm!35879 (= call!35882 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!825844 () Bool)

(declare-fun e!459772 () Bool)

(assert (=> b!825844 (= e!459772 call!35882)))

(declare-fun d!104839 () Bool)

(declare-fun res!563011 () Bool)

(assert (=> d!104839 (=> res!563011 e!459771)))

(assert (=> d!104839 (= res!563011 (bvsge #b00000000000000000000000000000000 (size!22541 _keys!976)))))

(assert (=> d!104839 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!459771)))

(declare-fun b!825845 () Bool)

(assert (=> b!825845 (= e!459773 e!459772)))

(declare-fun lt!373240 () (_ BitVec 64))

(assert (=> b!825845 (= lt!373240 (select (arr!22120 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!373239 () Unit!28259)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!46147 (_ BitVec 64) (_ BitVec 32)) Unit!28259)

(assert (=> b!825845 (= lt!373239 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!373240 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!46147 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!825845 (arrayContainsKey!0 _keys!976 lt!373240 #b00000000000000000000000000000000)))

(declare-fun lt!373241 () Unit!28259)

(assert (=> b!825845 (= lt!373241 lt!373239)))

(declare-fun res!563010 () Bool)

(declare-datatypes ((SeekEntryResult!8730 0))(
  ( (MissingZero!8730 (index!37291 (_ BitVec 32))) (Found!8730 (index!37292 (_ BitVec 32))) (Intermediate!8730 (undefined!9542 Bool) (index!37293 (_ BitVec 32)) (x!69708 (_ BitVec 32))) (Undefined!8730) (MissingVacant!8730 (index!37294 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!46147 (_ BitVec 32)) SeekEntryResult!8730)

(assert (=> b!825845 (= res!563010 (= (seekEntryOrOpen!0 (select (arr!22120 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8730 #b00000000000000000000000000000000)))))

(assert (=> b!825845 (=> (not res!563010) (not e!459772))))

(assert (= (and d!104839 (not res!563011)) b!825842))

(assert (= (and b!825842 c!89406) b!825845))

(assert (= (and b!825842 (not c!89406)) b!825843))

(assert (= (and b!825845 res!563010) b!825844))

(assert (= (or b!825844 b!825843) bm!35879))

(assert (=> b!825842 m!767647))

(assert (=> b!825842 m!767647))

(assert (=> b!825842 m!767649))

(declare-fun m!767889 () Bool)

(assert (=> bm!35879 m!767889))

(assert (=> b!825845 m!767647))

(declare-fun m!767891 () Bool)

(assert (=> b!825845 m!767891))

(declare-fun m!767893 () Bool)

(assert (=> b!825845 m!767893))

(assert (=> b!825845 m!767647))

(declare-fun m!767895 () Bool)

(assert (=> b!825845 m!767895))

(assert (=> b!825594 d!104839))

(declare-fun d!104841 () Bool)

(declare-fun e!459774 () Bool)

(assert (=> d!104841 e!459774))

(declare-fun res!563012 () Bool)

(assert (=> d!104841 (=> (not res!563012) (not e!459774))))

(declare-fun lt!373244 () ListLongMap!8815)

(assert (=> d!104841 (= res!563012 (contains!4158 lt!373244 (_1!5012 lt!372972)))))

(declare-fun lt!373243 () List!15794)

(assert (=> d!104841 (= lt!373244 (ListLongMap!8816 lt!373243))))

(declare-fun lt!373245 () Unit!28259)

(declare-fun lt!373242 () Unit!28259)

(assert (=> d!104841 (= lt!373245 lt!373242)))

(assert (=> d!104841 (= (getValueByKey!404 lt!373243 (_1!5012 lt!372972)) (Some!409 (_2!5012 lt!372972)))))

(assert (=> d!104841 (= lt!373242 (lemmaContainsTupThenGetReturnValue!221 lt!373243 (_1!5012 lt!372972) (_2!5012 lt!372972)))))

(assert (=> d!104841 (= lt!373243 (insertStrictlySorted!260 (toList!4423 (+!1960 lt!372973 lt!372983)) (_1!5012 lt!372972) (_2!5012 lt!372972)))))

(assert (=> d!104841 (= (+!1960 (+!1960 lt!372973 lt!372983) lt!372972) lt!373244)))

(declare-fun b!825846 () Bool)

(declare-fun res!563013 () Bool)

(assert (=> b!825846 (=> (not res!563013) (not e!459774))))

(assert (=> b!825846 (= res!563013 (= (getValueByKey!404 (toList!4423 lt!373244) (_1!5012 lt!372972)) (Some!409 (_2!5012 lt!372972))))))

(declare-fun b!825847 () Bool)

(assert (=> b!825847 (= e!459774 (contains!4159 (toList!4423 lt!373244) lt!372972))))

(assert (= (and d!104841 res!563012) b!825846))

(assert (= (and b!825846 res!563013) b!825847))

(declare-fun m!767897 () Bool)

(assert (=> d!104841 m!767897))

(declare-fun m!767899 () Bool)

(assert (=> d!104841 m!767899))

(declare-fun m!767901 () Bool)

(assert (=> d!104841 m!767901))

(declare-fun m!767903 () Bool)

(assert (=> d!104841 m!767903))

(declare-fun m!767905 () Bool)

(assert (=> b!825846 m!767905))

(declare-fun m!767907 () Bool)

(assert (=> b!825847 m!767907))

(assert (=> b!825589 d!104841))

(declare-fun d!104843 () Bool)

(declare-fun e!459775 () Bool)

(assert (=> d!104843 e!459775))

(declare-fun res!563014 () Bool)

(assert (=> d!104843 (=> (not res!563014) (not e!459775))))

(declare-fun lt!373248 () ListLongMap!8815)

(assert (=> d!104843 (= res!563014 (contains!4158 lt!373248 (_1!5012 lt!372983)))))

(declare-fun lt!373247 () List!15794)

(assert (=> d!104843 (= lt!373248 (ListLongMap!8816 lt!373247))))

(declare-fun lt!373249 () Unit!28259)

(declare-fun lt!373246 () Unit!28259)

(assert (=> d!104843 (= lt!373249 lt!373246)))

(assert (=> d!104843 (= (getValueByKey!404 lt!373247 (_1!5012 lt!372983)) (Some!409 (_2!5012 lt!372983)))))

(assert (=> d!104843 (= lt!373246 (lemmaContainsTupThenGetReturnValue!221 lt!373247 (_1!5012 lt!372983) (_2!5012 lt!372983)))))

(assert (=> d!104843 (= lt!373247 (insertStrictlySorted!260 (toList!4423 lt!372973) (_1!5012 lt!372983) (_2!5012 lt!372983)))))

(assert (=> d!104843 (= (+!1960 lt!372973 lt!372983) lt!373248)))

(declare-fun b!825848 () Bool)

(declare-fun res!563015 () Bool)

(assert (=> b!825848 (=> (not res!563015) (not e!459775))))

(assert (=> b!825848 (= res!563015 (= (getValueByKey!404 (toList!4423 lt!373248) (_1!5012 lt!372983)) (Some!409 (_2!5012 lt!372983))))))

(declare-fun b!825849 () Bool)

(assert (=> b!825849 (= e!459775 (contains!4159 (toList!4423 lt!373248) lt!372983))))

(assert (= (and d!104843 res!563014) b!825848))

(assert (= (and b!825848 res!563015) b!825849))

(declare-fun m!767909 () Bool)

(assert (=> d!104843 m!767909))

(declare-fun m!767911 () Bool)

(assert (=> d!104843 m!767911))

(declare-fun m!767913 () Bool)

(assert (=> d!104843 m!767913))

(declare-fun m!767915 () Bool)

(assert (=> d!104843 m!767915))

(declare-fun m!767917 () Bool)

(assert (=> b!825848 m!767917))

(declare-fun m!767919 () Bool)

(assert (=> b!825849 m!767919))

(assert (=> b!825589 d!104843))

(declare-fun mapNonEmpty!24133 () Bool)

(declare-fun mapRes!24133 () Bool)

(declare-fun tp!46645 () Bool)

(declare-fun e!459781 () Bool)

(assert (=> mapNonEmpty!24133 (= mapRes!24133 (and tp!46645 e!459781))))

(declare-fun mapValue!24133 () ValueCell!7085)

(declare-fun mapRest!24133 () (Array (_ BitVec 32) ValueCell!7085))

(declare-fun mapKey!24133 () (_ BitVec 32))

(assert (=> mapNonEmpty!24133 (= mapRest!24124 (store mapRest!24133 mapKey!24133 mapValue!24133))))

(declare-fun b!825857 () Bool)

(declare-fun e!459780 () Bool)

(assert (=> b!825857 (= e!459780 tp_is_empty!15001)))

(declare-fun b!825856 () Bool)

(assert (=> b!825856 (= e!459781 tp_is_empty!15001)))

(declare-fun condMapEmpty!24133 () Bool)

(declare-fun mapDefault!24133 () ValueCell!7085)

(assert (=> mapNonEmpty!24124 (= condMapEmpty!24133 (= mapRest!24124 ((as const (Array (_ BitVec 32) ValueCell!7085)) mapDefault!24133)))))

(assert (=> mapNonEmpty!24124 (= tp!46630 (and e!459780 mapRes!24133))))

(declare-fun mapIsEmpty!24133 () Bool)

(assert (=> mapIsEmpty!24133 mapRes!24133))

(assert (= (and mapNonEmpty!24124 condMapEmpty!24133) mapIsEmpty!24133))

(assert (= (and mapNonEmpty!24124 (not condMapEmpty!24133)) mapNonEmpty!24133))

(assert (= (and mapNonEmpty!24133 ((_ is ValueCellFull!7085) mapValue!24133)) b!825856))

(assert (= (and mapNonEmpty!24124 ((_ is ValueCellFull!7085) mapDefault!24133)) b!825857))

(declare-fun m!767921 () Bool)

(assert (=> mapNonEmpty!24133 m!767921))

(declare-fun b_lambda!11109 () Bool)

(assert (= b_lambda!11103 (or (and start!71084 b_free!13291) b_lambda!11109)))

(declare-fun b_lambda!11111 () Bool)

(assert (= b_lambda!11105 (or (and start!71084 b_free!13291) b_lambda!11111)))

(declare-fun b_lambda!11113 () Bool)

(assert (= b_lambda!11097 (or (and start!71084 b_free!13291) b_lambda!11113)))

(declare-fun b_lambda!11115 () Bool)

(assert (= b_lambda!11099 (or (and start!71084 b_free!13291) b_lambda!11115)))

(declare-fun b_lambda!11117 () Bool)

(assert (= b_lambda!11107 (or (and start!71084 b_free!13291) b_lambda!11117)))

(declare-fun b_lambda!11119 () Bool)

(assert (= b_lambda!11101 (or (and start!71084 b_free!13291) b_lambda!11119)))

(check-sat (not b!825824) (not b!825729) (not b!825666) (not b!825795) (not bm!35845) (not d!104799) (not b!825784) (not b!825830) (not b!825805) b_and!22195 (not d!104807) (not d!104817) (not b!825807) (not b!825696) (not d!104843) (not bm!35863) (not bm!35871) (not d!104801) (not b!825698) (not b_lambda!11115) (not b!825703) (not b!825708) (not d!104833) (not b!825738) (not b!825817) (not bm!35844) (not mapNonEmpty!24133) (not d!104819) (not b_next!13291) (not b_lambda!11117) (not b!825712) (not b!825693) tp_is_empty!15001 (not b!825701) (not b!825849) (not bm!35872) (not b!825821) (not b!825717) (not b!825736) (not b!825735) (not b!825833) (not bm!35875) (not d!104825) (not b!825739) (not bm!35879) (not b!825814) (not b!825811) (not bm!35865) (not b!825732) (not b!825806) (not b!825827) (not b!825832) (not b!825802) (not d!104831) (not b!825796) (not d!104805) (not d!104823) (not b!825694) (not b!825740) (not b!825846) (not b!825737) (not b_lambda!11111) (not b!825699) (not b!825697) (not b!825789) (not bm!35870) (not b!825799) (not b!825734) (not b!825710) (not b!825668) (not d!104827) (not d!104829) (not b!825845) (not d!104841) (not b!825848) (not b!825733) (not b!825713) (not d!104803) (not b!825808) (not b!825792) (not b_lambda!11119) (not b_lambda!11109) (not b!825741) (not b_lambda!11113) (not b!825667) (not b!825831) (not b!825847) (not d!104835) (not b!825820) (not bm!35864) (not b!825711) (not d!104821) (not b!825665) (not b!825707) (not b!825715) (not bm!35868) (not bm!35848) (not d!104837) (not b!825786) (not b!825809) (not b!825842))
(check-sat b_and!22195 (not b_next!13291))
