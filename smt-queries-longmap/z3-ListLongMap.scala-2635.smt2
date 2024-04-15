; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39614 () Bool)

(assert start!39614)

(declare-fun b_free!9895 () Bool)

(declare-fun b_next!9895 () Bool)

(assert (=> start!39614 (= b_free!9895 (not b_next!9895))))

(declare-fun tp!35213 () Bool)

(declare-fun b_and!17525 () Bool)

(assert (=> start!39614 (= tp!35213 b_and!17525)))

(declare-fun b!424624 () Bool)

(declare-fun e!252154 () Bool)

(declare-fun tp_is_empty!11047 () Bool)

(assert (=> b!424624 (= e!252154 tp_is_empty!11047)))

(declare-fun b!424625 () Bool)

(declare-fun e!252153 () Bool)

(declare-fun e!252155 () Bool)

(declare-fun mapRes!18192 () Bool)

(assert (=> b!424625 (= e!252153 (and e!252155 mapRes!18192))))

(declare-fun condMapEmpty!18192 () Bool)

(declare-datatypes ((V!15835 0))(
  ( (V!15836 (val!5568 Int)) )
))
(declare-datatypes ((ValueCell!5180 0))(
  ( (ValueCellFull!5180 (v!7809 V!15835)) (EmptyCell!5180) )
))
(declare-datatypes ((array!25923 0))(
  ( (array!25924 (arr!12411 (Array (_ BitVec 32) ValueCell!5180)) (size!12764 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25923)

(declare-fun mapDefault!18192 () ValueCell!5180)

(assert (=> b!424625 (= condMapEmpty!18192 (= (arr!12411 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5180)) mapDefault!18192)))))

(declare-fun b!424626 () Bool)

(declare-fun e!252152 () Bool)

(assert (=> b!424626 (= e!252152 (not true))))

(declare-fun minValue!515 () V!15835)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15835)

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((array!25925 0))(
  ( (array!25926 (arr!12412 (Array (_ BitVec 32) (_ BitVec 64))) (size!12765 (_ BitVec 32))) )
))
(declare-fun lt!194247 () array!25925)

(declare-fun v!412 () V!15835)

