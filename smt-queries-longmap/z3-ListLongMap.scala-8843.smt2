; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107506 () Bool)

(assert start!107506)

(declare-fun b!1272866 () Bool)

(declare-fun res!846493 () Bool)

(declare-fun e!725964 () Bool)

(assert (=> b!1272866 (=> (not res!846493) (not e!725964))))

(declare-datatypes ((V!49155 0))(
  ( (V!49156 (val!16560 Int)) )
))
(declare-datatypes ((ValueCell!15632 0))(
  ( (ValueCellFull!15632 (v!19192 V!49155)) (EmptyCell!15632) )
))
(declare-datatypes ((array!83215 0))(
  ( (array!83216 (arr!40140 (Array (_ BitVec 32) ValueCell!15632)) (size!40677 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83215)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!83217 0))(
  ( (array!83218 (arr!40141 (Array (_ BitVec 32) (_ BitVec 64))) (size!40678 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83217)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1272866 (= res!846493 (and (= (size!40677 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40678 _keys!1364) (size!40677 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1272867 () Bool)

(assert (=> b!1272867 (= e!725964 false)))

(declare-fun lt!575377 () Bool)

(declare-datatypes ((List!28558 0))(
  ( (Nil!28555) (Cons!28554 (h!29772 (_ BitVec 64)) (t!42079 List!28558)) )
))
(declare-fun arrayNoDuplicates!0 (array!83217 (_ BitVec 32) List!28558) Bool)

(assert (=> b!1272867 (= lt!575377 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28555))))

(declare-fun b!1272868 () Bool)

(declare-fun e!725961 () Bool)

(declare-fun tp_is_empty!32971 () Bool)

(assert (=> b!1272868 (= e!725961 tp_is_empty!32971)))

(declare-fun mapIsEmpty!51037 () Bool)

(declare-fun mapRes!51037 () Bool)

(assert (=> mapIsEmpty!51037 mapRes!51037))

(declare-fun b!1272869 () Bool)

(declare-fun res!846494 () Bool)

(assert (=> b!1272869 (=> (not res!846494) (not e!725964))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83217 (_ BitVec 32)) Bool)

(assert (=> b!1272869 (= res!846494 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1272870 () Bool)

(declare-fun e!725965 () Bool)

(assert (=> b!1272870 (= e!725965 tp_is_empty!32971)))

(declare-fun res!846495 () Bool)

(assert (=> start!107506 (=> (not res!846495) (not e!725964))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107506 (= res!846495 (validMask!0 mask!1730))))

(assert (=> start!107506 e!725964))

(declare-fun e!725963 () Bool)

(declare-fun array_inv!30693 (array!83215) Bool)

(assert (=> start!107506 (and (array_inv!30693 _values!1134) e!725963)))

(assert (=> start!107506 true))

(declare-fun array_inv!30694 (array!83217) Bool)

(assert (=> start!107506 (array_inv!30694 _keys!1364)))

(declare-fun b!1272871 () Bool)

(assert (=> b!1272871 (= e!725963 (and e!725961 mapRes!51037))))

(declare-fun condMapEmpty!51037 () Bool)

(declare-fun mapDefault!51037 () ValueCell!15632)

(assert (=> b!1272871 (= condMapEmpty!51037 (= (arr!40140 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15632)) mapDefault!51037)))))

(declare-fun mapNonEmpty!51037 () Bool)

(declare-fun tp!97378 () Bool)

(assert (=> mapNonEmpty!51037 (= mapRes!51037 (and tp!97378 e!725965))))

(declare-fun mapRest!51037 () (Array (_ BitVec 32) ValueCell!15632))

(declare-fun mapValue!51037 () ValueCell!15632)

(declare-fun mapKey!51037 () (_ BitVec 32))

(assert (=> mapNonEmpty!51037 (= (arr!40140 _values!1134) (store mapRest!51037 mapKey!51037 mapValue!51037))))

(assert (= (and start!107506 res!846495) b!1272866))

(assert (= (and b!1272866 res!846493) b!1272869))

(assert (= (and b!1272869 res!846494) b!1272867))

(assert (= (and b!1272871 condMapEmpty!51037) mapIsEmpty!51037))

(assert (= (and b!1272871 (not condMapEmpty!51037)) mapNonEmpty!51037))

(get-info :version)

(assert (= (and mapNonEmpty!51037 ((_ is ValueCellFull!15632) mapValue!51037)) b!1272870))

(assert (= (and b!1272871 ((_ is ValueCellFull!15632) mapDefault!51037)) b!1272868))

(assert (= start!107506 b!1272871))

(declare-fun m!1171083 () Bool)

(assert (=> b!1272867 m!1171083))

(declare-fun m!1171085 () Bool)

(assert (=> b!1272869 m!1171085))

(declare-fun m!1171087 () Bool)

(assert (=> start!107506 m!1171087))

(declare-fun m!1171089 () Bool)

(assert (=> start!107506 m!1171089))

(declare-fun m!1171091 () Bool)

(assert (=> start!107506 m!1171091))

(declare-fun m!1171093 () Bool)

(assert (=> mapNonEmpty!51037 m!1171093))

(check-sat (not mapNonEmpty!51037) (not b!1272869) (not b!1272867) tp_is_empty!32971 (not start!107506))
(check-sat)
