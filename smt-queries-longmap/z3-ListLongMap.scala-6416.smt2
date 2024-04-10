; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82294 () Bool)

(assert start!82294)

(declare-fun b_free!18567 () Bool)

(declare-fun b_next!18567 () Bool)

(assert (=> start!82294 (= b_free!18567 (not b_next!18567))))

(declare-fun tp!64662 () Bool)

(declare-fun b_and!30055 () Bool)

(assert (=> start!82294 (= tp!64662 b_and!30055)))

(declare-fun b!959392 () Bool)

(declare-fun res!642206 () Bool)

(declare-fun e!540821 () Bool)

(assert (=> b!959392 (=> (not res!642206) (not e!540821))))

(declare-datatypes ((array!58641 0))(
  ( (array!58642 (arr!28194 (Array (_ BitVec 32) (_ BitVec 64))) (size!28673 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58641)

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58641 (_ BitVec 32)) Bool)

(assert (=> b!959392 (= res!642206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun mapIsEmpty!33889 () Bool)

(declare-fun mapRes!33889 () Bool)

(assert (=> mapIsEmpty!33889 mapRes!33889))

(declare-fun b!959393 () Bool)

(declare-fun e!540823 () Bool)

(declare-fun tp_is_empty!21273 () Bool)

(assert (=> b!959393 (= e!540823 tp_is_empty!21273)))

(declare-fun res!642205 () Bool)

(assert (=> start!82294 (=> (not res!642205) (not e!540821))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82294 (= res!642205 (validMask!0 mask!2088))))

(assert (=> start!82294 e!540821))

(assert (=> start!82294 true))

(assert (=> start!82294 tp_is_empty!21273))

(declare-fun array_inv!21857 (array!58641) Bool)

(assert (=> start!82294 (array_inv!21857 _keys!1668)))

(declare-datatypes ((V!33347 0))(
  ( (V!33348 (val!10687 Int)) )
))
(declare-datatypes ((ValueCell!10155 0))(
  ( (ValueCellFull!10155 (v!13244 V!33347)) (EmptyCell!10155) )
))
(declare-datatypes ((array!58643 0))(
  ( (array!58644 (arr!28195 (Array (_ BitVec 32) ValueCell!10155)) (size!28674 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58643)

(declare-fun e!540824 () Bool)

(declare-fun array_inv!21858 (array!58643) Bool)

(assert (=> start!82294 (and (array_inv!21858 _values!1386) e!540824)))

(assert (=> start!82294 tp!64662))

(declare-fun b!959394 () Bool)

(assert (=> b!959394 (= e!540821 (not true))))

(declare-fun minValue!1328 () V!33347)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33347)

(declare-fun i!793 () (_ BitVec 32))

(declare-datatypes ((tuple2!13788 0))(
  ( (tuple2!13789 (_1!6905 (_ BitVec 64)) (_2!6905 V!33347)) )
))
(declare-datatypes ((List!19606 0))(
  ( (Nil!19603) (Cons!19602 (h!20764 tuple2!13788) (t!27969 List!19606)) )
))
(declare-datatypes ((ListLongMap!12485 0))(
  ( (ListLongMap!12486 (toList!6258 List!19606)) )
))
(declare-fun contains!5359 (ListLongMap!12485 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3491 (array!58641 array!58643 (_ BitVec 32) (_ BitVec 32) V!33347 V!33347 (_ BitVec 32) Int) ListLongMap!12485)

(assert (=> b!959394 (contains!5359 (getCurrentListMap!3491 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 #b00000000000000000000000000000000 defaultEntry!1389) (select (arr!28194 _keys!1668) i!793))))

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((Unit!32191 0))(
  ( (Unit!32192) )
))
(declare-fun lt!430542 () Unit!32191)

(declare-fun lemmaInListMapFromThenInFromSmaller!17 (array!58641 array!58643 (_ BitVec 32) (_ BitVec 32) V!33347 V!33347 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32191)

(assert (=> b!959394 (= lt!430542 (lemmaInListMapFromThenInFromSmaller!17 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 #b00000000000000000000000000000000 i!793 defaultEntry!1389))))

(declare-fun b!959395 () Bool)

(declare-fun res!642202 () Bool)

(assert (=> b!959395 (=> (not res!642202) (not e!540821))))

(assert (=> b!959395 (= res!642202 (contains!5359 (getCurrentListMap!3491 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28194 _keys!1668) i!793)))))

(declare-fun mapNonEmpty!33889 () Bool)

(declare-fun tp!64661 () Bool)

(assert (=> mapNonEmpty!33889 (= mapRes!33889 (and tp!64661 e!540823))))

(declare-fun mapRest!33889 () (Array (_ BitVec 32) ValueCell!10155))

(declare-fun mapValue!33889 () ValueCell!10155)

(declare-fun mapKey!33889 () (_ BitVec 32))

(assert (=> mapNonEmpty!33889 (= (arr!28195 _values!1386) (store mapRest!33889 mapKey!33889 mapValue!33889))))

(declare-fun b!959396 () Bool)

(declare-fun res!642201 () Bool)

(assert (=> b!959396 (=> (not res!642201) (not e!540821))))

(declare-datatypes ((List!19607 0))(
  ( (Nil!19604) (Cons!19603 (h!20765 (_ BitVec 64)) (t!27970 List!19607)) )
))
(declare-fun arrayNoDuplicates!0 (array!58641 (_ BitVec 32) List!19607) Bool)

(assert (=> b!959396 (= res!642201 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19604))))

(declare-fun b!959397 () Bool)

(declare-fun res!642204 () Bool)

(assert (=> b!959397 (=> (not res!642204) (not e!540821))))

(assert (=> b!959397 (= res!642204 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28673 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28673 _keys!1668))))))

(declare-fun b!959398 () Bool)

(declare-fun res!642200 () Bool)

(assert (=> b!959398 (=> (not res!642200) (not e!540821))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!959398 (= res!642200 (validKeyInArray!0 (select (arr!28194 _keys!1668) i!793)))))

(declare-fun b!959399 () Bool)

(declare-fun e!540822 () Bool)

(assert (=> b!959399 (= e!540824 (and e!540822 mapRes!33889))))

(declare-fun condMapEmpty!33889 () Bool)

(declare-fun mapDefault!33889 () ValueCell!10155)

(assert (=> b!959399 (= condMapEmpty!33889 (= (arr!28195 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10155)) mapDefault!33889)))))

(declare-fun b!959400 () Bool)

(assert (=> b!959400 (= e!540822 tp_is_empty!21273)))

(declare-fun b!959401 () Bool)

(declare-fun res!642203 () Bool)

(assert (=> b!959401 (=> (not res!642203) (not e!540821))))

(assert (=> b!959401 (= res!642203 (and (= (size!28674 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28673 _keys!1668) (size!28674 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(assert (= (and start!82294 res!642205) b!959401))

(assert (= (and b!959401 res!642203) b!959392))

(assert (= (and b!959392 res!642206) b!959396))

(assert (= (and b!959396 res!642201) b!959397))

(assert (= (and b!959397 res!642204) b!959398))

(assert (= (and b!959398 res!642200) b!959395))

(assert (= (and b!959395 res!642202) b!959394))

(assert (= (and b!959399 condMapEmpty!33889) mapIsEmpty!33889))

(assert (= (and b!959399 (not condMapEmpty!33889)) mapNonEmpty!33889))

(get-info :version)

(assert (= (and mapNonEmpty!33889 ((_ is ValueCellFull!10155) mapValue!33889)) b!959393))

(assert (= (and b!959399 ((_ is ValueCellFull!10155) mapDefault!33889)) b!959400))

(assert (= start!82294 b!959399))

(declare-fun m!889891 () Bool)

(assert (=> b!959394 m!889891))

(declare-fun m!889893 () Bool)

(assert (=> b!959394 m!889893))

(assert (=> b!959394 m!889891))

(assert (=> b!959394 m!889893))

(declare-fun m!889895 () Bool)

(assert (=> b!959394 m!889895))

(declare-fun m!889897 () Bool)

(assert (=> b!959394 m!889897))

(declare-fun m!889899 () Bool)

(assert (=> b!959396 m!889899))

(declare-fun m!889901 () Bool)

(assert (=> mapNonEmpty!33889 m!889901))

(declare-fun m!889903 () Bool)

(assert (=> start!82294 m!889903))

(declare-fun m!889905 () Bool)

(assert (=> start!82294 m!889905))

(declare-fun m!889907 () Bool)

(assert (=> start!82294 m!889907))

(declare-fun m!889909 () Bool)

(assert (=> b!959395 m!889909))

(assert (=> b!959395 m!889893))

(assert (=> b!959395 m!889909))

(assert (=> b!959395 m!889893))

(declare-fun m!889911 () Bool)

(assert (=> b!959395 m!889911))

(declare-fun m!889913 () Bool)

(assert (=> b!959392 m!889913))

(assert (=> b!959398 m!889893))

(assert (=> b!959398 m!889893))

(declare-fun m!889915 () Bool)

(assert (=> b!959398 m!889915))

(check-sat (not b!959394) tp_is_empty!21273 (not b!959398) (not b!959396) (not mapNonEmpty!33889) b_and!30055 (not start!82294) (not b!959392) (not b!959395) (not b_next!18567))
(check-sat b_and!30055 (not b_next!18567))
