; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83354 () Bool)

(assert start!83354)

(declare-fun b_free!19347 () Bool)

(declare-fun b_next!19347 () Bool)

(assert (=> start!83354 (= b_free!19347 (not b_next!19347))))

(declare-fun tp!67319 () Bool)

(declare-fun b_and!30915 () Bool)

(assert (=> start!83354 (= tp!67319 b_and!30915)))

(declare-fun b!973211 () Bool)

(declare-fun e!548557 () Bool)

(declare-fun tp_is_empty!22245 () Bool)

(assert (=> b!973211 (= e!548557 tp_is_empty!22245)))

(declare-fun b!973212 () Bool)

(declare-fun res!651444 () Bool)

(declare-fun e!548559 () Bool)

(assert (=> b!973212 (=> (not res!651444) (not e!548559))))

(declare-datatypes ((array!60531 0))(
  ( (array!60532 (arr!29129 (Array (_ BitVec 32) (_ BitVec 64))) (size!29608 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60531)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60531 (_ BitVec 32)) Bool)

(assert (=> b!973212 (= res!651444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!973213 () Bool)

(declare-fun res!651441 () Bool)

(assert (=> b!973213 (=> (not res!651441) (not e!548559))))

(declare-datatypes ((V!34643 0))(
  ( (V!34644 (val!11173 Int)) )
))
(declare-datatypes ((ValueCell!10641 0))(
  ( (ValueCellFull!10641 (v!13732 V!34643)) (EmptyCell!10641) )
))
(declare-datatypes ((array!60533 0))(
  ( (array!60534 (arr!29130 (Array (_ BitVec 32) ValueCell!10641)) (size!29609 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60533)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!973213 (= res!651441 (and (= (size!29609 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29608 _keys!1717) (size!29609 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!973214 () Bool)

(declare-fun res!651439 () Bool)

(assert (=> b!973214 (=> (not res!651439) (not e!548559))))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!973214 (= res!651439 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29608 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29608 _keys!1717))))))

(declare-fun b!973215 () Bool)

(declare-fun e!548556 () Bool)

(assert (=> b!973215 (= e!548556 tp_is_empty!22245)))

(declare-fun res!651443 () Bool)

(assert (=> start!83354 (=> (not res!651443) (not e!548559))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83354 (= res!651443 (validMask!0 mask!2147))))

(assert (=> start!83354 e!548559))

(assert (=> start!83354 true))

(declare-fun e!548560 () Bool)

(declare-fun array_inv!22535 (array!60533) Bool)

(assert (=> start!83354 (and (array_inv!22535 _values!1425) e!548560)))

(assert (=> start!83354 tp_is_empty!22245))

(assert (=> start!83354 tp!67319))

(declare-fun array_inv!22536 (array!60531) Bool)

(assert (=> start!83354 (array_inv!22536 _keys!1717)))

(declare-fun b!973216 () Bool)

(declare-fun e!548555 () Bool)

(declare-fun e!548554 () Bool)

(assert (=> b!973216 (= e!548555 e!548554)))

(declare-fun res!651437 () Bool)

(assert (=> b!973216 (=> (not res!651437) (not e!548554))))

(declare-fun lt!432362 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!973216 (= res!651437 (validKeyInArray!0 lt!432362))))

(assert (=> b!973216 (= lt!432362 (select (arr!29129 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!14340 0))(
  ( (tuple2!14341 (_1!7181 (_ BitVec 64)) (_2!7181 V!34643)) )
))
(declare-datatypes ((List!20201 0))(
  ( (Nil!20198) (Cons!20197 (h!21359 tuple2!14340) (t!28646 List!20201)) )
))
(declare-datatypes ((ListLongMap!13037 0))(
  ( (ListLongMap!13038 (toList!6534 List!20201)) )
))
(declare-fun lt!432368 () ListLongMap!13037)

(declare-fun zeroValue!1367 () V!34643)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34643)

(declare-fun getCurrentListMap!3767 (array!60531 array!60533 (_ BitVec 32) (_ BitVec 32) V!34643 V!34643 (_ BitVec 32) Int) ListLongMap!13037)

(assert (=> b!973216 (= lt!432368 (getCurrentListMap!3767 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun mapNonEmpty!35377 () Bool)

(declare-fun mapRes!35377 () Bool)

(declare-fun tp!67320 () Bool)

(assert (=> mapNonEmpty!35377 (= mapRes!35377 (and tp!67320 e!548557))))

(declare-fun mapValue!35377 () ValueCell!10641)

(declare-fun mapRest!35377 () (Array (_ BitVec 32) ValueCell!10641))

(declare-fun mapKey!35377 () (_ BitVec 32))

(assert (=> mapNonEmpty!35377 (= (arr!29130 _values!1425) (store mapRest!35377 mapKey!35377 mapValue!35377))))

(declare-fun b!973217 () Bool)

(assert (=> b!973217 (= e!548560 (and e!548556 mapRes!35377))))

(declare-fun condMapEmpty!35377 () Bool)

(declare-fun mapDefault!35377 () ValueCell!10641)

(assert (=> b!973217 (= condMapEmpty!35377 (= (arr!29130 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10641)) mapDefault!35377)))))

(declare-fun mapIsEmpty!35377 () Bool)

(assert (=> mapIsEmpty!35377 mapRes!35377))

(declare-fun b!973218 () Bool)

(declare-fun res!651442 () Bool)

(assert (=> b!973218 (=> (not res!651442) (not e!548559))))

(assert (=> b!973218 (= res!651442 (validKeyInArray!0 (select (arr!29129 _keys!1717) i!822)))))

(declare-fun b!973219 () Bool)

(declare-fun res!651438 () Bool)

(assert (=> b!973219 (=> (not res!651438) (not e!548559))))

(declare-datatypes ((List!20202 0))(
  ( (Nil!20199) (Cons!20198 (h!21360 (_ BitVec 64)) (t!28647 List!20202)) )
))
(declare-fun arrayNoDuplicates!0 (array!60531 (_ BitVec 32) List!20202) Bool)

(assert (=> b!973219 (= res!651438 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20199))))

(declare-fun b!973220 () Bool)

(assert (=> b!973220 (= e!548559 e!548555)))

(declare-fun res!651440 () Bool)

(assert (=> b!973220 (=> (not res!651440) (not e!548555))))

(declare-fun lt!432366 () ListLongMap!13037)

(declare-fun contains!5627 (ListLongMap!13037 (_ BitVec 64)) Bool)

(assert (=> b!973220 (= res!651440 (contains!5627 lt!432366 (select (arr!29129 _keys!1717) i!822)))))

(assert (=> b!973220 (= lt!432366 (getCurrentListMap!3767 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun b!973221 () Bool)

(assert (=> b!973221 (= e!548554 (not true))))

(declare-fun lt!432363 () tuple2!14340)

(declare-fun +!2903 (ListLongMap!13037 tuple2!14340) ListLongMap!13037)

(assert (=> b!973221 (contains!5627 (+!2903 lt!432366 lt!432363) (select (arr!29129 _keys!1717) i!822))))

(declare-fun lt!432367 () V!34643)

(declare-datatypes ((Unit!32427 0))(
  ( (Unit!32428) )
))
(declare-fun lt!432365 () Unit!32427)

(declare-fun addStillContains!599 (ListLongMap!13037 (_ BitVec 64) V!34643 (_ BitVec 64)) Unit!32427)

(assert (=> b!973221 (= lt!432365 (addStillContains!599 lt!432366 lt!432362 lt!432367 (select (arr!29129 _keys!1717) i!822)))))

(assert (=> b!973221 (= lt!432368 (+!2903 (getCurrentListMap!3767 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) lt!432363))))

(assert (=> b!973221 (= lt!432363 (tuple2!14341 lt!432362 lt!432367))))

(declare-fun get!15098 (ValueCell!10641 V!34643) V!34643)

(declare-fun dynLambda!1692 (Int (_ BitVec 64)) V!34643)

(assert (=> b!973221 (= lt!432367 (get!15098 (select (arr!29130 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1692 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!432364 () Unit!32427)

(declare-fun lemmaListMapRecursiveValidKeyArray!269 (array!60531 array!60533 (_ BitVec 32) (_ BitVec 32) V!34643 V!34643 (_ BitVec 32) Int) Unit!32427)

(assert (=> b!973221 (= lt!432364 (lemmaListMapRecursiveValidKeyArray!269 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(assert (= (and start!83354 res!651443) b!973213))

(assert (= (and b!973213 res!651441) b!973212))

(assert (= (and b!973212 res!651444) b!973219))

(assert (= (and b!973219 res!651438) b!973214))

(assert (= (and b!973214 res!651439) b!973218))

(assert (= (and b!973218 res!651442) b!973220))

(assert (= (and b!973220 res!651440) b!973216))

(assert (= (and b!973216 res!651437) b!973221))

(assert (= (and b!973217 condMapEmpty!35377) mapIsEmpty!35377))

(assert (= (and b!973217 (not condMapEmpty!35377)) mapNonEmpty!35377))

(get-info :version)

(assert (= (and mapNonEmpty!35377 ((_ is ValueCellFull!10641) mapValue!35377)) b!973211))

(assert (= (and b!973217 ((_ is ValueCellFull!10641) mapDefault!35377)) b!973215))

(assert (= start!83354 b!973217))

(declare-fun b_lambda!14511 () Bool)

(assert (=> (not b_lambda!14511) (not b!973221)))

(declare-fun t!28645 () Bool)

(declare-fun tb!6295 () Bool)

(assert (=> (and start!83354 (= defaultEntry!1428 defaultEntry!1428) t!28645) tb!6295))

(declare-fun result!12567 () Bool)

(assert (=> tb!6295 (= result!12567 tp_is_empty!22245)))

(assert (=> b!973221 t!28645))

(declare-fun b_and!30917 () Bool)

(assert (= b_and!30915 (and (=> t!28645 result!12567) b_and!30917)))

(declare-fun m!900747 () Bool)

(assert (=> start!83354 m!900747))

(declare-fun m!900749 () Bool)

(assert (=> start!83354 m!900749))

(declare-fun m!900751 () Bool)

(assert (=> start!83354 m!900751))

(declare-fun m!900753 () Bool)

(assert (=> b!973212 m!900753))

(declare-fun m!900755 () Bool)

(assert (=> mapNonEmpty!35377 m!900755))

(declare-fun m!900757 () Bool)

(assert (=> b!973219 m!900757))

(declare-fun m!900759 () Bool)

(assert (=> b!973221 m!900759))

(declare-fun m!900761 () Bool)

(assert (=> b!973221 m!900761))

(declare-fun m!900763 () Bool)

(assert (=> b!973221 m!900763))

(declare-fun m!900765 () Bool)

(assert (=> b!973221 m!900765))

(declare-fun m!900767 () Bool)

(assert (=> b!973221 m!900767))

(assert (=> b!973221 m!900765))

(declare-fun m!900769 () Bool)

(assert (=> b!973221 m!900769))

(declare-fun m!900771 () Bool)

(assert (=> b!973221 m!900771))

(assert (=> b!973221 m!900761))

(assert (=> b!973221 m!900759))

(assert (=> b!973221 m!900767))

(declare-fun m!900773 () Bool)

(assert (=> b!973221 m!900773))

(declare-fun m!900775 () Bool)

(assert (=> b!973221 m!900775))

(assert (=> b!973221 m!900771))

(assert (=> b!973221 m!900761))

(declare-fun m!900777 () Bool)

(assert (=> b!973221 m!900777))

(assert (=> b!973218 m!900761))

(assert (=> b!973218 m!900761))

(declare-fun m!900779 () Bool)

(assert (=> b!973218 m!900779))

(declare-fun m!900781 () Bool)

(assert (=> b!973216 m!900781))

(declare-fun m!900783 () Bool)

(assert (=> b!973216 m!900783))

(declare-fun m!900785 () Bool)

(assert (=> b!973216 m!900785))

(assert (=> b!973220 m!900761))

(assert (=> b!973220 m!900761))

(declare-fun m!900787 () Bool)

(assert (=> b!973220 m!900787))

(declare-fun m!900789 () Bool)

(assert (=> b!973220 m!900789))

(check-sat (not b!973216) (not b_lambda!14511) (not start!83354) (not mapNonEmpty!35377) (not b!973212) (not b!973218) (not b!973220) b_and!30917 (not b!973221) tp_is_empty!22245 (not b_next!19347) (not b!973219))
(check-sat b_and!30917 (not b_next!19347))
