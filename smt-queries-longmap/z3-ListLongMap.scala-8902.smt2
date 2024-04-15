; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108062 () Bool)

(assert start!108062)

(declare-fun b_free!27775 () Bool)

(declare-fun b_next!27775 () Bool)

(assert (=> start!108062 (= b_free!27775 (not b_next!27775))))

(declare-fun tp!98280 () Bool)

(declare-fun b_and!45813 () Bool)

(assert (=> start!108062 (= tp!98280 b_and!45813)))

(declare-fun b!1276144 () Bool)

(declare-fun res!848126 () Bool)

(declare-fun e!728689 () Bool)

(assert (=> b!1276144 (=> (not res!848126) (not e!728689))))

(declare-datatypes ((array!83651 0))(
  ( (array!83652 (arr!40337 (Array (_ BitVec 32) (_ BitVec 64))) (size!40889 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83651)

(declare-datatypes ((List!28713 0))(
  ( (Nil!28710) (Cons!28709 (h!29918 (_ BitVec 64)) (t!42241 List!28713)) )
))
(declare-fun arrayNoDuplicates!0 (array!83651 (_ BitVec 32) List!28713) Bool)

(assert (=> b!1276144 (= res!848126 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28710))))

(declare-fun res!848125 () Bool)

(assert (=> start!108062 (=> (not res!848125) (not e!728689))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108062 (= res!848125 (validMask!0 mask!1805))))

(assert (=> start!108062 e!728689))

(assert (=> start!108062 true))

(assert (=> start!108062 tp!98280))

(declare-fun tp_is_empty!33325 () Bool)

(assert (=> start!108062 tp_is_empty!33325))

(declare-datatypes ((V!49537 0))(
  ( (V!49538 (val!16737 Int)) )
))
(declare-datatypes ((ValueCell!15764 0))(
  ( (ValueCellFull!15764 (v!19333 V!49537)) (EmptyCell!15764) )
))
(declare-datatypes ((array!83653 0))(
  ( (array!83654 (arr!40338 (Array (_ BitVec 32) ValueCell!15764)) (size!40890 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83653)

(declare-fun e!728692 () Bool)

(declare-fun array_inv!30811 (array!83653) Bool)

(assert (=> start!108062 (and (array_inv!30811 _values!1187) e!728692)))

(declare-fun array_inv!30812 (array!83651) Bool)

(assert (=> start!108062 (array_inv!30812 _keys!1427)))

(declare-fun mapIsEmpty!51518 () Bool)

(declare-fun mapRes!51518 () Bool)

(assert (=> mapIsEmpty!51518 mapRes!51518))

(declare-fun mapNonEmpty!51518 () Bool)

(declare-fun tp!98279 () Bool)

(declare-fun e!728688 () Bool)

(assert (=> mapNonEmpty!51518 (= mapRes!51518 (and tp!98279 e!728688))))

(declare-fun mapRest!51518 () (Array (_ BitVec 32) ValueCell!15764))

(declare-fun mapValue!51518 () ValueCell!15764)

(declare-fun mapKey!51518 () (_ BitVec 32))

(assert (=> mapNonEmpty!51518 (= (arr!40338 _values!1187) (store mapRest!51518 mapKey!51518 mapValue!51518))))

(declare-fun b!1276145 () Bool)

(declare-fun e!728690 () Bool)

(assert (=> b!1276145 (= e!728690 tp_is_empty!33325)))

(declare-fun b!1276146 () Bool)

(declare-fun res!848127 () Bool)

(assert (=> b!1276146 (=> (not res!848127) (not e!728689))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83651 (_ BitVec 32)) Bool)

(assert (=> b!1276146 (= res!848127 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1276147 () Bool)

(assert (=> b!1276147 (= e!728688 tp_is_empty!33325)))

(declare-fun b!1276148 () Bool)

(declare-fun res!848124 () Bool)

(assert (=> b!1276148 (=> (not res!848124) (not e!728689))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1276148 (= res!848124 (and (= (size!40890 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40889 _keys!1427) (size!40890 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1276149 () Bool)

(assert (=> b!1276149 (= e!728689 false)))

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49537)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun lt!575277 () Bool)

(declare-fun zeroValue!1129 () V!49537)

(declare-datatypes ((tuple2!21542 0))(
  ( (tuple2!21543 (_1!10782 (_ BitVec 64)) (_2!10782 V!49537)) )
))
(declare-datatypes ((List!28714 0))(
  ( (Nil!28711) (Cons!28710 (h!29919 tuple2!21542) (t!42242 List!28714)) )
))
(declare-datatypes ((ListLongMap!19199 0))(
  ( (ListLongMap!19200 (toList!9615 List!28714)) )
))
(declare-fun contains!7655 (ListLongMap!19199 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4589 (array!83651 array!83653 (_ BitVec 32) (_ BitVec 32) V!49537 V!49537 (_ BitVec 32) Int) ListLongMap!19199)

(assert (=> b!1276149 (= lt!575277 (contains!7655 (getCurrentListMap!4589 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun b!1276150 () Bool)

(assert (=> b!1276150 (= e!728692 (and e!728690 mapRes!51518))))

(declare-fun condMapEmpty!51518 () Bool)

(declare-fun mapDefault!51518 () ValueCell!15764)

(assert (=> b!1276150 (= condMapEmpty!51518 (= (arr!40338 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15764)) mapDefault!51518)))))

(assert (= (and start!108062 res!848125) b!1276148))

(assert (= (and b!1276148 res!848124) b!1276146))

(assert (= (and b!1276146 res!848127) b!1276144))

(assert (= (and b!1276144 res!848126) b!1276149))

(assert (= (and b!1276150 condMapEmpty!51518) mapIsEmpty!51518))

(assert (= (and b!1276150 (not condMapEmpty!51518)) mapNonEmpty!51518))

(get-info :version)

(assert (= (and mapNonEmpty!51518 ((_ is ValueCellFull!15764) mapValue!51518)) b!1276147))

(assert (= (and b!1276150 ((_ is ValueCellFull!15764) mapDefault!51518)) b!1276145))

(assert (= start!108062 b!1276150))

(declare-fun m!1171677 () Bool)

(assert (=> mapNonEmpty!51518 m!1171677))

(declare-fun m!1171679 () Bool)

(assert (=> b!1276146 m!1171679))

(declare-fun m!1171681 () Bool)

(assert (=> b!1276149 m!1171681))

(assert (=> b!1276149 m!1171681))

(declare-fun m!1171683 () Bool)

(assert (=> b!1276149 m!1171683))

(declare-fun m!1171685 () Bool)

(assert (=> start!108062 m!1171685))

(declare-fun m!1171687 () Bool)

(assert (=> start!108062 m!1171687))

(declare-fun m!1171689 () Bool)

(assert (=> start!108062 m!1171689))

(declare-fun m!1171691 () Bool)

(assert (=> b!1276144 m!1171691))

(check-sat tp_is_empty!33325 (not b_next!27775) (not start!108062) (not b!1276146) (not mapNonEmpty!51518) (not b!1276149) (not b!1276144) b_and!45813)
(check-sat b_and!45813 (not b_next!27775))
