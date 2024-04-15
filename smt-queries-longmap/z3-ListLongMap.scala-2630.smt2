; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39584 () Bool)

(assert start!39584)

(declare-fun b_free!9865 () Bool)

(declare-fun b_next!9865 () Bool)

(assert (=> start!39584 (= b_free!9865 (not b_next!9865))))

(declare-fun tp!35123 () Bool)

(declare-fun b_and!17495 () Bool)

(assert (=> start!39584 (= tp!35123 b_and!17495)))

(declare-fun b!423938 () Bool)

(declare-fun e!251870 () Bool)

(assert (=> b!423938 (= e!251870 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!15795 0))(
  ( (V!15796 (val!5553 Int)) )
))
(declare-fun minValue!515 () V!15795)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5165 0))(
  ( (ValueCellFull!5165 (v!7794 V!15795)) (EmptyCell!5165) )
))
(declare-datatypes ((array!25863 0))(
  ( (array!25864 (arr!12381 (Array (_ BitVec 32) ValueCell!5165)) (size!12734 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25863)

(declare-fun zeroValue!515 () V!15795)

(declare-datatypes ((tuple2!7280 0))(
  ( (tuple2!7281 (_1!3651 (_ BitVec 64)) (_2!3651 V!15795)) )
))
(declare-datatypes ((List!7276 0))(
  ( (Nil!7273) (Cons!7272 (h!8128 tuple2!7280) (t!12711 List!7276)) )
))
(declare-datatypes ((ListLongMap!6183 0))(
  ( (ListLongMap!6184 (toList!3107 List!7276)) )
))
(declare-fun lt!194089 () ListLongMap!6183)

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!25865 0))(
  ( (array!25866 (arr!12382 (Array (_ BitVec 32) (_ BitVec 64))) (size!12735 (_ BitVec 32))) )
))
(declare-fun lt!194088 () array!25865)

(declare-fun v!412 () V!15795)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1315 (array!25865 array!25863 (_ BitVec 32) (_ BitVec 32) V!15795 V!15795 (_ BitVec 32) Int) ListLongMap!6183)

