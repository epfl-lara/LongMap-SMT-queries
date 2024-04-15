; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107030 () Bool)

(assert start!107030)

(declare-fun b!1268905 () Bool)

(declare-fun e!723198 () Bool)

(declare-fun tp_is_empty!32719 () Bool)

(assert (=> b!1268905 (= e!723198 tp_is_empty!32719)))

(declare-fun b!1268906 () Bool)

(declare-fun res!844489 () Bool)

(declare-fun e!723195 () Bool)

(assert (=> b!1268906 (=> (not res!844489) (not e!723195))))

(declare-datatypes ((array!82623 0))(
  ( (array!82624 (arr!39849 (Array (_ BitVec 32) (_ BitVec 64))) (size!40387 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82623)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82623 (_ BitVec 32)) Bool)

(assert (=> b!1268906 (= res!844489 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1268907 () Bool)

(declare-fun res!844490 () Bool)

(assert (=> b!1268907 (=> (not res!844490) (not e!723195))))

(declare-datatypes ((V!48819 0))(
  ( (V!48820 (val!16434 Int)) )
))
(declare-datatypes ((ValueCell!15506 0))(
  ( (ValueCellFull!15506 (v!19070 V!48819)) (EmptyCell!15506) )
))
(declare-datatypes ((array!82625 0))(
  ( (array!82626 (arr!39850 (Array (_ BitVec 32) ValueCell!15506)) (size!40388 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82625)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1268907 (= res!844490 (and (= (size!40388 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40387 _keys!1364) (size!40388 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1268908 () Bool)

(assert (=> b!1268908 (= e!723195 false)))

(declare-fun lt!574337 () Bool)

(declare-datatypes ((List!28487 0))(
  ( (Nil!28484) (Cons!28483 (h!29692 (_ BitVec 64)) (t!42008 List!28487)) )
))
(declare-fun arrayNoDuplicates!0 (array!82623 (_ BitVec 32) List!28487) Bool)

(assert (=> b!1268908 (= lt!574337 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28484))))

(declare-fun mapIsEmpty!50659 () Bool)

(declare-fun mapRes!50659 () Bool)

(assert (=> mapIsEmpty!50659 mapRes!50659))

(declare-fun mapNonEmpty!50659 () Bool)

(declare-fun tp!96839 () Bool)

(assert (=> mapNonEmpty!50659 (= mapRes!50659 (and tp!96839 e!723198))))

(declare-fun mapKey!50659 () (_ BitVec 32))

(declare-fun mapRest!50659 () (Array (_ BitVec 32) ValueCell!15506))

(declare-fun mapValue!50659 () ValueCell!15506)

(assert (=> mapNonEmpty!50659 (= (arr!39850 _values!1134) (store mapRest!50659 mapKey!50659 mapValue!50659))))

(declare-fun res!844488 () Bool)

(assert (=> start!107030 (=> (not res!844488) (not e!723195))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107030 (= res!844488 (validMask!0 mask!1730))))

(assert (=> start!107030 e!723195))

(declare-fun e!723199 () Bool)

(declare-fun array_inv!30487 (array!82625) Bool)

(assert (=> start!107030 (and (array_inv!30487 _values!1134) e!723199)))

(assert (=> start!107030 true))

(declare-fun array_inv!30488 (array!82623) Bool)

(assert (=> start!107030 (array_inv!30488 _keys!1364)))

(declare-fun b!1268909 () Bool)

(declare-fun e!723197 () Bool)

(assert (=> b!1268909 (= e!723197 tp_is_empty!32719)))

(declare-fun b!1268910 () Bool)

(assert (=> b!1268910 (= e!723199 (and e!723197 mapRes!50659))))

(declare-fun condMapEmpty!50659 () Bool)

(declare-fun mapDefault!50659 () ValueCell!15506)

(assert (=> b!1268910 (= condMapEmpty!50659 (= (arr!39850 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15506)) mapDefault!50659)))))

(assert (= (and start!107030 res!844488) b!1268907))

(assert (= (and b!1268907 res!844490) b!1268906))

(assert (= (and b!1268906 res!844489) b!1268908))

(assert (= (and b!1268910 condMapEmpty!50659) mapIsEmpty!50659))

(assert (= (and b!1268910 (not condMapEmpty!50659)) mapNonEmpty!50659))

(get-info :version)

(assert (= (and mapNonEmpty!50659 ((_ is ValueCellFull!15506) mapValue!50659)) b!1268905))

(assert (= (and b!1268910 ((_ is ValueCellFull!15506) mapDefault!50659)) b!1268909))

(assert (= start!107030 b!1268910))

(declare-fun m!1167135 () Bool)

(assert (=> b!1268906 m!1167135))

(declare-fun m!1167137 () Bool)

(assert (=> b!1268908 m!1167137))

(declare-fun m!1167139 () Bool)

(assert (=> mapNonEmpty!50659 m!1167139))

(declare-fun m!1167141 () Bool)

(assert (=> start!107030 m!1167141))

(declare-fun m!1167143 () Bool)

(assert (=> start!107030 m!1167143))

(declare-fun m!1167145 () Bool)

(assert (=> start!107030 m!1167145))

(check-sat (not b!1268908) (not start!107030) (not b!1268906) (not mapNonEmpty!50659) tp_is_empty!32719)
(check-sat)
