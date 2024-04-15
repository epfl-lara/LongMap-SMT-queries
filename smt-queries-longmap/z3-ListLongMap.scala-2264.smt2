; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37032 () Bool)

(assert start!37032)

(declare-fun b_free!8173 () Bool)

(declare-fun b_next!8173 () Bool)

(assert (=> start!37032 (= b_free!8173 (not b_next!8173))))

(declare-fun tp!29234 () Bool)

(declare-fun b_and!15389 () Bool)

(assert (=> start!37032 (= tp!29234 b_and!15389)))

(declare-fun b!372142 () Bool)

(declare-fun e!226996 () Bool)

(declare-fun e!226994 () Bool)

(assert (=> b!372142 (= e!226996 e!226994)))

(declare-fun res!209418 () Bool)

(assert (=> b!372142 (=> (not res!209418) (not e!226994))))

(declare-datatypes ((array!21565 0))(
  ( (array!21566 (arr!10251 (Array (_ BitVec 32) (_ BitVec 64))) (size!10604 (_ BitVec 32))) )
))
(declare-fun lt!170504 () array!21565)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21565 (_ BitVec 32)) Bool)

(assert (=> b!372142 (= res!209418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170504 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun _keys!658 () array!21565)

(assert (=> b!372142 (= lt!170504 (array!21566 (store (arr!10251 _keys!658) i!548 k0!778) (size!10604 _keys!658)))))

(declare-fun b!372143 () Bool)

(declare-fun e!226997 () Bool)

(declare-fun tp_is_empty!8821 () Bool)

(assert (=> b!372143 (= e!226997 tp_is_empty!8821)))

(declare-fun b!372144 () Bool)

(declare-fun res!209415 () Bool)

(assert (=> b!372144 (=> (not res!209415) (not e!226996))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!372144 (= res!209415 (validKeyInArray!0 k0!778))))

(declare-fun b!372145 () Bool)

(declare-fun res!209411 () Bool)

(assert (=> b!372145 (=> (not res!209411) (not e!226994))))

(declare-datatypes ((List!5718 0))(
  ( (Nil!5715) (Cons!5714 (h!6570 (_ BitVec 64)) (t!10859 List!5718)) )
))
(declare-fun arrayNoDuplicates!0 (array!21565 (_ BitVec 32) List!5718) Bool)

(assert (=> b!372145 (= res!209411 (arrayNoDuplicates!0 lt!170504 #b00000000000000000000000000000000 Nil!5715))))

(declare-fun b!372146 () Bool)

(declare-fun res!209414 () Bool)

(assert (=> b!372146 (=> (not res!209414) (not e!226996))))

(assert (=> b!372146 (= res!209414 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5715))))

(declare-fun res!209417 () Bool)

(assert (=> start!37032 (=> (not res!209417) (not e!226996))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37032 (= res!209417 (validMask!0 mask!970))))

(assert (=> start!37032 e!226996))

(declare-datatypes ((V!12867 0))(
  ( (V!12868 (val!4455 Int)) )
))
(declare-datatypes ((ValueCell!4067 0))(
  ( (ValueCellFull!4067 (v!6646 V!12867)) (EmptyCell!4067) )
))
(declare-datatypes ((array!21567 0))(
  ( (array!21568 (arr!10252 (Array (_ BitVec 32) ValueCell!4067)) (size!10605 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21567)

(declare-fun e!226992 () Bool)

(declare-fun array_inv!7572 (array!21567) Bool)

(assert (=> start!37032 (and (array_inv!7572 _values!506) e!226992)))

(assert (=> start!37032 tp!29234))

(assert (=> start!37032 true))

(assert (=> start!37032 tp_is_empty!8821))

(declare-fun array_inv!7573 (array!21565) Bool)

(assert (=> start!37032 (array_inv!7573 _keys!658)))

(declare-fun b!372147 () Bool)

(declare-fun res!209419 () Bool)

(assert (=> b!372147 (=> (not res!209419) (not e!226996))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!372147 (= res!209419 (and (= (size!10605 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10604 _keys!658) (size!10605 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!372148 () Bool)

(declare-fun mapRes!14796 () Bool)

(assert (=> b!372148 (= e!226992 (and e!226997 mapRes!14796))))

(declare-fun condMapEmpty!14796 () Bool)

(declare-fun mapDefault!14796 () ValueCell!4067)

(assert (=> b!372148 (= condMapEmpty!14796 (= (arr!10252 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4067)) mapDefault!14796)))))

(declare-fun b!372149 () Bool)

(declare-fun res!209413 () Bool)

(assert (=> b!372149 (=> (not res!209413) (not e!226996))))

(assert (=> b!372149 (= res!209413 (or (= (select (arr!10251 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10251 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!372150 () Bool)

(declare-fun res!209420 () Bool)

(assert (=> b!372150 (=> (not res!209420) (not e!226996))))

(declare-fun arrayContainsKey!0 (array!21565 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!372150 (= res!209420 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14796 () Bool)

(assert (=> mapIsEmpty!14796 mapRes!14796))

(declare-fun b!372151 () Bool)

(declare-fun res!209412 () Bool)

(assert (=> b!372151 (=> (not res!209412) (not e!226996))))

(assert (=> b!372151 (= res!209412 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10604 _keys!658))))))

(declare-fun b!372152 () Bool)

(declare-fun res!209416 () Bool)

(assert (=> b!372152 (=> (not res!209416) (not e!226996))))

(assert (=> b!372152 (= res!209416 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!372153 () Bool)

(declare-fun e!226993 () Bool)

(assert (=> b!372153 (= e!226993 tp_is_empty!8821)))

(declare-fun mapNonEmpty!14796 () Bool)

(declare-fun tp!29235 () Bool)

(assert (=> mapNonEmpty!14796 (= mapRes!14796 (and tp!29235 e!226993))))

(declare-fun mapRest!14796 () (Array (_ BitVec 32) ValueCell!4067))

(declare-fun mapValue!14796 () ValueCell!4067)

(declare-fun mapKey!14796 () (_ BitVec 32))

(assert (=> mapNonEmpty!14796 (= (arr!10252 _values!506) (store mapRest!14796 mapKey!14796 mapValue!14796))))

(declare-fun b!372154 () Bool)

(assert (=> b!372154 (= e!226994 (not true))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12867)

(declare-fun lt!170507 () array!21567)

(declare-datatypes ((tuple2!5880 0))(
  ( (tuple2!5881 (_1!2951 (_ BitVec 64)) (_2!2951 V!12867)) )
))
(declare-datatypes ((List!5719 0))(
  ( (Nil!5716) (Cons!5715 (h!6571 tuple2!5880) (t!10860 List!5719)) )
))
(declare-datatypes ((ListLongMap!4783 0))(
  ( (ListLongMap!4784 (toList!2407 List!5719)) )
))
(declare-fun lt!170506 () ListLongMap!4783)

(declare-fun minValue!472 () V!12867)

(declare-fun getCurrentListMap!1833 (array!21565 array!21567 (_ BitVec 32) (_ BitVec 32) V!12867 V!12867 (_ BitVec 32) Int) ListLongMap!4783)

(assert (=> b!372154 (= lt!170506 (getCurrentListMap!1833 lt!170504 lt!170507 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170508 () ListLongMap!4783)

(declare-fun lt!170505 () ListLongMap!4783)

(assert (=> b!372154 (and (= lt!170508 lt!170505) (= lt!170505 lt!170508))))

(declare-fun v!373 () V!12867)

(declare-fun lt!170503 () ListLongMap!4783)

(declare-fun +!775 (ListLongMap!4783 tuple2!5880) ListLongMap!4783)

(assert (=> b!372154 (= lt!170505 (+!775 lt!170503 (tuple2!5881 k0!778 v!373)))))

(declare-datatypes ((Unit!11426 0))(
  ( (Unit!11427) )
))
(declare-fun lt!170502 () Unit!11426)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!26 (array!21565 array!21567 (_ BitVec 32) (_ BitVec 32) V!12867 V!12867 (_ BitVec 32) (_ BitVec 64) V!12867 (_ BitVec 32) Int) Unit!11426)

(assert (=> b!372154 (= lt!170502 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!26 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!698 (array!21565 array!21567 (_ BitVec 32) (_ BitVec 32) V!12867 V!12867 (_ BitVec 32) Int) ListLongMap!4783)

(assert (=> b!372154 (= lt!170508 (getCurrentListMapNoExtraKeys!698 lt!170504 lt!170507 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!372154 (= lt!170507 (array!21568 (store (arr!10252 _values!506) i!548 (ValueCellFull!4067 v!373)) (size!10605 _values!506)))))

(assert (=> b!372154 (= lt!170503 (getCurrentListMapNoExtraKeys!698 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and start!37032 res!209417) b!372147))

(assert (= (and b!372147 res!209419) b!372152))

(assert (= (and b!372152 res!209416) b!372146))

(assert (= (and b!372146 res!209414) b!372151))

(assert (= (and b!372151 res!209412) b!372144))

(assert (= (and b!372144 res!209415) b!372149))

(assert (= (and b!372149 res!209413) b!372150))

(assert (= (and b!372150 res!209420) b!372142))

(assert (= (and b!372142 res!209418) b!372145))

(assert (= (and b!372145 res!209411) b!372154))

(assert (= (and b!372148 condMapEmpty!14796) mapIsEmpty!14796))

(assert (= (and b!372148 (not condMapEmpty!14796)) mapNonEmpty!14796))

(get-info :version)

(assert (= (and mapNonEmpty!14796 ((_ is ValueCellFull!4067) mapValue!14796)) b!372153))

(assert (= (and b!372148 ((_ is ValueCellFull!4067) mapDefault!14796)) b!372143))

(assert (= start!37032 b!372148))

(declare-fun m!367559 () Bool)

(assert (=> b!372154 m!367559))

(declare-fun m!367561 () Bool)

(assert (=> b!372154 m!367561))

(declare-fun m!367563 () Bool)

(assert (=> b!372154 m!367563))

(declare-fun m!367565 () Bool)

(assert (=> b!372154 m!367565))

(declare-fun m!367567 () Bool)

(assert (=> b!372154 m!367567))

(declare-fun m!367569 () Bool)

(assert (=> b!372154 m!367569))

(declare-fun m!367571 () Bool)

(assert (=> b!372150 m!367571))

(declare-fun m!367573 () Bool)

(assert (=> start!37032 m!367573))

(declare-fun m!367575 () Bool)

(assert (=> start!37032 m!367575))

(declare-fun m!367577 () Bool)

(assert (=> start!37032 m!367577))

(declare-fun m!367579 () Bool)

(assert (=> b!372145 m!367579))

(declare-fun m!367581 () Bool)

(assert (=> mapNonEmpty!14796 m!367581))

(declare-fun m!367583 () Bool)

(assert (=> b!372152 m!367583))

(declare-fun m!367585 () Bool)

(assert (=> b!372142 m!367585))

(declare-fun m!367587 () Bool)

(assert (=> b!372142 m!367587))

(declare-fun m!367589 () Bool)

(assert (=> b!372146 m!367589))

(declare-fun m!367591 () Bool)

(assert (=> b!372144 m!367591))

(declare-fun m!367593 () Bool)

(assert (=> b!372149 m!367593))

(check-sat (not b!372146) (not b!372152) (not b!372144) b_and!15389 (not b!372154) (not mapNonEmpty!14796) (not start!37032) (not b_next!8173) (not b!372150) tp_is_empty!8821 (not b!372145) (not b!372142))
(check-sat b_and!15389 (not b_next!8173))
