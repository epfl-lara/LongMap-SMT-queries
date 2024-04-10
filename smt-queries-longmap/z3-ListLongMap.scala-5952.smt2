; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77540 () Bool)

(assert start!77540)

(declare-fun b_free!16125 () Bool)

(declare-fun b_next!16125 () Bool)

(assert (=> start!77540 (= b_free!16125 (not b_next!16125))))

(declare-fun tp!56636 () Bool)

(declare-fun b_and!26491 () Bool)

(assert (=> start!77540 (= tp!56636 b_and!26491)))

(declare-fun res!609547 () Bool)

(declare-fun e!506186 () Bool)

(assert (=> start!77540 (=> (not res!609547) (not e!506186))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77540 (= res!609547 (validMask!0 mask!1756))))

(assert (=> start!77540 e!506186))

(declare-datatypes ((V!29689 0))(
  ( (V!29690 (val!9322 Int)) )
))
(declare-datatypes ((ValueCell!8790 0))(
  ( (ValueCellFull!8790 (v!11827 V!29689)) (EmptyCell!8790) )
))
(declare-datatypes ((array!53142 0))(
  ( (array!53143 (arr!25530 (Array (_ BitVec 32) ValueCell!8790)) (size!25989 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53142)

(declare-fun e!506187 () Bool)

(declare-fun array_inv!20008 (array!53142) Bool)

(assert (=> start!77540 (and (array_inv!20008 _values!1152) e!506187)))

(assert (=> start!77540 tp!56636))

(assert (=> start!77540 true))

(declare-fun tp_is_empty!18543 () Bool)

(assert (=> start!77540 tp_is_empty!18543))

(declare-datatypes ((array!53144 0))(
  ( (array!53145 (arr!25531 (Array (_ BitVec 32) (_ BitVec 64))) (size!25990 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53144)

(declare-fun array_inv!20009 (array!53144) Bool)

(assert (=> start!77540 (array_inv!20009 _keys!1386)))

(declare-fun mapNonEmpty!29527 () Bool)

(declare-fun mapRes!29527 () Bool)

(declare-fun tp!56637 () Bool)

(declare-fun e!506189 () Bool)

(assert (=> mapNonEmpty!29527 (= mapRes!29527 (and tp!56637 e!506189))))

(declare-fun mapKey!29527 () (_ BitVec 32))

(declare-fun mapRest!29527 () (Array (_ BitVec 32) ValueCell!8790))

(declare-fun mapValue!29527 () ValueCell!8790)

(assert (=> mapNonEmpty!29527 (= (arr!25530 _values!1152) (store mapRest!29527 mapKey!29527 mapValue!29527))))

(declare-fun b!903446 () Bool)

(assert (=> b!903446 (= e!506189 tp_is_empty!18543)))

(declare-fun b!903447 () Bool)

(declare-fun res!609548 () Bool)

(assert (=> b!903447 (=> (not res!609548) (not e!506186))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!903447 (= res!609548 (and (= (size!25989 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25990 _keys!1386) (size!25989 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!903448 () Bool)

(declare-fun res!609545 () Bool)

(assert (=> b!903448 (=> (not res!609545) (not e!506186))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53144 (_ BitVec 32)) Bool)

(assert (=> b!903448 (= res!609545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!903449 () Bool)

(declare-fun e!506190 () Bool)

(assert (=> b!903449 (= e!506190 tp_is_empty!18543)))

(declare-fun mapIsEmpty!29527 () Bool)

(assert (=> mapIsEmpty!29527 mapRes!29527))

(declare-fun b!903450 () Bool)

(assert (=> b!903450 (= e!506187 (and e!506190 mapRes!29527))))

(declare-fun condMapEmpty!29527 () Bool)

(declare-fun mapDefault!29527 () ValueCell!8790)

(assert (=> b!903450 (= condMapEmpty!29527 (= (arr!25530 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8790)) mapDefault!29527)))))

(declare-fun b!903451 () Bool)

(assert (=> b!903451 (= e!506186 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!408009 () Bool)

(declare-fun zeroValue!1094 () V!29689)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!29689)

(declare-datatypes ((tuple2!12106 0))(
  ( (tuple2!12107 (_1!6064 (_ BitVec 64)) (_2!6064 V!29689)) )
))
(declare-datatypes ((List!17925 0))(
  ( (Nil!17922) (Cons!17921 (h!19067 tuple2!12106) (t!25308 List!17925)) )
))
(declare-datatypes ((ListLongMap!10803 0))(
  ( (ListLongMap!10804 (toList!5417 List!17925)) )
))
(declare-fun contains!4465 (ListLongMap!10803 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2686 (array!53144 array!53142 (_ BitVec 32) (_ BitVec 32) V!29689 V!29689 (_ BitVec 32) Int) ListLongMap!10803)

(assert (=> b!903451 (= lt!408009 (contains!4465 (getCurrentListMap!2686 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!903452 () Bool)

(declare-fun res!609546 () Bool)

(assert (=> b!903452 (=> (not res!609546) (not e!506186))))

(declare-datatypes ((List!17926 0))(
  ( (Nil!17923) (Cons!17922 (h!19068 (_ BitVec 64)) (t!25309 List!17926)) )
))
(declare-fun arrayNoDuplicates!0 (array!53144 (_ BitVec 32) List!17926) Bool)

(assert (=> b!903452 (= res!609546 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17923))))

(assert (= (and start!77540 res!609547) b!903447))

(assert (= (and b!903447 res!609548) b!903448))

(assert (= (and b!903448 res!609545) b!903452))

(assert (= (and b!903452 res!609546) b!903451))

(assert (= (and b!903450 condMapEmpty!29527) mapIsEmpty!29527))

(assert (= (and b!903450 (not condMapEmpty!29527)) mapNonEmpty!29527))

(get-info :version)

(assert (= (and mapNonEmpty!29527 ((_ is ValueCellFull!8790) mapValue!29527)) b!903446))

(assert (= (and b!903450 ((_ is ValueCellFull!8790) mapDefault!29527)) b!903449))

(assert (= start!77540 b!903450))

(declare-fun m!839129 () Bool)

(assert (=> b!903451 m!839129))

(assert (=> b!903451 m!839129))

(declare-fun m!839131 () Bool)

(assert (=> b!903451 m!839131))

(declare-fun m!839133 () Bool)

(assert (=> mapNonEmpty!29527 m!839133))

(declare-fun m!839135 () Bool)

(assert (=> b!903452 m!839135))

(declare-fun m!839137 () Bool)

(assert (=> start!77540 m!839137))

(declare-fun m!839139 () Bool)

(assert (=> start!77540 m!839139))

(declare-fun m!839141 () Bool)

(assert (=> start!77540 m!839141))

(declare-fun m!839143 () Bool)

(assert (=> b!903448 m!839143))

(check-sat (not b!903452) (not b!903448) (not mapNonEmpty!29527) (not b!903451) tp_is_empty!18543 (not start!77540) (not b_next!16125) b_and!26491)
(check-sat b_and!26491 (not b_next!16125))
