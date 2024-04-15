; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107024 () Bool)

(assert start!107024)

(declare-fun b!1268851 () Bool)

(declare-fun e!723153 () Bool)

(declare-fun tp_is_empty!32713 () Bool)

(assert (=> b!1268851 (= e!723153 tp_is_empty!32713)))

(declare-fun b!1268852 () Bool)

(declare-fun e!723152 () Bool)

(assert (=> b!1268852 (= e!723152 false)))

(declare-fun lt!574328 () Bool)

(declare-datatypes ((array!82613 0))(
  ( (array!82614 (arr!39844 (Array (_ BitVec 32) (_ BitVec 64))) (size!40382 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82613)

(declare-datatypes ((List!28485 0))(
  ( (Nil!28482) (Cons!28481 (h!29690 (_ BitVec 64)) (t!42006 List!28485)) )
))
(declare-fun arrayNoDuplicates!0 (array!82613 (_ BitVec 32) List!28485) Bool)

(assert (=> b!1268852 (= lt!574328 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28482))))

(declare-fun b!1268853 () Bool)

(declare-fun res!844463 () Bool)

(assert (=> b!1268853 (=> (not res!844463) (not e!723152))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82613 (_ BitVec 32)) Bool)

(assert (=> b!1268853 (= res!844463 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapIsEmpty!50650 () Bool)

(declare-fun mapRes!50650 () Bool)

(assert (=> mapIsEmpty!50650 mapRes!50650))

(declare-fun res!844461 () Bool)

(assert (=> start!107024 (=> (not res!844461) (not e!723152))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107024 (= res!844461 (validMask!0 mask!1730))))

(assert (=> start!107024 e!723152))

(declare-datatypes ((V!48811 0))(
  ( (V!48812 (val!16431 Int)) )
))
(declare-datatypes ((ValueCell!15503 0))(
  ( (ValueCellFull!15503 (v!19067 V!48811)) (EmptyCell!15503) )
))
(declare-datatypes ((array!82615 0))(
  ( (array!82616 (arr!39845 (Array (_ BitVec 32) ValueCell!15503)) (size!40383 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82615)

(declare-fun e!723154 () Bool)

(declare-fun array_inv!30483 (array!82615) Bool)

(assert (=> start!107024 (and (array_inv!30483 _values!1134) e!723154)))

(assert (=> start!107024 true))

(declare-fun array_inv!30484 (array!82613) Bool)

(assert (=> start!107024 (array_inv!30484 _keys!1364)))

(declare-fun b!1268854 () Bool)

(declare-fun res!844462 () Bool)

(assert (=> b!1268854 (=> (not res!844462) (not e!723152))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1268854 (= res!844462 (and (= (size!40383 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40382 _keys!1364) (size!40383 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!50650 () Bool)

(declare-fun tp!96830 () Bool)

(declare-fun e!723150 () Bool)

(assert (=> mapNonEmpty!50650 (= mapRes!50650 (and tp!96830 e!723150))))

(declare-fun mapValue!50650 () ValueCell!15503)

(declare-fun mapRest!50650 () (Array (_ BitVec 32) ValueCell!15503))

(declare-fun mapKey!50650 () (_ BitVec 32))

(assert (=> mapNonEmpty!50650 (= (arr!39845 _values!1134) (store mapRest!50650 mapKey!50650 mapValue!50650))))

(declare-fun b!1268855 () Bool)

(assert (=> b!1268855 (= e!723154 (and e!723153 mapRes!50650))))

(declare-fun condMapEmpty!50650 () Bool)

(declare-fun mapDefault!50650 () ValueCell!15503)

(assert (=> b!1268855 (= condMapEmpty!50650 (= (arr!39845 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15503)) mapDefault!50650)))))

(declare-fun b!1268856 () Bool)

(assert (=> b!1268856 (= e!723150 tp_is_empty!32713)))

(assert (= (and start!107024 res!844461) b!1268854))

(assert (= (and b!1268854 res!844462) b!1268853))

(assert (= (and b!1268853 res!844463) b!1268852))

(assert (= (and b!1268855 condMapEmpty!50650) mapIsEmpty!50650))

(assert (= (and b!1268855 (not condMapEmpty!50650)) mapNonEmpty!50650))

(get-info :version)

(assert (= (and mapNonEmpty!50650 ((_ is ValueCellFull!15503) mapValue!50650)) b!1268856))

(assert (= (and b!1268855 ((_ is ValueCellFull!15503) mapDefault!50650)) b!1268851))

(assert (= start!107024 b!1268855))

(declare-fun m!1167099 () Bool)

(assert (=> b!1268852 m!1167099))

(declare-fun m!1167101 () Bool)

(assert (=> b!1268853 m!1167101))

(declare-fun m!1167103 () Bool)

(assert (=> start!107024 m!1167103))

(declare-fun m!1167105 () Bool)

(assert (=> start!107024 m!1167105))

(declare-fun m!1167107 () Bool)

(assert (=> start!107024 m!1167107))

(declare-fun m!1167109 () Bool)

(assert (=> mapNonEmpty!50650 m!1167109))

(check-sat (not b!1268853) (not start!107024) (not mapNonEmpty!50650) tp_is_empty!32713 (not b!1268852))
(check-sat)
