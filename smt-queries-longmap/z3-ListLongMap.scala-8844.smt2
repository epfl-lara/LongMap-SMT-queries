; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107512 () Bool)

(assert start!107512)

(declare-fun mapNonEmpty!51046 () Bool)

(declare-fun mapRes!51046 () Bool)

(declare-fun tp!97387 () Bool)

(declare-fun e!726010 () Bool)

(assert (=> mapNonEmpty!51046 (= mapRes!51046 (and tp!97387 e!726010))))

(declare-datatypes ((V!49163 0))(
  ( (V!49164 (val!16563 Int)) )
))
(declare-datatypes ((ValueCell!15635 0))(
  ( (ValueCellFull!15635 (v!19195 V!49163)) (EmptyCell!15635) )
))
(declare-datatypes ((array!83227 0))(
  ( (array!83228 (arr!40146 (Array (_ BitVec 32) ValueCell!15635)) (size!40683 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83227)

(declare-fun mapRest!51046 () (Array (_ BitVec 32) ValueCell!15635))

(declare-fun mapKey!51046 () (_ BitVec 32))

(declare-fun mapValue!51046 () ValueCell!15635)

(assert (=> mapNonEmpty!51046 (= (arr!40146 _values!1134) (store mapRest!51046 mapKey!51046 mapValue!51046))))

(declare-fun mapIsEmpty!51046 () Bool)

(assert (=> mapIsEmpty!51046 mapRes!51046))

(declare-fun b!1272920 () Bool)

(declare-fun res!846521 () Bool)

(declare-fun e!726008 () Bool)

(assert (=> b!1272920 (=> (not res!846521) (not e!726008))))

(declare-datatypes ((array!83229 0))(
  ( (array!83230 (arr!40147 (Array (_ BitVec 32) (_ BitVec 64))) (size!40684 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83229)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83229 (_ BitVec 32)) Bool)

(assert (=> b!1272920 (= res!846521 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1272921 () Bool)

(declare-fun e!726007 () Bool)

(declare-fun e!726006 () Bool)

(assert (=> b!1272921 (= e!726007 (and e!726006 mapRes!51046))))

(declare-fun condMapEmpty!51046 () Bool)

(declare-fun mapDefault!51046 () ValueCell!15635)

(assert (=> b!1272921 (= condMapEmpty!51046 (= (arr!40146 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15635)) mapDefault!51046)))))

(declare-fun b!1272922 () Bool)

(assert (=> b!1272922 (= e!726008 false)))

(declare-fun lt!575386 () Bool)

(declare-datatypes ((List!28560 0))(
  ( (Nil!28557) (Cons!28556 (h!29774 (_ BitVec 64)) (t!42081 List!28560)) )
))
(declare-fun arrayNoDuplicates!0 (array!83229 (_ BitVec 32) List!28560) Bool)

(assert (=> b!1272922 (= lt!575386 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28557))))

(declare-fun b!1272923 () Bool)

(declare-fun tp_is_empty!32977 () Bool)

(assert (=> b!1272923 (= e!726010 tp_is_empty!32977)))

(declare-fun b!1272924 () Bool)

(assert (=> b!1272924 (= e!726006 tp_is_empty!32977)))

(declare-fun b!1272925 () Bool)

(declare-fun res!846520 () Bool)

(assert (=> b!1272925 (=> (not res!846520) (not e!726008))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1272925 (= res!846520 (and (= (size!40683 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40684 _keys!1364) (size!40683 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun res!846522 () Bool)

(assert (=> start!107512 (=> (not res!846522) (not e!726008))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107512 (= res!846522 (validMask!0 mask!1730))))

(assert (=> start!107512 e!726008))

(declare-fun array_inv!30697 (array!83227) Bool)

(assert (=> start!107512 (and (array_inv!30697 _values!1134) e!726007)))

(assert (=> start!107512 true))

(declare-fun array_inv!30698 (array!83229) Bool)

(assert (=> start!107512 (array_inv!30698 _keys!1364)))

(assert (= (and start!107512 res!846522) b!1272925))

(assert (= (and b!1272925 res!846520) b!1272920))

(assert (= (and b!1272920 res!846521) b!1272922))

(assert (= (and b!1272921 condMapEmpty!51046) mapIsEmpty!51046))

(assert (= (and b!1272921 (not condMapEmpty!51046)) mapNonEmpty!51046))

(get-info :version)

(assert (= (and mapNonEmpty!51046 ((_ is ValueCellFull!15635) mapValue!51046)) b!1272923))

(assert (= (and b!1272921 ((_ is ValueCellFull!15635) mapDefault!51046)) b!1272924))

(assert (= start!107512 b!1272921))

(declare-fun m!1171119 () Bool)

(assert (=> mapNonEmpty!51046 m!1171119))

(declare-fun m!1171121 () Bool)

(assert (=> b!1272920 m!1171121))

(declare-fun m!1171123 () Bool)

(assert (=> b!1272922 m!1171123))

(declare-fun m!1171125 () Bool)

(assert (=> start!107512 m!1171125))

(declare-fun m!1171127 () Bool)

(assert (=> start!107512 m!1171127))

(declare-fun m!1171129 () Bool)

(assert (=> start!107512 m!1171129))

(check-sat tp_is_empty!32977 (not b!1272922) (not mapNonEmpty!51046) (not b!1272920) (not start!107512))
(check-sat)