(assert (=> b!423938 (= lt!194089 (getCurrentListMapNoExtraKeys!1315 lt!194088 (array!25864 (store (arr!12381 _values!549) i!563 (ValueCellFull!5165 v!412)) (size!12734 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194090 () ListLongMap!6183)

(declare-fun _keys!709 () array!25865)

(assert (=> b!423938 (= lt!194090 (getCurrentListMapNoExtraKeys!1315 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!247974 () Bool)

(declare-fun e!251871 () Bool)

(assert (=> start!39584 (=> (not res!247974) (not e!251871))))

(assert (=> start!39584 (= res!247974 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12735 _keys!709))))))

(assert (=> start!39584 e!251871))

(declare-fun tp_is_empty!11017 () Bool)

(assert (=> start!39584 tp_is_empty!11017))

(assert (=> start!39584 tp!35123))

(assert (=> start!39584 true))

(declare-fun e!251869 () Bool)

(declare-fun array_inv!9054 (array!25863) Bool)

(assert (=> start!39584 (and (array_inv!9054 _values!549) e!251869)))

(declare-fun array_inv!9055 (array!25865) Bool)

(assert (=> start!39584 (array_inv!9055 _keys!709)))

(declare-fun b!423939 () Bool)

(declare-fun res!247973 () Bool)

(assert (=> b!423939 (=> (not res!247973) (not e!251870))))

(assert (=> b!423939 (= res!247973 (bvsle from!863 i!563))))

(declare-fun b!423940 () Bool)

(declare-fun res!247971 () Bool)

(assert (=> b!423940 (=> (not res!247971) (not e!251871))))

(assert (=> b!423940 (= res!247971 (and (= (size!12734 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12735 _keys!709) (size!12734 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!423941 () Bool)

(declare-fun res!247968 () Bool)

(assert (=> b!423941 (=> (not res!247968) (not e!251871))))

(assert (=> b!423941 (= res!247968 (or (= (select (arr!12382 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12382 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!423942 () Bool)

(assert (=> b!423942 (= e!251871 e!251870)))

(declare-fun res!247972 () Bool)

(assert (=> b!423942 (=> (not res!247972) (not e!251870))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25865 (_ BitVec 32)) Bool)

(assert (=> b!423942 (= res!247972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194088 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!423942 (= lt!194088 (array!25866 (store (arr!12382 _keys!709) i!563 k0!794) (size!12735 _keys!709)))))

(declare-fun b!423943 () Bool)

(declare-fun e!251874 () Bool)

(declare-fun mapRes!18147 () Bool)

(assert (=> b!423943 (= e!251869 (and e!251874 mapRes!18147))))

(declare-fun condMapEmpty!18147 () Bool)

(declare-fun mapDefault!18147 () ValueCell!5165)

(assert (=> b!423943 (= condMapEmpty!18147 (= (arr!12381 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5165)) mapDefault!18147)))))

(declare-fun mapNonEmpty!18147 () Bool)

(declare-fun tp!35124 () Bool)

(declare-fun e!251872 () Bool)

(assert (=> mapNonEmpty!18147 (= mapRes!18147 (and tp!35124 e!251872))))

(declare-fun mapKey!18147 () (_ BitVec 32))

(declare-fun mapValue!18147 () ValueCell!5165)

(declare-fun mapRest!18147 () (Array (_ BitVec 32) ValueCell!5165))

(assert (=> mapNonEmpty!18147 (= (arr!12381 _values!549) (store mapRest!18147 mapKey!18147 mapValue!18147))))

(declare-fun b!423944 () Bool)

(declare-fun res!247966 () Bool)

(assert (=> b!423944 (=> (not res!247966) (not e!251871))))

(declare-fun arrayContainsKey!0 (array!25865 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!423944 (= res!247966 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!423945 () Bool)

(declare-fun res!247963 () Bool)

(assert (=> b!423945 (=> (not res!247963) (not e!251871))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!423945 (= res!247963 (validMask!0 mask!1025))))

(declare-fun b!423946 () Bool)

(declare-fun res!247967 () Bool)

(assert (=> b!423946 (=> (not res!247967) (not e!251871))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!423946 (= res!247967 (validKeyInArray!0 k0!794))))

(declare-fun b!423947 () Bool)

(declare-fun res!247970 () Bool)

(assert (=> b!423947 (=> (not res!247970) (not e!251871))))

(assert (=> b!423947 (= res!247970 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12735 _keys!709))))))

(declare-fun b!423948 () Bool)

(declare-fun res!247964 () Bool)

(assert (=> b!423948 (=> (not res!247964) (not e!251871))))

(declare-datatypes ((List!7277 0))(
  ( (Nil!7274) (Cons!7273 (h!8129 (_ BitVec 64)) (t!12712 List!7277)) )
))
(declare-fun arrayNoDuplicates!0 (array!25865 (_ BitVec 32) List!7277) Bool)

(assert (=> b!423948 (= res!247964 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7274))))

(declare-fun b!423949 () Bool)

(assert (=> b!423949 (= e!251874 tp_is_empty!11017)))

(declare-fun b!423950 () Bool)

(declare-fun res!247965 () Bool)

(assert (=> b!423950 (=> (not res!247965) (not e!251870))))

(assert (=> b!423950 (= res!247965 (arrayNoDuplicates!0 lt!194088 #b00000000000000000000000000000000 Nil!7274))))

(declare-fun b!423951 () Bool)

(assert (=> b!423951 (= e!251872 tp_is_empty!11017)))

(declare-fun b!423952 () Bool)

(declare-fun res!247969 () Bool)

(assert (=> b!423952 (=> (not res!247969) (not e!251871))))

(assert (=> b!423952 (= res!247969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!18147 () Bool)

(assert (=> mapIsEmpty!18147 mapRes!18147))

(assert (= (and start!39584 res!247974) b!423945))

(assert (= (and b!423945 res!247963) b!423940))

(assert (= (and b!423940 res!247971) b!423952))

(assert (= (and b!423952 res!247969) b!423948))

(assert (= (and b!423948 res!247964) b!423947))

(assert (= (and b!423947 res!247970) b!423946))

(assert (= (and b!423946 res!247967) b!423941))

(assert (= (and b!423941 res!247968) b!423944))

(assert (= (and b!423944 res!247966) b!423942))

(assert (= (and b!423942 res!247972) b!423950))

(assert (= (and b!423950 res!247965) b!423939))

(assert (= (and b!423939 res!247973) b!423938))

(assert (= (and b!423943 condMapEmpty!18147) mapIsEmpty!18147))

(assert (= (and b!423943 (not condMapEmpty!18147)) mapNonEmpty!18147))

(get-info :version)

(assert (= (and mapNonEmpty!18147 ((_ is ValueCellFull!5165) mapValue!18147)) b!423951))

(assert (= (and b!423943 ((_ is ValueCellFull!5165) mapDefault!18147)) b!423949))

(assert (= start!39584 b!423943))

(declare-fun m!412701 () Bool)

(assert (=> b!423942 m!412701))

(declare-fun m!412703 () Bool)

(assert (=> b!423942 m!412703))

(declare-fun m!412705 () Bool)

(assert (=> b!423945 m!412705))

(declare-fun m!412707 () Bool)

(assert (=> b!423938 m!412707))

(declare-fun m!412709 () Bool)

(assert (=> b!423938 m!412709))

(declare-fun m!412711 () Bool)

(assert (=> b!423938 m!412711))

(declare-fun m!412713 () Bool)

(assert (=> b!423941 m!412713))

(declare-fun m!412715 () Bool)

(assert (=> b!423944 m!412715))

(declare-fun m!412717 () Bool)

(assert (=> b!423950 m!412717))

(declare-fun m!412719 () Bool)

(assert (=> b!423946 m!412719))

(declare-fun m!412721 () Bool)

(assert (=> b!423948 m!412721))

(declare-fun m!412723 () Bool)

(assert (=> mapNonEmpty!18147 m!412723))

(declare-fun m!412725 () Bool)

(assert (=> start!39584 m!412725))

(declare-fun m!412727 () Bool)

(assert (=> start!39584 m!412727))

(declare-fun m!412729 () Bool)

(assert (=> b!423952 m!412729))

(check-sat (not b!423942) (not b!423946) (not b!423950) b_and!17495 (not b!423945) (not b!423952) (not b!423948) (not b!423944) (not start!39584) (not mapNonEmpty!18147) tp_is_empty!11017 (not b!423938) (not b_next!9865))
(check-sat b_and!17495 (not b_next!9865))
