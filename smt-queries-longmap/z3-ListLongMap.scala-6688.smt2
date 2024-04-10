; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84102 () Bool)

(assert start!84102)

(declare-fun b!983411 () Bool)

(declare-fun e!554337 () Bool)

(declare-fun e!554336 () Bool)

(declare-fun mapRes!36386 () Bool)

(assert (=> b!983411 (= e!554337 (and e!554336 mapRes!36386))))

(declare-fun condMapEmpty!36386 () Bool)

(declare-datatypes ((V!35523 0))(
  ( (V!35524 (val!11503 Int)) )
))
(declare-datatypes ((ValueCell!10971 0))(
  ( (ValueCellFull!10971 (v!14065 V!35523)) (EmptyCell!10971) )
))
(declare-datatypes ((array!61797 0))(
  ( (array!61798 (arr!29756 (Array (_ BitVec 32) ValueCell!10971)) (size!30235 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61797)

(declare-fun mapDefault!36386 () ValueCell!10971)

(assert (=> b!983411 (= condMapEmpty!36386 (= (arr!29756 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10971)) mapDefault!36386)))))

(declare-fun b!983412 () Bool)

(declare-fun res!658081 () Bool)

(declare-fun e!554340 () Bool)

(assert (=> b!983412 (=> (not res!658081) (not e!554340))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61799 0))(
  ( (array!61800 (arr!29757 (Array (_ BitVec 32) (_ BitVec 64))) (size!30236 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61799)

(assert (=> b!983412 (= res!658081 (and (= (size!30235 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30236 _keys!1544) (size!30235 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!36386 () Bool)

(declare-fun tp!69070 () Bool)

(declare-fun e!554338 () Bool)

(assert (=> mapNonEmpty!36386 (= mapRes!36386 (and tp!69070 e!554338))))

(declare-fun mapKey!36386 () (_ BitVec 32))

(declare-fun mapValue!36386 () ValueCell!10971)

(declare-fun mapRest!36386 () (Array (_ BitVec 32) ValueCell!10971))

(assert (=> mapNonEmpty!36386 (= (arr!29756 _values!1278) (store mapRest!36386 mapKey!36386 mapValue!36386))))

(declare-fun mapIsEmpty!36386 () Bool)

(assert (=> mapIsEmpty!36386 mapRes!36386))

(declare-fun b!983413 () Bool)

(declare-fun tp_is_empty!22905 () Bool)

(assert (=> b!983413 (= e!554338 tp_is_empty!22905)))

(declare-fun b!983414 () Bool)

(declare-fun res!658080 () Bool)

(assert (=> b!983414 (=> (not res!658080) (not e!554340))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61799 (_ BitVec 32)) Bool)

(assert (=> b!983414 (= res!658080 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!983415 () Bool)

(assert (=> b!983415 (= e!554340 false)))

(declare-fun lt!436514 () Bool)

(declare-datatypes ((List!20611 0))(
  ( (Nil!20608) (Cons!20607 (h!21769 (_ BitVec 64)) (t!29402 List!20611)) )
))
(declare-fun arrayNoDuplicates!0 (array!61799 (_ BitVec 32) List!20611) Bool)

(assert (=> b!983415 (= lt!436514 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20608))))

(declare-fun b!983410 () Bool)

(assert (=> b!983410 (= e!554336 tp_is_empty!22905)))

(declare-fun res!658082 () Bool)

(assert (=> start!84102 (=> (not res!658082) (not e!554340))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84102 (= res!658082 (validMask!0 mask!1948))))

(assert (=> start!84102 e!554340))

(assert (=> start!84102 true))

(declare-fun array_inv!23007 (array!61797) Bool)

(assert (=> start!84102 (and (array_inv!23007 _values!1278) e!554337)))

(declare-fun array_inv!23008 (array!61799) Bool)

(assert (=> start!84102 (array_inv!23008 _keys!1544)))

(assert (= (and start!84102 res!658082) b!983412))

(assert (= (and b!983412 res!658081) b!983414))

(assert (= (and b!983414 res!658080) b!983415))

(assert (= (and b!983411 condMapEmpty!36386) mapIsEmpty!36386))

(assert (= (and b!983411 (not condMapEmpty!36386)) mapNonEmpty!36386))

(get-info :version)

(assert (= (and mapNonEmpty!36386 ((_ is ValueCellFull!10971) mapValue!36386)) b!983413))

(assert (= (and b!983411 ((_ is ValueCellFull!10971) mapDefault!36386)) b!983410))

(assert (= start!84102 b!983411))

(declare-fun m!910693 () Bool)

(assert (=> mapNonEmpty!36386 m!910693))

(declare-fun m!910695 () Bool)

(assert (=> b!983414 m!910695))

(declare-fun m!910697 () Bool)

(assert (=> b!983415 m!910697))

(declare-fun m!910699 () Bool)

(assert (=> start!84102 m!910699))

(declare-fun m!910701 () Bool)

(assert (=> start!84102 m!910701))

(declare-fun m!910703 () Bool)

(assert (=> start!84102 m!910703))

(check-sat (not mapNonEmpty!36386) (not start!84102) tp_is_empty!22905 (not b!983415) (not b!983414))
(check-sat)
