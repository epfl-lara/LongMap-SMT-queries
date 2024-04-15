; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38540 () Bool)

(assert start!38540)

(declare-fun b_free!9091 () Bool)

(declare-fun b_next!9091 () Bool)

(assert (=> start!38540 (= b_free!9091 (not b_next!9091))))

(declare-fun tp!32396 () Bool)

(declare-fun b_and!16451 () Bool)

(assert (=> start!38540 (= tp!32396 b_and!16451)))

(declare-fun mapIsEmpty!16581 () Bool)

(declare-fun mapRes!16581 () Bool)

(assert (=> mapIsEmpty!16581 mapRes!16581))

(declare-fun res!229086 () Bool)

(declare-fun e!240789 () Bool)

(assert (=> start!38540 (=> (not res!229086) (not e!240789))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!23835 0))(
  ( (array!23836 (arr!11367 (Array (_ BitVec 32) (_ BitVec 64))) (size!11720 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23835)

(assert (=> start!38540 (= res!229086 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11720 _keys!709))))))

(assert (=> start!38540 e!240789))

(declare-fun tp_is_empty!9973 () Bool)

(assert (=> start!38540 tp_is_empty!9973))

(assert (=> start!38540 tp!32396))

(assert (=> start!38540 true))

(declare-datatypes ((V!14403 0))(
  ( (V!14404 (val!5031 Int)) )
))
(declare-datatypes ((ValueCell!4643 0))(
  ( (ValueCellFull!4643 (v!7272 V!14403)) (EmptyCell!4643) )
))
(declare-datatypes ((array!23837 0))(
  ( (array!23838 (arr!11368 (Array (_ BitVec 32) ValueCell!4643)) (size!11721 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23837)

(declare-fun e!240784 () Bool)

(declare-fun array_inv!8342 (array!23837) Bool)

(assert (=> start!38540 (and (array_inv!8342 _values!549) e!240784)))

(declare-fun array_inv!8343 (array!23835) Bool)

(assert (=> start!38540 (array_inv!8343 _keys!709)))

(declare-fun b!398508 () Bool)

(declare-fun res!229091 () Bool)

(assert (=> b!398508 (=> (not res!229091) (not e!240789))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!398508 (= res!229091 (validKeyInArray!0 k0!794))))

(declare-fun minValue!515 () V!14403)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!14403)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lt!187264 () array!23835)

(declare-fun v!412 () V!14403)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun bm!27909 () Bool)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun c!54522 () Bool)

(declare-datatypes ((tuple2!6626 0))(
  ( (tuple2!6627 (_1!3324 (_ BitVec 64)) (_2!3324 V!14403)) )
))
(declare-datatypes ((List!6538 0))(
  ( (Nil!6535) (Cons!6534 (h!7390 tuple2!6626) (t!11703 List!6538)) )
))
(declare-datatypes ((ListLongMap!5529 0))(
  ( (ListLongMap!5530 (toList!2780 List!6538)) )
))
(declare-fun call!27912 () ListLongMap!5529)

(declare-fun getCurrentListMapNoExtraKeys!1001 (array!23835 array!23837 (_ BitVec 32) (_ BitVec 32) V!14403 V!14403 (_ BitVec 32) Int) ListLongMap!5529)

