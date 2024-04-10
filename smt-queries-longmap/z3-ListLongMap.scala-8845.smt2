; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107296 () Bool)

(assert start!107296)

(declare-fun mapNonEmpty!51058 () Bool)

(declare-fun mapRes!51058 () Bool)

(declare-fun tp!97399 () Bool)

(declare-fun e!725220 () Bool)

(assert (=> mapNonEmpty!51058 (= mapRes!51058 (and tp!97399 e!725220))))

(declare-fun mapKey!51058 () (_ BitVec 32))

(declare-datatypes ((V!49173 0))(
  ( (V!49174 (val!16567 Int)) )
))
(declare-datatypes ((ValueCell!15639 0))(
  ( (ValueCellFull!15639 (v!19204 V!49173)) (EmptyCell!15639) )
))
(declare-fun mapValue!51058 () ValueCell!15639)

(declare-fun mapRest!51058 () (Array (_ BitVec 32) ValueCell!15639))

(declare-datatypes ((array!83218 0))(
  ( (array!83219 (arr!40146 (Array (_ BitVec 32) ValueCell!15639)) (size!40682 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83218)

(assert (=> mapNonEmpty!51058 (= (arr!40146 _values!1134) (store mapRest!51058 mapKey!51058 mapValue!51058))))

(declare-fun b!1271687 () Bool)

(declare-fun res!846036 () Bool)

(declare-fun e!725222 () Bool)

(assert (=> b!1271687 (=> (not res!846036) (not e!725222))))

(declare-datatypes ((array!83220 0))(
  ( (array!83221 (arr!40147 (Array (_ BitVec 32) (_ BitVec 64))) (size!40683 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83220)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(assert (=> b!1271687 (= res!846036 (and (= (size!40682 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40683 _keys!1364) (size!40682 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1271689 () Bool)

(assert (=> b!1271689 (= e!725222 false)))

(declare-fun lt!574914 () Bool)

(declare-datatypes ((List!28535 0))(
  ( (Nil!28532) (Cons!28531 (h!29740 (_ BitVec 64)) (t!42064 List!28535)) )
))
(declare-fun arrayNoDuplicates!0 (array!83220 (_ BitVec 32) List!28535) Bool)

(assert (=> b!1271689 (= lt!574914 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28532))))

(declare-fun b!1271690 () Bool)

(declare-fun e!725223 () Bool)

(declare-fun e!725219 () Bool)

(assert (=> b!1271690 (= e!725223 (and e!725219 mapRes!51058))))

(declare-fun condMapEmpty!51058 () Bool)

(declare-fun mapDefault!51058 () ValueCell!15639)

(assert (=> b!1271690 (= condMapEmpty!51058 (= (arr!40146 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15639)) mapDefault!51058)))))

(declare-fun b!1271691 () Bool)

(declare-fun tp_is_empty!32985 () Bool)

(assert (=> b!1271691 (= e!725219 tp_is_empty!32985)))

(declare-fun b!1271688 () Bool)

(declare-fun res!846037 () Bool)

(assert (=> b!1271688 (=> (not res!846037) (not e!725222))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83220 (_ BitVec 32)) Bool)

(assert (=> b!1271688 (= res!846037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun res!846038 () Bool)

(assert (=> start!107296 (=> (not res!846038) (not e!725222))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107296 (= res!846038 (validMask!0 mask!1730))))

(assert (=> start!107296 e!725222))

(declare-fun array_inv!30535 (array!83218) Bool)

(assert (=> start!107296 (and (array_inv!30535 _values!1134) e!725223)))

(assert (=> start!107296 true))

(declare-fun array_inv!30536 (array!83220) Bool)

(assert (=> start!107296 (array_inv!30536 _keys!1364)))

(declare-fun mapIsEmpty!51058 () Bool)

(assert (=> mapIsEmpty!51058 mapRes!51058))

(declare-fun b!1271692 () Bool)

(assert (=> b!1271692 (= e!725220 tp_is_empty!32985)))

(assert (= (and start!107296 res!846038) b!1271687))

(assert (= (and b!1271687 res!846036) b!1271688))

(assert (= (and b!1271688 res!846037) b!1271689))

(assert (= (and b!1271690 condMapEmpty!51058) mapIsEmpty!51058))

(assert (= (and b!1271690 (not condMapEmpty!51058)) mapNonEmpty!51058))

(get-info :version)

(assert (= (and mapNonEmpty!51058 ((_ is ValueCellFull!15639) mapValue!51058)) b!1271692))

(assert (= (and b!1271690 ((_ is ValueCellFull!15639) mapDefault!51058)) b!1271691))

(assert (= start!107296 b!1271690))

(declare-fun m!1169555 () Bool)

(assert (=> mapNonEmpty!51058 m!1169555))

(declare-fun m!1169557 () Bool)

(assert (=> b!1271689 m!1169557))

(declare-fun m!1169559 () Bool)

(assert (=> b!1271688 m!1169559))

(declare-fun m!1169561 () Bool)

(assert (=> start!107296 m!1169561))

(declare-fun m!1169563 () Bool)

(assert (=> start!107296 m!1169563))

(declare-fun m!1169565 () Bool)

(assert (=> start!107296 m!1169565))

(check-sat (not b!1271688) (not mapNonEmpty!51058) tp_is_empty!32985 (not start!107296) (not b!1271689))
(check-sat)
