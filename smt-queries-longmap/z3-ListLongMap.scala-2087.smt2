; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35676 () Bool)

(assert start!35676)

(declare-fun mapIsEmpty!13722 () Bool)

(declare-fun mapRes!13722 () Bool)

(assert (=> mapIsEmpty!13722 mapRes!13722))

(declare-fun b!358225 () Bool)

(declare-fun e!219274 () Bool)

(assert (=> b!358225 (= e!219274 false)))

(declare-fun lt!165967 () Bool)

(declare-datatypes ((array!19835 0))(
  ( (array!19836 (arr!9411 (Array (_ BitVec 32) (_ BitVec 64))) (size!9764 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19835)

(declare-datatypes ((List!5399 0))(
  ( (Nil!5396) (Cons!5395 (h!6251 (_ BitVec 64)) (t!10540 List!5399)) )
))
(declare-fun arrayNoDuplicates!0 (array!19835 (_ BitVec 32) List!5399) Bool)

(assert (=> b!358225 (= lt!165967 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5396))))

(declare-fun b!358226 () Bool)

(declare-fun res!199132 () Bool)

(assert (=> b!358226 (=> (not res!199132) (not e!219274))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((V!11835 0))(
  ( (V!11836 (val!4116 Int)) )
))
(declare-datatypes ((ValueCell!3728 0))(
  ( (ValueCellFull!3728 (v!6304 V!11835)) (EmptyCell!3728) )
))
(declare-datatypes ((array!19837 0))(
  ( (array!19838 (arr!9412 (Array (_ BitVec 32) ValueCell!3728)) (size!9765 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19837)

(assert (=> b!358226 (= res!199132 (and (= (size!9765 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9764 _keys!1456) (size!9765 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!13722 () Bool)

(declare-fun tp!27780 () Bool)

(declare-fun e!219272 () Bool)

(assert (=> mapNonEmpty!13722 (= mapRes!13722 (and tp!27780 e!219272))))

(declare-fun mapKey!13722 () (_ BitVec 32))

(declare-fun mapValue!13722 () ValueCell!3728)

(declare-fun mapRest!13722 () (Array (_ BitVec 32) ValueCell!3728))

(assert (=> mapNonEmpty!13722 (= (arr!9412 _values!1208) (store mapRest!13722 mapKey!13722 mapValue!13722))))

(declare-fun b!358227 () Bool)

(declare-fun e!219273 () Bool)

(declare-fun tp_is_empty!8143 () Bool)

(assert (=> b!358227 (= e!219273 tp_is_empty!8143)))

(declare-fun b!358228 () Bool)

(declare-fun res!199131 () Bool)

(assert (=> b!358228 (=> (not res!199131) (not e!219274))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19835 (_ BitVec 32)) Bool)

(assert (=> b!358228 (= res!199131 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!358229 () Bool)

(assert (=> b!358229 (= e!219272 tp_is_empty!8143)))

(declare-fun b!358224 () Bool)

(declare-fun e!219276 () Bool)

(assert (=> b!358224 (= e!219276 (and e!219273 mapRes!13722))))

(declare-fun condMapEmpty!13722 () Bool)

(declare-fun mapDefault!13722 () ValueCell!3728)

(assert (=> b!358224 (= condMapEmpty!13722 (= (arr!9412 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3728)) mapDefault!13722)))))

(declare-fun res!199130 () Bool)

(assert (=> start!35676 (=> (not res!199130) (not e!219274))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35676 (= res!199130 (validMask!0 mask!1842))))

(assert (=> start!35676 e!219274))

(assert (=> start!35676 true))

(declare-fun array_inv!6944 (array!19837) Bool)

(assert (=> start!35676 (and (array_inv!6944 _values!1208) e!219276)))

(declare-fun array_inv!6945 (array!19835) Bool)

(assert (=> start!35676 (array_inv!6945 _keys!1456)))

(assert (= (and start!35676 res!199130) b!358226))

(assert (= (and b!358226 res!199132) b!358228))

(assert (= (and b!358228 res!199131) b!358225))

(assert (= (and b!358224 condMapEmpty!13722) mapIsEmpty!13722))

(assert (= (and b!358224 (not condMapEmpty!13722)) mapNonEmpty!13722))

(get-info :version)

(assert (= (and mapNonEmpty!13722 ((_ is ValueCellFull!3728) mapValue!13722)) b!358229))

(assert (= (and b!358224 ((_ is ValueCellFull!3728) mapDefault!13722)) b!358227))

(assert (= start!35676 b!358224))

(declare-fun m!355581 () Bool)

(assert (=> b!358225 m!355581))

(declare-fun m!355583 () Bool)

(assert (=> mapNonEmpty!13722 m!355583))

(declare-fun m!355585 () Bool)

(assert (=> b!358228 m!355585))

(declare-fun m!355587 () Bool)

(assert (=> start!35676 m!355587))

(declare-fun m!355589 () Bool)

(assert (=> start!35676 m!355589))

(declare-fun m!355591 () Bool)

(assert (=> start!35676 m!355591))

(check-sat (not b!358228) tp_is_empty!8143 (not mapNonEmpty!13722) (not start!35676) (not b!358225))
(check-sat)