(assert (=> bm!27909 (= call!27912 (getCurrentListMapNoExtraKeys!1001 (ite c!54522 _keys!709 lt!187264) (ite c!54522 _values!549 (array!23838 (store (arr!11368 _values!549) i!563 (ValueCellFull!4643 v!412)) (size!11721 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!398509 () Bool)

(declare-fun res!229090 () Bool)

(assert (=> b!398509 (=> (not res!229090) (not e!240789))))

(declare-datatypes ((List!6539 0))(
  ( (Nil!6536) (Cons!6535 (h!7391 (_ BitVec 64)) (t!11704 List!6539)) )
))
(declare-fun arrayNoDuplicates!0 (array!23835 (_ BitVec 32) List!6539) Bool)

(assert (=> b!398509 (= res!229090 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6536))))

(declare-fun call!27913 () ListLongMap!5529)

(declare-fun b!398510 () Bool)

(declare-fun e!240785 () Bool)

(declare-fun +!1099 (ListLongMap!5529 tuple2!6626) ListLongMap!5529)

(assert (=> b!398510 (= e!240785 (= call!27913 (+!1099 call!27912 (tuple2!6627 k0!794 v!412))))))

(declare-fun b!398511 () Bool)

(declare-fun res!229089 () Bool)

(assert (=> b!398511 (=> (not res!229089) (not e!240789))))

(declare-fun arrayContainsKey!0 (array!23835 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!398511 (= res!229089 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16581 () Bool)

(declare-fun tp!32397 () Bool)

(declare-fun e!240786 () Bool)

(assert (=> mapNonEmpty!16581 (= mapRes!16581 (and tp!32397 e!240786))))

(declare-fun mapValue!16581 () ValueCell!4643)

(declare-fun mapRest!16581 () (Array (_ BitVec 32) ValueCell!4643))

(declare-fun mapKey!16581 () (_ BitVec 32))

(assert (=> mapNonEmpty!16581 (= (arr!11368 _values!549) (store mapRest!16581 mapKey!16581 mapValue!16581))))

(declare-fun b!398512 () Bool)

(declare-fun res!229085 () Bool)

(declare-fun e!240783 () Bool)

(assert (=> b!398512 (=> (not res!229085) (not e!240783))))

(assert (=> b!398512 (= res!229085 (arrayNoDuplicates!0 lt!187264 #b00000000000000000000000000000000 Nil!6536))))

(declare-fun b!398513 () Bool)

(declare-fun res!229082 () Bool)

(assert (=> b!398513 (=> (not res!229082) (not e!240789))))

(assert (=> b!398513 (= res!229082 (or (= (select (arr!11367 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11367 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!398514 () Bool)

(declare-fun e!240788 () Bool)

(assert (=> b!398514 (= e!240788 tp_is_empty!9973)))

(declare-fun b!398515 () Bool)

(declare-fun res!229081 () Bool)

(assert (=> b!398515 (=> (not res!229081) (not e!240789))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23835 (_ BitVec 32)) Bool)

(assert (=> b!398515 (= res!229081 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!398516 () Bool)

(assert (=> b!398516 (= e!240789 e!240783)))

(declare-fun res!229088 () Bool)

(assert (=> b!398516 (=> (not res!229088) (not e!240783))))

(assert (=> b!398516 (= res!229088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187264 mask!1025))))

(assert (=> b!398516 (= lt!187264 (array!23836 (store (arr!11367 _keys!709) i!563 k0!794) (size!11720 _keys!709)))))

(declare-fun b!398517 () Bool)

(assert (=> b!398517 (= e!240784 (and e!240788 mapRes!16581))))

(declare-fun condMapEmpty!16581 () Bool)

(declare-fun mapDefault!16581 () ValueCell!4643)

(assert (=> b!398517 (= condMapEmpty!16581 (= (arr!11368 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4643)) mapDefault!16581)))))

(declare-fun b!398518 () Bool)

(assert (=> b!398518 (= e!240783 (not true))))

(assert (=> b!398518 e!240785))

(assert (=> b!398518 (= c!54522 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12058 0))(
  ( (Unit!12059) )
))
(declare-fun lt!187265 () Unit!12058)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!292 (array!23835 array!23837 (_ BitVec 32) (_ BitVec 32) V!14403 V!14403 (_ BitVec 32) (_ BitVec 64) V!14403 (_ BitVec 32) Int) Unit!12058)

(assert (=> b!398518 (= lt!187265 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!292 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!398519 () Bool)

(declare-fun res!229087 () Bool)

(assert (=> b!398519 (=> (not res!229087) (not e!240783))))

(assert (=> b!398519 (= res!229087 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11720 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!398520 () Bool)

(assert (=> b!398520 (= e!240786 tp_is_empty!9973)))

(declare-fun b!398521 () Bool)

(declare-fun res!229084 () Bool)

(assert (=> b!398521 (=> (not res!229084) (not e!240789))))

(assert (=> b!398521 (= res!229084 (and (= (size!11721 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11720 _keys!709) (size!11721 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!398522 () Bool)

(declare-fun res!229083 () Bool)

(assert (=> b!398522 (=> (not res!229083) (not e!240789))))

(assert (=> b!398522 (= res!229083 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11720 _keys!709))))))

(declare-fun b!398523 () Bool)

(declare-fun res!229092 () Bool)

(assert (=> b!398523 (=> (not res!229092) (not e!240789))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!398523 (= res!229092 (validMask!0 mask!1025))))

(declare-fun bm!27910 () Bool)

(assert (=> bm!27910 (= call!27913 (getCurrentListMapNoExtraKeys!1001 (ite c!54522 lt!187264 _keys!709) (ite c!54522 (array!23838 (store (arr!11368 _values!549) i!563 (ValueCellFull!4643 v!412)) (size!11721 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!398524 () Bool)

(assert (=> b!398524 (= e!240785 (= call!27912 call!27913))))

(assert (= (and start!38540 res!229086) b!398523))

(assert (= (and b!398523 res!229092) b!398521))

(assert (= (and b!398521 res!229084) b!398515))

(assert (= (and b!398515 res!229081) b!398509))

(assert (= (and b!398509 res!229090) b!398522))

(assert (= (and b!398522 res!229083) b!398508))

(assert (= (and b!398508 res!229091) b!398513))

(assert (= (and b!398513 res!229082) b!398511))

(assert (= (and b!398511 res!229089) b!398516))

(assert (= (and b!398516 res!229088) b!398512))

(assert (= (and b!398512 res!229085) b!398519))

(assert (= (and b!398519 res!229087) b!398518))

(assert (= (and b!398518 c!54522) b!398510))

(assert (= (and b!398518 (not c!54522)) b!398524))

(assert (= (or b!398510 b!398524) bm!27910))

(assert (= (or b!398510 b!398524) bm!27909))

(assert (= (and b!398517 condMapEmpty!16581) mapIsEmpty!16581))

(assert (= (and b!398517 (not condMapEmpty!16581)) mapNonEmpty!16581))

(get-info :version)

(assert (= (and mapNonEmpty!16581 ((_ is ValueCellFull!4643) mapValue!16581)) b!398520))

(assert (= (and b!398517 ((_ is ValueCellFull!4643) mapDefault!16581)) b!398514))

(assert (= start!38540 b!398517))

(declare-fun m!392799 () Bool)

(assert (=> bm!27909 m!392799))

(declare-fun m!392801 () Bool)

(assert (=> bm!27909 m!392801))

(declare-fun m!392803 () Bool)

(assert (=> b!398509 m!392803))

(declare-fun m!392805 () Bool)

(assert (=> b!398508 m!392805))

(declare-fun m!392807 () Bool)

(assert (=> start!38540 m!392807))

(declare-fun m!392809 () Bool)

(assert (=> start!38540 m!392809))

(declare-fun m!392811 () Bool)

(assert (=> b!398511 m!392811))

(declare-fun m!392813 () Bool)

(assert (=> b!398513 m!392813))

(declare-fun m!392815 () Bool)

(assert (=> b!398510 m!392815))

(declare-fun m!392817 () Bool)

(assert (=> b!398512 m!392817))

(declare-fun m!392819 () Bool)

(assert (=> mapNonEmpty!16581 m!392819))

(declare-fun m!392821 () Bool)

(assert (=> b!398515 m!392821))

(assert (=> bm!27910 m!392799))

(declare-fun m!392823 () Bool)

(assert (=> bm!27910 m!392823))

(declare-fun m!392825 () Bool)

(assert (=> b!398523 m!392825))

(declare-fun m!392827 () Bool)

(assert (=> b!398518 m!392827))

(declare-fun m!392829 () Bool)

(assert (=> b!398516 m!392829))

(declare-fun m!392831 () Bool)

(assert (=> b!398516 m!392831))

(check-sat (not b!398523) (not b!398518) (not b!398515) (not b!398516) (not bm!27910) (not b!398512) (not start!38540) (not b!398509) (not b!398511) (not bm!27909) b_and!16451 (not mapNonEmpty!16581) tp_is_empty!9973 (not b_next!9091) (not b!398510) (not b!398508))
(check-sat b_and!16451 (not b_next!9091))
