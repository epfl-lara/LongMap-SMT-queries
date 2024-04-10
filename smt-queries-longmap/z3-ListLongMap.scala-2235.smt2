; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36874 () Bool)

(assert start!36874)

(declare-fun b_free!8001 () Bool)

(declare-fun b_next!8001 () Bool)

(assert (=> start!36874 (= b_free!8001 (not b_next!8001))))

(declare-fun tp!28719 () Bool)

(declare-fun b_and!15243 () Bool)

(assert (=> start!36874 (= tp!28719 b_and!15243)))

(declare-fun b!369059 () Bool)

(declare-fun e!225618 () Bool)

(assert (=> b!369059 (= e!225618 false)))

(declare-datatypes ((V!12637 0))(
  ( (V!12638 (val!4369 Int)) )
))
(declare-datatypes ((tuple2!5792 0))(
  ( (tuple2!5793 (_1!2907 (_ BitVec 64)) (_2!2907 V!12637)) )
))
(declare-datatypes ((List!5626 0))(
  ( (Nil!5623) (Cons!5622 (h!6478 tuple2!5792) (t!10776 List!5626)) )
))
(declare-datatypes ((ListLongMap!4705 0))(
  ( (ListLongMap!4706 (toList!2368 List!5626)) )
))
(declare-fun lt!169650 () ListLongMap!4705)

