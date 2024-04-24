; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70072 () Bool)

(assert start!70072)

(declare-fun b!813612 () Bool)

(declare-fun e!450803 () Bool)

(declare-fun e!450802 () Bool)

(declare-fun mapRes!22663 () Bool)

(assert (=> b!813612 (= e!450803 (and e!450802 mapRes!22663))))

(declare-fun condMapEmpty!22663 () Bool)

(declare-datatypes ((V!23747 0))(
  ( (V!23748 (val!7077 Int)) )
))
(declare-datatypes ((ValueCell!6614 0))(
  ( (ValueCellFull!6614 (v!9504 V!23747)) (EmptyCell!6614) )
))
(declare-datatypes ((array!44339 0))(
  ( (array!44340 (arr!21227 (Array (_ BitVec 32) ValueCell!6614)) (size!21647 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44339)

(declare-fun mapDefault!22663 () ValueCell!6614)

(assert (=> b!813612 (= condMapEmpty!22663 (= (arr!21227 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6614)) mapDefault!22663)))))

(declare-fun res!555663 () Bool)

(declare-fun e!450806 () Bool)

(assert (=> start!70072 (=> (not res!555663) (not e!450806))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70072 (= res!555663 (validMask!0 mask!1312))))

(assert (=> start!70072 e!450806))

(declare-datatypes ((array!44341 0))(
  ( (array!44342 (arr!21228 (Array (_ BitVec 32) (_ BitVec 64))) (size!21648 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44341)

(declare-fun array_inv!17061 (array!44341) Bool)

(assert (=> start!70072 (array_inv!17061 _keys!976)))

(assert (=> start!70072 true))

(declare-fun array_inv!17062 (array!44339) Bool)

(assert (=> start!70072 (and (array_inv!17062 _values!788) e!450803)))

(declare-fun b!813613 () Bool)

(declare-fun res!555662 () Bool)

(assert (=> b!813613 (=> (not res!555662) (not e!450806))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44341 (_ BitVec 32)) Bool)

(assert (=> b!813613 (= res!555662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!813614 () Bool)

(declare-fun e!450804 () Bool)

(declare-fun tp_is_empty!14059 () Bool)

(assert (=> b!813614 (= e!450804 tp_is_empty!14059)))

(declare-fun mapNonEmpty!22663 () Bool)

(declare-fun tp!43771 () Bool)

(assert (=> mapNonEmpty!22663 (= mapRes!22663 (and tp!43771 e!450804))))

(declare-fun mapValue!22663 () ValueCell!6614)

(declare-fun mapRest!22663 () (Array (_ BitVec 32) ValueCell!6614))

(declare-fun mapKey!22663 () (_ BitVec 32))

(assert (=> mapNonEmpty!22663 (= (arr!21227 _values!788) (store mapRest!22663 mapKey!22663 mapValue!22663))))

(declare-fun b!813615 () Bool)

(assert (=> b!813615 (= e!450802 tp_is_empty!14059)))

(declare-fun b!813616 () Bool)

(assert (=> b!813616 (= e!450806 false)))

(declare-fun lt!364539 () Bool)

(declare-datatypes ((List!15008 0))(
  ( (Nil!15005) (Cons!15004 (h!16139 (_ BitVec 64)) (t!21315 List!15008)) )
))
(declare-fun arrayNoDuplicates!0 (array!44341 (_ BitVec 32) List!15008) Bool)

(assert (=> b!813616 (= lt!364539 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15005))))

(declare-fun b!813617 () Bool)

(declare-fun res!555664 () Bool)

(assert (=> b!813617 (=> (not res!555664) (not e!450806))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!813617 (= res!555664 (and (= (size!21647 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21648 _keys!976) (size!21647 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!22663 () Bool)

(assert (=> mapIsEmpty!22663 mapRes!22663))

(assert (= (and start!70072 res!555663) b!813617))

(assert (= (and b!813617 res!555664) b!813613))

(assert (= (and b!813613 res!555662) b!813616))

(assert (= (and b!813612 condMapEmpty!22663) mapIsEmpty!22663))

(assert (= (and b!813612 (not condMapEmpty!22663)) mapNonEmpty!22663))

(get-info :version)

(assert (= (and mapNonEmpty!22663 ((_ is ValueCellFull!6614) mapValue!22663)) b!813614))

(assert (= (and b!813612 ((_ is ValueCellFull!6614) mapDefault!22663)) b!813615))

(assert (= start!70072 b!813612))

(declare-fun m!756295 () Bool)

(assert (=> start!70072 m!756295))

(declare-fun m!756297 () Bool)

(assert (=> start!70072 m!756297))

(declare-fun m!756299 () Bool)

(assert (=> start!70072 m!756299))

(declare-fun m!756301 () Bool)

(assert (=> b!813613 m!756301))

(declare-fun m!756303 () Bool)

(assert (=> mapNonEmpty!22663 m!756303))

(declare-fun m!756305 () Bool)

(assert (=> b!813616 m!756305))

(check-sat (not b!813613) tp_is_empty!14059 (not b!813616) (not mapNonEmpty!22663) (not start!70072))
(check-sat)
