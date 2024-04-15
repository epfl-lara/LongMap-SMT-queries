; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36882 () Bool)

(assert start!36882)

(declare-fun b_free!8023 () Bool)

(declare-fun b_next!8023 () Bool)

(assert (=> start!36882 (= b_free!8023 (not b_next!8023))))

(declare-fun tp!28784 () Bool)

(declare-fun b_and!15239 () Bool)

(assert (=> start!36882 (= tp!28784 b_and!15239)))

(declare-fun mapNonEmpty!14571 () Bool)

(declare-fun mapRes!14571 () Bool)

(declare-fun tp!28785 () Bool)

(declare-fun e!225647 () Bool)

(assert (=> mapNonEmpty!14571 (= mapRes!14571 (and tp!28785 e!225647))))

(declare-datatypes ((V!12667 0))(
  ( (V!12668 (val!4380 Int)) )
))
(declare-datatypes ((ValueCell!3992 0))(
  ( (ValueCellFull!3992 (v!6571 V!12667)) (EmptyCell!3992) )
))
(declare-fun mapRest!14571 () (Array (_ BitVec 32) ValueCell!3992))

(declare-datatypes ((array!21277 0))(
  ( (array!21278 (arr!10107 (Array (_ BitVec 32) ValueCell!3992)) (size!10460 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21277)

(declare-fun mapKey!14571 () (_ BitVec 32))

(declare-fun mapValue!14571 () ValueCell!3992)

(assert (=> mapNonEmpty!14571 (= (arr!10107 _values!506) (store mapRest!14571 mapKey!14571 mapValue!14571))))

(declare-fun b!369217 () Bool)

(declare-fun e!225642 () Bool)

(declare-fun e!225646 () Bool)

(assert (=> b!369217 (= e!225642 (and e!225646 mapRes!14571))))

(declare-fun condMapEmpty!14571 () Bool)

(declare-fun mapDefault!14571 () ValueCell!3992)

(assert (=> b!369217 (= condMapEmpty!14571 (= (arr!10107 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3992)) mapDefault!14571)))))

(declare-fun b!369218 () Bool)

(declare-fun res!207168 () Bool)

(declare-fun e!225643 () Bool)

(assert (=> b!369218 (=> (not res!207168) (not e!225643))))

(declare-datatypes ((array!21279 0))(
  ( (array!21280 (arr!10108 (Array (_ BitVec 32) (_ BitVec 64))) (size!10461 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21279)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21279 (_ BitVec 32)) Bool)

(assert (=> b!369218 (= res!207168 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!369219 () Bool)

(declare-fun res!207165 () Bool)

(assert (=> b!369219 (=> (not res!207165) (not e!225643))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!369219 (= res!207165 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10461 _keys!658))))))

(declare-fun b!369220 () Bool)

(declare-fun res!207164 () Bool)

(assert (=> b!369220 (=> (not res!207164) (not e!225643))))

(assert (=> b!369220 (= res!207164 (or (= (select (arr!10108 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10108 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!369221 () Bool)

(declare-fun res!207166 () Bool)

(assert (=> b!369221 (=> (not res!207166) (not e!225643))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!369221 (= res!207166 (validKeyInArray!0 k0!778))))

(declare-fun b!369222 () Bool)

(declare-fun tp_is_empty!8671 () Bool)

(assert (=> b!369222 (= e!225646 tp_is_empty!8671)))

(declare-fun b!369223 () Bool)

(declare-fun e!225644 () Bool)

(assert (=> b!369223 (= e!225644 false)))

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!169513 () array!21279)

(declare-fun zeroValue!472 () V!12667)

(declare-datatypes ((tuple2!5780 0))(
  ( (tuple2!5781 (_1!2901 (_ BitVec 64)) (_2!2901 V!12667)) )
))
(declare-datatypes ((List!5610 0))(
  ( (Nil!5607) (Cons!5606 (h!6462 tuple2!5780) (t!10751 List!5610)) )
))
(declare-datatypes ((ListLongMap!4683 0))(
  ( (ListLongMap!4684 (toList!2357 List!5610)) )
))
(declare-fun lt!169514 () ListLongMap!4683)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!12667)

(declare-fun minValue!472 () V!12667)

(declare-fun getCurrentListMapNoExtraKeys!648 (array!21279 array!21277 (_ BitVec 32) (_ BitVec 32) V!12667 V!12667 (_ BitVec 32) Int) ListLongMap!4683)

(assert (=> b!369223 (= lt!169514 (getCurrentListMapNoExtraKeys!648 lt!169513 (array!21278 (store (arr!10107 _values!506) i!548 (ValueCellFull!3992 v!373)) (size!10460 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169515 () ListLongMap!4683)

(assert (=> b!369223 (= lt!169515 (getCurrentListMapNoExtraKeys!648 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!369224 () Bool)

(declare-fun res!207162 () Bool)

(assert (=> b!369224 (=> (not res!207162) (not e!225643))))

(assert (=> b!369224 (= res!207162 (and (= (size!10460 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10461 _keys!658) (size!10460 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!207163 () Bool)

(assert (=> start!36882 (=> (not res!207163) (not e!225643))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36882 (= res!207163 (validMask!0 mask!970))))

(assert (=> start!36882 e!225643))

(declare-fun array_inv!7484 (array!21277) Bool)

(assert (=> start!36882 (and (array_inv!7484 _values!506) e!225642)))

(assert (=> start!36882 tp!28784))

(assert (=> start!36882 true))

(assert (=> start!36882 tp_is_empty!8671))

(declare-fun array_inv!7485 (array!21279) Bool)

(assert (=> start!36882 (array_inv!7485 _keys!658)))

(declare-fun b!369225 () Bool)

(declare-fun res!207167 () Bool)

(assert (=> b!369225 (=> (not res!207167) (not e!225643))))

(declare-fun arrayContainsKey!0 (array!21279 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!369225 (= res!207167 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!369226 () Bool)

(assert (=> b!369226 (= e!225643 e!225644)))

(declare-fun res!207161 () Bool)

(assert (=> b!369226 (=> (not res!207161) (not e!225644))))

(assert (=> b!369226 (= res!207161 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169513 mask!970))))

(assert (=> b!369226 (= lt!169513 (array!21280 (store (arr!10108 _keys!658) i!548 k0!778) (size!10461 _keys!658)))))

(declare-fun mapIsEmpty!14571 () Bool)

(assert (=> mapIsEmpty!14571 mapRes!14571))

(declare-fun b!369227 () Bool)

(assert (=> b!369227 (= e!225647 tp_is_empty!8671)))

(declare-fun b!369228 () Bool)

(declare-fun res!207169 () Bool)

(assert (=> b!369228 (=> (not res!207169) (not e!225644))))

(declare-datatypes ((List!5611 0))(
  ( (Nil!5608) (Cons!5607 (h!6463 (_ BitVec 64)) (t!10752 List!5611)) )
))
(declare-fun arrayNoDuplicates!0 (array!21279 (_ BitVec 32) List!5611) Bool)

(assert (=> b!369228 (= res!207169 (arrayNoDuplicates!0 lt!169513 #b00000000000000000000000000000000 Nil!5608))))

(declare-fun b!369229 () Bool)

(declare-fun res!207170 () Bool)

(assert (=> b!369229 (=> (not res!207170) (not e!225643))))

(assert (=> b!369229 (= res!207170 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5608))))

(assert (= (and start!36882 res!207163) b!369224))

(assert (= (and b!369224 res!207162) b!369218))

(assert (= (and b!369218 res!207168) b!369229))

(assert (= (and b!369229 res!207170) b!369219))

(assert (= (and b!369219 res!207165) b!369221))

(assert (= (and b!369221 res!207166) b!369220))

(assert (= (and b!369220 res!207164) b!369225))

(assert (= (and b!369225 res!207167) b!369226))

(assert (= (and b!369226 res!207161) b!369228))

(assert (= (and b!369228 res!207169) b!369223))

(assert (= (and b!369217 condMapEmpty!14571) mapIsEmpty!14571))

(assert (= (and b!369217 (not condMapEmpty!14571)) mapNonEmpty!14571))

(get-info :version)

(assert (= (and mapNonEmpty!14571 ((_ is ValueCellFull!3992) mapValue!14571)) b!369227))

(assert (= (and b!369217 ((_ is ValueCellFull!3992) mapDefault!14571)) b!369222))

(assert (= start!36882 b!369217))

(declare-fun m!365129 () Bool)

(assert (=> b!369229 m!365129))

(declare-fun m!365131 () Bool)

(assert (=> b!369226 m!365131))

(declare-fun m!365133 () Bool)

(assert (=> b!369226 m!365133))

(declare-fun m!365135 () Bool)

(assert (=> b!369225 m!365135))

(declare-fun m!365137 () Bool)

(assert (=> b!369218 m!365137))

(declare-fun m!365139 () Bool)

(assert (=> b!369223 m!365139))

(declare-fun m!365141 () Bool)

(assert (=> b!369223 m!365141))

(declare-fun m!365143 () Bool)

(assert (=> b!369223 m!365143))

(declare-fun m!365145 () Bool)

(assert (=> mapNonEmpty!14571 m!365145))

(declare-fun m!365147 () Bool)

(assert (=> start!36882 m!365147))

(declare-fun m!365149 () Bool)

(assert (=> start!36882 m!365149))

(declare-fun m!365151 () Bool)

(assert (=> start!36882 m!365151))

(declare-fun m!365153 () Bool)

(assert (=> b!369221 m!365153))

(declare-fun m!365155 () Bool)

(assert (=> b!369228 m!365155))

(declare-fun m!365157 () Bool)

(assert (=> b!369220 m!365157))

(check-sat (not b!369221) b_and!15239 (not b!369229) (not start!36882) (not b_next!8023) (not b!369223) (not b!369218) tp_is_empty!8671 (not b!369225) (not b!369226) (not mapNonEmpty!14571) (not b!369228))
(check-sat b_and!15239 (not b_next!8023))
