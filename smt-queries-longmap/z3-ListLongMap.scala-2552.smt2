; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39116 () Bool)

(assert start!39116)

(declare-fun b_free!9397 () Bool)

(declare-fun b_next!9397 () Bool)

(assert (=> start!39116 (= b_free!9397 (not b_next!9397))))

(declare-fun tp!33720 () Bool)

(declare-fun b_and!16797 () Bool)

(assert (=> start!39116 (= tp!33720 b_and!16797)))

(declare-fun b!411488 () Bool)

(declare-fun res!238774 () Bool)

(declare-fun e!246418 () Bool)

(assert (=> b!411488 (=> (not res!238774) (not e!246418))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15171 0))(
  ( (V!15172 (val!5319 Int)) )
))
(declare-datatypes ((ValueCell!4931 0))(
  ( (ValueCellFull!4931 (v!7567 V!15171)) (EmptyCell!4931) )
))
(declare-datatypes ((array!24962 0))(
  ( (array!24963 (arr!11930 (Array (_ BitVec 32) ValueCell!4931)) (size!12282 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24962)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!24964 0))(
  ( (array!24965 (arr!11931 (Array (_ BitVec 32) (_ BitVec 64))) (size!12283 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24964)

(assert (=> b!411488 (= res!238774 (and (= (size!12282 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12283 _keys!709) (size!12282 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!411489 () Bool)

(declare-fun e!246417 () Bool)

(assert (=> b!411489 (= e!246418 e!246417)))

(declare-fun res!238772 () Bool)

(assert (=> b!411489 (=> (not res!238772) (not e!246417))))

(declare-fun lt!189320 () array!24964)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24964 (_ BitVec 32)) Bool)

(assert (=> b!411489 (= res!238772 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189320 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!411489 (= lt!189320 (array!24965 (store (arr!11931 _keys!709) i!563 k0!794) (size!12283 _keys!709)))))

(declare-fun b!411490 () Bool)

(declare-fun e!246413 () Bool)

(declare-fun tp_is_empty!10549 () Bool)

(assert (=> b!411490 (= e!246413 tp_is_empty!10549)))

(declare-fun mapNonEmpty!17445 () Bool)

(declare-fun mapRes!17445 () Bool)

(declare-fun tp!33719 () Bool)

(assert (=> mapNonEmpty!17445 (= mapRes!17445 (and tp!33719 e!246413))))

(declare-fun mapKey!17445 () (_ BitVec 32))

(declare-fun mapRest!17445 () (Array (_ BitVec 32) ValueCell!4931))

(declare-fun mapValue!17445 () ValueCell!4931)

(assert (=> mapNonEmpty!17445 (= (arr!11930 _values!549) (store mapRest!17445 mapKey!17445 mapValue!17445))))

(declare-fun b!411492 () Bool)

(declare-fun res!238775 () Bool)

(assert (=> b!411492 (=> (not res!238775) (not e!246418))))

(declare-datatypes ((List!6791 0))(
  ( (Nil!6788) (Cons!6787 (h!7643 (_ BitVec 64)) (t!11957 List!6791)) )
))
(declare-fun arrayNoDuplicates!0 (array!24964 (_ BitVec 32) List!6791) Bool)

(assert (=> b!411492 (= res!238775 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6788))))

(declare-fun mapIsEmpty!17445 () Bool)

(assert (=> mapIsEmpty!17445 mapRes!17445))

(declare-fun b!411493 () Bool)

(assert (=> b!411493 (= e!246417 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!15171)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15171)

(declare-datatypes ((tuple2!6772 0))(
  ( (tuple2!6773 (_1!3397 (_ BitVec 64)) (_2!3397 V!15171)) )
))
(declare-datatypes ((List!6792 0))(
  ( (Nil!6789) (Cons!6788 (h!7644 tuple2!6772) (t!11958 List!6792)) )
))
(declare-datatypes ((ListLongMap!5687 0))(
  ( (ListLongMap!5688 (toList!2859 List!6792)) )
))
(declare-fun lt!189321 () ListLongMap!5687)

(declare-fun v!412 () V!15171)

(declare-fun getCurrentListMapNoExtraKeys!1111 (array!24964 array!24962 (_ BitVec 32) (_ BitVec 32) V!15171 V!15171 (_ BitVec 32) Int) ListLongMap!5687)

(assert (=> b!411493 (= lt!189321 (getCurrentListMapNoExtraKeys!1111 lt!189320 (array!24963 (store (arr!11930 _values!549) i!563 (ValueCellFull!4931 v!412)) (size!12282 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189319 () ListLongMap!5687)

(assert (=> b!411493 (= lt!189319 (getCurrentListMapNoExtraKeys!1111 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!411494 () Bool)

(declare-fun res!238767 () Bool)

(assert (=> b!411494 (=> (not res!238767) (not e!246418))))

(assert (=> b!411494 (= res!238767 (or (= (select (arr!11931 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11931 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!238768 () Bool)

(assert (=> start!39116 (=> (not res!238768) (not e!246418))))

(assert (=> start!39116 (= res!238768 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12283 _keys!709))))))

(assert (=> start!39116 e!246418))

(assert (=> start!39116 tp_is_empty!10549))

(assert (=> start!39116 tp!33720))

(assert (=> start!39116 true))

(declare-fun e!246415 () Bool)

(declare-fun array_inv!8784 (array!24962) Bool)

(assert (=> start!39116 (and (array_inv!8784 _values!549) e!246415)))

(declare-fun array_inv!8785 (array!24964) Bool)

(assert (=> start!39116 (array_inv!8785 _keys!709)))

(declare-fun b!411491 () Bool)

(declare-fun res!238770 () Bool)

(assert (=> b!411491 (=> (not res!238770) (not e!246418))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!411491 (= res!238770 (validMask!0 mask!1025))))

(declare-fun b!411495 () Bool)

(declare-fun res!238766 () Bool)

(assert (=> b!411495 (=> (not res!238766) (not e!246418))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!411495 (= res!238766 (validKeyInArray!0 k0!794))))

(declare-fun b!411496 () Bool)

(declare-fun e!246416 () Bool)

(assert (=> b!411496 (= e!246415 (and e!246416 mapRes!17445))))

(declare-fun condMapEmpty!17445 () Bool)

(declare-fun mapDefault!17445 () ValueCell!4931)

(assert (=> b!411496 (= condMapEmpty!17445 (= (arr!11930 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4931)) mapDefault!17445)))))

(declare-fun b!411497 () Bool)

(declare-fun res!238765 () Bool)

(assert (=> b!411497 (=> (not res!238765) (not e!246417))))

(assert (=> b!411497 (= res!238765 (arrayNoDuplicates!0 lt!189320 #b00000000000000000000000000000000 Nil!6788))))

(declare-fun b!411498 () Bool)

(declare-fun res!238771 () Bool)

(assert (=> b!411498 (=> (not res!238771) (not e!246418))))

(assert (=> b!411498 (= res!238771 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!411499 () Bool)

(declare-fun res!238769 () Bool)

(assert (=> b!411499 (=> (not res!238769) (not e!246417))))

(assert (=> b!411499 (= res!238769 (bvsle from!863 i!563))))

(declare-fun b!411500 () Bool)

(assert (=> b!411500 (= e!246416 tp_is_empty!10549)))

(declare-fun b!411501 () Bool)

(declare-fun res!238776 () Bool)

(assert (=> b!411501 (=> (not res!238776) (not e!246418))))

(declare-fun arrayContainsKey!0 (array!24964 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!411501 (= res!238776 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!411502 () Bool)

(declare-fun res!238773 () Bool)

(assert (=> b!411502 (=> (not res!238773) (not e!246418))))

(assert (=> b!411502 (= res!238773 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12283 _keys!709))))))

(assert (= (and start!39116 res!238768) b!411491))

(assert (= (and b!411491 res!238770) b!411488))

(assert (= (and b!411488 res!238774) b!411498))

(assert (= (and b!411498 res!238771) b!411492))

(assert (= (and b!411492 res!238775) b!411502))

(assert (= (and b!411502 res!238773) b!411495))

(assert (= (and b!411495 res!238766) b!411494))

(assert (= (and b!411494 res!238767) b!411501))

(assert (= (and b!411501 res!238776) b!411489))

(assert (= (and b!411489 res!238772) b!411497))

(assert (= (and b!411497 res!238765) b!411499))

(assert (= (and b!411499 res!238769) b!411493))

(assert (= (and b!411496 condMapEmpty!17445) mapIsEmpty!17445))

(assert (= (and b!411496 (not condMapEmpty!17445)) mapNonEmpty!17445))

(get-info :version)

(assert (= (and mapNonEmpty!17445 ((_ is ValueCellFull!4931) mapValue!17445)) b!411490))

(assert (= (and b!411496 ((_ is ValueCellFull!4931) mapDefault!17445)) b!411500))

(assert (= start!39116 b!411496))

(declare-fun m!401883 () Bool)

(assert (=> b!411498 m!401883))

(declare-fun m!401885 () Bool)

(assert (=> b!411489 m!401885))

(declare-fun m!401887 () Bool)

(assert (=> b!411489 m!401887))

(declare-fun m!401889 () Bool)

(assert (=> b!411492 m!401889))

(declare-fun m!401891 () Bool)

(assert (=> b!411495 m!401891))

(declare-fun m!401893 () Bool)

(assert (=> b!411497 m!401893))

(declare-fun m!401895 () Bool)

(assert (=> b!411501 m!401895))

(declare-fun m!401897 () Bool)

(assert (=> b!411494 m!401897))

(declare-fun m!401899 () Bool)

(assert (=> b!411493 m!401899))

(declare-fun m!401901 () Bool)

(assert (=> b!411493 m!401901))

(declare-fun m!401903 () Bool)

(assert (=> b!411493 m!401903))

(declare-fun m!401905 () Bool)

(assert (=> start!39116 m!401905))

(declare-fun m!401907 () Bool)

(assert (=> start!39116 m!401907))

(declare-fun m!401909 () Bool)

(assert (=> b!411491 m!401909))

(declare-fun m!401911 () Bool)

(assert (=> mapNonEmpty!17445 m!401911))

(check-sat (not b!411501) (not b_next!9397) (not b!411495) (not b!411491) (not start!39116) (not mapNonEmpty!17445) (not b!411492) (not b!411498) b_and!16797 (not b!411493) tp_is_empty!10549 (not b!411497) (not b!411489))
(check-sat b_and!16797 (not b_next!9397))
