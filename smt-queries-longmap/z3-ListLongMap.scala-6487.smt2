; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82764 () Bool)

(assert start!82764)

(declare-fun b_free!18897 () Bool)

(declare-fun b_next!18897 () Bool)

(assert (=> start!82764 (= b_free!18897 (not b_next!18897))))

(declare-fun tp!65811 () Bool)

(declare-fun b_and!30385 () Bool)

(assert (=> start!82764 (= tp!65811 b_and!30385)))

(declare-fun b!965354 () Bool)

(declare-fun res!646184 () Bool)

(declare-fun e!544196 () Bool)

(assert (=> b!965354 (=> (not res!646184) (not e!544196))))

(declare-datatypes ((array!59483 0))(
  ( (array!59484 (arr!28610 (Array (_ BitVec 32) (_ BitVec 64))) (size!29089 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59483)

(declare-datatypes ((List!19859 0))(
  ( (Nil!19856) (Cons!19855 (h!21017 (_ BitVec 64)) (t!28222 List!19859)) )
))
(declare-fun arrayNoDuplicates!0 (array!59483 (_ BitVec 32) List!19859) Bool)

(assert (=> b!965354 (= res!646184 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19856))))

(declare-fun b!965355 () Bool)

(declare-fun e!544194 () Bool)

(declare-fun tp_is_empty!21699 () Bool)

(assert (=> b!965355 (= e!544194 tp_is_empty!21699)))

(declare-fun mapIsEmpty!34543 () Bool)

(declare-fun mapRes!34543 () Bool)

(assert (=> mapIsEmpty!34543 mapRes!34543))

(declare-fun b!965356 () Bool)

(declare-fun res!646186 () Bool)

(assert (=> b!965356 (=> (not res!646186) (not e!544196))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(assert (=> b!965356 (= res!646186 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29089 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29089 _keys!1686))))))

(declare-fun b!965357 () Bool)

(declare-fun res!646183 () Bool)

(assert (=> b!965357 (=> (not res!646183) (not e!544196))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965357 (= res!646183 (validKeyInArray!0 (select (arr!28610 _keys!1686) i!803)))))

(declare-fun res!646182 () Bool)

(assert (=> start!82764 (=> (not res!646182) (not e!544196))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82764 (= res!646182 (validMask!0 mask!2110))))

(assert (=> start!82764 e!544196))

(assert (=> start!82764 true))

(declare-datatypes ((V!33915 0))(
  ( (V!33916 (val!10900 Int)) )
))
(declare-datatypes ((ValueCell!10368 0))(
  ( (ValueCellFull!10368 (v!13458 V!33915)) (EmptyCell!10368) )
))
(declare-datatypes ((array!59485 0))(
  ( (array!59486 (arr!28611 (Array (_ BitVec 32) ValueCell!10368)) (size!29090 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59485)

(declare-fun e!544192 () Bool)

(declare-fun array_inv!22157 (array!59485) Bool)

(assert (=> start!82764 (and (array_inv!22157 _values!1400) e!544192)))

(declare-fun array_inv!22158 (array!59483) Bool)

(assert (=> start!82764 (array_inv!22158 _keys!1686)))

(assert (=> start!82764 tp!65811))

(assert (=> start!82764 tp_is_empty!21699))

(declare-fun b!965358 () Bool)

(declare-fun res!646185 () Bool)

(assert (=> b!965358 (=> (not res!646185) (not e!544196))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59483 (_ BitVec 32)) Bool)

(assert (=> b!965358 (= res!646185 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!965359 () Bool)

(declare-fun res!646181 () Bool)

(assert (=> b!965359 (=> (not res!646181) (not e!544196))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!965359 (= res!646181 (and (= (size!29090 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29089 _keys!1686) (size!29090 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!34543 () Bool)

(declare-fun tp!65810 () Bool)

(assert (=> mapNonEmpty!34543 (= mapRes!34543 (and tp!65810 e!544194))))

(declare-fun mapRest!34543 () (Array (_ BitVec 32) ValueCell!10368))

(declare-fun mapKey!34543 () (_ BitVec 32))

(declare-fun mapValue!34543 () ValueCell!10368)

(assert (=> mapNonEmpty!34543 (= (arr!28611 _values!1400) (store mapRest!34543 mapKey!34543 mapValue!34543))))

(declare-fun b!965360 () Bool)

(declare-fun e!544195 () Bool)

(assert (=> b!965360 (= e!544192 (and e!544195 mapRes!34543))))

(declare-fun condMapEmpty!34543 () Bool)

(declare-fun mapDefault!34543 () ValueCell!10368)

(assert (=> b!965360 (= condMapEmpty!34543 (= (arr!28611 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10368)) mapDefault!34543)))))

(declare-fun b!965361 () Bool)

(assert (=> b!965361 (= e!544195 tp_is_empty!21699)))

(declare-fun b!965362 () Bool)

(assert (=> b!965362 (= e!544196 false)))

(declare-fun minValue!1342 () V!33915)

(declare-fun defaultEntry!1403 () Int)

(declare-fun lt!431230 () Bool)

(declare-fun zeroValue!1342 () V!33915)

(declare-datatypes ((tuple2!14016 0))(
  ( (tuple2!14017 (_1!7019 (_ BitVec 64)) (_2!7019 V!33915)) )
))
(declare-datatypes ((List!19860 0))(
  ( (Nil!19857) (Cons!19856 (h!21018 tuple2!14016) (t!28223 List!19860)) )
))
(declare-datatypes ((ListLongMap!12713 0))(
  ( (ListLongMap!12714 (toList!6372 List!19860)) )
))
(declare-fun contains!5475 (ListLongMap!12713 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3605 (array!59483 array!59485 (_ BitVec 32) (_ BitVec 32) V!33915 V!33915 (_ BitVec 32) Int) ListLongMap!12713)

(assert (=> b!965362 (= lt!431230 (contains!5475 (getCurrentListMap!3605 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28610 _keys!1686) i!803)))))

(assert (= (and start!82764 res!646182) b!965359))

(assert (= (and b!965359 res!646181) b!965358))

(assert (= (and b!965358 res!646185) b!965354))

(assert (= (and b!965354 res!646184) b!965356))

(assert (= (and b!965356 res!646186) b!965357))

(assert (= (and b!965357 res!646183) b!965362))

(assert (= (and b!965360 condMapEmpty!34543) mapIsEmpty!34543))

(assert (= (and b!965360 (not condMapEmpty!34543)) mapNonEmpty!34543))

(get-info :version)

(assert (= (and mapNonEmpty!34543 ((_ is ValueCellFull!10368) mapValue!34543)) b!965355))

(assert (= (and b!965360 ((_ is ValueCellFull!10368) mapDefault!34543)) b!965361))

(assert (= start!82764 b!965360))

(declare-fun m!894449 () Bool)

(assert (=> b!965357 m!894449))

(assert (=> b!965357 m!894449))

(declare-fun m!894451 () Bool)

(assert (=> b!965357 m!894451))

(declare-fun m!894453 () Bool)

(assert (=> mapNonEmpty!34543 m!894453))

(declare-fun m!894455 () Bool)

(assert (=> b!965354 m!894455))

(declare-fun m!894457 () Bool)

(assert (=> b!965362 m!894457))

(assert (=> b!965362 m!894449))

(assert (=> b!965362 m!894457))

(assert (=> b!965362 m!894449))

(declare-fun m!894459 () Bool)

(assert (=> b!965362 m!894459))

(declare-fun m!894461 () Bool)

(assert (=> start!82764 m!894461))

(declare-fun m!894463 () Bool)

(assert (=> start!82764 m!894463))

(declare-fun m!894465 () Bool)

(assert (=> start!82764 m!894465))

(declare-fun m!894467 () Bool)

(assert (=> b!965358 m!894467))

(check-sat (not b!965357) (not mapNonEmpty!34543) (not b!965362) (not b_next!18897) tp_is_empty!21699 (not b!965358) (not start!82764) (not b!965354) b_and!30385)
(check-sat b_and!30385 (not b_next!18897))
