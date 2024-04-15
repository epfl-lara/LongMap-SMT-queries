; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84112 () Bool)

(assert start!84112)

(declare-fun b!983423 () Bool)

(declare-fun e!554401 () Bool)

(assert (=> b!983423 (= e!554401 false)))

(declare-fun lt!436320 () Bool)

(declare-datatypes ((array!61778 0))(
  ( (array!61779 (arr!29747 (Array (_ BitVec 32) (_ BitVec 64))) (size!30228 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61778)

(declare-datatypes ((List!20657 0))(
  ( (Nil!20654) (Cons!20653 (h!21815 (_ BitVec 64)) (t!29439 List!20657)) )
))
(declare-fun arrayNoDuplicates!0 (array!61778 (_ BitVec 32) List!20657) Bool)

(assert (=> b!983423 (= lt!436320 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20654))))

(declare-fun b!983424 () Bool)

(declare-fun e!554402 () Bool)

(declare-fun tp_is_empty!22933 () Bool)

(assert (=> b!983424 (= e!554402 tp_is_empty!22933)))

(declare-fun res!658096 () Bool)

(assert (=> start!84112 (=> (not res!658096) (not e!554401))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84112 (= res!658096 (validMask!0 mask!1948))))

(assert (=> start!84112 e!554401))

(assert (=> start!84112 true))

(declare-datatypes ((V!35561 0))(
  ( (V!35562 (val!11517 Int)) )
))
(declare-datatypes ((ValueCell!10985 0))(
  ( (ValueCellFull!10985 (v!14078 V!35561)) (EmptyCell!10985) )
))
(declare-datatypes ((array!61780 0))(
  ( (array!61781 (arr!29748 (Array (_ BitVec 32) ValueCell!10985)) (size!30229 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61780)

(declare-fun e!554399 () Bool)

(declare-fun array_inv!23007 (array!61780) Bool)

(assert (=> start!84112 (and (array_inv!23007 _values!1278) e!554399)))

(declare-fun array_inv!23008 (array!61778) Bool)

(assert (=> start!84112 (array_inv!23008 _keys!1544)))

(declare-fun mapNonEmpty!36428 () Bool)

(declare-fun mapRes!36428 () Bool)

(declare-fun tp!69113 () Bool)

(assert (=> mapNonEmpty!36428 (= mapRes!36428 (and tp!69113 e!554402))))

(declare-fun mapValue!36428 () ValueCell!10985)

(declare-fun mapKey!36428 () (_ BitVec 32))

(declare-fun mapRest!36428 () (Array (_ BitVec 32) ValueCell!10985))

(assert (=> mapNonEmpty!36428 (= (arr!29748 _values!1278) (store mapRest!36428 mapKey!36428 mapValue!36428))))

(declare-fun b!983425 () Bool)

(declare-fun e!554398 () Bool)

(assert (=> b!983425 (= e!554399 (and e!554398 mapRes!36428))))

(declare-fun condMapEmpty!36428 () Bool)

(declare-fun mapDefault!36428 () ValueCell!10985)

(assert (=> b!983425 (= condMapEmpty!36428 (= (arr!29748 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10985)) mapDefault!36428)))))

(declare-fun b!983426 () Bool)

(declare-fun res!658097 () Bool)

(assert (=> b!983426 (=> (not res!658097) (not e!554401))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61778 (_ BitVec 32)) Bool)

(assert (=> b!983426 (= res!658097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!36428 () Bool)

(assert (=> mapIsEmpty!36428 mapRes!36428))

(declare-fun b!983427 () Bool)

(assert (=> b!983427 (= e!554398 tp_is_empty!22933)))

(declare-fun b!983428 () Bool)

(declare-fun res!658098 () Bool)

(assert (=> b!983428 (=> (not res!658098) (not e!554401))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!983428 (= res!658098 (and (= (size!30229 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30228 _keys!1544) (size!30229 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(assert (= (and start!84112 res!658096) b!983428))

(assert (= (and b!983428 res!658098) b!983426))

(assert (= (and b!983426 res!658097) b!983423))

(assert (= (and b!983425 condMapEmpty!36428) mapIsEmpty!36428))

(assert (= (and b!983425 (not condMapEmpty!36428)) mapNonEmpty!36428))

(get-info :version)

(assert (= (and mapNonEmpty!36428 ((_ is ValueCellFull!10985) mapValue!36428)) b!983424))

(assert (= (and b!983425 ((_ is ValueCellFull!10985) mapDefault!36428)) b!983427))

(assert (= start!84112 b!983425))

(declare-fun m!910103 () Bool)

(assert (=> b!983423 m!910103))

(declare-fun m!910105 () Bool)

(assert (=> start!84112 m!910105))

(declare-fun m!910107 () Bool)

(assert (=> start!84112 m!910107))

(declare-fun m!910109 () Bool)

(assert (=> start!84112 m!910109))

(declare-fun m!910111 () Bool)

(assert (=> mapNonEmpty!36428 m!910111))

(declare-fun m!910113 () Bool)

(assert (=> b!983426 m!910113))

(check-sat (not start!84112) (not mapNonEmpty!36428) (not b!983426) tp_is_empty!22933 (not b!983423))
(check-sat)
