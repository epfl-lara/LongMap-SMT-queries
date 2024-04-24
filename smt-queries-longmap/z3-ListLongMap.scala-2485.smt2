; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38714 () Bool)

(assert start!38714)

(declare-fun b_free!9265 () Bool)

(declare-fun b_next!9265 () Bool)

(assert (=> start!38714 (= b_free!9265 (not b_next!9265))))

(declare-fun tp!32919 () Bool)

(declare-fun b_and!16665 () Bool)

(assert (=> start!38714 (= tp!32919 b_and!16665)))

(declare-fun b!403167 () Bool)

(declare-datatypes ((V!14635 0))(
  ( (V!14636 (val!5118 Int)) )
))
(declare-datatypes ((tuple2!6672 0))(
  ( (tuple2!6673 (_1!3347 (_ BitVec 64)) (_2!3347 V!14635)) )
))
(declare-datatypes ((List!6593 0))(
  ( (Nil!6590) (Cons!6589 (h!7445 tuple2!6672) (t!11759 List!6593)) )
))
(declare-datatypes ((ListLongMap!5587 0))(
  ( (ListLongMap!5588 (toList!2809 List!6593)) )
))
(declare-fun call!28447 () ListLongMap!5587)

(declare-fun e!242754 () Bool)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun call!28446 () ListLongMap!5587)

(declare-fun v!412 () V!14635)

(declare-fun +!1150 (ListLongMap!5587 tuple2!6672) ListLongMap!5587)

(assert (=> b!403167 (= e!242754 (= call!28447 (+!1150 call!28446 (tuple2!6673 k0!794 v!412))))))

(declare-fun b!403168 () Bool)

(declare-fun res!232350 () Bool)

(declare-fun e!242752 () Bool)

(assert (=> b!403168 (=> (not res!232350) (not e!242752))))

