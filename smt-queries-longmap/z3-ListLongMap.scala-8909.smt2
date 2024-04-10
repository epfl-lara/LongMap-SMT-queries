; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108106 () Bool)

(assert start!108106)

(declare-fun b_free!27819 () Bool)

(declare-fun b_next!27819 () Bool)

(assert (=> start!108106 (= b_free!27819 (not b_next!27819))))

(declare-fun tp!98410 () Bool)

(declare-fun b_and!45875 () Bool)

(assert (=> start!108106 (= tp!98410 b_and!45875)))

(declare-fun b!1276670 () Bool)

(declare-fun res!848418 () Bool)

(declare-fun e!729048 () Bool)

(assert (=> b!1276670 (=> (not res!848418) (not e!729048))))

(declare-datatypes ((array!83830 0))(
  ( (array!83831 (arr!40426 (Array (_ BitVec 32) (_ BitVec 64))) (size!40976 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83830)

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83830 (_ BitVec 32)) Bool)

(assert (=> b!1276670 (= res!848418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun mapNonEmpty!51584 () Bool)

(declare-fun mapRes!51584 () Bool)

(declare-fun tp!98411 () Bool)

(declare-fun e!729049 () Bool)

(assert (=> mapNonEmpty!51584 (= mapRes!51584 (and tp!98411 e!729049))))

(declare-datatypes ((V!49595 0))(
  ( (V!49596 (val!16759 Int)) )
))
(declare-datatypes ((ValueCell!15786 0))(
  ( (ValueCellFull!15786 (v!19356 V!49595)) (EmptyCell!15786) )
))
(declare-fun mapRest!51584 () (Array (_ BitVec 32) ValueCell!15786))

(declare-fun mapKey!51584 () (_ BitVec 32))

(declare-datatypes ((array!83832 0))(
  ( (array!83833 (arr!40427 (Array (_ BitVec 32) ValueCell!15786)) (size!40977 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83832)

(declare-fun mapValue!51584 () ValueCell!15786)

(assert (=> mapNonEmpty!51584 (= (arr!40427 _values!1187) (store mapRest!51584 mapKey!51584 mapValue!51584))))

(declare-fun b!1276671 () Bool)

(declare-fun tp_is_empty!33369 () Bool)

(assert (=> b!1276671 (= e!729049 tp_is_empty!33369)))

(declare-fun b!1276672 () Bool)

(declare-fun e!729050 () Bool)

(declare-fun e!729047 () Bool)

(assert (=> b!1276672 (= e!729050 (and e!729047 mapRes!51584))))

(declare-fun condMapEmpty!51584 () Bool)

(declare-fun mapDefault!51584 () ValueCell!15786)

(assert (=> b!1276672 (= condMapEmpty!51584 (= (arr!40427 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15786)) mapDefault!51584)))))

(declare-fun b!1276673 () Bool)

(assert (=> b!1276673 (= e!729047 tp_is_empty!33369)))

(declare-fun b!1276674 () Bool)

(assert (=> b!1276674 (= e!729048 false)))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-fun defaultEntry!1195 () Int)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun zeroValue!1129 () V!49595)

(declare-fun minValue!1129 () V!49595)

(declare-fun lt!575521 () Bool)

(declare-datatypes ((tuple2!21494 0))(
  ( (tuple2!21495 (_1!10758 (_ BitVec 64)) (_2!10758 V!49595)) )
))
(declare-datatypes ((List!28669 0))(
  ( (Nil!28666) (Cons!28665 (h!29874 tuple2!21494) (t!42205 List!28669)) )
))
(declare-datatypes ((ListLongMap!19151 0))(
  ( (ListLongMap!19152 (toList!9591 List!28669)) )
))
(declare-fun contains!7700 (ListLongMap!19151 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4675 (array!83830 array!83832 (_ BitVec 32) (_ BitVec 32) V!49595 V!49595 (_ BitVec 32) Int) ListLongMap!19151)

(assert (=> b!1276674 (= lt!575521 (contains!7700 (getCurrentListMap!4675 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun b!1276675 () Bool)

(declare-fun res!848415 () Bool)

(assert (=> b!1276675 (=> (not res!848415) (not e!729048))))

(assert (=> b!1276675 (= res!848415 (and (= (size!40977 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40976 _keys!1427) (size!40977 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1276676 () Bool)

(declare-fun res!848416 () Bool)

(assert (=> b!1276676 (=> (not res!848416) (not e!729048))))

(declare-datatypes ((List!28670 0))(
  ( (Nil!28667) (Cons!28666 (h!29875 (_ BitVec 64)) (t!42206 List!28670)) )
))
(declare-fun arrayNoDuplicates!0 (array!83830 (_ BitVec 32) List!28670) Bool)

(assert (=> b!1276676 (= res!848416 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28667))))

(declare-fun mapIsEmpty!51584 () Bool)

(assert (=> mapIsEmpty!51584 mapRes!51584))

(declare-fun res!848417 () Bool)

(assert (=> start!108106 (=> (not res!848417) (not e!729048))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108106 (= res!848417 (validMask!0 mask!1805))))

(assert (=> start!108106 e!729048))

(assert (=> start!108106 true))

(assert (=> start!108106 tp!98410))

(assert (=> start!108106 tp_is_empty!33369))

(declare-fun array_inv!30723 (array!83832) Bool)

(assert (=> start!108106 (and (array_inv!30723 _values!1187) e!729050)))

(declare-fun array_inv!30724 (array!83830) Bool)

(assert (=> start!108106 (array_inv!30724 _keys!1427)))

(assert (= (and start!108106 res!848417) b!1276675))

(assert (= (and b!1276675 res!848415) b!1276670))

(assert (= (and b!1276670 res!848418) b!1276676))

(assert (= (and b!1276676 res!848416) b!1276674))

(assert (= (and b!1276672 condMapEmpty!51584) mapIsEmpty!51584))

(assert (= (and b!1276672 (not condMapEmpty!51584)) mapNonEmpty!51584))

(get-info :version)

(assert (= (and mapNonEmpty!51584 ((_ is ValueCellFull!15786) mapValue!51584)) b!1276671))

(assert (= (and b!1276672 ((_ is ValueCellFull!15786) mapDefault!51584)) b!1276673))

(assert (= start!108106 b!1276672))

(declare-fun m!1172529 () Bool)

(assert (=> b!1276670 m!1172529))

(declare-fun m!1172531 () Bool)

(assert (=> mapNonEmpty!51584 m!1172531))

(declare-fun m!1172533 () Bool)

(assert (=> b!1276674 m!1172533))

(assert (=> b!1276674 m!1172533))

(declare-fun m!1172535 () Bool)

(assert (=> b!1276674 m!1172535))

(declare-fun m!1172537 () Bool)

(assert (=> b!1276676 m!1172537))

(declare-fun m!1172539 () Bool)

(assert (=> start!108106 m!1172539))

(declare-fun m!1172541 () Bool)

(assert (=> start!108106 m!1172541))

(declare-fun m!1172543 () Bool)

(assert (=> start!108106 m!1172543))

(check-sat (not b!1276670) (not b_next!27819) (not b!1276676) (not b!1276674) b_and!45875 (not start!108106) (not mapNonEmpty!51584) tp_is_empty!33369)
(check-sat b_and!45875 (not b_next!27819))
