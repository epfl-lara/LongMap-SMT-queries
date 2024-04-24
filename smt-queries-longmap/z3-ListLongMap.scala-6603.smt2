; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83670 () Bool)

(assert start!83670)

(declare-fun b_free!19489 () Bool)

(declare-fun b_next!19489 () Bool)

(assert (=> start!83670 (= b_free!19489 (not b_next!19489))))

(declare-fun tp!67755 () Bool)

(declare-fun b_and!31101 () Bool)

(assert (=> start!83670 (= tp!67755 b_and!31101)))

(declare-fun mapIsEmpty!35599 () Bool)

(declare-fun mapRes!35599 () Bool)

(assert (=> mapIsEmpty!35599 mapRes!35599))

(declare-fun b!976390 () Bool)

(declare-fun e!550355 () Bool)

(declare-fun tp_is_empty!22393 () Bool)

(assert (=> b!976390 (= e!550355 tp_is_empty!22393)))

(declare-fun b!976391 () Bool)

(declare-fun res!653358 () Bool)

(declare-fun e!550356 () Bool)

(assert (=> b!976391 (=> (not res!653358) (not e!550356))))

(declare-datatypes ((array!60854 0))(
  ( (array!60855 (arr!29286 (Array (_ BitVec 32) (_ BitVec 64))) (size!29766 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60854)

(declare-datatypes ((List!20312 0))(
  ( (Nil!20309) (Cons!20308 (h!21476 (_ BitVec 64)) (t!28781 List!20312)) )
))
(declare-fun arrayNoDuplicates!0 (array!60854 (_ BitVec 32) List!20312) Bool)

(assert (=> b!976391 (= res!653358 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20309))))

(declare-fun b!976392 () Bool)

(declare-fun e!550357 () Bool)

(declare-fun e!550353 () Bool)

(assert (=> b!976392 (= e!550357 (and e!550353 mapRes!35599))))

(declare-fun condMapEmpty!35599 () Bool)

(declare-datatypes ((V!34841 0))(
  ( (V!34842 (val!11247 Int)) )
))
(declare-datatypes ((ValueCell!10715 0))(
  ( (ValueCellFull!10715 (v!13803 V!34841)) (EmptyCell!10715) )
))
(declare-datatypes ((array!60856 0))(
  ( (array!60857 (arr!29287 (Array (_ BitVec 32) ValueCell!10715)) (size!29767 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60856)

(declare-fun mapDefault!35599 () ValueCell!10715)

(assert (=> b!976392 (= condMapEmpty!35599 (= (arr!29287 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10715)) mapDefault!35599)))))

(declare-fun b!976393 () Bool)

(declare-fun res!653359 () Bool)

(assert (=> b!976393 (=> (not res!653359) (not e!550356))))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!976393 (= res!653359 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29766 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29766 _keys!1717))))))

(declare-fun mapNonEmpty!35599 () Bool)

(declare-fun tp!67756 () Bool)

(assert (=> mapNonEmpty!35599 (= mapRes!35599 (and tp!67756 e!550355))))

(declare-fun mapRest!35599 () (Array (_ BitVec 32) ValueCell!10715))

(declare-fun mapValue!35599 () ValueCell!10715)

(declare-fun mapKey!35599 () (_ BitVec 32))

(assert (=> mapNonEmpty!35599 (= (arr!29287 _values!1425) (store mapRest!35599 mapKey!35599 mapValue!35599))))

(declare-fun b!976394 () Bool)

(assert (=> b!976394 (= e!550356 false)))

(declare-fun zeroValue!1367 () V!34841)

(declare-datatypes ((tuple2!14466 0))(
  ( (tuple2!14467 (_1!7244 (_ BitVec 64)) (_2!7244 V!34841)) )
))
(declare-datatypes ((List!20313 0))(
  ( (Nil!20310) (Cons!20309 (h!21477 tuple2!14466) (t!28782 List!20313)) )
))
(declare-datatypes ((ListLongMap!13165 0))(
  ( (ListLongMap!13166 (toList!6598 List!20313)) )
))
(declare-fun lt!433230 () ListLongMap!13165)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34841)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3831 (array!60854 array!60856 (_ BitVec 32) (_ BitVec 32) V!34841 V!34841 (_ BitVec 32) Int) ListLongMap!13165)

