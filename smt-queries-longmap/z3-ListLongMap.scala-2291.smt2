; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37210 () Bool)

(assert start!37210)

(declare-fun b_free!8337 () Bool)

(declare-fun b_next!8337 () Bool)

(assert (=> start!37210 (= b_free!8337 (not b_next!8337))))

(declare-fun tp!29727 () Bool)

(declare-fun b_and!15579 () Bool)

(assert (=> start!37210 (= tp!29727 b_and!15579)))

(declare-fun b!376026 () Bool)

(declare-fun res!212424 () Bool)

(declare-fun e!229041 () Bool)

(assert (=> b!376026 (=> (not res!212424) (not e!229041))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!21903 0))(
  ( (array!21904 (arr!10420 (Array (_ BitVec 32) (_ BitVec 64))) (size!10772 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21903)

(assert (=> b!376026 (= res!212424 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10772 _keys!658))))))

(declare-fun mapNonEmpty!15042 () Bool)

(declare-fun mapRes!15042 () Bool)

(declare-fun tp!29726 () Bool)

(declare-fun e!229039 () Bool)

(assert (=> mapNonEmpty!15042 (= mapRes!15042 (and tp!29726 e!229039))))

(declare-datatypes ((V!13085 0))(
  ( (V!13086 (val!4537 Int)) )
))
(declare-datatypes ((ValueCell!4149 0))(
  ( (ValueCellFull!4149 (v!6734 V!13085)) (EmptyCell!4149) )
))
(declare-datatypes ((array!21905 0))(
  ( (array!21906 (arr!10421 (Array (_ BitVec 32) ValueCell!4149)) (size!10773 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21905)

(declare-fun mapRest!15042 () (Array (_ BitVec 32) ValueCell!4149))

(declare-fun mapValue!15042 () ValueCell!4149)

(declare-fun mapKey!15042 () (_ BitVec 32))

(assert (=> mapNonEmpty!15042 (= (arr!10421 _values!506) (store mapRest!15042 mapKey!15042 mapValue!15042))))

(declare-fun b!376027 () Bool)

(declare-fun res!212415 () Bool)

(declare-fun e!229040 () Bool)

(assert (=> b!376027 (=> (not res!212415) (not e!229040))))

(declare-fun lt!174273 () array!21903)

(declare-datatypes ((List!5882 0))(
  ( (Nil!5879) (Cons!5878 (h!6734 (_ BitVec 64)) (t!11032 List!5882)) )
))
(declare-fun arrayNoDuplicates!0 (array!21903 (_ BitVec 32) List!5882) Bool)

(assert (=> b!376027 (= res!212415 (arrayNoDuplicates!0 lt!174273 #b00000000000000000000000000000000 Nil!5879))))

(declare-fun b!376028 () Bool)

(declare-fun e!229043 () Bool)

(assert (=> b!376028 (= e!229043 true)))

(declare-datatypes ((tuple2!6040 0))(
  ( (tuple2!6041 (_1!3031 (_ BitVec 64)) (_2!3031 V!13085)) )
))
(declare-datatypes ((List!5883 0))(
  ( (Nil!5880) (Cons!5879 (h!6735 tuple2!6040) (t!11033 List!5883)) )
))
(declare-datatypes ((ListLongMap!4953 0))(
  ( (ListLongMap!4954 (toList!2492 List!5883)) )
))
(declare-fun lt!174281 () ListLongMap!4953)

(declare-fun lt!174279 () ListLongMap!4953)

(declare-fun lt!174280 () tuple2!6040)

(declare-fun +!838 (ListLongMap!4953 tuple2!6040) ListLongMap!4953)

(assert (=> b!376028 (= lt!174281 (+!838 lt!174279 lt!174280))))

(declare-fun v!373 () V!13085)

(declare-datatypes ((Unit!11582 0))(
  ( (Unit!11583) )
))
(declare-fun lt!174277 () Unit!11582)

(declare-fun lt!174278 () ListLongMap!4953)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun zeroValue!472 () V!13085)

(declare-fun addCommutativeForDiffKeys!254 (ListLongMap!4953 (_ BitVec 64) V!13085 (_ BitVec 64) V!13085) Unit!11582)

(assert (=> b!376028 (= lt!174277 (addCommutativeForDiffKeys!254 lt!174278 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun res!212420 () Bool)

(assert (=> start!37210 (=> (not res!212420) (not e!229041))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37210 (= res!212420 (validMask!0 mask!970))))

(assert (=> start!37210 e!229041))

(declare-fun e!229044 () Bool)

(declare-fun array_inv!7682 (array!21905) Bool)

(assert (=> start!37210 (and (array_inv!7682 _values!506) e!229044)))

(assert (=> start!37210 tp!29727))

(assert (=> start!37210 true))

(declare-fun tp_is_empty!8985 () Bool)

(assert (=> start!37210 tp_is_empty!8985))

(declare-fun array_inv!7683 (array!21903) Bool)

(assert (=> start!37210 (array_inv!7683 _keys!658)))

(declare-fun b!376029 () Bool)

(declare-fun res!212422 () Bool)

(assert (=> b!376029 (=> (not res!212422) (not e!229041))))

(assert (=> b!376029 (= res!212422 (or (= (select (arr!10420 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10420 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!376030 () Bool)

(declare-fun res!212419 () Bool)

(assert (=> b!376030 (=> (not res!212419) (not e!229041))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!376030 (= res!212419 (validKeyInArray!0 k0!778))))

(declare-fun b!376031 () Bool)

(assert (=> b!376031 (= e!229039 tp_is_empty!8985)))

(declare-fun b!376032 () Bool)

(declare-fun res!212418 () Bool)

(assert (=> b!376032 (=> (not res!212418) (not e!229041))))

(declare-fun arrayContainsKey!0 (array!21903 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!376032 (= res!212418 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!376033 () Bool)

(declare-fun e!229045 () Bool)

(assert (=> b!376033 (= e!229040 (not e!229045))))

(declare-fun res!212423 () Bool)

(assert (=> b!376033 (=> res!212423 e!229045)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!376033 (= res!212423 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!174276 () ListLongMap!4953)

(declare-fun minValue!472 () V!13085)

(declare-fun getCurrentListMap!1926 (array!21903 array!21905 (_ BitVec 32) (_ BitVec 32) V!13085 V!13085 (_ BitVec 32) Int) ListLongMap!4953)

(assert (=> b!376033 (= lt!174276 (getCurrentListMap!1926 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174270 () ListLongMap!4953)

(declare-fun lt!174275 () array!21905)

(assert (=> b!376033 (= lt!174270 (getCurrentListMap!1926 lt!174273 lt!174275 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174282 () ListLongMap!4953)

(declare-fun lt!174272 () ListLongMap!4953)

(assert (=> b!376033 (and (= lt!174282 lt!174272) (= lt!174272 lt!174282))))

(assert (=> b!376033 (= lt!174272 (+!838 lt!174278 lt!174280))))

(assert (=> b!376033 (= lt!174280 (tuple2!6041 k0!778 v!373))))

(declare-fun lt!174271 () Unit!11582)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!84 (array!21903 array!21905 (_ BitVec 32) (_ BitVec 32) V!13085 V!13085 (_ BitVec 32) (_ BitVec 64) V!13085 (_ BitVec 32) Int) Unit!11582)

(assert (=> b!376033 (= lt!174271 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!84 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!760 (array!21903 array!21905 (_ BitVec 32) (_ BitVec 32) V!13085 V!13085 (_ BitVec 32) Int) ListLongMap!4953)

(assert (=> b!376033 (= lt!174282 (getCurrentListMapNoExtraKeys!760 lt!174273 lt!174275 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!376033 (= lt!174275 (array!21906 (store (arr!10421 _values!506) i!548 (ValueCellFull!4149 v!373)) (size!10773 _values!506)))))

(assert (=> b!376033 (= lt!174278 (getCurrentListMapNoExtraKeys!760 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapIsEmpty!15042 () Bool)

(assert (=> mapIsEmpty!15042 mapRes!15042))

(declare-fun b!376034 () Bool)

(declare-fun res!212416 () Bool)

(assert (=> b!376034 (=> (not res!212416) (not e!229041))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21903 (_ BitVec 32)) Bool)

(assert (=> b!376034 (= res!212416 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!376035 () Bool)

(assert (=> b!376035 (= e!229041 e!229040)))

(declare-fun res!212417 () Bool)

(assert (=> b!376035 (=> (not res!212417) (not e!229040))))

(assert (=> b!376035 (= res!212417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!174273 mask!970))))

(assert (=> b!376035 (= lt!174273 (array!21904 (store (arr!10420 _keys!658) i!548 k0!778) (size!10772 _keys!658)))))

(declare-fun b!376036 () Bool)

(declare-fun e!229042 () Bool)

(assert (=> b!376036 (= e!229042 tp_is_empty!8985)))

(declare-fun b!376037 () Bool)

(declare-fun res!212426 () Bool)

(assert (=> b!376037 (=> (not res!212426) (not e!229041))))

(assert (=> b!376037 (= res!212426 (and (= (size!10773 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10772 _keys!658) (size!10773 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!376038 () Bool)

(declare-fun res!212425 () Bool)

(assert (=> b!376038 (=> (not res!212425) (not e!229041))))

(assert (=> b!376038 (= res!212425 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5879))))

(declare-fun b!376039 () Bool)

(assert (=> b!376039 (= e!229045 e!229043)))

(declare-fun res!212421 () Bool)

(assert (=> b!376039 (=> res!212421 e!229043)))

(assert (=> b!376039 (= res!212421 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!376039 (= lt!174270 lt!174281)))

(declare-fun lt!174274 () tuple2!6040)

(assert (=> b!376039 (= lt!174281 (+!838 lt!174272 lt!174274))))

(assert (=> b!376039 (= lt!174276 lt!174279)))

(assert (=> b!376039 (= lt!174279 (+!838 lt!174278 lt!174274))))

(assert (=> b!376039 (= lt!174270 (+!838 lt!174282 lt!174274))))

(assert (=> b!376039 (= lt!174274 (tuple2!6041 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!376040 () Bool)

(assert (=> b!376040 (= e!229044 (and e!229042 mapRes!15042))))

(declare-fun condMapEmpty!15042 () Bool)

(declare-fun mapDefault!15042 () ValueCell!4149)

(assert (=> b!376040 (= condMapEmpty!15042 (= (arr!10421 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4149)) mapDefault!15042)))))

(assert (= (and start!37210 res!212420) b!376037))

(assert (= (and b!376037 res!212426) b!376034))

(assert (= (and b!376034 res!212416) b!376038))

(assert (= (and b!376038 res!212425) b!376026))

(assert (= (and b!376026 res!212424) b!376030))

(assert (= (and b!376030 res!212419) b!376029))

(assert (= (and b!376029 res!212422) b!376032))

(assert (= (and b!376032 res!212418) b!376035))

(assert (= (and b!376035 res!212417) b!376027))

(assert (= (and b!376027 res!212415) b!376033))

(assert (= (and b!376033 (not res!212423)) b!376039))

(assert (= (and b!376039 (not res!212421)) b!376028))

(assert (= (and b!376040 condMapEmpty!15042) mapIsEmpty!15042))

(assert (= (and b!376040 (not condMapEmpty!15042)) mapNonEmpty!15042))

(get-info :version)

(assert (= (and mapNonEmpty!15042 ((_ is ValueCellFull!4149) mapValue!15042)) b!376031))

(assert (= (and b!376040 ((_ is ValueCellFull!4149) mapDefault!15042)) b!376036))

(assert (= start!37210 b!376040))

(declare-fun m!372699 () Bool)

(assert (=> b!376039 m!372699))

(declare-fun m!372701 () Bool)

(assert (=> b!376039 m!372701))

(declare-fun m!372703 () Bool)

(assert (=> b!376039 m!372703))

(declare-fun m!372705 () Bool)

(assert (=> b!376028 m!372705))

(declare-fun m!372707 () Bool)

(assert (=> b!376028 m!372707))

(declare-fun m!372709 () Bool)

(assert (=> b!376035 m!372709))

(declare-fun m!372711 () Bool)

(assert (=> b!376035 m!372711))

(declare-fun m!372713 () Bool)

(assert (=> b!376033 m!372713))

(declare-fun m!372715 () Bool)

(assert (=> b!376033 m!372715))

(declare-fun m!372717 () Bool)

(assert (=> b!376033 m!372717))

(declare-fun m!372719 () Bool)

(assert (=> b!376033 m!372719))

(declare-fun m!372721 () Bool)

(assert (=> b!376033 m!372721))

(declare-fun m!372723 () Bool)

(assert (=> b!376033 m!372723))

(declare-fun m!372725 () Bool)

(assert (=> b!376033 m!372725))

(declare-fun m!372727 () Bool)

(assert (=> b!376030 m!372727))

(declare-fun m!372729 () Bool)

(assert (=> b!376038 m!372729))

(declare-fun m!372731 () Bool)

(assert (=> b!376027 m!372731))

(declare-fun m!372733 () Bool)

(assert (=> start!37210 m!372733))

(declare-fun m!372735 () Bool)

(assert (=> start!37210 m!372735))

(declare-fun m!372737 () Bool)

(assert (=> start!37210 m!372737))

(declare-fun m!372739 () Bool)

(assert (=> mapNonEmpty!15042 m!372739))

(declare-fun m!372741 () Bool)

(assert (=> b!376032 m!372741))

(declare-fun m!372743 () Bool)

(assert (=> b!376034 m!372743))

(declare-fun m!372745 () Bool)

(assert (=> b!376029 m!372745))

(check-sat (not b!376035) (not b!376034) (not b!376027) (not start!37210) (not b!376028) (not b!376038) (not b!376032) (not b!376030) (not mapNonEmpty!15042) (not b!376033) (not b_next!8337) tp_is_empty!8985 (not b!376039) b_and!15579)
(check-sat b_and!15579 (not b_next!8337))
