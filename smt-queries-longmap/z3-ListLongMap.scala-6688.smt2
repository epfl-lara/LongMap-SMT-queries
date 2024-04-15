; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84082 () Bool)

(assert start!84082)

(declare-fun b!983153 () Bool)

(declare-fun res!657961 () Bool)

(declare-fun e!554175 () Bool)

(assert (=> b!983153 (=> (not res!657961) (not e!554175))))

(declare-datatypes ((array!61728 0))(
  ( (array!61729 (arr!29722 (Array (_ BitVec 32) (_ BitVec 64))) (size!30203 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61728)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61728 (_ BitVec 32)) Bool)

(assert (=> b!983153 (= res!657961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!983154 () Bool)

(declare-fun e!554176 () Bool)

(declare-fun tp_is_empty!22903 () Bool)

(assert (=> b!983154 (= e!554176 tp_is_empty!22903)))

(declare-fun b!983155 () Bool)

(declare-fun e!554173 () Bool)

(declare-fun mapRes!36383 () Bool)

(assert (=> b!983155 (= e!554173 (and e!554176 mapRes!36383))))

(declare-fun condMapEmpty!36383 () Bool)

(declare-datatypes ((V!35521 0))(
  ( (V!35522 (val!11502 Int)) )
))
(declare-datatypes ((ValueCell!10970 0))(
  ( (ValueCellFull!10970 (v!14063 V!35521)) (EmptyCell!10970) )
))
(declare-datatypes ((array!61730 0))(
  ( (array!61731 (arr!29723 (Array (_ BitVec 32) ValueCell!10970)) (size!30204 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61730)

(declare-fun mapDefault!36383 () ValueCell!10970)

(assert (=> b!983155 (= condMapEmpty!36383 (= (arr!29723 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10970)) mapDefault!36383)))))

(declare-fun res!657963 () Bool)

(assert (=> start!84082 (=> (not res!657963) (not e!554175))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84082 (= res!657963 (validMask!0 mask!1948))))

(assert (=> start!84082 e!554175))

(assert (=> start!84082 true))

(declare-fun array_inv!22991 (array!61730) Bool)

(assert (=> start!84082 (and (array_inv!22991 _values!1278) e!554173)))

(declare-fun array_inv!22992 (array!61728) Bool)

(assert (=> start!84082 (array_inv!22992 _keys!1544)))

(declare-fun mapIsEmpty!36383 () Bool)

(assert (=> mapIsEmpty!36383 mapRes!36383))

(declare-fun b!983156 () Bool)

(declare-fun res!657962 () Bool)

(assert (=> b!983156 (=> (not res!657962) (not e!554175))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!983156 (= res!657962 (and (= (size!30204 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30203 _keys!1544) (size!30204 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!983157 () Bool)

(assert (=> b!983157 (= e!554175 false)))

(declare-fun lt!436275 () Bool)

(declare-datatypes ((List!20648 0))(
  ( (Nil!20645) (Cons!20644 (h!21806 (_ BitVec 64)) (t!29430 List!20648)) )
))
(declare-fun arrayNoDuplicates!0 (array!61728 (_ BitVec 32) List!20648) Bool)

(assert (=> b!983157 (= lt!436275 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20645))))

(declare-fun mapNonEmpty!36383 () Bool)

(declare-fun tp!69068 () Bool)

(declare-fun e!554174 () Bool)

(assert (=> mapNonEmpty!36383 (= mapRes!36383 (and tp!69068 e!554174))))

(declare-fun mapValue!36383 () ValueCell!10970)

(declare-fun mapKey!36383 () (_ BitVec 32))

(declare-fun mapRest!36383 () (Array (_ BitVec 32) ValueCell!10970))

(assert (=> mapNonEmpty!36383 (= (arr!29723 _values!1278) (store mapRest!36383 mapKey!36383 mapValue!36383))))

(declare-fun b!983158 () Bool)

(assert (=> b!983158 (= e!554174 tp_is_empty!22903)))

(assert (= (and start!84082 res!657963) b!983156))

(assert (= (and b!983156 res!657962) b!983153))

(assert (= (and b!983153 res!657961) b!983157))

(assert (= (and b!983155 condMapEmpty!36383) mapIsEmpty!36383))

(assert (= (and b!983155 (not condMapEmpty!36383)) mapNonEmpty!36383))

(get-info :version)

(assert (= (and mapNonEmpty!36383 ((_ is ValueCellFull!10970) mapValue!36383)) b!983158))

(assert (= (and b!983155 ((_ is ValueCellFull!10970) mapDefault!36383)) b!983154))

(assert (= start!84082 b!983155))

(declare-fun m!909923 () Bool)

(assert (=> b!983153 m!909923))

(declare-fun m!909925 () Bool)

(assert (=> start!84082 m!909925))

(declare-fun m!909927 () Bool)

(assert (=> start!84082 m!909927))

(declare-fun m!909929 () Bool)

(assert (=> start!84082 m!909929))

(declare-fun m!909931 () Bool)

(assert (=> b!983157 m!909931))

(declare-fun m!909933 () Bool)

(assert (=> mapNonEmpty!36383 m!909933))

(check-sat (not b!983153) (not start!84082) tp_is_empty!22903 (not mapNonEmpty!36383) (not b!983157))
(check-sat)
