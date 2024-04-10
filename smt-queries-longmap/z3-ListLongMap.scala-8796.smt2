; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107002 () Bool)

(assert start!107002)

(declare-fun b!1268717 () Bool)

(declare-fun res!844390 () Bool)

(declare-fun e!723016 () Bool)

(assert (=> b!1268717 (=> (not res!844390) (not e!723016))))

(declare-datatypes ((array!82652 0))(
  ( (array!82653 (arr!39863 (Array (_ BitVec 32) (_ BitVec 64))) (size!40399 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82652)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82652 (_ BitVec 32)) Bool)

(assert (=> b!1268717 (= res!844390 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1268718 () Bool)

(declare-fun e!723018 () Bool)

(declare-fun tp_is_empty!32691 () Bool)

(assert (=> b!1268718 (= e!723018 tp_is_empty!32691)))

(declare-fun b!1268719 () Bool)

(declare-fun res!844389 () Bool)

(assert (=> b!1268719 (=> (not res!844389) (not e!723016))))

(declare-datatypes ((V!48781 0))(
  ( (V!48782 (val!16420 Int)) )
))
(declare-datatypes ((ValueCell!15492 0))(
  ( (ValueCellFull!15492 (v!19057 V!48781)) (EmptyCell!15492) )
))
(declare-datatypes ((array!82654 0))(
  ( (array!82655 (arr!39864 (Array (_ BitVec 32) ValueCell!15492)) (size!40400 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82654)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1268719 (= res!844389 (and (= (size!40400 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40399 _keys!1364) (size!40400 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun res!844391 () Bool)

(assert (=> start!107002 (=> (not res!844391) (not e!723016))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107002 (= res!844391 (validMask!0 mask!1730))))

(assert (=> start!107002 e!723016))

(declare-fun e!723017 () Bool)

(declare-fun array_inv!30331 (array!82654) Bool)

(assert (=> start!107002 (and (array_inv!30331 _values!1134) e!723017)))

(assert (=> start!107002 true))

(declare-fun array_inv!30332 (array!82652) Bool)

(assert (=> start!107002 (array_inv!30332 _keys!1364)))

(declare-fun mapIsEmpty!50617 () Bool)

(declare-fun mapRes!50617 () Bool)

(assert (=> mapIsEmpty!50617 mapRes!50617))

(declare-fun mapNonEmpty!50617 () Bool)

(declare-fun tp!96796 () Bool)

(assert (=> mapNonEmpty!50617 (= mapRes!50617 (and tp!96796 e!723018))))

(declare-fun mapKey!50617 () (_ BitVec 32))

(declare-fun mapValue!50617 () ValueCell!15492)

(declare-fun mapRest!50617 () (Array (_ BitVec 32) ValueCell!15492))

(assert (=> mapNonEmpty!50617 (= (arr!39864 _values!1134) (store mapRest!50617 mapKey!50617 mapValue!50617))))

(declare-fun b!1268720 () Bool)

(assert (=> b!1268720 (= e!723016 false)))

(declare-fun lt!574473 () Bool)

(declare-datatypes ((List!28392 0))(
  ( (Nil!28389) (Cons!28388 (h!29597 (_ BitVec 64)) (t!41921 List!28392)) )
))
(declare-fun arrayNoDuplicates!0 (array!82652 (_ BitVec 32) List!28392) Bool)

(assert (=> b!1268720 (= lt!574473 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28389))))

(declare-fun b!1268721 () Bool)

(declare-fun e!723014 () Bool)

(assert (=> b!1268721 (= e!723014 tp_is_empty!32691)))

(declare-fun b!1268722 () Bool)

(assert (=> b!1268722 (= e!723017 (and e!723014 mapRes!50617))))

(declare-fun condMapEmpty!50617 () Bool)

(declare-fun mapDefault!50617 () ValueCell!15492)

(assert (=> b!1268722 (= condMapEmpty!50617 (= (arr!39864 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15492)) mapDefault!50617)))))

(assert (= (and start!107002 res!844391) b!1268719))

(assert (= (and b!1268719 res!844389) b!1268717))

(assert (= (and b!1268717 res!844390) b!1268720))

(assert (= (and b!1268722 condMapEmpty!50617) mapIsEmpty!50617))

(assert (= (and b!1268722 (not condMapEmpty!50617)) mapNonEmpty!50617))

(get-info :version)

(assert (= (and mapNonEmpty!50617 ((_ is ValueCellFull!15492) mapValue!50617)) b!1268718))

(assert (= (and b!1268722 ((_ is ValueCellFull!15492) mapDefault!50617)) b!1268721))

(assert (= start!107002 b!1268722))

(declare-fun m!1167467 () Bool)

(assert (=> b!1268717 m!1167467))

(declare-fun m!1167469 () Bool)

(assert (=> start!107002 m!1167469))

(declare-fun m!1167471 () Bool)

(assert (=> start!107002 m!1167471))

(declare-fun m!1167473 () Bool)

(assert (=> start!107002 m!1167473))

(declare-fun m!1167475 () Bool)

(assert (=> mapNonEmpty!50617 m!1167475))

(declare-fun m!1167477 () Bool)

(assert (=> b!1268720 m!1167477))

(check-sat tp_is_empty!32691 (not b!1268717) (not mapNonEmpty!50617) (not start!107002) (not b!1268720))
(check-sat)
