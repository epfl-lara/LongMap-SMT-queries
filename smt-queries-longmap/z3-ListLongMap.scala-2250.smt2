; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36948 () Bool)

(assert start!36948)

(declare-fun b_free!8089 () Bool)

(declare-fun b_next!8089 () Bool)

(assert (=> start!36948 (= b_free!8089 (not b_next!8089))))

(declare-fun tp!28982 () Bool)

(declare-fun b_and!15305 () Bool)

(assert (=> start!36948 (= tp!28982 b_and!15305)))

(declare-fun b!370504 () Bool)

(declare-fun e!226236 () Bool)

(declare-fun e!226239 () Bool)

(declare-fun mapRes!14670 () Bool)

(assert (=> b!370504 (= e!226236 (and e!226239 mapRes!14670))))

(declare-fun condMapEmpty!14670 () Bool)

(declare-datatypes ((V!12755 0))(
  ( (V!12756 (val!4413 Int)) )
))
(declare-datatypes ((ValueCell!4025 0))(
  ( (ValueCellFull!4025 (v!6604 V!12755)) (EmptyCell!4025) )
))
(declare-datatypes ((array!21401 0))(
  ( (array!21402 (arr!10169 (Array (_ BitVec 32) ValueCell!4025)) (size!10522 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21401)

(declare-fun mapDefault!14670 () ValueCell!4025)

(assert (=> b!370504 (= condMapEmpty!14670 (= (arr!10169 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4025)) mapDefault!14670)))))

(declare-fun b!370505 () Bool)

(declare-fun res!208159 () Bool)

(declare-fun e!226238 () Bool)

(assert (=> b!370505 (=> (not res!208159) (not e!226238))))

(declare-datatypes ((array!21403 0))(
  ( (array!21404 (arr!10170 (Array (_ BitVec 32) (_ BitVec 64))) (size!10523 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21403)

(declare-datatypes ((List!5658 0))(
  ( (Nil!5655) (Cons!5654 (h!6510 (_ BitVec 64)) (t!10799 List!5658)) )
))
(declare-fun arrayNoDuplicates!0 (array!21403 (_ BitVec 32) List!5658) Bool)

(assert (=> b!370505 (= res!208159 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5655))))

(declare-fun b!370506 () Bool)

(declare-fun res!208152 () Bool)

(assert (=> b!370506 (=> (not res!208152) (not e!226238))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!370506 (= res!208152 (and (= (size!10522 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10523 _keys!658) (size!10522 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!370507 () Bool)

(declare-fun res!208151 () Bool)

(assert (=> b!370507 (=> (not res!208151) (not e!226238))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21403 (_ BitVec 32)) Bool)

(assert (=> b!370507 (= res!208151 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!370508 () Bool)

(declare-fun res!208158 () Bool)

(declare-fun e!226237 () Bool)

(assert (=> b!370508 (=> (not res!208158) (not e!226237))))

(declare-fun lt!169812 () array!21403)

(assert (=> b!370508 (= res!208158 (arrayNoDuplicates!0 lt!169812 #b00000000000000000000000000000000 Nil!5655))))

(declare-fun b!370509 () Bool)

(declare-fun res!208153 () Bool)

(assert (=> b!370509 (=> (not res!208153) (not e!226238))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21403 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!370509 (= res!208153 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!14670 () Bool)

(declare-fun tp!28983 () Bool)

(declare-fun e!226241 () Bool)

(assert (=> mapNonEmpty!14670 (= mapRes!14670 (and tp!28983 e!226241))))

(declare-fun mapKey!14670 () (_ BitVec 32))

(declare-fun mapRest!14670 () (Array (_ BitVec 32) ValueCell!4025))

(declare-fun mapValue!14670 () ValueCell!4025)

(assert (=> mapNonEmpty!14670 (= (arr!10169 _values!506) (store mapRest!14670 mapKey!14670 mapValue!14670))))

(declare-fun b!370510 () Bool)

(declare-fun res!208155 () Bool)

(assert (=> b!370510 (=> (not res!208155) (not e!226238))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!370510 (= res!208155 (or (= (select (arr!10170 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10170 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14670 () Bool)

(assert (=> mapIsEmpty!14670 mapRes!14670))

(declare-fun res!208160 () Bool)

(assert (=> start!36948 (=> (not res!208160) (not e!226238))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36948 (= res!208160 (validMask!0 mask!970))))

(assert (=> start!36948 e!226238))

(declare-fun array_inv!7520 (array!21401) Bool)

(assert (=> start!36948 (and (array_inv!7520 _values!506) e!226236)))

(assert (=> start!36948 tp!28982))

(assert (=> start!36948 true))

(declare-fun tp_is_empty!8737 () Bool)

(assert (=> start!36948 tp_is_empty!8737))

(declare-fun array_inv!7521 (array!21403) Bool)

(assert (=> start!36948 (array_inv!7521 _keys!658)))

(declare-fun b!370511 () Bool)

(assert (=> b!370511 (= e!226241 tp_is_empty!8737)))

(declare-fun b!370512 () Bool)

(assert (=> b!370512 (= e!226239 tp_is_empty!8737)))

(declare-fun b!370513 () Bool)

(declare-fun res!208157 () Bool)

(assert (=> b!370513 (=> (not res!208157) (not e!226238))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!370513 (= res!208157 (validKeyInArray!0 k0!778))))

(declare-fun b!370514 () Bool)

(assert (=> b!370514 (= e!226237 false)))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5826 0))(
  ( (tuple2!5827 (_1!2924 (_ BitVec 64)) (_2!2924 V!12755)) )
))
(declare-datatypes ((List!5659 0))(
  ( (Nil!5656) (Cons!5655 (h!6511 tuple2!5826) (t!10800 List!5659)) )
))
(declare-datatypes ((ListLongMap!4729 0))(
  ( (ListLongMap!4730 (toList!2380 List!5659)) )
))
(declare-fun lt!169811 () ListLongMap!4729)

(declare-fun zeroValue!472 () V!12755)

(declare-fun v!373 () V!12755)

(declare-fun minValue!472 () V!12755)

(declare-fun getCurrentListMapNoExtraKeys!671 (array!21403 array!21401 (_ BitVec 32) (_ BitVec 32) V!12755 V!12755 (_ BitVec 32) Int) ListLongMap!4729)

(assert (=> b!370514 (= lt!169811 (getCurrentListMapNoExtraKeys!671 lt!169812 (array!21402 (store (arr!10169 _values!506) i!548 (ValueCellFull!4025 v!373)) (size!10522 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169810 () ListLongMap!4729)

(assert (=> b!370514 (= lt!169810 (getCurrentListMapNoExtraKeys!671 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!370515 () Bool)

(declare-fun res!208154 () Bool)

(assert (=> b!370515 (=> (not res!208154) (not e!226238))))

(assert (=> b!370515 (= res!208154 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10523 _keys!658))))))

(declare-fun b!370516 () Bool)

(assert (=> b!370516 (= e!226238 e!226237)))

(declare-fun res!208156 () Bool)

(assert (=> b!370516 (=> (not res!208156) (not e!226237))))

(assert (=> b!370516 (= res!208156 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169812 mask!970))))

(assert (=> b!370516 (= lt!169812 (array!21404 (store (arr!10170 _keys!658) i!548 k0!778) (size!10523 _keys!658)))))

(assert (= (and start!36948 res!208160) b!370506))

(assert (= (and b!370506 res!208152) b!370507))

(assert (= (and b!370507 res!208151) b!370505))

(assert (= (and b!370505 res!208159) b!370515))

(assert (= (and b!370515 res!208154) b!370513))

(assert (= (and b!370513 res!208157) b!370510))

(assert (= (and b!370510 res!208155) b!370509))

(assert (= (and b!370509 res!208153) b!370516))

(assert (= (and b!370516 res!208156) b!370508))

(assert (= (and b!370508 res!208158) b!370514))

(assert (= (and b!370504 condMapEmpty!14670) mapIsEmpty!14670))

(assert (= (and b!370504 (not condMapEmpty!14670)) mapNonEmpty!14670))

(get-info :version)

(assert (= (and mapNonEmpty!14670 ((_ is ValueCellFull!4025) mapValue!14670)) b!370511))

(assert (= (and b!370504 ((_ is ValueCellFull!4025) mapDefault!14670)) b!370512))

(assert (= start!36948 b!370504))

(declare-fun m!366119 () Bool)

(assert (=> b!370510 m!366119))

(declare-fun m!366121 () Bool)

(assert (=> b!370516 m!366121))

(declare-fun m!366123 () Bool)

(assert (=> b!370516 m!366123))

(declare-fun m!366125 () Bool)

(assert (=> b!370509 m!366125))

(declare-fun m!366127 () Bool)

(assert (=> start!36948 m!366127))

(declare-fun m!366129 () Bool)

(assert (=> start!36948 m!366129))

(declare-fun m!366131 () Bool)

(assert (=> start!36948 m!366131))

(declare-fun m!366133 () Bool)

(assert (=> mapNonEmpty!14670 m!366133))

(declare-fun m!366135 () Bool)

(assert (=> b!370514 m!366135))

(declare-fun m!366137 () Bool)

(assert (=> b!370514 m!366137))

(declare-fun m!366139 () Bool)

(assert (=> b!370514 m!366139))

(declare-fun m!366141 () Bool)

(assert (=> b!370513 m!366141))

(declare-fun m!366143 () Bool)

(assert (=> b!370507 m!366143))

(declare-fun m!366145 () Bool)

(assert (=> b!370505 m!366145))

(declare-fun m!366147 () Bool)

(assert (=> b!370508 m!366147))

(check-sat (not b!370509) b_and!15305 (not b!370508) (not b!370514) (not b_next!8089) (not mapNonEmpty!14670) (not b!370516) (not b!370505) (not b!370507) (not b!370513) tp_is_empty!8737 (not start!36948))
(check-sat b_and!15305 (not b_next!8089))
