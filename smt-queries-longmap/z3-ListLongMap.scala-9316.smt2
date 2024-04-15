; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111332 () Bool)

(assert start!111332)

(declare-fun res!874350 () Bool)

(declare-fun e!751726 () Bool)

(assert (=> start!111332 (=> (not res!874350) (not e!751726))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111332 (= res!874350 (validMask!0 mask!2019))))

(assert (=> start!111332 e!751726))

(assert (=> start!111332 true))

(declare-datatypes ((V!52849 0))(
  ( (V!52850 (val!17979 Int)) )
))
(declare-datatypes ((ValueCell!17006 0))(
  ( (ValueCellFull!17006 (v!20608 V!52849)) (EmptyCell!17006) )
))
(declare-datatypes ((array!88493 0))(
  ( (array!88494 (arr!42721 (Array (_ BitVec 32) ValueCell!17006)) (size!43273 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88493)

(declare-fun e!751725 () Bool)

(declare-fun array_inv!32443 (array!88493) Bool)

(assert (=> start!111332 (and (array_inv!32443 _values!1337) e!751725)))

(declare-datatypes ((array!88495 0))(
  ( (array!88496 (arr!42722 (Array (_ BitVec 32) (_ BitVec 64))) (size!43274 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88495)

(declare-fun array_inv!32444 (array!88495) Bool)

(assert (=> start!111332 (array_inv!32444 _keys!1609)))

(declare-fun b!1317359 () Bool)

(declare-fun e!751723 () Bool)

(declare-fun mapRes!55361 () Bool)

(assert (=> b!1317359 (= e!751725 (and e!751723 mapRes!55361))))

(declare-fun condMapEmpty!55361 () Bool)

(declare-fun mapDefault!55361 () ValueCell!17006)

(assert (=> b!1317359 (= condMapEmpty!55361 (= (arr!42721 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17006)) mapDefault!55361)))))

(declare-fun mapNonEmpty!55361 () Bool)

(declare-fun tp!105468 () Bool)

(declare-fun e!751722 () Bool)

(assert (=> mapNonEmpty!55361 (= mapRes!55361 (and tp!105468 e!751722))))

(declare-fun mapKey!55361 () (_ BitVec 32))

(declare-fun mapValue!55361 () ValueCell!17006)

(declare-fun mapRest!55361 () (Array (_ BitVec 32) ValueCell!17006))

(assert (=> mapNonEmpty!55361 (= (arr!42721 _values!1337) (store mapRest!55361 mapKey!55361 mapValue!55361))))

(declare-fun b!1317360 () Bool)

(assert (=> b!1317360 (= e!751726 false)))

(declare-fun lt!586182 () Bool)

(declare-datatypes ((List!30368 0))(
  ( (Nil!30365) (Cons!30364 (h!31573 (_ BitVec 64)) (t!43968 List!30368)) )
))
(declare-fun arrayNoDuplicates!0 (array!88495 (_ BitVec 32) List!30368) Bool)

(assert (=> b!1317360 (= lt!586182 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30365))))

(declare-fun b!1317361 () Bool)

(declare-fun res!874349 () Bool)

(assert (=> b!1317361 (=> (not res!874349) (not e!751726))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88495 (_ BitVec 32)) Bool)

(assert (=> b!1317361 (= res!874349 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapIsEmpty!55361 () Bool)

(assert (=> mapIsEmpty!55361 mapRes!55361))

(declare-fun b!1317362 () Bool)

(declare-fun tp_is_empty!35809 () Bool)

(assert (=> b!1317362 (= e!751723 tp_is_empty!35809)))

(declare-fun b!1317363 () Bool)

(assert (=> b!1317363 (= e!751722 tp_is_empty!35809)))

(declare-fun b!1317364 () Bool)

(declare-fun res!874348 () Bool)

(assert (=> b!1317364 (=> (not res!874348) (not e!751726))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1317364 (= res!874348 (and (= (size!43273 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43274 _keys!1609) (size!43273 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(assert (= (and start!111332 res!874350) b!1317364))

(assert (= (and b!1317364 res!874348) b!1317361))

(assert (= (and b!1317361 res!874349) b!1317360))

(assert (= (and b!1317359 condMapEmpty!55361) mapIsEmpty!55361))

(assert (= (and b!1317359 (not condMapEmpty!55361)) mapNonEmpty!55361))

(get-info :version)

(assert (= (and mapNonEmpty!55361 ((_ is ValueCellFull!17006) mapValue!55361)) b!1317363))

(assert (= (and b!1317359 ((_ is ValueCellFull!17006) mapDefault!55361)) b!1317362))

(assert (= start!111332 b!1317359))

(declare-fun m!1204779 () Bool)

(assert (=> start!111332 m!1204779))

(declare-fun m!1204781 () Bool)

(assert (=> start!111332 m!1204781))

(declare-fun m!1204783 () Bool)

(assert (=> start!111332 m!1204783))

(declare-fun m!1204785 () Bool)

(assert (=> mapNonEmpty!55361 m!1204785))

(declare-fun m!1204787 () Bool)

(assert (=> b!1317360 m!1204787))

(declare-fun m!1204789 () Bool)

(assert (=> b!1317361 m!1204789))

(check-sat tp_is_empty!35809 (not b!1317361) (not b!1317360) (not start!111332) (not mapNonEmpty!55361))
(check-sat)
