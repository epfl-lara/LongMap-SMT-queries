; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108024 () Bool)

(assert start!108024)

(declare-fun b!1275910 () Bool)

(declare-fun e!728480 () Bool)

(assert (=> b!1275910 (= e!728480 false)))

(declare-fun lt!575413 () Bool)

(declare-datatypes ((array!83692 0))(
  ( (array!83693 (arr!40358 (Array (_ BitVec 32) (_ BitVec 64))) (size!40908 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83692)

(declare-datatypes ((List!28629 0))(
  ( (Nil!28626) (Cons!28625 (h!29834 (_ BitVec 64)) (t!42165 List!28629)) )
))
(declare-fun arrayNoDuplicates!0 (array!83692 (_ BitVec 32) List!28629) Bool)

(assert (=> b!1275910 (= lt!575413 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28626))))

(declare-fun mapNonEmpty!51473 () Bool)

(declare-fun mapRes!51473 () Bool)

(declare-fun tp!98231 () Bool)

(declare-fun e!728483 () Bool)

(assert (=> mapNonEmpty!51473 (= mapRes!51473 (and tp!98231 e!728483))))

(declare-datatypes ((V!49499 0))(
  ( (V!49500 (val!16723 Int)) )
))
(declare-datatypes ((ValueCell!15750 0))(
  ( (ValueCellFull!15750 (v!19320 V!49499)) (EmptyCell!15750) )
))
(declare-fun mapRest!51473 () (Array (_ BitVec 32) ValueCell!15750))

(declare-fun mapValue!51473 () ValueCell!15750)

(declare-fun mapKey!51473 () (_ BitVec 32))

(declare-datatypes ((array!83694 0))(
  ( (array!83695 (arr!40359 (Array (_ BitVec 32) ValueCell!15750)) (size!40909 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83694)

(assert (=> mapNonEmpty!51473 (= (arr!40359 _values!1187) (store mapRest!51473 mapKey!51473 mapValue!51473))))

(declare-fun b!1275912 () Bool)

(declare-fun tp_is_empty!33297 () Bool)

(assert (=> b!1275912 (= e!728483 tp_is_empty!33297)))

(declare-fun b!1275913 () Bool)

(declare-fun res!848000 () Bool)

(assert (=> b!1275913 (=> (not res!848000) (not e!728480))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83692 (_ BitVec 32)) Bool)

(assert (=> b!1275913 (= res!848000 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1275914 () Bool)

(declare-fun res!847999 () Bool)

(assert (=> b!1275914 (=> (not res!847999) (not e!728480))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1275914 (= res!847999 (and (= (size!40909 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40908 _keys!1427) (size!40909 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1275915 () Bool)

(declare-fun e!728482 () Bool)

(assert (=> b!1275915 (= e!728482 tp_is_empty!33297)))

(declare-fun mapIsEmpty!51473 () Bool)

(assert (=> mapIsEmpty!51473 mapRes!51473))

(declare-fun res!848001 () Bool)

(assert (=> start!108024 (=> (not res!848001) (not e!728480))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108024 (= res!848001 (validMask!0 mask!1805))))

(assert (=> start!108024 e!728480))

(assert (=> start!108024 true))

(declare-fun e!728484 () Bool)

(declare-fun array_inv!30673 (array!83694) Bool)

(assert (=> start!108024 (and (array_inv!30673 _values!1187) e!728484)))

(declare-fun array_inv!30674 (array!83692) Bool)

(assert (=> start!108024 (array_inv!30674 _keys!1427)))

(declare-fun b!1275911 () Bool)

(assert (=> b!1275911 (= e!728484 (and e!728482 mapRes!51473))))

(declare-fun condMapEmpty!51473 () Bool)

(declare-fun mapDefault!51473 () ValueCell!15750)

(assert (=> b!1275911 (= condMapEmpty!51473 (= (arr!40359 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15750)) mapDefault!51473)))))

(assert (= (and start!108024 res!848001) b!1275914))

(assert (= (and b!1275914 res!847999) b!1275913))

(assert (= (and b!1275913 res!848000) b!1275910))

(assert (= (and b!1275911 condMapEmpty!51473) mapIsEmpty!51473))

(assert (= (and b!1275911 (not condMapEmpty!51473)) mapNonEmpty!51473))

(get-info :version)

(assert (= (and mapNonEmpty!51473 ((_ is ValueCellFull!15750) mapValue!51473)) b!1275912))

(assert (= (and b!1275911 ((_ is ValueCellFull!15750) mapDefault!51473)) b!1275915))

(assert (= start!108024 b!1275911))

(declare-fun m!1171991 () Bool)

(assert (=> b!1275910 m!1171991))

(declare-fun m!1171993 () Bool)

(assert (=> mapNonEmpty!51473 m!1171993))

(declare-fun m!1171995 () Bool)

(assert (=> b!1275913 m!1171995))

(declare-fun m!1171997 () Bool)

(assert (=> start!108024 m!1171997))

(declare-fun m!1171999 () Bool)

(assert (=> start!108024 m!1171999))

(declare-fun m!1172001 () Bool)

(assert (=> start!108024 m!1172001))

(check-sat (not start!108024) tp_is_empty!33297 (not b!1275910) (not b!1275913) (not mapNonEmpty!51473))
(check-sat)
