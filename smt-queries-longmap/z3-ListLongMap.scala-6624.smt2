; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83698 () Bool)

(assert start!83698)

(declare-fun b!977315 () Bool)

(declare-fun e!550970 () Bool)

(assert (=> b!977315 (= e!550970 false)))

(declare-fun lt!433251 () Bool)

(declare-datatypes ((array!61004 0))(
  ( (array!61005 (arr!29360 (Array (_ BitVec 32) (_ BitVec 64))) (size!29841 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61004)

(declare-datatypes ((List!20393 0))(
  ( (Nil!20390) (Cons!20389 (h!21551 (_ BitVec 64)) (t!28899 List!20393)) )
))
(declare-fun arrayNoDuplicates!0 (array!61004 (_ BitVec 32) List!20393) Bool)

(assert (=> b!977315 (= lt!433251 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20390))))

(declare-fun res!654129 () Bool)

(assert (=> start!83698 (=> (not res!654129) (not e!550970))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83698 (= res!654129 (validMask!0 mask!1948))))

(assert (=> start!83698 e!550970))

(assert (=> start!83698 true))

(declare-datatypes ((V!35009 0))(
  ( (V!35010 (val!11310 Int)) )
))
(declare-datatypes ((ValueCell!10778 0))(
  ( (ValueCellFull!10778 (v!13871 V!35009)) (EmptyCell!10778) )
))
(declare-datatypes ((array!61006 0))(
  ( (array!61007 (arr!29361 (Array (_ BitVec 32) ValueCell!10778)) (size!29842 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61006)

(declare-fun e!550971 () Bool)

(declare-fun array_inv!22737 (array!61006) Bool)

(assert (=> start!83698 (and (array_inv!22737 _values!1278) e!550971)))

(declare-fun array_inv!22738 (array!61004) Bool)

(assert (=> start!83698 (array_inv!22738 _keys!1544)))

(declare-fun b!977316 () Bool)

(declare-fun e!550973 () Bool)

(declare-fun mapRes!35807 () Bool)

(assert (=> b!977316 (= e!550971 (and e!550973 mapRes!35807))))

(declare-fun condMapEmpty!35807 () Bool)

(declare-fun mapDefault!35807 () ValueCell!10778)

(assert (=> b!977316 (= condMapEmpty!35807 (= (arr!29361 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10778)) mapDefault!35807)))))

(declare-fun mapNonEmpty!35807 () Bool)

(declare-fun tp!68060 () Bool)

(declare-fun e!550969 () Bool)

(assert (=> mapNonEmpty!35807 (= mapRes!35807 (and tp!68060 e!550969))))

(declare-fun mapValue!35807 () ValueCell!10778)

(declare-fun mapKey!35807 () (_ BitVec 32))

(declare-fun mapRest!35807 () (Array (_ BitVec 32) ValueCell!10778))

(assert (=> mapNonEmpty!35807 (= (arr!29361 _values!1278) (store mapRest!35807 mapKey!35807 mapValue!35807))))

(declare-fun b!977317 () Bool)

(declare-fun tp_is_empty!22519 () Bool)

(assert (=> b!977317 (= e!550969 tp_is_empty!22519)))

(declare-fun mapIsEmpty!35807 () Bool)

(assert (=> mapIsEmpty!35807 mapRes!35807))

(declare-fun b!977318 () Bool)

(declare-fun res!654128 () Bool)

(assert (=> b!977318 (=> (not res!654128) (not e!550970))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61004 (_ BitVec 32)) Bool)

(assert (=> b!977318 (= res!654128 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!977319 () Bool)

(declare-fun res!654127 () Bool)

(assert (=> b!977319 (=> (not res!654127) (not e!550970))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!977319 (= res!654127 (and (= (size!29842 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29841 _keys!1544) (size!29842 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!977320 () Bool)

(assert (=> b!977320 (= e!550973 tp_is_empty!22519)))

(assert (= (and start!83698 res!654129) b!977319))

(assert (= (and b!977319 res!654127) b!977318))

(assert (= (and b!977318 res!654128) b!977315))

(assert (= (and b!977316 condMapEmpty!35807) mapIsEmpty!35807))

(assert (= (and b!977316 (not condMapEmpty!35807)) mapNonEmpty!35807))

(get-info :version)

(assert (= (and mapNonEmpty!35807 ((_ is ValueCellFull!10778) mapValue!35807)) b!977317))

(assert (= (and b!977316 ((_ is ValueCellFull!10778) mapDefault!35807)) b!977320))

(assert (= start!83698 b!977316))

(declare-fun m!904025 () Bool)

(assert (=> b!977315 m!904025))

(declare-fun m!904027 () Bool)

(assert (=> start!83698 m!904027))

(declare-fun m!904029 () Bool)

(assert (=> start!83698 m!904029))

(declare-fun m!904031 () Bool)

(assert (=> start!83698 m!904031))

(declare-fun m!904033 () Bool)

(assert (=> mapNonEmpty!35807 m!904033))

(declare-fun m!904035 () Bool)

(assert (=> b!977318 m!904035))

(check-sat tp_is_empty!22519 (not mapNonEmpty!35807) (not start!83698) (not b!977318) (not b!977315))
(check-sat)
