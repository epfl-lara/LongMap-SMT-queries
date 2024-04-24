; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107114 () Bool)

(assert start!107114)

(declare-fun b!1269298 () Bool)

(declare-fun e!723256 () Bool)

(declare-fun e!723258 () Bool)

(declare-fun mapRes!50500 () Bool)

(assert (=> b!1269298 (= e!723256 (and e!723258 mapRes!50500))))

(declare-fun condMapEmpty!50500 () Bool)

(declare-datatypes ((V!48691 0))(
  ( (V!48692 (val!16386 Int)) )
))
(declare-datatypes ((ValueCell!15458 0))(
  ( (ValueCellFull!15458 (v!19017 V!48691)) (EmptyCell!15458) )
))
(declare-datatypes ((array!82557 0))(
  ( (array!82558 (arr!39816 (Array (_ BitVec 32) ValueCell!15458)) (size!40353 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82557)

(declare-fun mapDefault!50500 () ValueCell!15458)

(assert (=> b!1269298 (= condMapEmpty!50500 (= (arr!39816 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15458)) mapDefault!50500)))))

(declare-fun b!1269299 () Bool)

(declare-fun e!723260 () Bool)

(declare-fun tp_is_empty!32623 () Bool)

(assert (=> b!1269299 (= e!723260 tp_is_empty!32623)))

(declare-fun b!1269300 () Bool)

(assert (=> b!1269300 (= e!723258 tp_is_empty!32623)))

(declare-fun res!844555 () Bool)

(declare-fun e!723257 () Bool)

(assert (=> start!107114 (=> (not res!844555) (not e!723257))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107114 (= res!844555 (validMask!0 mask!1730))))

(assert (=> start!107114 e!723257))

(declare-fun array_inv!30465 (array!82557) Bool)

(assert (=> start!107114 (and (array_inv!30465 _values!1134) e!723256)))

(assert (=> start!107114 true))

(declare-datatypes ((array!82559 0))(
  ( (array!82560 (arr!39817 (Array (_ BitVec 32) (_ BitVec 64))) (size!40354 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82559)

(declare-fun array_inv!30466 (array!82559) Bool)

(assert (=> start!107114 (array_inv!30466 _keys!1364)))

(declare-fun mapNonEmpty!50500 () Bool)

(declare-fun tp!96679 () Bool)

(assert (=> mapNonEmpty!50500 (= mapRes!50500 (and tp!96679 e!723260))))

(declare-fun mapRest!50500 () (Array (_ BitVec 32) ValueCell!15458))

(declare-fun mapValue!50500 () ValueCell!15458)

(declare-fun mapKey!50500 () (_ BitVec 32))

(assert (=> mapNonEmpty!50500 (= (arr!39816 _values!1134) (store mapRest!50500 mapKey!50500 mapValue!50500))))

(declare-fun mapIsEmpty!50500 () Bool)

(assert (=> mapIsEmpty!50500 mapRes!50500))

(declare-fun b!1269301 () Bool)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1269301 (= e!723257 (and (= (size!40353 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40354 _keys!1364) (size!40353 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011) (not (= (size!40354 _keys!1364) (bvadd #b00000000000000000000000000000001 mask!1730)))))))

(assert (= (and start!107114 res!844555) b!1269301))

(assert (= (and b!1269298 condMapEmpty!50500) mapIsEmpty!50500))

(assert (= (and b!1269298 (not condMapEmpty!50500)) mapNonEmpty!50500))

(get-info :version)

(assert (= (and mapNonEmpty!50500 ((_ is ValueCellFull!15458) mapValue!50500)) b!1269299))

(assert (= (and b!1269298 ((_ is ValueCellFull!15458) mapDefault!50500)) b!1269300))

(assert (= start!107114 b!1269298))

(declare-fun m!1168619 () Bool)

(assert (=> start!107114 m!1168619))

(declare-fun m!1168621 () Bool)

(assert (=> start!107114 m!1168621))

(declare-fun m!1168623 () Bool)

(assert (=> start!107114 m!1168623))

(declare-fun m!1168625 () Bool)

(assert (=> mapNonEmpty!50500 m!1168625))

(check-sat (not start!107114) (not mapNonEmpty!50500) tp_is_empty!32623)
(check-sat)
