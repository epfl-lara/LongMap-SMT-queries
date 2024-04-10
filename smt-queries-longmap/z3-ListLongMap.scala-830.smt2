; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20078 () Bool)

(assert start!20078)

(declare-fun b!196608 () Bool)

(declare-fun e!129507 () Bool)

(declare-fun tp_is_empty!4593 () Bool)

(assert (=> b!196608 (= e!129507 tp_is_empty!4593)))

(declare-fun b!196609 () Bool)

(declare-fun res!92808 () Bool)

(declare-fun e!129506 () Bool)

(assert (=> b!196609 (=> (not res!92808) (not e!129506))))

(declare-datatypes ((array!8443 0))(
  ( (array!8444 (arr!3972 (Array (_ BitVec 32) (_ BitVec 64))) (size!4297 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8443)

(declare-datatypes ((List!2480 0))(
  ( (Nil!2477) (Cons!2476 (h!3118 (_ BitVec 64)) (t!7411 List!2480)) )
))
(declare-fun arrayNoDuplicates!0 (array!8443 (_ BitVec 32) List!2480) Bool)

(assert (=> b!196609 (= res!92808 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2477))))

(declare-fun b!196610 () Bool)

(declare-fun res!92809 () Bool)

(assert (=> b!196610 (=> (not res!92809) (not e!129506))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!196610 (= res!92809 (validKeyInArray!0 k0!843))))

(declare-fun b!196611 () Bool)

(declare-fun res!92811 () Bool)

(assert (=> b!196611 (=> (not res!92811) (not e!129506))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8443 (_ BitVec 32)) Bool)

(assert (=> b!196611 (= res!92811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!196612 () Bool)

(declare-fun res!92807 () Bool)

(assert (=> b!196612 (=> (not res!92807) (not e!129506))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!5771 0))(
  ( (V!5772 (val!2341 Int)) )
))
(declare-datatypes ((ValueCell!1953 0))(
  ( (ValueCellFull!1953 (v!4311 V!5771)) (EmptyCell!1953) )
))
(declare-datatypes ((array!8445 0))(
  ( (array!8446 (arr!3973 (Array (_ BitVec 32) ValueCell!1953)) (size!4298 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8445)

(assert (=> b!196612 (= res!92807 (and (= (size!4298 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4297 _keys!825) (size!4298 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!196613 () Bool)

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!196613 (= e!129506 (and (= (select (arr!3972 _keys!825) i!601) k0!843) (bvsgt #b00000000000000000000000000000000 (size!4297 _keys!825))))))

(declare-fun res!92812 () Bool)

(assert (=> start!20078 (=> (not res!92812) (not e!129506))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20078 (= res!92812 (validMask!0 mask!1149))))

(assert (=> start!20078 e!129506))

(declare-fun array_inv!2591 (array!8443) Bool)

(assert (=> start!20078 (array_inv!2591 _keys!825)))

(assert (=> start!20078 true))

(declare-fun e!129505 () Bool)

(declare-fun array_inv!2592 (array!8445) Bool)

(assert (=> start!20078 (and (array_inv!2592 _values!649) e!129505)))

(declare-fun b!196614 () Bool)

(declare-fun e!129508 () Bool)

(declare-fun mapRes!7958 () Bool)

(assert (=> b!196614 (= e!129505 (and e!129508 mapRes!7958))))

(declare-fun condMapEmpty!7958 () Bool)

(declare-fun mapDefault!7958 () ValueCell!1953)

(assert (=> b!196614 (= condMapEmpty!7958 (= (arr!3973 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1953)) mapDefault!7958)))))

(declare-fun b!196615 () Bool)

(assert (=> b!196615 (= e!129508 tp_is_empty!4593)))

(declare-fun mapIsEmpty!7958 () Bool)

(assert (=> mapIsEmpty!7958 mapRes!7958))

(declare-fun mapNonEmpty!7958 () Bool)

(declare-fun tp!17246 () Bool)

(assert (=> mapNonEmpty!7958 (= mapRes!7958 (and tp!17246 e!129507))))

(declare-fun mapKey!7958 () (_ BitVec 32))

(declare-fun mapRest!7958 () (Array (_ BitVec 32) ValueCell!1953))

(declare-fun mapValue!7958 () ValueCell!1953)

(assert (=> mapNonEmpty!7958 (= (arr!3973 _values!649) (store mapRest!7958 mapKey!7958 mapValue!7958))))

(declare-fun b!196616 () Bool)

(declare-fun res!92810 () Bool)

(assert (=> b!196616 (=> (not res!92810) (not e!129506))))

(assert (=> b!196616 (= res!92810 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4297 _keys!825))))))

(assert (= (and start!20078 res!92812) b!196612))

(assert (= (and b!196612 res!92807) b!196611))

(assert (= (and b!196611 res!92811) b!196609))

(assert (= (and b!196609 res!92808) b!196616))

(assert (= (and b!196616 res!92810) b!196610))

(assert (= (and b!196610 res!92809) b!196613))

(assert (= (and b!196614 condMapEmpty!7958) mapIsEmpty!7958))

(assert (= (and b!196614 (not condMapEmpty!7958)) mapNonEmpty!7958))

(get-info :version)

(assert (= (and mapNonEmpty!7958 ((_ is ValueCellFull!1953) mapValue!7958)) b!196608))

(assert (= (and b!196614 ((_ is ValueCellFull!1953) mapDefault!7958)) b!196615))

(assert (= start!20078 b!196614))

(declare-fun m!223823 () Bool)

(assert (=> b!196609 m!223823))

(declare-fun m!223825 () Bool)

(assert (=> b!196611 m!223825))

(declare-fun m!223827 () Bool)

(assert (=> mapNonEmpty!7958 m!223827))

(declare-fun m!223829 () Bool)

(assert (=> b!196610 m!223829))

(declare-fun m!223831 () Bool)

(assert (=> b!196613 m!223831))

(declare-fun m!223833 () Bool)

(assert (=> start!20078 m!223833))

(declare-fun m!223835 () Bool)

(assert (=> start!20078 m!223835))

(declare-fun m!223837 () Bool)

(assert (=> start!20078 m!223837))

(check-sat (not b!196609) (not b!196610) tp_is_empty!4593 (not start!20078) (not b!196611) (not mapNonEmpty!7958))
(check-sat)
