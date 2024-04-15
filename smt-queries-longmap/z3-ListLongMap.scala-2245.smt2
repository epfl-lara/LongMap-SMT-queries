; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36918 () Bool)

(assert start!36918)

(declare-fun b_free!8059 () Bool)

(declare-fun b_next!8059 () Bool)

(assert (=> start!36918 (= b_free!8059 (not b_next!8059))))

(declare-fun tp!28893 () Bool)

(declare-fun b_and!15275 () Bool)

(assert (=> start!36918 (= tp!28893 b_and!15275)))

(declare-fun b!369919 () Bool)

(declare-fun res!207706 () Bool)

(declare-fun e!225971 () Bool)

(assert (=> b!369919 (=> (not res!207706) (not e!225971))))

(declare-datatypes ((array!21343 0))(
  ( (array!21344 (arr!10140 (Array (_ BitVec 32) (_ BitVec 64))) (size!10493 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21343)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21343 (_ BitVec 32)) Bool)

(assert (=> b!369919 (= res!207706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!369920 () Bool)

(declare-fun res!207707 () Bool)

(assert (=> b!369920 (=> (not res!207707) (not e!225971))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21343 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!369920 (= res!207707 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!369921 () Bool)

(declare-fun res!207704 () Bool)

(declare-fun e!225967 () Bool)

(assert (=> b!369921 (=> (not res!207704) (not e!225967))))

(declare-fun lt!169676 () array!21343)

(declare-datatypes ((List!5631 0))(
  ( (Nil!5628) (Cons!5627 (h!6483 (_ BitVec 64)) (t!10772 List!5631)) )
))
(declare-fun arrayNoDuplicates!0 (array!21343 (_ BitVec 32) List!5631) Bool)

(assert (=> b!369921 (= res!207704 (arrayNoDuplicates!0 lt!169676 #b00000000000000000000000000000000 Nil!5628))))

(declare-fun b!369922 () Bool)

(declare-fun e!225966 () Bool)

(declare-fun tp_is_empty!8707 () Bool)

(assert (=> b!369922 (= e!225966 tp_is_empty!8707)))

(declare-fun mapNonEmpty!14625 () Bool)

(declare-fun mapRes!14625 () Bool)

(declare-fun tp!28892 () Bool)

(declare-fun e!225968 () Bool)

(assert (=> mapNonEmpty!14625 (= mapRes!14625 (and tp!28892 e!225968))))

(declare-datatypes ((V!12715 0))(
  ( (V!12716 (val!4398 Int)) )
))
(declare-datatypes ((ValueCell!4010 0))(
  ( (ValueCellFull!4010 (v!6589 V!12715)) (EmptyCell!4010) )
))
(declare-fun mapRest!14625 () (Array (_ BitVec 32) ValueCell!4010))

(declare-datatypes ((array!21345 0))(
  ( (array!21346 (arr!10141 (Array (_ BitVec 32) ValueCell!4010)) (size!10494 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21345)

(declare-fun mapValue!14625 () ValueCell!4010)

(declare-fun mapKey!14625 () (_ BitVec 32))

(assert (=> mapNonEmpty!14625 (= (arr!10141 _values!506) (store mapRest!14625 mapKey!14625 mapValue!14625))))

(declare-fun b!369923 () Bool)

(declare-fun e!225970 () Bool)

(assert (=> b!369923 (= e!225970 (and e!225966 mapRes!14625))))

(declare-fun condMapEmpty!14625 () Bool)

(declare-fun mapDefault!14625 () ValueCell!4010)

(assert (=> b!369923 (= condMapEmpty!14625 (= (arr!10141 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4010)) mapDefault!14625)))))

(declare-fun b!369924 () Bool)

(declare-fun res!207709 () Bool)

(assert (=> b!369924 (=> (not res!207709) (not e!225971))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!369924 (= res!207709 (and (= (size!10494 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10493 _keys!658) (size!10494 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!369925 () Bool)

(declare-fun res!207703 () Bool)

(assert (=> b!369925 (=> (not res!207703) (not e!225971))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!369925 (= res!207703 (validKeyInArray!0 k0!778))))

(declare-fun res!207702 () Bool)

(assert (=> start!36918 (=> (not res!207702) (not e!225971))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36918 (= res!207702 (validMask!0 mask!970))))

(assert (=> start!36918 e!225971))

(declare-fun array_inv!7500 (array!21345) Bool)

(assert (=> start!36918 (and (array_inv!7500 _values!506) e!225970)))

(assert (=> start!36918 tp!28893))

(assert (=> start!36918 true))

(assert (=> start!36918 tp_is_empty!8707))

(declare-fun array_inv!7501 (array!21343) Bool)

(assert (=> start!36918 (array_inv!7501 _keys!658)))

(declare-fun b!369926 () Bool)

(assert (=> b!369926 (= e!225967 false)))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5800 0))(
  ( (tuple2!5801 (_1!2911 (_ BitVec 64)) (_2!2911 V!12715)) )
))
(declare-datatypes ((List!5632 0))(
  ( (Nil!5629) (Cons!5628 (h!6484 tuple2!5800) (t!10773 List!5632)) )
))
(declare-datatypes ((ListLongMap!4703 0))(
  ( (ListLongMap!4704 (toList!2367 List!5632)) )
))
(declare-fun lt!169675 () ListLongMap!4703)

(declare-fun zeroValue!472 () V!12715)

(declare-fun v!373 () V!12715)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!12715)

(declare-fun getCurrentListMapNoExtraKeys!658 (array!21343 array!21345 (_ BitVec 32) (_ BitVec 32) V!12715 V!12715 (_ BitVec 32) Int) ListLongMap!4703)

(assert (=> b!369926 (= lt!169675 (getCurrentListMapNoExtraKeys!658 lt!169676 (array!21346 (store (arr!10141 _values!506) i!548 (ValueCellFull!4010 v!373)) (size!10494 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169677 () ListLongMap!4703)

(assert (=> b!369926 (= lt!169677 (getCurrentListMapNoExtraKeys!658 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!369927 () Bool)

(declare-fun res!207708 () Bool)

(assert (=> b!369927 (=> (not res!207708) (not e!225971))))

(assert (=> b!369927 (= res!207708 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10493 _keys!658))))))

(declare-fun b!369928 () Bool)

(declare-fun res!207710 () Bool)

(assert (=> b!369928 (=> (not res!207710) (not e!225971))))

(assert (=> b!369928 (= res!207710 (or (= (select (arr!10140 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10140 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!369929 () Bool)

(assert (=> b!369929 (= e!225968 tp_is_empty!8707)))

(declare-fun mapIsEmpty!14625 () Bool)

(assert (=> mapIsEmpty!14625 mapRes!14625))

(declare-fun b!369930 () Bool)

(declare-fun res!207705 () Bool)

(assert (=> b!369930 (=> (not res!207705) (not e!225971))))

(assert (=> b!369930 (= res!207705 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5628))))

(declare-fun b!369931 () Bool)

(assert (=> b!369931 (= e!225971 e!225967)))

(declare-fun res!207701 () Bool)

(assert (=> b!369931 (=> (not res!207701) (not e!225967))))

(assert (=> b!369931 (= res!207701 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169676 mask!970))))

(assert (=> b!369931 (= lt!169676 (array!21344 (store (arr!10140 _keys!658) i!548 k0!778) (size!10493 _keys!658)))))

(assert (= (and start!36918 res!207702) b!369924))

(assert (= (and b!369924 res!207709) b!369919))

(assert (= (and b!369919 res!207706) b!369930))

(assert (= (and b!369930 res!207705) b!369927))

(assert (= (and b!369927 res!207708) b!369925))

(assert (= (and b!369925 res!207703) b!369928))

(assert (= (and b!369928 res!207710) b!369920))

(assert (= (and b!369920 res!207707) b!369931))

(assert (= (and b!369931 res!207701) b!369921))

(assert (= (and b!369921 res!207704) b!369926))

(assert (= (and b!369923 condMapEmpty!14625) mapIsEmpty!14625))

(assert (= (and b!369923 (not condMapEmpty!14625)) mapNonEmpty!14625))

(get-info :version)

(assert (= (and mapNonEmpty!14625 ((_ is ValueCellFull!4010) mapValue!14625)) b!369929))

(assert (= (and b!369923 ((_ is ValueCellFull!4010) mapDefault!14625)) b!369922))

(assert (= start!36918 b!369923))

(declare-fun m!365669 () Bool)

(assert (=> b!369931 m!365669))

(declare-fun m!365671 () Bool)

(assert (=> b!369931 m!365671))

(declare-fun m!365673 () Bool)

(assert (=> b!369920 m!365673))

(declare-fun m!365675 () Bool)

(assert (=> b!369926 m!365675))

(declare-fun m!365677 () Bool)

(assert (=> b!369926 m!365677))

(declare-fun m!365679 () Bool)

(assert (=> b!369926 m!365679))

(declare-fun m!365681 () Bool)

(assert (=> start!36918 m!365681))

(declare-fun m!365683 () Bool)

(assert (=> start!36918 m!365683))

(declare-fun m!365685 () Bool)

(assert (=> start!36918 m!365685))

(declare-fun m!365687 () Bool)

(assert (=> b!369928 m!365687))

(declare-fun m!365689 () Bool)

(assert (=> b!369919 m!365689))

(declare-fun m!365691 () Bool)

(assert (=> mapNonEmpty!14625 m!365691))

(declare-fun m!365693 () Bool)

(assert (=> b!369930 m!365693))

(declare-fun m!365695 () Bool)

(assert (=> b!369921 m!365695))

(declare-fun m!365697 () Bool)

(assert (=> b!369925 m!365697))

(check-sat (not b!369919) b_and!15275 (not b!369926) (not b!369931) (not b_next!8059) tp_is_empty!8707 (not b!369920) (not start!36918) (not mapNonEmpty!14625) (not b!369921) (not b!369925) (not b!369930))
(check-sat b_and!15275 (not b_next!8059))
