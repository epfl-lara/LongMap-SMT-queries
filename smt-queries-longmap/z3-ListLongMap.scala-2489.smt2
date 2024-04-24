; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38738 () Bool)

(assert start!38738)

(declare-fun b_free!9289 () Bool)

(declare-fun b_next!9289 () Bool)

(assert (=> start!38738 (= b_free!9289 (not b_next!9289))))

(declare-fun tp!32990 () Bool)

(declare-fun b_and!16689 () Bool)

(assert (=> start!38738 (= tp!32990 b_and!16689)))

(declare-fun b!403779 () Bool)

(declare-fun res!232781 () Bool)

(declare-fun e!243008 () Bool)

(assert (=> b!403779 (=> (not res!232781) (not e!243008))))

(declare-datatypes ((array!24226 0))(
  ( (array!24227 (arr!11562 (Array (_ BitVec 32) (_ BitVec 64))) (size!11914 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24226)

(declare-datatypes ((List!6614 0))(
  ( (Nil!6611) (Cons!6610 (h!7466 (_ BitVec 64)) (t!11780 List!6614)) )
))
(declare-fun arrayNoDuplicates!0 (array!24226 (_ BitVec 32) List!6614) Bool)

(assert (=> b!403779 (= res!232781 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6611))))

(declare-fun b!403780 () Bool)

(declare-fun res!232773 () Bool)

(assert (=> b!403780 (=> (not res!232773) (not e!243008))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!403780 (= res!232773 (validKeyInArray!0 k0!794))))

(declare-fun b!403781 () Bool)

(declare-fun res!232775 () Bool)

(assert (=> b!403781 (=> (not res!232775) (not e!243008))))

(declare-datatypes ((V!14667 0))(
  ( (V!14668 (val!5130 Int)) )
))
(declare-datatypes ((ValueCell!4742 0))(
  ( (ValueCellFull!4742 (v!7378 V!14667)) (EmptyCell!4742) )
))
(declare-datatypes ((array!24228 0))(
  ( (array!24229 (arr!11563 (Array (_ BitVec 32) ValueCell!4742)) (size!11915 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24228)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!403781 (= res!232775 (and (= (size!11915 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11914 _keys!709) (size!11915 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!403782 () Bool)

(declare-fun res!232779 () Bool)

(assert (=> b!403782 (=> (not res!232779) (not e!243008))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!403782 (= res!232779 (validMask!0 mask!1025))))

(declare-datatypes ((tuple2!6696 0))(
  ( (tuple2!6697 (_1!3359 (_ BitVec 64)) (_2!3359 V!14667)) )
))
(declare-datatypes ((List!6615 0))(
  ( (Nil!6612) (Cons!6611 (h!7467 tuple2!6696) (t!11781 List!6615)) )
))
(declare-datatypes ((ListLongMap!5611 0))(
  ( (ListLongMap!5612 (toList!2821 List!6615)) )
))
(declare-fun call!28519 () ListLongMap!5611)

(declare-fun call!28518 () ListLongMap!5611)

(declare-fun e!243005 () Bool)

(declare-fun b!403783 () Bool)

(declare-fun v!412 () V!14667)

(declare-fun +!1158 (ListLongMap!5611 tuple2!6696) ListLongMap!5611)

(assert (=> b!403783 (= e!243005 (= call!28518 (+!1158 call!28519 (tuple2!6697 k0!794 v!412))))))

(declare-fun res!232777 () Bool)

(assert (=> start!38738 (=> (not res!232777) (not e!243008))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38738 (= res!232777 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11914 _keys!709))))))

(assert (=> start!38738 e!243008))

(declare-fun tp_is_empty!10171 () Bool)

(assert (=> start!38738 tp_is_empty!10171))

(assert (=> start!38738 tp!32990))

(assert (=> start!38738 true))

(declare-fun e!243007 () Bool)

(declare-fun array_inv!8542 (array!24228) Bool)

(assert (=> start!38738 (and (array_inv!8542 _values!549) e!243007)))

(declare-fun array_inv!8543 (array!24226) Bool)

(assert (=> start!38738 (array_inv!8543 _keys!709)))

(declare-fun b!403784 () Bool)

(declare-fun res!232772 () Bool)

(assert (=> b!403784 (=> (not res!232772) (not e!243008))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!403784 (= res!232772 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11914 _keys!709))))))

(declare-fun b!403785 () Bool)

(declare-fun e!243010 () Bool)

(assert (=> b!403785 (= e!243010 tp_is_empty!10171)))

(declare-fun minValue!515 () V!14667)

(declare-fun defaultEntry!557 () Int)

(declare-fun bm!28515 () Bool)

(declare-fun lt!188111 () array!24226)

(declare-fun c!54867 () Bool)

(declare-fun zeroValue!515 () V!14667)

(declare-fun getCurrentListMapNoExtraKeys!1074 (array!24226 array!24228 (_ BitVec 32) (_ BitVec 32) V!14667 V!14667 (_ BitVec 32) Int) ListLongMap!5611)

(assert (=> bm!28515 (= call!28518 (getCurrentListMapNoExtraKeys!1074 (ite c!54867 lt!188111 _keys!709) (ite c!54867 (array!24229 (store (arr!11563 _values!549) i!563 (ValueCellFull!4742 v!412)) (size!11915 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!403786 () Bool)

(declare-fun res!232778 () Bool)

(assert (=> b!403786 (=> (not res!232778) (not e!243008))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24226 (_ BitVec 32)) Bool)

(assert (=> b!403786 (= res!232778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!403787 () Bool)

(declare-fun e!243006 () Bool)

(assert (=> b!403787 (= e!243008 e!243006)))

(declare-fun res!232782 () Bool)

(assert (=> b!403787 (=> (not res!232782) (not e!243006))))

(assert (=> b!403787 (= res!232782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188111 mask!1025))))

(assert (=> b!403787 (= lt!188111 (array!24227 (store (arr!11562 _keys!709) i!563 k0!794) (size!11914 _keys!709)))))

(declare-fun b!403788 () Bool)

(declare-fun e!243009 () Bool)

(assert (=> b!403788 (= e!243009 tp_is_empty!10171)))

(declare-fun bm!28516 () Bool)

(assert (=> bm!28516 (= call!28519 (getCurrentListMapNoExtraKeys!1074 (ite c!54867 _keys!709 lt!188111) (ite c!54867 _values!549 (array!24229 (store (arr!11563 _values!549) i!563 (ValueCellFull!4742 v!412)) (size!11915 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!403789 () Bool)

(declare-fun res!232774 () Bool)

(assert (=> b!403789 (=> (not res!232774) (not e!243008))))

(declare-fun arrayContainsKey!0 (array!24226 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!403789 (= res!232774 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!403790 () Bool)

(declare-fun res!232780 () Bool)

(assert (=> b!403790 (=> (not res!232780) (not e!243006))))

(assert (=> b!403790 (= res!232780 (arrayNoDuplicates!0 lt!188111 #b00000000000000000000000000000000 Nil!6611))))

(declare-fun mapNonEmpty!16878 () Bool)

(declare-fun mapRes!16878 () Bool)

(declare-fun tp!32991 () Bool)

(assert (=> mapNonEmpty!16878 (= mapRes!16878 (and tp!32991 e!243010))))

(declare-fun mapKey!16878 () (_ BitVec 32))

(declare-fun mapRest!16878 () (Array (_ BitVec 32) ValueCell!4742))

(declare-fun mapValue!16878 () ValueCell!4742)

(assert (=> mapNonEmpty!16878 (= (arr!11563 _values!549) (store mapRest!16878 mapKey!16878 mapValue!16878))))

(declare-fun b!403791 () Bool)

(assert (=> b!403791 (= e!243005 (= call!28519 call!28518))))

(declare-fun b!403792 () Bool)

(declare-fun res!232776 () Bool)

(assert (=> b!403792 (=> (not res!232776) (not e!243006))))

(assert (=> b!403792 (= res!232776 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11914 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!403793 () Bool)

(declare-fun res!232771 () Bool)

(assert (=> b!403793 (=> (not res!232771) (not e!243008))))

(assert (=> b!403793 (= res!232771 (or (= (select (arr!11562 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11562 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!16878 () Bool)

(assert (=> mapIsEmpty!16878 mapRes!16878))

(declare-fun b!403794 () Bool)

(assert (=> b!403794 (= e!243007 (and e!243009 mapRes!16878))))

(declare-fun condMapEmpty!16878 () Bool)

(declare-fun mapDefault!16878 () ValueCell!4742)

(assert (=> b!403794 (= condMapEmpty!16878 (= (arr!11563 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4742)) mapDefault!16878)))))

(declare-fun b!403795 () Bool)

(assert (=> b!403795 (= e!243006 (not true))))

(assert (=> b!403795 e!243005))

(assert (=> b!403795 (= c!54867 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12207 0))(
  ( (Unit!12208) )
))
(declare-fun lt!188112 () Unit!12207)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!371 (array!24226 array!24228 (_ BitVec 32) (_ BitVec 32) V!14667 V!14667 (_ BitVec 32) (_ BitVec 64) V!14667 (_ BitVec 32) Int) Unit!12207)

(assert (=> b!403795 (= lt!188112 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!371 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!38738 res!232777) b!403782))

(assert (= (and b!403782 res!232779) b!403781))

(assert (= (and b!403781 res!232775) b!403786))

(assert (= (and b!403786 res!232778) b!403779))

(assert (= (and b!403779 res!232781) b!403784))

(assert (= (and b!403784 res!232772) b!403780))

(assert (= (and b!403780 res!232773) b!403793))

(assert (= (and b!403793 res!232771) b!403789))

(assert (= (and b!403789 res!232774) b!403787))

(assert (= (and b!403787 res!232782) b!403790))

(assert (= (and b!403790 res!232780) b!403792))

(assert (= (and b!403792 res!232776) b!403795))

(assert (= (and b!403795 c!54867) b!403783))

(assert (= (and b!403795 (not c!54867)) b!403791))

(assert (= (or b!403783 b!403791) bm!28515))

(assert (= (or b!403783 b!403791) bm!28516))

(assert (= (and b!403794 condMapEmpty!16878) mapIsEmpty!16878))

(assert (= (and b!403794 (not condMapEmpty!16878)) mapNonEmpty!16878))

(get-info :version)

(assert (= (and mapNonEmpty!16878 ((_ is ValueCellFull!4742) mapValue!16878)) b!403785))

(assert (= (and b!403794 ((_ is ValueCellFull!4742) mapDefault!16878)) b!403788))

(assert (= start!38738 b!403794))

(declare-fun m!397119 () Bool)

(assert (=> b!403793 m!397119))

(declare-fun m!397121 () Bool)

(assert (=> mapNonEmpty!16878 m!397121))

(declare-fun m!397123 () Bool)

(assert (=> bm!28516 m!397123))

(declare-fun m!397125 () Bool)

(assert (=> bm!28516 m!397125))

(assert (=> bm!28515 m!397123))

(declare-fun m!397127 () Bool)

(assert (=> bm!28515 m!397127))

(declare-fun m!397129 () Bool)

(assert (=> b!403783 m!397129))

(declare-fun m!397131 () Bool)

(assert (=> b!403789 m!397131))

(declare-fun m!397133 () Bool)

(assert (=> b!403787 m!397133))

(declare-fun m!397135 () Bool)

(assert (=> b!403787 m!397135))

(declare-fun m!397137 () Bool)

(assert (=> b!403795 m!397137))

(declare-fun m!397139 () Bool)

(assert (=> b!403779 m!397139))

(declare-fun m!397141 () Bool)

(assert (=> b!403786 m!397141))

(declare-fun m!397143 () Bool)

(assert (=> b!403782 m!397143))

(declare-fun m!397145 () Bool)

(assert (=> start!38738 m!397145))

(declare-fun m!397147 () Bool)

(assert (=> start!38738 m!397147))

(declare-fun m!397149 () Bool)

(assert (=> b!403790 m!397149))

(declare-fun m!397151 () Bool)

(assert (=> b!403780 m!397151))

(check-sat (not b!403783) (not b!403786) (not b!403790) (not bm!28515) (not b!403779) b_and!16689 (not b!403780) tp_is_empty!10171 (not bm!28516) (not b!403787) (not b!403795) (not b!403789) (not b!403782) (not start!38738) (not mapNonEmpty!16878) (not b_next!9289))
(check-sat b_and!16689 (not b_next!9289))
