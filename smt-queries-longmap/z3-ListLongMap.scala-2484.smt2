; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38724 () Bool)

(assert start!38724)

(declare-fun b_free!9261 () Bool)

(declare-fun b_next!9261 () Bool)

(assert (=> start!38724 (= b_free!9261 (not b_next!9261))))

(declare-fun tp!32906 () Bool)

(declare-fun b_and!16647 () Bool)

(assert (=> start!38724 (= tp!32906 b_and!16647)))

(declare-fun b!403114 () Bool)

(declare-fun res!232277 () Bool)

(declare-fun e!242747 () Bool)

(assert (=> b!403114 (=> (not res!232277) (not e!242747))))

(declare-datatypes ((array!24191 0))(
  ( (array!24192 (arr!11545 (Array (_ BitVec 32) (_ BitVec 64))) (size!11897 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24191)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24191 (_ BitVec 32)) Bool)

(assert (=> b!403114 (= res!232277 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!403115 () Bool)

(declare-fun res!232279 () Bool)

(assert (=> b!403115 (=> (not res!232279) (not e!242747))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14629 0))(
  ( (V!14630 (val!5116 Int)) )
))
(declare-datatypes ((ValueCell!4728 0))(
  ( (ValueCellFull!4728 (v!7363 V!14629)) (EmptyCell!4728) )
))
(declare-datatypes ((array!24193 0))(
  ( (array!24194 (arr!11546 (Array (_ BitVec 32) ValueCell!4728)) (size!11898 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24193)

(assert (=> b!403115 (= res!232279 (and (= (size!11898 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11897 _keys!709) (size!11898 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!16836 () Bool)

(declare-fun mapRes!16836 () Bool)

(declare-fun tp!32907 () Bool)

(declare-fun e!242746 () Bool)

(assert (=> mapNonEmpty!16836 (= mapRes!16836 (and tp!32907 e!242746))))

(declare-fun mapKey!16836 () (_ BitVec 32))

(declare-fun mapRest!16836 () (Array (_ BitVec 32) ValueCell!4728))

(declare-fun mapValue!16836 () ValueCell!4728)

(assert (=> mapNonEmpty!16836 (= (arr!11546 _values!549) (store mapRest!16836 mapKey!16836 mapValue!16836))))

(declare-fun mapIsEmpty!16836 () Bool)

(assert (=> mapIsEmpty!16836 mapRes!16836))

(declare-fun b!403116 () Bool)

(declare-fun res!232275 () Bool)

(assert (=> b!403116 (=> (not res!232275) (not e!242747))))

(declare-datatypes ((List!6719 0))(
  ( (Nil!6716) (Cons!6715 (h!7571 (_ BitVec 64)) (t!11893 List!6719)) )
))
(declare-fun arrayNoDuplicates!0 (array!24191 (_ BitVec 32) List!6719) Bool)

(assert (=> b!403116 (= res!232275 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6716))))

(declare-fun b!403117 () Bool)

(declare-fun res!232273 () Bool)

(assert (=> b!403117 (=> (not res!232273) (not e!242747))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!403117 (= res!232273 (or (= (select (arr!11545 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11545 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!403118 () Bool)

(declare-fun res!232281 () Bool)

(declare-fun e!242745 () Bool)

(assert (=> b!403118 (=> (not res!232281) (not e!242745))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!403118 (= res!232281 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11897 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!403119 () Bool)

(declare-fun res!232278 () Bool)

(assert (=> b!403119 (=> (not res!232278) (not e!242747))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!403119 (= res!232278 (validMask!0 mask!1025))))

(declare-fun b!403120 () Bool)

(declare-fun res!232274 () Bool)

(assert (=> b!403120 (=> (not res!232274) (not e!242747))))

(assert (=> b!403120 (= res!232274 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11897 _keys!709))))))

(declare-datatypes ((tuple2!6798 0))(
  ( (tuple2!6799 (_1!3410 (_ BitVec 64)) (_2!3410 V!14629)) )
))
(declare-datatypes ((List!6720 0))(
  ( (Nil!6717) (Cons!6716 (h!7572 tuple2!6798) (t!11894 List!6720)) )
))
(declare-datatypes ((ListLongMap!5711 0))(
  ( (ListLongMap!5712 (toList!2871 List!6720)) )
))
(declare-fun call!28448 () ListLongMap!5711)

(declare-fun lt!188008 () array!24191)

(declare-fun minValue!515 () V!14629)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!14629)

(declare-fun c!54848 () Bool)

(declare-fun v!412 () V!14629)

(declare-fun bm!28444 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1081 (array!24191 array!24193 (_ BitVec 32) (_ BitVec 32) V!14629 V!14629 (_ BitVec 32) Int) ListLongMap!5711)

(assert (=> bm!28444 (= call!28448 (getCurrentListMapNoExtraKeys!1081 (ite c!54848 _keys!709 lt!188008) (ite c!54848 _values!549 (array!24194 (store (arr!11546 _values!549) i!563 (ValueCellFull!4728 v!412)) (size!11898 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!403121 () Bool)

(declare-fun e!242743 () Bool)

(declare-fun call!28447 () ListLongMap!5711)

(assert (=> b!403121 (= e!242743 (= call!28448 call!28447))))

(declare-fun b!403122 () Bool)

(declare-fun tp_is_empty!10143 () Bool)

(assert (=> b!403122 (= e!242746 tp_is_empty!10143)))

(declare-fun b!403123 () Bool)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun +!1147 (ListLongMap!5711 tuple2!6798) ListLongMap!5711)

(assert (=> b!403123 (= e!242743 (= call!28447 (+!1147 call!28448 (tuple2!6799 k0!794 v!412))))))

(declare-fun b!403124 () Bool)

(declare-fun e!242742 () Bool)

(assert (=> b!403124 (= e!242742 tp_is_empty!10143)))

(declare-fun b!403125 () Bool)

(assert (=> b!403125 (= e!242747 e!242745)))

(declare-fun res!232276 () Bool)

(assert (=> b!403125 (=> (not res!232276) (not e!242745))))

(assert (=> b!403125 (= res!232276 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188008 mask!1025))))

(assert (=> b!403125 (= lt!188008 (array!24192 (store (arr!11545 _keys!709) i!563 k0!794) (size!11897 _keys!709)))))

(declare-fun res!232270 () Bool)

(assert (=> start!38724 (=> (not res!232270) (not e!242747))))

(assert (=> start!38724 (= res!232270 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11897 _keys!709))))))

(assert (=> start!38724 e!242747))

(assert (=> start!38724 tp_is_empty!10143))

(assert (=> start!38724 tp!32906))

(assert (=> start!38724 true))

(declare-fun e!242744 () Bool)

(declare-fun array_inv!8448 (array!24193) Bool)

(assert (=> start!38724 (and (array_inv!8448 _values!549) e!242744)))

(declare-fun array_inv!8449 (array!24191) Bool)

(assert (=> start!38724 (array_inv!8449 _keys!709)))

(declare-fun bm!28445 () Bool)

(assert (=> bm!28445 (= call!28447 (getCurrentListMapNoExtraKeys!1081 (ite c!54848 lt!188008 _keys!709) (ite c!54848 (array!24194 (store (arr!11546 _values!549) i!563 (ValueCellFull!4728 v!412)) (size!11898 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!403126 () Bool)

(assert (=> b!403126 (= e!242744 (and e!242742 mapRes!16836))))

(declare-fun condMapEmpty!16836 () Bool)

(declare-fun mapDefault!16836 () ValueCell!4728)

(assert (=> b!403126 (= condMapEmpty!16836 (= (arr!11546 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4728)) mapDefault!16836)))))

(declare-fun b!403127 () Bool)

(assert (=> b!403127 (= e!242745 (not true))))

(assert (=> b!403127 e!242743))

(assert (=> b!403127 (= c!54848 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12200 0))(
  ( (Unit!12201) )
))
(declare-fun lt!188009 () Unit!12200)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!358 (array!24191 array!24193 (_ BitVec 32) (_ BitVec 32) V!14629 V!14629 (_ BitVec 32) (_ BitVec 64) V!14629 (_ BitVec 32) Int) Unit!12200)

(assert (=> b!403127 (= lt!188009 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!358 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!403128 () Bool)

(declare-fun res!232272 () Bool)

(assert (=> b!403128 (=> (not res!232272) (not e!242747))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!403128 (= res!232272 (validKeyInArray!0 k0!794))))

(declare-fun b!403129 () Bool)

(declare-fun res!232271 () Bool)

(assert (=> b!403129 (=> (not res!232271) (not e!242745))))

(assert (=> b!403129 (= res!232271 (arrayNoDuplicates!0 lt!188008 #b00000000000000000000000000000000 Nil!6716))))

(declare-fun b!403130 () Bool)

(declare-fun res!232280 () Bool)

(assert (=> b!403130 (=> (not res!232280) (not e!242747))))

(declare-fun arrayContainsKey!0 (array!24191 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!403130 (= res!232280 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!38724 res!232270) b!403119))

(assert (= (and b!403119 res!232278) b!403115))

(assert (= (and b!403115 res!232279) b!403114))

(assert (= (and b!403114 res!232277) b!403116))

(assert (= (and b!403116 res!232275) b!403120))

(assert (= (and b!403120 res!232274) b!403128))

(assert (= (and b!403128 res!232272) b!403117))

(assert (= (and b!403117 res!232273) b!403130))

(assert (= (and b!403130 res!232280) b!403125))

(assert (= (and b!403125 res!232276) b!403129))

(assert (= (and b!403129 res!232271) b!403118))

(assert (= (and b!403118 res!232281) b!403127))

(assert (= (and b!403127 c!54848) b!403123))

(assert (= (and b!403127 (not c!54848)) b!403121))

(assert (= (or b!403123 b!403121) bm!28445))

(assert (= (or b!403123 b!403121) bm!28444))

(assert (= (and b!403126 condMapEmpty!16836) mapIsEmpty!16836))

(assert (= (and b!403126 (not condMapEmpty!16836)) mapNonEmpty!16836))

(get-info :version)

(assert (= (and mapNonEmpty!16836 ((_ is ValueCellFull!4728) mapValue!16836)) b!403122))

(assert (= (and b!403126 ((_ is ValueCellFull!4728) mapDefault!16836)) b!403124))

(assert (= start!38724 b!403126))

(declare-fun m!396413 () Bool)

(assert (=> b!403125 m!396413))

(declare-fun m!396415 () Bool)

(assert (=> b!403125 m!396415))

(declare-fun m!396417 () Bool)

(assert (=> b!403129 m!396417))

(declare-fun m!396419 () Bool)

(assert (=> mapNonEmpty!16836 m!396419))

(declare-fun m!396421 () Bool)

(assert (=> b!403116 m!396421))

(declare-fun m!396423 () Bool)

(assert (=> b!403130 m!396423))

(declare-fun m!396425 () Bool)

(assert (=> bm!28445 m!396425))

(declare-fun m!396427 () Bool)

(assert (=> bm!28445 m!396427))

(declare-fun m!396429 () Bool)

(assert (=> b!403127 m!396429))

(declare-fun m!396431 () Bool)

(assert (=> b!403119 m!396431))

(declare-fun m!396433 () Bool)

(assert (=> start!38724 m!396433))

(declare-fun m!396435 () Bool)

(assert (=> start!38724 m!396435))

(declare-fun m!396437 () Bool)

(assert (=> b!403117 m!396437))

(assert (=> bm!28444 m!396425))

(declare-fun m!396439 () Bool)

(assert (=> bm!28444 m!396439))

(declare-fun m!396441 () Bool)

(assert (=> b!403123 m!396441))

(declare-fun m!396443 () Bool)

(assert (=> b!403114 m!396443))

(declare-fun m!396445 () Bool)

(assert (=> b!403128 m!396445))

(check-sat (not b_next!9261) (not b!403114) (not mapNonEmpty!16836) (not bm!28444) (not b!403125) (not start!38724) b_and!16647 (not b!403127) (not bm!28445) (not b!403116) (not b!403123) (not b!403128) (not b!403119) (not b!403129) tp_is_empty!10143 (not b!403130))
(check-sat b_and!16647 (not b_next!9261))
