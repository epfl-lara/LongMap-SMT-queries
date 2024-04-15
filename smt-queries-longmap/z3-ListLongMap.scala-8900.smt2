; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108040 () Bool)

(assert start!108040)

(declare-fun b!1275990 () Bool)

(declare-fun e!728575 () Bool)

(declare-fun tp_is_empty!33313 () Bool)

(assert (=> b!1275990 (= e!728575 tp_is_empty!33313)))

(declare-fun b!1275991 () Bool)

(declare-fun e!728572 () Bool)

(assert (=> b!1275991 (= e!728572 false)))

(declare-fun lt!575259 () Bool)

(declare-datatypes ((array!83625 0))(
  ( (array!83626 (arr!40325 (Array (_ BitVec 32) (_ BitVec 64))) (size!40877 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83625)

(declare-datatypes ((List!28709 0))(
  ( (Nil!28706) (Cons!28705 (h!29914 (_ BitVec 64)) (t!42237 List!28709)) )
))
(declare-fun arrayNoDuplicates!0 (array!83625 (_ BitVec 32) List!28709) Bool)

(assert (=> b!1275991 (= lt!575259 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28706))))

(declare-fun mapIsEmpty!51497 () Bool)

(declare-fun mapRes!51497 () Bool)

(assert (=> mapIsEmpty!51497 mapRes!51497))

(declare-fun res!848046 () Bool)

(assert (=> start!108040 (=> (not res!848046) (not e!728572))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108040 (= res!848046 (validMask!0 mask!1805))))

(assert (=> start!108040 e!728572))

(assert (=> start!108040 true))

(declare-datatypes ((V!49521 0))(
  ( (V!49522 (val!16731 Int)) )
))
(declare-datatypes ((ValueCell!15758 0))(
  ( (ValueCellFull!15758 (v!19327 V!49521)) (EmptyCell!15758) )
))
(declare-datatypes ((array!83627 0))(
  ( (array!83628 (arr!40326 (Array (_ BitVec 32) ValueCell!15758)) (size!40878 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83627)

(declare-fun e!728571 () Bool)

(declare-fun array_inv!30801 (array!83627) Bool)

(assert (=> start!108040 (and (array_inv!30801 _values!1187) e!728571)))

(declare-fun array_inv!30802 (array!83625) Bool)

(assert (=> start!108040 (array_inv!30802 _keys!1427)))

(declare-fun mapNonEmpty!51497 () Bool)

(declare-fun tp!98256 () Bool)

(assert (=> mapNonEmpty!51497 (= mapRes!51497 (and tp!98256 e!728575))))

(declare-fun mapKey!51497 () (_ BitVec 32))

(declare-fun mapValue!51497 () ValueCell!15758)

(declare-fun mapRest!51497 () (Array (_ BitVec 32) ValueCell!15758))

(assert (=> mapNonEmpty!51497 (= (arr!40326 _values!1187) (store mapRest!51497 mapKey!51497 mapValue!51497))))

(declare-fun b!1275992 () Bool)

(declare-fun e!728574 () Bool)

(assert (=> b!1275992 (= e!728574 tp_is_empty!33313)))

(declare-fun b!1275993 () Bool)

(declare-fun res!848044 () Bool)

(assert (=> b!1275993 (=> (not res!848044) (not e!728572))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83625 (_ BitVec 32)) Bool)

(assert (=> b!1275993 (= res!848044 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1275994 () Bool)

(declare-fun res!848045 () Bool)

(assert (=> b!1275994 (=> (not res!848045) (not e!728572))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1275994 (= res!848045 (and (= (size!40878 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40877 _keys!1427) (size!40878 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1275995 () Bool)

(assert (=> b!1275995 (= e!728571 (and e!728574 mapRes!51497))))

(declare-fun condMapEmpty!51497 () Bool)

(declare-fun mapDefault!51497 () ValueCell!15758)

(assert (=> b!1275995 (= condMapEmpty!51497 (= (arr!40326 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15758)) mapDefault!51497)))))

(assert (= (and start!108040 res!848046) b!1275994))

(assert (= (and b!1275994 res!848045) b!1275993))

(assert (= (and b!1275993 res!848044) b!1275991))

(assert (= (and b!1275995 condMapEmpty!51497) mapIsEmpty!51497))

(assert (= (and b!1275995 (not condMapEmpty!51497)) mapNonEmpty!51497))

(get-info :version)

(assert (= (and mapNonEmpty!51497 ((_ is ValueCellFull!15758) mapValue!51497)) b!1275990))

(assert (= (and b!1275995 ((_ is ValueCellFull!15758) mapDefault!51497)) b!1275992))

(assert (= start!108040 b!1275995))

(declare-fun m!1171587 () Bool)

(assert (=> b!1275991 m!1171587))

(declare-fun m!1171589 () Bool)

(assert (=> start!108040 m!1171589))

(declare-fun m!1171591 () Bool)

(assert (=> start!108040 m!1171591))

(declare-fun m!1171593 () Bool)

(assert (=> start!108040 m!1171593))

(declare-fun m!1171595 () Bool)

(assert (=> mapNonEmpty!51497 m!1171595))

(declare-fun m!1171597 () Bool)

(assert (=> b!1275993 m!1171597))

(check-sat tp_is_empty!33313 (not b!1275993) (not mapNonEmpty!51497) (not start!108040) (not b!1275991))
(check-sat)
