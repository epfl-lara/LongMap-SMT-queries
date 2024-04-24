; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39092 () Bool)

(assert start!39092)

(declare-fun b_free!9373 () Bool)

(declare-fun b_next!9373 () Bool)

(assert (=> start!39092 (= b_free!9373 (not b_next!9373))))

(declare-fun tp!33647 () Bool)

(declare-fun b_and!16773 () Bool)

(assert (=> start!39092 (= tp!33647 b_and!16773)))

(declare-fun b!410948 () Bool)

(declare-fun e!246197 () Bool)

(declare-fun e!246199 () Bool)

(assert (=> b!410948 (= e!246197 e!246199)))

(declare-fun res!238339 () Bool)

(assert (=> b!410948 (=> (not res!238339) (not e!246199))))

(declare-datatypes ((array!24914 0))(
  ( (array!24915 (arr!11906 (Array (_ BitVec 32) (_ BitVec 64))) (size!12258 (_ BitVec 32))) )
))
(declare-fun lt!189212 () array!24914)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24914 (_ BitVec 32)) Bool)

(assert (=> b!410948 (= res!238339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189212 mask!1025))))

(declare-fun _keys!709 () array!24914)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!410948 (= lt!189212 (array!24915 (store (arr!11906 _keys!709) i!563 k0!794) (size!12258 _keys!709)))))

(declare-fun b!410949 () Bool)

(declare-fun res!238335 () Bool)

(assert (=> b!410949 (=> (not res!238335) (not e!246197))))

(assert (=> b!410949 (= res!238335 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12258 _keys!709))))))

(declare-fun b!410950 () Bool)

(declare-fun res!238341 () Bool)

