; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108222 () Bool)

(assert start!108222)

(declare-fun mapIsEmpty!51434 () Bool)

(declare-fun mapRes!51434 () Bool)

(assert (=> mapIsEmpty!51434 mapRes!51434))

(declare-fun b!1276981 () Bool)

(declare-fun res!848402 () Bool)

(declare-fun e!729134 () Bool)

(assert (=> b!1276981 (=> (not res!848402) (not e!729134))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((array!83671 0))(
  ( (array!83672 (arr!40343 (Array (_ BitVec 32) (_ BitVec 64))) (size!40894 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83671)

(declare-datatypes ((V!49465 0))(
  ( (V!49466 (val!16710 Int)) )
))
(declare-datatypes ((ValueCell!15737 0))(
  ( (ValueCellFull!15737 (v!19302 V!49465)) (EmptyCell!15737) )
))
(declare-datatypes ((array!83673 0))(
  ( (array!83674 (arr!40344 (Array (_ BitVec 32) ValueCell!15737)) (size!40895 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83673)

(assert (=> b!1276981 (= res!848402 (and (= (size!40895 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40894 _keys!1427) (size!40895 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1276982 () Bool)

(declare-fun e!729133 () Bool)

(declare-fun tp_is_empty!33271 () Bool)

(assert (=> b!1276982 (= e!729133 tp_is_empty!33271)))

(declare-fun b!1276983 () Bool)

(declare-fun res!848403 () Bool)

(assert (=> b!1276983 (=> (not res!848403) (not e!729134))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83671 (_ BitVec 32)) Bool)

(assert (=> b!1276983 (= res!848403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1276984 () Bool)

(assert (=> b!1276984 (= e!729134 false)))

(declare-fun lt!575858 () Bool)

(declare-datatypes ((List!28649 0))(
  ( (Nil!28646) (Cons!28645 (h!29863 (_ BitVec 64)) (t!42177 List!28649)) )
))
(declare-fun arrayNoDuplicates!0 (array!83671 (_ BitVec 32) List!28649) Bool)

(assert (=> b!1276984 (= lt!575858 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28646))))

(declare-fun b!1276985 () Bool)

(declare-fun e!729135 () Bool)

(assert (=> b!1276985 (= e!729135 (and e!729133 mapRes!51434))))

(declare-fun condMapEmpty!51434 () Bool)

(declare-fun mapDefault!51434 () ValueCell!15737)

(assert (=> b!1276985 (= condMapEmpty!51434 (= (arr!40344 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15737)) mapDefault!51434)))))

(declare-fun b!1276986 () Bool)

(declare-fun e!729136 () Bool)

(assert (=> b!1276986 (= e!729136 tp_is_empty!33271)))

(declare-fun mapNonEmpty!51434 () Bool)

(declare-fun tp!98192 () Bool)

(assert (=> mapNonEmpty!51434 (= mapRes!51434 (and tp!98192 e!729136))))

(declare-fun mapValue!51434 () ValueCell!15737)

(declare-fun mapKey!51434 () (_ BitVec 32))

(declare-fun mapRest!51434 () (Array (_ BitVec 32) ValueCell!15737))

(assert (=> mapNonEmpty!51434 (= (arr!40344 _values!1187) (store mapRest!51434 mapKey!51434 mapValue!51434))))

(declare-fun res!848404 () Bool)

(assert (=> start!108222 (=> (not res!848404) (not e!729134))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108222 (= res!848404 (validMask!0 mask!1805))))

(assert (=> start!108222 e!729134))

(assert (=> start!108222 true))

(declare-fun array_inv!30851 (array!83673) Bool)

(assert (=> start!108222 (and (array_inv!30851 _values!1187) e!729135)))

(declare-fun array_inv!30852 (array!83671) Bool)

(assert (=> start!108222 (array_inv!30852 _keys!1427)))

(assert (= (and start!108222 res!848404) b!1276981))

(assert (= (and b!1276981 res!848402) b!1276983))

(assert (= (and b!1276983 res!848403) b!1276984))

(assert (= (and b!1276985 condMapEmpty!51434) mapIsEmpty!51434))

(assert (= (and b!1276985 (not condMapEmpty!51434)) mapNonEmpty!51434))

(get-info :version)

(assert (= (and mapNonEmpty!51434 ((_ is ValueCellFull!15737) mapValue!51434)) b!1276986))

(assert (= (and b!1276985 ((_ is ValueCellFull!15737) mapDefault!51434)) b!1276982))

(assert (= start!108222 b!1276985))

(declare-fun m!1173447 () Bool)

(assert (=> b!1276983 m!1173447))

(declare-fun m!1173449 () Bool)

(assert (=> b!1276984 m!1173449))

(declare-fun m!1173451 () Bool)

(assert (=> mapNonEmpty!51434 m!1173451))

(declare-fun m!1173453 () Bool)

(assert (=> start!108222 m!1173453))

(declare-fun m!1173455 () Bool)

(assert (=> start!108222 m!1173455))

(declare-fun m!1173457 () Bool)

(assert (=> start!108222 m!1173457))

(check-sat (not start!108222) (not b!1276983) (not mapNonEmpty!51434) (not b!1276984) tp_is_empty!33271)
(check-sat)
