; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77630 () Bool)

(assert start!77630)

(declare-fun b!903643 () Bool)

(declare-fun res!609509 () Bool)

(declare-fun e!506232 () Bool)

(assert (=> b!903643 (=> (not res!609509) (not e!506232))))

(declare-datatypes ((array!53047 0))(
  ( (array!53048 (arr!25479 (Array (_ BitVec 32) (_ BitVec 64))) (size!25939 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53047)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53047 (_ BitVec 32)) Bool)

(assert (=> b!903643 (= res!609509 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!903644 () Bool)

(declare-fun e!506235 () Bool)

(declare-fun tp_is_empty!18475 () Bool)

(assert (=> b!903644 (= e!506235 tp_is_empty!18475)))

(declare-fun b!903645 () Bool)

(declare-fun res!609511 () Bool)

(assert (=> b!903645 (=> (not res!609511) (not e!506232))))

(declare-datatypes ((V!29599 0))(
  ( (V!29600 (val!9288 Int)) )
))
(declare-datatypes ((ValueCell!8756 0))(
  ( (ValueCellFull!8756 (v!11790 V!29599)) (EmptyCell!8756) )
))
(declare-datatypes ((array!53049 0))(
  ( (array!53050 (arr!25480 (Array (_ BitVec 32) ValueCell!8756)) (size!25940 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53049)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!903645 (= res!609511 (and (= (size!25940 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25939 _keys!1386) (size!25940 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!903646 () Bool)

(declare-fun e!506234 () Bool)

(declare-fun e!506233 () Bool)

(declare-fun mapRes!29422 () Bool)

(assert (=> b!903646 (= e!506234 (and e!506233 mapRes!29422))))

(declare-fun condMapEmpty!29422 () Bool)

(declare-fun mapDefault!29422 () ValueCell!8756)

(assert (=> b!903646 (= condMapEmpty!29422 (= (arr!25480 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8756)) mapDefault!29422)))))

(declare-fun b!903647 () Bool)

(assert (=> b!903647 (= e!506233 tp_is_empty!18475)))

(declare-fun mapNonEmpty!29422 () Bool)

(declare-fun tp!56482 () Bool)

(assert (=> mapNonEmpty!29422 (= mapRes!29422 (and tp!56482 e!506235))))

(declare-fun mapKey!29422 () (_ BitVec 32))

(declare-fun mapRest!29422 () (Array (_ BitVec 32) ValueCell!8756))

(declare-fun mapValue!29422 () ValueCell!8756)

(assert (=> mapNonEmpty!29422 (= (arr!25480 _values!1152) (store mapRest!29422 mapKey!29422 mapValue!29422))))

(declare-fun b!903648 () Bool)

(assert (=> b!903648 (= e!506232 false)))

(declare-fun lt!408268 () Bool)

(declare-datatypes ((List!17850 0))(
  ( (Nil!17847) (Cons!17846 (h!18998 (_ BitVec 64)) (t!25225 List!17850)) )
))
(declare-fun arrayNoDuplicates!0 (array!53047 (_ BitVec 32) List!17850) Bool)

(assert (=> b!903648 (= lt!408268 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17847))))

(declare-fun mapIsEmpty!29422 () Bool)

(assert (=> mapIsEmpty!29422 mapRes!29422))

(declare-fun res!609510 () Bool)

(assert (=> start!77630 (=> (not res!609510) (not e!506232))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77630 (= res!609510 (validMask!0 mask!1756))))

(assert (=> start!77630 e!506232))

(assert (=> start!77630 true))

(declare-fun array_inv!20036 (array!53049) Bool)

(assert (=> start!77630 (and (array_inv!20036 _values!1152) e!506234)))

(declare-fun array_inv!20037 (array!53047) Bool)

(assert (=> start!77630 (array_inv!20037 _keys!1386)))

(assert (= (and start!77630 res!609510) b!903645))

(assert (= (and b!903645 res!609511) b!903643))

(assert (= (and b!903643 res!609509) b!903648))

(assert (= (and b!903646 condMapEmpty!29422) mapIsEmpty!29422))

(assert (= (and b!903646 (not condMapEmpty!29422)) mapNonEmpty!29422))

(get-info :version)

(assert (= (and mapNonEmpty!29422 ((_ is ValueCellFull!8756) mapValue!29422)) b!903644))

(assert (= (and b!903646 ((_ is ValueCellFull!8756) mapDefault!29422)) b!903647))

(assert (= start!77630 b!903646))

(declare-fun m!839933 () Bool)

(assert (=> b!903643 m!839933))

(declare-fun m!839935 () Bool)

(assert (=> mapNonEmpty!29422 m!839935))

(declare-fun m!839937 () Bool)

(assert (=> b!903648 m!839937))

(declare-fun m!839939 () Bool)

(assert (=> start!77630 m!839939))

(declare-fun m!839941 () Bool)

(assert (=> start!77630 m!839941))

(declare-fun m!839943 () Bool)

(assert (=> start!77630 m!839943))

(check-sat (not mapNonEmpty!29422) (not b!903648) (not start!77630) (not b!903643) tp_is_empty!18475)
(check-sat)