(assert (=> b!410950 (=> (not res!238341) (not e!246197))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15139 0))(
  ( (V!15140 (val!5307 Int)) )
))
(declare-datatypes ((ValueCell!4919 0))(
  ( (ValueCellFull!4919 (v!7555 V!15139)) (EmptyCell!4919) )
))
(declare-datatypes ((array!24916 0))(
  ( (array!24917 (arr!11907 (Array (_ BitVec 32) ValueCell!4919)) (size!12259 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24916)

(assert (=> b!410950 (= res!238341 (and (= (size!12259 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12258 _keys!709) (size!12259 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!410951 () Bool)

(declare-fun res!238334 () Bool)

(assert (=> b!410951 (=> (not res!238334) (not e!246197))))

(assert (=> b!410951 (= res!238334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!410952 () Bool)

(declare-fun res!238337 () Bool)

(assert (=> b!410952 (=> (not res!238337) (not e!246197))))

(declare-datatypes ((List!6771 0))(
  ( (Nil!6768) (Cons!6767 (h!7623 (_ BitVec 64)) (t!11937 List!6771)) )
))
(declare-fun arrayNoDuplicates!0 (array!24914 (_ BitVec 32) List!6771) Bool)

(assert (=> b!410952 (= res!238337 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6768))))

(declare-fun b!410954 () Bool)

(declare-fun e!246201 () Bool)

(declare-fun e!246200 () Bool)

(declare-fun mapRes!17409 () Bool)

(assert (=> b!410954 (= e!246201 (and e!246200 mapRes!17409))))

(declare-fun condMapEmpty!17409 () Bool)

(declare-fun mapDefault!17409 () ValueCell!4919)

(assert (=> b!410954 (= condMapEmpty!17409 (= (arr!11907 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4919)) mapDefault!17409)))))

(declare-fun b!410955 () Bool)

(declare-fun res!238340 () Bool)

(assert (=> b!410955 (=> (not res!238340) (not e!246197))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!410955 (= res!238340 (validMask!0 mask!1025))))

(declare-fun b!410956 () Bool)

(declare-fun res!238343 () Bool)

(assert (=> b!410956 (=> (not res!238343) (not e!246197))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!410956 (= res!238343 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!17409 () Bool)

(assert (=> mapIsEmpty!17409 mapRes!17409))

(declare-fun b!410957 () Bool)

(assert (=> b!410957 (= e!246199 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!15139)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!6754 0))(
  ( (tuple2!6755 (_1!3388 (_ BitVec 64)) (_2!3388 V!15139)) )
))
(declare-datatypes ((List!6772 0))(
  ( (Nil!6769) (Cons!6768 (h!7624 tuple2!6754) (t!11938 List!6772)) )
))
(declare-datatypes ((ListLongMap!5669 0))(
  ( (ListLongMap!5670 (toList!2850 List!6772)) )
))
(declare-fun lt!189213 () ListLongMap!5669)

(declare-fun zeroValue!515 () V!15139)

(declare-fun v!412 () V!15139)

(declare-fun getCurrentListMapNoExtraKeys!1102 (array!24914 array!24916 (_ BitVec 32) (_ BitVec 32) V!15139 V!15139 (_ BitVec 32) Int) ListLongMap!5669)

(assert (=> b!410957 (= lt!189213 (getCurrentListMapNoExtraKeys!1102 lt!189212 (array!24917 (store (arr!11907 _values!549) i!563 (ValueCellFull!4919 v!412)) (size!12259 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189211 () ListLongMap!5669)

(assert (=> b!410957 (= lt!189211 (getCurrentListMapNoExtraKeys!1102 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!410958 () Bool)

(declare-fun res!238344 () Bool)

(assert (=> b!410958 (=> (not res!238344) (not e!246197))))

(assert (=> b!410958 (= res!238344 (or (= (select (arr!11906 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11906 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!410959 () Bool)

(declare-fun e!246202 () Bool)

(declare-fun tp_is_empty!10525 () Bool)

(assert (=> b!410959 (= e!246202 tp_is_empty!10525)))

(declare-fun mapNonEmpty!17409 () Bool)

(declare-fun tp!33648 () Bool)

(assert (=> mapNonEmpty!17409 (= mapRes!17409 (and tp!33648 e!246202))))

(declare-fun mapValue!17409 () ValueCell!4919)

(declare-fun mapKey!17409 () (_ BitVec 32))

(declare-fun mapRest!17409 () (Array (_ BitVec 32) ValueCell!4919))

(assert (=> mapNonEmpty!17409 (= (arr!11907 _values!549) (store mapRest!17409 mapKey!17409 mapValue!17409))))

(declare-fun b!410960 () Bool)

(declare-fun res!238336 () Bool)

(assert (=> b!410960 (=> (not res!238336) (not e!246199))))

(assert (=> b!410960 (= res!238336 (bvsle from!863 i!563))))

(declare-fun res!238338 () Bool)

(assert (=> start!39092 (=> (not res!238338) (not e!246197))))

(assert (=> start!39092 (= res!238338 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12258 _keys!709))))))

(assert (=> start!39092 e!246197))

(assert (=> start!39092 tp_is_empty!10525))

(assert (=> start!39092 tp!33647))

(assert (=> start!39092 true))

(declare-fun array_inv!8764 (array!24916) Bool)

(assert (=> start!39092 (and (array_inv!8764 _values!549) e!246201)))

(declare-fun array_inv!8765 (array!24914) Bool)

(assert (=> start!39092 (array_inv!8765 _keys!709)))

(declare-fun b!410953 () Bool)

(declare-fun res!238342 () Bool)

(assert (=> b!410953 (=> (not res!238342) (not e!246199))))

(assert (=> b!410953 (= res!238342 (arrayNoDuplicates!0 lt!189212 #b00000000000000000000000000000000 Nil!6768))))

(declare-fun b!410961 () Bool)

(declare-fun res!238333 () Bool)

(assert (=> b!410961 (=> (not res!238333) (not e!246197))))

(declare-fun arrayContainsKey!0 (array!24914 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!410961 (= res!238333 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!410962 () Bool)

(assert (=> b!410962 (= e!246200 tp_is_empty!10525)))

(assert (= (and start!39092 res!238338) b!410955))

(assert (= (and b!410955 res!238340) b!410950))

(assert (= (and b!410950 res!238341) b!410951))

(assert (= (and b!410951 res!238334) b!410952))

(assert (= (and b!410952 res!238337) b!410949))

(assert (= (and b!410949 res!238335) b!410956))

(assert (= (and b!410956 res!238343) b!410958))

(assert (= (and b!410958 res!238344) b!410961))

(assert (= (and b!410961 res!238333) b!410948))

(assert (= (and b!410948 res!238339) b!410953))

(assert (= (and b!410953 res!238342) b!410960))

(assert (= (and b!410960 res!238336) b!410957))

(assert (= (and b!410954 condMapEmpty!17409) mapIsEmpty!17409))

(assert (= (and b!410954 (not condMapEmpty!17409)) mapNonEmpty!17409))

(get-info :version)

(assert (= (and mapNonEmpty!17409 ((_ is ValueCellFull!4919) mapValue!17409)) b!410959))

(assert (= (and b!410954 ((_ is ValueCellFull!4919) mapDefault!17409)) b!410962))

(assert (= start!39092 b!410954))

(declare-fun m!401523 () Bool)

(assert (=> b!410948 m!401523))

(declare-fun m!401525 () Bool)

(assert (=> b!410948 m!401525))

(declare-fun m!401527 () Bool)

(assert (=> mapNonEmpty!17409 m!401527))

(declare-fun m!401529 () Bool)

(assert (=> b!410958 m!401529))

(declare-fun m!401531 () Bool)

(assert (=> start!39092 m!401531))

(declare-fun m!401533 () Bool)

(assert (=> start!39092 m!401533))

(declare-fun m!401535 () Bool)

(assert (=> b!410956 m!401535))

(declare-fun m!401537 () Bool)

(assert (=> b!410951 m!401537))

(declare-fun m!401539 () Bool)

(assert (=> b!410953 m!401539))

(declare-fun m!401541 () Bool)

(assert (=> b!410952 m!401541))

(declare-fun m!401543 () Bool)

(assert (=> b!410957 m!401543))

(declare-fun m!401545 () Bool)

(assert (=> b!410957 m!401545))

(declare-fun m!401547 () Bool)

(assert (=> b!410957 m!401547))

(declare-fun m!401549 () Bool)

(assert (=> b!410961 m!401549))

(declare-fun m!401551 () Bool)

(assert (=> b!410955 m!401551))

(check-sat (not b!410948) (not start!39092) (not b_next!9373) tp_is_empty!10525 (not b!410961) (not mapNonEmpty!17409) (not b!410951) (not b!410957) b_and!16773 (not b!410955) (not b!410956) (not b!410952) (not b!410953))
(check-sat b_and!16773 (not b_next!9373))
