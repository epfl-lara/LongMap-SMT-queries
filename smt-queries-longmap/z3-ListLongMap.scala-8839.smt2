; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107482 () Bool)

(assert start!107482)

(declare-fun b!1272650 () Bool)

(declare-fun e!725784 () Bool)

(declare-fun tp_is_empty!32947 () Bool)

(assert (=> b!1272650 (= e!725784 tp_is_empty!32947)))

(declare-fun mapIsEmpty!51001 () Bool)

(declare-fun mapRes!51001 () Bool)

(assert (=> mapIsEmpty!51001 mapRes!51001))

(declare-fun b!1272651 () Bool)

(declare-fun e!725783 () Bool)

(assert (=> b!1272651 (= e!725783 false)))

(declare-fun lt!575341 () Bool)

(declare-datatypes ((array!83171 0))(
  ( (array!83172 (arr!40118 (Array (_ BitVec 32) (_ BitVec 64))) (size!40655 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83171)

(declare-datatypes ((List!28551 0))(
  ( (Nil!28548) (Cons!28547 (h!29765 (_ BitVec 64)) (t!42072 List!28551)) )
))
(declare-fun arrayNoDuplicates!0 (array!83171 (_ BitVec 32) List!28551) Bool)

(assert (=> b!1272651 (= lt!575341 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28548))))

(declare-fun b!1272652 () Bool)

(declare-fun e!725781 () Bool)

(assert (=> b!1272652 (= e!725781 tp_is_empty!32947)))

(declare-fun res!846387 () Bool)

(assert (=> start!107482 (=> (not res!846387) (not e!725783))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107482 (= res!846387 (validMask!0 mask!1730))))

(assert (=> start!107482 e!725783))

(declare-datatypes ((V!49123 0))(
  ( (V!49124 (val!16548 Int)) )
))
(declare-datatypes ((ValueCell!15620 0))(
  ( (ValueCellFull!15620 (v!19180 V!49123)) (EmptyCell!15620) )
))
(declare-datatypes ((array!83173 0))(
  ( (array!83174 (arr!40119 (Array (_ BitVec 32) ValueCell!15620)) (size!40656 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83173)

(declare-fun e!725785 () Bool)

(declare-fun array_inv!30679 (array!83173) Bool)

(assert (=> start!107482 (and (array_inv!30679 _values!1134) e!725785)))

(assert (=> start!107482 true))

(declare-fun array_inv!30680 (array!83171) Bool)

(assert (=> start!107482 (array_inv!30680 _keys!1364)))

(declare-fun b!1272653 () Bool)

(declare-fun res!846385 () Bool)

(assert (=> b!1272653 (=> (not res!846385) (not e!725783))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83171 (_ BitVec 32)) Bool)

(assert (=> b!1272653 (= res!846385 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1272654 () Bool)

(assert (=> b!1272654 (= e!725785 (and e!725784 mapRes!51001))))

(declare-fun condMapEmpty!51001 () Bool)

(declare-fun mapDefault!51001 () ValueCell!15620)

(assert (=> b!1272654 (= condMapEmpty!51001 (= (arr!40119 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15620)) mapDefault!51001)))))

(declare-fun mapNonEmpty!51001 () Bool)

(declare-fun tp!97342 () Bool)

(assert (=> mapNonEmpty!51001 (= mapRes!51001 (and tp!97342 e!725781))))

(declare-fun mapRest!51001 () (Array (_ BitVec 32) ValueCell!15620))

(declare-fun mapKey!51001 () (_ BitVec 32))

(declare-fun mapValue!51001 () ValueCell!15620)

(assert (=> mapNonEmpty!51001 (= (arr!40119 _values!1134) (store mapRest!51001 mapKey!51001 mapValue!51001))))

(declare-fun b!1272655 () Bool)

(declare-fun res!846386 () Bool)

(assert (=> b!1272655 (=> (not res!846386) (not e!725783))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1272655 (= res!846386 (and (= (size!40656 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40655 _keys!1364) (size!40656 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(assert (= (and start!107482 res!846387) b!1272655))

(assert (= (and b!1272655 res!846386) b!1272653))

(assert (= (and b!1272653 res!846385) b!1272651))

(assert (= (and b!1272654 condMapEmpty!51001) mapIsEmpty!51001))

(assert (= (and b!1272654 (not condMapEmpty!51001)) mapNonEmpty!51001))

(get-info :version)

(assert (= (and mapNonEmpty!51001 ((_ is ValueCellFull!15620) mapValue!51001)) b!1272652))

(assert (= (and b!1272654 ((_ is ValueCellFull!15620) mapDefault!51001)) b!1272650))

(assert (= start!107482 b!1272654))

(declare-fun m!1170939 () Bool)

(assert (=> b!1272651 m!1170939))

(declare-fun m!1170941 () Bool)

(assert (=> start!107482 m!1170941))

(declare-fun m!1170943 () Bool)

(assert (=> start!107482 m!1170943))

(declare-fun m!1170945 () Bool)

(assert (=> start!107482 m!1170945))

(declare-fun m!1170947 () Bool)

(assert (=> b!1272653 m!1170947))

(declare-fun m!1170949 () Bool)

(assert (=> mapNonEmpty!51001 m!1170949))

(check-sat (not b!1272651) (not start!107482) (not mapNonEmpty!51001) tp_is_empty!32947 (not b!1272653))
(check-sat)
