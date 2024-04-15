; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108188 () Bool)

(assert start!108188)

(declare-fun b_free!27883 () Bool)

(declare-fun b_next!27883 () Bool)

(assert (=> start!108188 (= b_free!27883 (not b_next!27883))))

(declare-fun tp!98606 () Bool)

(declare-fun b_and!45923 () Bool)

(assert (=> start!108188 (= tp!98606 b_and!45923)))

(declare-fun b!1277508 () Bool)

(declare-fun res!848879 () Bool)

(declare-fun e!729608 () Bool)

(assert (=> b!1277508 (=> (not res!848879) (not e!729608))))

(declare-datatypes ((array!83855 0))(
  ( (array!83856 (arr!40438 (Array (_ BitVec 32) (_ BitVec 64))) (size!40990 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83855)

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83855 (_ BitVec 32)) Bool)

(assert (=> b!1277508 (= res!848879 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun mapNonEmpty!51683 () Bool)

(declare-fun mapRes!51683 () Bool)

(declare-fun tp!98607 () Bool)

(declare-fun e!729606 () Bool)

(assert (=> mapNonEmpty!51683 (= mapRes!51683 (and tp!98607 e!729606))))

(declare-datatypes ((V!49681 0))(
  ( (V!49682 (val!16791 Int)) )
))
(declare-datatypes ((ValueCell!15818 0))(
  ( (ValueCellFull!15818 (v!19388 V!49681)) (EmptyCell!15818) )
))
(declare-fun mapValue!51683 () ValueCell!15818)

(declare-fun mapKey!51683 () (_ BitVec 32))

(declare-fun mapRest!51683 () (Array (_ BitVec 32) ValueCell!15818))

(declare-datatypes ((array!83857 0))(
  ( (array!83858 (arr!40439 (Array (_ BitVec 32) ValueCell!15818)) (size!40991 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83857)

(assert (=> mapNonEmpty!51683 (= (arr!40439 _values!1187) (store mapRest!51683 mapKey!51683 mapValue!51683))))

(declare-fun b!1277509 () Bool)

(declare-fun res!848880 () Bool)

(assert (=> b!1277509 (=> (not res!848880) (not e!729608))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1277509 (= res!848880 (and (= (size!40991 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40990 _keys!1427) (size!40991 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1277510 () Bool)

(declare-fun tp_is_empty!33433 () Bool)

(assert (=> b!1277510 (= e!729606 tp_is_empty!33433)))

(declare-fun b!1277507 () Bool)

(assert (=> b!1277507 (= e!729608 false)))

(declare-fun defaultEntry!1195 () Int)

(declare-fun lt!575538 () Bool)

(declare-fun minValue!1129 () V!49681)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun zeroValue!1129 () V!49681)

(declare-datatypes ((tuple2!21618 0))(
  ( (tuple2!21619 (_1!10820 (_ BitVec 64)) (_2!10820 V!49681)) )
))
(declare-datatypes ((List!28789 0))(
  ( (Nil!28786) (Cons!28785 (h!29994 tuple2!21618) (t!42319 List!28789)) )
))
(declare-datatypes ((ListLongMap!19275 0))(
  ( (ListLongMap!19276 (toList!9653 List!28789)) )
))
(declare-fun contains!7694 (ListLongMap!19275 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4627 (array!83855 array!83857 (_ BitVec 32) (_ BitVec 32) V!49681 V!49681 (_ BitVec 32) Int) ListLongMap!19275)

(assert (=> b!1277507 (= lt!575538 (contains!7694 (getCurrentListMap!4627 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun res!848878 () Bool)

(assert (=> start!108188 (=> (not res!848878) (not e!729608))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108188 (= res!848878 (validMask!0 mask!1805))))

(assert (=> start!108188 e!729608))

(assert (=> start!108188 true))

(assert (=> start!108188 tp!98606))

(assert (=> start!108188 tp_is_empty!33433))

(declare-fun e!729609 () Bool)

(declare-fun array_inv!30883 (array!83857) Bool)

(assert (=> start!108188 (and (array_inv!30883 _values!1187) e!729609)))

(declare-fun array_inv!30884 (array!83855) Bool)

(assert (=> start!108188 (array_inv!30884 _keys!1427)))

(declare-fun b!1277511 () Bool)

(declare-fun e!729607 () Bool)

(assert (=> b!1277511 (= e!729609 (and e!729607 mapRes!51683))))

(declare-fun condMapEmpty!51683 () Bool)

(declare-fun mapDefault!51683 () ValueCell!15818)

(assert (=> b!1277511 (= condMapEmpty!51683 (= (arr!40439 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15818)) mapDefault!51683)))))

(declare-fun b!1277512 () Bool)

(declare-fun res!848877 () Bool)

(assert (=> b!1277512 (=> (not res!848877) (not e!729608))))

(declare-datatypes ((List!28790 0))(
  ( (Nil!28787) (Cons!28786 (h!29995 (_ BitVec 64)) (t!42320 List!28790)) )
))
(declare-fun arrayNoDuplicates!0 (array!83855 (_ BitVec 32) List!28790) Bool)

(assert (=> b!1277512 (= res!848877 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28787))))

(declare-fun b!1277513 () Bool)

(assert (=> b!1277513 (= e!729607 tp_is_empty!33433)))

(declare-fun mapIsEmpty!51683 () Bool)

(assert (=> mapIsEmpty!51683 mapRes!51683))

(assert (= (and start!108188 res!848878) b!1277509))

(assert (= (and b!1277509 res!848880) b!1277508))

(assert (= (and b!1277508 res!848879) b!1277512))

(assert (= (and b!1277512 res!848877) b!1277507))

(assert (= (and b!1277511 condMapEmpty!51683) mapIsEmpty!51683))

(assert (= (and b!1277511 (not condMapEmpty!51683)) mapNonEmpty!51683))

(get-info :version)

(assert (= (and mapNonEmpty!51683 ((_ is ValueCellFull!15818) mapValue!51683)) b!1277510))

(assert (= (and b!1277511 ((_ is ValueCellFull!15818) mapDefault!51683)) b!1277513))

(assert (= start!108188 b!1277511))

(declare-fun m!1172661 () Bool)

(assert (=> b!1277512 m!1172661))

(declare-fun m!1172663 () Bool)

(assert (=> b!1277507 m!1172663))

(assert (=> b!1277507 m!1172663))

(declare-fun m!1172665 () Bool)

(assert (=> b!1277507 m!1172665))

(declare-fun m!1172667 () Bool)

(assert (=> mapNonEmpty!51683 m!1172667))

(declare-fun m!1172669 () Bool)

(assert (=> start!108188 m!1172669))

(declare-fun m!1172671 () Bool)

(assert (=> start!108188 m!1172671))

(declare-fun m!1172673 () Bool)

(assert (=> start!108188 m!1172673))

(declare-fun m!1172675 () Bool)

(assert (=> b!1277508 m!1172675))

(check-sat (not b!1277512) (not b!1277508) (not b_next!27883) (not mapNonEmpty!51683) tp_is_empty!33433 (not start!108188) (not b!1277507) b_and!45923)
(check-sat b_and!45923 (not b_next!27883))
