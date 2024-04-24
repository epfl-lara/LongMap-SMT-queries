; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77624 () Bool)

(assert start!77624)

(declare-fun mapIsEmpty!29413 () Bool)

(declare-fun mapRes!29413 () Bool)

(assert (=> mapIsEmpty!29413 mapRes!29413))

(declare-fun b!903589 () Bool)

(declare-fun e!506186 () Bool)

(assert (=> b!903589 (= e!506186 false)))

(declare-fun lt!408259 () Bool)

(declare-datatypes ((array!53037 0))(
  ( (array!53038 (arr!25474 (Array (_ BitVec 32) (_ BitVec 64))) (size!25934 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53037)

(declare-datatypes ((List!17848 0))(
  ( (Nil!17845) (Cons!17844 (h!18996 (_ BitVec 64)) (t!25223 List!17848)) )
))
(declare-fun arrayNoDuplicates!0 (array!53037 (_ BitVec 32) List!17848) Bool)

(assert (=> b!903589 (= lt!408259 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17845))))

(declare-fun mapNonEmpty!29413 () Bool)

(declare-fun tp!56473 () Bool)

(declare-fun e!506188 () Bool)

(assert (=> mapNonEmpty!29413 (= mapRes!29413 (and tp!56473 e!506188))))

(declare-datatypes ((V!29591 0))(
  ( (V!29592 (val!9285 Int)) )
))
(declare-datatypes ((ValueCell!8753 0))(
  ( (ValueCellFull!8753 (v!11787 V!29591)) (EmptyCell!8753) )
))
(declare-datatypes ((array!53039 0))(
  ( (array!53040 (arr!25475 (Array (_ BitVec 32) ValueCell!8753)) (size!25935 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53039)

(declare-fun mapRest!29413 () (Array (_ BitVec 32) ValueCell!8753))

(declare-fun mapValue!29413 () ValueCell!8753)

(declare-fun mapKey!29413 () (_ BitVec 32))

(assert (=> mapNonEmpty!29413 (= (arr!25475 _values!1152) (store mapRest!29413 mapKey!29413 mapValue!29413))))

(declare-fun b!903590 () Bool)

(declare-fun e!506190 () Bool)

(declare-fun e!506189 () Bool)

(assert (=> b!903590 (= e!506190 (and e!506189 mapRes!29413))))

(declare-fun condMapEmpty!29413 () Bool)

(declare-fun mapDefault!29413 () ValueCell!8753)

(assert (=> b!903590 (= condMapEmpty!29413 (= (arr!25475 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8753)) mapDefault!29413)))))

(declare-fun b!903591 () Bool)

(declare-fun res!609482 () Bool)

(assert (=> b!903591 (=> (not res!609482) (not e!506186))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(assert (=> b!903591 (= res!609482 (and (= (size!25935 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25934 _keys!1386) (size!25935 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!903592 () Bool)

(declare-fun tp_is_empty!18469 () Bool)

(assert (=> b!903592 (= e!506189 tp_is_empty!18469)))

(declare-fun res!609484 () Bool)

(assert (=> start!77624 (=> (not res!609484) (not e!506186))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77624 (= res!609484 (validMask!0 mask!1756))))

(assert (=> start!77624 e!506186))

(assert (=> start!77624 true))

(declare-fun array_inv!20034 (array!53039) Bool)

(assert (=> start!77624 (and (array_inv!20034 _values!1152) e!506190)))

(declare-fun array_inv!20035 (array!53037) Bool)

(assert (=> start!77624 (array_inv!20035 _keys!1386)))

(declare-fun b!903593 () Bool)

(declare-fun res!609483 () Bool)

(assert (=> b!903593 (=> (not res!609483) (not e!506186))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53037 (_ BitVec 32)) Bool)

(assert (=> b!903593 (= res!609483 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!903594 () Bool)

(assert (=> b!903594 (= e!506188 tp_is_empty!18469)))

(assert (= (and start!77624 res!609484) b!903591))

(assert (= (and b!903591 res!609482) b!903593))

(assert (= (and b!903593 res!609483) b!903589))

(assert (= (and b!903590 condMapEmpty!29413) mapIsEmpty!29413))

(assert (= (and b!903590 (not condMapEmpty!29413)) mapNonEmpty!29413))

(get-info :version)

(assert (= (and mapNonEmpty!29413 ((_ is ValueCellFull!8753) mapValue!29413)) b!903594))

(assert (= (and b!903590 ((_ is ValueCellFull!8753) mapDefault!29413)) b!903592))

(assert (= start!77624 b!903590))

(declare-fun m!839897 () Bool)

(assert (=> b!903589 m!839897))

(declare-fun m!839899 () Bool)

(assert (=> mapNonEmpty!29413 m!839899))

(declare-fun m!839901 () Bool)

(assert (=> start!77624 m!839901))

(declare-fun m!839903 () Bool)

(assert (=> start!77624 m!839903))

(declare-fun m!839905 () Bool)

(assert (=> start!77624 m!839905))

(declare-fun m!839907 () Bool)

(assert (=> b!903593 m!839907))

(check-sat (not b!903593) (not b!903589) (not mapNonEmpty!29413) tp_is_empty!18469 (not start!77624))
(check-sat)
