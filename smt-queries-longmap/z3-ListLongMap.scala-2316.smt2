; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37360 () Bool)

(assert start!37360)

(declare-fun b_free!8487 () Bool)

(declare-fun b_next!8487 () Bool)

(assert (=> start!37360 (= b_free!8487 (not b_next!8487))))

(declare-fun tp!30177 () Bool)

(declare-fun b_and!15729 () Bool)

(assert (=> start!37360 (= tp!30177 b_and!15729)))

(declare-fun res!215128 () Bool)

(declare-fun e!230844 () Bool)

(assert (=> start!37360 (=> (not res!215128) (not e!230844))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37360 (= res!215128 (validMask!0 mask!970))))

(assert (=> start!37360 e!230844))

(declare-datatypes ((V!13285 0))(
  ( (V!13286 (val!4612 Int)) )
))
(declare-datatypes ((ValueCell!4224 0))(
  ( (ValueCellFull!4224 (v!6809 V!13285)) (EmptyCell!4224) )
))
(declare-datatypes ((array!22191 0))(
  ( (array!22192 (arr!10564 (Array (_ BitVec 32) ValueCell!4224)) (size!10916 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22191)

(declare-fun e!230845 () Bool)

(declare-fun array_inv!7780 (array!22191) Bool)

(assert (=> start!37360 (and (array_inv!7780 _values!506) e!230845)))

(assert (=> start!37360 tp!30177))

(assert (=> start!37360 true))

(declare-fun tp_is_empty!9135 () Bool)

(assert (=> start!37360 tp_is_empty!9135))

(declare-datatypes ((array!22193 0))(
  ( (array!22194 (arr!10565 (Array (_ BitVec 32) (_ BitVec 64))) (size!10917 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22193)

(declare-fun array_inv!7781 (array!22193) Bool)

(assert (=> start!37360 (array_inv!7781 _keys!658)))

(declare-fun b!379410 () Bool)

(declare-fun res!215133 () Bool)

(assert (=> b!379410 (=> (not res!215133) (not e!230844))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22193 (_ BitVec 32)) Bool)

(assert (=> b!379410 (= res!215133 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!379411 () Bool)

(declare-fun e!230846 () Bool)

(assert (=> b!379411 (= e!230844 e!230846)))

(declare-fun res!215134 () Bool)

(assert (=> b!379411 (=> (not res!215134) (not e!230846))))

(declare-fun lt!177165 () array!22193)

(assert (=> b!379411 (= res!215134 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!177165 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!379411 (= lt!177165 (array!22194 (store (arr!10565 _keys!658) i!548 k0!778) (size!10917 _keys!658)))))

(declare-fun b!379412 () Bool)

(declare-fun e!230839 () Bool)

(assert (=> b!379412 (= e!230839 tp_is_empty!9135)))

(declare-fun b!379413 () Bool)

(declare-fun res!215130 () Bool)

(assert (=> b!379413 (=> (not res!215130) (not e!230844))))

(assert (=> b!379413 (= res!215130 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10917 _keys!658))))))

(declare-fun b!379414 () Bool)

(declare-fun e!230842 () Bool)

(assert (=> b!379414 (= e!230842 true)))

(declare-datatypes ((tuple2!6170 0))(
  ( (tuple2!6171 (_1!3096 (_ BitVec 64)) (_2!3096 V!13285)) )
))
(declare-datatypes ((List!6006 0))(
  ( (Nil!6003) (Cons!6002 (h!6858 tuple2!6170) (t!11156 List!6006)) )
))
(declare-datatypes ((ListLongMap!5083 0))(
  ( (ListLongMap!5084 (toList!2557 List!6006)) )
))
(declare-fun lt!177168 () ListLongMap!5083)

(declare-fun lt!177167 () ListLongMap!5083)

(declare-fun lt!177164 () tuple2!6170)

(declare-fun +!903 (ListLongMap!5083 tuple2!6170) ListLongMap!5083)

(assert (=> b!379414 (= lt!177168 (+!903 lt!177167 lt!177164))))

(declare-datatypes ((Unit!11704 0))(
  ( (Unit!11705) )
))
(declare-fun lt!177159 () Unit!11704)

(declare-fun v!373 () V!13285)

(declare-fun lt!177160 () ListLongMap!5083)

(declare-fun minValue!472 () V!13285)

(declare-fun addCommutativeForDiffKeys!302 (ListLongMap!5083 (_ BitVec 64) V!13285 (_ BitVec 64) V!13285) Unit!11704)

(assert (=> b!379414 (= lt!177159 (addCommutativeForDiffKeys!302 lt!177160 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!379415 () Bool)

(declare-fun e!230841 () Bool)

(assert (=> b!379415 (= e!230846 (not e!230841))))

(declare-fun res!215132 () Bool)

(assert (=> b!379415 (=> res!215132 e!230841)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!379415 (= res!215132 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13285)

(declare-fun lt!177166 () ListLongMap!5083)

(declare-fun getCurrentListMap!1979 (array!22193 array!22191 (_ BitVec 32) (_ BitVec 32) V!13285 V!13285 (_ BitVec 32) Int) ListLongMap!5083)

(assert (=> b!379415 (= lt!177166 (getCurrentListMap!1979 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177163 () array!22191)

(declare-fun lt!177169 () ListLongMap!5083)

(assert (=> b!379415 (= lt!177169 (getCurrentListMap!1979 lt!177165 lt!177163 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177171 () ListLongMap!5083)

(declare-fun lt!177162 () ListLongMap!5083)

(assert (=> b!379415 (and (= lt!177171 lt!177162) (= lt!177162 lt!177171))))

(assert (=> b!379415 (= lt!177162 (+!903 lt!177160 lt!177164))))

(assert (=> b!379415 (= lt!177164 (tuple2!6171 k0!778 v!373))))

(declare-fun lt!177170 () Unit!11704)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!137 (array!22193 array!22191 (_ BitVec 32) (_ BitVec 32) V!13285 V!13285 (_ BitVec 32) (_ BitVec 64) V!13285 (_ BitVec 32) Int) Unit!11704)

(assert (=> b!379415 (= lt!177170 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!137 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!813 (array!22193 array!22191 (_ BitVec 32) (_ BitVec 32) V!13285 V!13285 (_ BitVec 32) Int) ListLongMap!5083)

(assert (=> b!379415 (= lt!177171 (getCurrentListMapNoExtraKeys!813 lt!177165 lt!177163 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!379415 (= lt!177163 (array!22192 (store (arr!10564 _values!506) i!548 (ValueCellFull!4224 v!373)) (size!10916 _values!506)))))

(assert (=> b!379415 (= lt!177160 (getCurrentListMapNoExtraKeys!813 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!379416 () Bool)

(declare-fun e!230840 () Bool)

(declare-fun mapRes!15267 () Bool)

(assert (=> b!379416 (= e!230845 (and e!230840 mapRes!15267))))

(declare-fun condMapEmpty!15267 () Bool)

(declare-fun mapDefault!15267 () ValueCell!4224)

(assert (=> b!379416 (= condMapEmpty!15267 (= (arr!10564 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4224)) mapDefault!15267)))))

(declare-fun b!379417 () Bool)

(declare-fun res!215126 () Bool)

(assert (=> b!379417 (=> (not res!215126) (not e!230844))))

(assert (=> b!379417 (= res!215126 (or (= (select (arr!10565 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10565 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!15267 () Bool)

(declare-fun tp!30176 () Bool)

(assert (=> mapNonEmpty!15267 (= mapRes!15267 (and tp!30176 e!230839))))

(declare-fun mapKey!15267 () (_ BitVec 32))

(declare-fun mapValue!15267 () ValueCell!4224)

(declare-fun mapRest!15267 () (Array (_ BitVec 32) ValueCell!4224))

(assert (=> mapNonEmpty!15267 (= (arr!10564 _values!506) (store mapRest!15267 mapKey!15267 mapValue!15267))))

(declare-fun b!379418 () Bool)

(declare-fun res!215127 () Bool)

(assert (=> b!379418 (=> (not res!215127) (not e!230846))))

(declare-datatypes ((List!6007 0))(
  ( (Nil!6004) (Cons!6003 (h!6859 (_ BitVec 64)) (t!11157 List!6007)) )
))
(declare-fun arrayNoDuplicates!0 (array!22193 (_ BitVec 32) List!6007) Bool)

(assert (=> b!379418 (= res!215127 (arrayNoDuplicates!0 lt!177165 #b00000000000000000000000000000000 Nil!6004))))

(declare-fun mapIsEmpty!15267 () Bool)

(assert (=> mapIsEmpty!15267 mapRes!15267))

(declare-fun b!379419 () Bool)

(declare-fun res!215124 () Bool)

(assert (=> b!379419 (=> (not res!215124) (not e!230844))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!379419 (= res!215124 (validKeyInArray!0 k0!778))))

(declare-fun b!379420 () Bool)

(assert (=> b!379420 (= e!230841 e!230842)))

(declare-fun res!215129 () Bool)

(assert (=> b!379420 (=> res!215129 e!230842)))

(assert (=> b!379420 (= res!215129 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!379420 (= lt!177166 lt!177167)))

(declare-fun lt!177161 () tuple2!6170)

(assert (=> b!379420 (= lt!177167 (+!903 lt!177160 lt!177161))))

(assert (=> b!379420 (= lt!177169 lt!177168)))

(assert (=> b!379420 (= lt!177168 (+!903 lt!177162 lt!177161))))

(assert (=> b!379420 (= lt!177169 (+!903 lt!177171 lt!177161))))

(assert (=> b!379420 (= lt!177161 (tuple2!6171 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!379421 () Bool)

(declare-fun res!215135 () Bool)

(assert (=> b!379421 (=> (not res!215135) (not e!230844))))

(assert (=> b!379421 (= res!215135 (and (= (size!10916 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10917 _keys!658) (size!10916 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!379422 () Bool)

(assert (=> b!379422 (= e!230840 tp_is_empty!9135)))

(declare-fun b!379423 () Bool)

(declare-fun res!215125 () Bool)

(assert (=> b!379423 (=> (not res!215125) (not e!230844))))

(declare-fun arrayContainsKey!0 (array!22193 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!379423 (= res!215125 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!379424 () Bool)

(declare-fun res!215131 () Bool)

(assert (=> b!379424 (=> (not res!215131) (not e!230844))))

(assert (=> b!379424 (= res!215131 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6004))))

(assert (= (and start!37360 res!215128) b!379421))

(assert (= (and b!379421 res!215135) b!379410))

(assert (= (and b!379410 res!215133) b!379424))

(assert (= (and b!379424 res!215131) b!379413))

(assert (= (and b!379413 res!215130) b!379419))

(assert (= (and b!379419 res!215124) b!379417))

(assert (= (and b!379417 res!215126) b!379423))

(assert (= (and b!379423 res!215125) b!379411))

(assert (= (and b!379411 res!215134) b!379418))

(assert (= (and b!379418 res!215127) b!379415))

(assert (= (and b!379415 (not res!215132)) b!379420))

(assert (= (and b!379420 (not res!215129)) b!379414))

(assert (= (and b!379416 condMapEmpty!15267) mapIsEmpty!15267))

(assert (= (and b!379416 (not condMapEmpty!15267)) mapNonEmpty!15267))

(get-info :version)

(assert (= (and mapNonEmpty!15267 ((_ is ValueCellFull!4224) mapValue!15267)) b!379412))

(assert (= (and b!379416 ((_ is ValueCellFull!4224) mapDefault!15267)) b!379422))

(assert (= start!37360 b!379416))

(declare-fun m!376287 () Bool)

(assert (=> b!379415 m!376287))

(declare-fun m!376289 () Bool)

(assert (=> b!379415 m!376289))

(declare-fun m!376291 () Bool)

(assert (=> b!379415 m!376291))

(declare-fun m!376293 () Bool)

(assert (=> b!379415 m!376293))

(declare-fun m!376295 () Bool)

(assert (=> b!379415 m!376295))

(declare-fun m!376297 () Bool)

(assert (=> b!379415 m!376297))

(declare-fun m!376299 () Bool)

(assert (=> b!379415 m!376299))

(declare-fun m!376301 () Bool)

(assert (=> b!379424 m!376301))

(declare-fun m!376303 () Bool)

(assert (=> b!379420 m!376303))

(declare-fun m!376305 () Bool)

(assert (=> b!379420 m!376305))

(declare-fun m!376307 () Bool)

(assert (=> b!379420 m!376307))

(declare-fun m!376309 () Bool)

(assert (=> b!379410 m!376309))

(declare-fun m!376311 () Bool)

(assert (=> b!379417 m!376311))

(declare-fun m!376313 () Bool)

(assert (=> b!379414 m!376313))

(declare-fun m!376315 () Bool)

(assert (=> b!379414 m!376315))

(declare-fun m!376317 () Bool)

(assert (=> b!379411 m!376317))

(declare-fun m!376319 () Bool)

(assert (=> b!379411 m!376319))

(declare-fun m!376321 () Bool)

(assert (=> b!379419 m!376321))

(declare-fun m!376323 () Bool)

(assert (=> b!379418 m!376323))

(declare-fun m!376325 () Bool)

(assert (=> b!379423 m!376325))

(declare-fun m!376327 () Bool)

(assert (=> start!37360 m!376327))

(declare-fun m!376329 () Bool)

(assert (=> start!37360 m!376329))

(declare-fun m!376331 () Bool)

(assert (=> start!37360 m!376331))

(declare-fun m!376333 () Bool)

(assert (=> mapNonEmpty!15267 m!376333))

(check-sat (not b!379411) (not b!379410) (not b!379418) tp_is_empty!9135 (not b_next!8487) (not b!379415) (not b!379419) (not start!37360) (not b!379414) b_and!15729 (not b!379424) (not b!379423) (not b!379420) (not mapNonEmpty!15267))
(check-sat b_and!15729 (not b_next!8487))
