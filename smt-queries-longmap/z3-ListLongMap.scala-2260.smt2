; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37008 () Bool)

(assert start!37008)

(declare-fun b_free!8149 () Bool)

(declare-fun b_next!8149 () Bool)

(assert (=> start!37008 (= b_free!8149 (not b_next!8149))))

(declare-fun tp!29163 () Bool)

(declare-fun b_and!15365 () Bool)

(assert (=> start!37008 (= tp!29163 b_and!15365)))

(declare-fun b!371675 () Bool)

(declare-fun e!226781 () Bool)

(assert (=> b!371675 (= e!226781 (not true))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12835 0))(
  ( (V!12836 (val!4443 Int)) )
))
(declare-datatypes ((ValueCell!4055 0))(
  ( (ValueCellFull!4055 (v!6634 V!12835)) (EmptyCell!4055) )
))
(declare-datatypes ((array!21519 0))(
  ( (array!21520 (arr!10228 (Array (_ BitVec 32) ValueCell!4055)) (size!10581 (_ BitVec 32))) )
))
(declare-fun lt!170252 () array!21519)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((array!21521 0))(
  ( (array!21522 (arr!10229 (Array (_ BitVec 32) (_ BitVec 64))) (size!10582 (_ BitVec 32))) )
))
(declare-fun lt!170253 () array!21521)

(declare-datatypes ((tuple2!5868 0))(
  ( (tuple2!5869 (_1!2945 (_ BitVec 64)) (_2!2945 V!12835)) )
))
(declare-datatypes ((List!5704 0))(
  ( (Nil!5701) (Cons!5700 (h!6556 tuple2!5868) (t!10845 List!5704)) )
))
(declare-datatypes ((ListLongMap!4771 0))(
  ( (ListLongMap!4772 (toList!2401 List!5704)) )
))
(declare-fun lt!170255 () ListLongMap!4771)

(declare-fun zeroValue!472 () V!12835)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!12835)

(declare-fun getCurrentListMap!1827 (array!21521 array!21519 (_ BitVec 32) (_ BitVec 32) V!12835 V!12835 (_ BitVec 32) Int) ListLongMap!4771)

