; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83700 () Bool)

(assert start!83700)

(declare-fun b_free!19519 () Bool)

(declare-fun b_next!19519 () Bool)

(assert (=> start!83700 (= b_free!19519 (not b_next!19519))))

(declare-fun tp!67845 () Bool)

(declare-fun b_and!31143 () Bool)

(assert (=> start!83700 (= tp!67845 b_and!31143)))

(declare-fun b!976881 () Bool)

(declare-fun e!550609 () Bool)

(declare-fun e!550611 () Bool)

(assert (=> b!976881 (= e!550609 e!550611)))

(declare-fun res!653701 () Bool)

(assert (=> b!976881 (=> (not res!653701) (not e!550611))))

(declare-fun lt!433317 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!976881 (= res!653701 (validKeyInArray!0 lt!433317))))

(declare-datatypes ((array!60914 0))(
  ( (array!60915 (arr!29316 (Array (_ BitVec 32) (_ BitVec 64))) (size!29796 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60914)

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!976881 (= lt!433317 (select (arr!29316 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34881 0))(
  ( (V!34882 (val!11262 Int)) )
))
(declare-datatypes ((ValueCell!10730 0))(
  ( (ValueCellFull!10730 (v!13818 V!34881)) (EmptyCell!10730) )
))
(declare-datatypes ((array!60916 0))(
  ( (array!60917 (arr!29317 (Array (_ BitVec 32) ValueCell!10730)) (size!29797 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60916)

(declare-fun zeroValue!1367 () V!34881)

(declare-datatypes ((tuple2!14492 0))(
  ( (tuple2!14493 (_1!7257 (_ BitVec 64)) (_2!7257 V!34881)) )
))
(declare-datatypes ((List!20336 0))(
  ( (Nil!20333) (Cons!20332 (h!21500 tuple2!14492) (t!28819 List!20336)) )
))
(declare-datatypes ((ListLongMap!13191 0))(
  ( (ListLongMap!13192 (toList!6611 List!20336)) )
))
(declare-fun lt!433315 () ListLongMap!13191)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34881)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3844 (array!60914 array!60916 (_ BitVec 32) (_ BitVec 32) V!34881 V!34881 (_ BitVec 32) Int) ListLongMap!13191)

(assert (=> b!976881 (= lt!433315 (getCurrentListMap!3844 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!976882 () Bool)

(declare-fun e!550608 () Bool)

(declare-fun e!550610 () Bool)

(declare-fun mapRes!35644 () Bool)

(assert (=> b!976882 (= e!550608 (and e!550610 mapRes!35644))))

(declare-fun condMapEmpty!35644 () Bool)

(declare-fun mapDefault!35644 () ValueCell!10730)

(assert (=> b!976882 (= condMapEmpty!35644 (= (arr!29317 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10730)) mapDefault!35644)))))

(declare-fun res!653704 () Bool)

(assert (=> start!83700 (=> (not res!653704) (not e!550609))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83700 (= res!653704 (validMask!0 mask!2147))))

(assert (=> start!83700 e!550609))

(assert (=> start!83700 true))

(declare-fun array_inv!22729 (array!60916) Bool)

(assert (=> start!83700 (and (array_inv!22729 _values!1425) e!550608)))

(declare-fun tp_is_empty!22423 () Bool)

(assert (=> start!83700 tp_is_empty!22423))

(assert (=> start!83700 tp!67845))

(declare-fun array_inv!22730 (array!60914) Bool)

(assert (=> start!83700 (array_inv!22730 _keys!1717)))

(declare-fun b!976883 () Bool)

(assert (=> b!976883 (= e!550610 tp_is_empty!22423)))

(declare-fun b!976884 () Bool)

(declare-fun res!653706 () Bool)

(assert (=> b!976884 (=> (not res!653706) (not e!550609))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun contains!5710 (ListLongMap!13191 (_ BitVec 64)) Bool)

(assert (=> b!976884 (= res!653706 (contains!5710 (getCurrentListMap!3844 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29316 _keys!1717) i!822)))))

(declare-fun b!976885 () Bool)

(declare-fun res!653705 () Bool)

(assert (=> b!976885 (=> (not res!653705) (not e!550609))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60914 (_ BitVec 32)) Bool)

(assert (=> b!976885 (= res!653705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!976886 () Bool)

(declare-fun res!653707 () Bool)

(assert (=> b!976886 (=> (not res!653707) (not e!550609))))

(declare-datatypes ((List!20337 0))(
  ( (Nil!20334) (Cons!20333 (h!21501 (_ BitVec 64)) (t!28820 List!20337)) )
))
(declare-fun arrayNoDuplicates!0 (array!60914 (_ BitVec 32) List!20337) Bool)

(assert (=> b!976886 (= res!653707 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20334))))

(declare-fun b!976887 () Bool)

(assert (=> b!976887 (= e!550611 (not (bvsge i!822 #b00000000000000000000000000000000)))))

(declare-fun +!2929 (ListLongMap!13191 tuple2!14492) ListLongMap!13191)

(declare-fun get!15196 (ValueCell!10730 V!34881) V!34881)

(declare-fun dynLambda!1726 (Int (_ BitVec 64)) V!34881)

(assert (=> b!976887 (= lt!433315 (+!2929 (getCurrentListMap!3844 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14493 lt!433317 (get!15196 (select (arr!29317 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1726 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32422 0))(
  ( (Unit!32423) )
))
(declare-fun lt!433316 () Unit!32422)

(declare-fun lemmaListMapRecursiveValidKeyArray!285 (array!60914 array!60916 (_ BitVec 32) (_ BitVec 32) V!34881 V!34881 (_ BitVec 32) Int) Unit!32422)

(assert (=> b!976887 (= lt!433316 (lemmaListMapRecursiveValidKeyArray!285 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!976888 () Bool)

(declare-fun res!653703 () Bool)

(assert (=> b!976888 (=> (not res!653703) (not e!550609))))

(assert (=> b!976888 (= res!653703 (and (= (size!29797 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29796 _keys!1717) (size!29797 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!976889 () Bool)

(declare-fun res!653702 () Bool)

(assert (=> b!976889 (=> (not res!653702) (not e!550609))))

(assert (=> b!976889 (= res!653702 (validKeyInArray!0 (select (arr!29316 _keys!1717) i!822)))))

(declare-fun b!976890 () Bool)

(declare-fun e!550607 () Bool)

(assert (=> b!976890 (= e!550607 tp_is_empty!22423)))

(declare-fun mapNonEmpty!35644 () Bool)

(declare-fun tp!67846 () Bool)

(assert (=> mapNonEmpty!35644 (= mapRes!35644 (and tp!67846 e!550607))))

(declare-fun mapValue!35644 () ValueCell!10730)

(declare-fun mapRest!35644 () (Array (_ BitVec 32) ValueCell!10730))

(declare-fun mapKey!35644 () (_ BitVec 32))

(assert (=> mapNonEmpty!35644 (= (arr!29317 _values!1425) (store mapRest!35644 mapKey!35644 mapValue!35644))))

(declare-fun b!976891 () Bool)

(declare-fun res!653708 () Bool)

(assert (=> b!976891 (=> (not res!653708) (not e!550609))))

(assert (=> b!976891 (= res!653708 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29796 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29796 _keys!1717))))))

(declare-fun mapIsEmpty!35644 () Bool)

(assert (=> mapIsEmpty!35644 mapRes!35644))

(assert (= (and start!83700 res!653704) b!976888))

(assert (= (and b!976888 res!653703) b!976885))

(assert (= (and b!976885 res!653705) b!976886))

(assert (= (and b!976886 res!653707) b!976891))

(assert (= (and b!976891 res!653708) b!976889))

(assert (= (and b!976889 res!653702) b!976884))

(assert (= (and b!976884 res!653706) b!976881))

(assert (= (and b!976881 res!653701) b!976887))

(assert (= (and b!976882 condMapEmpty!35644) mapIsEmpty!35644))

(assert (= (and b!976882 (not condMapEmpty!35644)) mapNonEmpty!35644))

(get-info :version)

(assert (= (and mapNonEmpty!35644 ((_ is ValueCellFull!10730) mapValue!35644)) b!976890))

(assert (= (and b!976882 ((_ is ValueCellFull!10730) mapDefault!35644)) b!976883))

(assert (= start!83700 b!976882))

(declare-fun b_lambda!14571 () Bool)

(assert (=> (not b_lambda!14571) (not b!976887)))

(declare-fun t!28818 () Bool)

(declare-fun tb!6333 () Bool)

(assert (=> (and start!83700 (= defaultEntry!1428 defaultEntry!1428) t!28818) tb!6333))

(declare-fun result!12651 () Bool)

(assert (=> tb!6333 (= result!12651 tp_is_empty!22423)))

(assert (=> b!976887 t!28818))

(declare-fun b_and!31145 () Bool)

(assert (= b_and!31143 (and (=> t!28818 result!12651) b_and!31145)))

(declare-fun m!904451 () Bool)

(assert (=> b!976884 m!904451))

(declare-fun m!904453 () Bool)

(assert (=> b!976884 m!904453))

(assert (=> b!976884 m!904451))

(assert (=> b!976884 m!904453))

(declare-fun m!904455 () Bool)

(assert (=> b!976884 m!904455))

(declare-fun m!904457 () Bool)

(assert (=> mapNonEmpty!35644 m!904457))

(declare-fun m!904459 () Bool)

(assert (=> b!976886 m!904459))

(declare-fun m!904461 () Bool)

(assert (=> start!83700 m!904461))

(declare-fun m!904463 () Bool)

(assert (=> start!83700 m!904463))

(declare-fun m!904465 () Bool)

(assert (=> start!83700 m!904465))

(declare-fun m!904467 () Bool)

(assert (=> b!976887 m!904467))

(declare-fun m!904469 () Bool)

(assert (=> b!976887 m!904469))

(declare-fun m!904471 () Bool)

(assert (=> b!976887 m!904471))

(assert (=> b!976887 m!904469))

(declare-fun m!904473 () Bool)

(assert (=> b!976887 m!904473))

(assert (=> b!976887 m!904467))

(assert (=> b!976887 m!904471))

(declare-fun m!904475 () Bool)

(assert (=> b!976887 m!904475))

(declare-fun m!904477 () Bool)

(assert (=> b!976887 m!904477))

(assert (=> b!976889 m!904453))

(assert (=> b!976889 m!904453))

(declare-fun m!904479 () Bool)

(assert (=> b!976889 m!904479))

(declare-fun m!904481 () Bool)

(assert (=> b!976885 m!904481))

(declare-fun m!904483 () Bool)

(assert (=> b!976881 m!904483))

(declare-fun m!904485 () Bool)

(assert (=> b!976881 m!904485))

(declare-fun m!904487 () Bool)

(assert (=> b!976881 m!904487))

(check-sat (not b!976889) (not b!976881) (not start!83700) (not b!976885) (not b!976884) b_and!31145 (not b!976886) (not b!976887) (not b_next!19519) (not b_lambda!14571) (not mapNonEmpty!35644) tp_is_empty!22423)
(check-sat b_and!31145 (not b_next!19519))
