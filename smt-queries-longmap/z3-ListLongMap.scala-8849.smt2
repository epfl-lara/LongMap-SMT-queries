; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107318 () Bool)

(assert start!107318)

(declare-fun res!846110 () Bool)

(declare-fun e!725359 () Bool)

(assert (=> start!107318 (=> (not res!846110) (not e!725359))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107318 (= res!846110 (validMask!0 mask!1730))))

(assert (=> start!107318 e!725359))

(declare-datatypes ((V!49203 0))(
  ( (V!49204 (val!16578 Int)) )
))
(declare-datatypes ((ValueCell!15650 0))(
  ( (ValueCellFull!15650 (v!19214 V!49203)) (EmptyCell!15650) )
))
(declare-datatypes ((array!83163 0))(
  ( (array!83164 (arr!40119 (Array (_ BitVec 32) ValueCell!15650)) (size!40657 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83163)

(declare-fun e!725355 () Bool)

(declare-fun array_inv!30665 (array!83163) Bool)

(assert (=> start!107318 (and (array_inv!30665 _values!1134) e!725355)))

(assert (=> start!107318 true))

(declare-datatypes ((array!83165 0))(
  ( (array!83166 (arr!40120 (Array (_ BitVec 32) (_ BitVec 64))) (size!40658 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83165)

(declare-fun array_inv!30666 (array!83165) Bool)

(assert (=> start!107318 (array_inv!30666 _keys!1364)))

(declare-fun b!1271823 () Bool)

(declare-fun e!725356 () Bool)

(declare-fun tp_is_empty!33007 () Bool)

(assert (=> b!1271823 (= e!725356 tp_is_empty!33007)))

(declare-fun mapIsEmpty!51091 () Bool)

(declare-fun mapRes!51091 () Bool)

(assert (=> mapIsEmpty!51091 mapRes!51091))

(declare-fun mapNonEmpty!51091 () Bool)

(declare-fun tp!97433 () Bool)

(assert (=> mapNonEmpty!51091 (= mapRes!51091 (and tp!97433 e!725356))))

(declare-fun mapKey!51091 () (_ BitVec 32))

(declare-fun mapValue!51091 () ValueCell!15650)

(declare-fun mapRest!51091 () (Array (_ BitVec 32) ValueCell!15650))

(assert (=> mapNonEmpty!51091 (= (arr!40119 _values!1134) (store mapRest!51091 mapKey!51091 mapValue!51091))))

(declare-fun b!1271824 () Bool)

(declare-fun res!846112 () Bool)

(assert (=> b!1271824 (=> (not res!846112) (not e!725359))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271824 (= res!846112 (and (= (size!40657 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40658 _keys!1364) (size!40657 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1271825 () Bool)

(declare-fun res!846113 () Bool)

(assert (=> b!1271825 (=> (not res!846113) (not e!725359))))

(declare-datatypes ((List!28617 0))(
  ( (Nil!28614) (Cons!28613 (h!29822 (_ BitVec 64)) (t!42138 List!28617)) )
))
(declare-fun arrayNoDuplicates!0 (array!83165 (_ BitVec 32) List!28617) Bool)

(assert (=> b!1271825 (= res!846113 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28614))))

(declare-fun b!1271826 () Bool)

(declare-fun e!725357 () Bool)

(assert (=> b!1271826 (= e!725355 (and e!725357 mapRes!51091))))

(declare-fun condMapEmpty!51091 () Bool)

(declare-fun mapDefault!51091 () ValueCell!15650)

(assert (=> b!1271826 (= condMapEmpty!51091 (= (arr!40119 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15650)) mapDefault!51091)))))

(declare-fun b!1271827 () Bool)

(declare-fun res!846111 () Bool)

(assert (=> b!1271827 (=> (not res!846111) (not e!725359))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83165 (_ BitVec 32)) Bool)

(assert (=> b!1271827 (= res!846111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271828 () Bool)

(assert (=> b!1271828 (= e!725357 tp_is_empty!33007)))

(declare-fun b!1271829 () Bool)

(declare-fun from!1698 () (_ BitVec 32))

(assert (=> b!1271829 (= e!725359 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40658 _keys!1364)) (bvslt from!1698 (size!40658 _keys!1364)) (bvslt (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(assert (= (and start!107318 res!846110) b!1271824))

(assert (= (and b!1271824 res!846112) b!1271827))

(assert (= (and b!1271827 res!846111) b!1271825))

(assert (= (and b!1271825 res!846113) b!1271829))

(assert (= (and b!1271826 condMapEmpty!51091) mapIsEmpty!51091))

(assert (= (and b!1271826 (not condMapEmpty!51091)) mapNonEmpty!51091))

(get-info :version)

(assert (= (and mapNonEmpty!51091 ((_ is ValueCellFull!15650) mapValue!51091)) b!1271823))

(assert (= (and b!1271826 ((_ is ValueCellFull!15650) mapDefault!51091)) b!1271828))

(assert (= start!107318 b!1271826))

(declare-fun m!1169187 () Bool)

(assert (=> start!107318 m!1169187))

(declare-fun m!1169189 () Bool)

(assert (=> start!107318 m!1169189))

(declare-fun m!1169191 () Bool)

(assert (=> start!107318 m!1169191))

(declare-fun m!1169193 () Bool)

(assert (=> mapNonEmpty!51091 m!1169193))

(declare-fun m!1169195 () Bool)

(assert (=> b!1271825 m!1169195))

(declare-fun m!1169197 () Bool)

(assert (=> b!1271827 m!1169197))

(check-sat (not b!1271827) (not mapNonEmpty!51091) (not b!1271825) (not start!107318) tp_is_empty!33007)
(check-sat)