(assert (=> b!976394 (= lt!433230 (getCurrentListMap!3831 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!976395 () Bool)

(declare-fun res!653362 () Bool)

(assert (=> b!976395 (=> (not res!653362) (not e!550356))))

(assert (=> b!976395 (= res!653362 (and (= (size!29767 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29766 _keys!1717) (size!29767 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!976396 () Bool)

(declare-fun res!653360 () Bool)

(assert (=> b!976396 (=> (not res!653360) (not e!550356))))

(declare-fun contains!5697 (ListLongMap!13165 (_ BitVec 64)) Bool)

(assert (=> b!976396 (= res!653360 (contains!5697 (getCurrentListMap!3831 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29286 _keys!1717) i!822)))))

(declare-fun res!653361 () Bool)

(assert (=> start!83670 (=> (not res!653361) (not e!550356))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83670 (= res!653361 (validMask!0 mask!2147))))

(assert (=> start!83670 e!550356))

(assert (=> start!83670 true))

(declare-fun array_inv!22701 (array!60856) Bool)

(assert (=> start!83670 (and (array_inv!22701 _values!1425) e!550357)))

(assert (=> start!83670 tp_is_empty!22393))

(assert (=> start!83670 tp!67755))

(declare-fun array_inv!22702 (array!60854) Bool)

(assert (=> start!83670 (array_inv!22702 _keys!1717)))

(declare-fun b!976397 () Bool)

(declare-fun res!653363 () Bool)

(assert (=> b!976397 (=> (not res!653363) (not e!550356))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60854 (_ BitVec 32)) Bool)

(assert (=> b!976397 (= res!653363 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!976398 () Bool)

(assert (=> b!976398 (= e!550353 tp_is_empty!22393)))

(declare-fun b!976399 () Bool)

(declare-fun res!653357 () Bool)

(assert (=> b!976399 (=> (not res!653357) (not e!550356))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!976399 (= res!653357 (validKeyInArray!0 (select (arr!29286 _keys!1717) i!822)))))

(assert (= (and start!83670 res!653361) b!976395))

(assert (= (and b!976395 res!653362) b!976397))

(assert (= (and b!976397 res!653363) b!976391))

(assert (= (and b!976391 res!653358) b!976393))

(assert (= (and b!976393 res!653359) b!976399))

(assert (= (and b!976399 res!653357) b!976396))

(assert (= (and b!976396 res!653360) b!976394))

(assert (= (and b!976392 condMapEmpty!35599) mapIsEmpty!35599))

(assert (= (and b!976392 (not condMapEmpty!35599)) mapNonEmpty!35599))

(get-info :version)

(assert (= (and mapNonEmpty!35599 ((_ is ValueCellFull!10715) mapValue!35599)) b!976390))

(assert (= (and b!976392 ((_ is ValueCellFull!10715) mapDefault!35599)) b!976398))

(assert (= start!83670 b!976392))

(declare-fun m!904013 () Bool)

(assert (=> b!976397 m!904013))

(declare-fun m!904015 () Bool)

(assert (=> start!83670 m!904015))

(declare-fun m!904017 () Bool)

(assert (=> start!83670 m!904017))

(declare-fun m!904019 () Bool)

(assert (=> start!83670 m!904019))

(declare-fun m!904021 () Bool)

(assert (=> b!976396 m!904021))

(declare-fun m!904023 () Bool)

(assert (=> b!976396 m!904023))

(assert (=> b!976396 m!904021))

(assert (=> b!976396 m!904023))

(declare-fun m!904025 () Bool)

(assert (=> b!976396 m!904025))

(declare-fun m!904027 () Bool)

(assert (=> b!976391 m!904027))

(declare-fun m!904029 () Bool)

(assert (=> b!976394 m!904029))

(assert (=> b!976399 m!904023))

(assert (=> b!976399 m!904023))

(declare-fun m!904031 () Bool)

(assert (=> b!976399 m!904031))

(declare-fun m!904033 () Bool)

(assert (=> mapNonEmpty!35599 m!904033))

(check-sat (not b!976399) (not b!976397) (not start!83670) (not b!976394) (not b!976391) b_and!31101 tp_is_empty!22393 (not b!976396) (not mapNonEmpty!35599) (not b_next!19489))
(check-sat b_and!31101 (not b_next!19489))
