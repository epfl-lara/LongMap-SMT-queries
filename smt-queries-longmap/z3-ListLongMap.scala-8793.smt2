; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107206 () Bool)

(assert start!107206)

(declare-fun mapNonEmpty!50587 () Bool)

(declare-fun mapRes!50587 () Bool)

(declare-fun tp!96766 () Bool)

(declare-fun e!723715 () Bool)

(assert (=> mapNonEmpty!50587 (= mapRes!50587 (and tp!96766 e!723715))))

(declare-datatypes ((V!48755 0))(
  ( (V!48756 (val!16410 Int)) )
))
(declare-datatypes ((ValueCell!15482 0))(
  ( (ValueCellFull!15482 (v!19042 V!48755)) (EmptyCell!15482) )
))
(declare-datatypes ((array!82659 0))(
  ( (array!82660 (arr!39862 (Array (_ BitVec 32) ValueCell!15482)) (size!40399 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82659)

(declare-fun mapRest!50587 () (Array (_ BitVec 32) ValueCell!15482))

(declare-fun mapValue!50587 () ValueCell!15482)

(declare-fun mapKey!50587 () (_ BitVec 32))

(assert (=> mapNonEmpty!50587 (= (arr!39862 _values!1134) (store mapRest!50587 mapKey!50587 mapValue!50587))))

(declare-fun b!1269842 () Bool)

(declare-fun res!844821 () Bool)

(declare-fun e!723712 () Bool)

(assert (=> b!1269842 (=> (not res!844821) (not e!723712))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82661 0))(
  ( (array!82662 (arr!39863 (Array (_ BitVec 32) (_ BitVec 64))) (size!40400 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82661)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1269842 (= res!844821 (and (= (size!40399 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40400 _keys!1364) (size!40399 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1269843 () Bool)

(declare-fun tp_is_empty!32671 () Bool)

(assert (=> b!1269843 (= e!723715 tp_is_empty!32671)))

(declare-fun b!1269844 () Bool)

(declare-fun res!844820 () Bool)

(assert (=> b!1269844 (=> (not res!844820) (not e!723712))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82661 (_ BitVec 32)) Bool)

(assert (=> b!1269844 (= res!844820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1269845 () Bool)

(assert (=> b!1269845 (= e!723712 false)))

(declare-fun lt!574927 () Bool)

(declare-datatypes ((List!28420 0))(
  ( (Nil!28417) (Cons!28416 (h!29634 (_ BitVec 64)) (t!41941 List!28420)) )
))
(declare-fun arrayNoDuplicates!0 (array!82661 (_ BitVec 32) List!28420) Bool)

(assert (=> b!1269845 (= lt!574927 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28417))))

(declare-fun b!1269846 () Bool)

(declare-fun e!723711 () Bool)

(declare-fun e!723714 () Bool)

(assert (=> b!1269846 (= e!723711 (and e!723714 mapRes!50587))))

(declare-fun condMapEmpty!50587 () Bool)

(declare-fun mapDefault!50587 () ValueCell!15482)

(assert (=> b!1269846 (= condMapEmpty!50587 (= (arr!39862 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15482)) mapDefault!50587)))))

(declare-fun b!1269847 () Bool)

(assert (=> b!1269847 (= e!723714 tp_is_empty!32671)))

(declare-fun mapIsEmpty!50587 () Bool)

(assert (=> mapIsEmpty!50587 mapRes!50587))

(declare-fun res!844819 () Bool)

(assert (=> start!107206 (=> (not res!844819) (not e!723712))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107206 (= res!844819 (validMask!0 mask!1730))))

(assert (=> start!107206 e!723712))

(declare-fun array_inv!30501 (array!82659) Bool)

(assert (=> start!107206 (and (array_inv!30501 _values!1134) e!723711)))

(assert (=> start!107206 true))

(declare-fun array_inv!30502 (array!82661) Bool)

(assert (=> start!107206 (array_inv!30502 _keys!1364)))

(assert (= (and start!107206 res!844819) b!1269842))

(assert (= (and b!1269842 res!844821) b!1269844))

(assert (= (and b!1269844 res!844820) b!1269845))

(assert (= (and b!1269846 condMapEmpty!50587) mapIsEmpty!50587))

(assert (= (and b!1269846 (not condMapEmpty!50587)) mapNonEmpty!50587))

(get-info :version)

(assert (= (and mapNonEmpty!50587 ((_ is ValueCellFull!15482) mapValue!50587)) b!1269843))

(assert (= (and b!1269846 ((_ is ValueCellFull!15482) mapDefault!50587)) b!1269847))

(assert (= start!107206 b!1269846))

(declare-fun m!1168959 () Bool)

(assert (=> mapNonEmpty!50587 m!1168959))

(declare-fun m!1168961 () Bool)

(assert (=> b!1269844 m!1168961))

(declare-fun m!1168963 () Bool)

(assert (=> b!1269845 m!1168963))

(declare-fun m!1168965 () Bool)

(assert (=> start!107206 m!1168965))

(declare-fun m!1168967 () Bool)

(assert (=> start!107206 m!1168967))

(declare-fun m!1168969 () Bool)

(assert (=> start!107206 m!1168969))

(check-sat (not mapNonEmpty!50587) tp_is_empty!32671 (not b!1269845) (not b!1269844) (not start!107206))
(check-sat)
