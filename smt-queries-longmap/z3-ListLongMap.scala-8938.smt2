; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108578 () Bool)

(assert start!108578)

(declare-fun mapIsEmpty!51863 () Bool)

(declare-fun mapRes!51863 () Bool)

(assert (=> mapIsEmpty!51863 mapRes!51863))

(declare-fun mapNonEmpty!51863 () Bool)

(declare-fun tp!98837 () Bool)

(declare-fun e!731469 () Bool)

(assert (=> mapNonEmpty!51863 (= mapRes!51863 (and tp!98837 e!731469))))

(declare-datatypes ((V!49825 0))(
  ( (V!49826 (val!16845 Int)) )
))
(declare-datatypes ((ValueCell!15872 0))(
  ( (ValueCellFull!15872 (v!19440 V!49825)) (EmptyCell!15872) )
))
(declare-datatypes ((array!84199 0))(
  ( (array!84200 (arr!40599 (Array (_ BitVec 32) ValueCell!15872)) (size!41150 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84199)

(declare-fun mapValue!51863 () ValueCell!15872)

(declare-fun mapKey!51863 () (_ BitVec 32))

(declare-fun mapRest!51863 () (Array (_ BitVec 32) ValueCell!15872))

(assert (=> mapNonEmpty!51863 (= (arr!40599 _values!1445) (store mapRest!51863 mapKey!51863 mapValue!51863))))

(declare-fun b!1280162 () Bool)

(declare-fun e!731471 () Bool)

(declare-fun e!731472 () Bool)

(assert (=> b!1280162 (= e!731471 (and e!731472 mapRes!51863))))

(declare-fun condMapEmpty!51863 () Bool)

(declare-fun mapDefault!51863 () ValueCell!15872)

(assert (=> b!1280162 (= condMapEmpty!51863 (= (arr!40599 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15872)) mapDefault!51863)))))

(declare-fun b!1280164 () Bool)

(declare-fun tp_is_empty!33541 () Bool)

(assert (=> b!1280164 (= e!731472 tp_is_empty!33541)))

(declare-fun b!1280165 () Bool)

(declare-fun e!731470 () Bool)

(assert (=> b!1280165 (= e!731470 false)))

(declare-fun lt!576426 () Bool)

(declare-datatypes ((array!84201 0))(
  ( (array!84202 (arr!40600 (Array (_ BitVec 32) (_ BitVec 64))) (size!41151 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84201)

(declare-datatypes ((List!28789 0))(
  ( (Nil!28786) (Cons!28785 (h!30003 (_ BitVec 64)) (t!42321 List!28789)) )
))
(declare-fun arrayNoDuplicates!0 (array!84201 (_ BitVec 32) List!28789) Bool)

(assert (=> b!1280165 (= lt!576426 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28786))))

(declare-fun res!850079 () Bool)

(assert (=> start!108578 (=> (not res!850079) (not e!731470))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108578 (= res!850079 (validMask!0 mask!2175))))

(assert (=> start!108578 e!731470))

(assert (=> start!108578 true))

(declare-fun array_inv!31023 (array!84199) Bool)

(assert (=> start!108578 (and (array_inv!31023 _values!1445) e!731471)))

(declare-fun array_inv!31024 (array!84201) Bool)

(assert (=> start!108578 (array_inv!31024 _keys!1741)))

(declare-fun b!1280163 () Bool)

(declare-fun res!850078 () Bool)

(assert (=> b!1280163 (=> (not res!850078) (not e!731470))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84201 (_ BitVec 32)) Bool)

(assert (=> b!1280163 (= res!850078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1280166 () Bool)

(assert (=> b!1280166 (= e!731469 tp_is_empty!33541)))

(declare-fun b!1280167 () Bool)

(declare-fun res!850080 () Bool)

(assert (=> b!1280167 (=> (not res!850080) (not e!731470))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1280167 (= res!850080 (and (= (size!41150 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41151 _keys!1741) (size!41150 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(assert (= (and start!108578 res!850079) b!1280167))

(assert (= (and b!1280167 res!850080) b!1280163))

(assert (= (and b!1280163 res!850078) b!1280165))

(assert (= (and b!1280162 condMapEmpty!51863) mapIsEmpty!51863))

(assert (= (and b!1280162 (not condMapEmpty!51863)) mapNonEmpty!51863))

(get-info :version)

(assert (= (and mapNonEmpty!51863 ((_ is ValueCellFull!15872) mapValue!51863)) b!1280166))

(assert (= (and b!1280162 ((_ is ValueCellFull!15872) mapDefault!51863)) b!1280164))

(assert (= start!108578 b!1280162))

(declare-fun m!1175637 () Bool)

(assert (=> mapNonEmpty!51863 m!1175637))

(declare-fun m!1175639 () Bool)

(assert (=> b!1280165 m!1175639))

(declare-fun m!1175641 () Bool)

(assert (=> start!108578 m!1175641))

(declare-fun m!1175643 () Bool)

(assert (=> start!108578 m!1175643))

(declare-fun m!1175645 () Bool)

(assert (=> start!108578 m!1175645))

(declare-fun m!1175647 () Bool)

(assert (=> b!1280163 m!1175647))

(check-sat (not b!1280165) tp_is_empty!33541 (not b!1280163) (not start!108578) (not mapNonEmpty!51863))
(check-sat)
