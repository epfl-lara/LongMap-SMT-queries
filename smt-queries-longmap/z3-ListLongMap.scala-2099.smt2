; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35748 () Bool)

(assert start!35748)

(declare-fun mapIsEmpty!13830 () Bool)

(declare-fun mapRes!13830 () Bool)

(assert (=> mapIsEmpty!13830 mapRes!13830))

(declare-fun b!359193 () Bool)

(declare-fun e!219955 () Bool)

(declare-fun e!219958 () Bool)

(assert (=> b!359193 (= e!219955 (and e!219958 mapRes!13830))))

(declare-fun condMapEmpty!13830 () Bool)

(declare-datatypes ((V!11931 0))(
  ( (V!11932 (val!4152 Int)) )
))
(declare-datatypes ((ValueCell!3764 0))(
  ( (ValueCellFull!3764 (v!6347 V!11931)) (EmptyCell!3764) )
))
(declare-datatypes ((array!19966 0))(
  ( (array!19967 (arr!9476 (Array (_ BitVec 32) ValueCell!3764)) (size!9828 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19966)

(declare-fun mapDefault!13830 () ValueCell!3764)

(assert (=> b!359193 (= condMapEmpty!13830 (= (arr!9476 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3764)) mapDefault!13830)))))

(declare-fun b!359194 () Bool)

(declare-fun res!199679 () Bool)

(declare-fun e!219957 () Bool)

(assert (=> b!359194 (=> (not res!199679) (not e!219957))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19968 0))(
  ( (array!19969 (arr!9477 (Array (_ BitVec 32) (_ BitVec 64))) (size!9829 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19968)

(assert (=> b!359194 (= res!199679 (and (= (size!9828 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9829 _keys!1456) (size!9828 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!13830 () Bool)

(declare-fun tp!27897 () Bool)

(declare-fun e!219954 () Bool)

(assert (=> mapNonEmpty!13830 (= mapRes!13830 (and tp!27897 e!219954))))

(declare-fun mapRest!13830 () (Array (_ BitVec 32) ValueCell!3764))

(declare-fun mapKey!13830 () (_ BitVec 32))

(declare-fun mapValue!13830 () ValueCell!3764)

(assert (=> mapNonEmpty!13830 (= (arr!9476 _values!1208) (store mapRest!13830 mapKey!13830 mapValue!13830))))

(declare-fun b!359195 () Bool)

(declare-fun tp_is_empty!8215 () Bool)

(assert (=> b!359195 (= e!219958 tp_is_empty!8215)))

(declare-fun b!359196 () Bool)

(assert (=> b!359196 (= e!219957 false)))

(declare-fun lt!166328 () Bool)

(declare-datatypes ((List!5368 0))(
  ( (Nil!5365) (Cons!5364 (h!6220 (_ BitVec 64)) (t!10510 List!5368)) )
))
(declare-fun arrayNoDuplicates!0 (array!19968 (_ BitVec 32) List!5368) Bool)

(assert (=> b!359196 (= lt!166328 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5365))))

(declare-fun b!359197 () Bool)

(assert (=> b!359197 (= e!219954 tp_is_empty!8215)))

(declare-fun res!199680 () Bool)

(assert (=> start!35748 (=> (not res!199680) (not e!219957))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35748 (= res!199680 (validMask!0 mask!1842))))

(assert (=> start!35748 e!219957))

(assert (=> start!35748 true))

(declare-fun array_inv!7004 (array!19966) Bool)

(assert (=> start!35748 (and (array_inv!7004 _values!1208) e!219955)))

(declare-fun array_inv!7005 (array!19968) Bool)

(assert (=> start!35748 (array_inv!7005 _keys!1456)))

(declare-fun b!359198 () Bool)

(declare-fun res!199681 () Bool)

(assert (=> b!359198 (=> (not res!199681) (not e!219957))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19968 (_ BitVec 32)) Bool)

(assert (=> b!359198 (= res!199681 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(assert (= (and start!35748 res!199680) b!359194))

(assert (= (and b!359194 res!199679) b!359198))

(assert (= (and b!359198 res!199681) b!359196))

(assert (= (and b!359193 condMapEmpty!13830) mapIsEmpty!13830))

(assert (= (and b!359193 (not condMapEmpty!13830)) mapNonEmpty!13830))

(get-info :version)

(assert (= (and mapNonEmpty!13830 ((_ is ValueCellFull!3764) mapValue!13830)) b!359197))

(assert (= (and b!359193 ((_ is ValueCellFull!3764) mapDefault!13830)) b!359195))

(assert (= start!35748 b!359193))

(declare-fun m!357039 () Bool)

(assert (=> mapNonEmpty!13830 m!357039))

(declare-fun m!357041 () Bool)

(assert (=> b!359196 m!357041))

(declare-fun m!357043 () Bool)

(assert (=> start!35748 m!357043))

(declare-fun m!357045 () Bool)

(assert (=> start!35748 m!357045))

(declare-fun m!357047 () Bool)

(assert (=> start!35748 m!357047))

(declare-fun m!357049 () Bool)

(assert (=> b!359198 m!357049))

(check-sat tp_is_empty!8215 (not start!35748) (not mapNonEmpty!13830) (not b!359196) (not b!359198))
(check-sat)
