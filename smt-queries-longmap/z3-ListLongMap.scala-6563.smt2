; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83264 () Bool)

(assert start!83264)

(declare-fun b_free!19257 () Bool)

(declare-fun b_next!19257 () Bool)

(assert (=> start!83264 (= b_free!19257 (not b_next!19257))))

(declare-fun tp!67049 () Bool)

(declare-fun b_and!30745 () Bool)

(assert (=> start!83264 (= tp!67049 b_and!30745)))

(declare-fun b!971659 () Bool)

(declare-fun res!650373 () Bool)

(declare-fun e!547728 () Bool)

(assert (=> b!971659 (=> (not res!650373) (not e!547728))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34523 0))(
  ( (V!34524 (val!11128 Int)) )
))
(declare-datatypes ((ValueCell!10596 0))(
  ( (ValueCellFull!10596 (v!13687 V!34523)) (EmptyCell!10596) )
))
(declare-datatypes ((array!60357 0))(
  ( (array!60358 (arr!29042 (Array (_ BitVec 32) ValueCell!10596)) (size!29521 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60357)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60359 0))(
  ( (array!60360 (arr!29043 (Array (_ BitVec 32) (_ BitVec 64))) (size!29522 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60359)

(assert (=> b!971659 (= res!650373 (and (= (size!29521 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29522 _keys!1717) (size!29521 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!971660 () Bool)

(declare-fun res!650376 () Bool)

(assert (=> b!971660 (=> (not res!650376) (not e!547728))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60359 (_ BitVec 32)) Bool)

(assert (=> b!971660 (= res!650376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun res!650372 () Bool)

(assert (=> start!83264 (=> (not res!650372) (not e!547728))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83264 (= res!650372 (validMask!0 mask!2147))))

(assert (=> start!83264 e!547728))

(assert (=> start!83264 true))

(declare-fun e!547726 () Bool)

(declare-fun array_inv!22473 (array!60357) Bool)

(assert (=> start!83264 (and (array_inv!22473 _values!1425) e!547726)))

(declare-fun tp_is_empty!22155 () Bool)

(assert (=> start!83264 tp_is_empty!22155))

(assert (=> start!83264 tp!67049))

(declare-fun array_inv!22474 (array!60359) Bool)

(assert (=> start!83264 (array_inv!22474 _keys!1717)))

(declare-fun b!971661 () Bool)

(declare-fun res!650371 () Bool)

(assert (=> b!971661 (=> (not res!650371) (not e!547728))))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!971661 (= res!650371 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29522 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29522 _keys!1717))))))

(declare-fun b!971662 () Bool)

(assert (=> b!971662 (= e!547728 false)))

(declare-datatypes ((tuple2!14264 0))(
  ( (tuple2!14265 (_1!7143 (_ BitVec 64)) (_2!7143 V!34523)) )
))
(declare-datatypes ((List!20130 0))(
  ( (Nil!20127) (Cons!20126 (h!21288 tuple2!14264) (t!28493 List!20130)) )
))
(declare-datatypes ((ListLongMap!12961 0))(
  ( (ListLongMap!12962 (toList!6496 List!20130)) )
))
(declare-fun lt!431855 () ListLongMap!12961)

(declare-fun zeroValue!1367 () V!34523)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34523)

(declare-fun getCurrentListMap!3729 (array!60359 array!60357 (_ BitVec 32) (_ BitVec 32) V!34523 V!34523 (_ BitVec 32) Int) ListLongMap!12961)

(assert (=> b!971662 (= lt!431855 (getCurrentListMap!3729 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!971663 () Bool)

(declare-fun res!650374 () Bool)

(assert (=> b!971663 (=> (not res!650374) (not e!547728))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!971663 (= res!650374 (validKeyInArray!0 (select (arr!29043 _keys!1717) i!822)))))

(declare-fun b!971664 () Bool)

(declare-fun e!547729 () Bool)

(assert (=> b!971664 (= e!547729 tp_is_empty!22155)))

(declare-fun b!971665 () Bool)

(declare-fun res!650375 () Bool)

(assert (=> b!971665 (=> (not res!650375) (not e!547728))))

(declare-fun contains!5596 (ListLongMap!12961 (_ BitVec 64)) Bool)

(assert (=> b!971665 (= res!650375 (contains!5596 (getCurrentListMap!3729 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29043 _keys!1717) i!822)))))

(declare-fun mapNonEmpty!35242 () Bool)

(declare-fun mapRes!35242 () Bool)

(declare-fun tp!67050 () Bool)

(declare-fun e!547727 () Bool)

(assert (=> mapNonEmpty!35242 (= mapRes!35242 (and tp!67050 e!547727))))

(declare-fun mapRest!35242 () (Array (_ BitVec 32) ValueCell!10596))

(declare-fun mapValue!35242 () ValueCell!10596)

(declare-fun mapKey!35242 () (_ BitVec 32))

(assert (=> mapNonEmpty!35242 (= (arr!29042 _values!1425) (store mapRest!35242 mapKey!35242 mapValue!35242))))

(declare-fun b!971666 () Bool)

(declare-fun res!650370 () Bool)

(assert (=> b!971666 (=> (not res!650370) (not e!547728))))

(declare-datatypes ((List!20131 0))(
  ( (Nil!20128) (Cons!20127 (h!21289 (_ BitVec 64)) (t!28494 List!20131)) )
))
(declare-fun arrayNoDuplicates!0 (array!60359 (_ BitVec 32) List!20131) Bool)

(assert (=> b!971666 (= res!650370 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20128))))

(declare-fun b!971667 () Bool)

(assert (=> b!971667 (= e!547726 (and e!547729 mapRes!35242))))

(declare-fun condMapEmpty!35242 () Bool)

(declare-fun mapDefault!35242 () ValueCell!10596)

(assert (=> b!971667 (= condMapEmpty!35242 (= (arr!29042 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10596)) mapDefault!35242)))))

(declare-fun b!971668 () Bool)

(assert (=> b!971668 (= e!547727 tp_is_empty!22155)))

(declare-fun mapIsEmpty!35242 () Bool)

(assert (=> mapIsEmpty!35242 mapRes!35242))

(assert (= (and start!83264 res!650372) b!971659))

(assert (= (and b!971659 res!650373) b!971660))

(assert (= (and b!971660 res!650376) b!971666))

(assert (= (and b!971666 res!650370) b!971661))

(assert (= (and b!971661 res!650371) b!971663))

(assert (= (and b!971663 res!650374) b!971665))

(assert (= (and b!971665 res!650375) b!971662))

(assert (= (and b!971667 condMapEmpty!35242) mapIsEmpty!35242))

(assert (= (and b!971667 (not condMapEmpty!35242)) mapNonEmpty!35242))

(get-info :version)

(assert (= (and mapNonEmpty!35242 ((_ is ValueCellFull!10596) mapValue!35242)) b!971668))

(assert (= (and b!971667 ((_ is ValueCellFull!10596) mapDefault!35242)) b!971664))

(assert (= start!83264 b!971667))

(declare-fun m!899057 () Bool)

(assert (=> b!971662 m!899057))

(declare-fun m!899059 () Bool)

(assert (=> b!971665 m!899059))

(declare-fun m!899061 () Bool)

(assert (=> b!971665 m!899061))

(assert (=> b!971665 m!899059))

(assert (=> b!971665 m!899061))

(declare-fun m!899063 () Bool)

(assert (=> b!971665 m!899063))

(assert (=> b!971663 m!899061))

(assert (=> b!971663 m!899061))

(declare-fun m!899065 () Bool)

(assert (=> b!971663 m!899065))

(declare-fun m!899067 () Bool)

(assert (=> mapNonEmpty!35242 m!899067))

(declare-fun m!899069 () Bool)

(assert (=> b!971666 m!899069))

(declare-fun m!899071 () Bool)

(assert (=> b!971660 m!899071))

(declare-fun m!899073 () Bool)

(assert (=> start!83264 m!899073))

(declare-fun m!899075 () Bool)

(assert (=> start!83264 m!899075))

(declare-fun m!899077 () Bool)

(assert (=> start!83264 m!899077))

(check-sat (not b_next!19257) b_and!30745 tp_is_empty!22155 (not mapNonEmpty!35242) (not b!971662) (not b!971663) (not b!971665) (not start!83264) (not b!971666) (not b!971660))
(check-sat b_and!30745 (not b_next!19257))
