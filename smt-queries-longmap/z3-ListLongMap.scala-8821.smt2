; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107152 () Bool)

(assert start!107152)

(declare-fun b!1270391 () Bool)

(declare-fun e!724142 () Bool)

(declare-fun tp_is_empty!32841 () Bool)

(assert (=> b!1270391 (= e!724142 tp_is_empty!32841)))

(declare-fun b!1270392 () Bool)

(declare-fun e!724141 () Bool)

(assert (=> b!1270392 (= e!724141 false)))

(declare-fun lt!574698 () Bool)

(declare-datatypes ((array!82944 0))(
  ( (array!82945 (arr!40009 (Array (_ BitVec 32) (_ BitVec 64))) (size!40545 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82944)

(declare-datatypes ((List!28486 0))(
  ( (Nil!28483) (Cons!28482 (h!29691 (_ BitVec 64)) (t!42015 List!28486)) )
))
(declare-fun arrayNoDuplicates!0 (array!82944 (_ BitVec 32) List!28486) Bool)

(assert (=> b!1270392 (= lt!574698 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28483))))

(declare-fun b!1270393 () Bool)

(declare-fun e!724143 () Bool)

(declare-fun e!724139 () Bool)

(declare-fun mapRes!50842 () Bool)

(assert (=> b!1270393 (= e!724143 (and e!724139 mapRes!50842))))

(declare-fun condMapEmpty!50842 () Bool)

(declare-datatypes ((V!48981 0))(
  ( (V!48982 (val!16495 Int)) )
))
(declare-datatypes ((ValueCell!15567 0))(
  ( (ValueCellFull!15567 (v!19132 V!48981)) (EmptyCell!15567) )
))
(declare-datatypes ((array!82946 0))(
  ( (array!82947 (arr!40010 (Array (_ BitVec 32) ValueCell!15567)) (size!40546 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82946)

(declare-fun mapDefault!50842 () ValueCell!15567)

(assert (=> b!1270393 (= condMapEmpty!50842 (= (arr!40010 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15567)) mapDefault!50842)))))

(declare-fun b!1270394 () Bool)

(declare-fun res!845390 () Bool)

(assert (=> b!1270394 (=> (not res!845390) (not e!724141))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82944 (_ BitVec 32)) Bool)

(assert (=> b!1270394 (= res!845390 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1270395 () Bool)

(declare-fun res!845389 () Bool)

(assert (=> b!1270395 (=> (not res!845389) (not e!724141))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270395 (= res!845389 (and (= (size!40546 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40545 _keys!1364) (size!40546 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!50842 () Bool)

(assert (=> mapIsEmpty!50842 mapRes!50842))

(declare-fun mapNonEmpty!50842 () Bool)

(declare-fun tp!97183 () Bool)

(assert (=> mapNonEmpty!50842 (= mapRes!50842 (and tp!97183 e!724142))))

(declare-fun mapKey!50842 () (_ BitVec 32))

(declare-fun mapValue!50842 () ValueCell!15567)

(declare-fun mapRest!50842 () (Array (_ BitVec 32) ValueCell!15567))

(assert (=> mapNonEmpty!50842 (= (arr!40010 _values!1134) (store mapRest!50842 mapKey!50842 mapValue!50842))))

(declare-fun b!1270396 () Bool)

(assert (=> b!1270396 (= e!724139 tp_is_empty!32841)))

(declare-fun res!845388 () Bool)

(assert (=> start!107152 (=> (not res!845388) (not e!724141))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107152 (= res!845388 (validMask!0 mask!1730))))

(assert (=> start!107152 e!724141))

(declare-fun array_inv!30431 (array!82946) Bool)

(assert (=> start!107152 (and (array_inv!30431 _values!1134) e!724143)))

(assert (=> start!107152 true))

(declare-fun array_inv!30432 (array!82944) Bool)

(assert (=> start!107152 (array_inv!30432 _keys!1364)))

(assert (= (and start!107152 res!845388) b!1270395))

(assert (= (and b!1270395 res!845389) b!1270394))

(assert (= (and b!1270394 res!845390) b!1270392))

(assert (= (and b!1270393 condMapEmpty!50842) mapIsEmpty!50842))

(assert (= (and b!1270393 (not condMapEmpty!50842)) mapNonEmpty!50842))

(get-info :version)

(assert (= (and mapNonEmpty!50842 ((_ is ValueCellFull!15567) mapValue!50842)) b!1270391))

(assert (= (and b!1270393 ((_ is ValueCellFull!15567) mapDefault!50842)) b!1270396))

(assert (= start!107152 b!1270393))

(declare-fun m!1168691 () Bool)

(assert (=> b!1270392 m!1168691))

(declare-fun m!1168693 () Bool)

(assert (=> b!1270394 m!1168693))

(declare-fun m!1168695 () Bool)

(assert (=> mapNonEmpty!50842 m!1168695))

(declare-fun m!1168697 () Bool)

(assert (=> start!107152 m!1168697))

(declare-fun m!1168699 () Bool)

(assert (=> start!107152 m!1168699))

(declare-fun m!1168701 () Bool)

(assert (=> start!107152 m!1168701))

(check-sat tp_is_empty!32841 (not start!107152) (not b!1270392) (not b!1270394) (not mapNonEmpty!50842))
(check-sat)
