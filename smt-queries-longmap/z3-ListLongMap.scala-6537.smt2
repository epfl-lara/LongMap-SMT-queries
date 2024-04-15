; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83088 () Bool)

(assert start!83088)

(declare-fun b_free!19099 () Bool)

(declare-fun b_next!19099 () Bool)

(assert (=> start!83088 (= b_free!19099 (not b_next!19099))))

(declare-fun tp!66576 () Bool)

(declare-fun b_and!30561 () Bool)

(assert (=> start!83088 (= tp!66576 b_and!30561)))

(declare-fun b!969192 () Bool)

(declare-fun res!648744 () Bool)

(declare-fun e!546393 () Bool)

(assert (=> b!969192 (=> (not res!648744) (not e!546393))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34313 0))(
  ( (V!34314 (val!11049 Int)) )
))
(declare-datatypes ((ValueCell!10517 0))(
  ( (ValueCellFull!10517 (v!13607 V!34313)) (EmptyCell!10517) )
))
(declare-datatypes ((array!59992 0))(
  ( (array!59993 (arr!28860 (Array (_ BitVec 32) ValueCell!10517)) (size!29341 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59992)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!59994 0))(
  ( (array!59995 (arr!28861 (Array (_ BitVec 32) (_ BitVec 64))) (size!29342 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59994)

(assert (=> b!969192 (= res!648744 (and (= (size!29341 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29342 _keys!1717) (size!29341 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!969193 () Bool)

(declare-fun e!546396 () Bool)

(declare-fun e!546395 () Bool)

(declare-fun mapRes!35005 () Bool)

(assert (=> b!969193 (= e!546396 (and e!546395 mapRes!35005))))

(declare-fun condMapEmpty!35005 () Bool)

(declare-fun mapDefault!35005 () ValueCell!10517)

(assert (=> b!969193 (= condMapEmpty!35005 (= (arr!28860 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10517)) mapDefault!35005)))))

(declare-fun b!969194 () Bool)

(declare-fun res!648745 () Bool)

(assert (=> b!969194 (=> (not res!648745) (not e!546393))))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!969194 (= res!648745 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29342 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29342 _keys!1717))))))

(declare-fun res!648748 () Bool)

(assert (=> start!83088 (=> (not res!648748) (not e!546393))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83088 (= res!648748 (validMask!0 mask!2147))))

(assert (=> start!83088 e!546393))

(assert (=> start!83088 true))

(declare-fun array_inv!22403 (array!59992) Bool)

(assert (=> start!83088 (and (array_inv!22403 _values!1425) e!546396)))

(declare-fun tp_is_empty!21997 () Bool)

(assert (=> start!83088 tp_is_empty!21997))

(assert (=> start!83088 tp!66576))

(declare-fun array_inv!22404 (array!59994) Bool)

(assert (=> start!83088 (array_inv!22404 _keys!1717)))

(declare-fun b!969195 () Bool)

(declare-fun e!546392 () Bool)

(assert (=> b!969195 (= e!546392 tp_is_empty!21997)))

(declare-fun b!969196 () Bool)

(declare-fun res!648743 () Bool)

(assert (=> b!969196 (=> (not res!648743) (not e!546393))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!969196 (= res!648743 (validKeyInArray!0 (select (arr!28861 _keys!1717) i!822)))))

(declare-fun b!969197 () Bool)

(declare-fun res!648746 () Bool)

(assert (=> b!969197 (=> (not res!648746) (not e!546393))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59994 (_ BitVec 32)) Bool)

(assert (=> b!969197 (= res!648746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!969198 () Bool)

(assert (=> b!969198 (= e!546393 false)))

(declare-fun zeroValue!1367 () V!34313)

(declare-fun minValue!1367 () V!34313)

(declare-fun lt!431400 () Bool)

(declare-fun defaultEntry!1428 () Int)

(declare-datatypes ((tuple2!14238 0))(
  ( (tuple2!14239 (_1!7130 (_ BitVec 64)) (_2!7130 V!34313)) )
))
(declare-datatypes ((List!20058 0))(
  ( (Nil!20055) (Cons!20054 (h!21216 tuple2!14238) (t!28412 List!20058)) )
))
(declare-datatypes ((ListLongMap!12925 0))(
  ( (ListLongMap!12926 (toList!6478 List!20058)) )
))
(declare-fun contains!5526 (ListLongMap!12925 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3640 (array!59994 array!59992 (_ BitVec 32) (_ BitVec 32) V!34313 V!34313 (_ BitVec 32) Int) ListLongMap!12925)

(assert (=> b!969198 (= lt!431400 (contains!5526 (getCurrentListMap!3640 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28861 _keys!1717) i!822)))))

(declare-fun mapIsEmpty!35005 () Bool)

(assert (=> mapIsEmpty!35005 mapRes!35005))

(declare-fun mapNonEmpty!35005 () Bool)

(declare-fun tp!66577 () Bool)

(assert (=> mapNonEmpty!35005 (= mapRes!35005 (and tp!66577 e!546392))))

(declare-fun mapKey!35005 () (_ BitVec 32))

(declare-fun mapValue!35005 () ValueCell!10517)

(declare-fun mapRest!35005 () (Array (_ BitVec 32) ValueCell!10517))

(assert (=> mapNonEmpty!35005 (= (arr!28860 _values!1425) (store mapRest!35005 mapKey!35005 mapValue!35005))))

(declare-fun b!969199 () Bool)

(assert (=> b!969199 (= e!546395 tp_is_empty!21997)))

(declare-fun b!969200 () Bool)

(declare-fun res!648747 () Bool)

(assert (=> b!969200 (=> (not res!648747) (not e!546393))))

(declare-datatypes ((List!20059 0))(
  ( (Nil!20056) (Cons!20055 (h!21217 (_ BitVec 64)) (t!28413 List!20059)) )
))
(declare-fun arrayNoDuplicates!0 (array!59994 (_ BitVec 32) List!20059) Bool)

(assert (=> b!969200 (= res!648747 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20056))))

(assert (= (and start!83088 res!648748) b!969192))

(assert (= (and b!969192 res!648744) b!969197))

(assert (= (and b!969197 res!648746) b!969200))

(assert (= (and b!969200 res!648747) b!969194))

(assert (= (and b!969194 res!648745) b!969196))

(assert (= (and b!969196 res!648743) b!969198))

(assert (= (and b!969193 condMapEmpty!35005) mapIsEmpty!35005))

(assert (= (and b!969193 (not condMapEmpty!35005)) mapNonEmpty!35005))

(get-info :version)

(assert (= (and mapNonEmpty!35005 ((_ is ValueCellFull!10517) mapValue!35005)) b!969195))

(assert (= (and b!969193 ((_ is ValueCellFull!10517) mapDefault!35005)) b!969199))

(assert (= start!83088 b!969193))

(declare-fun m!896669 () Bool)

(assert (=> mapNonEmpty!35005 m!896669))

(declare-fun m!896671 () Bool)

(assert (=> start!83088 m!896671))

(declare-fun m!896673 () Bool)

(assert (=> start!83088 m!896673))

(declare-fun m!896675 () Bool)

(assert (=> start!83088 m!896675))

(declare-fun m!896677 () Bool)

(assert (=> b!969200 m!896677))

(declare-fun m!896679 () Bool)

(assert (=> b!969198 m!896679))

(declare-fun m!896681 () Bool)

(assert (=> b!969198 m!896681))

(assert (=> b!969198 m!896679))

(assert (=> b!969198 m!896681))

(declare-fun m!896683 () Bool)

(assert (=> b!969198 m!896683))

(declare-fun m!896685 () Bool)

(assert (=> b!969197 m!896685))

(assert (=> b!969196 m!896681))

(assert (=> b!969196 m!896681))

(declare-fun m!896687 () Bool)

(assert (=> b!969196 m!896687))

(check-sat (not start!83088) tp_is_empty!21997 (not b_next!19099) (not b!969196) (not mapNonEmpty!35005) (not b!969200) (not b!969197) (not b!969198) b_and!30561)
(check-sat b_and!30561 (not b_next!19099))
