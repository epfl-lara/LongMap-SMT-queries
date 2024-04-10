; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107266 () Bool)

(assert start!107266)

(declare-fun b!1271417 () Bool)

(declare-fun res!845901 () Bool)

(declare-fun e!724997 () Bool)

(assert (=> b!1271417 (=> (not res!845901) (not e!724997))))

(declare-datatypes ((V!49133 0))(
  ( (V!49134 (val!16552 Int)) )
))
(declare-datatypes ((ValueCell!15624 0))(
  ( (ValueCellFull!15624 (v!19189 V!49133)) (EmptyCell!15624) )
))
(declare-datatypes ((array!83160 0))(
  ( (array!83161 (arr!40117 (Array (_ BitVec 32) ValueCell!15624)) (size!40653 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83160)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!83162 0))(
  ( (array!83163 (arr!40118 (Array (_ BitVec 32) (_ BitVec 64))) (size!40654 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83162)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271417 (= res!845901 (and (= (size!40653 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40654 _keys!1364) (size!40653 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1271419 () Bool)

(declare-fun e!724995 () Bool)

(declare-fun tp_is_empty!32955 () Bool)

(assert (=> b!1271419 (= e!724995 tp_is_empty!32955)))

(declare-fun b!1271420 () Bool)

(assert (=> b!1271420 (= e!724997 false)))

(declare-fun lt!574869 () Bool)

(declare-datatypes ((List!28524 0))(
  ( (Nil!28521) (Cons!28520 (h!29729 (_ BitVec 64)) (t!42053 List!28524)) )
))
(declare-fun arrayNoDuplicates!0 (array!83162 (_ BitVec 32) List!28524) Bool)

(assert (=> b!1271420 (= lt!574869 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28521))))

(declare-fun b!1271421 () Bool)

(declare-fun e!724998 () Bool)

(assert (=> b!1271421 (= e!724998 tp_is_empty!32955)))

(declare-fun mapNonEmpty!51013 () Bool)

(declare-fun mapRes!51013 () Bool)

(declare-fun tp!97354 () Bool)

(assert (=> mapNonEmpty!51013 (= mapRes!51013 (and tp!97354 e!724995))))

(declare-fun mapKey!51013 () (_ BitVec 32))

(declare-fun mapValue!51013 () ValueCell!15624)

(declare-fun mapRest!51013 () (Array (_ BitVec 32) ValueCell!15624))

(assert (=> mapNonEmpty!51013 (= (arr!40117 _values!1134) (store mapRest!51013 mapKey!51013 mapValue!51013))))

(declare-fun mapIsEmpty!51013 () Bool)

(assert (=> mapIsEmpty!51013 mapRes!51013))

(declare-fun b!1271422 () Bool)

(declare-fun e!724994 () Bool)

(assert (=> b!1271422 (= e!724994 (and e!724998 mapRes!51013))))

(declare-fun condMapEmpty!51013 () Bool)

(declare-fun mapDefault!51013 () ValueCell!15624)

(assert (=> b!1271422 (= condMapEmpty!51013 (= (arr!40117 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15624)) mapDefault!51013)))))

(declare-fun b!1271418 () Bool)

(declare-fun res!845902 () Bool)

(assert (=> b!1271418 (=> (not res!845902) (not e!724997))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83162 (_ BitVec 32)) Bool)

(assert (=> b!1271418 (= res!845902 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun res!845903 () Bool)

(assert (=> start!107266 (=> (not res!845903) (not e!724997))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107266 (= res!845903 (validMask!0 mask!1730))))

(assert (=> start!107266 e!724997))

(declare-fun array_inv!30513 (array!83160) Bool)

(assert (=> start!107266 (and (array_inv!30513 _values!1134) e!724994)))

(assert (=> start!107266 true))

(declare-fun array_inv!30514 (array!83162) Bool)

(assert (=> start!107266 (array_inv!30514 _keys!1364)))

(assert (= (and start!107266 res!845903) b!1271417))

(assert (= (and b!1271417 res!845901) b!1271418))

(assert (= (and b!1271418 res!845902) b!1271420))

(assert (= (and b!1271422 condMapEmpty!51013) mapIsEmpty!51013))

(assert (= (and b!1271422 (not condMapEmpty!51013)) mapNonEmpty!51013))

(get-info :version)

(assert (= (and mapNonEmpty!51013 ((_ is ValueCellFull!15624) mapValue!51013)) b!1271419))

(assert (= (and b!1271422 ((_ is ValueCellFull!15624) mapDefault!51013)) b!1271421))

(assert (= start!107266 b!1271422))

(declare-fun m!1169375 () Bool)

(assert (=> b!1271420 m!1169375))

(declare-fun m!1169377 () Bool)

(assert (=> mapNonEmpty!51013 m!1169377))

(declare-fun m!1169379 () Bool)

(assert (=> b!1271418 m!1169379))

(declare-fun m!1169381 () Bool)

(assert (=> start!107266 m!1169381))

(declare-fun m!1169383 () Bool)

(assert (=> start!107266 m!1169383))

(declare-fun m!1169385 () Bool)

(assert (=> start!107266 m!1169385))

(check-sat (not b!1271418) (not mapNonEmpty!51013) tp_is_empty!32955 (not b!1271420) (not start!107266))
(check-sat)
