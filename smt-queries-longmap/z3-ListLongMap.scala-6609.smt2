; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83520 () Bool)

(assert start!83520)

(declare-fun b_free!19525 () Bool)

(declare-fun b_next!19525 () Bool)

(assert (=> start!83520 (= b_free!19525 (not b_next!19525))))

(declare-fun tp!67864 () Bool)

(declare-fun b_and!31119 () Bool)

(assert (=> start!83520 (= tp!67864 b_and!31119)))

(declare-fun mapIsEmpty!35653 () Bool)

(declare-fun mapRes!35653 () Bool)

(assert (=> mapIsEmpty!35653 mapRes!35653))

(declare-fun b!975844 () Bool)

(declare-fun res!653325 () Bool)

(declare-fun e!549934 () Bool)

(assert (=> b!975844 (=> (not res!653325) (not e!549934))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34889 0))(
  ( (V!34890 (val!11265 Int)) )
))
(declare-datatypes ((ValueCell!10733 0))(
  ( (ValueCellFull!10733 (v!13823 V!34889)) (EmptyCell!10733) )
))
(declare-datatypes ((array!60818 0))(
  ( (array!60819 (arr!29273 (Array (_ BitVec 32) ValueCell!10733)) (size!29754 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60818)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60820 0))(
  ( (array!60821 (arr!29274 (Array (_ BitVec 32) (_ BitVec 64))) (size!29755 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60820)

(assert (=> b!975844 (= res!653325 (and (= (size!29754 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29755 _keys!1717) (size!29754 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!975845 () Bool)

(declare-fun e!549931 () Bool)

(declare-fun e!549932 () Bool)

(assert (=> b!975845 (= e!549931 (and e!549932 mapRes!35653))))

(declare-fun condMapEmpty!35653 () Bool)

(declare-fun mapDefault!35653 () ValueCell!10733)

(assert (=> b!975845 (= condMapEmpty!35653 (= (arr!29273 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10733)) mapDefault!35653)))))

(declare-fun mapNonEmpty!35653 () Bool)

(declare-fun tp!67863 () Bool)

(declare-fun e!549936 () Bool)

(assert (=> mapNonEmpty!35653 (= mapRes!35653 (and tp!67863 e!549936))))

(declare-fun mapKey!35653 () (_ BitVec 32))

(declare-fun mapValue!35653 () ValueCell!10733)

(declare-fun mapRest!35653 () (Array (_ BitVec 32) ValueCell!10733))

(assert (=> mapNonEmpty!35653 (= (arr!29273 _values!1425) (store mapRest!35653 mapKey!35653 mapValue!35653))))

(declare-fun b!975846 () Bool)

(declare-fun e!549935 () Bool)

(assert (=> b!975846 (= e!549935 (not true))))

(declare-fun lt!432746 () (_ BitVec 64))

(declare-datatypes ((tuple2!14554 0))(
  ( (tuple2!14555 (_1!7288 (_ BitVec 64)) (_2!7288 V!34889)) )
))
(declare-datatypes ((List!20360 0))(
  ( (Nil!20357) (Cons!20356 (h!21518 tuple2!14554) (t!28848 List!20360)) )
))
(declare-datatypes ((ListLongMap!13241 0))(
  ( (ListLongMap!13242 (toList!6636 List!20360)) )
))
(declare-fun lt!432747 () ListLongMap!13241)

(declare-fun zeroValue!1367 () V!34889)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34889)

(declare-fun +!2940 (ListLongMap!13241 tuple2!14554) ListLongMap!13241)

(declare-fun getCurrentListMap!3798 (array!60820 array!60818 (_ BitVec 32) (_ BitVec 32) V!34889 V!34889 (_ BitVec 32) Int) ListLongMap!13241)

(declare-fun get!15169 (ValueCell!10733 V!34889) V!34889)

(declare-fun dynLambda!1696 (Int (_ BitVec 64)) V!34889)

(assert (=> b!975846 (= lt!432747 (+!2940 (getCurrentListMap!3798 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14555 lt!432746 (get!15169 (select (arr!29273 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1696 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32332 0))(
  ( (Unit!32333) )
))
(declare-fun lt!432745 () Unit!32332)

(declare-fun lemmaListMapRecursiveValidKeyArray!280 (array!60820 array!60818 (_ BitVec 32) (_ BitVec 32) V!34889 V!34889 (_ BitVec 32) Int) Unit!32332)

(assert (=> b!975846 (= lt!432745 (lemmaListMapRecursiveValidKeyArray!280 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!975847 () Bool)

(declare-fun res!653324 () Bool)

(assert (=> b!975847 (=> (not res!653324) (not e!549934))))

(declare-datatypes ((List!20361 0))(
  ( (Nil!20358) (Cons!20357 (h!21519 (_ BitVec 64)) (t!28849 List!20361)) )
))
(declare-fun arrayNoDuplicates!0 (array!60820 (_ BitVec 32) List!20361) Bool)

(assert (=> b!975847 (= res!653324 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20358))))

(declare-fun b!975848 () Bool)

(declare-fun tp_is_empty!22429 () Bool)

(assert (=> b!975848 (= e!549932 tp_is_empty!22429)))

(declare-fun b!975849 () Bool)

(declare-fun res!653323 () Bool)

(assert (=> b!975849 (=> (not res!653323) (not e!549934))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!975849 (= res!653323 (validKeyInArray!0 (select (arr!29274 _keys!1717) i!822)))))

(declare-fun b!975850 () Bool)

(declare-fun res!653321 () Bool)

(assert (=> b!975850 (=> (not res!653321) (not e!549934))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60820 (_ BitVec 32)) Bool)

(assert (=> b!975850 (= res!653321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun res!653326 () Bool)

(assert (=> start!83520 (=> (not res!653326) (not e!549934))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83520 (= res!653326 (validMask!0 mask!2147))))

(assert (=> start!83520 e!549934))

(assert (=> start!83520 true))

(declare-fun array_inv!22681 (array!60818) Bool)

(assert (=> start!83520 (and (array_inv!22681 _values!1425) e!549931)))

(assert (=> start!83520 tp_is_empty!22429))

(assert (=> start!83520 tp!67864))

(declare-fun array_inv!22682 (array!60820) Bool)

(assert (=> start!83520 (array_inv!22682 _keys!1717)))

(declare-fun b!975851 () Bool)

(assert (=> b!975851 (= e!549936 tp_is_empty!22429)))

(declare-fun b!975852 () Bool)

(declare-fun res!653322 () Bool)

(assert (=> b!975852 (=> (not res!653322) (not e!549934))))

(assert (=> b!975852 (= res!653322 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29755 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29755 _keys!1717))))))

(declare-fun b!975853 () Bool)

(assert (=> b!975853 (= e!549934 e!549935)))

(declare-fun res!653320 () Bool)

(assert (=> b!975853 (=> (not res!653320) (not e!549935))))

(assert (=> b!975853 (= res!653320 (validKeyInArray!0 lt!432746))))

(assert (=> b!975853 (= lt!432746 (select (arr!29274 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!975853 (= lt!432747 (getCurrentListMap!3798 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!975854 () Bool)

(declare-fun res!653319 () Bool)

(assert (=> b!975854 (=> (not res!653319) (not e!549934))))

(declare-fun contains!5663 (ListLongMap!13241 (_ BitVec 64)) Bool)

(assert (=> b!975854 (= res!653319 (contains!5663 (getCurrentListMap!3798 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29274 _keys!1717) i!822)))))

(assert (= (and start!83520 res!653326) b!975844))

(assert (= (and b!975844 res!653325) b!975850))

(assert (= (and b!975850 res!653321) b!975847))

(assert (= (and b!975847 res!653324) b!975852))

(assert (= (and b!975852 res!653322) b!975849))

(assert (= (and b!975849 res!653323) b!975854))

(assert (= (and b!975854 res!653319) b!975853))

(assert (= (and b!975853 res!653320) b!975846))

(assert (= (and b!975845 condMapEmpty!35653) mapIsEmpty!35653))

(assert (= (and b!975845 (not condMapEmpty!35653)) mapNonEmpty!35653))

(get-info :version)

(assert (= (and mapNonEmpty!35653 ((_ is ValueCellFull!10733) mapValue!35653)) b!975851))

(assert (= (and b!975845 ((_ is ValueCellFull!10733) mapDefault!35653)) b!975848))

(assert (= start!83520 b!975845))

(declare-fun b_lambda!14545 () Bool)

(assert (=> (not b_lambda!14545) (not b!975846)))

(declare-fun t!28847 () Bool)

(declare-fun tb!6339 () Bool)

(assert (=> (and start!83520 (= defaultEntry!1428 defaultEntry!1428) t!28847) tb!6339))

(declare-fun result!12663 () Bool)

(assert (=> tb!6339 (= result!12663 tp_is_empty!22429)))

(assert (=> b!975846 t!28847))

(declare-fun b_and!31121 () Bool)

(assert (= b_and!31119 (and (=> t!28847 result!12663) b_and!31121)))

(declare-fun m!902513 () Bool)

(assert (=> b!975853 m!902513))

(declare-fun m!902515 () Bool)

(assert (=> b!975853 m!902515))

(declare-fun m!902517 () Bool)

(assert (=> b!975853 m!902517))

(declare-fun m!902519 () Bool)

(assert (=> b!975846 m!902519))

(declare-fun m!902521 () Bool)

(assert (=> b!975846 m!902521))

(declare-fun m!902523 () Bool)

(assert (=> b!975846 m!902523))

(assert (=> b!975846 m!902519))

(assert (=> b!975846 m!902523))

(declare-fun m!902525 () Bool)

(assert (=> b!975846 m!902525))

(assert (=> b!975846 m!902521))

(declare-fun m!902527 () Bool)

(assert (=> b!975846 m!902527))

(declare-fun m!902529 () Bool)

(assert (=> b!975846 m!902529))

(declare-fun m!902531 () Bool)

(assert (=> mapNonEmpty!35653 m!902531))

(declare-fun m!902533 () Bool)

(assert (=> start!83520 m!902533))

(declare-fun m!902535 () Bool)

(assert (=> start!83520 m!902535))

(declare-fun m!902537 () Bool)

(assert (=> start!83520 m!902537))

(declare-fun m!902539 () Bool)

(assert (=> b!975849 m!902539))

(assert (=> b!975849 m!902539))

(declare-fun m!902541 () Bool)

(assert (=> b!975849 m!902541))

(declare-fun m!902543 () Bool)

(assert (=> b!975850 m!902543))

(declare-fun m!902545 () Bool)

(assert (=> b!975854 m!902545))

(assert (=> b!975854 m!902539))

(assert (=> b!975854 m!902545))

(assert (=> b!975854 m!902539))

(declare-fun m!902547 () Bool)

(assert (=> b!975854 m!902547))

(declare-fun m!902549 () Bool)

(assert (=> b!975847 m!902549))

(check-sat (not b!975847) (not start!83520) b_and!31121 (not b_next!19525) (not mapNonEmpty!35653) (not b!975849) tp_is_empty!22429 (not b_lambda!14545) (not b!975853) (not b!975850) (not b!975854) (not b!975846))
(check-sat b_and!31121 (not b_next!19525))
