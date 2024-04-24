; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77612 () Bool)

(assert start!77612)

(declare-fun b!903481 () Bool)

(declare-fun e!506096 () Bool)

(declare-fun tp_is_empty!18457 () Bool)

(assert (=> b!903481 (= e!506096 tp_is_empty!18457)))

(declare-fun b!903482 () Bool)

(declare-fun res!609430 () Bool)

(declare-fun e!506097 () Bool)

(assert (=> b!903482 (=> (not res!609430) (not e!506097))))

(declare-datatypes ((array!53013 0))(
  ( (array!53014 (arr!25462 (Array (_ BitVec 32) (_ BitVec 64))) (size!25922 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53013)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53013 (_ BitVec 32)) Bool)

(assert (=> b!903482 (= res!609430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun res!609429 () Bool)

(assert (=> start!77612 (=> (not res!609429) (not e!506097))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77612 (= res!609429 (validMask!0 mask!1756))))

(assert (=> start!77612 e!506097))

(assert (=> start!77612 true))

(declare-datatypes ((V!29575 0))(
  ( (V!29576 (val!9279 Int)) )
))
(declare-datatypes ((ValueCell!8747 0))(
  ( (ValueCellFull!8747 (v!11781 V!29575)) (EmptyCell!8747) )
))
(declare-datatypes ((array!53015 0))(
  ( (array!53016 (arr!25463 (Array (_ BitVec 32) ValueCell!8747)) (size!25923 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53015)

(declare-fun e!506099 () Bool)

(declare-fun array_inv!20026 (array!53015) Bool)

(assert (=> start!77612 (and (array_inv!20026 _values!1152) e!506099)))

(declare-fun array_inv!20027 (array!53013) Bool)

(assert (=> start!77612 (array_inv!20027 _keys!1386)))

(declare-fun b!903483 () Bool)

(assert (=> b!903483 (= e!506097 false)))

(declare-fun lt!408241 () Bool)

(declare-datatypes ((List!17843 0))(
  ( (Nil!17840) (Cons!17839 (h!18991 (_ BitVec 64)) (t!25218 List!17843)) )
))
(declare-fun arrayNoDuplicates!0 (array!53013 (_ BitVec 32) List!17843) Bool)

(assert (=> b!903483 (= lt!408241 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17840))))

(declare-fun b!903484 () Bool)

(declare-fun e!506100 () Bool)

(declare-fun mapRes!29395 () Bool)

(assert (=> b!903484 (= e!506099 (and e!506100 mapRes!29395))))

(declare-fun condMapEmpty!29395 () Bool)

(declare-fun mapDefault!29395 () ValueCell!8747)

(assert (=> b!903484 (= condMapEmpty!29395 (= (arr!25463 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8747)) mapDefault!29395)))))

(declare-fun mapNonEmpty!29395 () Bool)

(declare-fun tp!56455 () Bool)

(assert (=> mapNonEmpty!29395 (= mapRes!29395 (and tp!56455 e!506096))))

(declare-fun mapRest!29395 () (Array (_ BitVec 32) ValueCell!8747))

(declare-fun mapKey!29395 () (_ BitVec 32))

(declare-fun mapValue!29395 () ValueCell!8747)

(assert (=> mapNonEmpty!29395 (= (arr!25463 _values!1152) (store mapRest!29395 mapKey!29395 mapValue!29395))))

(declare-fun b!903485 () Bool)

(assert (=> b!903485 (= e!506100 tp_is_empty!18457)))

(declare-fun b!903486 () Bool)

(declare-fun res!609428 () Bool)

(assert (=> b!903486 (=> (not res!609428) (not e!506097))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!903486 (= res!609428 (and (= (size!25923 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25922 _keys!1386) (size!25923 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!29395 () Bool)

(assert (=> mapIsEmpty!29395 mapRes!29395))

(assert (= (and start!77612 res!609429) b!903486))

(assert (= (and b!903486 res!609428) b!903482))

(assert (= (and b!903482 res!609430) b!903483))

(assert (= (and b!903484 condMapEmpty!29395) mapIsEmpty!29395))

(assert (= (and b!903484 (not condMapEmpty!29395)) mapNonEmpty!29395))

(get-info :version)

(assert (= (and mapNonEmpty!29395 ((_ is ValueCellFull!8747) mapValue!29395)) b!903481))

(assert (= (and b!903484 ((_ is ValueCellFull!8747) mapDefault!29395)) b!903485))

(assert (= start!77612 b!903484))

(declare-fun m!839825 () Bool)

(assert (=> b!903482 m!839825))

(declare-fun m!839827 () Bool)

(assert (=> start!77612 m!839827))

(declare-fun m!839829 () Bool)

(assert (=> start!77612 m!839829))

(declare-fun m!839831 () Bool)

(assert (=> start!77612 m!839831))

(declare-fun m!839833 () Bool)

(assert (=> b!903483 m!839833))

(declare-fun m!839835 () Bool)

(assert (=> mapNonEmpty!29395 m!839835))

(check-sat (not b!903482) (not mapNonEmpty!29395) (not start!77612) (not b!903483) tp_is_empty!18457)
(check-sat)