(declare-datatypes ((array!24178 0))(
  ( (array!24179 (arr!11538 (Array (_ BitVec 32) (_ BitVec 64))) (size!11890 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24178)

(declare-fun arrayContainsKey!0 (array!24178 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!403168 (= res!232350 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!403169 () Bool)

(declare-fun e!242755 () Bool)

(assert (=> b!403169 (= e!242755 (not true))))

(assert (=> b!403169 e!242754))

(declare-fun c!54831 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!403169 (= c!54831 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!14635)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((Unit!12189 0))(
  ( (Unit!12190) )
))
(declare-fun lt!188039 () Unit!12189)

(declare-datatypes ((ValueCell!4730 0))(
  ( (ValueCellFull!4730 (v!7366 V!14635)) (EmptyCell!4730) )
))
(declare-datatypes ((array!24180 0))(
  ( (array!24181 (arr!11539 (Array (_ BitVec 32) ValueCell!4730)) (size!11891 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24180)

(declare-fun zeroValue!515 () V!14635)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!362 (array!24178 array!24180 (_ BitVec 32) (_ BitVec 32) V!14635 V!14635 (_ BitVec 32) (_ BitVec 64) V!14635 (_ BitVec 32) Int) Unit!12189)

(assert (=> b!403169 (= lt!188039 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!362 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!16842 () Bool)

(declare-fun mapRes!16842 () Bool)

(assert (=> mapIsEmpty!16842 mapRes!16842))

(declare-fun b!403170 () Bool)

(assert (=> b!403170 (= e!242752 e!242755)))

(declare-fun res!232344 () Bool)

(assert (=> b!403170 (=> (not res!232344) (not e!242755))))

(declare-fun lt!188040 () array!24178)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24178 (_ BitVec 32)) Bool)

(assert (=> b!403170 (= res!232344 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188040 mask!1025))))

(assert (=> b!403170 (= lt!188040 (array!24179 (store (arr!11538 _keys!709) i!563 k0!794) (size!11890 _keys!709)))))

(declare-fun b!403171 () Bool)

(declare-fun res!232348 () Bool)

(assert (=> b!403171 (=> (not res!232348) (not e!242755))))

(assert (=> b!403171 (= res!232348 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11890 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!403172 () Bool)

(declare-fun res!232349 () Bool)

(assert (=> b!403172 (=> (not res!232349) (not e!242752))))

(assert (=> b!403172 (= res!232349 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11890 _keys!709))))))

(declare-fun b!403173 () Bool)

(assert (=> b!403173 (= e!242754 (= call!28446 call!28447))))

(declare-fun b!403174 () Bool)

(declare-fun res!232340 () Bool)

(assert (=> b!403174 (=> (not res!232340) (not e!242752))))

(assert (=> b!403174 (= res!232340 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun bm!28443 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1063 (array!24178 array!24180 (_ BitVec 32) (_ BitVec 32) V!14635 V!14635 (_ BitVec 32) Int) ListLongMap!5587)

(assert (=> bm!28443 (= call!28447 (getCurrentListMapNoExtraKeys!1063 (ite c!54831 lt!188040 _keys!709) (ite c!54831 (array!24181 (store (arr!11539 _values!549) i!563 (ValueCellFull!4730 v!412)) (size!11891 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!403175 () Bool)

(declare-fun res!232342 () Bool)

(assert (=> b!403175 (=> (not res!232342) (not e!242752))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!403175 (= res!232342 (validKeyInArray!0 k0!794))))

(declare-fun b!403176 () Bool)

(declare-fun res!232343 () Bool)

(assert (=> b!403176 (=> (not res!232343) (not e!242755))))

(declare-datatypes ((List!6594 0))(
  ( (Nil!6591) (Cons!6590 (h!7446 (_ BitVec 64)) (t!11760 List!6594)) )
))
(declare-fun arrayNoDuplicates!0 (array!24178 (_ BitVec 32) List!6594) Bool)

(assert (=> b!403176 (= res!232343 (arrayNoDuplicates!0 lt!188040 #b00000000000000000000000000000000 Nil!6591))))

(declare-fun b!403177 () Bool)

(declare-fun res!232345 () Bool)

(assert (=> b!403177 (=> (not res!232345) (not e!242752))))

(assert (=> b!403177 (= res!232345 (or (= (select (arr!11538 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11538 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!28444 () Bool)

(assert (=> bm!28444 (= call!28446 (getCurrentListMapNoExtraKeys!1063 (ite c!54831 _keys!709 lt!188040) (ite c!54831 _values!549 (array!24181 (store (arr!11539 _values!549) i!563 (ValueCellFull!4730 v!412)) (size!11891 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!16842 () Bool)

(declare-fun tp!32918 () Bool)

(declare-fun e!242758 () Bool)

(assert (=> mapNonEmpty!16842 (= mapRes!16842 (and tp!32918 e!242758))))

(declare-fun mapKey!16842 () (_ BitVec 32))

(declare-fun mapValue!16842 () ValueCell!4730)

(declare-fun mapRest!16842 () (Array (_ BitVec 32) ValueCell!4730))

(assert (=> mapNonEmpty!16842 (= (arr!11539 _values!549) (store mapRest!16842 mapKey!16842 mapValue!16842))))

(declare-fun res!232347 () Bool)

(assert (=> start!38714 (=> (not res!232347) (not e!242752))))

(assert (=> start!38714 (= res!232347 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11890 _keys!709))))))

(assert (=> start!38714 e!242752))

(declare-fun tp_is_empty!10147 () Bool)

(assert (=> start!38714 tp_is_empty!10147))

(assert (=> start!38714 tp!32919))

(assert (=> start!38714 true))

(declare-fun e!242753 () Bool)

(declare-fun array_inv!8522 (array!24180) Bool)

(assert (=> start!38714 (and (array_inv!8522 _values!549) e!242753)))

(declare-fun array_inv!8523 (array!24178) Bool)

(assert (=> start!38714 (array_inv!8523 _keys!709)))

(declare-fun b!403178 () Bool)

(declare-fun res!232339 () Bool)

(assert (=> b!403178 (=> (not res!232339) (not e!242752))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!403178 (= res!232339 (validMask!0 mask!1025))))

(declare-fun b!403179 () Bool)

(declare-fun e!242757 () Bool)

(assert (=> b!403179 (= e!242757 tp_is_empty!10147)))

(declare-fun b!403180 () Bool)

(declare-fun res!232341 () Bool)

(assert (=> b!403180 (=> (not res!232341) (not e!242752))))

(assert (=> b!403180 (= res!232341 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6591))))

(declare-fun b!403181 () Bool)

(assert (=> b!403181 (= e!242753 (and e!242757 mapRes!16842))))

(declare-fun condMapEmpty!16842 () Bool)

(declare-fun mapDefault!16842 () ValueCell!4730)

(assert (=> b!403181 (= condMapEmpty!16842 (= (arr!11539 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4730)) mapDefault!16842)))))

(declare-fun b!403182 () Bool)

(declare-fun res!232346 () Bool)

(assert (=> b!403182 (=> (not res!232346) (not e!242752))))

(assert (=> b!403182 (= res!232346 (and (= (size!11891 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11890 _keys!709) (size!11891 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!403183 () Bool)

(assert (=> b!403183 (= e!242758 tp_is_empty!10147)))

(assert (= (and start!38714 res!232347) b!403178))

(assert (= (and b!403178 res!232339) b!403182))

(assert (= (and b!403182 res!232346) b!403174))

(assert (= (and b!403174 res!232340) b!403180))

(assert (= (and b!403180 res!232341) b!403172))

(assert (= (and b!403172 res!232349) b!403175))

(assert (= (and b!403175 res!232342) b!403177))

(assert (= (and b!403177 res!232345) b!403168))

(assert (= (and b!403168 res!232350) b!403170))

(assert (= (and b!403170 res!232344) b!403176))

(assert (= (and b!403176 res!232343) b!403171))

(assert (= (and b!403171 res!232348) b!403169))

(assert (= (and b!403169 c!54831) b!403167))

(assert (= (and b!403169 (not c!54831)) b!403173))

(assert (= (or b!403167 b!403173) bm!28443))

(assert (= (or b!403167 b!403173) bm!28444))

(assert (= (and b!403181 condMapEmpty!16842) mapIsEmpty!16842))

(assert (= (and b!403181 (not condMapEmpty!16842)) mapNonEmpty!16842))

(get-info :version)

(assert (= (and mapNonEmpty!16842 ((_ is ValueCellFull!4730) mapValue!16842)) b!403183))

(assert (= (and b!403181 ((_ is ValueCellFull!4730) mapDefault!16842)) b!403179))

(assert (= start!38714 b!403181))

(declare-fun m!396711 () Bool)

(assert (=> bm!28444 m!396711))

(declare-fun m!396713 () Bool)

(assert (=> bm!28444 m!396713))

(declare-fun m!396715 () Bool)

(assert (=> b!403176 m!396715))

(assert (=> bm!28443 m!396711))

(declare-fun m!396717 () Bool)

(assert (=> bm!28443 m!396717))

(declare-fun m!396719 () Bool)

(assert (=> mapNonEmpty!16842 m!396719))

(declare-fun m!396721 () Bool)

(assert (=> b!403168 m!396721))

(declare-fun m!396723 () Bool)

(assert (=> b!403175 m!396723))

(declare-fun m!396725 () Bool)

(assert (=> start!38714 m!396725))

(declare-fun m!396727 () Bool)

(assert (=> start!38714 m!396727))

(declare-fun m!396729 () Bool)

(assert (=> b!403177 m!396729))

(declare-fun m!396731 () Bool)

(assert (=> b!403174 m!396731))

(declare-fun m!396733 () Bool)

(assert (=> b!403169 m!396733))

(declare-fun m!396735 () Bool)

(assert (=> b!403180 m!396735))

(declare-fun m!396737 () Bool)

(assert (=> b!403170 m!396737))

(declare-fun m!396739 () Bool)

(assert (=> b!403170 m!396739))

(declare-fun m!396741 () Bool)

(assert (=> b!403167 m!396741))

(declare-fun m!396743 () Bool)

(assert (=> b!403178 m!396743))

(check-sat (not b!403169) (not b!403167) b_and!16665 (not b!403176) (not bm!28443) tp_is_empty!10147 (not b!403168) (not b!403170) (not b!403174) (not mapNonEmpty!16842) (not b_next!9265) (not b!403175) (not b!403178) (not start!38714) (not b!403180) (not bm!28444))
(check-sat b_and!16665 (not b_next!9265))
