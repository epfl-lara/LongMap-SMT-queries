; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108100 () Bool)

(assert start!108100)

(declare-fun b_free!27813 () Bool)

(declare-fun b_next!27813 () Bool)

(assert (=> start!108100 (= b_free!27813 (not b_next!27813))))

(declare-fun tp!98392 () Bool)

(declare-fun b_and!45869 () Bool)

(assert (=> start!108100 (= tp!98392 b_and!45869)))

(declare-fun b!1276607 () Bool)

(declare-fun e!729003 () Bool)

(declare-fun e!729004 () Bool)

(declare-fun mapRes!51575 () Bool)

(assert (=> b!1276607 (= e!729003 (and e!729004 mapRes!51575))))

(declare-fun condMapEmpty!51575 () Bool)

(declare-datatypes ((V!49587 0))(
  ( (V!49588 (val!16756 Int)) )
))
(declare-datatypes ((ValueCell!15783 0))(
  ( (ValueCellFull!15783 (v!19353 V!49587)) (EmptyCell!15783) )
))
(declare-datatypes ((array!83820 0))(
  ( (array!83821 (arr!40421 (Array (_ BitVec 32) ValueCell!15783)) (size!40971 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83820)

(declare-fun mapDefault!51575 () ValueCell!15783)

(assert (=> b!1276607 (= condMapEmpty!51575 (= (arr!40421 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15783)) mapDefault!51575)))))

(declare-fun b!1276608 () Bool)

(declare-fun tp_is_empty!33363 () Bool)

(assert (=> b!1276608 (= e!729004 tp_is_empty!33363)))

(declare-fun res!848380 () Bool)

(declare-fun e!729005 () Bool)

(assert (=> start!108100 (=> (not res!848380) (not e!729005))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108100 (= res!848380 (validMask!0 mask!1805))))

(assert (=> start!108100 e!729005))

(assert (=> start!108100 true))

(assert (=> start!108100 tp!98392))

(assert (=> start!108100 tp_is_empty!33363))

(declare-fun array_inv!30721 (array!83820) Bool)

(assert (=> start!108100 (and (array_inv!30721 _values!1187) e!729003)))

(declare-datatypes ((array!83822 0))(
  ( (array!83823 (arr!40422 (Array (_ BitVec 32) (_ BitVec 64))) (size!40972 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83822)

(declare-fun array_inv!30722 (array!83822) Bool)

(assert (=> start!108100 (array_inv!30722 _keys!1427)))

(declare-fun b!1276609 () Bool)

(declare-fun res!848382 () Bool)

(assert (=> b!1276609 (=> (not res!848382) (not e!729005))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1276609 (= res!848382 (and (= (size!40971 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40972 _keys!1427) (size!40971 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1276610 () Bool)

(assert (=> b!1276610 (= e!729005 false)))

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49587)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun zeroValue!1129 () V!49587)

(declare-fun lt!575512 () Bool)

(declare-datatypes ((tuple2!21492 0))(
  ( (tuple2!21493 (_1!10757 (_ BitVec 64)) (_2!10757 V!49587)) )
))
(declare-datatypes ((List!28667 0))(
  ( (Nil!28664) (Cons!28663 (h!29872 tuple2!21492) (t!42203 List!28667)) )
))
(declare-datatypes ((ListLongMap!19149 0))(
  ( (ListLongMap!19150 (toList!9590 List!28667)) )
))
(declare-fun contains!7699 (ListLongMap!19149 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4674 (array!83822 array!83820 (_ BitVec 32) (_ BitVec 32) V!49587 V!49587 (_ BitVec 32) Int) ListLongMap!19149)

(assert (=> b!1276610 (= lt!575512 (contains!7699 (getCurrentListMap!4674 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun b!1276611 () Bool)

(declare-fun res!848379 () Bool)

(assert (=> b!1276611 (=> (not res!848379) (not e!729005))))

(declare-datatypes ((List!28668 0))(
  ( (Nil!28665) (Cons!28664 (h!29873 (_ BitVec 64)) (t!42204 List!28668)) )
))
(declare-fun arrayNoDuplicates!0 (array!83822 (_ BitVec 32) List!28668) Bool)

(assert (=> b!1276611 (= res!848379 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28665))))

(declare-fun b!1276612 () Bool)

(declare-fun res!848381 () Bool)

(assert (=> b!1276612 (=> (not res!848381) (not e!729005))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83822 (_ BitVec 32)) Bool)

(assert (=> b!1276612 (= res!848381 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1276613 () Bool)

(declare-fun e!729006 () Bool)

(assert (=> b!1276613 (= e!729006 tp_is_empty!33363)))

(declare-fun mapNonEmpty!51575 () Bool)

(declare-fun tp!98393 () Bool)

(assert (=> mapNonEmpty!51575 (= mapRes!51575 (and tp!98393 e!729006))))

(declare-fun mapKey!51575 () (_ BitVec 32))

(declare-fun mapRest!51575 () (Array (_ BitVec 32) ValueCell!15783))

(declare-fun mapValue!51575 () ValueCell!15783)

(assert (=> mapNonEmpty!51575 (= (arr!40421 _values!1187) (store mapRest!51575 mapKey!51575 mapValue!51575))))

(declare-fun mapIsEmpty!51575 () Bool)

(assert (=> mapIsEmpty!51575 mapRes!51575))

(assert (= (and start!108100 res!848380) b!1276609))

(assert (= (and b!1276609 res!848382) b!1276612))

(assert (= (and b!1276612 res!848381) b!1276611))

(assert (= (and b!1276611 res!848379) b!1276610))

(assert (= (and b!1276607 condMapEmpty!51575) mapIsEmpty!51575))

(assert (= (and b!1276607 (not condMapEmpty!51575)) mapNonEmpty!51575))

(get-info :version)

(assert (= (and mapNonEmpty!51575 ((_ is ValueCellFull!15783) mapValue!51575)) b!1276613))

(assert (= (and b!1276607 ((_ is ValueCellFull!15783) mapDefault!51575)) b!1276608))

(assert (= start!108100 b!1276607))

(declare-fun m!1172481 () Bool)

(assert (=> b!1276612 m!1172481))

(declare-fun m!1172483 () Bool)

(assert (=> start!108100 m!1172483))

(declare-fun m!1172485 () Bool)

(assert (=> start!108100 m!1172485))

(declare-fun m!1172487 () Bool)

(assert (=> start!108100 m!1172487))

(declare-fun m!1172489 () Bool)

(assert (=> mapNonEmpty!51575 m!1172489))

(declare-fun m!1172491 () Bool)

(assert (=> b!1276611 m!1172491))

(declare-fun m!1172493 () Bool)

(assert (=> b!1276610 m!1172493))

(assert (=> b!1276610 m!1172493))

(declare-fun m!1172495 () Bool)

(assert (=> b!1276610 m!1172495))

(check-sat (not b!1276612) (not b!1276610) tp_is_empty!33363 (not mapNonEmpty!51575) (not b!1276611) (not start!108100) b_and!45869 (not b_next!27813))
(check-sat b_and!45869 (not b_next!27813))
