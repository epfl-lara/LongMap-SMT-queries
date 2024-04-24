; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107518 () Bool)

(assert start!107518)

(declare-fun b!1272974 () Bool)

(declare-fun e!726051 () Bool)

(declare-fun e!726054 () Bool)

(declare-fun mapRes!51055 () Bool)

(assert (=> b!1272974 (= e!726051 (and e!726054 mapRes!51055))))

(declare-fun condMapEmpty!51055 () Bool)

(declare-datatypes ((V!49171 0))(
  ( (V!49172 (val!16566 Int)) )
))
(declare-datatypes ((ValueCell!15638 0))(
  ( (ValueCellFull!15638 (v!19198 V!49171)) (EmptyCell!15638) )
))
(declare-datatypes ((array!83237 0))(
  ( (array!83238 (arr!40151 (Array (_ BitVec 32) ValueCell!15638)) (size!40688 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83237)

(declare-fun mapDefault!51055 () ValueCell!15638)

(assert (=> b!1272974 (= condMapEmpty!51055 (= (arr!40151 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15638)) mapDefault!51055)))))

(declare-fun b!1272975 () Bool)

(declare-fun res!846549 () Bool)

(declare-fun e!726052 () Bool)

(assert (=> b!1272975 (=> (not res!846549) (not e!726052))))

(declare-datatypes ((array!83239 0))(
  ( (array!83240 (arr!40152 (Array (_ BitVec 32) (_ BitVec 64))) (size!40689 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83239)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83239 (_ BitVec 32)) Bool)

(assert (=> b!1272975 (= res!846549 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1272976 () Bool)

(declare-fun tp_is_empty!32983 () Bool)

(assert (=> b!1272976 (= e!726054 tp_is_empty!32983)))

(declare-fun mapIsEmpty!51055 () Bool)

(assert (=> mapIsEmpty!51055 mapRes!51055))

(declare-fun res!846548 () Bool)

(assert (=> start!107518 (=> (not res!846548) (not e!726052))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107518 (= res!846548 (validMask!0 mask!1730))))

(assert (=> start!107518 e!726052))

(declare-fun array_inv!30701 (array!83237) Bool)

(assert (=> start!107518 (and (array_inv!30701 _values!1134) e!726051)))

(assert (=> start!107518 true))

(declare-fun array_inv!30702 (array!83239) Bool)

(assert (=> start!107518 (array_inv!30702 _keys!1364)))

(declare-fun mapNonEmpty!51055 () Bool)

(declare-fun tp!97396 () Bool)

(declare-fun e!726053 () Bool)

(assert (=> mapNonEmpty!51055 (= mapRes!51055 (and tp!97396 e!726053))))

(declare-fun mapRest!51055 () (Array (_ BitVec 32) ValueCell!15638))

(declare-fun mapValue!51055 () ValueCell!15638)

(declare-fun mapKey!51055 () (_ BitVec 32))

(assert (=> mapNonEmpty!51055 (= (arr!40151 _values!1134) (store mapRest!51055 mapKey!51055 mapValue!51055))))

(declare-fun b!1272977 () Bool)

(assert (=> b!1272977 (= e!726052 false)))

(declare-fun lt!575395 () Bool)

(declare-datatypes ((List!28562 0))(
  ( (Nil!28559) (Cons!28558 (h!29776 (_ BitVec 64)) (t!42083 List!28562)) )
))
(declare-fun arrayNoDuplicates!0 (array!83239 (_ BitVec 32) List!28562) Bool)

(assert (=> b!1272977 (= lt!575395 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28559))))

(declare-fun b!1272978 () Bool)

(assert (=> b!1272978 (= e!726053 tp_is_empty!32983)))

(declare-fun b!1272979 () Bool)

(declare-fun res!846547 () Bool)

(assert (=> b!1272979 (=> (not res!846547) (not e!726052))))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(assert (=> b!1272979 (= res!846547 (and (= (size!40688 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40689 _keys!1364) (size!40688 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(assert (= (and start!107518 res!846548) b!1272979))

(assert (= (and b!1272979 res!846547) b!1272975))

(assert (= (and b!1272975 res!846549) b!1272977))

(assert (= (and b!1272974 condMapEmpty!51055) mapIsEmpty!51055))

(assert (= (and b!1272974 (not condMapEmpty!51055)) mapNonEmpty!51055))

(get-info :version)

(assert (= (and mapNonEmpty!51055 ((_ is ValueCellFull!15638) mapValue!51055)) b!1272978))

(assert (= (and b!1272974 ((_ is ValueCellFull!15638) mapDefault!51055)) b!1272976))

(assert (= start!107518 b!1272974))

(declare-fun m!1171155 () Bool)

(assert (=> b!1272975 m!1171155))

(declare-fun m!1171157 () Bool)

(assert (=> start!107518 m!1171157))

(declare-fun m!1171159 () Bool)

(assert (=> start!107518 m!1171159))

(declare-fun m!1171161 () Bool)

(assert (=> start!107518 m!1171161))

(declare-fun m!1171163 () Bool)

(assert (=> mapNonEmpty!51055 m!1171163))

(declare-fun m!1171165 () Bool)

(assert (=> b!1272977 m!1171165))

(check-sat tp_is_empty!32983 (not start!107518) (not mapNonEmpty!51055) (not b!1272977) (not b!1272975))
(check-sat)
