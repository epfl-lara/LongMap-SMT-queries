; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108324 () Bool)

(assert start!108324)

(declare-fun b!1278523 () Bool)

(declare-fun e!730367 () Bool)

(declare-fun e!730370 () Bool)

(declare-fun mapRes!51818 () Bool)

(assert (=> b!1278523 (= e!730367 (and e!730370 mapRes!51818))))

(declare-fun condMapEmpty!51818 () Bool)

(declare-datatypes ((V!49785 0))(
  ( (V!49786 (val!16830 Int)) )
))
(declare-datatypes ((ValueCell!15857 0))(
  ( (ValueCellFull!15857 (v!19429 V!49785)) (EmptyCell!15857) )
))
(declare-datatypes ((array!84009 0))(
  ( (array!84010 (arr!40509 (Array (_ BitVec 32) ValueCell!15857)) (size!41061 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84009)

(declare-fun mapDefault!51818 () ValueCell!15857)

(assert (=> b!1278523 (= condMapEmpty!51818 (= (arr!40509 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15857)) mapDefault!51818)))))

(declare-fun b!1278524 () Bool)

(declare-fun e!730371 () Bool)

(declare-fun tp_is_empty!33511 () Bool)

(assert (=> b!1278524 (= e!730371 tp_is_empty!33511)))

(declare-fun b!1278525 () Bool)

(declare-fun res!849396 () Bool)

(declare-fun e!730368 () Bool)

(assert (=> b!1278525 (=> (not res!849396) (not e!730368))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84011 0))(
  ( (array!84012 (arr!40510 (Array (_ BitVec 32) (_ BitVec 64))) (size!41062 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84011)

(assert (=> b!1278525 (= res!849396 (and (= (size!41061 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41062 _keys!1741) (size!41061 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1278527 () Bool)

(declare-fun res!849397 () Bool)

(assert (=> b!1278527 (=> (not res!849397) (not e!730368))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84011 (_ BitVec 32)) Bool)

(assert (=> b!1278527 (= res!849397 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!51818 () Bool)

(declare-fun tp!98793 () Bool)

(assert (=> mapNonEmpty!51818 (= mapRes!51818 (and tp!98793 e!730371))))

(declare-fun mapValue!51818 () ValueCell!15857)

(declare-fun mapKey!51818 () (_ BitVec 32))

(declare-fun mapRest!51818 () (Array (_ BitVec 32) ValueCell!15857))

(assert (=> mapNonEmpty!51818 (= (arr!40509 _values!1445) (store mapRest!51818 mapKey!51818 mapValue!51818))))

(declare-fun b!1278526 () Bool)

(assert (=> b!1278526 (= e!730368 false)))

(declare-fun lt!575719 () Bool)

(declare-datatypes ((List!28818 0))(
  ( (Nil!28815) (Cons!28814 (h!30023 (_ BitVec 64)) (t!42350 List!28818)) )
))
(declare-fun arrayNoDuplicates!0 (array!84011 (_ BitVec 32) List!28818) Bool)

(assert (=> b!1278526 (= lt!575719 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28815))))

(declare-fun res!849398 () Bool)

(assert (=> start!108324 (=> (not res!849398) (not e!730368))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108324 (= res!849398 (validMask!0 mask!2175))))

(assert (=> start!108324 e!730368))

(assert (=> start!108324 true))

(declare-fun array_inv!30927 (array!84009) Bool)

(assert (=> start!108324 (and (array_inv!30927 _values!1445) e!730367)))

(declare-fun array_inv!30928 (array!84011) Bool)

(assert (=> start!108324 (array_inv!30928 _keys!1741)))

(declare-fun mapIsEmpty!51818 () Bool)

(assert (=> mapIsEmpty!51818 mapRes!51818))

(declare-fun b!1278528 () Bool)

(assert (=> b!1278528 (= e!730370 tp_is_empty!33511)))

(assert (= (and start!108324 res!849398) b!1278525))

(assert (= (and b!1278525 res!849396) b!1278527))

(assert (= (and b!1278527 res!849397) b!1278526))

(assert (= (and b!1278523 condMapEmpty!51818) mapIsEmpty!51818))

(assert (= (and b!1278523 (not condMapEmpty!51818)) mapNonEmpty!51818))

(get-info :version)

(assert (= (and mapNonEmpty!51818 ((_ is ValueCellFull!15857) mapValue!51818)) b!1278524))

(assert (= (and b!1278523 ((_ is ValueCellFull!15857) mapDefault!51818)) b!1278528))

(assert (= start!108324 b!1278523))

(declare-fun m!1173345 () Bool)

(assert (=> b!1278527 m!1173345))

(declare-fun m!1173347 () Bool)

(assert (=> mapNonEmpty!51818 m!1173347))

(declare-fun m!1173349 () Bool)

(assert (=> b!1278526 m!1173349))

(declare-fun m!1173351 () Bool)

(assert (=> start!108324 m!1173351))

(declare-fun m!1173353 () Bool)

(assert (=> start!108324 m!1173353))

(declare-fun m!1173355 () Bool)

(assert (=> start!108324 m!1173355))

(check-sat (not b!1278526) (not start!108324) (not b!1278527) tp_is_empty!33511 (not mapNonEmpty!51818))
(check-sat)