(declare-datatypes ((ValueCell!3981 0))(
  ( (ValueCellFull!3981 (v!6566 V!12637)) (EmptyCell!3981) )
))
(declare-datatypes ((array!21251 0))(
  ( (array!21252 (arr!10094 (Array (_ BitVec 32) ValueCell!3981)) (size!10446 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21251)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12637)

(declare-datatypes ((array!21253 0))(
  ( (array!21254 (arr!10095 (Array (_ BitVec 32) (_ BitVec 64))) (size!10447 (_ BitVec 32))) )
))
(declare-fun lt!169648 () array!21253)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!12637)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!12637)

(declare-fun getCurrentListMapNoExtraKeys!645 (array!21253 array!21251 (_ BitVec 32) (_ BitVec 32) V!12637 V!12637 (_ BitVec 32) Int) ListLongMap!4705)

(assert (=> b!369059 (= lt!169650 (getCurrentListMapNoExtraKeys!645 lt!169648 (array!21252 (store (arr!10094 _values!506) i!548 (ValueCellFull!3981 v!373)) (size!10446 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169649 () ListLongMap!4705)

(declare-fun _keys!658 () array!21253)

(assert (=> b!369059 (= lt!169649 (getCurrentListMapNoExtraKeys!645 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!369060 () Bool)

(declare-fun res!206969 () Bool)

(declare-fun e!225621 () Bool)

(assert (=> b!369060 (=> (not res!206969) (not e!225621))))

(declare-datatypes ((List!5627 0))(
  ( (Nil!5624) (Cons!5623 (h!6479 (_ BitVec 64)) (t!10777 List!5627)) )
))
(declare-fun arrayNoDuplicates!0 (array!21253 (_ BitVec 32) List!5627) Bool)

(assert (=> b!369060 (= res!206969 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5624))))

(declare-fun b!369061 () Bool)

(declare-fun res!206960 () Bool)

(assert (=> b!369061 (=> (not res!206960) (not e!225621))))

(assert (=> b!369061 (= res!206960 (and (= (size!10446 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10447 _keys!658) (size!10446 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!206962 () Bool)

(assert (=> start!36874 (=> (not res!206962) (not e!225621))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36874 (= res!206962 (validMask!0 mask!970))))

(assert (=> start!36874 e!225621))

(declare-fun e!225620 () Bool)

(declare-fun array_inv!7460 (array!21251) Bool)

(assert (=> start!36874 (and (array_inv!7460 _values!506) e!225620)))

(assert (=> start!36874 tp!28719))

(assert (=> start!36874 true))

(declare-fun tp_is_empty!8649 () Bool)

(assert (=> start!36874 tp_is_empty!8649))

(declare-fun array_inv!7461 (array!21253) Bool)

(assert (=> start!36874 (array_inv!7461 _keys!658)))

(declare-fun b!369062 () Bool)

(declare-fun res!206968 () Bool)

(assert (=> b!369062 (=> (not res!206968) (not e!225618))))

(assert (=> b!369062 (= res!206968 (arrayNoDuplicates!0 lt!169648 #b00000000000000000000000000000000 Nil!5624))))

(declare-fun b!369063 () Bool)

(declare-fun e!225622 () Bool)

(assert (=> b!369063 (= e!225622 tp_is_empty!8649)))

(declare-fun b!369064 () Bool)

(declare-fun res!206965 () Bool)

(assert (=> b!369064 (=> (not res!206965) (not e!225621))))

(assert (=> b!369064 (= res!206965 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10447 _keys!658))))))

(declare-fun b!369065 () Bool)

(declare-fun res!206961 () Bool)

(assert (=> b!369065 (=> (not res!206961) (not e!225621))))

(assert (=> b!369065 (= res!206961 (or (= (select (arr!10095 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10095 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!369066 () Bool)

(assert (=> b!369066 (= e!225621 e!225618)))

(declare-fun res!206967 () Bool)

(assert (=> b!369066 (=> (not res!206967) (not e!225618))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21253 (_ BitVec 32)) Bool)

(assert (=> b!369066 (= res!206967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169648 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!369066 (= lt!169648 (array!21254 (store (arr!10095 _keys!658) i!548 k0!778) (size!10447 _keys!658)))))

(declare-fun b!369067 () Bool)

(declare-fun res!206964 () Bool)

(assert (=> b!369067 (=> (not res!206964) (not e!225621))))

(assert (=> b!369067 (= res!206964 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!369068 () Bool)

(declare-fun res!206963 () Bool)

(assert (=> b!369068 (=> (not res!206963) (not e!225621))))

(declare-fun arrayContainsKey!0 (array!21253 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!369068 (= res!206963 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14538 () Bool)

(declare-fun mapRes!14538 () Bool)

(assert (=> mapIsEmpty!14538 mapRes!14538))

(declare-fun mapNonEmpty!14538 () Bool)

(declare-fun tp!28718 () Bool)

(declare-fun e!225619 () Bool)

(assert (=> mapNonEmpty!14538 (= mapRes!14538 (and tp!28718 e!225619))))

(declare-fun mapRest!14538 () (Array (_ BitVec 32) ValueCell!3981))

(declare-fun mapValue!14538 () ValueCell!3981)

(declare-fun mapKey!14538 () (_ BitVec 32))

(assert (=> mapNonEmpty!14538 (= (arr!10094 _values!506) (store mapRest!14538 mapKey!14538 mapValue!14538))))

(declare-fun b!369069 () Bool)

(assert (=> b!369069 (= e!225619 tp_is_empty!8649)))

(declare-fun b!369070 () Bool)

(assert (=> b!369070 (= e!225620 (and e!225622 mapRes!14538))))

(declare-fun condMapEmpty!14538 () Bool)

(declare-fun mapDefault!14538 () ValueCell!3981)

(assert (=> b!369070 (= condMapEmpty!14538 (= (arr!10094 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3981)) mapDefault!14538)))))

(declare-fun b!369071 () Bool)

(declare-fun res!206966 () Bool)

(assert (=> b!369071 (=> (not res!206966) (not e!225621))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!369071 (= res!206966 (validKeyInArray!0 k0!778))))

(assert (= (and start!36874 res!206962) b!369061))

(assert (= (and b!369061 res!206960) b!369067))

(assert (= (and b!369067 res!206964) b!369060))

(assert (= (and b!369060 res!206969) b!369064))

(assert (= (and b!369064 res!206965) b!369071))

(assert (= (and b!369071 res!206966) b!369065))

(assert (= (and b!369065 res!206961) b!369068))

(assert (= (and b!369068 res!206963) b!369066))

(assert (= (and b!369066 res!206967) b!369062))

(assert (= (and b!369062 res!206968) b!369059))

(assert (= (and b!369070 condMapEmpty!14538) mapIsEmpty!14538))

(assert (= (and b!369070 (not condMapEmpty!14538)) mapNonEmpty!14538))

(get-info :version)

(assert (= (and mapNonEmpty!14538 ((_ is ValueCellFull!3981) mapValue!14538)) b!369069))

(assert (= (and b!369070 ((_ is ValueCellFull!3981) mapDefault!14538)) b!369063))

(assert (= start!36874 b!369070))

(declare-fun m!365523 () Bool)

(assert (=> start!36874 m!365523))

(declare-fun m!365525 () Bool)

(assert (=> start!36874 m!365525))

(declare-fun m!365527 () Bool)

(assert (=> start!36874 m!365527))

(declare-fun m!365529 () Bool)

(assert (=> b!369065 m!365529))

(declare-fun m!365531 () Bool)

(assert (=> mapNonEmpty!14538 m!365531))

(declare-fun m!365533 () Bool)

(assert (=> b!369068 m!365533))

(declare-fun m!365535 () Bool)

(assert (=> b!369062 m!365535))

(declare-fun m!365537 () Bool)

(assert (=> b!369067 m!365537))

(declare-fun m!365539 () Bool)

(assert (=> b!369071 m!365539))

(declare-fun m!365541 () Bool)

(assert (=> b!369060 m!365541))

(declare-fun m!365543 () Bool)

(assert (=> b!369066 m!365543))

(declare-fun m!365545 () Bool)

(assert (=> b!369066 m!365545))

(declare-fun m!365547 () Bool)

(assert (=> b!369059 m!365547))

(declare-fun m!365549 () Bool)

(assert (=> b!369059 m!365549))

(declare-fun m!365551 () Bool)

(assert (=> b!369059 m!365551))

(check-sat (not start!36874) (not mapNonEmpty!14538) (not b!369059) b_and!15243 (not b!369068) (not b!369067) (not b!369060) (not b!369066) (not b!369062) (not b_next!8001) (not b!369071) tp_is_empty!8649)
(check-sat b_and!15243 (not b_next!8001))
