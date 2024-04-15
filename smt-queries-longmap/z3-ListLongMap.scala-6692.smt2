; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84106 () Bool)

(assert start!84106)

(declare-fun b!983369 () Bool)

(declare-fun e!554357 () Bool)

(declare-fun e!554356 () Bool)

(declare-fun mapRes!36419 () Bool)

(assert (=> b!983369 (= e!554357 (and e!554356 mapRes!36419))))

(declare-fun condMapEmpty!36419 () Bool)

(declare-datatypes ((V!35553 0))(
  ( (V!35554 (val!11514 Int)) )
))
(declare-datatypes ((ValueCell!10982 0))(
  ( (ValueCellFull!10982 (v!14075 V!35553)) (EmptyCell!10982) )
))
(declare-datatypes ((array!61770 0))(
  ( (array!61771 (arr!29743 (Array (_ BitVec 32) ValueCell!10982)) (size!30224 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61770)

(declare-fun mapDefault!36419 () ValueCell!10982)

(assert (=> b!983369 (= condMapEmpty!36419 (= (arr!29743 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10982)) mapDefault!36419)))))

(declare-fun b!983370 () Bool)

(declare-fun res!658069 () Bool)

(declare-fun e!554355 () Bool)

(assert (=> b!983370 (=> (not res!658069) (not e!554355))))

(declare-datatypes ((array!61772 0))(
  ( (array!61773 (arr!29744 (Array (_ BitVec 32) (_ BitVec 64))) (size!30225 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61772)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61772 (_ BitVec 32)) Bool)

(assert (=> b!983370 (= res!658069 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!983371 () Bool)

(declare-fun tp_is_empty!22927 () Bool)

(assert (=> b!983371 (= e!554356 tp_is_empty!22927)))

(declare-fun res!658071 () Bool)

(assert (=> start!84106 (=> (not res!658071) (not e!554355))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84106 (= res!658071 (validMask!0 mask!1948))))

(assert (=> start!84106 e!554355))

(assert (=> start!84106 true))

(declare-fun array_inv!23005 (array!61770) Bool)

(assert (=> start!84106 (and (array_inv!23005 _values!1278) e!554357)))

(declare-fun array_inv!23006 (array!61772) Bool)

(assert (=> start!84106 (array_inv!23006 _keys!1544)))

(declare-fun mapIsEmpty!36419 () Bool)

(assert (=> mapIsEmpty!36419 mapRes!36419))

(declare-fun b!983372 () Bool)

(declare-fun e!554354 () Bool)

(assert (=> b!983372 (= e!554354 tp_is_empty!22927)))

(declare-fun b!983373 () Bool)

(assert (=> b!983373 (= e!554355 false)))

(declare-fun lt!436311 () Bool)

(declare-datatypes ((List!20656 0))(
  ( (Nil!20653) (Cons!20652 (h!21814 (_ BitVec 64)) (t!29438 List!20656)) )
))
(declare-fun arrayNoDuplicates!0 (array!61772 (_ BitVec 32) List!20656) Bool)

(assert (=> b!983373 (= lt!436311 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20653))))

(declare-fun b!983374 () Bool)

(declare-fun res!658070 () Bool)

(assert (=> b!983374 (=> (not res!658070) (not e!554355))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!983374 (= res!658070 (and (= (size!30224 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30225 _keys!1544) (size!30224 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!36419 () Bool)

(declare-fun tp!69104 () Bool)

(assert (=> mapNonEmpty!36419 (= mapRes!36419 (and tp!69104 e!554354))))

(declare-fun mapRest!36419 () (Array (_ BitVec 32) ValueCell!10982))

(declare-fun mapKey!36419 () (_ BitVec 32))

(declare-fun mapValue!36419 () ValueCell!10982)

(assert (=> mapNonEmpty!36419 (= (arr!29743 _values!1278) (store mapRest!36419 mapKey!36419 mapValue!36419))))

(assert (= (and start!84106 res!658071) b!983374))

(assert (= (and b!983374 res!658070) b!983370))

(assert (= (and b!983370 res!658069) b!983373))

(assert (= (and b!983369 condMapEmpty!36419) mapIsEmpty!36419))

(assert (= (and b!983369 (not condMapEmpty!36419)) mapNonEmpty!36419))

(get-info :version)

(assert (= (and mapNonEmpty!36419 ((_ is ValueCellFull!10982) mapValue!36419)) b!983372))

(assert (= (and b!983369 ((_ is ValueCellFull!10982) mapDefault!36419)) b!983371))

(assert (= start!84106 b!983369))

(declare-fun m!910067 () Bool)

(assert (=> b!983370 m!910067))

(declare-fun m!910069 () Bool)

(assert (=> start!84106 m!910069))

(declare-fun m!910071 () Bool)

(assert (=> start!84106 m!910071))

(declare-fun m!910073 () Bool)

(assert (=> start!84106 m!910073))

(declare-fun m!910075 () Bool)

(assert (=> b!983373 m!910075))

(declare-fun m!910077 () Bool)

(assert (=> mapNonEmpty!36419 m!910077))

(check-sat tp_is_empty!22927 (not start!84106) (not b!983370) (not mapNonEmpty!36419) (not b!983373))
(check-sat)
