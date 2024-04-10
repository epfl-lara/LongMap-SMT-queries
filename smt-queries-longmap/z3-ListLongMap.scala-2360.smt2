; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37624 () Bool)

(assert start!37624)

(declare-fun b_free!8751 () Bool)

(declare-fun b_next!8751 () Bool)

(assert (=> start!37624 (= b_free!8751 (not b_next!8751))))

(declare-fun tp!30968 () Bool)

(declare-fun b_and!15993 () Bool)

(assert (=> start!37624 (= tp!30968 b_and!15993)))

(declare-fun b!385057 () Bool)

(declare-fun e!233717 () Bool)

(declare-fun tp_is_empty!9399 () Bool)

(assert (=> b!385057 (= e!233717 tp_is_empty!9399)))

(declare-fun b!385058 () Bool)

(declare-fun e!233714 () Bool)

(declare-fun e!233718 () Bool)

(assert (=> b!385058 (= e!233714 (not e!233718))))

(declare-fun res!219587 () Bool)

(assert (=> b!385058 (=> res!219587 e!233718)))

(declare-fun lt!181371 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!385058 (= res!219587 (or (and (not lt!181371) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!181371) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!181371)))))

(assert (=> b!385058 (= lt!181371 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((V!13637 0))(
  ( (V!13638 (val!4744 Int)) )
))
(declare-datatypes ((ValueCell!4356 0))(
  ( (ValueCellFull!4356 (v!6941 V!13637)) (EmptyCell!4356) )
))
(declare-datatypes ((array!22699 0))(
  ( (array!22700 (arr!10818 (Array (_ BitVec 32) ValueCell!4356)) (size!11170 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22699)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6390 0))(
  ( (tuple2!6391 (_1!3206 (_ BitVec 64)) (_2!3206 V!13637)) )
))
(declare-datatypes ((List!6225 0))(
  ( (Nil!6222) (Cons!6221 (h!7077 tuple2!6390) (t!11375 List!6225)) )
))
(declare-datatypes ((ListLongMap!5303 0))(
  ( (ListLongMap!5304 (toList!2667 List!6225)) )
))
(declare-fun lt!181374 () ListLongMap!5303)

(declare-fun zeroValue!472 () V!13637)

(declare-datatypes ((array!22701 0))(
  ( (array!22702 (arr!10819 (Array (_ BitVec 32) (_ BitVec 64))) (size!11171 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22701)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13637)

(declare-fun getCurrentListMap!2064 (array!22701 array!22699 (_ BitVec 32) (_ BitVec 32) V!13637 V!13637 (_ BitVec 32) Int) ListLongMap!5303)

(assert (=> b!385058 (= lt!181374 (getCurrentListMap!2064 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181377 () array!22701)

(declare-fun lt!181373 () array!22699)

(declare-fun lt!181376 () ListLongMap!5303)

(assert (=> b!385058 (= lt!181376 (getCurrentListMap!2064 lt!181377 lt!181373 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181372 () ListLongMap!5303)

(declare-fun lt!181379 () ListLongMap!5303)

(assert (=> b!385058 (and (= lt!181372 lt!181379) (= lt!181379 lt!181372))))

(declare-fun lt!181380 () ListLongMap!5303)

(declare-fun lt!181375 () tuple2!6390)

(declare-fun +!1002 (ListLongMap!5303 tuple2!6390) ListLongMap!5303)

(assert (=> b!385058 (= lt!181379 (+!1002 lt!181380 lt!181375))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun v!373 () V!13637)

(assert (=> b!385058 (= lt!181375 (tuple2!6391 k0!778 v!373))))

(declare-datatypes ((Unit!11882 0))(
  ( (Unit!11883) )
))
(declare-fun lt!181370 () Unit!11882)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!222 (array!22701 array!22699 (_ BitVec 32) (_ BitVec 32) V!13637 V!13637 (_ BitVec 32) (_ BitVec 64) V!13637 (_ BitVec 32) Int) Unit!11882)

(assert (=> b!385058 (= lt!181370 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!222 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!898 (array!22701 array!22699 (_ BitVec 32) (_ BitVec 32) V!13637 V!13637 (_ BitVec 32) Int) ListLongMap!5303)

(assert (=> b!385058 (= lt!181372 (getCurrentListMapNoExtraKeys!898 lt!181377 lt!181373 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!385058 (= lt!181373 (array!22700 (store (arr!10818 _values!506) i!548 (ValueCellFull!4356 v!373)) (size!11170 _values!506)))))

(assert (=> b!385058 (= lt!181380 (getCurrentListMapNoExtraKeys!898 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!385059 () Bool)

(declare-fun res!219588 () Bool)

(declare-fun e!233716 () Bool)

(assert (=> b!385059 (=> (not res!219588) (not e!233716))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22701 (_ BitVec 32)) Bool)

(assert (=> b!385059 (= res!219588 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!15663 () Bool)

(declare-fun mapRes!15663 () Bool)

(assert (=> mapIsEmpty!15663 mapRes!15663))

(declare-fun mapNonEmpty!15663 () Bool)

(declare-fun tp!30969 () Bool)

(assert (=> mapNonEmpty!15663 (= mapRes!15663 (and tp!30969 e!233717))))

(declare-fun mapRest!15663 () (Array (_ BitVec 32) ValueCell!4356))

(declare-fun mapKey!15663 () (_ BitVec 32))

(declare-fun mapValue!15663 () ValueCell!4356)

(assert (=> mapNonEmpty!15663 (= (arr!10818 _values!506) (store mapRest!15663 mapKey!15663 mapValue!15663))))

(declare-fun b!385060 () Bool)

(declare-fun res!219592 () Bool)

(assert (=> b!385060 (=> (not res!219592) (not e!233716))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!385060 (= res!219592 (validKeyInArray!0 k0!778))))

(declare-fun b!385061 () Bool)

(declare-fun res!219590 () Bool)

(assert (=> b!385061 (=> (not res!219590) (not e!233716))))

(assert (=> b!385061 (= res!219590 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11171 _keys!658))))))

(declare-fun b!385062 () Bool)

(declare-fun e!233719 () Bool)

(assert (=> b!385062 (= e!233719 tp_is_empty!9399)))

(declare-fun b!385063 () Bool)

(declare-fun res!219585 () Bool)

(assert (=> b!385063 (=> (not res!219585) (not e!233714))))

(declare-datatypes ((List!6226 0))(
  ( (Nil!6223) (Cons!6222 (h!7078 (_ BitVec 64)) (t!11376 List!6226)) )
))
(declare-fun arrayNoDuplicates!0 (array!22701 (_ BitVec 32) List!6226) Bool)

(assert (=> b!385063 (= res!219585 (arrayNoDuplicates!0 lt!181377 #b00000000000000000000000000000000 Nil!6223))))

(declare-fun b!385064 () Bool)

(declare-fun res!219591 () Bool)

(assert (=> b!385064 (=> (not res!219591) (not e!233716))))

(assert (=> b!385064 (= res!219591 (or (= (select (arr!10819 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10819 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!385065 () Bool)

(declare-fun res!219583 () Bool)

(assert (=> b!385065 (=> (not res!219583) (not e!233716))))

(assert (=> b!385065 (= res!219583 (and (= (size!11170 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11171 _keys!658) (size!11170 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!385066 () Bool)

(declare-fun res!219589 () Bool)

(assert (=> b!385066 (=> (not res!219589) (not e!233716))))

(assert (=> b!385066 (= res!219589 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6223))))

(declare-fun b!385067 () Bool)

(assert (=> b!385067 (= e!233716 e!233714)))

(declare-fun res!219584 () Bool)

(assert (=> b!385067 (=> (not res!219584) (not e!233714))))

(assert (=> b!385067 (= res!219584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181377 mask!970))))

(assert (=> b!385067 (= lt!181377 (array!22702 (store (arr!10819 _keys!658) i!548 k0!778) (size!11171 _keys!658)))))

(declare-fun b!385068 () Bool)

(assert (=> b!385068 (= e!233718 true)))

(declare-fun lt!181378 () ListLongMap!5303)

(assert (=> b!385068 (= lt!181378 (+!1002 lt!181374 lt!181375))))

(assert (=> b!385068 (= lt!181376 lt!181372)))

(declare-fun b!385069 () Bool)

(declare-fun res!219593 () Bool)

(assert (=> b!385069 (=> (not res!219593) (not e!233716))))

(declare-fun arrayContainsKey!0 (array!22701 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!385069 (= res!219593 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun res!219586 () Bool)

(assert (=> start!37624 (=> (not res!219586) (not e!233716))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37624 (= res!219586 (validMask!0 mask!970))))

(assert (=> start!37624 e!233716))

(declare-fun e!233715 () Bool)

(declare-fun array_inv!7964 (array!22699) Bool)

(assert (=> start!37624 (and (array_inv!7964 _values!506) e!233715)))

(assert (=> start!37624 tp!30968))

(assert (=> start!37624 true))

(assert (=> start!37624 tp_is_empty!9399))

(declare-fun array_inv!7965 (array!22701) Bool)

(assert (=> start!37624 (array_inv!7965 _keys!658)))

(declare-fun b!385070 () Bool)

(assert (=> b!385070 (= e!233715 (and e!233719 mapRes!15663))))

(declare-fun condMapEmpty!15663 () Bool)

(declare-fun mapDefault!15663 () ValueCell!4356)

(assert (=> b!385070 (= condMapEmpty!15663 (= (arr!10818 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4356)) mapDefault!15663)))))

(assert (= (and start!37624 res!219586) b!385065))

(assert (= (and b!385065 res!219583) b!385059))

(assert (= (and b!385059 res!219588) b!385066))

(assert (= (and b!385066 res!219589) b!385061))

(assert (= (and b!385061 res!219590) b!385060))

(assert (= (and b!385060 res!219592) b!385064))

(assert (= (and b!385064 res!219591) b!385069))

(assert (= (and b!385069 res!219593) b!385067))

(assert (= (and b!385067 res!219584) b!385063))

(assert (= (and b!385063 res!219585) b!385058))

(assert (= (and b!385058 (not res!219587)) b!385068))

(assert (= (and b!385070 condMapEmpty!15663) mapIsEmpty!15663))

(assert (= (and b!385070 (not condMapEmpty!15663)) mapNonEmpty!15663))

(get-info :version)

(assert (= (and mapNonEmpty!15663 ((_ is ValueCellFull!4356) mapValue!15663)) b!385057))

(assert (= (and b!385070 ((_ is ValueCellFull!4356) mapDefault!15663)) b!385062))

(assert (= start!37624 b!385070))

(declare-fun m!381715 () Bool)

(assert (=> b!385066 m!381715))

(declare-fun m!381717 () Bool)

(assert (=> b!385064 m!381717))

(declare-fun m!381719 () Bool)

(assert (=> b!385060 m!381719))

(declare-fun m!381721 () Bool)

(assert (=> start!37624 m!381721))

(declare-fun m!381723 () Bool)

(assert (=> start!37624 m!381723))

(declare-fun m!381725 () Bool)

(assert (=> start!37624 m!381725))

(declare-fun m!381727 () Bool)

(assert (=> mapNonEmpty!15663 m!381727))

(declare-fun m!381729 () Bool)

(assert (=> b!385058 m!381729))

(declare-fun m!381731 () Bool)

(assert (=> b!385058 m!381731))

(declare-fun m!381733 () Bool)

(assert (=> b!385058 m!381733))

(declare-fun m!381735 () Bool)

(assert (=> b!385058 m!381735))

(declare-fun m!381737 () Bool)

(assert (=> b!385058 m!381737))

(declare-fun m!381739 () Bool)

(assert (=> b!385058 m!381739))

(declare-fun m!381741 () Bool)

(assert (=> b!385058 m!381741))

(declare-fun m!381743 () Bool)

(assert (=> b!385068 m!381743))

(declare-fun m!381745 () Bool)

(assert (=> b!385069 m!381745))

(declare-fun m!381747 () Bool)

(assert (=> b!385059 m!381747))

(declare-fun m!381749 () Bool)

(assert (=> b!385063 m!381749))

(declare-fun m!381751 () Bool)

(assert (=> b!385067 m!381751))

(declare-fun m!381753 () Bool)

(assert (=> b!385067 m!381753))

(check-sat (not b!385066) (not mapNonEmpty!15663) tp_is_empty!9399 b_and!15993 (not b_next!8751) (not b!385058) (not b!385059) (not b!385060) (not start!37624) (not b!385068) (not b!385063) (not b!385069) (not b!385067))
(check-sat b_and!15993 (not b_next!8751))
