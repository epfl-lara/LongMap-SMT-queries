; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84610 () Bool)

(assert start!84610)

(declare-fun b_free!20053 () Bool)

(declare-fun b_next!20053 () Bool)

(assert (=> start!84610 (= b_free!20053 (not b_next!20053))))

(declare-fun tp!69952 () Bool)

(declare-fun b_and!32159 () Bool)

(assert (=> start!84610 (= tp!69952 b_and!32159)))

(declare-fun mapIsEmpty!36949 () Bool)

(declare-fun mapRes!36949 () Bool)

(assert (=> mapIsEmpty!36949 mapRes!36949))

(declare-fun b!989496 () Bool)

(declare-fun e!557944 () Bool)

(declare-fun e!557947 () Bool)

(assert (=> b!989496 (= e!557944 (and e!557947 mapRes!36949))))

(declare-fun condMapEmpty!36949 () Bool)

(declare-datatypes ((V!36009 0))(
  ( (V!36010 (val!11685 Int)) )
))
(declare-datatypes ((ValueCell!11153 0))(
  ( (ValueCellFull!11153 (v!14254 V!36009)) (EmptyCell!11153) )
))
(declare-datatypes ((array!62432 0))(
  ( (array!62433 (arr!30069 (Array (_ BitVec 32) ValueCell!11153)) (size!30550 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62432)

(declare-fun mapDefault!36949 () ValueCell!11153)

(assert (=> b!989496 (= condMapEmpty!36949 (= (arr!30069 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11153)) mapDefault!36949)))))

(declare-fun b!989497 () Bool)

(declare-fun res!661734 () Bool)

(declare-fun e!557945 () Bool)

(assert (=> b!989497 (=> (not res!661734) (not e!557945))))

(declare-datatypes ((array!62434 0))(
  ( (array!62435 (arr!30070 (Array (_ BitVec 32) (_ BitVec 64))) (size!30551 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62434)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62434 (_ BitVec 32)) Bool)

(assert (=> b!989497 (= res!661734 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!989498 () Bool)

(declare-fun tp_is_empty!23269 () Bool)

(assert (=> b!989498 (= e!557947 tp_is_empty!23269)))

(declare-fun b!989499 () Bool)

(declare-fun res!661731 () Bool)

(assert (=> b!989499 (=> (not res!661731) (not e!557945))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!989499 (= res!661731 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30551 _keys!1544))))))

(declare-fun b!989500 () Bool)

(declare-fun res!661732 () Bool)

(assert (=> b!989500 (=> (not res!661732) (not e!557945))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!989500 (= res!661732 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!989501 () Bool)

(declare-fun res!661733 () Bool)

(assert (=> b!989501 (=> (not res!661733) (not e!557945))))

(declare-datatypes ((List!20856 0))(
  ( (Nil!20853) (Cons!20852 (h!22014 (_ BitVec 64)) (t!29804 List!20856)) )
))
(declare-fun arrayNoDuplicates!0 (array!62434 (_ BitVec 32) List!20856) Bool)

(assert (=> b!989501 (= res!661733 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20853))))

(declare-fun b!989502 () Bool)

(declare-fun e!557948 () Bool)

(assert (=> b!989502 (= e!557948 tp_is_empty!23269)))

(declare-fun res!661730 () Bool)

(assert (=> start!84610 (=> (not res!661730) (not e!557945))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84610 (= res!661730 (validMask!0 mask!1948))))

(assert (=> start!84610 e!557945))

(assert (=> start!84610 true))

(assert (=> start!84610 tp_is_empty!23269))

(declare-fun array_inv!23235 (array!62432) Bool)

(assert (=> start!84610 (and (array_inv!23235 _values!1278) e!557944)))

(assert (=> start!84610 tp!69952))

(declare-fun array_inv!23236 (array!62434) Bool)

(assert (=> start!84610 (array_inv!23236 _keys!1544)))

(declare-fun mapNonEmpty!36949 () Bool)

(declare-fun tp!69951 () Bool)

(assert (=> mapNonEmpty!36949 (= mapRes!36949 (and tp!69951 e!557948))))

(declare-fun mapRest!36949 () (Array (_ BitVec 32) ValueCell!11153))

(declare-fun mapKey!36949 () (_ BitVec 32))

(declare-fun mapValue!36949 () ValueCell!11153)

(assert (=> mapNonEmpty!36949 (= (arr!30069 _values!1278) (store mapRest!36949 mapKey!36949 mapValue!36949))))

(declare-fun b!989503 () Bool)

(declare-fun res!661729 () Bool)

(assert (=> b!989503 (=> (not res!661729) (not e!557945))))

(assert (=> b!989503 (= res!661729 (and (= (size!30550 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30551 _keys!1544) (size!30550 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!989504 () Bool)

(assert (=> b!989504 (= e!557945 (bvsge from!1932 (size!30550 _values!1278)))))

(declare-fun minValue!1220 () V!36009)

(declare-fun zeroValue!1220 () V!36009)

(declare-fun defaultEntry!1281 () Int)

(declare-datatypes ((tuple2!14972 0))(
  ( (tuple2!14973 (_1!7497 (_ BitVec 64)) (_2!7497 V!36009)) )
))
(declare-datatypes ((List!20857 0))(
  ( (Nil!20854) (Cons!20853 (h!22015 tuple2!14972) (t!29805 List!20857)) )
))
(declare-datatypes ((ListLongMap!13659 0))(
  ( (ListLongMap!13660 (toList!6845 List!20857)) )
))
(declare-fun lt!438871 () ListLongMap!13659)

(declare-fun getCurrentListMapNoExtraKeys!3545 (array!62434 array!62432 (_ BitVec 32) (_ BitVec 32) V!36009 V!36009 (_ BitVec 32) Int) ListLongMap!13659)

(assert (=> b!989504 (= lt!438871 (getCurrentListMapNoExtraKeys!3545 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!989505 () Bool)

(declare-fun res!661735 () Bool)

(assert (=> b!989505 (=> (not res!661735) (not e!557945))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!989505 (= res!661735 (validKeyInArray!0 (select (arr!30070 _keys!1544) from!1932)))))

(assert (= (and start!84610 res!661730) b!989503))

(assert (= (and b!989503 res!661729) b!989497))

(assert (= (and b!989497 res!661734) b!989501))

(assert (= (and b!989501 res!661733) b!989499))

(assert (= (and b!989499 res!661731) b!989505))

(assert (= (and b!989505 res!661735) b!989500))

(assert (= (and b!989500 res!661732) b!989504))

(assert (= (and b!989496 condMapEmpty!36949) mapIsEmpty!36949))

(assert (= (and b!989496 (not condMapEmpty!36949)) mapNonEmpty!36949))

(get-info :version)

(assert (= (and mapNonEmpty!36949 ((_ is ValueCellFull!11153) mapValue!36949)) b!989502))

(assert (= (and b!989496 ((_ is ValueCellFull!11153) mapDefault!36949)) b!989498))

(assert (= start!84610 b!989496))

(declare-fun m!916473 () Bool)

(assert (=> start!84610 m!916473))

(declare-fun m!916475 () Bool)

(assert (=> start!84610 m!916475))

(declare-fun m!916477 () Bool)

(assert (=> start!84610 m!916477))

(declare-fun m!916479 () Bool)

(assert (=> b!989497 m!916479))

(declare-fun m!916481 () Bool)

(assert (=> b!989504 m!916481))

(declare-fun m!916483 () Bool)

(assert (=> b!989505 m!916483))

(assert (=> b!989505 m!916483))

(declare-fun m!916485 () Bool)

(assert (=> b!989505 m!916485))

(declare-fun m!916487 () Bool)

(assert (=> mapNonEmpty!36949 m!916487))

(declare-fun m!916489 () Bool)

(assert (=> b!989501 m!916489))

(check-sat (not b!989497) (not b_next!20053) (not b!989501) (not b!989505) (not mapNonEmpty!36949) (not start!84610) (not b!989504) tp_is_empty!23269 b_and!32159)
(check-sat b_and!32159 (not b_next!20053))
