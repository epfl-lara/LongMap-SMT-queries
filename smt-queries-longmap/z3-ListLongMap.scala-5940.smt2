; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77438 () Bool)

(assert start!77438)

(declare-fun b!902447 () Bool)

(declare-fun e!505458 () Bool)

(declare-fun tp_is_empty!18469 () Bool)

(assert (=> b!902447 (= e!505458 tp_is_empty!18469)))

(declare-fun mapNonEmpty!29413 () Bool)

(declare-fun mapRes!29413 () Bool)

(declare-fun tp!56473 () Bool)

(declare-fun e!505457 () Bool)

(assert (=> mapNonEmpty!29413 (= mapRes!29413 (and tp!56473 e!505457))))

(declare-datatypes ((V!29591 0))(
  ( (V!29592 (val!9285 Int)) )
))
(declare-datatypes ((ValueCell!8753 0))(
  ( (ValueCellFull!8753 (v!11789 V!29591)) (EmptyCell!8753) )
))
(declare-datatypes ((array!52985 0))(
  ( (array!52986 (arr!25453 (Array (_ BitVec 32) ValueCell!8753)) (size!25914 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!52985)

(declare-fun mapValue!29413 () ValueCell!8753)

(declare-fun mapKey!29413 () (_ BitVec 32))

(declare-fun mapRest!29413 () (Array (_ BitVec 32) ValueCell!8753))

(assert (=> mapNonEmpty!29413 (= (arr!25453 _values!1152) (store mapRest!29413 mapKey!29413 mapValue!29413))))

(declare-fun res!609028 () Bool)

(declare-fun e!505460 () Bool)

(assert (=> start!77438 (=> (not res!609028) (not e!505460))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77438 (= res!609028 (validMask!0 mask!1756))))

(assert (=> start!77438 e!505460))

(assert (=> start!77438 true))

(declare-fun e!505459 () Bool)

(declare-fun array_inv!20014 (array!52985) Bool)

(assert (=> start!77438 (and (array_inv!20014 _values!1152) e!505459)))

(declare-datatypes ((array!52987 0))(
  ( (array!52988 (arr!25454 (Array (_ BitVec 32) (_ BitVec 64))) (size!25915 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!52987)

(declare-fun array_inv!20015 (array!52987) Bool)

(assert (=> start!77438 (array_inv!20015 _keys!1386)))

(declare-fun mapIsEmpty!29413 () Bool)

(assert (=> mapIsEmpty!29413 mapRes!29413))

(declare-fun b!902448 () Bool)

(declare-fun res!609030 () Bool)

(assert (=> b!902448 (=> (not res!609030) (not e!505460))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!902448 (= res!609030 (and (= (size!25914 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25915 _keys!1386) (size!25914 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!902449 () Bool)

(assert (=> b!902449 (= e!505459 (and e!505458 mapRes!29413))))

(declare-fun condMapEmpty!29413 () Bool)

(declare-fun mapDefault!29413 () ValueCell!8753)

(assert (=> b!902449 (= condMapEmpty!29413 (= (arr!25453 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8753)) mapDefault!29413)))))

(declare-fun b!902450 () Bool)

(assert (=> b!902450 (= e!505457 tp_is_empty!18469)))

(declare-fun b!902451 () Bool)

(assert (=> b!902451 (= e!505460 false)))

(declare-fun lt!407662 () Bool)

(declare-datatypes ((List!17904 0))(
  ( (Nil!17901) (Cons!17900 (h!19046 (_ BitVec 64)) (t!25278 List!17904)) )
))
(declare-fun arrayNoDuplicates!0 (array!52987 (_ BitVec 32) List!17904) Bool)

(assert (=> b!902451 (= lt!407662 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17901))))

(declare-fun b!902452 () Bool)

(declare-fun res!609029 () Bool)

(assert (=> b!902452 (=> (not res!609029) (not e!505460))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52987 (_ BitVec 32)) Bool)

(assert (=> b!902452 (= res!609029 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(assert (= (and start!77438 res!609028) b!902448))

(assert (= (and b!902448 res!609030) b!902452))

(assert (= (and b!902452 res!609029) b!902451))

(assert (= (and b!902449 condMapEmpty!29413) mapIsEmpty!29413))

(assert (= (and b!902449 (not condMapEmpty!29413)) mapNonEmpty!29413))

(get-info :version)

(assert (= (and mapNonEmpty!29413 ((_ is ValueCellFull!8753) mapValue!29413)) b!902450))

(assert (= (and b!902449 ((_ is ValueCellFull!8753) mapDefault!29413)) b!902447))

(assert (= start!77438 b!902449))

(declare-fun m!837845 () Bool)

(assert (=> mapNonEmpty!29413 m!837845))

(declare-fun m!837847 () Bool)

(assert (=> start!77438 m!837847))

(declare-fun m!837849 () Bool)

(assert (=> start!77438 m!837849))

(declare-fun m!837851 () Bool)

(assert (=> start!77438 m!837851))

(declare-fun m!837853 () Bool)

(assert (=> b!902451 m!837853))

(declare-fun m!837855 () Bool)

(assert (=> b!902452 m!837855))

(check-sat (not start!77438) tp_is_empty!18469 (not b!902451) (not mapNonEmpty!29413) (not b!902452))
(check-sat)
