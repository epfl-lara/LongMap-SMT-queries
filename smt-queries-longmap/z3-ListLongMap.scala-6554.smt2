; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83190 () Bool)

(assert start!83190)

(declare-fun b_free!19201 () Bool)

(declare-fun b_next!19201 () Bool)

(assert (=> start!83190 (= b_free!19201 (not b_next!19201))))

(declare-fun tp!66883 () Bool)

(declare-fun b_and!30663 () Bool)

(assert (=> start!83190 (= tp!66883 b_and!30663)))

(declare-fun b!970580 () Bool)

(declare-fun res!649676 () Bool)

(declare-fun e!547159 () Bool)

(assert (=> b!970580 (=> (not res!649676) (not e!547159))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34449 0))(
  ( (V!34450 (val!11100 Int)) )
))
(declare-datatypes ((ValueCell!10568 0))(
  ( (ValueCellFull!10568 (v!13658 V!34449)) (EmptyCell!10568) )
))
(declare-datatypes ((array!60186 0))(
  ( (array!60187 (arr!28957 (Array (_ BitVec 32) ValueCell!10568)) (size!29438 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60186)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60188 0))(
  ( (array!60189 (arr!28958 (Array (_ BitVec 32) (_ BitVec 64))) (size!29439 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60188)

(assert (=> b!970580 (= res!649676 (and (= (size!29438 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29439 _keys!1717) (size!29438 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!35158 () Bool)

(declare-fun mapRes!35158 () Bool)

(assert (=> mapIsEmpty!35158 mapRes!35158))

(declare-fun b!970581 () Bool)

(declare-fun e!547161 () Bool)

(declare-fun e!547158 () Bool)

(assert (=> b!970581 (= e!547161 (and e!547158 mapRes!35158))))

(declare-fun condMapEmpty!35158 () Bool)

(declare-fun mapDefault!35158 () ValueCell!10568)

(assert (=> b!970581 (= condMapEmpty!35158 (= (arr!28957 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10568)) mapDefault!35158)))))

(declare-fun b!970582 () Bool)

(declare-fun res!649678 () Bool)

(assert (=> b!970582 (=> (not res!649678) (not e!547159))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!970582 (= res!649678 (validKeyInArray!0 (select (arr!28958 _keys!1717) i!822)))))

(declare-fun b!970583 () Bool)

(declare-fun res!649674 () Bool)

(assert (=> b!970583 (=> (not res!649674) (not e!547159))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60188 (_ BitVec 32)) Bool)

(assert (=> b!970583 (= res!649674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!970584 () Bool)

(declare-fun res!649673 () Bool)

(assert (=> b!970584 (=> (not res!649673) (not e!547159))))

(declare-datatypes ((List!20126 0))(
  ( (Nil!20123) (Cons!20122 (h!21284 (_ BitVec 64)) (t!28480 List!20126)) )
))
(declare-fun arrayNoDuplicates!0 (array!60188 (_ BitVec 32) List!20126) Bool)

(assert (=> b!970584 (= res!649673 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20123))))

(declare-fun b!970585 () Bool)

(declare-fun res!649677 () Bool)

(assert (=> b!970585 (=> (not res!649677) (not e!547159))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!970585 (= res!649677 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29439 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29439 _keys!1717))))))

(declare-fun mapNonEmpty!35158 () Bool)

(declare-fun tp!66882 () Bool)

(declare-fun e!547157 () Bool)

(assert (=> mapNonEmpty!35158 (= mapRes!35158 (and tp!66882 e!547157))))

(declare-fun mapValue!35158 () ValueCell!10568)

(declare-fun mapKey!35158 () (_ BitVec 32))

(declare-fun mapRest!35158 () (Array (_ BitVec 32) ValueCell!10568))

(assert (=> mapNonEmpty!35158 (= (arr!28957 _values!1425) (store mapRest!35158 mapKey!35158 mapValue!35158))))

(declare-fun res!649675 () Bool)

(assert (=> start!83190 (=> (not res!649675) (not e!547159))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83190 (= res!649675 (validMask!0 mask!2147))))

(assert (=> start!83190 e!547159))

(assert (=> start!83190 true))

(declare-fun array_inv!22475 (array!60186) Bool)

(assert (=> start!83190 (and (array_inv!22475 _values!1425) e!547161)))

(declare-fun tp_is_empty!22099 () Bool)

(assert (=> start!83190 tp_is_empty!22099))

(assert (=> start!83190 tp!66883))

(declare-fun array_inv!22476 (array!60188) Bool)

(assert (=> start!83190 (array_inv!22476 _keys!1717)))

(declare-fun b!970586 () Bool)

(assert (=> b!970586 (= e!547158 tp_is_empty!22099)))

(declare-fun b!970587 () Bool)

(declare-fun res!649672 () Bool)

(assert (=> b!970587 (=> (not res!649672) (not e!547159))))

(declare-fun zeroValue!1367 () V!34449)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34449)

(declare-datatypes ((tuple2!14306 0))(
  ( (tuple2!14307 (_1!7164 (_ BitVec 64)) (_2!7164 V!34449)) )
))
(declare-datatypes ((List!20127 0))(
  ( (Nil!20124) (Cons!20123 (h!21285 tuple2!14306) (t!28481 List!20127)) )
))
(declare-datatypes ((ListLongMap!12993 0))(
  ( (ListLongMap!12994 (toList!6512 List!20127)) )
))
(declare-fun contains!5560 (ListLongMap!12993 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3674 (array!60188 array!60186 (_ BitVec 32) (_ BitVec 32) V!34449 V!34449 (_ BitVec 32) Int) ListLongMap!12993)

(assert (=> b!970587 (= res!649672 (contains!5560 (getCurrentListMap!3674 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28958 _keys!1717) i!822)))))

(declare-fun b!970588 () Bool)

(assert (=> b!970588 (= e!547157 tp_is_empty!22099)))

(declare-fun b!970589 () Bool)

(assert (=> b!970589 (= e!547159 (bvsgt (bvsub from!2118 #b00000000000000000000000000000001) (size!29439 _keys!1717)))))

(assert (= (and start!83190 res!649675) b!970580))

(assert (= (and b!970580 res!649676) b!970583))

(assert (= (and b!970583 res!649674) b!970584))

(assert (= (and b!970584 res!649673) b!970585))

(assert (= (and b!970585 res!649677) b!970582))

(assert (= (and b!970582 res!649678) b!970587))

(assert (= (and b!970587 res!649672) b!970589))

(assert (= (and b!970581 condMapEmpty!35158) mapIsEmpty!35158))

(assert (= (and b!970581 (not condMapEmpty!35158)) mapNonEmpty!35158))

(get-info :version)

(assert (= (and mapNonEmpty!35158 ((_ is ValueCellFull!10568) mapValue!35158)) b!970588))

(assert (= (and b!970581 ((_ is ValueCellFull!10568) mapDefault!35158)) b!970586))

(assert (= start!83190 b!970581))

(declare-fun m!897689 () Bool)

(assert (=> b!970583 m!897689))

(declare-fun m!897691 () Bool)

(assert (=> mapNonEmpty!35158 m!897691))

(declare-fun m!897693 () Bool)

(assert (=> b!970587 m!897693))

(declare-fun m!897695 () Bool)

(assert (=> b!970587 m!897695))

(assert (=> b!970587 m!897693))

(assert (=> b!970587 m!897695))

(declare-fun m!897697 () Bool)

(assert (=> b!970587 m!897697))

(assert (=> b!970582 m!897695))

(assert (=> b!970582 m!897695))

(declare-fun m!897699 () Bool)

(assert (=> b!970582 m!897699))

(declare-fun m!897701 () Bool)

(assert (=> start!83190 m!897701))

(declare-fun m!897703 () Bool)

(assert (=> start!83190 m!897703))

(declare-fun m!897705 () Bool)

(assert (=> start!83190 m!897705))

(declare-fun m!897707 () Bool)

(assert (=> b!970584 m!897707))

(check-sat (not b!970584) (not b!970583) (not mapNonEmpty!35158) b_and!30663 tp_is_empty!22099 (not b!970587) (not b_next!19201) (not b!970582) (not start!83190))
(check-sat b_and!30663 (not b_next!19201))
