; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84346 () Bool)

(assert start!84346)

(declare-fun b!986564 () Bool)

(declare-fun res!660076 () Bool)

(declare-fun e!556315 () Bool)

(assert (=> b!986564 (=> (not res!660076) (not e!556315))))

(declare-datatypes ((array!62222 0))(
  ( (array!62223 (arr!29969 (Array (_ BitVec 32) (_ BitVec 64))) (size!30450 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62222)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62222 (_ BitVec 32)) Bool)

(assert (=> b!986564 (= res!660076 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!986565 () Bool)

(declare-fun res!660077 () Bool)

(assert (=> b!986565 (=> (not res!660077) (not e!556315))))

(declare-datatypes ((V!35873 0))(
  ( (V!35874 (val!11634 Int)) )
))
(declare-datatypes ((ValueCell!11102 0))(
  ( (ValueCellFull!11102 (v!14195 V!35873)) (EmptyCell!11102) )
))
(declare-datatypes ((array!62224 0))(
  ( (array!62225 (arr!29970 (Array (_ BitVec 32) ValueCell!11102)) (size!30451 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62224)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!986565 (= res!660077 (and (= (size!30451 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30450 _keys!1544) (size!30451 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!986566 () Bool)

(declare-fun e!556316 () Bool)

(declare-fun tp_is_empty!23167 () Bool)

(assert (=> b!986566 (= e!556316 tp_is_empty!23167)))

(declare-fun b!986567 () Bool)

(declare-fun e!556317 () Bool)

(declare-fun mapRes!36779 () Bool)

(assert (=> b!986567 (= e!556317 (and e!556316 mapRes!36779))))

(declare-fun condMapEmpty!36779 () Bool)

(declare-fun mapDefault!36779 () ValueCell!11102)

(assert (=> b!986567 (= condMapEmpty!36779 (= (arr!29970 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11102)) mapDefault!36779)))))

(declare-fun mapIsEmpty!36779 () Bool)

(assert (=> mapIsEmpty!36779 mapRes!36779))

(declare-fun b!986568 () Bool)

(declare-fun e!556318 () Bool)

(assert (=> b!986568 (= e!556318 tp_is_empty!23167)))

(declare-fun mapNonEmpty!36779 () Bool)

(declare-fun tp!69635 () Bool)

(assert (=> mapNonEmpty!36779 (= mapRes!36779 (and tp!69635 e!556318))))

(declare-fun mapKey!36779 () (_ BitVec 32))

(declare-fun mapRest!36779 () (Array (_ BitVec 32) ValueCell!11102))

(declare-fun mapValue!36779 () ValueCell!11102)

(assert (=> mapNonEmpty!36779 (= (arr!29970 _values!1278) (store mapRest!36779 mapKey!36779 mapValue!36779))))

(declare-fun b!986569 () Bool)

(assert (=> b!986569 (= e!556315 false)))

(declare-fun lt!437310 () Bool)

(declare-datatypes ((List!20786 0))(
  ( (Nil!20783) (Cons!20782 (h!21944 (_ BitVec 64)) (t!29676 List!20786)) )
))
(declare-fun arrayNoDuplicates!0 (array!62222 (_ BitVec 32) List!20786) Bool)

(assert (=> b!986569 (= lt!437310 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20783))))

(declare-fun res!660078 () Bool)

(assert (=> start!84346 (=> (not res!660078) (not e!556315))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84346 (= res!660078 (validMask!0 mask!1948))))

(assert (=> start!84346 e!556315))

(assert (=> start!84346 true))

(declare-fun array_inv!23171 (array!62224) Bool)

(assert (=> start!84346 (and (array_inv!23171 _values!1278) e!556317)))

(declare-fun array_inv!23172 (array!62222) Bool)

(assert (=> start!84346 (array_inv!23172 _keys!1544)))

(assert (= (and start!84346 res!660078) b!986565))

(assert (= (and b!986565 res!660077) b!986564))

(assert (= (and b!986564 res!660076) b!986569))

(assert (= (and b!986567 condMapEmpty!36779) mapIsEmpty!36779))

(assert (= (and b!986567 (not condMapEmpty!36779)) mapNonEmpty!36779))

(get-info :version)

(assert (= (and mapNonEmpty!36779 ((_ is ValueCellFull!11102) mapValue!36779)) b!986568))

(assert (= (and b!986567 ((_ is ValueCellFull!11102) mapDefault!36779)) b!986566))

(assert (= start!84346 b!986567))

(declare-fun m!912749 () Bool)

(assert (=> b!986564 m!912749))

(declare-fun m!912751 () Bool)

(assert (=> mapNonEmpty!36779 m!912751))

(declare-fun m!912753 () Bool)

(assert (=> b!986569 m!912753))

(declare-fun m!912755 () Bool)

(assert (=> start!84346 m!912755))

(declare-fun m!912757 () Bool)

(assert (=> start!84346 m!912757))

(declare-fun m!912759 () Bool)

(assert (=> start!84346 m!912759))

(check-sat tp_is_empty!23167 (not b!986569) (not start!84346) (not mapNonEmpty!36779) (not b!986564))
(check-sat)
