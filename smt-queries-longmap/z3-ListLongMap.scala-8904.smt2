; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108074 () Bool)

(assert start!108074)

(declare-fun b_free!27787 () Bool)

(declare-fun b_next!27787 () Bool)

(assert (=> start!108074 (= b_free!27787 (not b_next!27787))))

(declare-fun tp!98315 () Bool)

(declare-fun b_and!45825 () Bool)

(assert (=> start!108074 (= tp!98315 b_and!45825)))

(declare-fun res!848199 () Bool)

(declare-fun e!728779 () Bool)

(assert (=> start!108074 (=> (not res!848199) (not e!728779))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108074 (= res!848199 (validMask!0 mask!1805))))

(assert (=> start!108074 e!728779))

(assert (=> start!108074 true))

(assert (=> start!108074 tp!98315))

(declare-fun tp_is_empty!33337 () Bool)

(assert (=> start!108074 tp_is_empty!33337))

(declare-datatypes ((V!49553 0))(
  ( (V!49554 (val!16743 Int)) )
))
(declare-datatypes ((ValueCell!15770 0))(
  ( (ValueCellFull!15770 (v!19339 V!49553)) (EmptyCell!15770) )
))
(declare-datatypes ((array!83671 0))(
  ( (array!83672 (arr!40347 (Array (_ BitVec 32) ValueCell!15770)) (size!40899 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83671)

(declare-fun e!728781 () Bool)

(declare-fun array_inv!30817 (array!83671) Bool)

(assert (=> start!108074 (and (array_inv!30817 _values!1187) e!728781)))

(declare-datatypes ((array!83673 0))(
  ( (array!83674 (arr!40348 (Array (_ BitVec 32) (_ BitVec 64))) (size!40900 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83673)

(declare-fun array_inv!30818 (array!83673) Bool)

(assert (=> start!108074 (array_inv!30818 _keys!1427)))

(declare-fun b!1276270 () Bool)

(assert (=> b!1276270 (= e!728779 false)))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49553)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun lt!575295 () Bool)

(declare-fun zeroValue!1129 () V!49553)

(declare-datatypes ((tuple2!21548 0))(
  ( (tuple2!21549 (_1!10785 (_ BitVec 64)) (_2!10785 V!49553)) )
))
(declare-datatypes ((List!28718 0))(
  ( (Nil!28715) (Cons!28714 (h!29923 tuple2!21548) (t!42246 List!28718)) )
))
(declare-datatypes ((ListLongMap!19205 0))(
  ( (ListLongMap!19206 (toList!9618 List!28718)) )
))
(declare-fun contains!7658 (ListLongMap!19205 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4592 (array!83673 array!83671 (_ BitVec 32) (_ BitVec 32) V!49553 V!49553 (_ BitVec 32) Int) ListLongMap!19205)

(assert (=> b!1276270 (= lt!575295 (contains!7658 (getCurrentListMap!4592 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun mapNonEmpty!51536 () Bool)

(declare-fun mapRes!51536 () Bool)

(declare-fun tp!98316 () Bool)

(declare-fun e!728778 () Bool)

(assert (=> mapNonEmpty!51536 (= mapRes!51536 (and tp!98316 e!728778))))

(declare-fun mapRest!51536 () (Array (_ BitVec 32) ValueCell!15770))

(declare-fun mapValue!51536 () ValueCell!15770)

(declare-fun mapKey!51536 () (_ BitVec 32))

(assert (=> mapNonEmpty!51536 (= (arr!40347 _values!1187) (store mapRest!51536 mapKey!51536 mapValue!51536))))

(declare-fun b!1276271 () Bool)

(assert (=> b!1276271 (= e!728778 tp_is_empty!33337)))

(declare-fun b!1276272 () Bool)

(declare-fun res!848198 () Bool)

(assert (=> b!1276272 (=> (not res!848198) (not e!728779))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83673 (_ BitVec 32)) Bool)

(assert (=> b!1276272 (= res!848198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1276273 () Bool)

(declare-fun res!848196 () Bool)

(assert (=> b!1276273 (=> (not res!848196) (not e!728779))))

(assert (=> b!1276273 (= res!848196 (and (= (size!40899 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40900 _keys!1427) (size!40899 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1276274 () Bool)

(declare-fun res!848197 () Bool)

(assert (=> b!1276274 (=> (not res!848197) (not e!728779))))

(declare-datatypes ((List!28719 0))(
  ( (Nil!28716) (Cons!28715 (h!29924 (_ BitVec 64)) (t!42247 List!28719)) )
))
(declare-fun arrayNoDuplicates!0 (array!83673 (_ BitVec 32) List!28719) Bool)

(assert (=> b!1276274 (= res!848197 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28716))))

(declare-fun b!1276275 () Bool)

(declare-fun e!728780 () Bool)

(assert (=> b!1276275 (= e!728781 (and e!728780 mapRes!51536))))

(declare-fun condMapEmpty!51536 () Bool)

(declare-fun mapDefault!51536 () ValueCell!15770)

(assert (=> b!1276275 (= condMapEmpty!51536 (= (arr!40347 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15770)) mapDefault!51536)))))

(declare-fun b!1276276 () Bool)

(assert (=> b!1276276 (= e!728780 tp_is_empty!33337)))

(declare-fun mapIsEmpty!51536 () Bool)

(assert (=> mapIsEmpty!51536 mapRes!51536))

(assert (= (and start!108074 res!848199) b!1276273))

(assert (= (and b!1276273 res!848196) b!1276272))

(assert (= (and b!1276272 res!848198) b!1276274))

(assert (= (and b!1276274 res!848197) b!1276270))

(assert (= (and b!1276275 condMapEmpty!51536) mapIsEmpty!51536))

(assert (= (and b!1276275 (not condMapEmpty!51536)) mapNonEmpty!51536))

(get-info :version)

(assert (= (and mapNonEmpty!51536 ((_ is ValueCellFull!15770) mapValue!51536)) b!1276271))

(assert (= (and b!1276275 ((_ is ValueCellFull!15770) mapDefault!51536)) b!1276276))

(assert (= start!108074 b!1276275))

(declare-fun m!1171773 () Bool)

(assert (=> start!108074 m!1171773))

(declare-fun m!1171775 () Bool)

(assert (=> start!108074 m!1171775))

(declare-fun m!1171777 () Bool)

(assert (=> start!108074 m!1171777))

(declare-fun m!1171779 () Bool)

(assert (=> b!1276274 m!1171779))

(declare-fun m!1171781 () Bool)

(assert (=> mapNonEmpty!51536 m!1171781))

(declare-fun m!1171783 () Bool)

(assert (=> b!1276272 m!1171783))

(declare-fun m!1171785 () Bool)

(assert (=> b!1276270 m!1171785))

(assert (=> b!1276270 m!1171785))

(declare-fun m!1171787 () Bool)

(assert (=> b!1276270 m!1171787))

(check-sat (not start!108074) (not b!1276270) (not mapNonEmpty!51536) (not b_next!27787) tp_is_empty!33337 (not b!1276274) (not b!1276272) b_and!45825)
(check-sat b_and!45825 (not b_next!27787))
