; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36858 () Bool)

(assert start!36858)

(declare-fun b_free!7999 () Bool)

(declare-fun b_next!7999 () Bool)

(assert (=> start!36858 (= b_free!7999 (not b_next!7999))))

(declare-fun tp!28713 () Bool)

(declare-fun b_and!15255 () Bool)

(assert (=> start!36858 (= tp!28713 b_and!15255)))

(declare-fun b!368971 () Bool)

(declare-fun e!225571 () Bool)

(assert (=> b!368971 (= e!225571 false)))

(declare-datatypes ((V!12635 0))(
  ( (V!12636 (val!4368 Int)) )
))
(declare-datatypes ((ValueCell!3980 0))(
  ( (ValueCellFull!3980 (v!6566 V!12635)) (EmptyCell!3980) )
))
(declare-datatypes ((array!21228 0))(
  ( (array!21229 (arr!10082 (Array (_ BitVec 32) ValueCell!3980)) (size!10434 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21228)

(declare-datatypes ((tuple2!5702 0))(
  ( (tuple2!5703 (_1!2862 (_ BitVec 64)) (_2!2862 V!12635)) )
))
(declare-datatypes ((List!5528 0))(
  ( (Nil!5525) (Cons!5524 (h!6380 tuple2!5702) (t!10670 List!5528)) )
))
(declare-datatypes ((ListLongMap!4617 0))(
  ( (ListLongMap!4618 (toList!2324 List!5528)) )
))
(declare-fun lt!169658 () ListLongMap!4617)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!12635)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((array!21230 0))(
  ( (array!21231 (arr!10083 (Array (_ BitVec 32) (_ BitVec 64))) (size!10435 (_ BitVec 32))) )
))
(declare-fun lt!169659 () array!21230)

(declare-fun zeroValue!472 () V!12635)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!12635)

(declare-fun getCurrentListMapNoExtraKeys!633 (array!21230 array!21228 (_ BitVec 32) (_ BitVec 32) V!12635 V!12635 (_ BitVec 32) Int) ListLongMap!4617)

(assert (=> b!368971 (= lt!169658 (getCurrentListMapNoExtraKeys!633 lt!169659 (array!21229 (store (arr!10082 _values!506) i!548 (ValueCellFull!3980 v!373)) (size!10434 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169660 () ListLongMap!4617)

(declare-fun _keys!658 () array!21230)

(assert (=> b!368971 (= lt!169660 (getCurrentListMapNoExtraKeys!633 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!368972 () Bool)

(declare-fun res!206931 () Bool)

(declare-fun e!225573 () Bool)

(assert (=> b!368972 (=> (not res!206931) (not e!225573))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!368972 (= res!206931 (validKeyInArray!0 k0!778))))

(declare-fun b!368973 () Bool)

(declare-fun res!206933 () Bool)

(assert (=> b!368973 (=> (not res!206933) (not e!225573))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21230 (_ BitVec 32)) Bool)

(assert (=> b!368973 (= res!206933 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!368974 () Bool)

(assert (=> b!368974 (= e!225573 e!225571)))

(declare-fun res!206932 () Bool)

(assert (=> b!368974 (=> (not res!206932) (not e!225571))))

(assert (=> b!368974 (= res!206932 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169659 mask!970))))

(assert (=> b!368974 (= lt!169659 (array!21231 (store (arr!10083 _keys!658) i!548 k0!778) (size!10435 _keys!658)))))

(declare-fun res!206935 () Bool)

(assert (=> start!36858 (=> (not res!206935) (not e!225573))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36858 (= res!206935 (validMask!0 mask!970))))

(assert (=> start!36858 e!225573))

(declare-fun e!225572 () Bool)

(declare-fun array_inv!7480 (array!21228) Bool)

(assert (=> start!36858 (and (array_inv!7480 _values!506) e!225572)))

(assert (=> start!36858 tp!28713))

(assert (=> start!36858 true))

(declare-fun tp_is_empty!8647 () Bool)

(assert (=> start!36858 tp_is_empty!8647))

(declare-fun array_inv!7481 (array!21230) Bool)

(assert (=> start!36858 (array_inv!7481 _keys!658)))

(declare-fun b!368975 () Bool)

(declare-fun res!206936 () Bool)

(assert (=> b!368975 (=> (not res!206936) (not e!225573))))

(assert (=> b!368975 (= res!206936 (or (= (select (arr!10083 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10083 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!368976 () Bool)

(declare-fun res!206929 () Bool)

(assert (=> b!368976 (=> (not res!206929) (not e!225573))))

(assert (=> b!368976 (= res!206929 (and (= (size!10434 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10435 _keys!658) (size!10434 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!368977 () Bool)

(declare-fun e!225569 () Bool)

(assert (=> b!368977 (= e!225569 tp_is_empty!8647)))

(declare-fun b!368978 () Bool)

(declare-fun res!206934 () Bool)

(assert (=> b!368978 (=> (not res!206934) (not e!225573))))

(declare-fun arrayContainsKey!0 (array!21230 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!368978 (= res!206934 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!368979 () Bool)

(declare-fun e!225568 () Bool)

(declare-fun mapRes!14535 () Bool)

(assert (=> b!368979 (= e!225572 (and e!225568 mapRes!14535))))

(declare-fun condMapEmpty!14535 () Bool)

(declare-fun mapDefault!14535 () ValueCell!3980)

(assert (=> b!368979 (= condMapEmpty!14535 (= (arr!10082 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3980)) mapDefault!14535)))))

(declare-fun mapIsEmpty!14535 () Bool)

(assert (=> mapIsEmpty!14535 mapRes!14535))

(declare-fun b!368980 () Bool)

(declare-fun res!206930 () Bool)

(assert (=> b!368980 (=> (not res!206930) (not e!225571))))

(declare-datatypes ((List!5529 0))(
  ( (Nil!5526) (Cons!5525 (h!6381 (_ BitVec 64)) (t!10671 List!5529)) )
))
(declare-fun arrayNoDuplicates!0 (array!21230 (_ BitVec 32) List!5529) Bool)

(assert (=> b!368980 (= res!206930 (arrayNoDuplicates!0 lt!169659 #b00000000000000000000000000000000 Nil!5526))))

(declare-fun b!368981 () Bool)

(declare-fun res!206927 () Bool)

(assert (=> b!368981 (=> (not res!206927) (not e!225573))))

(assert (=> b!368981 (= res!206927 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5526))))

(declare-fun b!368982 () Bool)

(assert (=> b!368982 (= e!225568 tp_is_empty!8647)))

(declare-fun mapNonEmpty!14535 () Bool)

(declare-fun tp!28712 () Bool)

(assert (=> mapNonEmpty!14535 (= mapRes!14535 (and tp!28712 e!225569))))

(declare-fun mapKey!14535 () (_ BitVec 32))

(declare-fun mapValue!14535 () ValueCell!3980)

(declare-fun mapRest!14535 () (Array (_ BitVec 32) ValueCell!3980))

(assert (=> mapNonEmpty!14535 (= (arr!10082 _values!506) (store mapRest!14535 mapKey!14535 mapValue!14535))))

(declare-fun b!368983 () Bool)

(declare-fun res!206928 () Bool)

(assert (=> b!368983 (=> (not res!206928) (not e!225573))))

(assert (=> b!368983 (= res!206928 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10435 _keys!658))))))

(assert (= (and start!36858 res!206935) b!368976))

(assert (= (and b!368976 res!206929) b!368973))

(assert (= (and b!368973 res!206933) b!368981))

(assert (= (and b!368981 res!206927) b!368983))

(assert (= (and b!368983 res!206928) b!368972))

(assert (= (and b!368972 res!206931) b!368975))

(assert (= (and b!368975 res!206936) b!368978))

(assert (= (and b!368978 res!206934) b!368974))

(assert (= (and b!368974 res!206932) b!368980))

(assert (= (and b!368980 res!206930) b!368971))

(assert (= (and b!368979 condMapEmpty!14535) mapIsEmpty!14535))

(assert (= (and b!368979 (not condMapEmpty!14535)) mapNonEmpty!14535))

(get-info :version)

(assert (= (and mapNonEmpty!14535 ((_ is ValueCellFull!3980) mapValue!14535)) b!368977))

(assert (= (and b!368979 ((_ is ValueCellFull!3980) mapDefault!14535)) b!368982))

(assert (= start!36858 b!368979))

(declare-fun m!365723 () Bool)

(assert (=> mapNonEmpty!14535 m!365723))

(declare-fun m!365725 () Bool)

(assert (=> b!368981 m!365725))

(declare-fun m!365727 () Bool)

(assert (=> b!368971 m!365727))

(declare-fun m!365729 () Bool)

(assert (=> b!368971 m!365729))

(declare-fun m!365731 () Bool)

(assert (=> b!368971 m!365731))

(declare-fun m!365733 () Bool)

(assert (=> b!368975 m!365733))

(declare-fun m!365735 () Bool)

(assert (=> start!36858 m!365735))

(declare-fun m!365737 () Bool)

(assert (=> start!36858 m!365737))

(declare-fun m!365739 () Bool)

(assert (=> start!36858 m!365739))

(declare-fun m!365741 () Bool)

(assert (=> b!368974 m!365741))

(declare-fun m!365743 () Bool)

(assert (=> b!368974 m!365743))

(declare-fun m!365745 () Bool)

(assert (=> b!368973 m!365745))

(declare-fun m!365747 () Bool)

(assert (=> b!368978 m!365747))

(declare-fun m!365749 () Bool)

(assert (=> b!368972 m!365749))

(declare-fun m!365751 () Bool)

(assert (=> b!368980 m!365751))

(check-sat (not b!368971) (not start!36858) (not b!368981) (not b!368973) (not b!368972) (not b!368980) (not b!368978) (not mapNonEmpty!14535) (not b!368974) b_and!15255 (not b_next!7999) tp_is_empty!8647)
(check-sat b_and!15255 (not b_next!7999))