(assert (=> b!371675 (= lt!170255 (getCurrentListMap!1827 lt!170253 lt!170252 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170251 () ListLongMap!4771)

(declare-fun lt!170250 () ListLongMap!4771)

(assert (=> b!371675 (and (= lt!170251 lt!170250) (= lt!170250 lt!170251))))

(declare-fun v!373 () V!12835)

(declare-fun lt!170256 () ListLongMap!4771)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun +!769 (ListLongMap!4771 tuple2!5868) ListLongMap!4771)

(assert (=> b!371675 (= lt!170250 (+!769 lt!170256 (tuple2!5869 k0!778 v!373)))))

(declare-fun _values!506 () array!21519)

(declare-datatypes ((Unit!11414 0))(
  ( (Unit!11415) )
))
(declare-fun lt!170254 () Unit!11414)

(declare-fun _keys!658 () array!21521)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!20 (array!21521 array!21519 (_ BitVec 32) (_ BitVec 32) V!12835 V!12835 (_ BitVec 32) (_ BitVec 64) V!12835 (_ BitVec 32) Int) Unit!11414)

(assert (=> b!371675 (= lt!170254 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!20 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!692 (array!21521 array!21519 (_ BitVec 32) (_ BitVec 32) V!12835 V!12835 (_ BitVec 32) Int) ListLongMap!4771)

(assert (=> b!371675 (= lt!170251 (getCurrentListMapNoExtraKeys!692 lt!170253 lt!170252 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!371675 (= lt!170252 (array!21520 (store (arr!10228 _values!506) i!548 (ValueCellFull!4055 v!373)) (size!10581 _values!506)))))

(assert (=> b!371675 (= lt!170256 (getCurrentListMapNoExtraKeys!692 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!371676 () Bool)

(declare-fun res!209052 () Bool)

(declare-fun e!226777 () Bool)

(assert (=> b!371676 (=> (not res!209052) (not e!226777))))

(assert (=> b!371676 (= res!209052 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10582 _keys!658))))))

(declare-fun b!371677 () Bool)

(declare-fun res!209055 () Bool)

(assert (=> b!371677 (=> (not res!209055) (not e!226777))))

(declare-datatypes ((List!5705 0))(
  ( (Nil!5702) (Cons!5701 (h!6557 (_ BitVec 64)) (t!10846 List!5705)) )
))
(declare-fun arrayNoDuplicates!0 (array!21521 (_ BitVec 32) List!5705) Bool)

(assert (=> b!371677 (= res!209055 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5702))))

(declare-fun b!371678 () Bool)

(declare-fun res!209058 () Bool)

(assert (=> b!371678 (=> (not res!209058) (not e!226777))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21521 (_ BitVec 32)) Bool)

(assert (=> b!371678 (= res!209058 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!371679 () Bool)

(declare-fun res!209057 () Bool)

(assert (=> b!371679 (=> (not res!209057) (not e!226777))))

(assert (=> b!371679 (= res!209057 (or (= (select (arr!10229 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10229 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!371680 () Bool)

(declare-fun e!226779 () Bool)

(declare-fun tp_is_empty!8797 () Bool)

(assert (=> b!371680 (= e!226779 tp_is_empty!8797)))

(declare-fun b!371681 () Bool)

(declare-fun res!209060 () Bool)

(assert (=> b!371681 (=> (not res!209060) (not e!226777))))

(assert (=> b!371681 (= res!209060 (and (= (size!10581 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10582 _keys!658) (size!10581 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!371682 () Bool)

(declare-fun res!209054 () Bool)

(assert (=> b!371682 (=> (not res!209054) (not e!226781))))

(assert (=> b!371682 (= res!209054 (arrayNoDuplicates!0 lt!170253 #b00000000000000000000000000000000 Nil!5702))))

(declare-fun b!371683 () Bool)

(declare-fun e!226776 () Bool)

(declare-fun mapRes!14760 () Bool)

(assert (=> b!371683 (= e!226776 (and e!226779 mapRes!14760))))

(declare-fun condMapEmpty!14760 () Bool)

(declare-fun mapDefault!14760 () ValueCell!4055)

(assert (=> b!371683 (= condMapEmpty!14760 (= (arr!10228 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4055)) mapDefault!14760)))))

(declare-fun b!371684 () Bool)

(assert (=> b!371684 (= e!226777 e!226781)))

(declare-fun res!209053 () Bool)

(assert (=> b!371684 (=> (not res!209053) (not e!226781))))

(assert (=> b!371684 (= res!209053 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170253 mask!970))))

(assert (=> b!371684 (= lt!170253 (array!21522 (store (arr!10229 _keys!658) i!548 k0!778) (size!10582 _keys!658)))))

(declare-fun b!371674 () Bool)

(declare-fun res!209059 () Bool)

(assert (=> b!371674 (=> (not res!209059) (not e!226777))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!371674 (= res!209059 (validKeyInArray!0 k0!778))))

(declare-fun res!209056 () Bool)

(assert (=> start!37008 (=> (not res!209056) (not e!226777))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37008 (= res!209056 (validMask!0 mask!970))))

(assert (=> start!37008 e!226777))

(declare-fun array_inv!7556 (array!21519) Bool)

(assert (=> start!37008 (and (array_inv!7556 _values!506) e!226776)))

(assert (=> start!37008 tp!29163))

(assert (=> start!37008 true))

(assert (=> start!37008 tp_is_empty!8797))

(declare-fun array_inv!7557 (array!21521) Bool)

(assert (=> start!37008 (array_inv!7557 _keys!658)))

(declare-fun mapNonEmpty!14760 () Bool)

(declare-fun tp!29162 () Bool)

(declare-fun e!226780 () Bool)

(assert (=> mapNonEmpty!14760 (= mapRes!14760 (and tp!29162 e!226780))))

(declare-fun mapValue!14760 () ValueCell!4055)

(declare-fun mapKey!14760 () (_ BitVec 32))

(declare-fun mapRest!14760 () (Array (_ BitVec 32) ValueCell!4055))

(assert (=> mapNonEmpty!14760 (= (arr!10228 _values!506) (store mapRest!14760 mapKey!14760 mapValue!14760))))

(declare-fun mapIsEmpty!14760 () Bool)

(assert (=> mapIsEmpty!14760 mapRes!14760))

(declare-fun b!371685 () Bool)

(assert (=> b!371685 (= e!226780 tp_is_empty!8797)))

(declare-fun b!371686 () Bool)

(declare-fun res!209051 () Bool)

(assert (=> b!371686 (=> (not res!209051) (not e!226777))))

(declare-fun arrayContainsKey!0 (array!21521 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!371686 (= res!209051 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(assert (= (and start!37008 res!209056) b!371681))

(assert (= (and b!371681 res!209060) b!371678))

(assert (= (and b!371678 res!209058) b!371677))

(assert (= (and b!371677 res!209055) b!371676))

(assert (= (and b!371676 res!209052) b!371674))

(assert (= (and b!371674 res!209059) b!371679))

(assert (= (and b!371679 res!209057) b!371686))

(assert (= (and b!371686 res!209051) b!371684))

(assert (= (and b!371684 res!209053) b!371682))

(assert (= (and b!371682 res!209054) b!371675))

(assert (= (and b!371683 condMapEmpty!14760) mapIsEmpty!14760))

(assert (= (and b!371683 (not condMapEmpty!14760)) mapNonEmpty!14760))

(get-info :version)

(assert (= (and mapNonEmpty!14760 ((_ is ValueCellFull!4055) mapValue!14760)) b!371685))

(assert (= (and b!371683 ((_ is ValueCellFull!4055) mapDefault!14760)) b!371680))

(assert (= start!37008 b!371683))

(declare-fun m!367127 () Bool)

(assert (=> b!371682 m!367127))

(declare-fun m!367129 () Bool)

(assert (=> b!371675 m!367129))

(declare-fun m!367131 () Bool)

(assert (=> b!371675 m!367131))

(declare-fun m!367133 () Bool)

(assert (=> b!371675 m!367133))

(declare-fun m!367135 () Bool)

(assert (=> b!371675 m!367135))

(declare-fun m!367137 () Bool)

(assert (=> b!371675 m!367137))

(declare-fun m!367139 () Bool)

(assert (=> b!371675 m!367139))

(declare-fun m!367141 () Bool)

(assert (=> b!371674 m!367141))

(declare-fun m!367143 () Bool)

(assert (=> b!371686 m!367143))

(declare-fun m!367145 () Bool)

(assert (=> b!371678 m!367145))

(declare-fun m!367147 () Bool)

(assert (=> mapNonEmpty!14760 m!367147))

(declare-fun m!367149 () Bool)

(assert (=> b!371679 m!367149))

(declare-fun m!367151 () Bool)

(assert (=> start!37008 m!367151))

(declare-fun m!367153 () Bool)

(assert (=> start!37008 m!367153))

(declare-fun m!367155 () Bool)

(assert (=> start!37008 m!367155))

(declare-fun m!367157 () Bool)

(assert (=> b!371684 m!367157))

(declare-fun m!367159 () Bool)

(assert (=> b!371684 m!367159))

(declare-fun m!367161 () Bool)

(assert (=> b!371677 m!367161))

(check-sat (not b!371674) (not b!371684) b_and!15365 (not b!371677) (not b!371682) (not b!371675) (not b!371678) (not b_next!8149) (not mapNonEmpty!14760) (not b!371686) tp_is_empty!8797 (not start!37008))
(check-sat b_and!15365 (not b_next!8149))
