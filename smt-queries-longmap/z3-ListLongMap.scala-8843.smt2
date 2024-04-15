; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107282 () Bool)

(assert start!107282)

(declare-fun mapNonEmpty!51037 () Bool)

(declare-fun mapRes!51037 () Bool)

(declare-fun tp!97379 () Bool)

(declare-fun e!725086 () Bool)

(assert (=> mapNonEmpty!51037 (= mapRes!51037 (and tp!97379 e!725086))))

(declare-datatypes ((V!49155 0))(
  ( (V!49156 (val!16560 Int)) )
))
(declare-datatypes ((ValueCell!15632 0))(
  ( (ValueCellFull!15632 (v!19196 V!49155)) (EmptyCell!15632) )
))
(declare-datatypes ((array!83099 0))(
  ( (array!83100 (arr!40087 (Array (_ BitVec 32) ValueCell!15632)) (size!40625 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83099)

(declare-fun mapValue!51037 () ValueCell!15632)

(declare-fun mapRest!51037 () (Array (_ BitVec 32) ValueCell!15632))

(declare-fun mapKey!51037 () (_ BitVec 32))

(assert (=> mapNonEmpty!51037 (= (arr!40087 _values!1134) (store mapRest!51037 mapKey!51037 mapValue!51037))))

(declare-fun mapIsEmpty!51037 () Bool)

(assert (=> mapIsEmpty!51037 mapRes!51037))

(declare-fun b!1271497 () Bool)

(declare-fun e!725087 () Bool)

(assert (=> b!1271497 (= e!725087 false)))

(declare-fun lt!574715 () Bool)

(declare-datatypes ((array!83101 0))(
  ( (array!83102 (arr!40088 (Array (_ BitVec 32) (_ BitVec 64))) (size!40626 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83101)

(declare-datatypes ((List!28606 0))(
  ( (Nil!28603) (Cons!28602 (h!29811 (_ BitVec 64)) (t!42127 List!28606)) )
))
(declare-fun arrayNoDuplicates!0 (array!83101 (_ BitVec 32) List!28606) Bool)

(assert (=> b!1271497 (= lt!574715 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28603))))

(declare-fun res!845947 () Bool)

(assert (=> start!107282 (=> (not res!845947) (not e!725087))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107282 (= res!845947 (validMask!0 mask!1730))))

(assert (=> start!107282 e!725087))

(declare-fun e!725088 () Bool)

(declare-fun array_inv!30645 (array!83099) Bool)

(assert (=> start!107282 (and (array_inv!30645 _values!1134) e!725088)))

(assert (=> start!107282 true))

(declare-fun array_inv!30646 (array!83101) Bool)

(assert (=> start!107282 (array_inv!30646 _keys!1364)))

(declare-fun b!1271498 () Bool)

(declare-fun e!725085 () Bool)

(declare-fun tp_is_empty!32971 () Bool)

(assert (=> b!1271498 (= e!725085 tp_is_empty!32971)))

(declare-fun b!1271499 () Bool)

(assert (=> b!1271499 (= e!725088 (and e!725085 mapRes!51037))))

(declare-fun condMapEmpty!51037 () Bool)

(declare-fun mapDefault!51037 () ValueCell!15632)

(assert (=> b!1271499 (= condMapEmpty!51037 (= (arr!40087 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15632)) mapDefault!51037)))))

(declare-fun b!1271500 () Bool)

(assert (=> b!1271500 (= e!725086 tp_is_empty!32971)))

(declare-fun b!1271501 () Bool)

(declare-fun res!845946 () Bool)

(assert (=> b!1271501 (=> (not res!845946) (not e!725087))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271501 (= res!845946 (and (= (size!40625 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40626 _keys!1364) (size!40625 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1271502 () Bool)

(declare-fun res!845948 () Bool)

(assert (=> b!1271502 (=> (not res!845948) (not e!725087))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83101 (_ BitVec 32)) Bool)

(assert (=> b!1271502 (= res!845948 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(assert (= (and start!107282 res!845947) b!1271501))

(assert (= (and b!1271501 res!845946) b!1271502))

(assert (= (and b!1271502 res!845948) b!1271497))

(assert (= (and b!1271499 condMapEmpty!51037) mapIsEmpty!51037))

(assert (= (and b!1271499 (not condMapEmpty!51037)) mapNonEmpty!51037))

(get-info :version)

(assert (= (and mapNonEmpty!51037 ((_ is ValueCellFull!15632) mapValue!51037)) b!1271500))

(assert (= (and b!1271499 ((_ is ValueCellFull!15632) mapDefault!51037)) b!1271498))

(assert (= start!107282 b!1271499))

(declare-fun m!1168971 () Bool)

(assert (=> mapNonEmpty!51037 m!1168971))

(declare-fun m!1168973 () Bool)

(assert (=> b!1271497 m!1168973))

(declare-fun m!1168975 () Bool)

(assert (=> start!107282 m!1168975))

(declare-fun m!1168977 () Bool)

(assert (=> start!107282 m!1168977))

(declare-fun m!1168979 () Bool)

(assert (=> start!107282 m!1168979))

(declare-fun m!1168981 () Bool)

(assert (=> b!1271502 m!1168981))

(check-sat (not mapNonEmpty!51037) (not start!107282) tp_is_empty!32971 (not b!1271502) (not b!1271497))
(check-sat)
