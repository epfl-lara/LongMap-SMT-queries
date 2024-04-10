; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38706 () Bool)

(assert start!38706)

(declare-fun b_free!9243 () Bool)

(declare-fun b_next!9243 () Bool)

(assert (=> start!38706 (= b_free!9243 (not b_next!9243))))

(declare-fun tp!32853 () Bool)

(declare-fun b_and!16629 () Bool)

(assert (=> start!38706 (= tp!32853 b_and!16629)))

(declare-fun mapNonEmpty!16809 () Bool)

(declare-fun mapRes!16809 () Bool)

(declare-fun tp!32852 () Bool)

(declare-fun e!242554 () Bool)

(assert (=> mapNonEmpty!16809 (= mapRes!16809 (and tp!32852 e!242554))))

(declare-datatypes ((V!14605 0))(
  ( (V!14606 (val!5107 Int)) )
))
(declare-datatypes ((ValueCell!4719 0))(
  ( (ValueCellFull!4719 (v!7354 V!14605)) (EmptyCell!4719) )
))
(declare-fun mapValue!16809 () ValueCell!4719)

(declare-fun mapRest!16809 () (Array (_ BitVec 32) ValueCell!4719))

(declare-datatypes ((array!24155 0))(
  ( (array!24156 (arr!11527 (Array (_ BitVec 32) ValueCell!4719)) (size!11879 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24155)

(declare-fun mapKey!16809 () (_ BitVec 32))

(assert (=> mapNonEmpty!16809 (= (arr!11527 _values!549) (store mapRest!16809 mapKey!16809 mapValue!16809))))

(declare-fun b!402655 () Bool)

(declare-fun res!231952 () Bool)

(declare-fun e!242556 () Bool)

(assert (=> b!402655 (=> (not res!231952) (not e!242556))))

(declare-datatypes ((array!24157 0))(
  ( (array!24158 (arr!11528 (Array (_ BitVec 32) (_ BitVec 64))) (size!11880 (_ BitVec 32))) )
))
(declare-fun lt!187954 () array!24157)

(declare-datatypes ((List!6706 0))(
  ( (Nil!6703) (Cons!6702 (h!7558 (_ BitVec 64)) (t!11880 List!6706)) )
))
(declare-fun arrayNoDuplicates!0 (array!24157 (_ BitVec 32) List!6706) Bool)

(assert (=> b!402655 (= res!231952 (arrayNoDuplicates!0 lt!187954 #b00000000000000000000000000000000 Nil!6703))))

(declare-fun e!242557 () Bool)

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((tuple2!6784 0))(
  ( (tuple2!6785 (_1!3403 (_ BitVec 64)) (_2!3403 V!14605)) )
))
(declare-datatypes ((List!6707 0))(
  ( (Nil!6704) (Cons!6703 (h!7559 tuple2!6784) (t!11881 List!6707)) )
))
(declare-datatypes ((ListLongMap!5697 0))(
  ( (ListLongMap!5698 (toList!2864 List!6707)) )
))
(declare-fun call!28394 () ListLongMap!5697)

(declare-fun v!412 () V!14605)

(declare-fun call!28393 () ListLongMap!5697)

(declare-fun b!402656 () Bool)

(declare-fun +!1140 (ListLongMap!5697 tuple2!6784) ListLongMap!5697)

(assert (=> b!402656 (= e!242557 (= call!28394 (+!1140 call!28393 (tuple2!6785 k0!794 v!412))))))

(declare-fun mapIsEmpty!16809 () Bool)

(assert (=> mapIsEmpty!16809 mapRes!16809))

(declare-fun b!402657 () Bool)

(declare-fun res!231950 () Bool)

(declare-fun e!242558 () Bool)

(assert (=> b!402657 (=> (not res!231950) (not e!242558))))

(declare-fun _keys!709 () array!24157)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!402657 (= res!231950 (and (= (size!11879 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11880 _keys!709) (size!11879 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!402658 () Bool)

(declare-fun e!242555 () Bool)

(declare-fun tp_is_empty!10125 () Bool)

(assert (=> b!402658 (= e!242555 tp_is_empty!10125)))

(declare-fun b!402659 () Bool)

(declare-fun res!231949 () Bool)

(assert (=> b!402659 (=> (not res!231949) (not e!242558))))

(assert (=> b!402659 (= res!231949 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6703))))

(declare-fun b!402660 () Bool)

(declare-fun res!231951 () Bool)

(assert (=> b!402660 (=> (not res!231951) (not e!242558))))

(declare-fun arrayContainsKey!0 (array!24157 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!402660 (= res!231951 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!402661 () Bool)

(declare-fun res!231955 () Bool)

(assert (=> b!402661 (=> (not res!231955) (not e!242558))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!402661 (= res!231955 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11880 _keys!709))))))

(declare-fun minValue!515 () V!14605)

(declare-fun defaultEntry!557 () Int)

(declare-fun c!54821 () Bool)

(declare-fun bm!28390 () Bool)

(declare-fun zeroValue!515 () V!14605)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1074 (array!24157 array!24155 (_ BitVec 32) (_ BitVec 32) V!14605 V!14605 (_ BitVec 32) Int) ListLongMap!5697)

(assert (=> bm!28390 (= call!28394 (getCurrentListMapNoExtraKeys!1074 (ite c!54821 lt!187954 _keys!709) (ite c!54821 (array!24156 (store (arr!11527 _values!549) i!563 (ValueCellFull!4719 v!412)) (size!11879 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402663 () Bool)

(declare-fun res!231948 () Bool)

(assert (=> b!402663 (=> (not res!231948) (not e!242558))))

(assert (=> b!402663 (= res!231948 (or (= (select (arr!11528 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11528 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!402664 () Bool)

(declare-fun res!231956 () Bool)

(assert (=> b!402664 (=> (not res!231956) (not e!242558))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!402664 (= res!231956 (validMask!0 mask!1025))))

(declare-fun b!402665 () Bool)

(assert (=> b!402665 (= e!242558 e!242556)))

(declare-fun res!231957 () Bool)

(assert (=> b!402665 (=> (not res!231957) (not e!242556))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24157 (_ BitVec 32)) Bool)

(assert (=> b!402665 (= res!231957 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187954 mask!1025))))

(assert (=> b!402665 (= lt!187954 (array!24158 (store (arr!11528 _keys!709) i!563 k0!794) (size!11880 _keys!709)))))

(declare-fun b!402666 () Bool)

(assert (=> b!402666 (= e!242557 (= call!28393 call!28394))))

(declare-fun b!402667 () Bool)

(declare-fun res!231953 () Bool)

(assert (=> b!402667 (=> (not res!231953) (not e!242558))))

(assert (=> b!402667 (= res!231953 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!402668 () Bool)

(declare-fun res!231946 () Bool)

(assert (=> b!402668 (=> (not res!231946) (not e!242556))))

(assert (=> b!402668 (= res!231946 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11880 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun bm!28391 () Bool)

(assert (=> bm!28391 (= call!28393 (getCurrentListMapNoExtraKeys!1074 (ite c!54821 _keys!709 lt!187954) (ite c!54821 _values!549 (array!24156 (store (arr!11527 _values!549) i!563 (ValueCellFull!4719 v!412)) (size!11879 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402669 () Bool)

(declare-fun e!242559 () Bool)

(assert (=> b!402669 (= e!242559 (and e!242555 mapRes!16809))))

(declare-fun condMapEmpty!16809 () Bool)

(declare-fun mapDefault!16809 () ValueCell!4719)

(assert (=> b!402669 (= condMapEmpty!16809 (= (arr!11527 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4719)) mapDefault!16809)))))

(declare-fun b!402670 () Bool)

(assert (=> b!402670 (= e!242556 (not true))))

(assert (=> b!402670 e!242557))

(assert (=> b!402670 (= c!54821 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12192 0))(
  ( (Unit!12193) )
))
(declare-fun lt!187955 () Unit!12192)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!354 (array!24157 array!24155 (_ BitVec 32) (_ BitVec 32) V!14605 V!14605 (_ BitVec 32) (_ BitVec 64) V!14605 (_ BitVec 32) Int) Unit!12192)

(assert (=> b!402670 (= lt!187955 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!354 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402671 () Bool)

(declare-fun res!231954 () Bool)

(assert (=> b!402671 (=> (not res!231954) (not e!242558))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!402671 (= res!231954 (validKeyInArray!0 k0!794))))

(declare-fun b!402662 () Bool)

(assert (=> b!402662 (= e!242554 tp_is_empty!10125)))

(declare-fun res!231947 () Bool)

(assert (=> start!38706 (=> (not res!231947) (not e!242558))))

(assert (=> start!38706 (= res!231947 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11880 _keys!709))))))

(assert (=> start!38706 e!242558))

(assert (=> start!38706 tp_is_empty!10125))

(assert (=> start!38706 tp!32853))

(assert (=> start!38706 true))

(declare-fun array_inv!8434 (array!24155) Bool)

(assert (=> start!38706 (and (array_inv!8434 _values!549) e!242559)))

(declare-fun array_inv!8435 (array!24157) Bool)

(assert (=> start!38706 (array_inv!8435 _keys!709)))

(assert (= (and start!38706 res!231947) b!402664))

(assert (= (and b!402664 res!231956) b!402657))

(assert (= (and b!402657 res!231950) b!402667))

(assert (= (and b!402667 res!231953) b!402659))

(assert (= (and b!402659 res!231949) b!402661))

(assert (= (and b!402661 res!231955) b!402671))

(assert (= (and b!402671 res!231954) b!402663))

(assert (= (and b!402663 res!231948) b!402660))

(assert (= (and b!402660 res!231951) b!402665))

(assert (= (and b!402665 res!231957) b!402655))

(assert (= (and b!402655 res!231952) b!402668))

(assert (= (and b!402668 res!231946) b!402670))

(assert (= (and b!402670 c!54821) b!402656))

(assert (= (and b!402670 (not c!54821)) b!402666))

(assert (= (or b!402656 b!402666) bm!28390))

(assert (= (or b!402656 b!402666) bm!28391))

(assert (= (and b!402669 condMapEmpty!16809) mapIsEmpty!16809))

(assert (= (and b!402669 (not condMapEmpty!16809)) mapNonEmpty!16809))

(get-info :version)

(assert (= (and mapNonEmpty!16809 ((_ is ValueCellFull!4719) mapValue!16809)) b!402662))

(assert (= (and b!402669 ((_ is ValueCellFull!4719) mapDefault!16809)) b!402658))

(assert (= start!38706 b!402669))

(declare-fun m!396107 () Bool)

(assert (=> b!402660 m!396107))

(declare-fun m!396109 () Bool)

(assert (=> b!402665 m!396109))

(declare-fun m!396111 () Bool)

(assert (=> b!402665 m!396111))

(declare-fun m!396113 () Bool)

(assert (=> mapNonEmpty!16809 m!396113))

(declare-fun m!396115 () Bool)

(assert (=> bm!28390 m!396115))

(declare-fun m!396117 () Bool)

(assert (=> bm!28390 m!396117))

(declare-fun m!396119 () Bool)

(assert (=> b!402659 m!396119))

(declare-fun m!396121 () Bool)

(assert (=> b!402664 m!396121))

(declare-fun m!396123 () Bool)

(assert (=> b!402663 m!396123))

(declare-fun m!396125 () Bool)

(assert (=> b!402656 m!396125))

(declare-fun m!396127 () Bool)

(assert (=> b!402670 m!396127))

(declare-fun m!396129 () Bool)

(assert (=> b!402667 m!396129))

(declare-fun m!396131 () Bool)

(assert (=> b!402671 m!396131))

(declare-fun m!396133 () Bool)

(assert (=> start!38706 m!396133))

(declare-fun m!396135 () Bool)

(assert (=> start!38706 m!396135))

(declare-fun m!396137 () Bool)

(assert (=> b!402655 m!396137))

(assert (=> bm!28391 m!396115))

(declare-fun m!396139 () Bool)

(assert (=> bm!28391 m!396139))

(check-sat (not bm!28390) (not mapNonEmpty!16809) (not b!402655) (not b!402671) (not start!38706) (not b!402664) (not b!402665) b_and!16629 (not b!402670) (not b!402660) (not b!402659) (not b_next!9243) (not bm!28391) tp_is_empty!10125 (not b!402656) (not b!402667))
(check-sat b_and!16629 (not b_next!9243))
