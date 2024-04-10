; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3956 () Bool)

(assert start!3956)

(declare-fun b_free!861 () Bool)

(declare-fun b_next!861 () Bool)

(assert (=> start!3956 (= b_free!861 (not b_next!861))))

(declare-fun tp!4002 () Bool)

(declare-fun b_and!1671 () Bool)

(assert (=> start!3956 (= tp!4002 b_and!1671)))

(declare-fun b!28296 () Bool)

(declare-fun res!16841 () Bool)

(declare-fun e!18304 () Bool)

(assert (=> b!28296 (=> (not res!16841) (not e!18304))))

(declare-datatypes ((array!1669 0))(
  ( (array!1670 (arr!788 (Array (_ BitVec 32) (_ BitVec 64))) (size!889 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1669)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1669 (_ BitVec 32)) Bool)

(assert (=> b!28296 (= res!16841 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapNonEmpty!1351 () Bool)

(declare-fun mapRes!1351 () Bool)

(declare-fun tp!4003 () Bool)

(declare-fun e!18305 () Bool)

(assert (=> mapNonEmpty!1351 (= mapRes!1351 (and tp!4003 e!18305))))

(declare-datatypes ((V!1445 0))(
  ( (V!1446 (val!634 Int)) )
))
(declare-datatypes ((ValueCell!408 0))(
  ( (ValueCellFull!408 (v!1723 V!1445)) (EmptyCell!408) )
))
(declare-datatypes ((array!1671 0))(
  ( (array!1672 (arr!789 (Array (_ BitVec 32) ValueCell!408)) (size!890 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1671)

(declare-fun mapRest!1351 () (Array (_ BitVec 32) ValueCell!408))

(declare-fun mapValue!1351 () ValueCell!408)

(declare-fun mapKey!1351 () (_ BitVec 32))

(assert (=> mapNonEmpty!1351 (= (arr!789 _values!1501) (store mapRest!1351 mapKey!1351 mapValue!1351))))

(declare-fun b!28297 () Bool)

(declare-fun res!16840 () Bool)

(assert (=> b!28297 (=> (not res!16840) (not e!18304))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!1669 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!28297 (= res!16840 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!28298 () Bool)

(declare-fun e!18307 () Bool)

(declare-fun tp_is_empty!1215 () Bool)

(assert (=> b!28298 (= e!18307 tp_is_empty!1215)))

(declare-fun b!28299 () Bool)

(declare-fun res!16842 () Bool)

(assert (=> b!28299 (=> (not res!16842) (not e!18304))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!28299 (= res!16842 (and (= (size!890 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!889 _keys!1833) (size!890 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!28300 () Bool)

(assert (=> b!28300 (= e!18304 false)))

(declare-fun lt!10766 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1669 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!28300 (= lt!10766 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun res!16845 () Bool)

(assert (=> start!3956 (=> (not res!16845) (not e!18304))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3956 (= res!16845 (validMask!0 mask!2294))))

(assert (=> start!3956 e!18304))

(assert (=> start!3956 true))

(assert (=> start!3956 tp!4002))

(declare-fun e!18308 () Bool)

(declare-fun array_inv!541 (array!1671) Bool)

(assert (=> start!3956 (and (array_inv!541 _values!1501) e!18308)))

(declare-fun array_inv!542 (array!1669) Bool)

(assert (=> start!3956 (array_inv!542 _keys!1833)))

(assert (=> start!3956 tp_is_empty!1215))

(declare-fun b!28301 () Bool)

(assert (=> b!28301 (= e!18305 tp_is_empty!1215)))

(declare-fun b!28302 () Bool)

(declare-fun res!16843 () Bool)

(assert (=> b!28302 (=> (not res!16843) (not e!18304))))

(declare-datatypes ((List!657 0))(
  ( (Nil!654) (Cons!653 (h!1220 (_ BitVec 64)) (t!3350 List!657)) )
))
(declare-fun arrayNoDuplicates!0 (array!1669 (_ BitVec 32) List!657) Bool)

(assert (=> b!28302 (= res!16843 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!654))))

(declare-fun b!28303 () Bool)

(declare-fun res!16839 () Bool)

(assert (=> b!28303 (=> (not res!16839) (not e!18304))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!28303 (= res!16839 (validKeyInArray!0 k0!1304))))

(declare-fun b!28304 () Bool)

(assert (=> b!28304 (= e!18308 (and e!18307 mapRes!1351))))

(declare-fun condMapEmpty!1351 () Bool)

(declare-fun mapDefault!1351 () ValueCell!408)

(assert (=> b!28304 (= condMapEmpty!1351 (= (arr!789 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!408)) mapDefault!1351)))))

(declare-fun mapIsEmpty!1351 () Bool)

(assert (=> mapIsEmpty!1351 mapRes!1351))

(declare-fun b!28305 () Bool)

(declare-fun res!16844 () Bool)

(assert (=> b!28305 (=> (not res!16844) (not e!18304))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1445)

(declare-fun minValue!1443 () V!1445)

(declare-datatypes ((tuple2!1056 0))(
  ( (tuple2!1057 (_1!539 (_ BitVec 64)) (_2!539 V!1445)) )
))
(declare-datatypes ((List!658 0))(
  ( (Nil!655) (Cons!654 (h!1221 tuple2!1056) (t!3351 List!658)) )
))
(declare-datatypes ((ListLongMap!633 0))(
  ( (ListLongMap!634 (toList!332 List!658)) )
))
(declare-fun contains!272 (ListLongMap!633 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!162 (array!1669 array!1671 (_ BitVec 32) (_ BitVec 32) V!1445 V!1445 (_ BitVec 32) Int) ListLongMap!633)

(assert (=> b!28305 (= res!16844 (not (contains!272 (getCurrentListMap!162 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(assert (= (and start!3956 res!16845) b!28299))

(assert (= (and b!28299 res!16842) b!28296))

(assert (= (and b!28296 res!16841) b!28302))

(assert (= (and b!28302 res!16843) b!28303))

(assert (= (and b!28303 res!16839) b!28305))

(assert (= (and b!28305 res!16844) b!28297))

(assert (= (and b!28297 res!16840) b!28300))

(assert (= (and b!28304 condMapEmpty!1351) mapIsEmpty!1351))

(assert (= (and b!28304 (not condMapEmpty!1351)) mapNonEmpty!1351))

(get-info :version)

(assert (= (and mapNonEmpty!1351 ((_ is ValueCellFull!408) mapValue!1351)) b!28301))

(assert (= (and b!28304 ((_ is ValueCellFull!408) mapDefault!1351)) b!28298))

(assert (= start!3956 b!28304))

(declare-fun m!22523 () Bool)

(assert (=> b!28303 m!22523))

(declare-fun m!22525 () Bool)

(assert (=> b!28297 m!22525))

(declare-fun m!22527 () Bool)

(assert (=> start!3956 m!22527))

(declare-fun m!22529 () Bool)

(assert (=> start!3956 m!22529))

(declare-fun m!22531 () Bool)

(assert (=> start!3956 m!22531))

(declare-fun m!22533 () Bool)

(assert (=> b!28305 m!22533))

(assert (=> b!28305 m!22533))

(declare-fun m!22535 () Bool)

(assert (=> b!28305 m!22535))

(declare-fun m!22537 () Bool)

(assert (=> b!28296 m!22537))

(declare-fun m!22539 () Bool)

(assert (=> b!28302 m!22539))

(declare-fun m!22541 () Bool)

(assert (=> mapNonEmpty!1351 m!22541))

(declare-fun m!22543 () Bool)

(assert (=> b!28300 m!22543))

(check-sat (not b!28296) (not b!28300) (not start!3956) (not b!28305) tp_is_empty!1215 (not b!28297) (not b!28302) (not b!28303) (not b_next!861) b_and!1671 (not mapNonEmpty!1351))
(check-sat b_and!1671 (not b_next!861))
