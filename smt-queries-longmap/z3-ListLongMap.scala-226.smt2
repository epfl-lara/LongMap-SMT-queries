; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4034 () Bool)

(assert start!4034)

(declare-fun b_free!943 () Bool)

(declare-fun b_next!943 () Bool)

(assert (=> start!4034 (= b_free!943 (not b_next!943))))

(declare-fun tp!4248 () Bool)

(declare-fun b_and!1743 () Bool)

(assert (=> start!4034 (= tp!4248 b_and!1743)))

(declare-fun mapNonEmpty!1474 () Bool)

(declare-fun mapRes!1474 () Bool)

(declare-fun tp!4249 () Bool)

(declare-fun e!19030 () Bool)

(assert (=> mapNonEmpty!1474 (= mapRes!1474 (and tp!4249 e!19030))))

(declare-datatypes ((V!1555 0))(
  ( (V!1556 (val!675 Int)) )
))
(declare-datatypes ((ValueCell!449 0))(
  ( (ValueCellFull!449 (v!1764 V!1555)) (EmptyCell!449) )
))
(declare-fun mapValue!1474 () ValueCell!449)

(declare-fun mapRest!1474 () (Array (_ BitVec 32) ValueCell!449))

(declare-datatypes ((array!1807 0))(
  ( (array!1808 (arr!857 (Array (_ BitVec 32) ValueCell!449)) (size!958 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1807)

(declare-fun mapKey!1474 () (_ BitVec 32))

(assert (=> mapNonEmpty!1474 (= (arr!857 _values!1501) (store mapRest!1474 mapKey!1474 mapValue!1474))))

(declare-fun mapIsEmpty!1474 () Bool)

(assert (=> mapIsEmpty!1474 mapRes!1474))

(declare-fun b!29496 () Bool)

(declare-fun e!19029 () Bool)

(declare-fun tp_is_empty!1297 () Bool)

(assert (=> b!29496 (= e!19029 tp_is_empty!1297)))

(declare-fun b!29497 () Bool)

(declare-fun res!17705 () Bool)

(declare-fun e!19031 () Bool)

(assert (=> b!29497 (=> (not res!17705) (not e!19031))))

(declare-datatypes ((array!1809 0))(
  ( (array!1810 (arr!858 (Array (_ BitVec 32) (_ BitVec 64))) (size!959 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1809)

(declare-datatypes ((List!708 0))(
  ( (Nil!705) (Cons!704 (h!1271 (_ BitVec 64)) (t!3395 List!708)) )
))
(declare-fun arrayNoDuplicates!0 (array!1809 (_ BitVec 32) List!708) Bool)

(assert (=> b!29497 (= res!17705 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!705))))

(declare-fun b!29498 () Bool)

(declare-fun res!17704 () Bool)

(assert (=> b!29498 (=> (not res!17704) (not e!19031))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!29498 (= res!17704 (validKeyInArray!0 k0!1304))))

(declare-fun b!29499 () Bool)

(declare-fun e!19032 () Bool)

(assert (=> b!29499 (= e!19032 (and e!19029 mapRes!1474))))

(declare-fun condMapEmpty!1474 () Bool)

(declare-fun mapDefault!1474 () ValueCell!449)

(assert (=> b!29499 (= condMapEmpty!1474 (= (arr!857 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!449)) mapDefault!1474)))))

(declare-fun b!29500 () Bool)

(assert (=> b!29500 (= e!19030 tp_is_empty!1297)))

(declare-fun b!29501 () Bool)

(declare-fun res!17702 () Bool)

(assert (=> b!29501 (=> (not res!17702) (not e!19031))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!29501 (= res!17702 (and (= (size!958 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!959 _keys!1833) (size!958 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!29502 () Bool)

(declare-fun res!17703 () Bool)

(assert (=> b!29502 (=> (not res!17703) (not e!19031))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1809 (_ BitVec 32)) Bool)

(assert (=> b!29502 (= res!17703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun res!17701 () Bool)

(assert (=> start!4034 (=> (not res!17701) (not e!19031))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4034 (= res!17701 (validMask!0 mask!2294))))

(assert (=> start!4034 e!19031))

(assert (=> start!4034 true))

(assert (=> start!4034 tp!4248))

(declare-fun array_inv!593 (array!1807) Bool)

(assert (=> start!4034 (and (array_inv!593 _values!1501) e!19032)))

(declare-fun array_inv!594 (array!1809) Bool)

(assert (=> start!4034 (array_inv!594 _keys!1833)))

(assert (=> start!4034 tp_is_empty!1297))

(declare-fun b!29495 () Bool)

(assert (=> b!29495 (= e!19031 false)))

(declare-fun lt!11295 () Bool)

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1555)

(declare-fun minValue!1443 () V!1555)

(declare-datatypes ((tuple2!1118 0))(
  ( (tuple2!1119 (_1!570 (_ BitVec 64)) (_2!570 V!1555)) )
))
(declare-datatypes ((List!709 0))(
  ( (Nil!706) (Cons!705 (h!1272 tuple2!1118) (t!3396 List!709)) )
))
(declare-datatypes ((ListLongMap!689 0))(
  ( (ListLongMap!690 (toList!360 List!709)) )
))
(declare-fun contains!302 (ListLongMap!689 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!185 (array!1809 array!1807 (_ BitVec 32) (_ BitVec 32) V!1555 V!1555 (_ BitVec 32) Int) ListLongMap!689)

(assert (=> b!29495 (= lt!11295 (contains!302 (getCurrentListMap!185 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304))))

(assert (= (and start!4034 res!17701) b!29501))

(assert (= (and b!29501 res!17702) b!29502))

(assert (= (and b!29502 res!17703) b!29497))

(assert (= (and b!29497 res!17705) b!29498))

(assert (= (and b!29498 res!17704) b!29495))

(assert (= (and b!29499 condMapEmpty!1474) mapIsEmpty!1474))

(assert (= (and b!29499 (not condMapEmpty!1474)) mapNonEmpty!1474))

(get-info :version)

(assert (= (and mapNonEmpty!1474 ((_ is ValueCellFull!449) mapValue!1474)) b!29500))

(assert (= (and b!29499 ((_ is ValueCellFull!449) mapDefault!1474)) b!29496))

(assert (= start!4034 b!29499))

(declare-fun m!23669 () Bool)

(assert (=> b!29497 m!23669))

(declare-fun m!23671 () Bool)

(assert (=> mapNonEmpty!1474 m!23671))

(declare-fun m!23673 () Bool)

(assert (=> b!29495 m!23673))

(assert (=> b!29495 m!23673))

(declare-fun m!23675 () Bool)

(assert (=> b!29495 m!23675))

(declare-fun m!23677 () Bool)

(assert (=> b!29498 m!23677))

(declare-fun m!23679 () Bool)

(assert (=> start!4034 m!23679))

(declare-fun m!23681 () Bool)

(assert (=> start!4034 m!23681))

(declare-fun m!23683 () Bool)

(assert (=> start!4034 m!23683))

(declare-fun m!23685 () Bool)

(assert (=> b!29502 m!23685))

(check-sat tp_is_empty!1297 b_and!1743 (not mapNonEmpty!1474) (not b!29497) (not start!4034) (not b!29498) (not b_next!943) (not b!29502) (not b!29495))
(check-sat b_and!1743 (not b_next!943))
