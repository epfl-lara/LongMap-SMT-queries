; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83304 () Bool)

(assert start!83304)

(declare-fun b_free!19129 () Bool)

(declare-fun b_next!19129 () Bool)

(assert (=> start!83304 (= b_free!19129 (not b_next!19129))))

(declare-fun tp!66666 () Bool)

(declare-fun b_and!30627 () Bool)

(assert (=> start!83304 (= tp!66666 b_and!30627)))

(declare-fun b!970739 () Bool)

(declare-fun res!649470 () Bool)

(declare-fun e!547347 () Bool)

(assert (=> b!970739 (=> (not res!649470) (not e!547347))))

(declare-datatypes ((array!60134 0))(
  ( (array!60135 (arr!28926 (Array (_ BitVec 32) (_ BitVec 64))) (size!29406 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60134)

(declare-datatypes ((List!20030 0))(
  ( (Nil!20027) (Cons!20026 (h!21194 (_ BitVec 64)) (t!28385 List!20030)) )
))
(declare-fun arrayNoDuplicates!0 (array!60134 (_ BitVec 32) List!20030) Bool)

(assert (=> b!970739 (= res!649470 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20027))))

(declare-fun res!649468 () Bool)

(assert (=> start!83304 (=> (not res!649468) (not e!547347))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83304 (= res!649468 (validMask!0 mask!2147))))

(assert (=> start!83304 e!547347))

(assert (=> start!83304 true))

(declare-datatypes ((V!34353 0))(
  ( (V!34354 (val!11064 Int)) )
))
(declare-datatypes ((ValueCell!10532 0))(
  ( (ValueCellFull!10532 (v!13620 V!34353)) (EmptyCell!10532) )
))
(declare-datatypes ((array!60136 0))(
  ( (array!60137 (arr!28927 (Array (_ BitVec 32) ValueCell!10532)) (size!29407 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60136)

(declare-fun e!547349 () Bool)

(declare-fun array_inv!22441 (array!60136) Bool)

(assert (=> start!83304 (and (array_inv!22441 _values!1425) e!547349)))

(declare-fun tp_is_empty!22027 () Bool)

(assert (=> start!83304 tp_is_empty!22027))

(assert (=> start!83304 tp!66666))

(declare-fun array_inv!22442 (array!60134) Bool)

(assert (=> start!83304 (array_inv!22442 _keys!1717)))

(declare-fun mapNonEmpty!35050 () Bool)

(declare-fun mapRes!35050 () Bool)

(declare-fun tp!66667 () Bool)

(declare-fun e!547348 () Bool)

(assert (=> mapNonEmpty!35050 (= mapRes!35050 (and tp!66667 e!547348))))

(declare-fun mapRest!35050 () (Array (_ BitVec 32) ValueCell!10532))

(declare-fun mapValue!35050 () ValueCell!10532)

(declare-fun mapKey!35050 () (_ BitVec 32))

(assert (=> mapNonEmpty!35050 (= (arr!28927 _values!1425) (store mapRest!35050 mapKey!35050 mapValue!35050))))

(declare-fun b!970740 () Bool)

(declare-fun res!649467 () Bool)

(assert (=> b!970740 (=> (not res!649467) (not e!547347))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!970740 (= res!649467 (validKeyInArray!0 (select (arr!28926 _keys!1717) i!822)))))

(declare-fun b!970741 () Bool)

(assert (=> b!970741 (= e!547347 false)))

(declare-fun zeroValue!1367 () V!34353)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun minValue!1367 () V!34353)

(declare-fun lt!432042 () Bool)

(declare-datatypes ((tuple2!14170 0))(
  ( (tuple2!14171 (_1!7096 (_ BitVec 64)) (_2!7096 V!34353)) )
))
(declare-datatypes ((List!20031 0))(
  ( (Nil!20028) (Cons!20027 (h!21195 tuple2!14170) (t!28386 List!20031)) )
))
(declare-datatypes ((ListLongMap!12869 0))(
  ( (ListLongMap!12870 (toList!6450 List!20031)) )
))
(declare-fun contains!5565 (ListLongMap!12869 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3683 (array!60134 array!60136 (_ BitVec 32) (_ BitVec 32) V!34353 V!34353 (_ BitVec 32) Int) ListLongMap!12869)

(assert (=> b!970741 (= lt!432042 (contains!5565 (getCurrentListMap!3683 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28926 _keys!1717) i!822)))))

(declare-fun b!970742 () Bool)

(declare-fun res!649471 () Bool)

(assert (=> b!970742 (=> (not res!649471) (not e!547347))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60134 (_ BitVec 32)) Bool)

(assert (=> b!970742 (= res!649471 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!970743 () Bool)

(declare-fun e!547350 () Bool)

(assert (=> b!970743 (= e!547349 (and e!547350 mapRes!35050))))

(declare-fun condMapEmpty!35050 () Bool)

(declare-fun mapDefault!35050 () ValueCell!10532)

(assert (=> b!970743 (= condMapEmpty!35050 (= (arr!28927 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10532)) mapDefault!35050)))))

(declare-fun b!970744 () Bool)

(declare-fun res!649469 () Bool)

(assert (=> b!970744 (=> (not res!649469) (not e!547347))))

(assert (=> b!970744 (= res!649469 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29406 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29406 _keys!1717))))))

(declare-fun b!970745 () Bool)

(assert (=> b!970745 (= e!547350 tp_is_empty!22027)))

(declare-fun b!970746 () Bool)

(declare-fun res!649472 () Bool)

(assert (=> b!970746 (=> (not res!649472) (not e!547347))))

(assert (=> b!970746 (= res!649472 (and (= (size!29407 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29406 _keys!1717) (size!29407 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!970747 () Bool)

(assert (=> b!970747 (= e!547348 tp_is_empty!22027)))

(declare-fun mapIsEmpty!35050 () Bool)

(assert (=> mapIsEmpty!35050 mapRes!35050))

(assert (= (and start!83304 res!649468) b!970746))

(assert (= (and b!970746 res!649472) b!970742))

(assert (= (and b!970742 res!649471) b!970739))

(assert (= (and b!970739 res!649470) b!970744))

(assert (= (and b!970744 res!649469) b!970740))

(assert (= (and b!970740 res!649467) b!970741))

(assert (= (and b!970743 condMapEmpty!35050) mapIsEmpty!35050))

(assert (= (and b!970743 (not condMapEmpty!35050)) mapNonEmpty!35050))

(get-info :version)

(assert (= (and mapNonEmpty!35050 ((_ is ValueCellFull!10532) mapValue!35050)) b!970747))

(assert (= (and b!970743 ((_ is ValueCellFull!10532) mapDefault!35050)) b!970745))

(assert (= start!83304 b!970743))

(declare-fun m!899021 () Bool)

(assert (=> start!83304 m!899021))

(declare-fun m!899023 () Bool)

(assert (=> start!83304 m!899023))

(declare-fun m!899025 () Bool)

(assert (=> start!83304 m!899025))

(declare-fun m!899027 () Bool)

(assert (=> b!970740 m!899027))

(assert (=> b!970740 m!899027))

(declare-fun m!899029 () Bool)

(assert (=> b!970740 m!899029))

(declare-fun m!899031 () Bool)

(assert (=> b!970741 m!899031))

(assert (=> b!970741 m!899027))

(assert (=> b!970741 m!899031))

(assert (=> b!970741 m!899027))

(declare-fun m!899033 () Bool)

(assert (=> b!970741 m!899033))

(declare-fun m!899035 () Bool)

(assert (=> mapNonEmpty!35050 m!899035))

(declare-fun m!899037 () Bool)

(assert (=> b!970742 m!899037))

(declare-fun m!899039 () Bool)

(assert (=> b!970739 m!899039))

(check-sat (not start!83304) tp_is_empty!22027 (not mapNonEmpty!35050) (not b_next!19129) (not b!970741) b_and!30627 (not b!970742) (not b!970740) (not b!970739))
(check-sat b_and!30627 (not b_next!19129))
