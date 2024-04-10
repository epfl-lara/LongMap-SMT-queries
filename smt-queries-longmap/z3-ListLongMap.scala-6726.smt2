; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84330 () Bool)

(assert start!84330)

(declare-fun mapIsEmpty!36728 () Bool)

(declare-fun mapRes!36728 () Bool)

(assert (=> mapIsEmpty!36728 mapRes!36728))

(declare-fun mapNonEmpty!36728 () Bool)

(declare-fun tp!69583 () Bool)

(declare-fun e!556211 () Bool)

(assert (=> mapNonEmpty!36728 (= mapRes!36728 (and tp!69583 e!556211))))

(declare-datatypes ((V!35827 0))(
  ( (V!35828 (val!11617 Int)) )
))
(declare-datatypes ((ValueCell!11085 0))(
  ( (ValueCellFull!11085 (v!14179 V!35827)) (EmptyCell!11085) )
))
(declare-fun mapValue!36728 () ValueCell!11085)

(declare-datatypes ((array!62231 0))(
  ( (array!62232 (arr!29973 (Array (_ BitVec 32) ValueCell!11085)) (size!30452 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62231)

(declare-fun mapRest!36728 () (Array (_ BitVec 32) ValueCell!11085))

(declare-fun mapKey!36728 () (_ BitVec 32))

(assert (=> mapNonEmpty!36728 (= (arr!29973 _values!1278) (store mapRest!36728 mapKey!36728 mapValue!36728))))

(declare-fun b!986470 () Bool)

(declare-fun e!556212 () Bool)

(assert (=> b!986470 (= e!556212 false)))

(declare-fun lt!437495 () Bool)

(declare-datatypes ((array!62233 0))(
  ( (array!62234 (arr!29974 (Array (_ BitVec 32) (_ BitVec 64))) (size!30453 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62233)

(declare-datatypes ((List!20743 0))(
  ( (Nil!20740) (Cons!20739 (h!21901 (_ BitVec 64)) (t!29642 List!20743)) )
))
(declare-fun arrayNoDuplicates!0 (array!62233 (_ BitVec 32) List!20743) Bool)

(assert (=> b!986470 (= lt!437495 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20740))))

(declare-fun b!986471 () Bool)

(declare-fun res!660008 () Bool)

(assert (=> b!986471 (=> (not res!660008) (not e!556212))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62233 (_ BitVec 32)) Bool)

(assert (=> b!986471 (= res!660008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!986472 () Bool)

(declare-fun e!556209 () Bool)

(declare-fun tp_is_empty!23133 () Bool)

(assert (=> b!986472 (= e!556209 tp_is_empty!23133)))

(declare-fun b!986473 () Bool)

(declare-fun res!660007 () Bool)

(assert (=> b!986473 (=> (not res!660007) (not e!556212))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!986473 (= res!660007 (and (= (size!30452 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30453 _keys!1544) (size!30452 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!986474 () Bool)

(assert (=> b!986474 (= e!556211 tp_is_empty!23133)))

(declare-fun res!660006 () Bool)

(assert (=> start!84330 (=> (not res!660006) (not e!556212))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84330 (= res!660006 (validMask!0 mask!1948))))

(assert (=> start!84330 e!556212))

(assert (=> start!84330 true))

(declare-fun e!556208 () Bool)

(declare-fun array_inv!23165 (array!62231) Bool)

(assert (=> start!84330 (and (array_inv!23165 _values!1278) e!556208)))

(declare-fun array_inv!23166 (array!62233) Bool)

(assert (=> start!84330 (array_inv!23166 _keys!1544)))

(declare-fun b!986475 () Bool)

(assert (=> b!986475 (= e!556208 (and e!556209 mapRes!36728))))

(declare-fun condMapEmpty!36728 () Bool)

(declare-fun mapDefault!36728 () ValueCell!11085)

(assert (=> b!986475 (= condMapEmpty!36728 (= (arr!29973 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11085)) mapDefault!36728)))))

(assert (= (and start!84330 res!660006) b!986473))

(assert (= (and b!986473 res!660007) b!986471))

(assert (= (and b!986471 res!660008) b!986470))

(assert (= (and b!986475 condMapEmpty!36728) mapIsEmpty!36728))

(assert (= (and b!986475 (not condMapEmpty!36728)) mapNonEmpty!36728))

(get-info :version)

(assert (= (and mapNonEmpty!36728 ((_ is ValueCellFull!11085) mapValue!36728)) b!986474))

(assert (= (and b!986475 ((_ is ValueCellFull!11085) mapDefault!36728)) b!986472))

(assert (= start!84330 b!986475))

(declare-fun m!913291 () Bool)

(assert (=> mapNonEmpty!36728 m!913291))

(declare-fun m!913293 () Bool)

(assert (=> b!986470 m!913293))

(declare-fun m!913295 () Bool)

(assert (=> b!986471 m!913295))

(declare-fun m!913297 () Bool)

(assert (=> start!84330 m!913297))

(declare-fun m!913299 () Bool)

(assert (=> start!84330 m!913299))

(declare-fun m!913301 () Bool)

(assert (=> start!84330 m!913301))

(check-sat (not start!84330) tp_is_empty!23133 (not mapNonEmpty!36728) (not b!986470) (not b!986471))
(check-sat)
