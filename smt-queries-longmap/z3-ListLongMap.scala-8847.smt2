; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107306 () Bool)

(assert start!107306)

(declare-fun mapIsEmpty!51073 () Bool)

(declare-fun mapRes!51073 () Bool)

(assert (=> mapIsEmpty!51073 mapRes!51073))

(declare-fun b!1271713 () Bool)

(declare-fun res!846055 () Bool)

(declare-fun e!725266 () Bool)

(assert (=> b!1271713 (=> (not res!846055) (not e!725266))))

(declare-datatypes ((array!83141 0))(
  ( (array!83142 (arr!40108 (Array (_ BitVec 32) (_ BitVec 64))) (size!40646 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83141)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83141 (_ BitVec 32)) Bool)

(assert (=> b!1271713 (= res!846055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271714 () Bool)

(assert (=> b!1271714 (= e!725266 false)))

(declare-fun lt!574751 () Bool)

(declare-datatypes ((List!28613 0))(
  ( (Nil!28610) (Cons!28609 (h!29818 (_ BitVec 64)) (t!42134 List!28613)) )
))
(declare-fun arrayNoDuplicates!0 (array!83141 (_ BitVec 32) List!28613) Bool)

(assert (=> b!1271714 (= lt!574751 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28610))))

(declare-fun b!1271715 () Bool)

(declare-fun e!725267 () Bool)

(declare-fun tp_is_empty!32995 () Bool)

(assert (=> b!1271715 (= e!725267 tp_is_empty!32995)))

(declare-fun b!1271716 () Bool)

(declare-fun res!846056 () Bool)

(assert (=> b!1271716 (=> (not res!846056) (not e!725266))))

(declare-datatypes ((V!49187 0))(
  ( (V!49188 (val!16572 Int)) )
))
(declare-datatypes ((ValueCell!15644 0))(
  ( (ValueCellFull!15644 (v!19208 V!49187)) (EmptyCell!15644) )
))
(declare-datatypes ((array!83143 0))(
  ( (array!83144 (arr!40109 (Array (_ BitVec 32) ValueCell!15644)) (size!40647 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83143)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271716 (= res!846056 (and (= (size!40647 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40646 _keys!1364) (size!40647 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1271717 () Bool)

(declare-fun e!725269 () Bool)

(assert (=> b!1271717 (= e!725269 tp_is_empty!32995)))

(declare-fun mapNonEmpty!51073 () Bool)

(declare-fun tp!97415 () Bool)

(assert (=> mapNonEmpty!51073 (= mapRes!51073 (and tp!97415 e!725269))))

(declare-fun mapValue!51073 () ValueCell!15644)

(declare-fun mapKey!51073 () (_ BitVec 32))

(declare-fun mapRest!51073 () (Array (_ BitVec 32) ValueCell!15644))

(assert (=> mapNonEmpty!51073 (= (arr!40109 _values!1134) (store mapRest!51073 mapKey!51073 mapValue!51073))))

(declare-fun res!846054 () Bool)

(assert (=> start!107306 (=> (not res!846054) (not e!725266))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107306 (= res!846054 (validMask!0 mask!1730))))

(assert (=> start!107306 e!725266))

(declare-fun e!725265 () Bool)

(declare-fun array_inv!30661 (array!83143) Bool)

(assert (=> start!107306 (and (array_inv!30661 _values!1134) e!725265)))

(assert (=> start!107306 true))

(declare-fun array_inv!30662 (array!83141) Bool)

(assert (=> start!107306 (array_inv!30662 _keys!1364)))

(declare-fun b!1271718 () Bool)

(assert (=> b!1271718 (= e!725265 (and e!725267 mapRes!51073))))

(declare-fun condMapEmpty!51073 () Bool)

(declare-fun mapDefault!51073 () ValueCell!15644)

(assert (=> b!1271718 (= condMapEmpty!51073 (= (arr!40109 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15644)) mapDefault!51073)))))

(assert (= (and start!107306 res!846054) b!1271716))

(assert (= (and b!1271716 res!846056) b!1271713))

(assert (= (and b!1271713 res!846055) b!1271714))

(assert (= (and b!1271718 condMapEmpty!51073) mapIsEmpty!51073))

(assert (= (and b!1271718 (not condMapEmpty!51073)) mapNonEmpty!51073))

(get-info :version)

(assert (= (and mapNonEmpty!51073 ((_ is ValueCellFull!15644) mapValue!51073)) b!1271717))

(assert (= (and b!1271718 ((_ is ValueCellFull!15644) mapDefault!51073)) b!1271715))

(assert (= start!107306 b!1271718))

(declare-fun m!1169115 () Bool)

(assert (=> b!1271713 m!1169115))

(declare-fun m!1169117 () Bool)

(assert (=> b!1271714 m!1169117))

(declare-fun m!1169119 () Bool)

(assert (=> mapNonEmpty!51073 m!1169119))

(declare-fun m!1169121 () Bool)

(assert (=> start!107306 m!1169121))

(declare-fun m!1169123 () Bool)

(assert (=> start!107306 m!1169123))

(declare-fun m!1169125 () Bool)

(assert (=> start!107306 m!1169125))

(check-sat (not start!107306) tp_is_empty!32995 (not b!1271714) (not b!1271713) (not mapNonEmpty!51073))
(check-sat)
