; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84120 () Bool)

(assert start!84120)

(declare-fun mapIsEmpty!36413 () Bool)

(declare-fun mapRes!36413 () Bool)

(assert (=> mapIsEmpty!36413 mapRes!36413))

(declare-fun res!658163 () Bool)

(declare-fun e!554472 () Bool)

(assert (=> start!84120 (=> (not res!658163) (not e!554472))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84120 (= res!658163 (validMask!0 mask!1948))))

(assert (=> start!84120 e!554472))

(assert (=> start!84120 true))

(declare-datatypes ((V!35547 0))(
  ( (V!35548 (val!11512 Int)) )
))
(declare-datatypes ((ValueCell!10980 0))(
  ( (ValueCellFull!10980 (v!14074 V!35547)) (EmptyCell!10980) )
))
(declare-datatypes ((array!61833 0))(
  ( (array!61834 (arr!29774 (Array (_ BitVec 32) ValueCell!10980)) (size!30253 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61833)

(declare-fun e!554474 () Bool)

(declare-fun array_inv!23023 (array!61833) Bool)

(assert (=> start!84120 (and (array_inv!23023 _values!1278) e!554474)))

(declare-datatypes ((array!61835 0))(
  ( (array!61836 (arr!29775 (Array (_ BitVec 32) (_ BitVec 64))) (size!30254 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61835)

(declare-fun array_inv!23024 (array!61835) Bool)

(assert (=> start!84120 (array_inv!23024 _keys!1544)))

(declare-fun b!983572 () Bool)

(declare-fun e!554475 () Bool)

(assert (=> b!983572 (= e!554474 (and e!554475 mapRes!36413))))

(declare-fun condMapEmpty!36413 () Bool)

(declare-fun mapDefault!36413 () ValueCell!10980)

(assert (=> b!983572 (= condMapEmpty!36413 (= (arr!29774 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10980)) mapDefault!36413)))))

(declare-fun b!983573 () Bool)

(declare-fun e!554471 () Bool)

(declare-fun tp_is_empty!22923 () Bool)

(assert (=> b!983573 (= e!554471 tp_is_empty!22923)))

(declare-fun b!983574 () Bool)

(assert (=> b!983574 (= e!554472 false)))

(declare-fun lt!436541 () Bool)

(declare-datatypes ((List!20617 0))(
  ( (Nil!20614) (Cons!20613 (h!21775 (_ BitVec 64)) (t!29408 List!20617)) )
))
(declare-fun arrayNoDuplicates!0 (array!61835 (_ BitVec 32) List!20617) Bool)

(assert (=> b!983574 (= lt!436541 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20614))))

(declare-fun mapNonEmpty!36413 () Bool)

(declare-fun tp!69097 () Bool)

(assert (=> mapNonEmpty!36413 (= mapRes!36413 (and tp!69097 e!554471))))

(declare-fun mapKey!36413 () (_ BitVec 32))

(declare-fun mapValue!36413 () ValueCell!10980)

(declare-fun mapRest!36413 () (Array (_ BitVec 32) ValueCell!10980))

(assert (=> mapNonEmpty!36413 (= (arr!29774 _values!1278) (store mapRest!36413 mapKey!36413 mapValue!36413))))

(declare-fun b!983575 () Bool)

(declare-fun res!658162 () Bool)

(assert (=> b!983575 (=> (not res!658162) (not e!554472))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61835 (_ BitVec 32)) Bool)

(assert (=> b!983575 (= res!658162 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!983576 () Bool)

(declare-fun res!658161 () Bool)

(assert (=> b!983576 (=> (not res!658161) (not e!554472))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!983576 (= res!658161 (and (= (size!30253 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30254 _keys!1544) (size!30253 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!983577 () Bool)

(assert (=> b!983577 (= e!554475 tp_is_empty!22923)))

(assert (= (and start!84120 res!658163) b!983576))

(assert (= (and b!983576 res!658161) b!983575))

(assert (= (and b!983575 res!658162) b!983574))

(assert (= (and b!983572 condMapEmpty!36413) mapIsEmpty!36413))

(assert (= (and b!983572 (not condMapEmpty!36413)) mapNonEmpty!36413))

(get-info :version)

(assert (= (and mapNonEmpty!36413 ((_ is ValueCellFull!10980) mapValue!36413)) b!983573))

(assert (= (and b!983572 ((_ is ValueCellFull!10980) mapDefault!36413)) b!983577))

(assert (= start!84120 b!983572))

(declare-fun m!910801 () Bool)

(assert (=> start!84120 m!910801))

(declare-fun m!910803 () Bool)

(assert (=> start!84120 m!910803))

(declare-fun m!910805 () Bool)

(assert (=> start!84120 m!910805))

(declare-fun m!910807 () Bool)

(assert (=> b!983574 m!910807))

(declare-fun m!910809 () Bool)

(assert (=> mapNonEmpty!36413 m!910809))

(declare-fun m!910811 () Bool)

(assert (=> b!983575 m!910811))

(check-sat (not b!983575) (not b!983574) tp_is_empty!22923 (not mapNonEmpty!36413) (not start!84120))
(check-sat)
