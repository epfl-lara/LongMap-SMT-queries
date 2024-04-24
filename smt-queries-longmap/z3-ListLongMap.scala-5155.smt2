; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70060 () Bool)

(assert start!70060)

(declare-fun b!813504 () Bool)

(declare-fun res!555610 () Bool)

(declare-fun e!450714 () Bool)

(assert (=> b!813504 (=> (not res!555610) (not e!450714))))

(declare-datatypes ((array!44317 0))(
  ( (array!44318 (arr!21216 (Array (_ BitVec 32) (_ BitVec 64))) (size!21636 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44317)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!23731 0))(
  ( (V!23732 (val!7071 Int)) )
))
(declare-datatypes ((ValueCell!6608 0))(
  ( (ValueCellFull!6608 (v!9498 V!23731)) (EmptyCell!6608) )
))
(declare-datatypes ((array!44319 0))(
  ( (array!44320 (arr!21217 (Array (_ BitVec 32) ValueCell!6608)) (size!21637 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44319)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!813504 (= res!555610 (and (= (size!21637 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21636 _keys!976) (size!21637 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!813505 () Bool)

(declare-fun res!555609 () Bool)

(assert (=> b!813505 (=> (not res!555609) (not e!450714))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44317 (_ BitVec 32)) Bool)

(assert (=> b!813505 (= res!555609 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!22645 () Bool)

(declare-fun mapRes!22645 () Bool)

(declare-fun tp!43753 () Bool)

(declare-fun e!450715 () Bool)

(assert (=> mapNonEmpty!22645 (= mapRes!22645 (and tp!43753 e!450715))))

(declare-fun mapKey!22645 () (_ BitVec 32))

(declare-fun mapRest!22645 () (Array (_ BitVec 32) ValueCell!6608))

(declare-fun mapValue!22645 () ValueCell!6608)

(assert (=> mapNonEmpty!22645 (= (arr!21217 _values!788) (store mapRest!22645 mapKey!22645 mapValue!22645))))

(declare-fun b!813506 () Bool)

(declare-fun e!450712 () Bool)

(declare-fun e!450713 () Bool)

(assert (=> b!813506 (= e!450712 (and e!450713 mapRes!22645))))

(declare-fun condMapEmpty!22645 () Bool)

(declare-fun mapDefault!22645 () ValueCell!6608)

(assert (=> b!813506 (= condMapEmpty!22645 (= (arr!21217 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6608)) mapDefault!22645)))))

(declare-fun b!813507 () Bool)

(declare-fun tp_is_empty!14047 () Bool)

(assert (=> b!813507 (= e!450713 tp_is_empty!14047)))

(declare-fun b!813508 () Bool)

(assert (=> b!813508 (= e!450714 false)))

(declare-fun lt!364521 () Bool)

(declare-datatypes ((List!15004 0))(
  ( (Nil!15001) (Cons!15000 (h!16135 (_ BitVec 64)) (t!21311 List!15004)) )
))
(declare-fun arrayNoDuplicates!0 (array!44317 (_ BitVec 32) List!15004) Bool)

(assert (=> b!813508 (= lt!364521 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15001))))

(declare-fun b!813509 () Bool)

(assert (=> b!813509 (= e!450715 tp_is_empty!14047)))

(declare-fun mapIsEmpty!22645 () Bool)

(assert (=> mapIsEmpty!22645 mapRes!22645))

(declare-fun res!555608 () Bool)

(assert (=> start!70060 (=> (not res!555608) (not e!450714))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70060 (= res!555608 (validMask!0 mask!1312))))

(assert (=> start!70060 e!450714))

(declare-fun array_inv!17053 (array!44317) Bool)

(assert (=> start!70060 (array_inv!17053 _keys!976)))

(assert (=> start!70060 true))

(declare-fun array_inv!17054 (array!44319) Bool)

(assert (=> start!70060 (and (array_inv!17054 _values!788) e!450712)))

(assert (= (and start!70060 res!555608) b!813504))

(assert (= (and b!813504 res!555610) b!813505))

(assert (= (and b!813505 res!555609) b!813508))

(assert (= (and b!813506 condMapEmpty!22645) mapIsEmpty!22645))

(assert (= (and b!813506 (not condMapEmpty!22645)) mapNonEmpty!22645))

(get-info :version)

(assert (= (and mapNonEmpty!22645 ((_ is ValueCellFull!6608) mapValue!22645)) b!813509))

(assert (= (and b!813506 ((_ is ValueCellFull!6608) mapDefault!22645)) b!813507))

(assert (= start!70060 b!813506))

(declare-fun m!756223 () Bool)

(assert (=> b!813505 m!756223))

(declare-fun m!756225 () Bool)

(assert (=> mapNonEmpty!22645 m!756225))

(declare-fun m!756227 () Bool)

(assert (=> b!813508 m!756227))

(declare-fun m!756229 () Bool)

(assert (=> start!70060 m!756229))

(declare-fun m!756231 () Bool)

(assert (=> start!70060 m!756231))

(declare-fun m!756233 () Bool)

(assert (=> start!70060 m!756233))

(check-sat (not start!70060) tp_is_empty!14047 (not mapNonEmpty!22645) (not b!813508) (not b!813505))
(check-sat)
