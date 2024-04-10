; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83874 () Bool)

(assert start!83874)

(declare-fun b_free!19683 () Bool)

(declare-fun b_next!19683 () Bool)

(assert (=> start!83874 (= b_free!19683 (not b_next!19683))))

(declare-fun tp!68491 () Bool)

(declare-fun b_and!31455 () Bool)

(assert (=> start!83874 (= tp!68491 b_and!31455)))

(declare-fun mapNonEmpty!36044 () Bool)

(declare-fun mapRes!36044 () Bool)

(declare-fun tp!68490 () Bool)

(declare-fun e!552401 () Bool)

(assert (=> mapNonEmpty!36044 (= mapRes!36044 (and tp!68490 e!552401))))

(declare-datatypes ((V!35219 0))(
  ( (V!35220 (val!11389 Int)) )
))
(declare-datatypes ((ValueCell!10857 0))(
  ( (ValueCellFull!10857 (v!13951 V!35219)) (EmptyCell!10857) )
))
(declare-datatypes ((array!61365 0))(
  ( (array!61366 (arr!29540 (Array (_ BitVec 32) ValueCell!10857)) (size!30019 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61365)

(declare-fun mapKey!36044 () (_ BitVec 32))

(declare-fun mapValue!36044 () ValueCell!10857)

(declare-fun mapRest!36044 () (Array (_ BitVec 32) ValueCell!10857))

(assert (=> mapNonEmpty!36044 (= (arr!29540 _values!1278) (store mapRest!36044 mapKey!36044 mapValue!36044))))

(declare-fun b!979996 () Bool)

(declare-fun e!552398 () Bool)

(declare-fun e!552397 () Bool)

(assert (=> b!979996 (= e!552398 (not e!552397))))

(declare-fun res!655853 () Bool)

(assert (=> b!979996 (=> res!655853 e!552397)))

(declare-datatypes ((array!61367 0))(
  ( (array!61368 (arr!29541 (Array (_ BitVec 32) (_ BitVec 64))) (size!30020 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61367)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!979996 (= res!655853 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29541 _keys!1544) from!1932)))))

(declare-datatypes ((tuple2!14608 0))(
  ( (tuple2!14609 (_1!7315 (_ BitVec 64)) (_2!7315 V!35219)) )
))
(declare-fun lt!434937 () tuple2!14608)

(declare-fun lt!434935 () tuple2!14608)

(declare-datatypes ((List!20474 0))(
  ( (Nil!20471) (Cons!20470 (h!21632 tuple2!14608) (t!29113 List!20474)) )
))
(declare-datatypes ((ListLongMap!13305 0))(
  ( (ListLongMap!13306 (toList!6668 List!20474)) )
))
(declare-fun lt!434930 () ListLongMap!13305)

(declare-fun lt!434932 () ListLongMap!13305)

(declare-fun +!2973 (ListLongMap!13305 tuple2!14608) ListLongMap!13305)

(assert (=> b!979996 (= (+!2973 lt!434930 lt!434937) (+!2973 lt!434932 lt!434935))))

(declare-fun lt!434931 () ListLongMap!13305)

(assert (=> b!979996 (= lt!434932 (+!2973 lt!434931 lt!434937))))

(declare-fun lt!434938 () V!35219)

(assert (=> b!979996 (= lt!434937 (tuple2!14609 (select (arr!29541 _keys!1544) from!1932) lt!434938))))

(assert (=> b!979996 (= lt!434930 (+!2973 lt!434931 lt!434935))))

(declare-fun minValue!1220 () V!35219)

(assert (=> b!979996 (= lt!434935 (tuple2!14609 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32585 0))(
  ( (Unit!32586) )
))
(declare-fun lt!434933 () Unit!32585)

(declare-fun addCommutativeForDiffKeys!601 (ListLongMap!13305 (_ BitVec 64) V!35219 (_ BitVec 64) V!35219) Unit!32585)

(assert (=> b!979996 (= lt!434933 (addCommutativeForDiffKeys!601 lt!434931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29541 _keys!1544) from!1932) lt!434938))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15312 (ValueCell!10857 V!35219) V!35219)

(declare-fun dynLambda!1759 (Int (_ BitVec 64)) V!35219)

(assert (=> b!979996 (= lt!434938 (get!15312 (select (arr!29540 _values!1278) from!1932) (dynLambda!1759 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!434936 () ListLongMap!13305)

(declare-fun lt!434934 () tuple2!14608)

(assert (=> b!979996 (= lt!434931 (+!2973 lt!434936 lt!434934))))

(declare-fun zeroValue!1220 () V!35219)

(assert (=> b!979996 (= lt!434934 (tuple2!14609 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3373 (array!61367 array!61365 (_ BitVec 32) (_ BitVec 32) V!35219 V!35219 (_ BitVec 32) Int) ListLongMap!13305)

(assert (=> b!979996 (= lt!434936 (getCurrentListMapNoExtraKeys!3373 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!979997 () Bool)

(declare-fun res!655847 () Bool)

(assert (=> b!979997 (=> (not res!655847) (not e!552398))))

(declare-datatypes ((List!20475 0))(
  ( (Nil!20472) (Cons!20471 (h!21633 (_ BitVec 64)) (t!29114 List!20475)) )
))
(declare-fun arrayNoDuplicates!0 (array!61367 (_ BitVec 32) List!20475) Bool)

(assert (=> b!979997 (= res!655847 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20472))))

(declare-fun b!979998 () Bool)

(assert (=> b!979998 (= e!552397 true)))

(assert (=> b!979998 (= lt!434932 (+!2973 (+!2973 lt!434936 lt!434937) lt!434934))))

(declare-fun lt!434939 () Unit!32585)

(assert (=> b!979998 (= lt!434939 (addCommutativeForDiffKeys!601 lt!434936 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29541 _keys!1544) from!1932) lt!434938))))

(declare-fun b!979999 () Bool)

(declare-fun res!655851 () Bool)

(assert (=> b!979999 (=> (not res!655851) (not e!552398))))

(assert (=> b!979999 (= res!655851 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!655849 () Bool)

(assert (=> start!83874 (=> (not res!655849) (not e!552398))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83874 (= res!655849 (validMask!0 mask!1948))))

(assert (=> start!83874 e!552398))

(assert (=> start!83874 true))

(declare-fun tp_is_empty!22677 () Bool)

(assert (=> start!83874 tp_is_empty!22677))

(declare-fun e!552399 () Bool)

(declare-fun array_inv!22837 (array!61365) Bool)

(assert (=> start!83874 (and (array_inv!22837 _values!1278) e!552399)))

(assert (=> start!83874 tp!68491))

(declare-fun array_inv!22838 (array!61367) Bool)

(assert (=> start!83874 (array_inv!22838 _keys!1544)))

(declare-fun b!980000 () Bool)

(assert (=> b!980000 (= e!552401 tp_is_empty!22677)))

(declare-fun b!980001 () Bool)

(declare-fun e!552400 () Bool)

(assert (=> b!980001 (= e!552399 (and e!552400 mapRes!36044))))

(declare-fun condMapEmpty!36044 () Bool)

(declare-fun mapDefault!36044 () ValueCell!10857)

(assert (=> b!980001 (= condMapEmpty!36044 (= (arr!29540 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10857)) mapDefault!36044)))))

(declare-fun b!980002 () Bool)

(declare-fun res!655850 () Bool)

(assert (=> b!980002 (=> (not res!655850) (not e!552398))))

(assert (=> b!980002 (= res!655850 (and (= (size!30019 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30020 _keys!1544) (size!30019 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!980003 () Bool)

(declare-fun res!655852 () Bool)

(assert (=> b!980003 (=> (not res!655852) (not e!552398))))

(assert (=> b!980003 (= res!655852 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30020 _keys!1544))))))

(declare-fun b!980004 () Bool)

(assert (=> b!980004 (= e!552400 tp_is_empty!22677)))

(declare-fun mapIsEmpty!36044 () Bool)

(assert (=> mapIsEmpty!36044 mapRes!36044))

(declare-fun b!980005 () Bool)

(declare-fun res!655848 () Bool)

(assert (=> b!980005 (=> (not res!655848) (not e!552398))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61367 (_ BitVec 32)) Bool)

(assert (=> b!980005 (= res!655848 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!980006 () Bool)

(declare-fun res!655846 () Bool)

(assert (=> b!980006 (=> (not res!655846) (not e!552398))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!980006 (= res!655846 (validKeyInArray!0 (select (arr!29541 _keys!1544) from!1932)))))

(assert (= (and start!83874 res!655849) b!980002))

(assert (= (and b!980002 res!655850) b!980005))

(assert (= (and b!980005 res!655848) b!979997))

(assert (= (and b!979997 res!655847) b!980003))

(assert (= (and b!980003 res!655852) b!980006))

(assert (= (and b!980006 res!655846) b!979999))

(assert (= (and b!979999 res!655851) b!979996))

(assert (= (and b!979996 (not res!655853)) b!979998))

(assert (= (and b!980001 condMapEmpty!36044) mapIsEmpty!36044))

(assert (= (and b!980001 (not condMapEmpty!36044)) mapNonEmpty!36044))

(get-info :version)

(assert (= (and mapNonEmpty!36044 ((_ is ValueCellFull!10857) mapValue!36044)) b!980000))

(assert (= (and b!980001 ((_ is ValueCellFull!10857) mapDefault!36044)) b!980004))

(assert (= start!83874 b!980001))

(declare-fun b_lambda!14727 () Bool)

(assert (=> (not b_lambda!14727) (not b!979996)))

(declare-fun t!29112 () Bool)

(declare-fun tb!6489 () Bool)

(assert (=> (and start!83874 (= defaultEntry!1281 defaultEntry!1281) t!29112) tb!6489))

(declare-fun result!12967 () Bool)

(assert (=> tb!6489 (= result!12967 tp_is_empty!22677)))

(assert (=> b!979996 t!29112))

(declare-fun b_and!31457 () Bool)

(assert (= b_and!31455 (and (=> t!29112 result!12967) b_and!31457)))

(declare-fun m!907417 () Bool)

(assert (=> mapNonEmpty!36044 m!907417))

(declare-fun m!907419 () Bool)

(assert (=> b!979998 m!907419))

(assert (=> b!979998 m!907419))

(declare-fun m!907421 () Bool)

(assert (=> b!979998 m!907421))

(declare-fun m!907423 () Bool)

(assert (=> b!979998 m!907423))

(assert (=> b!979998 m!907423))

(declare-fun m!907425 () Bool)

(assert (=> b!979998 m!907425))

(declare-fun m!907427 () Bool)

(assert (=> b!979997 m!907427))

(declare-fun m!907429 () Bool)

(assert (=> start!83874 m!907429))

(declare-fun m!907431 () Bool)

(assert (=> start!83874 m!907431))

(declare-fun m!907433 () Bool)

(assert (=> start!83874 m!907433))

(declare-fun m!907435 () Bool)

(assert (=> b!979996 m!907435))

(assert (=> b!979996 m!907423))

(declare-fun m!907437 () Bool)

(assert (=> b!979996 m!907437))

(declare-fun m!907439 () Bool)

(assert (=> b!979996 m!907439))

(declare-fun m!907441 () Bool)

(assert (=> b!979996 m!907441))

(assert (=> b!979996 m!907423))

(declare-fun m!907443 () Bool)

(assert (=> b!979996 m!907443))

(declare-fun m!907445 () Bool)

(assert (=> b!979996 m!907445))

(declare-fun m!907447 () Bool)

(assert (=> b!979996 m!907447))

(declare-fun m!907449 () Bool)

(assert (=> b!979996 m!907449))

(declare-fun m!907451 () Bool)

(assert (=> b!979996 m!907451))

(assert (=> b!979996 m!907437))

(assert (=> b!979996 m!907451))

(declare-fun m!907453 () Bool)

(assert (=> b!979996 m!907453))

(assert (=> b!980006 m!907423))

(assert (=> b!980006 m!907423))

(declare-fun m!907455 () Bool)

(assert (=> b!980006 m!907455))

(declare-fun m!907457 () Bool)

(assert (=> b!980005 m!907457))

(check-sat tp_is_empty!22677 (not b!979998) (not start!83874) (not b_lambda!14727) (not b!979996) (not mapNonEmpty!36044) (not b!980006) (not b!980005) b_and!31457 (not b!979997) (not b_next!19683))
(check-sat b_and!31457 (not b_next!19683))
