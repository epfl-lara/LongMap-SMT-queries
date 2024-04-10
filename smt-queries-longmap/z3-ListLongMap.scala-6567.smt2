; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83288 () Bool)

(assert start!83288)

(declare-fun b_free!19281 () Bool)

(declare-fun b_next!19281 () Bool)

(assert (=> start!83288 (= b_free!19281 (not b_next!19281))))

(declare-fun tp!67122 () Bool)

(declare-fun b_and!30783 () Bool)

(assert (=> start!83288 (= tp!67122 b_and!30783)))

(declare-fun b!972056 () Bool)

(declare-fun res!650648 () Bool)

(declare-fun e!547930 () Bool)

(assert (=> b!972056 (=> (not res!650648) (not e!547930))))

(declare-datatypes ((array!60405 0))(
  ( (array!60406 (arr!29066 (Array (_ BitVec 32) (_ BitVec 64))) (size!29545 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60405)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60405 (_ BitVec 32)) Bool)

(assert (=> b!972056 (= res!650648 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!972057 () Bool)

(declare-fun e!547928 () Bool)

(declare-fun tp_is_empty!22179 () Bool)

(assert (=> b!972057 (= e!547928 tp_is_empty!22179)))

(declare-fun mapIsEmpty!35278 () Bool)

(declare-fun mapRes!35278 () Bool)

(assert (=> mapIsEmpty!35278 mapRes!35278))

(declare-fun b!972058 () Bool)

(declare-fun res!650651 () Bool)

(assert (=> b!972058 (=> (not res!650651) (not e!547930))))

(declare-datatypes ((List!20149 0))(
  ( (Nil!20146) (Cons!20145 (h!21307 (_ BitVec 64)) (t!28528 List!20149)) )
))
(declare-fun arrayNoDuplicates!0 (array!60405 (_ BitVec 32) List!20149) Bool)

(assert (=> b!972058 (= res!650651 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20146))))

(declare-fun b!972059 () Bool)

(declare-fun e!547929 () Bool)

(assert (=> b!972059 (= e!547929 (not true))))

(declare-datatypes ((V!34555 0))(
  ( (V!34556 (val!11140 Int)) )
))
(declare-datatypes ((ValueCell!10608 0))(
  ( (ValueCellFull!10608 (v!13699 V!34555)) (EmptyCell!10608) )
))
(declare-datatypes ((array!60407 0))(
  ( (array!60408 (arr!29067 (Array (_ BitVec 32) ValueCell!10608)) (size!29546 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60407)

(declare-fun lt!431937 () (_ BitVec 64))

(declare-fun zeroValue!1367 () V!34555)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-datatypes ((tuple2!14284 0))(
  ( (tuple2!14285 (_1!7153 (_ BitVec 64)) (_2!7153 V!34555)) )
))
(declare-datatypes ((List!20150 0))(
  ( (Nil!20147) (Cons!20146 (h!21308 tuple2!14284) (t!28529 List!20150)) )
))
(declare-datatypes ((ListLongMap!12981 0))(
  ( (ListLongMap!12982 (toList!6506 List!20150)) )
))
(declare-fun lt!431938 () ListLongMap!12981)

(declare-fun minValue!1367 () V!34555)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun +!2880 (ListLongMap!12981 tuple2!14284) ListLongMap!12981)

(declare-fun getCurrentListMap!3739 (array!60405 array!60407 (_ BitVec 32) (_ BitVec 32) V!34555 V!34555 (_ BitVec 32) Int) ListLongMap!12981)

(declare-fun get!15053 (ValueCell!10608 V!34555) V!34555)

(declare-fun dynLambda!1669 (Int (_ BitVec 64)) V!34555)

(assert (=> b!972059 (= lt!431938 (+!2880 (getCurrentListMap!3739 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14285 lt!431937 (get!15053 (select (arr!29067 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1669 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32381 0))(
  ( (Unit!32382) )
))
(declare-fun lt!431939 () Unit!32381)

(declare-fun lemmaListMapRecursiveValidKeyArray!246 (array!60405 array!60407 (_ BitVec 32) (_ BitVec 32) V!34555 V!34555 (_ BitVec 32) Int) Unit!32381)

(assert (=> b!972059 (= lt!431939 (lemmaListMapRecursiveValidKeyArray!246 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972060 () Bool)

(declare-fun e!547932 () Bool)

(assert (=> b!972060 (= e!547932 (and e!547928 mapRes!35278))))

(declare-fun condMapEmpty!35278 () Bool)

(declare-fun mapDefault!35278 () ValueCell!10608)

(assert (=> b!972060 (= condMapEmpty!35278 (= (arr!29067 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10608)) mapDefault!35278)))))

(declare-fun b!972061 () Bool)

(assert (=> b!972061 (= e!547930 e!547929)))

(declare-fun res!650650 () Bool)

(assert (=> b!972061 (=> (not res!650650) (not e!547929))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!972061 (= res!650650 (validKeyInArray!0 lt!431937))))

(assert (=> b!972061 (= lt!431937 (select (arr!29066 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!972061 (= lt!431938 (getCurrentListMap!3739 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972062 () Bool)

(declare-fun res!650645 () Bool)

(assert (=> b!972062 (=> (not res!650645) (not e!547930))))

(assert (=> b!972062 (= res!650645 (and (= (size!29546 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29545 _keys!1717) (size!29546 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!972063 () Bool)

(declare-fun e!547931 () Bool)

(assert (=> b!972063 (= e!547931 tp_is_empty!22179)))

(declare-fun b!972064 () Bool)

(declare-fun res!650649 () Bool)

(assert (=> b!972064 (=> (not res!650649) (not e!547930))))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!972064 (= res!650649 (validKeyInArray!0 (select (arr!29066 _keys!1717) i!822)))))

(declare-fun mapNonEmpty!35278 () Bool)

(declare-fun tp!67121 () Bool)

(assert (=> mapNonEmpty!35278 (= mapRes!35278 (and tp!67121 e!547931))))

(declare-fun mapKey!35278 () (_ BitVec 32))

(declare-fun mapRest!35278 () (Array (_ BitVec 32) ValueCell!10608))

(declare-fun mapValue!35278 () ValueCell!10608)

(assert (=> mapNonEmpty!35278 (= (arr!29067 _values!1425) (store mapRest!35278 mapKey!35278 mapValue!35278))))

(declare-fun res!650647 () Bool)

(assert (=> start!83288 (=> (not res!650647) (not e!547930))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83288 (= res!650647 (validMask!0 mask!2147))))

(assert (=> start!83288 e!547930))

(assert (=> start!83288 true))

(declare-fun array_inv!22485 (array!60407) Bool)

(assert (=> start!83288 (and (array_inv!22485 _values!1425) e!547932)))

(assert (=> start!83288 tp_is_empty!22179))

(assert (=> start!83288 tp!67122))

(declare-fun array_inv!22486 (array!60405) Bool)

(assert (=> start!83288 (array_inv!22486 _keys!1717)))

(declare-fun b!972065 () Bool)

(declare-fun res!650652 () Bool)

(assert (=> b!972065 (=> (not res!650652) (not e!547930))))

(assert (=> b!972065 (= res!650652 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29545 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29545 _keys!1717))))))

(declare-fun b!972066 () Bool)

(declare-fun res!650646 () Bool)

(assert (=> b!972066 (=> (not res!650646) (not e!547930))))

(declare-fun contains!5603 (ListLongMap!12981 (_ BitVec 64)) Bool)

(assert (=> b!972066 (= res!650646 (contains!5603 (getCurrentListMap!3739 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29066 _keys!1717) i!822)))))

(assert (= (and start!83288 res!650647) b!972062))

(assert (= (and b!972062 res!650645) b!972056))

(assert (= (and b!972056 res!650648) b!972058))

(assert (= (and b!972058 res!650651) b!972065))

(assert (= (and b!972065 res!650652) b!972064))

(assert (= (and b!972064 res!650649) b!972066))

(assert (= (and b!972066 res!650646) b!972061))

(assert (= (and b!972061 res!650650) b!972059))

(assert (= (and b!972060 condMapEmpty!35278) mapIsEmpty!35278))

(assert (= (and b!972060 (not condMapEmpty!35278)) mapNonEmpty!35278))

(get-info :version)

(assert (= (and mapNonEmpty!35278 ((_ is ValueCellFull!10608) mapValue!35278)) b!972063))

(assert (= (and b!972060 ((_ is ValueCellFull!10608) mapDefault!35278)) b!972057))

(assert (= start!83288 b!972060))

(declare-fun b_lambda!14445 () Bool)

(assert (=> (not b_lambda!14445) (not b!972059)))

(declare-fun t!28527 () Bool)

(declare-fun tb!6229 () Bool)

(assert (=> (and start!83288 (= defaultEntry!1428 defaultEntry!1428) t!28527) tb!6229))

(declare-fun result!12435 () Bool)

(assert (=> tb!6229 (= result!12435 tp_is_empty!22179)))

(assert (=> b!972059 t!28527))

(declare-fun b_and!30785 () Bool)

(assert (= b_and!30783 (and (=> t!28527 result!12435) b_and!30785)))

(declare-fun m!899433 () Bool)

(assert (=> b!972064 m!899433))

(assert (=> b!972064 m!899433))

(declare-fun m!899435 () Bool)

(assert (=> b!972064 m!899435))

(declare-fun m!899437 () Bool)

(assert (=> b!972061 m!899437))

(declare-fun m!899439 () Bool)

(assert (=> b!972061 m!899439))

(declare-fun m!899441 () Bool)

(assert (=> b!972061 m!899441))

(declare-fun m!899443 () Bool)

(assert (=> b!972058 m!899443))

(declare-fun m!899445 () Bool)

(assert (=> start!83288 m!899445))

(declare-fun m!899447 () Bool)

(assert (=> start!83288 m!899447))

(declare-fun m!899449 () Bool)

(assert (=> start!83288 m!899449))

(declare-fun m!899451 () Bool)

(assert (=> mapNonEmpty!35278 m!899451))

(declare-fun m!899453 () Bool)

(assert (=> b!972056 m!899453))

(declare-fun m!899455 () Bool)

(assert (=> b!972059 m!899455))

(declare-fun m!899457 () Bool)

(assert (=> b!972059 m!899457))

(declare-fun m!899459 () Bool)

(assert (=> b!972059 m!899459))

(assert (=> b!972059 m!899455))

(assert (=> b!972059 m!899459))

(declare-fun m!899461 () Bool)

(assert (=> b!972059 m!899461))

(assert (=> b!972059 m!899457))

(declare-fun m!899463 () Bool)

(assert (=> b!972059 m!899463))

(declare-fun m!899465 () Bool)

(assert (=> b!972059 m!899465))

(declare-fun m!899467 () Bool)

(assert (=> b!972066 m!899467))

(assert (=> b!972066 m!899433))

(assert (=> b!972066 m!899467))

(assert (=> b!972066 m!899433))

(declare-fun m!899469 () Bool)

(assert (=> b!972066 m!899469))

(check-sat (not b!972058) (not start!83288) (not b!972056) (not b_lambda!14445) (not mapNonEmpty!35278) (not b!972059) (not b!972066) (not b_next!19281) tp_is_empty!22179 (not b!972061) (not b!972064) b_and!30785)
(check-sat b_and!30785 (not b_next!19281))
