; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108016 () Bool)

(assert start!108016)

(declare-fun b!1275774 () Bool)

(declare-fun e!728395 () Bool)

(declare-fun tp_is_empty!33289 () Bool)

(assert (=> b!1275774 (= e!728395 tp_is_empty!33289)))

(declare-fun mapNonEmpty!51461 () Bool)

(declare-fun mapRes!51461 () Bool)

(declare-fun tp!98220 () Bool)

(declare-fun e!728394 () Bool)

(assert (=> mapNonEmpty!51461 (= mapRes!51461 (and tp!98220 e!728394))))

(declare-datatypes ((V!49489 0))(
  ( (V!49490 (val!16719 Int)) )
))
(declare-datatypes ((ValueCell!15746 0))(
  ( (ValueCellFull!15746 (v!19315 V!49489)) (EmptyCell!15746) )
))
(declare-fun mapRest!51461 () (Array (_ BitVec 32) ValueCell!15746))

(declare-fun mapKey!51461 () (_ BitVec 32))

(declare-datatypes ((array!83583 0))(
  ( (array!83584 (arr!40304 (Array (_ BitVec 32) ValueCell!15746)) (size!40856 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83583)

(declare-fun mapValue!51461 () ValueCell!15746)

(assert (=> mapNonEmpty!51461 (= (arr!40304 _values!1187) (store mapRest!51461 mapKey!51461 mapValue!51461))))

(declare-fun b!1275775 () Bool)

(declare-fun res!847938 () Bool)

(declare-fun e!728391 () Bool)

(assert (=> b!1275775 (=> (not res!847938) (not e!728391))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((array!83585 0))(
  ( (array!83586 (arr!40305 (Array (_ BitVec 32) (_ BitVec 64))) (size!40857 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83585)

(assert (=> b!1275775 (= res!847938 (and (= (size!40856 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40857 _keys!1427) (size!40856 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1275776 () Bool)

(declare-fun res!847936 () Bool)

(assert (=> b!1275776 (=> (not res!847936) (not e!728391))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83585 (_ BitVec 32)) Bool)

(assert (=> b!1275776 (= res!847936 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1275777 () Bool)

(assert (=> b!1275777 (= e!728391 false)))

(declare-fun lt!575223 () Bool)

(declare-datatypes ((List!28703 0))(
  ( (Nil!28700) (Cons!28699 (h!29908 (_ BitVec 64)) (t!42231 List!28703)) )
))
(declare-fun arrayNoDuplicates!0 (array!83585 (_ BitVec 32) List!28703) Bool)

(assert (=> b!1275777 (= lt!575223 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28700))))

(declare-fun b!1275778 () Bool)

(declare-fun e!728392 () Bool)

(assert (=> b!1275778 (= e!728392 (and e!728395 mapRes!51461))))

(declare-fun condMapEmpty!51461 () Bool)

(declare-fun mapDefault!51461 () ValueCell!15746)

(assert (=> b!1275778 (= condMapEmpty!51461 (= (arr!40304 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15746)) mapDefault!51461)))))

(declare-fun b!1275779 () Bool)

(assert (=> b!1275779 (= e!728394 tp_is_empty!33289)))

(declare-fun res!847937 () Bool)

(assert (=> start!108016 (=> (not res!847937) (not e!728391))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108016 (= res!847937 (validMask!0 mask!1805))))

(assert (=> start!108016 e!728391))

(assert (=> start!108016 true))

(declare-fun array_inv!30785 (array!83583) Bool)

(assert (=> start!108016 (and (array_inv!30785 _values!1187) e!728392)))

(declare-fun array_inv!30786 (array!83585) Bool)

(assert (=> start!108016 (array_inv!30786 _keys!1427)))

(declare-fun mapIsEmpty!51461 () Bool)

(assert (=> mapIsEmpty!51461 mapRes!51461))

(assert (= (and start!108016 res!847937) b!1275775))

(assert (= (and b!1275775 res!847938) b!1275776))

(assert (= (and b!1275776 res!847936) b!1275777))

(assert (= (and b!1275778 condMapEmpty!51461) mapIsEmpty!51461))

(assert (= (and b!1275778 (not condMapEmpty!51461)) mapNonEmpty!51461))

(get-info :version)

(assert (= (and mapNonEmpty!51461 ((_ is ValueCellFull!15746) mapValue!51461)) b!1275779))

(assert (= (and b!1275778 ((_ is ValueCellFull!15746) mapDefault!51461)) b!1275774))

(assert (= start!108016 b!1275778))

(declare-fun m!1171443 () Bool)

(assert (=> mapNonEmpty!51461 m!1171443))

(declare-fun m!1171445 () Bool)

(assert (=> b!1275776 m!1171445))

(declare-fun m!1171447 () Bool)

(assert (=> b!1275777 m!1171447))

(declare-fun m!1171449 () Bool)

(assert (=> start!108016 m!1171449))

(declare-fun m!1171451 () Bool)

(assert (=> start!108016 m!1171451))

(declare-fun m!1171453 () Bool)

(assert (=> start!108016 m!1171453))

(check-sat (not b!1275776) (not mapNonEmpty!51461) tp_is_empty!33289 (not start!108016) (not b!1275777))
(check-sat)
