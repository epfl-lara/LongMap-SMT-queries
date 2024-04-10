; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83372 () Bool)

(assert start!83372)

(declare-fun b_free!19365 () Bool)

(declare-fun b_next!19365 () Bool)

(assert (=> start!83372 (= b_free!19365 (not b_next!19365))))

(declare-fun tp!67373 () Bool)

(declare-fun b_and!30951 () Bool)

(assert (=> start!83372 (= tp!67373 b_and!30951)))

(declare-fun b!973526 () Bool)

(declare-fun res!651653 () Bool)

(declare-fun e!548745 () Bool)

(assert (=> b!973526 (=> (not res!651653) (not e!548745))))

(declare-datatypes ((array!60567 0))(
  ( (array!60568 (arr!29147 (Array (_ BitVec 32) (_ BitVec 64))) (size!29626 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60567)

(declare-datatypes ((List!20217 0))(
  ( (Nil!20214) (Cons!20213 (h!21375 (_ BitVec 64)) (t!28680 List!20217)) )
))
(declare-fun arrayNoDuplicates!0 (array!60567 (_ BitVec 32) List!20217) Bool)

(assert (=> b!973526 (= res!651653 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20214))))

(declare-fun b!973527 () Bool)

(declare-fun e!548748 () Bool)

(declare-fun e!548743 () Bool)

(assert (=> b!973527 (= e!548748 e!548743)))

(declare-fun res!651658 () Bool)

(assert (=> b!973527 (=> (not res!651658) (not e!548743))))

(declare-fun lt!432551 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!973527 (= res!651658 (validKeyInArray!0 lt!432551))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!973527 (= lt!432551 (select (arr!29147 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34667 0))(
  ( (V!34668 (val!11182 Int)) )
))
(declare-datatypes ((ValueCell!10650 0))(
  ( (ValueCellFull!10650 (v!13741 V!34667)) (EmptyCell!10650) )
))
(declare-datatypes ((array!60569 0))(
  ( (array!60570 (arr!29148 (Array (_ BitVec 32) ValueCell!10650)) (size!29627 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60569)

(declare-datatypes ((tuple2!14358 0))(
  ( (tuple2!14359 (_1!7190 (_ BitVec 64)) (_2!7190 V!34667)) )
))
(declare-datatypes ((List!20218 0))(
  ( (Nil!20215) (Cons!20214 (h!21376 tuple2!14358) (t!28681 List!20218)) )
))
(declare-datatypes ((ListLongMap!13055 0))(
  ( (ListLongMap!13056 (toList!6543 List!20218)) )
))
(declare-fun lt!432554 () ListLongMap!13055)

(declare-fun zeroValue!1367 () V!34667)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34667)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3776 (array!60567 array!60569 (_ BitVec 32) (_ BitVec 32) V!34667 V!34667 (_ BitVec 32) Int) ListLongMap!13055)

(assert (=> b!973527 (= lt!432554 (getCurrentListMap!3776 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973528 () Bool)

(assert (=> b!973528 (= e!548745 e!548748)))

(declare-fun res!651659 () Bool)

(assert (=> b!973528 (=> (not res!651659) (not e!548748))))

(declare-fun lt!432557 () ListLongMap!13055)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun contains!5635 (ListLongMap!13055 (_ BitVec 64)) Bool)

(assert (=> b!973528 (= res!651659 (contains!5635 lt!432557 (select (arr!29147 _keys!1717) i!822)))))

(assert (=> b!973528 (= lt!432557 (getCurrentListMap!3776 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun res!651655 () Bool)

(assert (=> start!83372 (=> (not res!651655) (not e!548745))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83372 (= res!651655 (validMask!0 mask!2147))))

(assert (=> start!83372 e!548745))

(assert (=> start!83372 true))

(declare-fun e!548749 () Bool)

(declare-fun array_inv!22547 (array!60569) Bool)

(assert (=> start!83372 (and (array_inv!22547 _values!1425) e!548749)))

(declare-fun tp_is_empty!22263 () Bool)

(assert (=> start!83372 tp_is_empty!22263))

(assert (=> start!83372 tp!67373))

(declare-fun array_inv!22548 (array!60567) Bool)

(assert (=> start!83372 (array_inv!22548 _keys!1717)))

(declare-fun b!973529 () Bool)

(declare-fun res!651660 () Bool)

(assert (=> b!973529 (=> (not res!651660) (not e!548745))))

(assert (=> b!973529 (= res!651660 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29626 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29626 _keys!1717))))))

(declare-fun b!973530 () Bool)

(declare-fun res!651654 () Bool)

(assert (=> b!973530 (=> (not res!651654) (not e!548745))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60567 (_ BitVec 32)) Bool)

(assert (=> b!973530 (= res!651654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!973531 () Bool)

(declare-fun res!651656 () Bool)

(assert (=> b!973531 (=> (not res!651656) (not e!548745))))

(assert (=> b!973531 (= res!651656 (validKeyInArray!0 (select (arr!29147 _keys!1717) i!822)))))

(declare-fun b!973532 () Bool)

(declare-fun e!548746 () Bool)

(declare-fun mapRes!35404 () Bool)

(assert (=> b!973532 (= e!548749 (and e!548746 mapRes!35404))))

(declare-fun condMapEmpty!35404 () Bool)

(declare-fun mapDefault!35404 () ValueCell!10650)

(assert (=> b!973532 (= condMapEmpty!35404 (= (arr!29148 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10650)) mapDefault!35404)))))

(declare-fun b!973533 () Bool)

(assert (=> b!973533 (= e!548746 tp_is_empty!22263)))

(declare-fun b!973534 () Bool)

(assert (=> b!973534 (= e!548743 (not true))))

(declare-fun lt!432555 () tuple2!14358)

(declare-fun +!2909 (ListLongMap!13055 tuple2!14358) ListLongMap!13055)

(assert (=> b!973534 (contains!5635 (+!2909 lt!432557 lt!432555) (select (arr!29147 _keys!1717) i!822))))

(declare-datatypes ((Unit!32439 0))(
  ( (Unit!32440) )
))
(declare-fun lt!432556 () Unit!32439)

(declare-fun lt!432553 () V!34667)

(declare-fun addStillContains!605 (ListLongMap!13055 (_ BitVec 64) V!34667 (_ BitVec 64)) Unit!32439)

(assert (=> b!973534 (= lt!432556 (addStillContains!605 lt!432557 lt!432551 lt!432553 (select (arr!29147 _keys!1717) i!822)))))

(assert (=> b!973534 (= lt!432554 (+!2909 (getCurrentListMap!3776 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) lt!432555))))

(assert (=> b!973534 (= lt!432555 (tuple2!14359 lt!432551 lt!432553))))

(declare-fun get!15110 (ValueCell!10650 V!34667) V!34667)

(declare-fun dynLambda!1698 (Int (_ BitVec 64)) V!34667)

(assert (=> b!973534 (= lt!432553 (get!15110 (select (arr!29148 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1698 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!432552 () Unit!32439)

(declare-fun lemmaListMapRecursiveValidKeyArray!275 (array!60567 array!60569 (_ BitVec 32) (_ BitVec 32) V!34667 V!34667 (_ BitVec 32) Int) Unit!32439)

(assert (=> b!973534 (= lt!432552 (lemmaListMapRecursiveValidKeyArray!275 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973535 () Bool)

(declare-fun res!651657 () Bool)

(assert (=> b!973535 (=> (not res!651657) (not e!548745))))

(assert (=> b!973535 (= res!651657 (and (= (size!29627 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29626 _keys!1717) (size!29627 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!35404 () Bool)

(declare-fun tp!67374 () Bool)

(declare-fun e!548747 () Bool)

(assert (=> mapNonEmpty!35404 (= mapRes!35404 (and tp!67374 e!548747))))

(declare-fun mapRest!35404 () (Array (_ BitVec 32) ValueCell!10650))

(declare-fun mapKey!35404 () (_ BitVec 32))

(declare-fun mapValue!35404 () ValueCell!10650)

(assert (=> mapNonEmpty!35404 (= (arr!29148 _values!1425) (store mapRest!35404 mapKey!35404 mapValue!35404))))

(declare-fun b!973536 () Bool)

(assert (=> b!973536 (= e!548747 tp_is_empty!22263)))

(declare-fun mapIsEmpty!35404 () Bool)

(assert (=> mapIsEmpty!35404 mapRes!35404))

(assert (= (and start!83372 res!651655) b!973535))

(assert (= (and b!973535 res!651657) b!973530))

(assert (= (and b!973530 res!651654) b!973526))

(assert (= (and b!973526 res!651653) b!973529))

(assert (= (and b!973529 res!651660) b!973531))

(assert (= (and b!973531 res!651656) b!973528))

(assert (= (and b!973528 res!651659) b!973527))

(assert (= (and b!973527 res!651658) b!973534))

(assert (= (and b!973532 condMapEmpty!35404) mapIsEmpty!35404))

(assert (= (and b!973532 (not condMapEmpty!35404)) mapNonEmpty!35404))

(get-info :version)

(assert (= (and mapNonEmpty!35404 ((_ is ValueCellFull!10650) mapValue!35404)) b!973536))

(assert (= (and b!973532 ((_ is ValueCellFull!10650) mapDefault!35404)) b!973533))

(assert (= start!83372 b!973532))

(declare-fun b_lambda!14529 () Bool)

(assert (=> (not b_lambda!14529) (not b!973534)))

(declare-fun t!28679 () Bool)

(declare-fun tb!6313 () Bool)

(assert (=> (and start!83372 (= defaultEntry!1428 defaultEntry!1428) t!28679) tb!6313))

(declare-fun result!12603 () Bool)

(assert (=> tb!6313 (= result!12603 tp_is_empty!22263)))

(assert (=> b!973534 t!28679))

(declare-fun b_and!30953 () Bool)

(assert (= b_and!30951 (and (=> t!28679 result!12603) b_and!30953)))

(declare-fun m!901143 () Bool)

(assert (=> b!973528 m!901143))

(assert (=> b!973528 m!901143))

(declare-fun m!901145 () Bool)

(assert (=> b!973528 m!901145))

(declare-fun m!901147 () Bool)

(assert (=> b!973528 m!901147))

(declare-fun m!901149 () Bool)

(assert (=> b!973530 m!901149))

(declare-fun m!901151 () Bool)

(assert (=> start!83372 m!901151))

(declare-fun m!901153 () Bool)

(assert (=> start!83372 m!901153))

(declare-fun m!901155 () Bool)

(assert (=> start!83372 m!901155))

(declare-fun m!901157 () Bool)

(assert (=> b!973526 m!901157))

(assert (=> b!973531 m!901143))

(assert (=> b!973531 m!901143))

(declare-fun m!901159 () Bool)

(assert (=> b!973531 m!901159))

(declare-fun m!901161 () Bool)

(assert (=> mapNonEmpty!35404 m!901161))

(declare-fun m!901163 () Bool)

(assert (=> b!973527 m!901163))

(declare-fun m!901165 () Bool)

(assert (=> b!973527 m!901165))

(declare-fun m!901167 () Bool)

(assert (=> b!973527 m!901167))

(declare-fun m!901169 () Bool)

(assert (=> b!973534 m!901169))

(declare-fun m!901171 () Bool)

(assert (=> b!973534 m!901171))

(declare-fun m!901173 () Bool)

(assert (=> b!973534 m!901173))

(declare-fun m!901175 () Bool)

(assert (=> b!973534 m!901175))

(assert (=> b!973534 m!901143))

(declare-fun m!901177 () Bool)

(assert (=> b!973534 m!901177))

(assert (=> b!973534 m!901143))

(declare-fun m!901179 () Bool)

(assert (=> b!973534 m!901179))

(assert (=> b!973534 m!901143))

(assert (=> b!973534 m!901169))

(assert (=> b!973534 m!901173))

(declare-fun m!901181 () Bool)

(assert (=> b!973534 m!901181))

(assert (=> b!973534 m!901171))

(declare-fun m!901183 () Bool)

(assert (=> b!973534 m!901183))

(assert (=> b!973534 m!901175))

(declare-fun m!901185 () Bool)

(assert (=> b!973534 m!901185))

(check-sat (not b_lambda!14529) (not b!973530) (not b!973527) (not b!973531) (not b!973528) (not start!83372) (not b_next!19365) (not mapNonEmpty!35404) (not b!973534) tp_is_empty!22263 b_and!30953 (not b!973526))
(check-sat b_and!30953 (not b_next!19365))