(declare-fun _keys!709 () array!25925)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!194248 () array!25923)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((tuple2!7298 0))(
  ( (tuple2!7299 (_1!3660 (_ BitVec 64)) (_2!3660 V!15835)) )
))
(declare-datatypes ((List!7298 0))(
  ( (Nil!7295) (Cons!7294 (h!8150 tuple2!7298) (t!12733 List!7298)) )
))
(declare-datatypes ((ListLongMap!6201 0))(
  ( (ListLongMap!6202 (toList!3116 List!7298)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1324 (array!25925 array!25923 (_ BitVec 32) (_ BitVec 32) V!15835 V!15835 (_ BitVec 32) Int) ListLongMap!6201)

(declare-fun +!1300 (ListLongMap!6201 tuple2!7298) ListLongMap!6201)

(assert (=> b!424626 (= (getCurrentListMapNoExtraKeys!1324 lt!194247 lt!194248 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1300 (getCurrentListMapNoExtraKeys!1324 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7299 k0!794 v!412)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!12446 0))(
  ( (Unit!12447) )
))
(declare-fun lt!194249 () Unit!12446)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!471 (array!25925 array!25923 (_ BitVec 32) (_ BitVec 32) V!15835 V!15835 (_ BitVec 32) (_ BitVec 64) V!15835 (_ BitVec 32) Int) Unit!12446)

(assert (=> b!424626 (= lt!194249 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!471 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!424627 () Bool)

(declare-fun res!248514 () Bool)

(declare-fun e!252151 () Bool)

(assert (=> b!424627 (=> (not res!248514) (not e!252151))))

(assert (=> b!424627 (= res!248514 (and (= (size!12764 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12765 _keys!709) (size!12764 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!248526 () Bool)

(assert (=> start!39614 (=> (not res!248526) (not e!252151))))

(assert (=> start!39614 (= res!248526 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12765 _keys!709))))))

(assert (=> start!39614 e!252151))

(assert (=> start!39614 tp_is_empty!11047))

(assert (=> start!39614 tp!35213))

(assert (=> start!39614 true))

(declare-fun array_inv!9076 (array!25923) Bool)

(assert (=> start!39614 (and (array_inv!9076 _values!549) e!252153)))

(declare-fun array_inv!9077 (array!25925) Bool)

(assert (=> start!39614 (array_inv!9077 _keys!709)))

(declare-fun b!424628 () Bool)

(assert (=> b!424628 (= e!252155 tp_is_empty!11047)))

(declare-fun b!424629 () Bool)

(declare-fun e!252150 () Bool)

(assert (=> b!424629 (= e!252151 e!252150)))

(declare-fun res!248523 () Bool)

(assert (=> b!424629 (=> (not res!248523) (not e!252150))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25925 (_ BitVec 32)) Bool)

(assert (=> b!424629 (= res!248523 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194247 mask!1025))))

(assert (=> b!424629 (= lt!194247 (array!25926 (store (arr!12412 _keys!709) i!563 k0!794) (size!12765 _keys!709)))))

(declare-fun b!424630 () Bool)

(declare-fun res!248515 () Bool)

(assert (=> b!424630 (=> (not res!248515) (not e!252151))))

(assert (=> b!424630 (= res!248515 (or (= (select (arr!12412 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12412 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!424631 () Bool)

(declare-fun res!248524 () Bool)

(assert (=> b!424631 (=> (not res!248524) (not e!252150))))

(declare-datatypes ((List!7299 0))(
  ( (Nil!7296) (Cons!7295 (h!8151 (_ BitVec 64)) (t!12734 List!7299)) )
))
(declare-fun arrayNoDuplicates!0 (array!25925 (_ BitVec 32) List!7299) Bool)

(assert (=> b!424631 (= res!248524 (arrayNoDuplicates!0 lt!194247 #b00000000000000000000000000000000 Nil!7296))))

(declare-fun b!424632 () Bool)

(declare-fun res!248517 () Bool)

(assert (=> b!424632 (=> (not res!248517) (not e!252150))))

(assert (=> b!424632 (= res!248517 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!18192 () Bool)

(assert (=> mapIsEmpty!18192 mapRes!18192))

(declare-fun b!424633 () Bool)

(declare-fun res!248519 () Bool)

(assert (=> b!424633 (=> (not res!248519) (not e!252151))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!424633 (= res!248519 (validKeyInArray!0 k0!794))))

(declare-fun b!424634 () Bool)

(declare-fun res!248525 () Bool)

(assert (=> b!424634 (=> (not res!248525) (not e!252151))))

(declare-fun arrayContainsKey!0 (array!25925 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!424634 (= res!248525 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!424635 () Bool)

(assert (=> b!424635 (= e!252150 e!252152)))

(declare-fun res!248518 () Bool)

(assert (=> b!424635 (=> (not res!248518) (not e!252152))))

(assert (=> b!424635 (= res!248518 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!194245 () ListLongMap!6201)

(assert (=> b!424635 (= lt!194245 (getCurrentListMapNoExtraKeys!1324 lt!194247 lt!194248 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!424635 (= lt!194248 (array!25924 (store (arr!12411 _values!549) i!563 (ValueCellFull!5180 v!412)) (size!12764 _values!549)))))

(declare-fun lt!194246 () ListLongMap!6201)

(assert (=> b!424635 (= lt!194246 (getCurrentListMapNoExtraKeys!1324 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!424636 () Bool)

(declare-fun res!248516 () Bool)

(assert (=> b!424636 (=> (not res!248516) (not e!252151))))

(assert (=> b!424636 (= res!248516 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7296))))

(declare-fun mapNonEmpty!18192 () Bool)

(declare-fun tp!35214 () Bool)

(assert (=> mapNonEmpty!18192 (= mapRes!18192 (and tp!35214 e!252154))))

(declare-fun mapRest!18192 () (Array (_ BitVec 32) ValueCell!5180))

(declare-fun mapValue!18192 () ValueCell!5180)

(declare-fun mapKey!18192 () (_ BitVec 32))

(assert (=> mapNonEmpty!18192 (= (arr!12411 _values!549) (store mapRest!18192 mapKey!18192 mapValue!18192))))

(declare-fun b!424637 () Bool)

(declare-fun res!248520 () Bool)

(assert (=> b!424637 (=> (not res!248520) (not e!252151))))

(assert (=> b!424637 (= res!248520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!424638 () Bool)

(declare-fun res!248522 () Bool)

(assert (=> b!424638 (=> (not res!248522) (not e!252151))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!424638 (= res!248522 (validMask!0 mask!1025))))

(declare-fun b!424639 () Bool)

(declare-fun res!248521 () Bool)

(assert (=> b!424639 (=> (not res!248521) (not e!252151))))

(assert (=> b!424639 (= res!248521 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12765 _keys!709))))))

(assert (= (and start!39614 res!248526) b!424638))

(assert (= (and b!424638 res!248522) b!424627))

(assert (= (and b!424627 res!248514) b!424637))

(assert (= (and b!424637 res!248520) b!424636))

(assert (= (and b!424636 res!248516) b!424639))

(assert (= (and b!424639 res!248521) b!424633))

(assert (= (and b!424633 res!248519) b!424630))

(assert (= (and b!424630 res!248515) b!424634))

(assert (= (and b!424634 res!248525) b!424629))

(assert (= (and b!424629 res!248523) b!424631))

(assert (= (and b!424631 res!248524) b!424632))

(assert (= (and b!424632 res!248517) b!424635))

(assert (= (and b!424635 res!248518) b!424626))

(assert (= (and b!424625 condMapEmpty!18192) mapIsEmpty!18192))

(assert (= (and b!424625 (not condMapEmpty!18192)) mapNonEmpty!18192))

(get-info :version)

(assert (= (and mapNonEmpty!18192 ((_ is ValueCellFull!5180) mapValue!18192)) b!424624))

(assert (= (and b!424625 ((_ is ValueCellFull!5180) mapDefault!18192)) b!424628))

(assert (= start!39614 b!424625))

(declare-fun m!413175 () Bool)

(assert (=> b!424630 m!413175))

(declare-fun m!413177 () Bool)

(assert (=> b!424629 m!413177))

(declare-fun m!413179 () Bool)

(assert (=> b!424629 m!413179))

(declare-fun m!413181 () Bool)

(assert (=> b!424636 m!413181))

(declare-fun m!413183 () Bool)

(assert (=> b!424631 m!413183))

(declare-fun m!413185 () Bool)

(assert (=> start!39614 m!413185))

(declare-fun m!413187 () Bool)

(assert (=> start!39614 m!413187))

(declare-fun m!413189 () Bool)

(assert (=> b!424626 m!413189))

(declare-fun m!413191 () Bool)

(assert (=> b!424626 m!413191))

(assert (=> b!424626 m!413191))

(declare-fun m!413193 () Bool)

(assert (=> b!424626 m!413193))

(declare-fun m!413195 () Bool)

(assert (=> b!424626 m!413195))

(declare-fun m!413197 () Bool)

(assert (=> b!424633 m!413197))

(declare-fun m!413199 () Bool)

(assert (=> b!424637 m!413199))

(declare-fun m!413201 () Bool)

(assert (=> mapNonEmpty!18192 m!413201))

(declare-fun m!413203 () Bool)

(assert (=> b!424638 m!413203))

(declare-fun m!413205 () Bool)

(assert (=> b!424635 m!413205))

(declare-fun m!413207 () Bool)

(assert (=> b!424635 m!413207))

(declare-fun m!413209 () Bool)

(assert (=> b!424635 m!413209))

(declare-fun m!413211 () Bool)

(assert (=> b!424634 m!413211))

(check-sat b_and!17525 (not b!424631) (not b!424626) (not b!424629) (not b!424637) (not b!424635) tp_is_empty!11047 (not mapNonEmpty!18192) (not b!424633) (not b!424636) (not start!39614) (not b!424634) (not b!424638) (not b_next!9895))
(check-sat b_and!17525 (not b_next!9895))
