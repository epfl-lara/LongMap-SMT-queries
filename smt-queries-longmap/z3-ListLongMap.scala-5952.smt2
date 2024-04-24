; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77706 () Bool)

(assert start!77706)

(declare-fun b_free!16123 () Bool)

(declare-fun b_next!16123 () Bool)

(assert (=> start!77706 (= b_free!16123 (not b_next!16123))))

(declare-fun tp!56631 () Bool)

(declare-fun b_and!26499 () Bool)

(assert (=> start!77706 (= tp!56631 b_and!26499)))

(declare-fun res!609880 () Bool)

(declare-fun e!506754 () Bool)

(assert (=> start!77706 (=> (not res!609880) (not e!506754))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77706 (= res!609880 (validMask!0 mask!1756))))

(assert (=> start!77706 e!506754))

(declare-datatypes ((V!29687 0))(
  ( (V!29688 (val!9321 Int)) )
))
(declare-datatypes ((ValueCell!8789 0))(
  ( (ValueCellFull!8789 (v!11823 V!29687)) (EmptyCell!8789) )
))
(declare-datatypes ((array!53175 0))(
  ( (array!53176 (arr!25542 (Array (_ BitVec 32) ValueCell!8789)) (size!26002 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53175)

(declare-fun e!506753 () Bool)

(declare-fun array_inv!20084 (array!53175) Bool)

(assert (=> start!77706 (and (array_inv!20084 _values!1152) e!506753)))

(assert (=> start!77706 tp!56631))

(assert (=> start!77706 true))

(declare-fun tp_is_empty!18541 () Bool)

(assert (=> start!77706 tp_is_empty!18541))

(declare-datatypes ((array!53177 0))(
  ( (array!53178 (arr!25543 (Array (_ BitVec 32) (_ BitVec 64))) (size!26003 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53177)

(declare-fun array_inv!20085 (array!53177) Bool)

(assert (=> start!77706 (array_inv!20085 _keys!1386)))

(declare-fun b!904328 () Bool)

(declare-fun e!506755 () Bool)

(assert (=> b!904328 (= e!506755 tp_is_empty!18541)))

(declare-fun mapNonEmpty!29524 () Bool)

(declare-fun mapRes!29524 () Bool)

(declare-fun tp!56632 () Bool)

(assert (=> mapNonEmpty!29524 (= mapRes!29524 (and tp!56632 e!506755))))

(declare-fun mapRest!29524 () (Array (_ BitVec 32) ValueCell!8789))

(declare-fun mapKey!29524 () (_ BitVec 32))

(declare-fun mapValue!29524 () ValueCell!8789)

(assert (=> mapNonEmpty!29524 (= (arr!25542 _values!1152) (store mapRest!29524 mapKey!29524 mapValue!29524))))

(declare-fun b!904329 () Bool)

(assert (=> b!904329 (= e!506754 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29687)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun lt!408367 () Bool)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29687)

(declare-datatypes ((tuple2!12036 0))(
  ( (tuple2!12037 (_1!6029 (_ BitVec 64)) (_2!6029 V!29687)) )
))
(declare-datatypes ((List!17886 0))(
  ( (Nil!17883) (Cons!17882 (h!19034 tuple2!12036) (t!25261 List!17886)) )
))
(declare-datatypes ((ListLongMap!10735 0))(
  ( (ListLongMap!10736 (toList!5383 List!17886)) )
))
(declare-fun contains!4441 (ListLongMap!10735 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2652 (array!53177 array!53175 (_ BitVec 32) (_ BitVec 32) V!29687 V!29687 (_ BitVec 32) Int) ListLongMap!10735)

(assert (=> b!904329 (= lt!408367 (contains!4441 (getCurrentListMap!2652 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!904330 () Bool)

(declare-fun res!609878 () Bool)

(assert (=> b!904330 (=> (not res!609878) (not e!506754))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53177 (_ BitVec 32)) Bool)

(assert (=> b!904330 (= res!609878 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!904331 () Bool)

(declare-fun res!609877 () Bool)

(assert (=> b!904331 (=> (not res!609877) (not e!506754))))

(assert (=> b!904331 (= res!609877 (and (= (size!26002 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26003 _keys!1386) (size!26002 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!904332 () Bool)

(declare-fun e!506757 () Bool)

(assert (=> b!904332 (= e!506757 tp_is_empty!18541)))

(declare-fun b!904333 () Bool)

(declare-fun res!609879 () Bool)

(assert (=> b!904333 (=> (not res!609879) (not e!506754))))

(declare-datatypes ((List!17887 0))(
  ( (Nil!17884) (Cons!17883 (h!19035 (_ BitVec 64)) (t!25262 List!17887)) )
))
(declare-fun arrayNoDuplicates!0 (array!53177 (_ BitVec 32) List!17887) Bool)

(assert (=> b!904333 (= res!609879 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17884))))

(declare-fun b!904334 () Bool)

(assert (=> b!904334 (= e!506753 (and e!506757 mapRes!29524))))

(declare-fun condMapEmpty!29524 () Bool)

(declare-fun mapDefault!29524 () ValueCell!8789)

(assert (=> b!904334 (= condMapEmpty!29524 (= (arr!25542 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8789)) mapDefault!29524)))))

(declare-fun mapIsEmpty!29524 () Bool)

(assert (=> mapIsEmpty!29524 mapRes!29524))

(assert (= (and start!77706 res!609880) b!904331))

(assert (= (and b!904331 res!609877) b!904330))

(assert (= (and b!904330 res!609878) b!904333))

(assert (= (and b!904333 res!609879) b!904329))

(assert (= (and b!904334 condMapEmpty!29524) mapIsEmpty!29524))

(assert (= (and b!904334 (not condMapEmpty!29524)) mapNonEmpty!29524))

(get-info :version)

(assert (= (and mapNonEmpty!29524 ((_ is ValueCellFull!8789) mapValue!29524)) b!904328))

(assert (= (and b!904334 ((_ is ValueCellFull!8789) mapDefault!29524)) b!904332))

(assert (= start!77706 b!904334))

(declare-fun m!840407 () Bool)

(assert (=> start!77706 m!840407))

(declare-fun m!840409 () Bool)

(assert (=> start!77706 m!840409))

(declare-fun m!840411 () Bool)

(assert (=> start!77706 m!840411))

(declare-fun m!840413 () Bool)

(assert (=> b!904329 m!840413))

(assert (=> b!904329 m!840413))

(declare-fun m!840415 () Bool)

(assert (=> b!904329 m!840415))

(declare-fun m!840417 () Bool)

(assert (=> b!904333 m!840417))

(declare-fun m!840419 () Bool)

(assert (=> b!904330 m!840419))

(declare-fun m!840421 () Bool)

(assert (=> mapNonEmpty!29524 m!840421))

(check-sat (not b!904330) tp_is_empty!18541 (not b!904333) b_and!26499 (not b_next!16123) (not start!77706) (not b!904329) (not mapNonEmpty!29524))
(check-sat b_and!26499 (not b_next!16123))
